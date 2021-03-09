Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C53E332ECB
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 20:11:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AE3B186E;
	Tue,  9 Mar 2021 20:10:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AE3B186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615317065;
	bh=4/ckH8xZoXSICajXB+7g+u4ZkL+N5xAUWPghH9G2ul8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LX0mNCYj6R7+eGdhFYVJqtOjulaErCtA5v5zuDRKHro46QcvBY5jZRumXBo7qTgeR
	 jj2IKSyXaeiUY/kQ/pvlK0R1kNDIxNDAD3i7C8Mln2zFKXfVGtM2DF+2A5Adb4dQzR
	 ErfpTwvLAMH2K8nYRZbVa7dfygI9qHxu31WwdgTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF212F804A9;
	Tue,  9 Mar 2021 20:08:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58923F8049C; Tue,  9 Mar 2021 20:08:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24FCCF80431
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 20:08:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24FCCF80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q70v7PtO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4B7F6523D;
 Tue,  9 Mar 2021 19:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615316884;
 bh=4/ckH8xZoXSICajXB+7g+u4ZkL+N5xAUWPghH9G2ul8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Q70v7PtOqj//DVDBeRJ9Q1n2HZsu981F7gXcvAoCcKgaoEmR2kapvcta+npqEOqvl
 KRT08jcUlAvkwCFiKmpHE04XpvUGnlGIv6MaTsiyA2rVOz/vTPamIV+k05P17uhTM6
 w2Sr0pZFuY+k7XhOOu9FYiP8bxAbpndmC5qb0zlq0LNLAd3/XavXlKNgSRNT68FOV4
 C/xhU44pbGN3wF7xfjB25/Ai4IWS4TTBrUUilRpTQLbhoWa4nC0m4cqcduKPCTYBWG
 LWKy6DjsXABhwJWthQEeb8laSwqYBG2TOzsVrZHMF2FfhDji2wiVjLq/x1+YrTNaOq
 Ffw1NJjJGGzDw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
 James Schulman <james.schulman@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 David Rhodes <david.rhodes@cirrus.com>
In-Reply-To: <20210306185553.62053-1-tanureal@opensource.cirrus.com>
References: <20210306185553.62053-1-tanureal@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v3 00/15] Report jack and button detection +
 Capture Support
Message-Id: <161531678409.49117.4460920508176091644.b4-ty@kernel.org>
Date: Tue, 09 Mar 2021 19:06:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Sat, 6 Mar 2021 18:55:38 +0000, Lucas Tanure wrote:
> Here is a patch series for reporting to user space jack and button events and
> add the support for Capture. With some cleanups and fixes along the way.
> 
> Regards,
> 
> Lucas Tanure
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[06/15] ASoC: cs42l42: Remove power if the driver is being removed
        commit: 0e992635233c909652b87f1a84775746e2780306
[07/15] ASoC: cs42l42: Disable regulators if probe fails
        commit: 384c0c11be3f4c4bd28196f97507788cc84dd5e1
[08/15] ASoC: cs42l42: Provide finer control on playback path
        commit: 48a679742612308b320f1ca89366ee7fde04f547
[09/15] ASoC: cs42l42: Set clock source for both ways of stream
        commit: f1fe73ce62864cb48e603d61a3936b475ba5bbef
[10/15] ASoC: cs42l42: Add Capture Support
        commit: a6ea36692a4846d9470bdeeb90081e1dc5144b95
[11/15] ASoC: cs42l42: Report jack and button detection
        commit: f3f6f77beaee1b955ea835358e4c3ab1bbb56927
[12/15] ASoC: cs42l42: Use bclk from hw_params if set_sysclk was not called
        commit: 8ecb782355f30cfb207bffd5d04c4c5f2ac98ae3
[13/15] ASoC: cs42l42: Wait at least 150us after writing SCLK_PRESENT
        commit: 43cb98d6ba84d8917f377b5720fb1451ce86de13
[14/15] ASoC: cs42l42: Only start PLL if it is needed
        commit: b5019672a0526a2e0de6843734d1b7687f138b02
[15/15] ASoC: cs42l42: Wait for PLL to lock before switching to it
        commit: 5974fb2911b92b1921ab4aa35aede7454d72052a

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
