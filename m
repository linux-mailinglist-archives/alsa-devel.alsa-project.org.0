Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0CC3A7DB4
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 13:56:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 276B31688;
	Tue, 15 Jun 2021 13:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 276B31688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623758193;
	bh=Ryg5gVD62jasf3/gyRRVCZbE2fmZc8ABQmAVPplc3YA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XMu/d+wMj5+Kr/UMYiQOkHaBSiB6b9tPYA9i8M5yWr4RPFANipc43KPSspNqzDaTb
	 +qFA9uNIgqke8duU/1j8qjlP7gjrR+hv2OWl2l+5altBetqJ2bMv6Lu5Pp7C56lgz6
	 JK+ZL0x2fBBRpyR1UfdVXUBaXvJqqTPlh5nT1V30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80CACF8016D;
	Tue, 15 Jun 2021 13:55:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACFFBF80171; Tue, 15 Jun 2021 13:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80E16F80113
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 13:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80E16F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e2rvcPjF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 863D660FF0;
 Tue, 15 Jun 2021 11:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623758097;
 bh=Ryg5gVD62jasf3/gyRRVCZbE2fmZc8ABQmAVPplc3YA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e2rvcPjFxkpDpzhUpoLfrAMqWsulNem2IX3ZJDmuUWk5+Cxf8x4Rl87KomsEp9RK+
 +W3y7leleoManvGA37ngEuDjurweGrouI3y7HpPq34Ct2kjbQPYJI0Vd5d53LWTa0T
 Wr/bQB0ffYDxBGH2bqtsy3BeUHMAMsTUNAObO8JvnfrK/JmJVVx5uHNMEK5SyPGsJr
 8mj1L5oTHhTuF7wOggMK2Iw6fpVqDwGLTzLSWNTyN89zP/GjMDXEBshNza6BS+l5Yn
 awpcsJtM97d0lezlo9+QEFDCR8x/1Butyy7fQsZqR0300FKqbhR4Bw0GuGxtSXDm8p
 RU/FLDkjswD2Q==
Date: Tue, 15 Jun 2021 12:54:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Claudius Heine <ch@denx.de>
Subject: Re: [PATCH 1/3] ASoC: tlv320aic32x4: prepare driver for different
 device variants
Message-ID: <20210615115438.GD5149@sirena.org.uk>
References: <20210615094933.3076392-1-ch@denx.de>
 <20210615094933.3076392-2-ch@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline
In-Reply-To: <20210615094933.3076392-2-ch@denx.de>
X-Cookie: See store for details.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Marek Vasut <marex@denx.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Sia Jee Heng <jee.heng.sia@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Annaliese McDermond <nh6z@nh6z.net>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
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


--MAH+hnPXVZWQ5cD/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 15, 2021 at 11:49:30AM +0200, Claudius Heine wrote:

> With this change it will be possible to add different code paths for
> similar devices.

>  static const struct i2c_device_id aic32x4_i2c_id[] = {
> -	{ "tlv320aic32x4", 0 },
> -	{ "tlv320aic32x6", 1 },
> +	{ "tlv320aic32x4", (kernel_ulong_t)AIC32X4_TYPE_AIC32X4 },
> +	{ "tlv320aic32x6", (kernel_ulong_t)AIC32X4_TYPE_AIC32X6 },
>  	{ /* sentinel */ }

It appears that the device already supports multiple variants?

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDIlP0ACgkQJNaLcl1U
h9CYOwf/SlCmc7TAjtDwrSiQvdXEdliXBwxX5qNaJe+XWlWNKdt6nxq00rCJ4kH5
YOfjOL/FvF9oCEnUqdQSBOKiiLTPxtUVZPbUCZsaLC9h6euOxLVvmsMWRGvGBYeb
O7Mfcuvik8fX4TtQPrlN+VkSKuHNprrMeyBlVV8t5r84ED39c63uWDa56WvY5J6S
P/ZRzT1ZVVpJC0418lE+y+dnnzegalwiZTn2u4mFxyN+CrD7OC2GfDFROFO9IAcT
0PfaHIHrj5k+JdNqQUVGKeAgp77W7Tb9fdepVkGxYK4lw8RTlgFqjpSPpPVu2WId
PPiI4st8jlpxYJOb9fg8ReQfQ9MMyQ==
=F81b
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--
