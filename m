Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AAC1AB455
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 01:38:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9AB01662;
	Thu, 16 Apr 2020 01:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9AB01662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586993906;
	bh=7TmOHjgTiZukaGQpVj2+A6h7BA+uJoy/diEHNOat0lA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b0ZRHZ0wHWIk7vq1PTgCeM0bpuYcZhs3WvZ1hPwRcr0bzv5o+xGGskp+EKWuvvg9y
	 FzlBlwwaPhyQo7wVqkK8JOaEpwCuYZEG3lMvgwL4Sv8JkwoiMtSaFtOr1/Ip3kIbz3
	 DRisKfX0q8/6/84OR1YB/PAD43uWa2DkYb7Yy3yM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFBC8F8025F;
	Thu, 16 Apr 2020 01:36:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5937AF80245; Thu, 16 Apr 2020 01:36:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABF7BF80115
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 01:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABF7BF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FI8XciSD"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CF242076A;
 Wed, 15 Apr 2020 23:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586993797;
 bh=7TmOHjgTiZukaGQpVj2+A6h7BA+uJoy/diEHNOat0lA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=FI8XciSDOHaFYdYengrW88KGGdwS1m36fQEK0+jD5Ou73tG4445ewTMUmVs663QIP
 Io2mBDtwsXtZ1ZE3/q9vI8mBPDtjCyWoSLAFbZSZu9HKAwijxUgpWa5Tncgg5O0XIC
 H4/v2TOMXr80J3GchF7s6L8+uCFkNRjV/5Sv6/ww=
Date: Thu, 16 Apr 2020 00:36:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/24] ASoC: SOF: topology and firmware IPC updates for 5.8
Message-Id: <158699320579.11316.13076227949268408077.b4-ty@kernel.org>
Cc: tiwai@suse.de
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

On Wed, 15 Apr 2020 15:27:52 -0500, Pierre-Louis Bossart wrote:
> Long series made of a relatively small changes from multiple SOF
> contributors. I didn't find a good way to split this series since it
> tracks SOF minor ABI changes (backwards-compatible with older firmware
> files) and needs to be kept in-order. Future series should be much
> shorter.
> 
> The main addition is support for an extended firmware manifest, which
> helps retrieve capabilities directly from the firmware file instead of
> the current IPC mechanism (still supported but will be deprecated).
> 
> [...]

Applied, thanks!

[01/24] ASoC: SOF: topology: fix: handle DAI widget connections properly with multiple CPU DAI's
        commit: 101001652ee7231bb02a8aa75d25fadb1c078c2c
[02/24] ASoC: SOF: Mark get_ext* function ext_hdr arguments as const
        commit: 0730c0928d8941327f38dd72e53f9bdb0cc29e00
[03/24] ASoC: SOF: Introduce offset in firmware data
        commit: 92be17a559a8872b655512b1cf9d0bc407bace33
[04/24] ASoC: SOF: Introduce extended manifest
        commit: e150ef4169a766aa20003506c0f25b5519981e80
[05/24] ASoC: SOF: ext_manifest: parse firmware version
        commit: 371091417864b7be870eaad45e043059e6b6828a
[06/24] ASoC: SOF: ext_manifest: parse windows
        commit: 9e72f13ee541ccae34dd4a6735bcdf0c78090216
[07/24] ASoC: SOF: ext_manifest: parse compiler version
        commit: 7c024b948c206935e69aafa56187bff9dd36abed
[08/24] ASoC: SOF: topology: Add support for DC Blocker
        commit: 542adb2a461fb63711b96b1179f070b4fa79cc37
[09/24] ASoC: SOF: add probe support extend data
        commit: 786d6516877dc852392117d44a77bf3093c39dbd
[10/24] ASoC: SOF: add debug ABI version
        commit: 2014185eba4e061db038a59a6e1d85e88291edc6
[11/24] ASoC: SOF: change type char to uint8_t in info.h
        commit: e6224484454da920874db9ad30ea9b493f5600bd
[12/24] ASoC: SOF: change type char to uint8_t in trace.h
        commit: f480f804f27a3decd03682b707453963bb8b4162
[13/24] ASoC: SOF: change type char to uint8_t in topology.h
        commit: 60829341aa602b74f5f5b9d903e0b809557a54a4
[14/24] ASoC: SOF: make sof_ipc_cc_version to fixed length
        commit: a9a9cbf081414de0261279e3b11ada2f0a7f7e83
[15/24] ASoC: SOF: Add XRUN flags field to struct sof_ipc_buffer.
        commit: 7893df67e9bde8e4f0ede579ff874d438af620d8
[16/24] ASoC: SOF: Intel: Fix typo in header file comment text
        commit: 79a4ff94a3fcb76d9650341336f4779f6d48d325
[17/24] ASoC: SOF: Intel: Change DMIC load IPC to fixed length
        commit: 31be5337ace110b6c9a567c05b661fd8168ef8cc
[18/24] ASoC: SOF: Intel: Rename deprecated DMIC IPC struct field
        commit: 1993ba26cc53a98aa67c451d735249e221ddd39d
[19/24] ASoC: SOF: align sof_ipc_dai_alh_params with FW
        commit: 1f846505b3651ac385762b794868922e2be83d42
[20/24] ASoC: SOF: topology: Get ALH rate amd channels from topology
        commit: c7fc96dfc41d168e94d26c455123193e6e59bf24
[21/24] ASoC: SOF: topology: fix: parse hda_tokens to &config->hda
        commit: 15bf1831fc91a447e336ef252b48d5f9cad8a3f2
[22/24] ASoC: SOF: topology: Get HDA rate and channels from topology
        commit: 18aaab64fbb121e5879f74a46903bcfd30bf660b
[23/24] ASoC: SOF: topology: stop parsing when all tokens have been found
        commit: f228a5b1703871632adb0918774386409cef05c5
[24/24] ASoC: SOF: topology: handle multiple sets of tuple arrays
        commit: a1687c68c3089ed746c18f2121c8e63e2cf22c00

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
