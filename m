Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FB36D6B33
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 20:06:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20C331FE;
	Tue,  4 Apr 2023 20:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20C331FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680631601;
	bh=ZiYzQaevHiB5LB/11qAwNWoEm5wBs1A8U5pKomD1q3M=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rbeDYUI4mYeBiNZe09UYoFX59DEV+6J9qTicYjvsyWv8/y1V3ZcapjYyZtxwDQW8D
	 Wvs901vm8yc9auhMh2M/zthkq6BgjgKWKUJKTsBXI0DOUFiGDM1F9tdsXPvM31Az/H
	 yMHF5DPhM1vIzgdeodfhNZ021kACWgUG55iwkPAA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD933F801C0;
	Tue,  4 Apr 2023 20:05:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 265B4F8024C; Tue,  4 Apr 2023 20:05:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47EADF80171
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 20:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47EADF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D0pRJM59
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 014C0634CE;
	Tue,  4 Apr 2023 18:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45EAC433D2;
	Tue,  4 Apr 2023 18:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680631539;
	bh=ZiYzQaevHiB5LB/11qAwNWoEm5wBs1A8U5pKomD1q3M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=D0pRJM59DHGPRiQPOeqEnhIZHFX21JnL8RGAlFArIrfeU1x5Sq92gD93y6fToZJ64
	 hhktzwRUCQkHgPeI/nq9QXPT6DoKPnAMd4rke0W0kdS9Tc5nQuXZphDTquSgXtafEk
	 Ts1mRJEudf5wuKamKn1M9QwDoyi9DE4dy5UzaMDyjHqHiRC76irajEg4A3AJzGoWgN
	 IIyPHf18sJyaFdTa78ckUQUPM5x5azQW6cKoTuXbBShE/+k6oIcqdVuWdonw2Yf2sA
	 JTcqIKgrAzMn2q0flFyFOO7aG8vtQhGEAohXNjxBq2ami60RmcyWBxWDEL9kHue/fN
	 e7+DeqPkvhtbA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
References: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 00/12] ASoC: SOF: core/Intel: Introduce DSPless mode
Message-Id: <168063153764.96548.13296179289450941626.b4-ty@kernel.org>
Date: Tue, 04 Apr 2023 19:05:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: W67CM7DT5ANOSPEWMH5L5LW5NF3R4X33
X-Message-ID-Hash: W67CM7DT5ANOSPEWMH5L5LW5NF3R4X33
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W67CM7DT5ANOSPEWMH5L5LW5NF3R4X33/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 04 Apr 2023 12:21:03 +0300, Peter Ujfalusi wrote:
> This series will add support for SOF Linux stack to run without using the DSP.
> 
> DSPless mode provides a good tool for verification that the hardware itself
> works correctly by taking the DSP use out from the picture.
> It can only work with interfaces which supports this mode: Intel HDA at the
> moment but with LNL it could be possible to support other audio interfaces.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: SOF: Intel: hda-stream: Do not dereference hstream until it is safe
        commit: 09255c7ed8ca1f1ed99357b845d2f63fe2ef3e1e
[02/12] ASoC: SOF: Add flag and state which will be used for DSP-less mode
        commit: 59611370f92923089ceb284072d01445164a0191
[03/12] ASoC: SOF: Add support for DSPless mode
        commit: 28d40e7adfd4108c11c9397c6fe9d9f80fed31e9
[04/12] ASoC: SOF: Intel: hda: Skip interfaces not supported on a platform
        commit: 4a3b1433a8d384ff8d668b4f8665d6c67dbb30d3
[05/12] ASoC: SOF: Intel: hda: Add support for DSPless mode
        commit: 1f7b5d52be130e16fda60be446b30136698738c6
[06/12] ASoC: SOF: Intel: hda: make DSPless mode work with DSP disabled in BIOS
        commit: 9fc6786f549c4d71e55bd646ffb4814933286072
[07/12] ASoC: SOF: Intel: pci-apl: Allow DSPless mode
        commit: 04957f87ae7e862216a3bc901710c82de55c4078
[08/12] ASoC: SOF: Intel: pci-cnl: Allow DSPless mode
        commit: a417d71fd3f6a60d1cda0abf62e7961489908dca
[09/12] ASoC: SOF: Intel: pci-icl: Allow DSPless mode
        commit: 937a7fb441f5f1796398e171eef479de34a7c64f
[10/12] ASoC: SOF: Intel: pci-mtl: Allow DSPless mode
        commit: b58bbd067585af1f38cc24dbeccf98218c717281
[11/12] ASoC: SOF: Intel: pci-skl: Allow DSPless mode
        commit: f45b1fd61e874cae0217c04406f8e99d57ddfacc
[12/12] ASoC: SOF: Intel: pci-tgl: Allow DSPless mode
        commit: 5962c2a527b52b95426167ba59a2ef01a522d077

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

