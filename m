Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A262A47E6D2
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 18:19:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C9EC18CD;
	Thu, 23 Dec 2021 18:18:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C9EC18CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640279970;
	bh=sPuglRJGm+s4P9pYqEPiiMUURevyj4dBylrvWsEztOs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cp7SPdZVetI5aDey5A4BEmvPnRiGfNZsm+TrDqXZqOoXuxjCfJ8JaXXAyPWFESlOB
	 9iU/3omux+yYJmHBpVDfSdJN/6bJt7hHnyPfxW0/IvH0wyzi72Lt4RwZrFQOjiGbZG
	 06ab3T61CoYl/FN/bOfWkw/6g+4p0sMbCn0Q0l44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A8FDF804E4;
	Thu, 23 Dec 2021 18:17:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1640F80115; Thu, 23 Dec 2021 18:17:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54660F80104
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 18:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54660F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nxSk5dsu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4F255B82126;
 Thu, 23 Dec 2021 17:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFAFC36AE5;
 Thu, 23 Dec 2021 17:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640279862;
 bh=sPuglRJGm+s4P9pYqEPiiMUURevyj4dBylrvWsEztOs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nxSk5dsuaPzTJOV2XKSaLEMFOQDf78lMIsVmO7zlK9AWalKLSpOo0s8rqVH1UP+ld
 tBYIJBhm5dhSpDXBfq2wgtfatVWutRkYte1iGmEusjYfSc35U83BEWlfXrrcbNn+8S
 U8lW3HS6CToic8EyzJSbF+U+NmcUFa3UGHBAbky/0/1BQt0Hvr91ljtzYnQQCx6Kt5
 5GPyNge5DP27AUYehAVlhN30qKprExXO/B1/4AwbXZBj8/149VHpIdrCT5Eu8j3Yy3
 cN28CIs76H/ht5XToOxWVHPpJSdDANRoC/jg4A1BP/IgdMgFMg/SKfQhYAoe6WAtZj
 DP2nLGOLjxDpQ==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com
In-Reply-To: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
References: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 00/20] ASoC: SOF: Re-visit firmware state and panic
 tracking/handling
Message-Id: <164027986022.1292681.3480020455769607215.b4-ty@kernel.org>
Date: Thu, 23 Dec 2021 17:17:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 chao.song@intel.com, daniel.baluta@nxp.com
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

On Thu, 23 Dec 2021 13:36:08 +0200, Peter Ujfalusi wrote:
> this series will improve how we are tracking the firmware's state to be able to
> avoid communication with it when it is not going to answer due to a panic and
> we will attempt to force power cycle the DSP to recover at the next runtime
> suspend time.
> 
> The state handling brings in other improvements on the way the kernel reports
> errors and DSP panics to reduce the printed lines for normal users, but at the
> same time allowing developers (or for bug reports) to have more precise
> information available to track down the issue.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/20] ASoC: SOF: ops: Use dev_warn() if the panic offsets differ
        commit: 72b8ed83f7eccf84c54b68a551beae400949cc29
[02/20] ASoC: SOF: Intel: hda-loader: Avoid re-defining the HDA_FW_BOOT_ATTEMPTS
        commit: b2539ef00e4427350b26896540ccabd98e88c7bb
[03/20] ASoC: SOF: core: Add simple wrapper to check flags in sof_core_debug
        commit: f902b21adba98f28eaa1cf5e509d99eaa7b1b36e
[04/20] ASoC: SOF: Use sof_debug_check_flag() instead of sof_core_debug directly
        commit: 12b401f4de787627f4a25784a0278bbbf93122b6
[05/20] ASoC: SOF: Add 'non_recoverable' parameter to snd_sof_dsp_panic()
        commit: b2b10aa79fe2fb3d3393d0e90ffb5c1802992412
[06/20] ASoC: SOF: Add a 'message' parameter to snd_sof_dsp_dbg_dump()
        commit: 2f148430b96e975e895163d763bfc9c5088100eb
[07/20] ASoC: SOF: Introduce new firmware state: SOF_FW_CRASHED
        commit: 4e1f86482189ddbef73f7be8c6e62e8e3730e6b9
[08/20] ASoC: SOF: Introduce new firmware state: SOF_FW_BOOT_READY_OK
        commit: b2e9eb3adb9a498b997b18852773e75d7af3b60d
[09/20] ASoC: SOF: Move the definition of enum snd_sof_fw_state to global header
        commit: fc179420fde3821c4d191e81b4f7b05c1dab87e2
[10/20] ASoC: SOF: Rename 'enum snd_sof_fw_state' to 'enum sof_fw_state'
        commit: d41607d37c1385da799f9a2ddb10c460e573687e
[11/20] ASoC: SOF: ipc: Only allow sending of an IPC in SOF_FW_BOOT_COMPLETE state
        commit: 9421ff7665f66452f61ee40566c6f562d3847873
[12/20] ASoC: SOF: Set SOF_FW_BOOT_FAILED in case we have failure during boot
        commit: e2406275be2b6b15d985f33aec921e6555e4f87a
[13/20] ASoC: SOF: pm: Force DSP off on suspend in BOOT_FAILED state also
        commit: b54b3a4e08bc0210768a1839af2ff888376cae4c
[14/20] ASoc: SOF: core: Update the FW boot state transition diagram
        commit: 9f89a988d5c222f2fba495bbc861a476bdf1bd30
[15/20] ASoC: SOF: ops: Always print DSP Panic message but use different message
        commit: fdc573b1c26a8859996de6fbae2d436511b74e00
[16/20] ASoC: SOF: dsp_arch_ops: add kernel log level parameter for oops and stack
        commit: b9f0bfd16d8b390b35dbec67c3ed74e74a0ade24
[17/20] ASoC: SOF: Rename snd_sof_get_status() and add kernel log level parameter
        commit: 4995ffce2ce2164fa507a5dbaf1aa38bab679cca
[18/20] ASoC: SOF: Add clarifying comments for sof_core_debug and DSP dump flags
        commit: beb6ade168177bf6c43abe78b3c9512b260b8068
[19/20] ASoC: SOF: debug: Use DEBUG log level for optional prints
        commit: 0152b8a2f0831b03bb7483159ef28167dcd33ab0
[20/20] ASoC: SOF: Intel: hda: Use DEBUG log level for optional prints
        commit: 34bfba9a63ece79c683591e757899e61fbcaa753

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
