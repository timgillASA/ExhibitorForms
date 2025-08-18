            </div> <!-- End col-xs-12 -->
        </div> <!-- End row -->
    </div> <!-- End container -->

    <a id="top" href="#pagetop">&uarr;</a>
    <div class="footer-wrapper">
        <div class="container footer">
            <div class="row">
                <div class="col-xs-12">
                    <div class="row">
                        <div class="col-xs-12 col-sm-8 col-md-8">
                            <a style="text-decoration:none;" href="//www.amstat.org"><h4>American Statistical Association</h4></a>
                            <p>
                                732 North Washington Street<br />
                                Alexandria, VA 22314<br />
                                (703) 684-1221<br />
                                <a href="mailto:meetings@amstat.org">meetings@amstat.org</a>
                            </p>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <h4>Follow</h4>
                            <p>
                                <a href="https://facebook.com/AmstatNews"><img class="footericons" src="../images/facebook-icon.png" alt="Facebook" /></a>
                                <a href="https://www.linkedin.com/company/american-statistical-association---asa/"><img class="footericons" src="../images/linkedin-icon.png" alt="LinkedIn"/></a>
                                <a href="https://www.instagram.com/amstatnews/"><img class="footericons" src="../images/instagram-icon.png" alt="Instagram" /></a>
                                <a href="https://bsky.app/profile/amstatnews.bsky.social"><img class="footericons" src="../images/bluesky-icon.png" alt="Bluesky" /></a>
                                <a href="https://community.amstat.org/home"><img class="footericons" src="../images/asacommunity-icon.png" alt="ASA Community" /></a>
                            </p>
                        </div>
                    </div>

                    <div class="row" id="footerbot">
                        <div class="col-xs-12 col-sm-12 col-md-8 subfooter">
                            <p>
                                <a href="//www.amstat.org/asa-copyright-information">Copyright</a> &copy; <cfoutput>#Year(Now())#</cfoutput> American Statistical Association
                            </p>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-4 subfooter">
                            <p style="letter-spacing:-.05em;">
                                <a href="//www.amstat.org/privacy-statement" class="footlink">Privacy Policy</a> |
                                <a href="//www.amstat.org/meetings/code-of-conduct" class="footlink">Code of Conduct</a>
                                <cfif isDefined("url.ShowErrors") AND url.ShowErrors EQ "true">
                                    | <a href="?resetApp=true" class="footlink">Reset Application</a>
                                </cfif>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>
    if ($('#top').length) {
        var scrollTrigger = 100, // px
            backToTop = function () {
                var scrollTop = $(window).scrollTop();
                if (scrollTop > scrollTrigger) {
                    $('#top').addClass('show');
                } else {
                    $('#top').removeClass('show');
                }
            };
        backToTop();
        $(window).on('scroll', function () {
            backToTop();
        });
        $('#top').on('click', function (e) {
            e.preventDefault();
            $('html,body').animate({
                scrollTop: 0
            }, 200);
        });
    }
</script>

</body>
</html>
