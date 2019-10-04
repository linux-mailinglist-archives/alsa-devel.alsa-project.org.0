Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BD9CC42F
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 22:28:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60C0E1683;
	Fri,  4 Oct 2019 22:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60C0E1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570220922;
	bh=UOtfsY0F3jJvqMIyZLnnrBkuRk/FA+j2iUkEtl+hL14=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qgdWqx84P9xerLxVIrqabS/jY37OKAPCM6/PFA2nvZ9ywTJ4Bql2PUZRqDfSg9YGF
	 2Rz1rkihbJFRo99gHTejAkRHeV3gI49+Ssr81tpwwcCIe8ZwpsjDoY29cf61vnl4k/
	 Dgy185WgslvQyEw9VN5aGBnOmuy/dGkNVyFzcYAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDEE3F80391;
	Fri,  4 Oct 2019 22:26:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FB08F80391; Fri,  4 Oct 2019 22:26:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 679F6F800C2
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 22:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 679F6F800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Cjt0a11l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j1l9R8UvUtl5K9DzHEaSXMPJHZn+w5VoGhEEAB809Lg=; b=Cjt0a11lbipjrwc8HUiJfKcDw
 u3dmVKxXk5NW0UX+1IYyj8Y5r0j3hxXi9CNQJeTDCRhRv6+za35zwkxMFwAkOX6V8QNaiFdFOATlR
 IuycBMoP38Ax1tZuFVQK4eVFPN41MfPgEQUgotmoTB5RhFlK4AVjG7232fd8f91EN2Pmw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iGUA7-0004Vs-Mo; Fri, 04 Oct 2019 20:26:51 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3BB032741EF0; Fri,  4 Oct 2019 21:26:51 +0100 (BST)
Date: Fri, 4 Oct 2019 21:26:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20191004202651.GH4866@sirena.co.uk>
References: <20191004202245.22855-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191004202245.22855-1-dmurphy@ti.com>
X-Cookie: core error - bus dumped
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, navada@ti.com, shifu0704@thundersoft.com
Subject: Re: [alsa-devel] [PATCH] ASoC: tas2770: Fix snd_soc_update_bits
	error handling
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
Content-Type: multipart/mixed; boundary="===============0702283088455383333=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0702283088455383333==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JI+G0+mN8WmwPnOn"
Content-Disposition: inline


--JI+G0+mN8WmwPnOn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 04, 2019 at 03:22:45PM -0500, Dan Murphy wrote:

> --- a/arch/arm/configs/omap2plus_defconfig
> +++ b/arch/arm/configs/omap2plus_defconfig
> @@ -395,6 +395,7 @@ CONFIG_SND_SOC_OMAP_ABE_TWL6040=m
>  CONFIG_SND_SOC_OMAP_HDMI=m
>  CONFIG_SND_SOC_CPCAP=m
>  CONFIG_SND_SOC_TLV320AIC23_I2C=m
> +CONFIG_SND_SOC_TAS2770=m
>  CONFIG_SND_SIMPLE_CARD=m
>  CONFIG_SND_AUDIO_GRAPH_CARD=m
>  CONFIG_HID_GENERIC=m

This is unrelated and shouldn't be here.

--JI+G0+mN8WmwPnOn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2XqwoACgkQJNaLcl1U
h9DDOwf/UTlL8bw9b4taTYD1MwGNNlg9SxfVFtrDM/5aGt1a9Kbzn6yUXUw8+gz8
B9eB+hdcxAKsLB/LAIITzTvrZN0NH5ak57GSabcplwoOVVtqp+HmFwnwQFPNMg/h
XawKlTByjNYh7Zr2vCkuxaqD4pQlvTLHFknRgiy7kUIVewD4Z+Z7fW6YPGFh28On
T+zrDHEzh8SMo1/6oyLWh9SzkgQPVXmxZ9mzMDMGzhdnXsBVj9iYNpszdOAEMiQi
nKH2Ys+sLlbLMT8/BVZL9T28Awow/ptQdF8dX9+JNRyza3Ro71obaeePaDivY0xd
asd3JxTne23nHxgakjKbXHpTSs3mMw==
=uFst
-----END PGP SIGNATURE-----

--JI+G0+mN8WmwPnOn--

--===============0702283088455383333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0702283088455383333==--
