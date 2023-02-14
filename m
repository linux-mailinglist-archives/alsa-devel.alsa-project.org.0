Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F6B696C37
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 19:03:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17D3786F;
	Tue, 14 Feb 2023 19:02:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17D3786F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676397803;
	bh=0PtPDrWNkpluncRFmWz+ZgDHmPrLcGLsRpYBGaT3drM=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I4EDpQ9mPRAur8y7YsO7+G0oJmphDRaKpUhPvug3iIZIsAjLlOZDbA3ER1ZJRDx7U
	 yKZFA6sqc26ZUum0redjFTGP9Hft9FES49rklFCEo6srAEqpURp1UdGIinYGnP8Tnx
	 6KamDinOFqNCctX2D62miTbAedTQRQw4UXfJrhXc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 283B2F804B0;
	Tue, 14 Feb 2023 19:01:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EBC1F801C0; Tue, 14 Feb 2023 19:01:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0207AF800E4
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 19:01:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0207AF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jpu9334o
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 21943B81E9F;
	Tue, 14 Feb 2023 18:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4167C4339B;
	Tue, 14 Feb 2023 18:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676397694;
	bh=0PtPDrWNkpluncRFmWz+ZgDHmPrLcGLsRpYBGaT3drM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Jpu9334obMjAA7pDc1/cIvtnPUYgFU7XmBQTheihBUxHU8j1JbVMvsKnz+Mve0hi4
	 Ev4ei8SqoC02hnomEhNlWfOQt/0GFeycavpxJ3tuBync1OEsnDTcak1mNigj6Bxzzb
	 svhesrRgRTnnnnhns1rZ0xjiyo3FwiPjVx9JDrrs46UZJX2A1DezaInm3btNN+gBx5
	 9hRUOg2NG5WTq01TNHuQEthegqr0VPKoA7+ZxNLGb4BNwBpRpzbSdak7kPGeD1GFYw
	 DaIwyoxczt8YlsyV1Xqfw+184OHa6LqWpabSHZB1bD0E7WIBkBG6XFh0GerxMbnNhR
	 Ucmq+D++E4Z3A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230214103345.30669-1-peter.ujfalusi@linux.intel.com>
References: <20230214103345.30669-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: SOF: Intel/ipc4: Support for low power
 playback (d0i3)
Message-Id: <167639769261.3067697.3307769734340089930.b4-ty@kernel.org>
Date: Tue, 14 Feb 2023 18:01:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: A6KWBHDVM5QUHS6XRZNMBCXFT3Q6WXMM
X-Message-ID-Hash: A6KWBHDVM5QUHS6XRZNMBCXFT3Q6WXMM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A6KWBHDVM5QUHS6XRZNMBCXFT3Q6WXMM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 14 Feb 2023 12:33:40 +0200, Peter Ujfalusi wrote:
> The following series will enable the the Low Power Audio (LPA) playback on Intel
> platforms when using IPC4.
> 
> The support is closely follows how IPC3 supports similar use case.
> 
> All depending patches are upstream and our CI have been testing this feature for
> some time without issues.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: Introduce a new set_pm_gate() IPC PM op
      commit: 167ca6a4fd87726e044df2db38fe86f6cb0fb907
[2/5] ASoC: SOF: Intel: hda-dsp: use set_pm_gate according to ipc version
      commit: 3c168838fb0d64dd64f7d65cdbd7d127ce6112ef
[3/5] ASoC: SOF: ipc4: Wake up dsp core before sending ipc msg
      commit: 1c91e927e55cef17bafd8903cb34a7d12968ae6d
[4/5] ASoC: SOF: Intel: Enable d0i3 work for ipc4
      commit: 3e6b6ed34bda047a818003a8c06d368eb3596bba
[5/5] ASoC: SOF: Intel: hda-dsp: Set streaming flag for d0i3
      commit: 6611b975eb87d7793e4632575649308762e7d01e

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

