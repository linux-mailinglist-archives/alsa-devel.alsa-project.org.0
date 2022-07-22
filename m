Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1484C57E348
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 16:53:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9DC418CF;
	Fri, 22 Jul 2022 16:52:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9DC418CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658501629;
	bh=1BEtoYPylhGjmfmo73nwCT+Vb21TSaq/b0cgNtuS4G4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZTiqihvkfWbj3ho68HzOBpwPsyPKqpyGq1hbqYKn9P7ZhFG9MTsC01jTnhCr3Xhvh
	 Rs4WYpAXIRtkw8bm567pQfzdbrcYcYo1PEC8lpYnwagdWcQEOUIKjL+4OU7Mf6DqNx
	 GEu70T8d4x1vNZNI9PZUjuAHRSXZ8mxC9ISvw3m8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35674F8023B;
	Fri, 22 Jul 2022 16:52:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E35F1F80246; Fri, 22 Jul 2022 16:52:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3D9DF8016D
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 16:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3D9DF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GrqP/xYI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 60A32B8291F;
 Fri, 22 Jul 2022 14:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BB6C341C6;
 Fri, 22 Jul 2022 14:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658501559;
 bh=1BEtoYPylhGjmfmo73nwCT+Vb21TSaq/b0cgNtuS4G4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GrqP/xYIKVA+e9udPABysN08f7ZQCMm9pczHjOj5b+x/zZTnFPgnrUZiCm+FtL8Qf
 QkkhzmxZ7GnQXs6/WdkOvrgLcA+sfXayj+GHXrMWVXqelPRwA9H6tP/fuFA9asZgM9
 uGOa7h+OzT/b9lJP93/5YKip/exShyyZTZPf/83/gVpC1mBVA8+k8G/PWgnHG500LW
 HGH4z6DKdUKilkmhBGQBoglGc8bW5gfnaedkWy/dGtDchI0UJX5dU1mJNS/PpGam2b
 a2+cRUVnhdW/O0CeDnN0QT8DQC+hyFqwRLYM7TlqgTBBNuUpcdVJbnJEEFH8ZCj7NM
 Qhn2Wsrukl14Q==
Date: Fri, 22 Jul 2022 15:52:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: Modify dai_id macros to be more generic
Message-ID: <Ytq5rlr/er0wDTae@sirena.org.uk>
References: <20220722141705.3340440-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c9gJw1Vm+Pd8epQJ"
Content-Disposition: inline
In-Reply-To: <20220722141705.3340440-1-venkataprasad.potturu@amd.com>
X-Cookie: Yow!  I want my nose in lights!
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, vsujithkumar.reddy@amd.com
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


--c9gJw1Vm+Pd8epQJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 22, 2022 at 07:47:03PM +0530, Venkata Prasad Potturu wrote:
> Update dai_id macros to make code generic for all platforms.

> -#define I2S_SP_INSTANCE			0x00
> -#define I2S_BT_INSTANCE			0x01
> -#define DMIC_INSTANCE			0x02
> +#define DMIC_INSTANCE			0x00
> +#define I2S_SP_INSTANCE			0x01
> +#define I2S_BT_INSTANCE			0x02

This looks like it's just an indentation/formatting change which isn't
what the changelog said?

--c9gJw1Vm+Pd8epQJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLaua4ACgkQJNaLcl1U
h9DeHAf+NeqVmTKoGIQtNBMWmDLZYi9Nw8C3vk912kGDjJD5KFG3qk9BJJa1B1LI
PCUDhiRQ5Ct+Wgcg6BSgZvkb5scNRHUT2MAB6NZ74Cdr7jJoXnlqcOtreNxHOBh6
LtOkrbZH2XvUO3WvEFxL7pUq7Z52DHrmdREfOcfk+lJUKdEXEAk1HaQHypNBiRSP
QvzpTH85w/1KPkxY7evr+cvcLcc5+xqWRDBKVnja9p2aGdmmWGGDC8WKSJf1xUed
BMawcR9gLBnOKVYz81gHQQQBoc9YTdV+bsBasZ5AyxwppstNwReG6tu83eQW0ACz
1n+UtC+BO+9Mj8kCLCBilA3Ye3koDg==
=1d7o
-----END PGP SIGNATURE-----

--c9gJw1Vm+Pd8epQJ--
