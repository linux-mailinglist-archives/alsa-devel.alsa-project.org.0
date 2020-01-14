Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F32413B01D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 17:57:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C80F61886;
	Tue, 14 Jan 2020 17:56:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C80F61886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579021048;
	bh=ll2igscCXd1uX7x3JI2dx+wF730Xpyq7WOCsuiG3hzU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qb/fizutbz6DStGCsgcuZBlySHZay1YppxXoViIHE7N2ASL8r8dNbmNMe2tXYhOEr
	 f9JgVqH4gc1enMB43mq2NRHmp7oaLKaL1neffz7Xrsqzs5q1WNRY0sQzp17PZ9MgA0
	 i+8KthdV6Ar1gmh1etGTqVAeqvskWUv9U7pb8lx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F3AAF80272;
	Tue, 14 Jan 2020 17:55:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD585F80271; Tue, 14 Jan 2020 17:55:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 897A6F8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 17:55:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 897A6F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="pQngAnbH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kdjRJJ6vmtiCtOfqfPeKPm50+bI3uacHwWf3Vd4Ty40=; b=pQngAnbHgIExJaaMli9iyU3FW
 Ju4nowG5tt3qaIikF93aLF2VDFf4cCOTgG9Y22zZNtAMXaAqxQCrk+lcBbcZ9UX3KtugYgDiukFXC
 r58VL2YTf11YCcfF2SzxAUllGUW/uCttD4GOZKNjFjvpdKWuwr1gZfFsIqb4OdQz72MFo=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irPTh-0001hE-2E; Tue, 14 Jan 2020 16:55:41 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id B6A60D01965; Tue, 14 Jan 2020 16:55:40 +0000 (GMT)
Date: Tue, 14 Jan 2020 16:55:40 +0000
From: Mark Brown <broonie@kernel.org>
To: jack.yu@realtek.com
Message-ID: <20200114165540.GB3897@sirena.org.uk>
References: <20200114025628.4241-1-jack.yu@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20200114025628.4241-1-jack.yu@realtek.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, kent_chen@realtek.com,
 kenny_chen@realtek.com, lgirdwood@gmail.com, mingjane_hsieh@realtek.com,
 flove@realtek.com
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1015: add rt1015 amplifier driver
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
Content-Type: multipart/mixed; boundary="===============4404629627378234853=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4404629627378234853==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1y/7ip9Z0l6NTTti"
Content-Disposition: inline


--1y/7ip9Z0l6NTTti
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 14, 2020 at 10:56:28AM +0800, jack.yu@realtek.com wrote:

> +++ b/sound/soc/codecs/rt1015.c
> @@ -0,0 +1,1016 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * rt1015.c  --  RT1015 ALSA SoC audio amplifier driver
> + *

Please make the entire comment a C++ so things look more
consistent.

> +static const struct reg_sequence init_list[] = {
> +	{ 0x0000, 0x0000 },
> +	{ 0x0104, 0xA213 },
> +	{ 0x010E, 0x0058 },
> +	{ 0x0111, 0x2000 },
> +	{ 0x0322, 0xF7DF },
> +	{ 0x1302, 0x12F7 },
> +	{ 0x0336, 0x0010 },
> +	{ 0x04FC, 0x35CF },
> +	{ 0x0102, 0xed02 },
> +};

What's this doing?  Some of these (all that I checked) are normal
registers not undocumented registers or anything and you're
changing their default values in here as well as doing a reset.
If we're setting values on normal registers we should at least do
it through explicit, documented writes.

> +#define RT1015_INIT_REG_LEN ARRAY_SIZE(init_list)

Not sure this define is worth the effort?

> +	rt1015->boost_mode = ucontrol->value.integer.value[0];
> +	if (rt1015->boost_mode == 0) {
> +		/* Bypass */
> +		snd_soc_component_update_bits(component,
> +			RT1015_SMART_BST_CTRL1, RT1015_ABST_AUTO_EN_MASK |
> +			RT1015_ABST_FIX_TGT_MASK | RT1015_BYPASS_SWR_REG_MASK,
> +			RT1015_ABST_REG_MODE | RT1015_ABST_FIX_TGT_DIS |
> +			RT1015_BYPASS_SWRREG_BYPASS);
> +	} else if (rt1015->boost_mode == 1) {
> +		/* Adaptive */
> +		snd_soc_component_update_bits(component,
> +			RT1015_SMART_BST_CTRL1, RT1015_ABST_AUTO_EN_MASK |
> +			RT1015_ABST_FIX_TGT_MASK | RT1015_BYPASS_SWR_REG_MASK,
> +			RT1015_ABST_AUTO_MODE | RT1015_ABST_FIX_TGT_DIS |
> +			RT1015_BYPASS_SWRREG_PASS);
> +	} else {
> +		/* Fixed Adaptive */
> +		snd_soc_component_update_bits(component,
> +			RT1015_SMART_BST_CTRL1, RT1015_ABST_AUTO_EN_MASK |
> +			RT1015_ABST_FIX_TGT_MASK | RT1015_BYPASS_SWR_REG_MASK,
> +			RT1015_ABST_AUTO_MODE | RT1015_ABST_FIX_TGT_EN |
> +			RT1015_BYPASS_SWRREG_PASS);
> +	}

This should be a switch statement and should reject invalid
values.

> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		if (rt1015->bypass_boost == 0) {
> +			snd_soc_component_write(component,
> +				RT1015_SYS_RST1, 0x05f7);
> +			snd_soc_component_write(component,
> +				RT1015_GAT_BOOST, 0xacfe);
> +			snd_soc_component_write(component,
> +				RT1015_PWR9, 0xaa00);
> +			snd_soc_component_write(component,
> +				RT1015_GAT_BOOST, 0xecfe);
> +		} else {

Do we need some sort of lock out to prevent applications changing
the bypass boost mode while the amp is powered up?

--1y/7ip9Z0l6NTTti
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4d8osACgkQJNaLcl1U
h9C7hwf+NxXoWjViJnU4QJ37xrnXmDS8Flk2pAYx1NmSByjmtTYDVqwHRX3h3jtW
8quR//9DbCkVfi2cbe+JwDmUAEC26cWzwF1RjD6oz8n5QLpW2EeC17EXFcK0mm57
qY0Q+ervzW9/3+3+8c6Nzk4OP7DVXotKxul1SKzoLXlrpD4iBop2ZJvZFNup1b9n
WxMOR2lV4MemWci1gfseO3vQ5HOi9W2xSIkDevxvVF3/8LttfZoPm1aDoui3Of90
W/+Z6EMnb+7/7lJn50t4EfflCkyrBXmD5FWGOadLOgUN5IUctvg3XPkXKXZIjIEr
dUqDz+7iZ/grSj1fzmntnS/dASBjSQ==
=ZLw0
-----END PGP SIGNATURE-----

--1y/7ip9Z0l6NTTti--

--===============4404629627378234853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4404629627378234853==--
