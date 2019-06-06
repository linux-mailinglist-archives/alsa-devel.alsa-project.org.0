Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C6637396
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 13:56:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C63731684;
	Thu,  6 Jun 2019 13:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C63731684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559822193;
	bh=mAup9VucY4L6irU8Xp0eWYNGYRXPFmUJxXXKD3wngYE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VA2Zf2Y44XMS95d9zSmg8JnNFUfxnajDWF/ExQsOVX8sLFRLbQ4FXuh+CaLqzxzRP
	 jLatWZsPvYjmpsRZRSCcDw/nbmmH/vDzM2x9u+lQtyByyZdDREgXhmQlG49EE9AF6R
	 3WUpTttXuNpYrvGrRcf+EDT1Y78xKdWeWmJ05Fjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8045EF896F8;
	Thu,  6 Jun 2019 13:54:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B06AF896EF; Thu,  6 Jun 2019 13:54:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E805F80768
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 13:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E805F80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Z1ghBiSs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gTBkVmHAheLzIjg20ZEgj9XJEkLrz4Bi4GDSG+PTTSU=; b=Z1ghBiSsZHjuzORBJfhzyx5pw
 fw272Vt1FcBSp1I6+Hg2sQewRs2GqIic+xjaUhu8i9diVc6DcVwyu8RJFvdQx8YThumh2ui/ZrN1q
 RlWlWN7WZCIEDMknmFSkEO1xRraTFLSbgjTuXQplqBuJVYB3VhOrZiKUv+eJlJTBvyr00=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYqyh-0005ST-2g; Thu, 06 Jun 2019 11:54:43 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 44A95440046; Thu,  6 Jun 2019 12:54:42 +0100 (BST)
Date: Thu, 6 Jun 2019 12:54:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190606115441.GB2456@sirena.org.uk>
References: <20190606114002.17251-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20190606114002.17251-1-srinivas.kandagatla@linaro.org>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: msm8916-wcd-digital: Add sidetone
	support
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
Content-Type: multipart/mixed; boundary="===============2254145262380331356=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2254145262380331356==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9Ox1BgGQfTDeiDFL"
Content-Disposition: inline


--9Ox1BgGQfTDeiDFL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 06, 2019 at 12:40:02PM +0100, Srinivas Kandagatla wrote:

> +	default:
> +		pr_err("%s: event = %d not expected\n", __func__, event);
> +	}

dev_err() please (and a break; as well, it isn't strictly needed but
stops people having to check that it isn't needed).

> +	SOC_SINGLE_EXT("IIR1 Enable Band1", IIR1, BAND1, 1, 0,
> +	msm8x16_wcd_get_iir_enable_audio_mixer,
> +	msm8x16_wcd_put_iir_enable_audio_mixer),

The indentation here is *really* messed up.  What are these controls,
with names like "Enable" they sound like on/off controls in which case
they should be standard Switch controls.

--9Ox1BgGQfTDeiDFL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz4/wEACgkQJNaLcl1U
h9CHXgf9ELgAnvcZKwTjonidDRb4OSre9kePfh4H+mFw7tR6ZR9tmBAT2jbsVbGZ
WvScbpmCOfn++MhbvUy/EPYBm2WKdhiVRzT7K4m40Z/FJI3ZsZcKmR6WXaQnml9u
xkTXA6na7ohZkJ4lpkmN1GMo/3pE0XjQudzjSEUBlY3/ZbLhEf1uOke3Fphilxb7
y2QF6JumJj9Zb1SBYIy30NV738gGDGmQY4A4Dtj1nm1Z4beiB079IxOXTRCoZ15+
fzJ61eL4qFymDuuJ0NTNsvos01adD0vGWVLhR+ngBDILwNatpwJ0gP+gK7XhxKWQ
9JDBbNRSzsgduDJnCk4IIC+A38m0HA==
=3Tnd
-----END PGP SIGNATURE-----

--9Ox1BgGQfTDeiDFL--

--===============2254145262380331356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2254145262380331356==--
