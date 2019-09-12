Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3195B0DA8
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 13:19:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48BD31739;
	Thu, 12 Sep 2019 13:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48BD31739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568287174;
	bh=/+81sYTJD4bPfVSbERTI0g+rRubt5N32IRwgIRenOdM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OlLKrHgi5xqg0HUcMD8XlMIA4NC2y7p3F58Q2HiUThW6NCmC66T440tGSphAy8z4k
	 AgdpvBmt/LceIaU38slePYYF7fmNg26USf4LfQjJuxT06N6JH2Ae//t8es/K3yu8pc
	 c5M8/Bbnge6YAXNp4PBtIWPjW+M3czUuoQUKmgxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C50ACF80368;
	Thu, 12 Sep 2019 13:17:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18903F80368; Thu, 12 Sep 2019 13:17:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42435F801ED
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 13:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42435F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="fSTcwOMX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nKd2gT68nfyo/XlPwYQzGDJgpJJWANECzlBKS1jgDys=; b=fSTcwOMXPjIemZAht8mJdQeon
 XmDZW12VPp73W7QH+Dfohx5r5i0unsWrw2cXlrplLKUhhkJAiUnEmJ4qW5KuHPxpamV7kUdQFSBhs
 qa/i3yUQR2MtFpHBzCR3hTMPyL7QyQZx5rB779hetPsFtcFZDWxLuueRVV5nTP+cNKhhE=;
Received: from 195-23-252-136.net.novis.pt ([195.23.252.136]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i8N6b-0006av-1J; Thu, 12 Sep 2019 11:17:41 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 657FFD0046D; Thu, 12 Sep 2019 12:17:40 +0100 (BST)
Date: Thu, 12 Sep 2019 12:17:40 +0100
From: Mark Brown <broonie@kernel.org>
To: shifu0704@thundersoft.com
Message-ID: <20190912111740.GL2036@sirena.org.uk>
References: <1568253638-14027-1-git-send-email-shifu0704@thundersoft.com>
MIME-Version: 1.0
In-Reply-To: <1568253638-14027-1-git-send-email-shifu0704@thundersoft.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, navada@ti.com, tiwai@suse.com,
 robh+dt@kernel.org, dmurphy@ti.com
Subject: Re: [alsa-devel] [PATCH v3] tas2770: add tas2770 smart PA kernel
	driver
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
Content-Type: multipart/mixed; boundary="===============3019243544637111717=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3019243544637111717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3NJww9yp20AXRsxZ"
Content-Disposition: inline


--3NJww9yp20AXRsxZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2019 at 10:00:38AM +0800, shifu0704@thundersoft.com wrote:
> From: Frank Shi <shifu0704@thundersoft.com>
>=20
> add tas2770 smart PA kernel driver
>=20
> Signed-off-by: Frank Shi <shifu0704@thundersoft.com>
> ---
>  sound/soc/codecs/Kconfig   |   5 +
>  sound/soc/codecs/Makefile  |   2 +
>  sound/soc/codecs/tas2770.c | 952 +++++++++++++++++++++++++++++++++++++++=
++++++
>  sound/soc/codecs/tas2770.h | 166 ++++++++

We've lost the device tree binding patch from this version?

> +static int tas2770_regmap_read(struct tas2770_priv *tas2770,
> +			unsigned int reg, unsigned int *value)
> +{
> +	int result =3D 0;
> +	int retry_count =3D TAS2770_I2C_RETRY_COUNT;
> +
> +	while (retry_count--) {
> +		result =3D snd_soc_component_read(tas2770->component, reg,
> +			value);
> +		if (!result)
> +			break;
> +
> +		msleep(20);
> +	}
> +	if (!retry_count)
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}

It looks like we still have this code for what appears to be
handling the device randomly resetting underneath the driver.
Please, as I've said on both prior versions, split this out into
a separate patch to ease review and explain why this is required.
Start off with a simple driver which looks like normal drivers,
add this stuff later.

--3NJww9yp20AXRsxZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl16KVMACgkQJNaLcl1U
h9Bktwf+OVENuKKw9SdX4/GhO3RaRXFxZJG8glCsWb0w8tGlZ+e4p0KVnSU9NDtg
pljHEJ6pKKx4xVwexDzy6g2AwDtJOsFxwNP+tSxesvB4pd/hVIAVJhcWYMhdHvw2
bngyLxhrvx2VAM4ZGo3muaaFjEizixzR6jyVTk9mzUbjiKe6uLuyDkMDp6umVIsM
bmwOtNcARlrt3Q44fuV+1iukYLvaV4Y3KAy/jkzHp16IsY/fJ+N47kRqdFPqmEqO
GIIyQN/HCcDPCwvaPQ2RP+9wIO7VywFyZ6lpE3XM9SotBSannMcS6A2EIVF3/kWR
+guG/LKra7Z0076rH9+RBRA1rWvpwA==
=zkA1
-----END PGP SIGNATURE-----

--3NJww9yp20AXRsxZ--

--===============3019243544637111717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3019243544637111717==--
