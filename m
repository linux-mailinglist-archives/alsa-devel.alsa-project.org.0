Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77001568671
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:10:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1095216CA;
	Wed,  6 Jul 2022 13:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1095216CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657105802;
	bh=+5ndkn9ElVjaJPL+iqLwYzl7r5tW7a9qgYYbETn7bPg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F0LpSalh5zqitVR35ZAD/Gb+4yUvbz28ZJvBFj9RXDlJqbCS7WeSWX9V8NzxuQh1M
	 egJWnLkVoPkKMh/iP8HtMDwErm4l8IWJUF62/relO86aiSK+FC1T9coe79XgMZueEr
	 QaQ96p4txL7AODPLwmu2wW4MOuAA9ai1L4Dpu8jY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55AADF80538;
	Wed,  6 Jul 2022 13:08:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10954F80548; Wed,  6 Jul 2022 13:08:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37FDBF800C5
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 13:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37FDBF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tR/bA+KB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA46961E82;
 Wed,  6 Jul 2022 11:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E355FC341CD;
 Wed,  6 Jul 2022 11:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657105678;
 bh=+5ndkn9ElVjaJPL+iqLwYzl7r5tW7a9qgYYbETn7bPg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tR/bA+KBRTaxAUH4pQtg/VermhBiqVnwV10f9+5wmUu3jLoc2uldC/VM4ZW1X8iRU
 ZnkMv1m64IW55LI0QiDuJNkGM3H4x1BWCPl1wFJZkCxIhxCZvT9E2r7MAtEtiYjNFi
 AbjgZAjSuTNJz5b7oPrRQnAvPpHftEButfoasvxQtQuKdRDMACgSn6Fvu9G96FA1vx
 Pel4yNRk1x7RMMtWqoiUmKhKwoacNVBq+0nori4n/cn70CB+ypcxLGhqH5c5r1uU6v
 i0w8dJod1N6sPgp7nkn60KpBmsQ6YvDzon2mPdVxmw6/BYTURX9QiCekd3kXDyDXBl
 RcwgNx1/AZadw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
References: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/5] ASoC: tegra: tegra20_das: Fold header file into only
 user
Message-Id: <165710567663.237380.16342780967175120353.b4-ty@kernel.org>
Date: Wed, 06 Jul 2022 12:07:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 thierry.reding@gmail.com, kernel@pengutronix.de, jonathanh@nvidia.com
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

On Wed, 29 Jun 2022 21:42:20 +0200, Uwe Kleine-König wrote:
> Since commit fcff5f99742e ("ASoC: tegra: remove unnecessary includes")
> the header file (which at the time was named tegra_das.h) there is only
> the actual driver that includes it. Just move the definitions into the
> driver, drop the exports and remove the completely unused function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: tegra: tegra20_das: Fold header file into only user
      commit: 6dbc34d9c31e71aeb8175ce443c11b9e19e9f8ee
[2/5] ASoC: tegra: tegra20_das: Remove unused function tegra20_das_read
      commit: 9a99b9b26451ca2a81867ce0cd8fe18dce856a8c
[3/5] ASoC: tegra: tegra20_das: Get rid of global pointer for driver data
      commit: eefaea93235523d248cc8cadcd6be9f47b03b9d5
[4/5] ASoC: tegra: tegra20_das: Make helper functions return void
      commit: a10a8b6661c478dac3a8c55ad41f5cb00779c6b9
[5/5] ASoC: tegra: tegra20_das: Drop write-only driver data member
      commit: fb617612fd8e017720d7fe907b22b4bb44027948

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
