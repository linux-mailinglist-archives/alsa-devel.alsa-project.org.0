Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8255F9CF6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 12:40:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 306962079;
	Mon, 10 Oct 2022 12:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 306962079
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665398419;
	bh=sQ1OkvIlPwu55py2RfIDT2mp+pYKyD2jg0n/Gy6KF6E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QBVW2CZAacXnVLUPFZLjDWqLexgQCK6z4pV2XS+n0zZ52M5GUJzZ/oEe7HdfixC17
	 7UhNOcBoArUfl7+NbcZ2rRARzVwOCN7OimjDA9iSFLEZvTrTeIsdot/1EF9F54hewN
	 4a0rOBrP47SvF/Z0mePpjS7SrUzijRTrYjYzxTfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 937BBF8032B;
	Mon, 10 Oct 2022 12:39:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C5D8F80155; Mon, 10 Oct 2022 12:39:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEA25F80155
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 12:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEA25F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ct9Sv168"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C4FB8B80E70;
 Mon, 10 Oct 2022 10:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EA9C433D6;
 Mon, 10 Oct 2022 10:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665398355;
 bh=sQ1OkvIlPwu55py2RfIDT2mp+pYKyD2jg0n/Gy6KF6E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ct9Sv168uYz7ucQ8FGO5QcEAhH6uf6jRcYXkq7u70CqHC+ZcSOSKA8V6bAVN6swlP
 /35COFmZ3y0YADDE/hAmq4qSlmj9r9ceIqHWlK85egxbZHw14sszfQqZClSgj4kj0O
 I7NdXZPvLTYUiOefVhZcNG1mtPmE/tT/e7hXOr1UzX4zoKcYS15cxZS1sMFaufS3ZH
 LPE2Cpbex3czfx/qJSSAPmE1eGxgbmF7EywxaCo+mThGu8/6h8UNcfoQN6kvzPyPaN
 iogbFid1GUpKMoIHXEGxpmvxNmZyTvY1d9oobOxCIh0Fie4cqc/jpYn03/m+wcWKZi
 sM5jaGmYJVvEA==
Date: Mon, 10 Oct 2022 11:39:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Qilong <zhangqilong3@huawei.com>
Subject: Re: [PATCH -next 0/3] Revert old "Fix PM disable depth imbalance in
 wmxxxx_probe"
Message-ID: <Y0P2TEQOADj8XsrK@sirena.org.uk>
References: <20221008134358.131712-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="10X8khYOYumKfxxV"
Content-Disposition: inline
In-Reply-To: <20221008134358.131712-1-zhangqilong3@huawei.com>
X-Cookie: This sentence no verb.
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, jeff_chang@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 ckeepax@opensource.wolfsonmicro.com
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


--10X8khYOYumKfxxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 08, 2022 at 09:43:55PM +0800, Zhang Qilong wrote:
> Both the old and new patch have been applied, it will resulted in
> redundant calling of pm_runtime_disable when error returns. We Just
> revert the old three patches to fix it.
>=20
> Zhang Qilong (3):
>   Revert "ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe"
>   Revert "ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe"
>   Revert "ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe"

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.

--10X8khYOYumKfxxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmND9kwACgkQJNaLcl1U
h9BJYQf9GrY0PICzOGqLRaatIWi/YUjWoERus+DL21I7mOFuh63TBLZbpA/I+tlC
rnOjbk3uU4HLFhe3UXMKdu1yyDA+wndhRPRFHbczIOcP5WajkAD3Sd3nl1K0OlEU
9lZUHCOcRWNmMHrQ2R3NwUdXJVY3gLvfVTgzbCPQi+Hf9NNE3x1qlEjkiMMlZJos
VTr/k/87TwZxmktcR4Xm4nrCtGTCGb+xQR5aqwGyt2ZDwK2WevgMGP4Xs3Mu6zcK
bKct17xpNiwbh9r+ur+w4axgVmTImuppxyL/7mxGR8TUTJIFQoLNe7oTnYvfBiPb
cX4tXcK/KPCuvJfadG0yWe98ujTYog==
=+o2G
-----END PGP SIGNATURE-----

--10X8khYOYumKfxxV--
