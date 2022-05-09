Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEF35205B8
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 22:20:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE04016E0;
	Mon,  9 May 2022 22:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE04016E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652127615;
	bh=5r+YQgeW1TpJjXQKOxfi7MiQ8NqqFPbPAU1vv/J7FQU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=facNaKTtqW2NGjqrc40hrKYzk289JzXJ7bAmqRrIFQt0MM76I/59aClNkg4ck0+PZ
	 p4mQv2DvJJeX6TZrApxxlZPjqMCXVUB0OUoW2sT6TLBzzwsQnnB9rp513f58bEGai4
	 PcCwYjkWpDqa5Uz/DfLJ40FWWDwktBxt2gqdPO68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F96CF800D3;
	Mon,  9 May 2022 22:19:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A06FF8025D; Mon,  9 May 2022 22:19:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E806EF800D3
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 22:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E806EF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QPRDJ2bv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 201A7616AB;
 Mon,  9 May 2022 20:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCE6C385BA;
 Mon,  9 May 2022 20:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652127545;
 bh=5r+YQgeW1TpJjXQKOxfi7MiQ8NqqFPbPAU1vv/J7FQU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QPRDJ2bvabgYlX6LKEfpyrwMjv2jqsarmWLDw9dhI2OqL24XUdF61Nx9hDx+rXhQ7
 WkiCS3JMYYQ1qAUIT+FcQwHw66hvGbYYwtmb3eVQOL+Py3/qQsQ9QaS9KlQRV3dpnD
 45lw9GOYkgXr9tgJ2x7z2ooYSHURDsHH8Ce8cEDPawk76Y7IZc7PbeJAiPPbpzUMn9
 HKMq7xyqPRzT+J1hcbw8O32G+l2QhZ6gXR9Q0gP0JyfFMVOaPuh2WiFYVEf9MmYhmj
 Gywl/y2SfFiiF7PHMwiWoBWhA/OXP5H2BEDaJGxnUF3A2+IyYvWSQ4PeUobGyYmwnR
 KKOee1cwb824g==
Date: Mon, 9 May 2022 21:18:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Kirill Marinushkin <kmarinushkin@birdec.com>
Subject: Re: [PATCH 01/38] ASoC: soc-component: Add comment for the
 endianness flag
Message-ID: <Ynl3Mn6kBOOTyZaW@sirena.org.uk>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
 <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
 <ec86bdc6-b3c4-e595-02c8-e0687c442fd3@birdec.com>
 <20220509083729.GX38351@ediswmail.ad.cirrus.com>
 <901cb995-4a82-741e-00ea-a1c0b22ae749@birdec.com>
 <Ynlryv8fgKiHYXUt@sirena.org.uk>
 <8db9f890-1513-d9ed-58e3-5b402468288e@birdec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ynGECfZ4fyGoHAyV"
Content-Disposition: inline
In-Reply-To: <8db9f890-1513-d9ed-58e3-5b402468288e@birdec.com>
X-Cookie: Boycott meat -- suck your thumb.
Cc: oder_chiou@realtek.com, steven.eckhoff.opensource@gmail.com,
 alexandre.belloni@bootlin.com, lars@metafoo.de,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 kuninori.morimoto.gx@renesas.com, chrome-platform@lists.linux.dev,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, srinivas.kandagatla@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, codrin.ciubotariu@microchip.com,
 alsa-devel@alsa-project.org, bleung@chromium.org, cychiang@chromium.org
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


--ynGECfZ4fyGoHAyV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 09, 2022 at 10:11:03PM +0200, Kirill Marinushkin wrote:

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

> Without such a deep understanding of ASoC, as you have, I see a risk in a
> bulk enable of `endianness = 1`, the way we do in this patch set.

> Here, we enable an extra feature. Worst case, if some codec doesn't support
> the feature, we will have a system, which thinks that it's supported, but in
> reality, it doesn't work. And we will not even have a error message, because
> the driver advertises the feature as supported.

> Maybe my carefulness is not applicable here. I see that i don't have enough
> expertise in `endianness = 1`, to participate in making the decision here.
> But at least i want to ensure, that we all understand the risk.

The risk here is that we expose a preexisting bug in some CPU side
driver to a wider set of users, but those drivers would still be buggy
no matter what and may already be causing problems on some systems even
if that's not been reported so if there is a problem it's always
possible that we end up helping some users who currently have issues by
helping someone realise what the problem is.  However most likely nobody
will notice anything either way and most systems will continue using
exactly the same formats they already were.

--ynGECfZ4fyGoHAyV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ5dzEACgkQJNaLcl1U
h9C0fAf+OwC0Hyclmz9kzI3EP8ghe3HYRwAIswoc0yKCpX82o+C/6DhbMtY0/AYJ
qyMt5iL5/SZwAnLjIyw+NQoHH1zPiTzEAyCaq8oxQckhVSNdr13+HSO8py2aqb1p
FhtbV9i2Ca2KeoqoY8b2nlaeb/T7W/Qp/kotiDhWNs8e3vkmCDrEOnMM2YqDDKq7
oYAp/70UFzQYOTxeufAzBwLHJaoFaZr3lcjWqEqFEhwKNsUeH6tyRKrjcfk0uGBA
bOqFvErmGFp/zROiWzExGJjqcMfIPsvILaAEvdk+mVS1inVzm6HtmisCIUnilBIQ
+BxAMaDwZ6MRZ5nN/yRxMzzhvz7dnw==
=BAa2
-----END PGP SIGNATURE-----

--ynGECfZ4fyGoHAyV--
