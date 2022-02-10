Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3763D4B151D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 19:19:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAF551AB2;
	Thu, 10 Feb 2022 19:18:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAF551AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644517141;
	bh=2EAjaZiUEmEoGGWFDQJoh0nNq0fjsMZ/51ajAw8p5mI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FoYrt9fge412jU7ZgmxrJ2YaxGD0r/JQna1bkKPkLexC4Y6PQq40uDKC7ozdaPXKk
	 hV/7/YaWvwm5STz0gvdlW/3BNZrxp2d3Ew+qMg+g2/VFd7ISEGAXEiwbTWKQ5yJOsr
	 ubYWJG7OoJysIyAIIAri5Uz+squAnHLcG+P2von8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B635DF804AC;
	Thu, 10 Feb 2022 19:17:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D01C2F804AB; Thu, 10 Feb 2022 19:17:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21F34F80054
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 19:17:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21F34F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RDQAnF9u"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 205D9CE2627;
 Thu, 10 Feb 2022 18:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6F4C340EB;
 Thu, 10 Feb 2022 18:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644517032;
 bh=2EAjaZiUEmEoGGWFDQJoh0nNq0fjsMZ/51ajAw8p5mI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RDQAnF9uMV0AD7GqyFFT2f8/doZ8H1YuMSaaoF5IA4yrVaEqLz3EaThJqZ8OsgkKF
 WYnovp6l5E51Ae/6/LORXRXccA37QcVmnE55W2Aj+uWjanhHZcX8XXSW2iJZwvYQmi
 BulehKofnxfzucQov85WLCn/vdBAoW8xl1EwenCRpoinl31HOkedI58AUHdAR2Rc/p
 arhHWwkysvROnNXkFF6fpy9WsKUrDv3dF1PHh5Wq+ib8r+Ulf+InOwMDlB2VWxraVn
 b74pHx/0jgsGvWm8xwAZYprEIHrBC26PVKluIAOaEPvl2IOji1R1PshQv3nkJ6lwb+
 aftfx0L/XIVgw==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220210150525.30756-1-peter.ujfalusi@linux.intel.com>
References: <20220210150525.30756-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 0/9] ASoC: SOF: IPC client infrastructure
Message-Id: <164451703022.82170.12789113355234920462.b4-ty@kernel.org>
Date: Thu, 10 Feb 2022 18:17:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, fred.oh@linux.intel.com, daniel.baluta@nxp.com
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

On Thu, 10 Feb 2022 17:05:16 +0200, Peter Ujfalusi wrote:
> Changes since v1:
> - Fix compilation error in sound/soc/sof/compress.c:
>   error: implicit declaration of function 'snd_sof_create_page_table'
>   The patch introducing this is not in sof-dev, and I have missed cross compiling
>   for aarch64.
> 
> Original Cover letter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: SOF: Drop unused DSP power states: D3_HOT and D3_COLD
      commit: 2439a35508277922ea116c99ff4d4a32c607464c
[2/9] ASoC: SOF: Move the definition of enum sof_dsp_power_states to global header
      commit: 5fdc1242453e2ae88b2cdb607e4eda6b687f084c
[3/9] ASoC: SOF: ipc: Read and pass the whole message to handlers for IPC events
      commit: ab3a2189a3744527f54ace1be19eb13e6c3d24df
[4/9] ASoC: SOF: Split up utils.c into sof-utils and iomem-utils
      commit: ee8443050b2bf06d80fdd2c78cc25cae2abdedcd
[5/9] ASoC: SOF: Introduce IPC SOF client support
      commit: 6955d9512d0ea814f1c2761bef7ad7b3cedf4d68
[6/9] ASoC: SOF: sof-client: Add support for clients not managed by pm framework
      commit: 1069967afe1e6b728061682ff99ec534a55a5613
[7/9] ASoC: SOF: Convert the generic IPC flood test into SOF client
      commit: 6e9548cdb30e5d6724236dd7b89a79a270751485
[8/9] ASoC: SOF: Convert the generic IPC message injector into SOF client
      commit: cac0b0887e5304bddfda91a4a7106f9328c31318
[9/9] ASoC: SOF: Convert the generic probe support to SOF client
      commit: 3dc0d709177828a22dfc9d0072e3ac937ef90d06

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
