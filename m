Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3455B5E63A2
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 15:31:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D90C201;
	Thu, 22 Sep 2022 15:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D90C201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663853509;
	bh=wInR8uefJjXvT2SZqgMSw3Aeupzu3gpSe4DZ3KoW3tA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X/5/wsJoCbLpIXx+BosbBrlwoAzm6hgtQT5B2Jeis0jU0D3mymzV6bnp2rX1PDfP1
	 vwKaLPpr4AVVi9amj63DH/B5usIMj33CH049lALU9inqlN2VjvgmwW3lmGY3/EvrST
	 E4pmjiGBakCAmzNtrtsziY04Jp4MfZehcGy+uUzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB499F80107;
	Thu, 22 Sep 2022 15:30:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FDE7F8027B; Thu, 22 Sep 2022 15:30:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86D15F80107
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 15:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86D15F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OkSovZfJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 378E062B69;
 Thu, 22 Sep 2022 13:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C57C433C1;
 Thu, 22 Sep 2022 13:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663853443;
 bh=wInR8uefJjXvT2SZqgMSw3Aeupzu3gpSe4DZ3KoW3tA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OkSovZfJMK4g4EsJz614MUvw/hkrQWiiVQk+5TwUDSbpCcOEtOV06QcIzUkTwPj5t
 TbgvWkU9yWEcMYNbeLPhT7WXNNsUFhDePSI4GKqAsA0MxsQ05qiKMRX7+ajfpyiR7S
 HUxijEuj/aJa0B/Rvnasr8LDu/b0egqirjTslGPY2ztudcRIAw+/uYWaM+meuVU0JZ
 N98OcZouXmZRU7fGYFPGRRVUHDAcHlweJ/puRpGQ3cssM/wOk2iIXn3oPQKvXwqiJm
 b2Fl7XWcFA6JGbHQLUl4AXvqEjkBlQKHBWGghmh1xMD3KANa6xjgTz6G9ZCy+E7SmX
 vx2okfCTzm1MA==
Date: Thu, 22 Sep 2022 14:30:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH] ASoC: mediatek: mt8195-mt6359: Use snd_soc_pm_ops
 instead of custom ops
Message-ID: <YyxjZ9nCBdVovkVs@sirena.org.uk>
References: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
 <YyxGXXSp2JD9a6ah@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aiBfMVsZx4xOWY8C"
Content-Disposition: inline
In-Reply-To: <YyxGXXSp2JD9a6ah@google.com>
X-Cookie: One FISHWICH coming up!!
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


--aiBfMVsZx4xOWY8C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 22, 2022 at 07:26:21PM +0800, Tzung-Bi Shih wrote:

> snd_soc_pm_ops[1] sets some more fields.  I'm not quite sure whether
> it would introduce any side effect or not.  Perhaps Trevor could
> provide some suggestions.

If it does it should be to fix isues rather than introduce new
problems - I suspect the other operations just don't work
currently.

--aiBfMVsZx4xOWY8C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMsY2cACgkQJNaLcl1U
h9DpzQf+KMnb+RybmIF1Eut4fCQs9n6503YHXYF9TAwZ78CkI2/5PP9Gc1buqBVz
aPhF11fLUOU6OSXLW+r3Cid7wz+1+zerw13xELulJFJXUYYyFdgHjtvaphjtsVWA
jKON681p0xOVi9K0fScb7wOi21LiClD0c5hSqZuNzJb9Vvsk9+Dxo/o3neWoAJL/
8apxKqDgxkgKSzRowDasy3Ika9NFuPG+3oO20r/MX2D1yo4z410g+xPudcE4Zrzt
IzzY/IzjFkzmeEceJN1Eu63nTxXoxfUPqD3kuBVZUj88SOSK8VSxMHnWY4grR41P
b1DIq2VUpjWPB64v2Zsi+OyPQkT+aA==
=04KX
-----END PGP SIGNATURE-----

--aiBfMVsZx4xOWY8C--
