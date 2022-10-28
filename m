Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C35611A86
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 20:53:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9BDFAE8;
	Fri, 28 Oct 2022 20:53:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9BDFAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666983238;
	bh=04JPhCT4TEm2iqFFVZ5bfC21XTgxFr21qflSxA9qcjQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FdXHBHeMLWrWN1P2PTSw0C2phd8VnICoJjrlAMml3AcbLeijTz9A6O7xos9Tpkj18
	 wBpVnauhH0NEQcNIIX4cpD+4GAVkIvJZup4Xpw2kCvWRcXFqcRH9XkkGmv9xAn5Qz9
	 j+DA6kvcCfMIcVHqk1MzVcp/GiXfBGsEutqJS1hM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 539EFF804BD;
	Fri, 28 Oct 2022 20:53:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1375F8025A; Fri, 28 Oct 2022 20:53:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3D75F800E1
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 20:52:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D75F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LWO+Fs24"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E01A62A08;
 Fri, 28 Oct 2022 18:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BCEC433D6;
 Fri, 28 Oct 2022 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666983177;
 bh=04JPhCT4TEm2iqFFVZ5bfC21XTgxFr21qflSxA9qcjQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LWO+Fs24cWvMcHfAxtZIgLDkbog7wQW43qv5FyEZJUM4tjghBtbi6rVNOj+IrQ52y
 3kwy3bUE3F6VGekndaJxfszhlIFJ2Ud2mfo/dyIqhWoq9+W1s7ubquzlWTuTzqBIUV
 A3sY1TkAvvMQ9kRqfYkoFHurX4PhYHwvOXGt0QssBsyPkErDSujRgiB5YR+DxreZxx
 CfIsvByTHSb8cWOIMDTDQqr6rThIs/JfwDwpmfMY7i5loKtKqzxL0e75AG3Xj/5Fyd
 T8Z5Oym5BnWGLLcKXSbm+Qe+T8GJD0WdOrSB9A/ErmliJbgEFvMHffyEGPbjtDbVB1
 xpxXxNfe+Ygig==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
References: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/21] ASoC: SOF: Intel: HDA: refactor codec and
 multi-link suport
Message-Id: <166698317588.1353381.3558881606852675172.b4-ty@kernel.org>
Date: Fri, 28 Oct 2022 19:52:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>
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

On Thu, 27 Oct 2022 15:35:19 -0400, Pierre-Louis Bossart wrote:
> Existing HDaudio controllers expose an HDAudio DMA which is used to
> interface with HDaudio codecs. All other interfaces supported by Intel
> (SoundWire, SSP, DMIC) rely for data transfers on another GP-DMA
> managed by the DSP firmware - the HDaudio DMA is only used for
> memory-to-DSP transfers.
> 
> New HDaudio extensions will enable the use of this HDaudio DMA for all
> of SoundWire, SSP, DMIC. These extensions will be backwards-compatible
> for HDaudio and iDISP codecs, but will require new programming
> sequences and DAI callbacks for SoundWire, SSP and DMIC.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/21] ASoC: SOF: Intel: remove option to disable the common_hdmi handling
        commit: 834c69d3b849625d5c5bb81a3425fc8deef5f16d
[02/21] ASoC: SOF: Intel: remove all dependencies on SND_SOC_HDAC_HDMI
        commit: 2c6c809cc00b71b3195d76a69d603cc761716ab7
[03/21] ASoC: SOF: Intel: hda-codec: simplify SND_SOC_SOF_HDA_AUDIO_CODEC handling
        commit: dc1d964a44dd9eb236f4e98b7b1eaa776093ca8b
[04/21] ASoC: SOF: Intel: move codec state change to hda-codec.c
        commit: 580803a70332f6858245498aaf32f59011d8715b
[05/21] ASoC: SOF: Intel: start moving multi-link handling in dedicated file
        commit: 52f1610370e3a283adc7bf2b39311be7865f671c
[06/21] ASoC: SOF: Intel: hda: add multi-link helper for LOSVID
        commit: 1a7d06ae5dfbaa3dcd801826933531602754338f
[07/21] ASoC: SOF: Intel: move all RIRB/CMD_IO helpers to hda-codec.c
        commit: ad09e4465844547c5046e66025b5a468345a96a5
[08/21] ASoC: SOF: Intel: hda-ctrl: add codec wakeup helper
        commit: 3246a6c9f09eb244c1f9111a288ab010df2be6de
[09/21] ASoC: SOF: Intel: hda-codec: add hda_codec_device_remove() helper
        commit: d4bfba1e754678c51602898ea71570cf6b7cd284
[10/21] ASoC: SOF: Intel: hda-codec: add stop_cmd_io helper
        commit: bf2d764b84abfd880eee50d6982dade9224d1734
[11/21] ASoC: SOF: Intel: hda-stream: always allocate CORB/RIRB buffer
        commit: 8da5bceb8c4a8d5c06807b32cea94b278e925d22
[12/21] ASoC: SOF: Intel: hda-codec: add hda_codec_check_rirb_status() helper
        commit: 87f4230047fc1960377875ff1f1b8f60f736f698
[13/21] ASoC: SOF: Intel: hda-ctrl: use helper to clear RIRB status
        commit: 5079aa924fadb9fd811d1a465f034681fe1d074c
[14/21] ASoC: SOF: Intel: hda-dsp: clarify dependencies on SND_SOC_SOF_HDA
        commit: d191009f77d8ef53d3b75959a4d7db9fcc0ed1d1
[15/21] ASoC: SOF: Intel: hda-codec: add helpers to suspend and resume cmd_io
        commit: 3400afcf6800af0be25bf076862dce9a8eac776e
[16/21] ASoC: SOF: Intel: clarify bus_init and bus_exit sequences
        commit: afae09429956b9481d0788385c90238d8d2d038f
[17/21] ASoC: SOF: Intel: hda-mlink: add helpers to suspend/resume links
        commit: f402a974aa0ae2b9abcccf49d5ac7c093e86a073
[18/21] ASoC: SOF: Intel: add hda_bus_ml_free helper
        commit: 02785b892c2203c08d49811cc67be2775c4e1f32
[19/21] ASoC: SOF: Intel: hda: clarify Kconfig dependencies
        commit: a4203256e46932e74984c6554d0c502c8994e0b8
[20/21] ASoC: SOF: Intel: hda-codec: use GPL-2.0-only license
        commit: e8b7479d06d565432f87d684d2876d0b0d1f0210
[21/21] ASoC: SOF: introduce new DEBUG_NOCODEC mode
        commit: 4bd1adb85a09c249ddb4610e8412bf0f4484a371

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
