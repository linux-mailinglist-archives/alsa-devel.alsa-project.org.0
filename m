Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BEC55384F
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 19:00:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39D2D2009;
	Tue, 21 Jun 2022 18:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39D2D2009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655830832;
	bh=gz5wvjLREIHx/PcjdvwdM3efMCKqQmb35YJK7xuaEyQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OznETHvnGWa1wHsHKiCaEpo+4ndjflE2iopSMo+DLOudJ/vNvU3lBzJapACVKu4Zb
	 NmBfzoWVBM9sy36sdwEjE6it8dtGJ8qQAxAB9TvgyheOFDL6tI4il/uZKgzv0fdEEA
	 vpbCYPk3WDp6Dl2V+fKtRIgANOFbmtUBT2sqdH0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 951A8F80104;
	Tue, 21 Jun 2022 18:59:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AFEBF80152; Tue, 21 Jun 2022 18:59:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38C7FF80152
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 18:59:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38C7FF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dWDVvb0w"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B291B81AB1;
 Tue, 21 Jun 2022 16:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DAD2C3411C;
 Tue, 21 Jun 2022 16:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655830766;
 bh=gz5wvjLREIHx/PcjdvwdM3efMCKqQmb35YJK7xuaEyQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dWDVvb0w24LzUtfi+7R0D41bEpMfhRNyrtZiLkHV/ks0pBQLMb6tLiJtdQugmYK9t
 OAiX+XmTyG1pG46Y6r176B1iBf0FG8fEiApZcTS/EySP5+kIjOivluCK9Tu4rKq3/x
 dIQUtlx9tftnh3vkxUcyLvFVpgYevuDmSBC630VZUoswDc3tfo08ka8pKN2W0Id84j
 fyzssS+5bheE3zt6tIKq3fIkcgqa63iOxhoIZjcWVJ+jSjrsWYQiVOJbI4NFq9XTYC
 ZDh2zmb7xza9aDqqeu4zQwrwyV2ubIhECie3Sjfx0A/dVx6i9Tg2W6SGrbJupedU8y
 3gifDCRNWkrug==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com
In-Reply-To: <20220621102041.1713504-1-ckeepax@opensource.cirrus.com>
References: <20220621102041.1713504-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/4] ASoC: wm_adsp: Fix event for preloader
Message-Id: <165583076515.271995.18026911532153153999.b4-ty@kernel.org>
Date: Tue, 21 Jun 2022 17:59:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, james.schulman@cirrus.com, david.rhodes@cirrus.com,
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

On Tue, 21 Jun 2022 11:20:38 +0100, Charles Keepax wrote:
> The preloader controls on ADSP should return a value of 1 if the
> preloader value was changed, update to correct this.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: wm_adsp: Fix event for preloader
      commit: 81d74ddae83fbd85c9006835f36c362114127a7a
[2/4] ASoC: wm5110: Fix DRE control
      commit: 630cc5983740d784a1a6458f9dc2112c43fe0931
[3/4] ASoC: cs35l41: Correct some control names
      commit: 87912e97a1678d62877aab353ecfd201bc92b372
[4/4] ASoC: core: Add new SOC_DOUBLE_SX_TLV macro
      commit: 6b183919f7051294dc5fc331bb608d5d7f29f5da

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
