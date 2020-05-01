Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B531C1921
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 17:11:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FF6216A3;
	Fri,  1 May 2020 17:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FF6216A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588345900;
	bh=Lyrmu8ar5vnJuxtO7OPjuafgJYyddgFT26r6BYhhBJ8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AVSYQZlkHgkU7qsM01+wJlhmesY/zMDohEwpwINaUp8KOm/GZ2KeUeSS274urB+n+
	 uBDDE1Xgmkw/reiaVo0lYL46ewaSDa5jucxByvW98Ufbm/YQqheCBRxuGO56YR7XKl
	 GNcwwt50FXI5Y8FAe+wcfzodTI8N980gwTTHnVDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DA9AF80232;
	Fri,  1 May 2020 17:09:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7429AF8022B; Fri,  1 May 2020 17:09:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA242F800B6
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 17:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA242F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bpRB9eUS"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B707216FD;
 Fri,  1 May 2020 15:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588345791;
 bh=Lyrmu8ar5vnJuxtO7OPjuafgJYyddgFT26r6BYhhBJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bpRB9eUS+QrG3zRNKx1tIlXPlNykZ0j0BfYIy95JNbycWra0zdk1+8EGyUknL30wN
 GznFNyi/bYd6pdslQBkxVoF3W+0tTCJNllqfl9GaCm/PTX287l+POJPOuk5+TejqSD
 SmfPRUuQJbLTE0GZto2+KbEMl99ztLvlQQO7f+mc=
Date: Fri, 1 May 2020 16:09:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: boards: sof-wm8804: support for Hifiberry
 Digiplus boards
Message-ID: <20200501150949.GE5276@sirena.org.uk>
References: <20200501150611.15395-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline
In-Reply-To: <20200501150611.15395-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: Think honk if you're a telepath.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 01, 2020 at 10:06:11AM -0500, Pierre-Louis Bossart wrote:

> @@ -0,0 +1,298 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2018-2020, Intel Corporation
> +/*
> + * sof-wm8804.c - ASoC machine driver for Up and Up2 board

Please make the entire comment a C++ one so things look clearer.

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6sO7wACgkQJNaLcl1U
h9CMugf/dxPOchgIxCivNn86IPOJI0AziUaZ+E3+KeVKjxKXSztTAJcFvP4jioej
Y0N+aj5Spo6OyTr7n6k6SsIA/ccp9c89gWcbfL3AYzu7lno+bdNIrUvIL+lyUmjb
xALyTiGym4aYXa2DXquzFNV8XmtprtxHL0KhMxDNufBk5KwOSNYO1KMvJ03rRKSH
dut0+d3y+ZA4ffP0FmtUZ8UXfdijM1ftRd0PeKdeSN3fGnqkuQHPsuq6etuljzil
nG2qCZqjgy9IO9ht3bmw0X2JCVyc6em0KfZMh4IdMI3Dt5/nyZadWR8uqShI8reS
6pzvQ00L5bdweVxvzXv2W7IsC2+78A==
=H3PL
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
