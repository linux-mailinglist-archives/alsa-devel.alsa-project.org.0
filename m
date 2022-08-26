Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE835A2E5F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 20:25:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09585166F;
	Fri, 26 Aug 2022 20:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09585166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661538308;
	bh=fDJZJ3AeiKD9D2LjbTJDLiT5RrB5WN+nB7JpXBvjlnE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tOF5AMpqaMHGSzlJ6ZCT1qY3aLzVETwCBcVbD5PUS8O4qgr6UiJt8gOojiJXnZJ24
	 rORfm8QjvpFutlfKrZuzdRvLPKqP3KXqsz0JvKaVVLuujRRa2oS4avmjHWjq4Vi5px
	 16vJbDbfXIdmsAAPNWrpwNnzxJ1z/iwc3LIHF5bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A1BEF8032D;
	Fri, 26 Aug 2022 20:24:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A243DF80238; Fri, 26 Aug 2022 20:24:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38671F80105
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 20:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38671F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sWIqnfn9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0B6EA61219;
 Fri, 26 Aug 2022 18:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B0CC433D6;
 Fri, 26 Aug 2022 18:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661538241;
 bh=fDJZJ3AeiKD9D2LjbTJDLiT5RrB5WN+nB7JpXBvjlnE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sWIqnfn9d+OsCtFDKIiyGcfAeVrHpOoMVzlcqSZRBwbl2sRwBYQmSszCQwLZObuBD
 ZyY3dj6+t4VaQA5v+cBAeTm5cmiiw0p/AZ4aTDDtYyoaWt0BZ49KZtIYYy99IX8tZA
 GVLptnAtwx2Z0N5Cn4ulM0RuT57Sl0WxMp0+SFVH4YyEd2mTbu4siFBw0HQm5f3ZMt
 g7+0W9YNijQ1zzuqOu9fnWjQQaNuS0ZJ1khTCIkjgkXfWj10cFm+NvfxHjs9Lt8Ekc
 y2xEloopbPRn9U09fdCE8K/+YBa+lXS2OjPuyup1aa1m0n3rp8HR6CAJiitPHa36WF
 omf/5GEEoD/5g==
Date: Fri, 26 Aug 2022 19:24:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Maurycy Z <10maurycy10@gmail.com>
Subject: Re: [PATCH] ASoC: Fix misspelling of 'system' as 'ststem'.
Message-ID: <YwkPwFQapBz6gFPO@sirena.org.uk>
References: <YwgAi68IzghNf0Dl@thinbox>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2vlFT4VlBjIBHCeB"
Content-Disposition: inline
In-Reply-To: <YwgAi68IzghNf0Dl@thinbox>
X-Cookie: Necessity is a mother.
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
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


--2vlFT4VlBjIBHCeB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 25, 2022 at 04:06:51PM -0700, Maurycy Z wrote:
> Signed-off-by: Maurycy Zalewski <10maurycy10@gmail.com>
> ---
>  sound/pci/ice1712/ice1712.c | 2 +-
>  sound/pci/ice1712/ice1724.c | 2 +-
>  sound/soc/fsl/Kconfig       | 2 +-
>  sound/soc/generic/Kconfig   | 4 ++--

This has an ASoC tag in the subject but also covers ALSA

Acked-by: Mark Brown <broonie@kernel.org>

--2vlFT4VlBjIBHCeB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMJD78ACgkQJNaLcl1U
h9DZvgf/RMNK90WuuI02JCzni10BvcEpIfIyz2ZMSSmNwtFBHHm+WMDGJNpt0EoE
6gfb5thSwCQ0k/AqvbtKV9k+R/zoBFqyPOecVHjf5VvET2NDTH7ifguMEI7OkuYN
qrXCnIA8U/rF4VMHA3viyE5u9UV4ISbW9bg7Mkx9+86cuEm8tgHmYtCULMC7BzMN
VoaS7k0wDYGD8cvh6oW+pc+0AbwuUC/zm59OoijAkcUxrD4KkRA+URLbbqeJAx5G
1J10/3H0I4liJ5ruX28lNTw0/+oPL6FRGRa0ht2qxipVIRboOn+bR2/bIdoNGwMF
UWxCldv5VD4ZDxXas7IAQ34b8cPrzg==
=AIGx
-----END PGP SIGNATURE-----

--2vlFT4VlBjIBHCeB--
