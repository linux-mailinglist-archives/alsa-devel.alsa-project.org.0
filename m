Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66348568B
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 17:14:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB5641A23;
	Wed,  5 Jan 2022 17:13:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB5641A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641399246;
	bh=OLmJ52CHuqXo//NMSkzVPxjjQ+LZ6ErApBM18DGlsaY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BPdENZzLJsDFWRrBbHlApi8wy5dQwKqluoghpfTn0XWMY78za9HsUXTf9tqW3xmRt
	 8VbwWumB3zfutS1oLTmTTw72Sug+DRrxAc8ubYyJKExfJHwSSVTAsatnYzDZfrr/cJ
	 qTxjMVqYrSerVZGxcFxXIPvmVHkCFhrNon/ny73I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EB0BF80167;
	Wed,  5 Jan 2022 17:12:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF46DF801D8; Wed,  5 Jan 2022 17:12:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ADCFF8007E
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 17:12:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ADCFF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lNHwHhXX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0CEF8B8196F;
 Wed,  5 Jan 2022 16:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961A0C36AE9;
 Wed,  5 Jan 2022 16:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641399167;
 bh=OLmJ52CHuqXo//NMSkzVPxjjQ+LZ6ErApBM18DGlsaY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lNHwHhXXRq58QzbkbxrqfaHb2EOh2jkyqOjQVKL5EX//u+UePKpkkDqvfbAwINM+H
 9W6yWgarzBTw+rWIGQSE/gu+V1/pap8ysQ/mYFNUp+ITTXsfkq/hHR/PKe2bOf+9vW
 LQmQb8hwGlj+DZUKy3hlndvss5NOK1R08Rd+S/ynqLWjzpvCm1/L80O+e37aWMAdzG
 Lw2khzgVdpxTHjbZ8gTp3Sz1W9XMGobxm8ueCXwmEkhZuTx8RYvhw4r3MJaq7pQ990
 EgW4kB52B35eGPl/SXnFS+mZTHonRKFUryg1TuSsZCcMih/f4zpmHOcWMj0YG62YSN
 PmgqLI/1jeMjg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
References: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/8] Add low power hibernation support to cs35l41
Message-Id: <164139916633.3066423.305146285867242412.b4-ty@kernel.org>
Date: Wed, 05 Jan 2022 16:12:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com, david.rhodes@cirrus.com
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

On Wed, 5 Jan 2022 11:30:18 +0000, Charles Keepax wrote:
> This patch series adds support for the low power hibernation feature
> on cs35l41. This allows the DSP memory to be retained whilst the
> device enters a very low power state.
> 
> Patches 1-6 can happily be applied straight away and are mostly bug
> fixes to set things up for the series specifically around getting the
> cache handling corrected in the driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: cs35l41: Add cs35l51/53 IDs
      commit: dcf821319474edde7e85b95608a4539703a2b67d
[2/8] ASoC: cs35l41: Remove incorrect comment
      commit: 4e7c3cd87db8d9350062a25a8476f90fd1cbc4c9
[3/8] ASoC: cs35l41: Correct DSP power down
      commit: 56852cf4b2179fb90068a49538501f31c2de18ea
[4/8] ASoC: cs35l41: Correct handling of some registers in the cache
      commit: 5f2f539901b0d9bda722637521a11b7f7cf753f1
[5/8] firmware: cs_dsp: Clear core reset for cache
      commit: 7aa1cc1091e0a424e9e7711ca381ebe98b6865bc
[6/8] ASoC: wm_adsp: Add support for "toggle" preloaders
      commit: ba235634b138cd9d012dbe983e7920481211e132
[7/8] ASoC: cs35l41: Update handling of test key registers
      (no commit info)
[8/8] ASoC: cs35l41: Add support for hibernate memory retention mode
      (no commit info)

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
