Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 334BD4089ED
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 13:13:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17A63823;
	Mon, 13 Sep 2021 13:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17A63823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631531606;
	bh=OYAJ6dqKcszI0F7Ps07XpeMuXLTtjPt2OWp/s1gxtVc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=stwruDtf/WWKWyX1kfop6+pidhL9+iHVa/+62KgfKZ+E9eL0rq4FNLTwf/2WYJXsB
	 wrDjel4Gpfxg0JteTv16i82WFRFXL+RHzm9GkcRsiTSvPDm3uAO5mkZokIueQ7GilT
	 d7KouexL0NnoRJliGN80K47ZGN0BJlnRRyc6FNKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B136F802E8;
	Mon, 13 Sep 2021 13:12:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7208DF8027C; Mon, 13 Sep 2021 13:12:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B6E4F80128
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 13:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B6E4F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iNAhPNLS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4253260F46;
 Mon, 13 Sep 2021 11:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631531516;
 bh=OYAJ6dqKcszI0F7Ps07XpeMuXLTtjPt2OWp/s1gxtVc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iNAhPNLS4Au5LtRq6PQ7W2fr7JlS//Zy/r4bbrVrUx/I4FkDcprS7mXhOBKhZO7Po
 bLYi1s3dQm0GgV0GncGDZHp4qDVPQQ3WVeCWBl2UsHhzTM9SVeIdWQ5e/d8CuV/VGu
 L3/FRUZpcdKmRZRPOMTeh2fuCIWZc9vr7KDt8N55tuCS5ZqIs9Qog8CzyAJP0jsXqy
 KGX3ggosf5YKtfh6+7p35kaaS8F5Mjm3AmlkR+ZSal2qtBaBp5RQAB08GobdvlyXgD
 UMjjkiv+Xm/O1IX0rpSG8L/am0dpu+gEuzzRWKRgg9566QB9rkq8j+ZRMw3EETT1C3
 zDnhbY0RBD4Bg==
Date: Mon, 13 Sep 2021 12:11:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: sun4i-i2s: add Allwinner R40 I2S
 compatible
Message-ID: <20210913111117.GB4283@sirena.org.uk>
References: <20210912072914.398419-1-jernej.skrabec@gmail.com>
 <20210912072914.398419-2-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline
In-Reply-To: <20210912072914.398419-2-jernej.skrabec@gmail.com>
X-Cookie: Above all else -- sky.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 wens@csie.org, robh+dt@kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
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


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 12, 2021 at 09:29:13AM +0200, Jernej Skrabec wrote:
> Allwinner R40 has 3 I2S controllers, compatible to those, found in H3.
>=20
> Add R40/H3 compatible pair to DT bindings.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE/MdUACgkQJNaLcl1U
h9Cu9wf/VM+++mQxRG5zosD+5PVPxZ/AZqZuv+WaB5dknktVNI6nZJ0rCgeR9Zgf
bmMVexYZgmNnRZe07t6gs6XUbiI+6EqJyAkEtlOQ1EpcYG99HnT50qD+3712psjt
9/UvpRSZkiOschuvInRtGnecT0PbCizK9ExxrLayvHfQpzk6mQTtrVRX3S1uQFZk
6BlB5/9EQmNxoVGM6bXA1mCcHp9DMEzYoVHkAy13Ci+YfxaJUJHpxHjCa7Qww61h
Wrp2LKZQK+Y5XRJU1N0JI/ibWMc0PcVPHylkXWH6ZNB7jLZzvwcEK0I2RKw4cY8n
bbJCpgXED2/vnIDglnysrHHfeB9HXw==
=h6F1
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
