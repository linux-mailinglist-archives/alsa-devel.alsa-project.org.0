Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5255F422CBD
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 17:40:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9984846;
	Tue,  5 Oct 2021 17:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9984846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633448406;
	bh=w6wTKQ+ZYOU5+PQXui4JmahGQ+oKzGwVmgNXUICcScM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tHjgcZL6EUD5STc4bAtyJSPMJLMvOpiQCFRwJ36IW5lrgczzK4lNRWIibUjzjf/xK
	 cG307cdzDijxS57Ok9++FDji6Rys2F35nBVk9pHky7A3gWs9pjIuY2DnoBgXWH9Odv
	 BDoIkaL39NP5jxVXu/4MfeyhOPCSthuOhreMa/TY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6466F804E5;
	Tue,  5 Oct 2021 17:38:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 106B5F804CF; Tue,  5 Oct 2021 17:38:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E91FF8020D
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 17:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E91FF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tw/h4Qy+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0149561165;
 Tue,  5 Oct 2021 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633448281;
 bh=w6wTKQ+ZYOU5+PQXui4JmahGQ+oKzGwVmgNXUICcScM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tw/h4Qy+dkw4Y4D9C/2j9vU4VEviPN5r6+gF7a5gHTaj499vPCnzElUfZrfi0N5fn
 3c5E7ZK1l+aIICfX/WFrNjNYx9kf/OowyIPUnQuRtDZHEzUNrAAiM9MvrCoa46dgd/
 xwoVqjsBDtPjgD27hitYMgyOQkGRI2oyIjXlb83ddmOiUCfXPOYYKd9lBudSeykphz
 JA+oJ4KEo8uGA+kOwY6mqPtkz7LJMe/Qie0yqwM43IRx9BJtuDYo5Pt3os2DtGXLuu
 /L0nyUfC/avM+Z6GSyWC7rO5CInc8mVni/c6O4bmtAHNmjpZ+m4dThl8Bf9FNqvX8L
 PTNaEWVEE5psQ==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/5] ASoC: SOF: Intel: add flags to turn on SSP clocks
 early
Date: Tue,  5 Oct 2021 16:37:44 +0100
Message-Id: <163344779739.1075058.6330760789502624929.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004171430.103674-1-pierre-louis.bossart@linux.intel.com>
References: <20211004171430.103674-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>
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

On Mon, 4 Oct 2021 12:14:25 -0500, Pierre-Louis Bossart wrote:
> With the chip shortage, some GeminiLake Intel-based designs were
> respun and now rely on codecs that need the SSP bit clock turned on in
> the hw_params stage, not the trigger stage. This patchset mirrors the
> flags added in the SOF DAI_CONFIG IPC, and sets the flags when this
> capability is indicated as necessary in the topology files where the
> SSP configuration is stored.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: dai: mirror group_id definition added in firmware
      commit: 663742307fd7b695f34597e28a846afbc9d5f3e8
[2/5] ASoC: SOF: dai: include new flags for DAI_CONFIG
      commit: 21c51692fcdf9ceb36eeda48849e0ac155ff84f8
[3/5] ASoC: SOF: Intel: hda: add new flags for DAI_CONFIG
      commit: b30b60a26a2369d6cbb63d63245f3b13f0403449
[4/5] ASoC: SOF: dai-intel: add SOF_DAI_INTEL_SSP_CLKCTRL_MCLK/BCLK_ES bits
      commit: 68776b2fb06e7e438a2c4ebca5ca7f216e31d678
[5/5] ASoC: SOF: Intel: hda-dai: improve SSP DAI handling for dynamic pipelines
      commit: 84e3cfd16a72c7b7d569b72661093cdd16346d29

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
