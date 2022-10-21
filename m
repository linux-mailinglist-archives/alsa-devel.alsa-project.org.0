Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08610607EA2
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 21:06:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ED43A31B;
	Fri, 21 Oct 2022 21:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ED43A31B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666379172;
	bh=USa+AcADYHgcB0MzVsNhSR94NS0ue3Dm9tQqmW1OkuA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U8XvDt5RhMDyeG8UrsBMMyCnRxwDPjLJfwEWVH8qMqrNb+83rk7AM463MfBjI/bLn
	 sbuYWh2PANC9i76cto9VFdWu+mNP07ThbEXsHAPb4fFvFVolq30DbYTbO51h/D8bnD
	 zNLu9cafWxBKZCiBJFafI8x5odDAE967WdyCJj+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3292F80256;
	Fri, 21 Oct 2022 21:05:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EEBFF8021D; Fri, 21 Oct 2022 21:05:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99917F800B5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 21:05:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99917F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Cmj97NFV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A34D0CE2BA6;
 Fri, 21 Oct 2022 19:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3964BC433C1;
 Fri, 21 Oct 2022 19:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666379107;
 bh=USa+AcADYHgcB0MzVsNhSR94NS0ue3Dm9tQqmW1OkuA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Cmj97NFVs6wm1pgyJg4Y+BbY4Kp1HdpNwvI8K3aQiBsyFT0MTc1Mqa2Qmj+7V+/5j
 QpXxdSXIvYH+9xhN8x/zWA6U+jUNBZx8iqGmIIhcyrKUvaDpLTE3nGJjP3Hf/RM6G4
 ARj4mczzv8tOrlevOzdMWEDzXkde0ykBsvumwRpFc3MHObVhgL/hqfaYRSeThCBrfD
 TX4xmEWCK74K2E3hFYZiRA2pilkVMiWRdUHkyGeaCsScdnRWxJv3MeMCQarENnFdCL
 tt1CrupZMoqh6RI7sUQo3+Z7TnX6T0oft9i8//jA7QI8t6XyZTvwaei4G8+FEho3kW
 uVoElbN662KAg==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com
In-Reply-To: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
References: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 00/19] ASoC: SOF: Intel/IPC4: Support for external
 firmware libraries
Message-Id: <166637910493.907134.2661103346046398656.b4-ty@kernel.org>
Date: Fri, 21 Oct 2022 20:05:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 chao.song@intel.com
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

On Thu, 20 Oct 2022 15:12:19 +0300, Peter Ujfalusi wrote:
> Changes since v1:
> - rebased on "[PATCH v2] ASoC: SOF: Intel: pci-tgl: fix ADL-N descriptor"
> 
> Cover letter:
> 
> In IPC4 all DSP loadable executable is a 'library' containing modules. The main
> or basefw is also a library which contains multiple modules.
> IPC4 allows to use loadable libraries to extend the functionality of the booted
> basefw.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/19] ASoC: SOF: loader: Set complete state before post_fw_run op
        commit: 9b9db0d69bc16072a1d549ed4f343fd55ddfc48c
[02/19] ASoC: SOF: Introduce container struct for SOF firmware
        commit: 4f373ccf226e37a20fdc15a3df8034517a6045fd
[03/19] ASoC: SOF: amd: Use the basefw firmware container directly
        commit: b9bed09aa97f90a40695eb472b1baba81242e3ed
[04/19] ASoC: SOF: Intel: hda-loader: Use the basefw firmware container directly
        commit: 410a321c9721bb3e839f64ffe60b45492d0f1f65
[05/19] ASoC: SOF: Intel: hda-loader-skl: Use the basefw firmware container directly
        commit: 4fd0f664bdcdd63ce95542227f65459447426aa4
[06/19] ASoC: SOF: Drop the firmware and fw_offset from snd_sof_pdata
        commit: e3775fda57d49984eaa2cfd86665a152806bfd81
[07/19] ASoC: SOF: ipc: ops: Add support for optional init and exit callbacks
        commit: aa23b375363f6aba208761ff9985231cc69d00b8
[08/19] ASoC: SOF: ipc4-loader: Save the maximum number of libraries supported
        commit: b0a12fa905fad870bd941df2726953edafb489f3
[09/19] ASoC: SOF: ipc4: Convert the firmware handling (loader) to library convention
        commit: 5a932cfce4401491c942ddcb7fd3ca669e507b4d
[10/19] ASoC: SOF: IPC4: Add helper for looking up module by UUID
        commit: c73f8b470855d3123ab4b443aa9c255412dc1a13
[11/19] ASoC: SOF: Add path definition for external firmware libraries
        commit: 25bbc0c59ee15cfc37acaaa831de447f2c2fbcb9
[12/19] ASoC: SOF: Intel: Set the default firmware library path for IPC4
        commit: cd6f2a2e6346ea0955c9bed0c60add8c13b3d5f7
[13/19] ASoC: SOF: ipc4: Define platform dependent library loading callback
        commit: a5ab431e18d48e618166e8507a3555568d570cd8
[14/19] ASoC: SOF: Intel: hda: Add flag to indicate that the firmware is IMR booted
        commit: 5d5d915bcde228cd78f5d42062fb65babe651363
[15/19] ASoC: SOF: Intel: Add ipc4 library loading implementation
        commit: 3ab2c21e65188cac151de1fbe6adf841f2ecb082
[16/19] ASoC: SOF: loader: Add support for IPC dependent post firmware boot ops
        commit: cbb984b68b8d03aa423a3a0bf2946175b9e25345
[17/19] ASoC: SOF: ipc4: Stop using the query_fw_configuration fw_loader ops
        commit: e68513106eec04eba9da30d761ba0d22a4cf9e93
[18/19] ASoC: SOF: loader: Remove the query_fw_configuration ops
        commit: ba42b8bac3fd10b90eefbe42d8d0839d71bf7638
[19/19] ASoC: SOF: ipc4-loader: Support for loading external libraries
        commit: 73c091a2fe96fac2b893ba166fa7cd11eff45947

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
