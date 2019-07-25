Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A7D74E7E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 14:49:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2553E1AF5;
	Thu, 25 Jul 2019 14:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2553E1AF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564058970;
	bh=50IDkZCsjr17UkNuh4MYtY7g6a8VhIKZielENLMGHdY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hi5TQjcRa+NI6gbPaWxwtXpiuIOejGHP6SwGN3azUrDTDExs/wlQCIvKgGFFZcSy/
	 mGHwvbZhXTyRTh7hXqnkOjS6zaBA1L3/m4ROY/FVVtPm/JAMUYlc/9QaDng7yvMSLa
	 O8EstNFFs3BK4T+itE+/Ne7vZORqkWtrKtio7GUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FE5AF80448;
	Thu, 25 Jul 2019 14:47:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43C35F803D0; Thu, 25 Jul 2019 14:47:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D88E8F8015A
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 14:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D88E8F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ZYmXoiRy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gwJS93r8HP6Ay7gAkx3UEd8regmykqy+NRhVkjCajZg=; b=ZYmXoiRyV/QlnUahtyfIYhgpx
 clxpsgNw/1BLKiKyZB8aACPtCRU+CpLfFKFzCvAaPKDD3P1JBE6+FdAumjEqibiIu+A2ZRWbRP217
 klVr3N8uwlxiEJE2fed54RiKT9lYXqpD+2Px8JTFAgtXZgdl8X31v/mFvP51onXTiNrO8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqd9i-0002nI-Ax; Thu, 25 Jul 2019 12:47:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1BDC42742B52; Thu, 25 Jul 2019 13:47:33 +0100 (BST)
Date: Thu, 25 Jul 2019 13:47:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Message-ID: <20190725124732.GA4213@sirena.org.uk>
References: <20190725123152.28179-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
In-Reply-To: <20190725123152.28179-1-ckeepax@opensource.cirrus.com>
X-Cookie: Jenkinson's Law:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: cs47l15: Add codec driver for
 Cirrus Logic CS47L15
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
Content-Type: multipart/mixed; boundary="===============1061313715301916514=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1061313715301916514==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 25, 2019 at 01:31:51PM +0100, Charles Keepax wrote:

>  	select SND_SOC_CS47L24 if MFD_CS47L24
> +	select SND_SOC_CS47L15 if MFD_CS47L15
>  	select SND_SOC_CS47L35 if MFD_CS47L35

The Makefile and Kconfig sorting is a bit off.  Please send a followup
fixing this.

> +static irqreturn_t cs47l15_adsp2_irq(int irq, void *data)
> +{
> +	struct cs47l15 *cs47l15 = data;
> +	struct madera_priv *priv = &cs47l15->core;
> +	struct madera *madera = priv->madera;
> +	int ret;
> +
> +	ret = wm_adsp_compr_handle_irq(&priv->adsp[0]);
> +	if (ret == -ENODEV) {
> +		dev_err(madera->dev, "Spurious compressed data IRQ\n");
> +		return IRQ_NONE;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t cs47l15_dsp_bus_error(int irq, void *data)
> +{
> +	struct wm_adsp *dsp = (struct wm_adsp *)data;
> +
> +	return wm_adsp2_bus_error(dsp);
> +}

Noticeable difference in pattern between these two interrupt helpers
(and makes me wonder why we need the wrappers at all).

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl05pOIACgkQJNaLcl1U
h9AyIAf/eTR5+rJfcY6/4JYG398BWfKCj9Lmn//ckAnVftEqwCoh2X525gSdj7Aq
Rtb0zeFXGrqWBbl0Fiuo1Uhx15PidXC9DQltbetZLCV0BGHX3hXhac8rcvnEX9AN
lU9p+6s9+3dOaLT0KpKrmbvu0TIqR/H0NsY/5WnphBDKwPt3WJuxcIeZkhITVcEY
AYxvPUjekXKdhZpWWe/KrOi3HRX0KXs4oM7j+GFPpnOg81hz6sCYbsv4eDVkmpBo
rYws3KPnBALQbC+p5y7TXfR9YiN7G0QTlle07zGdadtbQmAT/Y0b1/+5qnJPEZTq
u5In/7/l1Ob5zvxOP0tBUZ2XazjWrg==
=G85S
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--

--===============1061313715301916514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1061313715301916514==--
