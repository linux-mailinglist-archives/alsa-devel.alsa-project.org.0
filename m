Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A5F11001D
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 15:29:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0B6B165E;
	Tue,  3 Dec 2019 15:29:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0B6B165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575383398;
	bh=LlNuCkYm1pfseQzrWVM+cI4KDPkp9oZtElbk4c85ps0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uiRm/fJbszhUvz+Kog7qiq0JUmDghxC87TwweaKhtbsdrZtc8ln1sPd/MH15cMq4d
	 UwcrlI1YIphd0jzi0ucZDqMpJWyjcW54PrIdBnI0W1oWmLxw/1iXdH2rt+fBhuf/Bq
	 f7Sh0k74T12i1vwt4f3+ijEJCQHzMHz7HRpyHu1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5683F8015A;
	Tue,  3 Dec 2019 15:28:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AFF3F80227; Tue,  3 Dec 2019 15:28:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6DF3F800ED
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 15:28:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6DF3F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BXzB3IPm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VxYjLGtwCDTcs4bHOoBqIWPW0QFsGBkBnVZ5soEijWE=; b=BXzB3IPmvuG64kDV9JxcPH47i
 /glTDJZBPWA2NVSO6v17ptumVhif/XbTMWuiKgdAQqEOA3HNTChL+nIvs8vamiueXHY+5Xty2C7tY
 VUXZ1vOX6We3Q22QAhW35qO+tLrTgJHMg+XnTdhhZLIy49ZJXBBj7RgKWGHEDqBAhh1Tw=;
Received: from fw-tnat-cam1.arm.com ([217.140.106.49]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ic99j-0002jt-VK; Tue, 03 Dec 2019 14:28:00 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 7D184D002FA; Tue,  3 Dec 2019 14:27:59 +0000 (GMT)
Date: Tue, 3 Dec 2019 14:27:59 +0000
From: Mark Brown <broonie@kernel.org>
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Message-ID: <20191203142759.GJ1998@sirena.org.uk>
Mail-Followup-To: "Angus Ainslie (Purism)" <angus@akkea.ca>, kernel@puri.sm,
 Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Enrico Weigelt <info@metux.net>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191202174831.13638-1-angus@akkea.ca>
MIME-Version: 1.0
In-Reply-To: <20191202174831.13638-1-angus@akkea.ca>
X-Cookie: Cleanliness is next to impossible.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>, alsa-devel@alsa-project.org,
 kernel@puri.sm, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Enrico Weigelt <info@metux.net>,
 Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH 0/2] Add the broadmobi BM818
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
Content-Type: multipart/mixed; boundary="===============1616653767640598067=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1616653767640598067==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ofZMSlrAVk9bLeVm"
Content-Disposition: inline


--ofZMSlrAVk9bLeVm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 02, 2019 at 10:48:29AM -0700, Angus Ainslie (Purism) wrote:

>   sound: codecs: gtm601: add Broadmobi bm818 sound profile
>   ASoC: gtm601: add the broadmobi interface

These subject styles don't even agree with each other :( - please
try to be consistent with the style for the subsystem (the latter
one matches, the first one doesn't).

Please also try to think about your CC lists when sending
patches, try to understand why everyone you're sending them to is
getting a copy - kernel maintainers get a lot of mail and sending
not obviously relevant patches to random people adds to that.

--ofZMSlrAVk9bLeVm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3mcO4ACgkQJNaLcl1U
h9DGXgf/SJ8t7hSPglwZzxnDVxAte2xNoAVezgY5OPF4s1sm2k7U/h+ivay63+br
Yb0uVbL8I61TWMN8GAcMIRA2lsjzD20/oTcxPMamHvWE+91yTdxvBrWoRpqF3LcI
P8a2CJx3PYIH4nbyML6r53ZnzIF2rc9pGLB3t740Yu3xU87iKqWBWO5Fw3bbA824
BLl2+XQLYFPZ+oLLkpz6BR7xhDpgJ02aO2Fw3LlPtdD82VreneMOCmGYbavz26EN
A9c7HPAiqsyAbJ/t2dHPpIoZ0wihaRr8gPKy4py1EH43ScBAVvWMT0ca+0zpWt++
4aGCqa/WdIz0DOggZWP4JDtiux7z/Q==
=Br5V
-----END PGP SIGNATURE-----

--ofZMSlrAVk9bLeVm--

--===============1616653767640598067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1616653767640598067==--
