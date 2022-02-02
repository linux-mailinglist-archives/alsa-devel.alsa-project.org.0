Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7132D4A717D
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 14:25:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED1FE1720;
	Wed,  2 Feb 2022 14:24:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED1FE1720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643808326;
	bh=o6TpSr4Ebs/+aowtxCYwb/J3cAptbddaw6esQMuHyjM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tbne5gVZ+MalRjXR9/ct+ny/DHBowz5fNRlwIjkjhawUrXCvcCYg9ddgs0S/5OVEe
	 BvH7a3vGmW8USVrVWPNabwJyeVIdF51mmwf5q/AinL21Vi76lND/HBn/ZXiOi8oOWq
	 jCoMHCjgqGZCTofq8ON1uj9YW7ARYXvgMILz4Gfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62FF6F804B1;
	Wed,  2 Feb 2022 14:24:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECCDDF804B0; Wed,  2 Feb 2022 14:24:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF674F80171
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 14:24:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF674F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Vowr6Kxs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 949E1B82A30;
 Wed,  2 Feb 2022 13:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1D3C004E1;
 Wed,  2 Feb 2022 13:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643808249;
 bh=o6TpSr4Ebs/+aowtxCYwb/J3cAptbddaw6esQMuHyjM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vowr6KxsTAFZ/Qbfyh3ZFG4lXeNL8GcrZobttR9UEm5bZ8uQZ83SzEAn+dNLbWncm
 hrDQYW4JLHTeC3hVZmWpdDpuWoIZuoKdnVSBZJCJMIwCLM9Ck3yJUpTNtRNFc9bQex
 p4CZaRPcczfds1+r1+0JfRAOHmeNKVNTSihX1Bv9SO7TRImvfynQ6qlcQVj8/hyUSg
 bP/ekIefc9EpzlQpqtRq8fvbg+zRwEmdgWRakpvYr7YsZn+QGOBcs584lodGu0MFTS
 WqFoEbRTYO+FHFpA2UOssRwGLcZAgJ6jH30bqZij/s9icsa2KNTrXhW4jzZgCUBMR8
 nWofKzcMsRhKg==
Date: Wed, 2 Feb 2022 13:24:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@protonmail.com>
Subject: Re: [PATCH] ASoC: tas2770: Insert post reset delay
Message-ID: <YfqF9Da6uVHUEA7G@sirena.org.uk>
References: <20220201234612.74401-1-povik+lin@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XCXfCLWUe2PIQvtF"
Content-Disposition: inline
In-Reply-To: <20220201234612.74401-1-povik+lin@protonmail.com>
X-Cookie: Quack!
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Frank Shi <shifu0704@thundersoft.com>,
 Ye Bin <yebin10@huawei.com>
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


--XCXfCLWUe2PIQvtF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 01, 2022 at 11:47:18PM +0000, Martin Povi=C5=A1er wrote:

You've sent an encrypted mail to a public list, perhaps someone can read
what you've written but I can't.

--XCXfCLWUe2PIQvtF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH6hfMACgkQJNaLcl1U
h9CFLwf9E1zLiYCHBrbPXnsb4rsXtr1d9L4C2s44AaRo6tRmH+4UfOg9ZsG8NXgq
0oM9GXK5Al/+Z8qPD8oKpqS57GjDUWviB7e/JE+41RQ/vg91PSmq++/JhAICeN7n
PBX78DFBdQg7+yNT//TZ/L5/qZUJlPku0KEuNHHUN7TrsyHsPwaf5iEvFc8cHnd3
2ih85rDTS8sUUldB9+5vjwAZyJiVaxlzzFZ0/Fz/eKud2FsuQ4R1pMI7mEwLZQMr
rOBoyZNTwwKxt+VjTfwzFJ8EKXvqulzfCmCulzcPk11a+Px3P7fNmdvXxcpRrbun
SYkRsV72/p3UIM7gslaZ5g6hAwhjeg==
=9Mrz
-----END PGP SIGNATURE-----

--XCXfCLWUe2PIQvtF--
