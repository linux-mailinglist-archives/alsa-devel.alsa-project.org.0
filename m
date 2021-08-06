Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D96E13E2050
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 02:57:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ED84171B;
	Fri,  6 Aug 2021 02:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ED84171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628211478;
	bh=NGc/aeWRHl0yXsX3NxaKS5bqshbtpwJWMjuZn+arrpI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lPpi4adDoVrn0uCvqqCH2vZPaTks7u4WFRHHN109y3DsQz+NHohJuTZ3g9PjkFm05
	 RxnuNY8fEDU9FATSD2J+RT+IMRbvfySgAEJ65+sSv9dyMjg9WycUjXwxbTNSvJTV+N
	 6fYPL+EkJ1RhMHHVMZG1fwWcG8bGrw1sd9nBwKww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1E80F80169;
	Fri,  6 Aug 2021 02:56:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1F16F8027C; Fri,  6 Aug 2021 02:56:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 880AAF8014D
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 02:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 880AAF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="is155Ob5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F27561154;
 Fri,  6 Aug 2021 00:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628211383;
 bh=NGc/aeWRHl0yXsX3NxaKS5bqshbtpwJWMjuZn+arrpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=is155Ob5rt7FOkC4H6GZiOYklWUEZThFILyWLiWcwqMM9lopduau78x8fecSw2s9d
 r4zLNzUyQuZJWib0+D8OZbdj4dPDnooep7uBARzBcTNNllQzEui6GB/iaTVL+k4FSv
 MYKJvmFh5dP7eul87j4zMqM4MtwJZR+6VhklKLcl1OHLTHXbl3vYzK5HXX7wO5ushd
 Brwq6X/0J2ajcpy3C+m9aJzrTFSwl08BYGEsS6fm7R4vu6nw61qlhorU30C++JW1yH
 4LfaB2qb/SeN2yD2y5jzrnxlAQkmzvsc1mw973mzcMiPO6PVrmAxpFQrbnlz+WQwm7
 JndlM/M6TfrXQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 1/8] ASoC: cs42l42: PLL must be running when changing
 MCLK_SRC_SEL
Date: Fri,  6 Aug 2021 01:56:07 +0100
Message-Id: <162821106646.20290.11625697110600114933.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210805161111.10410-1-rf@opensource.cirrus.com>
References: <20210805161111.10410-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Thu, 5 Aug 2021 17:11:04 +0100, Richard Fitzgerald wrote:
> Both SCLK and PLL clocks must be running to drive the glitch-free mux
> behind MCLK_SRC_SEL and complete the switchover.
> 
> This patch moves the writing of MCLK_SRC_SEL to when the PLL is started
> and stopped, so that it only transitions while the PLL is running.
> The unconditional write MCLK_SRC_SEL=0 in cs42l42_mute_stream() is safe
> because if the PLL is not running MCLK_SRC_SEL is already 0.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: cs42l42: PLL must be running when changing MCLK_SRC_SEL
      commit: f1040e86f83b0f7d5f45724500a6a441731ff4b7
[2/8] ASoC: cs42l42: Fix LRCLK frame start edge
      commit: 0c2f2ad4f16a58879463d0979a54293f8f296d6f
[3/8] ASoC: cs42l42: Constrain sample rate to prevent illegal SCLK
      commit: 3a5d89a9c6fe306d35dce4496abbb464c1454da0
[4/8] ASoC: cs42l42: Fix mono playback
      commit: e5ada3f6787a4d6234adc6f2f3ae35c6d5b71ba0
[5/8] ASoC: cs42l42: Add PLL configuration for 44.1kHz/16-bit
      commit: b962bae81fa40fcce7662edcb1e426fa37d32abb
[6/8] ASoC: cs42l42: Validate dai_set_sysclk() frequency
      commit: 24cdbb79bbfe690f7fe87507dd0489670eddb5b0
[7/8] ASoC: cs42l42: Assume 24-bit samples are in 32-bit slots
      commit: c76d572c1ec82e305c97219e28952966958bc31a
[8/8] ASoC: cs42l42: Update module authors
      commit: e2f6867299ac85ce227eee18be11ce2c4a568447

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
