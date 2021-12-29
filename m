Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3152F481385
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 14:30:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 930EB1787;
	Wed, 29 Dec 2021 14:29:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 930EB1787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640784649;
	bh=iI0QNMr+d99BTsr1DwhYBYpa3YGFzsYY+Ie/3TQ+VvQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+I17h59nivdEIUQ35kd80WlgZS567kDPise81WgEH7qDKOaWAuGxkJ25XVmEGpWi
	 OfrmIG7KMLJh+jY48RnTg/cR0Onu1GXsDNCaDKg9mZHQ8sDAHL3g1sCnzQR2PmjB/8
	 yoHh8za1ezXK/0OmJLPGlZcPAdQCkJE5yR8sr8ts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBFC7F80238;
	Wed, 29 Dec 2021 14:29:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 984A5F80237; Wed, 29 Dec 2021 14:29:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A470F800CE
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 14:29:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A470F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cnJyOPGy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D53C1614CB;
 Wed, 29 Dec 2021 13:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86405C36AED;
 Wed, 29 Dec 2021 13:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640784573;
 bh=iI0QNMr+d99BTsr1DwhYBYpa3YGFzsYY+Ie/3TQ+VvQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cnJyOPGyCKbtR5SsrWMDtjRlef8zvXakHhSWowHLaXpthWWA3vGYhsM6+csXt0l27
 qZ6o2+YzQHyUV2z47ziTP06aaVL2CaiCYHHZd59Xnxlxw0Yt85qnjyyJalFiid3jGt
 B5rGwEKy0IXocpGSpwRGguXuMr6gUdJn/hrbXEHoajOjXw89vM8q+9MuF++Mxw/Rx5
 TG9AL6ZtDKTlvK3bIle64CaMdwOCq2xx5++u61AMmhnHHWWNCF+2g7rX4nZqHnmyEd
 /ciINCOJg3IU1Lte0unOky1FEPmwP2W0ab1jPPG9c9Vcep5GZsbhYm3Ulxyql59hE0
 SiszNz+7b/YVw==
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com, lgirdwood@gmail.com
In-Reply-To: <20211227055446.27563-1-derek.fang@realtek.com>
References: <20211227055446.27563-1-derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682: Register wclk with its parent_hws instead
 of parent_data
Message-Id: <164078457127.1246652.17415341942643132462.b4-ty@kernel.org>
Date: Wed, 29 Dec 2021 13:29:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Mon, 27 Dec 2021 13:54:46 +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> The mclk might not be registered as a fixed clk name "mclk" on some
> platforms.
> In those platforms, if the mclk needed to be controlled by codec driver
> and acquired by a fixed name, it would be a problem.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: Register wclk with its parent_hws instead of parent_data
      commit: cc5c9788106fb1b9e03c8c57d8d7166073a54416

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
