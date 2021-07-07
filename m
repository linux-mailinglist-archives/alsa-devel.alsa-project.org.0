Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0DB3BEBEC
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 18:19:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD53F86F;
	Wed,  7 Jul 2021 18:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD53F86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625674783;
	bh=3CVrcJTXPYuxSS/j2wHuKVTsifDFv5fStRhTCq4ZIIo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SzgT/Idc2mvP/sM1tvHgsvnneKFr2c2q6qWJoKCvcBkP8LSy/mYnYVtkABDUdxmCW
	 hK84g+M3wXJVzjQIZMKP4S3zNkZXvD1n+TFhwsylflyCnozzvMvODR6cQzw8DNXn3I
	 CdhiL3Iz+6t3huYc8uHPGOzxo8reJqS4YW7jJvx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AF8DF8014E;
	Wed,  7 Jul 2021 18:18:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 418F2F80224; Wed,  7 Jul 2021 18:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8D3CF8014E
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 18:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D3CF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nz2KU2Jb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2240461CC2;
 Wed,  7 Jul 2021 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625674682;
 bh=3CVrcJTXPYuxSS/j2wHuKVTsifDFv5fStRhTCq4ZIIo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nz2KU2Jb2fjznSkmLR8T9eDTn35e8u1QGCxa+EVbAOiZiF6mNLovNDfRyF2Aki1zL
 4Ea9K2/HwQupgDchxi7HyO9FwwaC8bhFJtKlmQx4OjetRf5hzv9AFcQbh/wULVMp79
 3xoXc+DBmO7qv3lT041wIZ3ZwyOReyC2UabOq3CRqV2tAM7QSRvAgZZ8bU/LcnS/Xx
 3C+sXLNRFwEchBJSPxkhtBlIsuVBMmnLdf2KcKwoWBntnqR326JTgp9buT2Zrg4Qqw
 5I+XqcmTUKLXBpINc8xY1mN2DDJCZ6VBp6sr8Z6w20QsW6+xaBcXZXjoXyM8Yuvdgk
 hYlTm3mW27Rag==
Date: Wed, 7 Jul 2021 17:17:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <vijendar.mukunda@amd.com>
Subject: Re: [PATCH 02/12] ASoC: amd: add Vangogh ACP PCI driver
Message-ID: <20210707161730.GE4394@sirena.org.uk>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-3-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RE3pQJLXZi4fr8Xo"
Content-Disposition: inline
In-Reply-To: <20210707055623.27371-3-vijendar.mukunda@amd.com>
X-Cookie: I will never lie to you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexander.Deucher@amd.com
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


--RE3pQJLXZi4fr8Xo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 07, 2021 at 11:26:13AM +0530, Vijendar Mukunda wrote:

> +static inline u32 acp_readl(void __iomem *base_addr)
> +{
> +	return readl(base_addr - ACP5x_PHY_BASE_ADDRESS);
> +}

I see this was the same for Renoir but it's weird that the read and
write functions are substracting rather than adding the base address
here.  A comment might be good.

--RE3pQJLXZi4fr8Xo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDl05oACgkQJNaLcl1U
h9BQ/Qf+I44B9D46yvA5DrXifzyD6B4n/K2QaDtHbog1HFtL1zbtiiATxdhLtYIS
yXeKEGxzcSmW+DgUaIMLf8kYbnoVTv1CIuAb6EpYWUVKIWlGHQ3n9QPoYuYIutvl
itaiB/rrOuisxmm1W8IQb0XL3DKywXFFRjnfqiC4d0z88U90gh58Ox3P8NgWMAsY
m84CWKyIJTagN7j0SXN8YizkoD/yBIS6eXa5l/jZ5lw9LlF2EqwBqEB7JegjnyqB
7Pf8CArQHsjn4+4IaPBVga6RmVukipqH4N+CfaXmOV8GbhvGnLEyvk7thJ4MbmvY
5BeHPpwe/hgvPfHZqDSFVOL84r7wsg==
=m2hI
-----END PGP SIGNATURE-----

--RE3pQJLXZi4fr8Xo--
