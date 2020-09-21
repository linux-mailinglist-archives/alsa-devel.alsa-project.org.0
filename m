Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 841D2272FEB
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 19:01:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14C6B16BC;
	Mon, 21 Sep 2020 19:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14C6B16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600707670;
	bh=vdPFk/m6WXsYIcu6qFyKO/XgYVqq9Qd/B4X1xYNRWVU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PFsX08r7ShJnTIag8kuBNRGO13Le7DEbz1dEczEhSrTeRe9KQ7S/x+xLCQA7NEeim
	 lSQIXZAtCpjAJGRwXYXfUrTY+3l0gr++l+rfgQlto9G3Yd6lbaI5jtDP+ddtmZGAD7
	 KOCpJwaopTLCzuv96X0wYXNOAQK5IAT3w8wBz6m4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06B70F8021C;
	Mon, 21 Sep 2020 18:58:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1477F80162; Mon, 21 Sep 2020 18:58:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44E64F800B2
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 18:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44E64F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QSdathMV"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 59410235F9;
 Mon, 21 Sep 2020 16:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600707515;
 bh=vdPFk/m6WXsYIcu6qFyKO/XgYVqq9Qd/B4X1xYNRWVU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=QSdathMV6G2YefHMOsPSyRat6SqNm+D2nhn7MI/vdo7f6n+roqTBaAKlAhSgSxFTV
 YdAKbDZIAZJa+S94v+dELfMlg5/PEMr0qjW+K33tsDz6U4ODLSET/QiGFTxik0kdPR
 BmafINv7tndY5+qR6fRkgIOLQV2MMQLA2klQicWw=
Date: Mon, 21 Sep 2020 17:57:43 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org,
 tiwai@suse.com
In-Reply-To: <20200918150130.21015-1-dmurphy@ti.com>
References: <20200918150130.21015-1-dmurphy@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: tas2562: Add TAS2564 to binding
Message-Id: <160070745846.56122.6048803274459562486.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Fri, 18 Sep 2020 10:01:29 -0500, Dan Murphy wrote:
> Add the TAS2564 compatible and data sheet link to the binding.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] dt-bindings: tas2562: Add TAS2564 to binding
      commit: 7a477213923fe07c17db7c3104cce6b316f75f60
[2/2] ASoC: tas2562: Add the TAS2564 compatible
      commit: 534c0f4391a497d10c2b5eb3df2016221b6ec4f6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
