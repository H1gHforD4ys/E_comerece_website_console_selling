<script>
    function AddCart(id) {
        $.ajax({
            url: '/Add-Cart/' + id, //Địa chỉ route
            type: 'GET',
        }).done(function(response) {
            if (response == 'Không đủ số lượng sản phẩm') {
                alertify.error('Không đủ số lượng sản phẩm trong kho');
            } else {
                $("#change-item-cart").empty(); //Xóa nội dung hiện tại của phần tử có id là
                $("#change-item-cart").html(response); //Chèn nội dung phản hồi từ server vào phần tử có id là "change-item-cart"
                alertify.success('Thêm sản phẩm thành công');
            }
        });
    }
    $("#change-item-cart").on("click", ".del-icon i", function() {
        var productId = $(this).data("id");
        //console.log(productId);
        $.ajax({
            url: '/Delete-Item-Cart/' + productId, //Địa chỉ route
            type: 'GET',
        }).done(function(response) {
            //console.log(response);
            $("#change-item-cart").empty(); //Xóa nội dung hiện tại của phần tử có id là change-item-cart
            $("#change-item-cart").html(response); //Chèn nội dung phản hồi từ server vào phần tử có id là "change-item-cart"
            alertify.success('Đã xóa sản phẩm thành công');
        });
    });

    function DeleteItemListCart(id) {
        $.ajax({
            url: '/Delete-Item-List-Cart/' + id, //Địa chỉ route
            type: 'GET',
        }).done(function(response) {
            //console.log(response);
            CartListRender(response);
            alertify.success('Đã xóa thành công');
            reloadHeaderCart();
        });
    }

    function SaveItemListCart(element) {
        const productId = element.querySelector('.cart-plus-minus-box').getAttribute('data-id');
        const productQuanity = element.querySelector('.cart-plus-minus-box').value;
        $.ajax({
            url: '/Save-Item-List-Cart/' + productId + '/' + productQuanity,
            type: 'GET',
        }).done(function(response) {
            if (response.thongbao == "Không đủ số lượng") {
                document.getElementById('quanity-item-'+productId).value = response.soluong;
                alertify.error('Không đủ số lượng trong kho')
                CartListRender(response.view);
                reloadHeaderCart();
            } else {
                CartListRender(response.view);
                alertify.success('Đã cập nhật thành công');
                reloadHeaderCart();
            }
        });
    }

    function reloadHeaderCart() {
        const url = '/save-header-cart-item'; // lấy giá trị trả về từ route
        $("#change-item-cart").load(url); // load lại thẻ
    }

    function CartListRender(response) {
        //console.log(response);
        $("#shopping-cart").empty(); //Xóa nội dung hiện tại của phần tử có id là
        $("#shopping-cart").html(response); //Chèn nội dung phản hồi từ server vào phần tử có id là "change-item-cart"

        $(".cart-plus-minus").prepend('<div class="dec qtybutton"><a href="#?">-</a></div>');
        $(".cart-plus-minus").append('<div class="inc qtybutton"><a href="#?">+</a></div>');
        $(".qtybutton").on("click", function() {
            var $button = $(this);
            var oldValue = $button.parent().find("input").val();
            if ($button.text() == "+") {
                var newVal = parseFloat(oldValue) + 1;
            } else {
                // Don't allow decrementing below 1
                if (oldValue > 1) {
                    var newVal = parseFloat(oldValue) - 1;
                } else {
                    newVal = 1;
                }
            }
            $button.parent().find("input").val(newVal);
        });
    }

    function AddWishlist(id) {
        $.ajax({
            url: '/Add-Wishlist/' + id, //Địa chỉ route
            type: 'GET',
        }).done(function(response) {
            //console.log(response);
            $("#change-wishlist-count").empty(); //Xóa nội dung hiện tại của phần tử có id là
            $("#change-wishlist-count").html(response); //Chèn nội dung phản hồi từ server vào phần tử có id là "change-item-cart"
            // alertify.success('Thêm sản phẩm vào wishlist thành công');
        });
    }

    function DeleteItemWishlist(id) {
        $.ajax({
            url: '/Delete-Item-Wishlist/' + id, //Địa chỉ route
            type: 'GET',
        }).done(function(response) {
            //console.log(response);
            $("#change-wishlist-item").empty(); //Xóa nội dung hiện tại của phần tử có id là
            $("#change-wishlist-item").html(response);
            alertify.success('Đã xóa thành công');
            reloadHeaderWishlist();
        });
    }

    function reloadHeaderWishlist() {
        const url = '/save-header-wishlist-item'; // lấy giá trị trả về từ route
        $("#change-wishlist-count").load(url); // load lại giá trị url
    }

    function Quickview(id) {
        $.ajax({
            url: '/quickview/' + id, //Địa chỉ route
            type: 'GET',
        }).done(function(response) {
            //console.log(response);
            $("#change-quickview-wrapper").empty(); //Xóa nội dung hiện tại của phần tử có id là
            $("#change-quickview-wrapper").html(response);
            //alertify.success('Đã xóa thành công');
            //console.log(id);
        });
    }

    function AddCartWithQuanity(id) {
        var productQuanity = document.getElementById('quanity-item-single-product').value;
        $.ajax({
            url: '/Add-Cart-Single-Product/' + id + '/' + productQuanity,
            type: 'GET',
        }).done(function(response) {
            //console.log(response);
            if (response == 'Không đủ số lượng') {
                alertify.error('Không đủ số lượng hàng trong kho');
            } else {
                $("#change-item-cart").empty(); //Xóa nội dung hiện tại của phần tử có id là
                $("#change-item-cart").html(response); //Chèn nội dung phản hồi từ server vào phần tử có id là "change-item-cart"
                if (productQuanity == 0) {
                    alertify.error('Số lượng không thể bằng 0');
                } else {
                    alertify.success('Thêm sản phẩm vào giỏ hàng thành công ');
                }
            }
        });
    }

    function choosePaymentType(type) {
        $.ajax({
            url: '/choose-payment-method/' + type,
            type: 'GET',
            dataType: 'json',
        }).done(function(response) {
            $("#payment-type-change").empty();
            $("#payment-type-change").html(response);
            const url = '/form-checkout/' + type;

            $.ajax({
                url: url,
                type: 'GET',
                dataType: 'json',
            }).done(function(response1) {
                const urlReturn = response1.url; // json trả về giá trị url lấy từ controller form_checkout_change
                $("#checkout-form-change").attr("action",urlReturn); // thay đổi giá trị của action trong thẻ form trong trang checkout
                //console.log(response1);
            });
        });
    }

    function addCartFromQuickView(id) {
        var productQuanity = document.getElementById('french-hens').value;
        console.log(productQuanity);
            $.ajax({
                url: '/Add-Cart-Single-Product/' + id + '/' + productQuanity,
                type: 'GET',
            }).done(function(response) {
                //console.log(response);
                if(response == 'Không đủ số lượng')
                {
                    alertify.error('Không đủ số lượng trong kho');
                }
                else{
                    alertify.success('Thêm sản phẩm vào giỏ hàng thành công ');
                }
                reloadHeaderCart();
            });

    }
    $(document).ready(function() {
        $('#search').on('keyup', function() {
            var query = $(this).val();
            $.ajax({
                url: "/searching",
                type: "GET",
                data: {
                    'search': query,
                },
                success: function(data) {
                    $("#search-ajax-result").empty();
                    $('#search-ajax-result').html(data);
                    //console.log(data);
                }
            });
        });
    });

    function LoginRequest() {
        alertify.error('Vui lòng đăng nhập để sử dụng tính năng này');
    }
    function comment(idkhachhang, idsanpham){
        var comment = document.getElementById('comment-text').value;
        console.log('id khách hàng là: '+idkhachhang +',id sản phẩm là: '+idsanpham+',Nội dung comment:'+ comment);
        $.ajax({
                url: '/comment/' + idkhachhang + '/' + idsanpham + '/' + comment,
                type: 'GET',
            }).done(function(response) {
                //console.log(response);
                alertify.success('Bình luận thành công');
                $("#comment-page").empty();
                $('#comment-page').html(response);
            });
    }

</script>
