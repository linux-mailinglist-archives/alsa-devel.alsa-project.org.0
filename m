Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A84C3EEDC6
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 15:53:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F4091167A;
	Tue, 17 Aug 2021 15:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F4091167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629208432;
	bh=rfnTYdpf8MN2jrvIgtygbvluBbEI+QqCJFD1Docs/oI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s12C9u0l5If7teZPFNH9GPRXroNJuqZ8O4Cxch/TR/E+8WEd8Mgl7xmDjkq+kB7X4
	 gUpIMSX6L6/XbVWUHmIZB6F3lsaaxuDS5vKhCCcGpzyRgb4WuX9mNB1WiALXcNsBIH
	 hZn62r48+x0Q551OMg8V/qkm9s5Rk7IlnYbu5egk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DCEFF8026D;
	Tue, 17 Aug 2021 15:52:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38DD1F80272; Tue, 17 Aug 2021 15:52:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF132F80134
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 15:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF132F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ukAXUhMa"
Received: by mail-wm1-x332.google.com with SMTP id
 q11-20020a7bce8b0000b02902e6880d0accso2012346wmj.0
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 06:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DdliCquo+PE2UHrK1S/P5dg8iEQs9vB2EdH9vP1ZGv0=;
 b=ukAXUhMaFl3HyZReRiZG7YY3vvR3EZ42C2YpaD3yySq3MxnsezMQG3JPJ0iHUZwmg7
 zYHZ7lxkodtLymgxdBDss+TZXGoHScQSmEe9DWPX10Q/rLbv5blkxly2VwWYfyd0OVk3
 fShUeNF60iMwIYHIK0dhx9nWwR/50u9gt+1Z/PkHPdYdD3gOPKqMV3psHcWJA6UjezHH
 g2FgR6kPgFmhRKZa/SGebZ1Ai13YsILs3eku3KAmbPFjWEK9Dgf7T8Z62kbj78R/axAx
 WAevZ6At2ZvD0tC/GwMsWCTT1e/T0UrujmuGwSYoQhr50h38ftK4UNDAOVpttvqdOobB
 dIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DdliCquo+PE2UHrK1S/P5dg8iEQs9vB2EdH9vP1ZGv0=;
 b=ppwlqjkawc3XRjGWss2jlBbhZQTKdWq9Tpz722RgaQJDlEOa5Dfn/ciiNNKTWXzh//
 esslZyNR5qgvGXqdk+m7CS6FpShs7mcmoNl9+v4B18tH55roh5Ig3nvvM2ap9Bawz4cI
 SCugpJo/Zuw5hERVLrbD9PG+22IQ4tcX7qqGZnQp+u234STbqJZRPCU3yzIGrC/9LhAI
 SkZR3yXCtd6f5he77+B5OM0B9/Ebn4eqbwXjm7SrsGGZZk0q4p8y8GAn661ckefucvO+
 cYuInTJQ6AAPItsDAibQWQ8zzZhHIjcPeMvau7e4kRpVoS+L1f9AeMXaDxAQ/fVItWDn
 du/w==
X-Gm-Message-State: AOAM531JY4UEOddf7P6yn1c8wAnXDO/6DwrNIEkArvhmx+EwpKST/Gr9
 aXXYQT8Zo0YQ+giIGP0suBTwmFcRPCI=
X-Google-Smtp-Source: ABdhPJzSoYy1CvXrWjNtJerwsnCHpFwWy9LB94jG+Yj4qymzX0l0atghK6Evm1aCKOuTAVSYWb2BlQ==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr3563409wmc.39.1629208343855; 
 Tue, 17 Aug 2021 06:52:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id s1sm2118598wmh.46.2021.08.17.06.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 06:52:22 -0700 (PDT)
Date: Tue, 17 Aug 2021 15:52:21 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bjorn@helgaas.com>
Subject: Re: [PATCH 1/2] ASoC: tegra30: ahub: Use of_device_get_match_data
Message-ID: <YRu/FeYK7MkHzfvY@orome.fritz.box>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
 <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
 <20210816183906.GC4253@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TERzZgiTczMyTKLC"
Content-Disposition: inline
In-Reply-To: <20210816183906.GC4253@sirena.org.uk>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Cc: alsa-devel@alsa-project.org, Aakash Hemadri <aakashhemadri123@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-tegra@vger.kernel.org
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


--TERzZgiTczMyTKLC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 07:39:06PM +0100, Mark Brown wrote:
> On Sun, Aug 15, 2021 at 01:42:18AM +0530, Aakash Hemadri wrote:
>=20
> > -	match =3D of_match_device(tegra30_ahub_of_match, &pdev->dev);
> > +	match =3D of_device_get_match_data(&pdev->dev);
> >  	if (!match)
>=20
> Thierry, are you sure about your review here?  As others have been
> pointing out of_device_get_match_data() returns match->data while
> of_match_device() returns the device.

Ugh... good catch. I (naively) assumed this was a mechanical conversion
like one of the many others that have been making the rounds and
evidently wasn't paying enough attention.

Thanks for spotting this, Bjorn!

Thierry

--TERzZgiTczMyTKLC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEbvxMACgkQ3SOs138+
s6Fuzw/+ONJup0AlXmkavB3mY/7ctPZCTYOEX1havOtaM0M7MC4gnILVLS15E5YQ
VkfyauVywsYJZ58EigjcET0aWWyP1moX//MXamjC/QMbJYBbFHydpdSsTVdvXjpX
j96kJMOQZ9ZIswQuZTNTU/ZkJltfjwLUT5ckt7jbc2PYMf/QqELtRAYEvbIG61oB
/vngvh5S5RoCQCv+kyGLZDSvgpDay2H6Ko5Xs/2uBDtiZPo+OvH+NwzNRjpd4X8l
4VuOhc6mE2796HjZ4+JG7xJ1R4mvZsNB6/HTFeiGMQhzJciB+MZhWcnGKev1WZb/
P8n9sQzppOd9X8BtusuIKxsV/JIqmOfeRWNE2ARTkKS3UcJEduiARFb+5XO0MUxc
xEGblAUU4dPztRK60nd/sHh2y/rbb2ChNs75WI9rTkI2o29js2yKCvdF7S2SPbGi
p2yDgvJGzQRQyCz71wU2oLOE2rFv7QPLUjj8tMj08ZOyjD36UTXWXn7Av8csIWQe
yvu8r/Upi1IRJAXtxKn/A4oCdEYy2ktBq54QCx16vJfTx1P6YBOKW2M2HcYEBjB1
6ilCGVVhd1XTLH/4A31gBXVtL4Wgx9gP9SbsXR1I6VFlwv0k2RZzsxc2v69hqJLm
OGKwxyBUZZ4yOy7/9oxHB5vvVW94r0pGaU9Rxj38pjfMTRq7pWg=
=CZLq
-----END PGP SIGNATURE-----

--TERzZgiTczMyTKLC--
