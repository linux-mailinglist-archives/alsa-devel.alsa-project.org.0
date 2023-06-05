Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A948E722737
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 15:18:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59523828;
	Mon,  5 Jun 2023 15:18:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59523828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685971133;
	bh=SGsAGVrSqKqwUbt7JXQCFYcn8EXvmNfwpHAaExlrrFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F+VEVq5YLxI+xCiKGYUEWBlUVGpZT0+NOyQoIUVROxcRVZcL4jA/mkKtoQbmSGt0t
	 XAvobFb/Pf/n41X/Tqol0RM+I0JgSoJx/SukhMKBmnNyIh8HePXOPJmW0ECdSjCnPN
	 ZQxkrZOHD76oWP8mU+l3YOm6oucorWQdxlQmV4jY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD6CDF80254; Mon,  5 Jun 2023 15:17:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74D26F80130;
	Mon,  5 Jun 2023 15:17:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E68DF804DA; Mon,  5 Jun 2023 15:17:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16DF4F80199
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 15:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16DF4F80199
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=C58oqxJo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 286A761156;
	Mon,  5 Jun 2023 13:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D773C433EF;
	Mon,  5 Jun 2023 13:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685971067;
	bh=SGsAGVrSqKqwUbt7JXQCFYcn8EXvmNfwpHAaExlrrFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C58oqxJolO0WvmjWrd4Xn0Kcf2c4dkOI3G9BagcES3ULZk9Zqcfaa97VdQz9Edrbl
	 amYy+HTtXZ1eh49cFk2W5N1AP9ZPhpgCYOVqTdrM0D8YaVFlKY1Nk6UEMeprRr+TK7
	 z+SqTuHYwdgZHsj7Ul8XUYQHR1xQ0omtk79pQZogNW36CYUDZIneK5WniAZz2jVGFl
	 zbznDXdO7rTjqC1tG0FImrSANZhaaAl1CpmVGizMLo41k2bnnQ9JXOorbKrcRyuq2I
	 mlPcGUlpiQeeTIhUMSYyIP/+AZoLHfxS/Yf40WHH1NuGGX+etwdGyuBIUfPaGw1okJ
	 c1cwc/P2vjYwg==
Date: Mon, 5 Jun 2023 14:17:43 +0100
From: Mark Brown <broonie@kernel.org>
To: YingKun Meng <mengyingkun@loongson.cn>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH 1/3] ASoC: Add support for Loongson I2S controller
Message-ID: <f88a4985-0dc1-4599-8656-2029c0825495@sirena.org.uk>
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BoAetZG8U0jkcF7v"
Content-Disposition: inline
In-Reply-To: <20230605120934.2306548-1-mengyingkun@loongson.cn>
X-Cookie: Biggest security gap -- an open mouth.
Message-ID-Hash: TVCBMEJREMHPLF2Y3WIWUL7G7AQNFVDH
X-Message-ID-Hash: TVCBMEJREMHPLF2Y3WIWUL7G7AQNFVDH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TVCBMEJREMHPLF2Y3WIWUL7G7AQNFVDH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--BoAetZG8U0jkcF7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 08:09:32PM +0800, YingKun Meng wrote:

> +			regmap_read_poll_timeout_atomic(i2s->regmap,
> +						LS_I2S_CTRL, val,
> +						!(val & I2S_CTRL_MCLK_READY),
> +						10, 2000);

The driver is waiting for status bits to change in the regmap but...

> +		pr_err("buf len not multiply of period len\n");

Use dev_ functions to log things please.

> +static const struct regmap_config loongson_i2s_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.val_bits =3D 32,
> +	.max_register =3D 0x110,
> +	.cache_type =3D REGCACHE_FLAT,
> +};

=2E..there are no volatile registers in the regmap so we will never read
=66rom the hardware.  I don't understand how this can work?

> +	i2s->reg_base =3D pci_iomap(pdev, BAR_NUM, 0);
> +	if (!i2s->reg_base) {
> +		dev_err(&pdev->dev, "pci_iomap_error\n");
> +		ret =3D -EIO;
> +		goto err_release;
> +	}

pcim_iomap()?

> +	dev_set_name(&pdev->dev, "%s", loongson_i2s_dai.name);

Don't log static information like this, it just adds noise and makes the
boot slower.

> +	pci_disable_device(pdev);

pcim_enable_device() too.

--BoAetZG8U0jkcF7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR94HYACgkQJNaLcl1U
h9BFUgf5AXvsVIgWvo+jhUt1AcZpA6XupVdE4xlXM5TdaMAaZmx2ngdVrqlnqHo0
2r95znx9+wfqcikJcBwCYUz3GHg4Pp1djO4lxfUshg7ixYXL8jUH4zeUiDeOrHB1
NwNV+HRQJagRLUkSWr0LGiglrRqW4+zRtxbF5xH2xNkMY3dp0LDFZ0JXy+/5rKol
PK1MfPS6sLAnvXQkX2QMFHj4OEHX6JWKMAT5Ay0iUZIAph8d6FhhwYzGDe4vMHFm
aLF4PZcuMtiaDakkwFqMGn3ttIf2X7sQNaB9T5FG0juxqc5rT/bW21LCjN5z6TSB
dtSQKEGv5YU7Pk7u9kcabpa73VblVg==
=4kkP
-----END PGP SIGNATURE-----

--BoAetZG8U0jkcF7v--
