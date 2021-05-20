Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5259438B8CC
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 23:10:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDF8F16A4;
	Thu, 20 May 2021 23:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDF8F16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621545004;
	bh=8ELMlxBpUUAE7ubz9VhApkiJhq+FPqvYh5sDquV8mog=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iVyvfMQJDCwSXO3msZ3RXynYmxIZxCjKOl68JJR7T43zlegYJGY5pgaLv1cgt1P5p
	 ubdAc3nVtQyqW3iDSwg7Gg9sVpgVHNO2j993L+yMXKA2qJyauBV8qRSaXtMyOoBkwu
	 im+FlaNXy+rjYIVM1yHVhPbhRO0pba8Z38nQ0R50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 603E9F800C1;
	Thu, 20 May 2021 23:08:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF218F80229; Thu, 20 May 2021 23:08:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54A38F800C1
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 23:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54A38F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="leBo93YJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 956B361355;
 Thu, 20 May 2021 21:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621544902;
 bh=8ELMlxBpUUAE7ubz9VhApkiJhq+FPqvYh5sDquV8mog=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=leBo93YJ55CgttPP6pHoPbXyLt4Ym7IO2Srph5Gz8wPur9dc2dCGiLMWWBi8VsUUM
 ZrXujb8yx0koSMCOjblPCCKm4dmV2i6A9gnOzvJojpKn7NhrJdL+ZrsgCMhqd2EQoc
 aZehVbn81PFcAkbfm71xtz0e5AUAcPFnL5TTftP4Ly+bS7xf55ognPcaRjp146mDQS
 6f3RvzNNkLIj9JAeKuPL9pHPiHPIVaugOOzHc7X8rkHOxglBOMcVxws+qlYFDprOgK
 g6N570YbnmiTXO2ABx7O9RwzQFocJynnL/dZhX7cmJ3EZ0xV6vT2MK64fe95Q0zAUe
 txwBZu3N+z1dA==
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 James Schulman <james.schulman@cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l33: fix an error code in probe()
Date: Thu, 20 May 2021 22:08:04 +0100
Message-Id: <162154465460.5161.4887908906712264006.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <YKXuyGEzhPT35R3G@mwanda>
References: <YKXuyGEzhPT35R3G@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Paul Handrigan <Paul.Handrigan@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Mark Brown <broonie@kernel.org>
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

On Thu, 20 May 2021 08:08:24 +0300, Dan Carpenter wrote:
> This error path returns zero (success) but it should return -EINVAL.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l33: fix an error code in probe()
      commit: 833bc4cf9754643acc69b3c6b65988ca78df4460

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
