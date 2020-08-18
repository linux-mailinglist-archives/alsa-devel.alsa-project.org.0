Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D98472481C6
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 11:19:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 751001742;
	Tue, 18 Aug 2020 11:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 751001742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597742387;
	bh=rPEhBVdj3TNhZ/9MeLIiP8JDXIGxKhgYrb+eXqJHV2o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cf77m9tF8Sm4PTZ0EaMnuvvBl7qtnD1I34eDo1T4g0JGo1Ic5criwgXyTjW+cwJkL
	 aQIcFIDQZIoppC+48ab998EVJ16AYLgziHQ3Rp0sH71rLUX71F7EX21EGee54sp0rQ
	 1QUxYQCtyfeyDtR2YUoGbj9JCG6c1Plb0ZyqEnSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 859F3F80273;
	Tue, 18 Aug 2020 11:18:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19234F8023F; Tue, 18 Aug 2020 11:18:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91DD3F80114
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 11:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91DD3F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gc5yoV6S"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F32FA2075E;
 Tue, 18 Aug 2020 09:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597742270;
 bh=rPEhBVdj3TNhZ/9MeLIiP8JDXIGxKhgYrb+eXqJHV2o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gc5yoV6SQpmYKD7harBGev82XCXf71775+Ihey9bEN7nHUqEJDoNRC9uE7BbpS5jE
 0llPCxd8F8+TWsDX39bXo6dKNt4P5EVBjTrsac2IgmOBqkLrjNfjqGk6dzWFG9Lq9e
 SZu6dvzp4ErbRWqjWWJYmJKFCb8djmm5f1nZNwiw=
Date: Tue, 18 Aug 2020 10:17:19 +0100
From: Mark Brown <broonie@kernel.org>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
Subject: Re: [PATCH v2 1/2] ASoC: Intel: KMB: Enable TDM audio capture
Message-ID: <20200818091719.GA5337@sirena.org.uk>
References: <20200811041836.999-1-michael.wei.hong.sit@intel.com>
 <20200811041836.999-2-michael.wei.hong.sit@intel.com>
 <BYAPR11MB30464FB862DCEA243ADA51499D5C0@BYAPR11MB3046.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <BYAPR11MB30464FB862DCEA243ADA51499D5C0@BYAPR11MB3046.namprd11.prod.outlook.com>
X-Cookie: You're at Witt's End.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "Sia, Jee Heng" <jee.heng.sia@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2020 at 06:50:43AM +0000, Sit, Michael Wei Hong wrote:
> > -----Original Message-----
> > From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf
> > Of Michael Sit Wei Hong
> > Sent: Tuesday, 11 August, 2020 12:19 PM
> > To: alsa-devel@alsa-project.org
> > Cc: Rojewski, Cezary <cezary.rojewski@intel.com>; Shevchenko,
> > Andriy <andriy.shevchenko@intel.com>; tiwai@suse.com; Sia, Jee
> > Heng <jee.heng.sia@intel.com>; pierre-
> > louis.bossart@linux.intel.com; liam.r.girdwood@linux.intel.com;
> > broonie@kernel.org
> > Subject: [PATCH v2 1/2] ASoC: Intel: KMB: Enable TDM audio

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl87nJ8ACgkQJNaLcl1U
h9DnLwf+N5G5YkGo8soTvwoVeoBbWDerxIvx2M7Fq0R9JCOKrZsXpV3B88h/mx5g
wS1rr0eLSjXjrZEFmomhhSm5w1BaYGFZdlR6NNUvimNzjrxQME5YBhieCncY4UiZ
HWZ1i/7eCJBZS8dzHeOUzqYUzqzbSoZlbBK81A/Yg8F9W8Nxtymo11xfP2Dupd0E
9NoDYCbgcT9BmpjdInmbdB8W0Vy3kMmits4uWOXPMXj0Xxmi0nWdfkt9b/ee7j0E
Edk/Yh9n3LlOOYPszSjoTzL/3/m16vUELpGpJcCS2h1nEi3SpNxUNnAga96thb9S
Bx9rr0GocPcs72JkW9VQiGHGrUMMiw==
=MDYp
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
