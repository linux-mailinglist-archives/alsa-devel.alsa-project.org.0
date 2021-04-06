Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABF9355369
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 14:14:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF974166E;
	Tue,  6 Apr 2021 14:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF974166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617711286;
	bh=1VSQ0HJIbUmCdIg05wmj4ZZ9I7SufRU9KX6dQuOF7nI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JgIzKEnFYm7i7Pk2cRvN/U2KPV0afGiYdm53IOlKbIeTrFrRkN8oNbdMXbuxmJ2dc
	 cxfg0hl4TCY0JqGe4sXgiZ9VxJJuApsJ72K8iS5IA5W2ufPBZivnBhX044h0NDlfke
	 nJslkAWvJJcS9OQtS9FwiN/RXzxiLUQGbpKT5Oi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDDBCF80259;
	Tue,  6 Apr 2021 14:13:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 385D8F80258; Tue,  6 Apr 2021 14:13:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71418F80246
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 14:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71418F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HaMOGpFA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92CEF6139E;
 Tue,  6 Apr 2021 12:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617711223;
 bh=1VSQ0HJIbUmCdIg05wmj4ZZ9I7SufRU9KX6dQuOF7nI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HaMOGpFAopXyROZ1/ivYWmGglmF+afCb6G0SdyBlZrMDMDpucDewaQYk3L2FXlaa7
 GKtccYEvFpZD4RqIoDQGeyeDNIaQJCiRhjasOv0cShuVcqMelkcxnIactfl3kmI0kK
 JvD0J6LroP56hv1wpjBldj1OUUyxVXRWLlkGZXVOubm68eTDTFbQ9Tir3umYrO9ze8
 tIgCHAgYvXbciSq6rk+wWh1zapxCcxqOsQeKDCmRayiXX4qimnjF36K0oIkIVi9pjE
 nyvwilwCm+VwX5gyv6nsWDVJpVCE8p1vN8j32pn/GtVkKzSL+qs8RpOx7uRTALc7JM
 VYAZoHGsC8NnA==
Date: Tue, 6 Apr 2021 13:13:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiri Prchal <jiri.prchal@aksignal.cz>
Subject: Re: [PATCH 3/5] SOC Codecs: TLV320AIC3X add SPI: I2C code
Message-ID: <20210406121326.GG6443@sirena.org.uk>
References: <20210406105018.59463-1-jiri.prchal@aksignal.cz>
 <20210406105018.59463-4-jiri.prchal@aksignal.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m0vRWufqUC70IDnR"
Content-Disposition: inline
In-Reply-To: <20210406105018.59463-4-jiri.prchal@aksignal.cz>
X-Cookie: BARBARA STANWYCK makes me nervous!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--m0vRWufqUC70IDnR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 06, 2021 at 12:50:16PM +0200, Jiri Prchal wrote:
> +++ b/sound/soc/codecs/tlv320aic3x-i2c.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ALSA SoC TLV320AIC3x codec driver I2C interface

Please make the entire comment a C++ one so things look more
intentional.

--m0vRWufqUC70IDnR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBsUGUACgkQJNaLcl1U
h9B4LQf9GF26KOmX1qHaxY3EaIGFU5f6HGM0OAghFkcLgzDRRrdMgsc7PuP5pMfV
1128IE9t4vtS0WLl0AJ/lajlhMCwNA4cxIj7RD69s6TE9VLWRkSFWrkaN3qGVpn4
aP11tDzZd8cCOuBO8QWBuG32bx1t8na1Mn6yBGsjXzZMhf/GUwYfnbcWfF4GlxSl
Bl2uR411eR9fJKlG9VRv2N08SbmZUoz44BkKFJKqC/wCjjlIlu0Db2nSoZifdu4l
AWpcXVZjd/0MCh3aJCnstH4QJBO/D6UmxEsLF71IF8ZpZYPUdJA9W+AbinLyBQD5
kOeP3AsOAwkvNu/WwxlYy78rcxAmPQ==
=mLe3
-----END PGP SIGNATURE-----

--m0vRWufqUC70IDnR--
