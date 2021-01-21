Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B922FF4CC
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 20:41:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 659E11919;
	Thu, 21 Jan 2021 20:40:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 659E11919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611258101;
	bh=vQNTs0h+6FxGYAZiKCnKfmlanAmoHs/5OzhtkdW24QI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gPN6xnrW3dFTH8MUmYDBDjC2OB4O11CzNu3+3MOnsDzSIGV7wXRay9U51vr7mCW76
	 UdBfAG+2cVa2KoTKm59+eeS6uojhWl8e1+AfODQyLbMz7xTip4g9+YfojfIk39f6lZ
	 3g38Koypgutau3vAdC7aDyM83rO0j2nMlkCKsmGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF1D7F80272;
	Thu, 21 Jan 2021 20:40:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D286CF80164; Thu, 21 Jan 2021 20:40:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC6C2F80164
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 20:39:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC6C2F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jpCgxF+B"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 876A623A40;
 Thu, 21 Jan 2021 19:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611257993;
 bh=vQNTs0h+6FxGYAZiKCnKfmlanAmoHs/5OzhtkdW24QI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jpCgxF+BAEuUUE5EOTrq+spkszfuqtEzLQ5ugUO71qJHu4S+pgjitb3OJlymOY2cc
 AVHbFAd4/wNa+VBkhc5UBIzSY34BDFr2zx/0GUQBfP5/Ieb42u9m9+eS20/PBjIpC1
 M2MVGYU7QOiEWLEJxcsxJ7/vjTY6FfYvSHRmzltWmwOg2h0dt7fkyWNplAFCYBIi0M
 Wb9ClZO7H7E4M5yq/M8DGpM+R0ymKRQOYobN3k4vA8+cZD338kLTeejzbln9uxI1hz
 Ez/T4vKN4F1TGn18jQSJkAdeJvm+0Md6mWKyABD9tthxyRcjuZI/hREoxVzqUT4FlW
 dlo7CzsXsgkcw==
From: Mark Brown <broonie@kernel.org>
To: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20210120152846.1703655-1-amadeuszx.slawinski@linux.intel.com>
References: <20210120152846.1703655-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: (subset) [PATCH 0/5] Add KUNIT tests for ASoC topology
Message-Id: <161125795422.35635.8958502643983739917.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 19:39:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On Wed, 20 Jan 2021 16:28:41 +0100, Amadeusz Sławiński wrote:
> This series adds unit tests for ASoC topology.
> 
> First fix problems found when developing and running test cases and
> then add tests implementation.
> 
> Tests themselves are quite simple and just call
> snd_soc_tplg_component_load() with various parameters and check the
> result. Tests themselves are described in more detail in commits
> adding them.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/5] ASoC: topology: KUnit: Add KUnit tests passing various arguments to snd_soc_tplg_component_load
      commit: d52bbf747cfa8a2988289009241214a84982cc7d
[4/5] ASoC: topology: KUnit: Add KUnit tests passing empty topology with variants to snd_soc_tplg_component_load
      commit: cec9128dfcf9101f903470e43d46278e5b07ef24
[5/5] ASoC: topology: KUnit: Add KUnit tests passing topology with PCM to snd_soc_tplg_component_load
      commit: 3ad8c8e9efc53d14d928b84aabe1a27dd5d3171b

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
