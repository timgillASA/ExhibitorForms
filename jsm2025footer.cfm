<cfif listLast(cgi.script_name,"/\") is "index.cfm">
<div class="emailsignup-wrapper">
    <div class="container emailsignup">
        <div class="row">
            <div class="col-xs-12 col-sm-8">
                <p class="emailsignup-head">Want to stay up to date on JSM news?</p>
            </div>
            <div class="col-xs-12 col-sm-4 center">
                <a href="https://amstat-ms.informz.net/AMSTAT-MS/pages/JSM2025" class="emailsignup-btn button-signmeup">Sign me up!</a>
            </div>
        </div>
    </div>
</div>
</cfif> 
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
                            <a href="https://facebook.com/AmstatNews"><img class="footericons" src="images/facebook-icon.png" alt="Facebook" /></a> <!---<a href="https://twitter.com/AmstatNews"><img class="footericons" src="images/twitter2-icon.png" /></a> ---><a href="https://www.linkedin.com/company/american-statistical-association---asa/"><img class="footericons" src="images/linkedin-icon.png" alt="LinkedIn"/></a> <a href="https://www.instagram.com/amstatnews/"><img class="footericons" src="images/instagram-icon.png" alt="Instagram" /></a> <a href="https://bsky.app/profile/amstatnews.bsky.social"><img class="footericons" src="images/bluesky-icon.png" alt="Bluesky" /></a> <a href="https://community.amstat.org/home"><img class="footericons" src="images/asacommunity-icon.png" alt="ASA Community" /></a> 
                        </p>     
                    </div>
                </div>

                <div class="row" id="footerbot">
                    <div class="col-xs-12 col-sm-12 col-md-8 subfooter">
                        <p>
                            <a href="//www.amstat.org/asa-copyright-information">Copyright</a> &copy; American Statistical Association
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4 subfooter">
                        <p style="letter-spacing:-.05em;">
                            <cfif now() GTE "01/23/25"><a href="meetingrequests.cfm" class="footlink">Meetings, Receptions, and Other JSM Event Submissions</a><br /></cfif>
                            <a href="//www.amstat.org/ASA/JSM-Press.aspx" class="footlink">Press/Media</a> | <a href="//www.amstat.org/privacy-statement" class="footlink">Privacy Policy</a> | <a href="//www.amstat.org/meetings/code-of-conduct" class="footlink">Code of Conduct</a> | <a href="//www.amstat.org/meetings/joint-statistical-meetings" class="footlink">Previous</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<cfif listLast(cgi.script_name,"/\") is "beontheprogram.cfm" or listLast(cgi.script_name,"/\") is "submissions.cfm" or listLast(cgi.script_name,"/\") is "sponsor.cfm" or listLast(cgi.script_name,"/\") is "moretodo.cfm">
    <script src="js/jquery.accordion.js?v=2025" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery.observehashchange.js?v=2025"></script>
    <script type="text/javascript">    
        jQuery(document).ready(function(){

            //accordion
            jQuery('.accordion').accordion({
                speed:'fast'
                ,defaultOpen:window.location.hash != '' ? window.location.hash.substring(1) : ''
            });   
        });

        jQuery(window).hashchange(function() {
            jQuery('.accordion').accordion({
                speed:'fast'
                ,defaultOpen:window.location.hash != '' ? window.location.hash.substring(1) : ''
            });   
        });
    </script>

    <script>
        window.onload = function() {if(location.hash){
            var elId = location.hash.replace('#','');
            var scrollToEl = document.getElementById(elId);
            scrollToEl.scrollIntoView(true);   
        }
                                   }
    </script>
</cfif>
<cfif listLast(cgi.script_name,"/\") is "localinformation.cfm">
    <script src="/js/responsiveslides.min.js"></script>
    <script>
        $(function() {
            $(".rslides").responsiveSlides({
                speed:500,
                pager:true,
                random:true,
                pause:true,
                prevText:"Previous",
                nextText:"Next"
            });
        });

    </script>
</cfif>
<!---<script src="js/jquery.bxslider.min.js"></script>--->
<script src="//cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>

<script>
    $(document).ready(function(){
        $(".bxslider").show().bxSlider({
            minSlides:1,
            maxSlides:1,	
            slideMargin:25,
            easing:'ease-in',
            preloadImages: 'all',
            pager:false
        });
    });

    if ($('#top').length) {
        var scrollTrigger = 100,// px
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

<!---
<script async src="https://www.googletagmanager.com/gtag/js?id=G-YE2BS4275V"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'G-YE2BS4275V',{cookie_flags: 'SameSite=None;Secure'});
</script>

<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-667618-1', 'auto', {'cookieFlags': 'SameSite=None; Secure'});
    ga('send', 'pageview');

</script>
--->
<script>
	//-------------------------------------------------------
	var z_account = "29067E97-3729-4179-BECC-E9A37F3BE69E";
	var z_collector = "AMSTAT-MS.informz.net";
	var z_cookieDomain = ".amstat.org";
	//-------------------------------------------------------
	(function (e, o, n, r, t, a, s) { e[t] || (e.GlobalSnowplowNamespace = e.GlobalSnowplowNamespace || [], e.GlobalSnowplowNamespace.push(t), e[t] = function () { (e[t].q = e[t].q || []).push(arguments) }, e[t].q = e[t].q || [], a = o.createElement(n), s = o.getElementsByTagName(n)[0], a.async = 1, a.src = r, s.parentNode.insertBefore(a, s)) }(window, document, "script", "https://cdn.informz.net/web_trk/sp.js", "informz_trk")), informz_trk("newTracker", "infz", z_collector + "/web_trk/collector/", { appId: z_account, cookieDomain: z_cookieDomain }), informz_trk("setUserIdFromLocation", "_zs"), informz_trk("enableActivityTracking", 30, 15); informz_trk("trackPageView", null);
</script>


</body>
</html>