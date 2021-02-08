Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7160C313DC7
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 19:41:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97457169A;
	Mon,  8 Feb 2021 19:40:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97457169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612809688;
	bh=a6Ptbno+MD4MJkCP5JROC9r9dgS4dLXVT5U1LzXU2K8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HrE9X0ebfSycw894B0xNFiLVCfGToctAGDrcbK4xlLeO2Aq4Q9ygsjGYh0FVRPeni
	 hYQACn21qrLXzpncgT05FIyB9EV4uLCBEFR2TgGGT+p99UI6g8wAhOafHts4gUHC6p
	 p7N7AVFXDmeMgzcU1VIYKLHsWx09aC7MxmEgfPAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2716DF8027B;
	Mon,  8 Feb 2021 19:39:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FF5CF80278; Mon,  8 Feb 2021 19:39:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AED34F80264
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 19:39:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AED34F80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DrdjHGMl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B11B64E6B;
 Mon,  8 Feb 2021 18:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612809549;
 bh=a6Ptbno+MD4MJkCP5JROC9r9dgS4dLXVT5U1LzXU2K8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DrdjHGMlDZ7KEg0stxWAiPUIPT7KpXdwrcVe8Y6ePZOg4slZiriGtUxGjdHzSBIci
 1yMQgmHOSThRAm4dWfDTqSHOhOrx0IRfe6Na4Hw5ayP3/oeEfp//Kzp6qKokQWITqy
 Su3tRZ4ZqIjQJxASR57+aEk8SIGvsuK1m+nSH50giyZRxuKZks4SbxMM5ICaA3Shx6
 ccZ7PRLFvsS60+kFjGdtBPlaKxe2MKPLRbDT0pqh8FaeIYCMOPoxV5Fc2h1xZ+Dt+p
 MoYWFtygtgj7wtlxJ8KQwgBTtJjfgXjYFqlNJy04iJ4OyuFxqPU2FClB47PDdLsXIv
 5Y6SMOGBL/q3w==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20210205171428.2344210-1-ranjani.sridharan@linux.intel.com>
References: <20210205171428.2344210-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: rt5682: Fix panic in rt5682_jack_detect_handler
 happening during system shutdown
Message-Id: <161280948305.10741.4495678195653704904.b4-ty@kernel.org>
Date: Mon, 08 Feb 2021 18:38:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Shuming Fan <shumingf@realtek.com>, tiwai@suse.de,
 Jairaj Arava <jairaj.arava@intel.com>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

On Fri, 5 Feb 2021 09:14:28 -0800, Ranjani Sridharan wrote:
> During Coldboot stress tests, system encountered the following panic.
> Panic logs depicts rt5682_i2c_shutdown() happened first and then later
> jack detect handler workqueue function triggered.
> This situation causes panic as rt5682_i2c_shutdown() resets codec.
> Fix this panic by cancelling all jack detection delayed work.
> 
> Panic log:
> [   20.936124] sof_pci_shutdown
> [   20.940248] snd_sof_device_shutdown
> [   20.945023] snd_sof_shutdown
> [   21.126849] rt5682_i2c_shutdown
> [   21.286053] rt5682_jack_detect_handler
> [   21.291235] BUG: kernel NULL pointer dereference, address: 000000000000037c
> [   21.299302] #PF: supervisor read access in kernel mode
> [   21.305254] #PF: error_code(0x0000) - not-present page
> [   21.311218] PGD 0 P4D 0
> [   21.314155] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [   21.319206] CPU: 2 PID: 123 Comm: kworker/2:3 Tainted: G     U            5.4.68 #10
> [   21.333687] ACPI: Preparing to enter system sleep state S5
> [   21.337669] Workqueue: events_power_efficient rt5682_jack_detect_handler [snd_soc_rt5682]
> [   21.337671] RIP: 0010:rt5682_jack_detect_handler+0x6c/0x279 [snd_soc_rt5682]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: Fix panic in rt5682_jack_detect_handler happening during system shutdown
      commit: 45a2702ce10993eda7a5b12690294782d565519c

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
