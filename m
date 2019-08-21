Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEE197905
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 14:16:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF0F2165D;
	Wed, 21 Aug 2019 14:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF0F2165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566389813;
	bh=mYDZJHyAAQLicoMgFNiAepYMP4dukRl7xj6Kmvh3yzc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XlTTVUikxTXv7ziDk463KrGe47tDQB0AKZcHJjJaVWKEk0yYnNUMrzJBZeItz49uG
	 zyP3LVvDy534sdtu60d/ziJ0BWXsfAtvrxSV+x2vqZTaZnY2bKvEyo2ptyfAT6T09Q
	 GCRQH1ESzoN3V/CxcmdyrIX24bOVl+ja5CoUcm6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5057DF80306;
	Wed, 21 Aug 2019 14:15:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 078E3F80306; Wed, 21 Aug 2019 14:15:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com
 [209.85.128.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 045FDF80157
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 14:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 045FDF80157
Received: by mail-wm1-f98.google.com with SMTP id p77so4648644wme.0
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 05:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VGZTPAwEFySlPPXASsZQPbUHcTae/+X/wRKQPmmsLlA=;
 b=WXSa43ZtGpFoSBF8gjZRAfaD9cKRYvkRl4/l50G/C/t7aCH4MUCWTi6yAiB2NR7B5x
 ZtHW+cNmak4/6wItcMoqjW6u8VQswUhpFhh/QaQsj/dcLQUG0hhWcEvcyANYKegBUdWp
 +tM5E8Fx9BVDUI9eLPVpZoHjcrqCN1DWWKiThX9DmaMPg1KPVQ2oRLQpK6MjYoK88lyN
 GmW7BK+kqCfZkgr75PHWC2+UcEXINR3RfvcSm8pm1iq0Conku8ohdVfXgTN1zuuunB5x
 GPgh2ZlWdpyU+qXw51KRFz4JsS+Y4mX4FegQi+EG1HXjGnFZPkN/Uy8iHovz380OhogG
 bKLA==
X-Gm-Message-State: APjAAAWO3PMY+Pj6YdUtigSVSLcc3PRB4biHV7fJzshh1n5y0Q0PZG7D
 l2Zfpawk5bOZqVVfQlaDzF823VeHsB+RAauvRyNqyEFbvYKU2EbWLobFLLJpQnP7EA==
X-Google-Smtp-Source: APXvYqx72VjNla/WwnS7IIJyQhWoevv0baJnS50eIJ+ckMwP5dp6AWm1BTVGmWHpbrM+BQLgBUNjnoOjjbBg
X-Received: by 2002:a1c:b6d4:: with SMTP id g203mr5774547wmf.100.1566389702638; 
 Wed, 21 Aug 2019 05:15:02 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id w10sm327537wre.38.2019.08.21.05.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:15:02 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0PW2-00076s-8u; Wed, 21 Aug 2019 12:15:02 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7E7CB2742FCD; Wed, 21 Aug 2019 13:15:00 +0100 (BST)
Date: Wed, 21 Aug 2019 13:15:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Message-ID: <20190821121500.GI5128@sirena.co.uk>
References: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
 <74cc9562e056627e14f186089d349022b65f59e7.1566242458.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <74cc9562e056627e14f186089d349022b65f59e7.1566242458.git-series.maxime.ripard@bootlin.com>
X-Cookie: Sic transit gloria Monday!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, codekipper@gmail.com,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 21/21] ASoC: sun4i-i2s: Add support for DSP
	formats
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
Content-Type: multipart/mixed; boundary="===============1071193692112287716=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1071193692112287716==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5uO961YFyoDlzFnP"
Content-Disposition: inline


--5uO961YFyoDlzFnP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 09:25:28PM +0200, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>=20
> In addition to the I2S format, the controller also supports the DSP_*
> formats.

This doesn't seem to apply against current code, please check and
resend.

--5uO961YFyoDlzFnP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1dNcMACgkQJNaLcl1U
h9D3iQf/bXRJ2E8Ojq2kL+wJHey9oZmklhShBIGtZToXjBYiLvXOKxDZF0oAkhMI
gEFuZrDp/IDMtsTlXJ3OGhenBm6x6gQH+H2aTrUetM5G88JZ4c8kpJbG2s7Fvgvh
AE/yrrimb4wSW4LVbrmoe4e0N9M4V8VkG23BeJUBkQ3FVkcfTgVfLyoEdR+cvTlJ
Qyx58lTPdnnjkiW8df6XpND3ecO0sEyhdyJcNfLPNU/iXTuyK4wI30zujrwdRTyF
fJAfg4uzwkBDP3/vMftf6RwwDmK56MfRkeLYicwHkOTVWZsyht7TFuqW7k74Uy1J
UUaqo75QN/JdI7QkSurXjhmilrAIdw==
=cEmS
-----END PGP SIGNATURE-----

--5uO961YFyoDlzFnP--

--===============1071193692112287716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1071193692112287716==--
