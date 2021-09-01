Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D92DD3FE249
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 20:17:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84E0B17A1;
	Wed,  1 Sep 2021 20:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84E0B17A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630520276;
	bh=KlzFo2zJ7NhBhc9QV4PwhjlNPkGGI6TKBTxxQka9D2c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g9roEtj4NCv/Qt8OFD5svHXbrmZYVCTrav40o/HejwkG3I/QYD9SFtnkywVLCW22f
	 ijzPHCXw5l7SYe8M9FDkq9ONFY2cQy3NWElYKt3R5wUad83q3V20usaDg9mggO4iqv
	 UcYKn/Mp4pRkdeKSmFaH7EwxMoJYTltmt+19BW7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0869F804EC;
	Wed,  1 Sep 2021 20:15:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FC2FF804EB; Wed,  1 Sep 2021 20:15:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAD68F8020D
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 20:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAD68F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="td+0Ls7h"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D33B8610FF;
 Wed,  1 Sep 2021 18:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630520130;
 bh=KlzFo2zJ7NhBhc9QV4PwhjlNPkGGI6TKBTxxQka9D2c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=td+0Ls7hAihHu5SrrX8RkJXcstpMehCWWuTyQ3Wi8Lru0k7YOrHRriSZyMC4iEUj9
 j9N2U8Lg6mP5eMgaTP4/hZlSDhnzcNpIAxuSQgxJvDASZggSXhMtFRNSk9Ao3rER3W
 zUWbGJpOk5borZ9bsvwPCJ438S7i5R041P8bcTpw+8NbWM6YEjAJIs5V+R/q7AA3sE
 Qaxrf0sEQpi18oZMjOR13haEMp/szJQv1YMrMebUd1iTZBS1w1R5tTevRf1rK8GNJf
 ordDqAj1bywlEtGAEkZjuVXTpiwo8FwtABY3sUys2w9ocZQaZbW09YH8SEEEUDc0VN
 AlO+8KC1q0SAA==
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com,
	lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: rt5682: fix headset background noise when S3 state
Date: Wed,  1 Sep 2021 19:14:45 +0100
Message-Id: <163051912510.21630.7840903335943166080.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901100754.21045-1-shumingf@realtek.com>
References: <20210901100754.21045-1-shumingf@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, Mark Brown <broonie@kernel.org>,
 derek.fang@realtek.com, flove@realtek.com
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

On Wed, 1 Sep 2021 18:07:54 +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> Remove CBJ power off setting to avoid floating state.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: fix headset background noise when S3 state
      commit: 0866d645b76d062b7d55091fd6fb80f058d0c384

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
