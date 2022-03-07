Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D39E34D08B1
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 21:44:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A90717E6;
	Mon,  7 Mar 2022 21:43:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A90717E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646685869;
	bh=KPjTrbSp37sg80WJ3I6fvznHmg6f5wif6U21+HUCBmk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SlZnTmdaWxwpGBN2ML0nRfwa6IoD0a/7AbMAMhuq8dE+SPtVxesGiJDNrI8mptXA4
	 UNxw9sjqWbFcXZ/P0fs9QrObZw9la4CbEag+DTNOdOPjHa3U3Yo1R9J10pgXv+E5Y2
	 /gdi8JixJrP8Np3q5eUWjEcT/0fkToLnZBhT4NGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9AACF80588;
	Mon,  7 Mar 2022 21:39:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAB65F8057C; Mon,  7 Mar 2022 21:39:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1601F80552
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 21:39:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1601F80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NmjAQCvU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C02D6150C;
 Mon,  7 Mar 2022 20:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E624C340EB;
 Mon,  7 Mar 2022 20:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646685566;
 bh=KPjTrbSp37sg80WJ3I6fvznHmg6f5wif6U21+HUCBmk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NmjAQCvUN8VKi9AGyy2RzMWEFQp+q8Zx/sg49qprXVJFCt6tSK2r6RpdDdGOOPBHU
 3u9jj3OeMPlwNFx/OJ/05m8XsMv8l82br7GK+3RZt+t5NlvtVRUcWEcbTpq7P+Ufk7
 aQryuGm9nmL93K24Mv13SoGkPxuZED/0l0UmZKBtb9r/nLFt0oZV3hmXsFGbphDGFL
 swwylnJb23A3VHpKTDWvN5Ni3s5lr2KE27FugEyDE4ZBtz7zVgHM4LORjf1evYxAZ2
 jvZpU6tAhK89xnES9ZI6FcfBMEitJjoZJQKcWqdSHX7gXg91U4QcErZWXG+fb/C7ZG
 0wHm743P4zkUQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, derek.fang@realtek.com
In-Reply-To: <20220307102154.26065-1-derek.fang@realtek.com>
References: <20220307102154.26065-1-derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682s: Stabilize the combo jack detection
Message-Id: <164668556398.3137316.401333742593254454.b4-ty@kernel.org>
Date: Mon, 07 Mar 2022 20:39:23 +0000
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

On Mon, 7 Mar 2022 18:21:54 +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> Changes:
> 1. Revise rt5682s_sar_power_mode and rt5682s_headset_detect to be more
>    rational.
> 2. Manually set to the jack-unplugging state via rt5682s_headset_detect
>    during going to suspend. Close unnecessary powers and prepare for
>    re-detecting the CBJ during resuming.
> 3. Simplize rt5682s_resume.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682s: Stabilize the combo jack detection
      commit: b41d6195b2f0c5d5df009aa518958f3c46e66d9a

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
