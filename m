Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEB449CA31
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 13:59:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5BBB1F08;
	Wed, 26 Jan 2022 13:58:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5BBB1F08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643201960;
	bh=wwU+tnK1eUMgwaHuPMF+WVqKYm6bBk9k4K2YQcP3bjI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nXyV+xYnkTJb6lEzTv97r2kY9FprVLVukmxVs27bEBSlE5E/NzVZFe/lKLiZkGDYA
	 cpUa338QYA8MQWmRMXVOlnp5F5t0Fxx8JLShsXruVgFXs7td9u6vpFb8d1IbUh7/K3
	 n4uxFVO6NFNyh98Cm2RqWEFY0yLb2rn0EUk+3Y78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38BB6F800E4;
	Wed, 26 Jan 2022 13:58:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E5A2F8049C; Wed, 26 Jan 2022 13:58:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 533FFF80118
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 13:58:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 533FFF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F8GAxMNU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6211761A3F;
 Wed, 26 Jan 2022 12:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F57DC340E8;
 Wed, 26 Jan 2022 12:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643201885;
 bh=wwU+tnK1eUMgwaHuPMF+WVqKYm6bBk9k4K2YQcP3bjI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F8GAxMNUriS6oQyq9vKrcrtTrp/dW/3M66NWvd7HkQc94AGS3d8JeBDz/xEz6Yoi8
 Uw2Qbwjbfl4czkluzZXEZl8yrgYLYbNOtyRObL9qwjX7mR83Sqf64Dn/YrvGhqeMt0
 ecu0wpmXEQ7fJg9f6u2M4WrlLxIQVrltbgSDQxIb7dfGy+JSebNDe4u+sF+2k/2h5N
 EQAYUMya973vEi4HDML7m9G4ceZeMTFnN0CAK3BxmeWfFI7YULrScjRPQ1KPs3kdTw
 3myYN7YI7b26LgkUAL/P0DmUkop+wF04eQADykCqWeQNWyMd9kuE7hnmEVMsK4YWC6
 XK7w6GFjYxupw==
Date: Wed, 26 Jan 2022 12:58:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: fsl: Add missing error handling in
 pcm030_fabric_probe
Message-ID: <YfFFWSVgnbL6ETxo@sirena.org.uk>
References: <20220126113307.1673-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NmCm27cBeyhb9V5C"
Content-Disposition: inline
In-Reply-To: <20220126113307.1673-1-linmq006@gmail.com>
X-Cookie: Use only in a well-ventilated area.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Millbrandt <emillbrandt@dekaresearch.com>
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


--NmCm27cBeyhb9V5C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 11:33:04AM +0000, Miaoqian Lin wrote:
> Add the missing platform_device_put() and platform_device_del()
> before return from pcm030_fabric_probe in the error handling case.

>  	ret =3D platform_device_add(pdata->codec_device);
> -	if (ret)
> +	if (ret) {
>  		dev_err(&op->dev, "platform_device_add() failed: %d\n", ret);
> +		goto exit_device_put;
> +	}
> =20
>  	ret =3D snd_soc_register_card(card);
>  	if (ret)
>  		dev_err(&op->dev, "snd_soc_register_card() failed: %d\n", ret);
> =20
>  	platform_set_drvdata(op, pdata);
> +	return ret;

This means we'll skip the cleanup of the platform device that you just
added if card creation fails:

> +exit_release_dev:
> +	platform_device_del(pdata->codec_device);
> +exit_device_put:
> +	platform_device_put(pdata->codec_device);
>  	return ret;

It needs to return early only if the card registration failed.

--NmCm27cBeyhb9V5C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHxRVgACgkQJNaLcl1U
h9A7WAf+JZkt/zEa/dvgMZU5Q/VVk/9sewHPs0PgMWrUdfeW8UimVO//E3AAX9UK
ht2lweYpZ86PFZBtz5nsNO08huPNbN6qD5TcNN4f1dIZXUaqwV88pQPPS7yAsVQD
LIOhBTfYasGQXEBjClW54BzHLZ/6EjPijoBcYNyc65+ys2AJxeScoiUUpNWFdqsH
FTm8URWPkzMYEbNCw7+bb+E/ZdCXE4z2Eo8gu1ENnW/AJsowB6U/qtphM5qvlgHo
70F9alVxTYCYjHthrQEryGzGpuUAfrgB6O4lti7xXbdl6HFcROCLPa0VWhw3EQvu
L8CTKGLtwn1HN5kEU9kaW1eHTqFvIg==
=Cy4u
-----END PGP SIGNATURE-----

--NmCm27cBeyhb9V5C--
