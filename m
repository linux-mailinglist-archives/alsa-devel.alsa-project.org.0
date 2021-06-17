Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E8F3AB6E1
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 17:04:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC43A17B8;
	Thu, 17 Jun 2021 17:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC43A17B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623942293;
	bh=vK+BaafHwVGcr0zpgbzXQ6SqFlk87cv4GxHWHmPPsFY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KFBPxF2QdxbeNaQl8l1u7jtHyQ0dXrH6mXmF8vsb0oTrRB4v5k4D028FDknoWkZIl
	 F7sYsV8d4gBDJtzexuKgSlwVei360UQJ95UZefeeeIT1E80h5U+s95rZc+rqBgsWg3
	 1jtAlxfvOkw5WI0j/SczJNP2P0saSgIe7xeXpGhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58947F804E2;
	Thu, 17 Jun 2021 17:02:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DDB8F804DF; Thu, 17 Jun 2021 17:02:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5F56F804D6
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 17:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5F56F804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hxTKqMRc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5EE2610A3;
 Thu, 17 Jun 2021 15:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623942116;
 bh=vK+BaafHwVGcr0zpgbzXQ6SqFlk87cv4GxHWHmPPsFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hxTKqMRcgqExvCOa10cMO1C7QrrP9gJbDakRKQ4Va1VU9rhKtpiHowIz78UvZKzFb
 fNaAX9zIQYynX5eH4CsY1GV/n3D7U4Nay2lQq2M1MiZMMBRGqZGYq2OhaAV0KRL/G3
 7finvwxubWrStFnLuV98OAbbw/IvGbiIbsZMptwVQr4S2lTM+ORC9v+Ve9tSU9cskH
 wTxHq1aTXZjzbmY//aYVn5Ytoc7a+AllML6PaTknHlC5BgDJRrqc2V39uLCM/I+dn0
 5kXRUyBOVGNjBAYjQhxc4k/GSIKaXQtJIyjkTblTqo2NMyvzIVqDqOF0c9uPI0BMsw
 YYmqXLqZ5ImXA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 alsa-devel <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>,
 Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] ASoC: soc-core: Fix the error return code in
 snd_soc_of_parse_audio_routing()
Date: Thu, 17 Jun 2021 16:01:18 +0100
Message-Id: <162394075660.19104.12816220042853507762.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617103729.1918-1-thunder.leizhen@huawei.com>
References: <20210617103729.1918-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Thu, 17 Jun 2021 18:37:29 +0800, Zhen Lei wrote:
> When devm_kcalloc() fails, the error code -ENOMEM should be returned
> instead of -EINVAL.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: Fix the error return code in snd_soc_of_parse_audio_routing()
      commit: 7d3865a10b9ff2669c531d5ddd60bf46b3d48f1e

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
