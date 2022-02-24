Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BCB4C2B99
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 13:24:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5B7118BF;
	Thu, 24 Feb 2022 13:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5B7118BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645705444;
	bh=5Q0siXaaNwrf7iH3McYzCVp+6p9LYGLMu46CcaXcPe8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QPQ6bglH5NHrHk0kWrqYQJcb4iZUCizm7MTCGQZbbuLhKDeZcbMx98CsZ2ZyK+jho
	 TjPP4ZfUZcMBCUS8U2NhphLhC2998IuskK8hyHqGU+GjovT2rJdvlhE+HOrVGEks/d
	 6zLLeiknXtTEaYOIc/a87k99MHTQBpktdDHFQBkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30E9FF80519;
	Thu, 24 Feb 2022 13:22:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 564F3F804D9; Thu, 24 Feb 2022 13:22:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D528F804D9
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 13:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D528F804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lJk/SVCJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F16B26186B;
 Thu, 24 Feb 2022 12:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DBEC340E9;
 Thu, 24 Feb 2022 12:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645705335;
 bh=5Q0siXaaNwrf7iH3McYzCVp+6p9LYGLMu46CcaXcPe8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lJk/SVCJYiTbvnzWeAWtOTPXg8dFh057UFAUV3TPBtf0Hxh8FXL2uiDxnS5KFGFpQ
 vj+KzVi2d02LEM38xdGQwIoWF8xP/XmDRdtIqrQZfQQrXPINttmvEDVHWKrJmC+H1J
 TDl0HYqI52P5g9JzWTWEVpbtKST/EqI+FnqN//ND0LXzIfeXQmIe0hHq0pwEWJGyc2
 fxKv6BDymqrVZD89+USR58upube+xWQZjwv4Sx9x7nyrVa+lZa+z3Gh57D8hYna/lI
 bNxmZHELa+zTfKetokKufHtvUE/kvUuSeXClVwAWefMbKXBpEwir/LKk+Tm+ASTNgg
 YgpGFGldksvfg==
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com, lgirdwood@gmail.com
In-Reply-To: <20220223101450.4577-1-derek.fang@realtek.com>
References: <20220223101450.4577-1-derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682s: Fix the wrong jack type detected
Message-Id: <164570533337.1194769.2622352254259019677.b4-ty@kernel.org>
Date: Thu, 24 Feb 2022 12:22:13 +0000
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

On Wed, 23 Feb 2022 18:14:50 +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> Some powers were changed during the jack insert detection and clk's
> enable/disable in CCF.
> If in parallel, the influence has a chance to detect the wrong jack
> type.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: rt5682s: Fix the wrong jack type detected
      commit: c07ac3ee76e5e5506bca9c03fbbb15e40ab28430

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
