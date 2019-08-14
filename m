Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB1D8CFA3
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 11:32:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D220C1654;
	Wed, 14 Aug 2019 11:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D220C1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565775124;
	bh=cMUqstduanhUO+gK5kQ9XubOVhY7y0kisudPrYIyYcI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K5AcRJnLybeXwVRQVwOrtg526fYTRQ0i19MXdWfVHr6snO58Vt0Bq7+Rtnf+gYWGf
	 O2IF3ooBTmANHg38yfw/tJCM0YnqyrNwuyX9LSoZMVZGE+FVe841EhhRYdzBu+cMEP
	 u8FsN0c2Bkod7zG0e0vpM+Rd3VlR5LZRpVu8yR2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B93FF803F4;
	Wed, 14 Aug 2019 11:30:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93F58F80214; Wed, 14 Aug 2019 11:30:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ed1-f98.google.com (mail-ed1-f98.google.com
 [209.85.208.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81C61F8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 11:30:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81C61F8015B
Received: by mail-ed1-f98.google.com with SMTP id h13so6491886edq.10
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 02:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=v9qswxVy3dhs4GBr5jsRkUeG6VCbad8w9toRrnKPrhA=;
 b=LbZZqv3T3vS+mAb2D0/P69R8122K+D/FSmsqQG8Xgo90+xMFjY/lrokSu8uUPO3Ybm
 7HWK2Oi0yextlIfvcE5bSUKQE/Sn4OWBZXtsaHvPTZX5atou5BZcxxCPWmqLWryJ3gTx
 kyGjHGUdToaPQUGBOMwNFRLnabmuvFJB4lSEXYaHtHdvc1DMAqkUzOeKYORZbGZlUEpt
 q2yb1TWaKEEfMVn4YLNzCJQnjEJXIoWZuAEKhy/vWXD8vl0Oj64XsFPRECJwR/C1HhqU
 uxU3XpEyzWz1+Ai9WdZAvx/9ZS/XsdFCPiexNpexeiX0RSc8ia6Vt57sJM/cyVg0QRbB
 ypwQ==
X-Gm-Message-State: APjAAAV4LNE1bEMB9cAIpni54KqmHWfNej2HZEGAcc50UxzoyZhH9To2
 EmXlHFbaq4B/lZz5AY2YLzucpV1psL18tZlnOy4CMWEApYDwAbNon7oPiTswQbmkAQ==
X-Google-Smtp-Source: APXvYqyn2COYFbRgFubQJiRoUpBUtvfPHPFcJS7BJSMtk+eyrvFPgPJaildqaSGQJ5Xqjr4NHfOpp16s8q6E
X-Received: by 2002:a50:eb8f:: with SMTP id y15mr46657373edr.31.1565775012649; 
 Wed, 14 Aug 2019 02:30:12 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id dd24sm47927ejb.47.2019.08.14.02.30.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 02:30:12 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxpbg-0004iH-3X; Wed, 14 Aug 2019 09:30:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3A9C92742B4F; Wed, 14 Aug 2019 10:30:11 +0100 (BST)
Date: Wed, 14 Aug 2019 10:30:11 +0100
From: Mark Brown <broonie@kernel.org>
To: codekipper@gmail.com
Message-ID: <20190814093011.GD4640@sirena.co.uk>
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-3-codekipper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190814060854.26345-3-codekipper@gmail.com>
X-Cookie: Bridge ahead.  Pay troll.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, be17068@iperbole.bo.it, linux-sunxi@googlegroups.com,
 maxime.ripard@free-electrons.com, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v5 02/15] ASoC: sun4i-i2s: Add set_tdm_slot
	functionality
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
Content-Type: multipart/mixed; boundary="===============5514950568807990648=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5514950568807990648==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Content-Disposition: inline


--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2019 at 08:08:41AM +0200, codekipper@gmail.com wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>=20
> Codecs without a control connection such as i2s based HDMI audio and
> the Pine64 DAC require a different amount of bit clocks per frame than

This isn't a universal property of CODECs without a control, and it's
something that CODECs with control can require too.

>  	return sun4i_i2s_set_clk_rate(dai, params_rate(params),
> -				      params_width(params));
> +				      i2s->tdm_slots ?
> +				      i2s->slot_width : params_width(params));

Please write normal conditional statements unless there's a strong
reason to do otherwise, it makes things more legible.

> +static int sun4i_i2s_set_dai_tdm_slot(struct snd_soc_dai *dai,
> +				      unsigned int tx_mask,
> +				      unsigned int rx_mask,
> +				      int slots, int width)
> +{
> +	struct sun4i_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
> +
> +	i2s->tdm_slots =3D slots;
> +
> +	i2s->slot_width =3D width;
> +
> +	return 0;
> +}

No validation of the parameters here?

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1T1KIACgkQJNaLcl1U
h9CHugf6AjRO807eogpoF+xMNPWXjrK1Id3f+lBIjI+eQIHyysNsaOoU2cQm/xpC
oDixIET5TAwZtKrSpkmHPVk9ZdJFE8nzoUiZMauPOO+HKM9gxv73e4YXXimy08Id
KWmW6ajMPF2vgbrlU9j4HyPF/PxSxlDeqz4gzzhQ0SITqZa4TVFCdgM5xGuoAOLT
FVoipx99YfkemyMLeUmW+WS9z+cgq9EHznThZa/kKkdCxJLErL4JPuhOQ2s7o5JH
fB9HoFqiF8YFLE3tkcUf7qhIwq5913DuC2PH3bX4GPleK1PfH41JvD0+QBj1Aw00
BLuoNb+o7HReyWJhvgG0NOHxFgnQgw==
=bgB5
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--

--===============5514950568807990648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5514950568807990648==--
