Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9449352A91D
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 19:22:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C0ED844;
	Tue, 17 May 2022 19:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C0ED844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652808170;
	bh=gpHNDv7W8QilNPsoHCNlBYD/f7WxUHNrmYHVIdtVSJg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sZxmWOtdX7H1BM5vkstSEwod2RYLG+uqFFGMa8yJwpGH6k7hw/qpKKe3qgd9yZqqU
	 Thd0Vu5nLpbs0399ByAmvcaNs3P+AbMyCPQd7BeFuSIjeet3vBt7Dqc1yc/1jen+k3
	 bSrzoy+nXpGvJnXTqe91Bi4+zOpfgBSg6TDhCzjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E4DBF800D8;
	Tue, 17 May 2022 19:21:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAB75F802DB; Tue, 17 May 2022 19:21:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17318F800F0
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 19:21:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17318F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lDt5aEnJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A5B461445;
 Tue, 17 May 2022 17:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DCFC385B8;
 Tue, 17 May 2022 17:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652808102;
 bh=gpHNDv7W8QilNPsoHCNlBYD/f7WxUHNrmYHVIdtVSJg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lDt5aEnJ27fTZvJ8rATWxo6ahhJMEg4JKFJ9WmUJXK7cVebD2voHmaJ8M1E0JSRPd
 1lww4ZCCbqB6QmSGELZOGpJzGDT/MarrDEAqEP6bdWSRtAn+Sko/NR9XfhCB18zxQP
 MG877MiSz9E4lxDyFtnelx8schZbAV06Nb2OjQe68xeF5vFMetKWeu3OF3mZMKyM/y
 P8gJixmYGWicg1iWzvvDahU41j/SKsvWXliLENLGNDE615wBIR2bevxPU4JE90pwLo
 KPIg38Cj0hHhszer9d93YP4xkyNQXDMbK5IAwIzK9ga3qhr1QZYZ7ZfH2R5KcPqupG
 7miCCTQgMXSMw==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220509085821.3852259-1-cezary.rojewski@intel.com>
References: <20220509085821.3852259-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 00/15] ASoC: Intel: avs: Driver core and PCM operations
Message-Id: <165280810017.1937076.14890520897502289688.b4-ty@kernel.org>
Date: Tue, 17 May 2022 18:21:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On Mon, 9 May 2022 10:58:06 +0200, Cezary Rojewski wrote:
> Part three of main AVS driver series. This series was originally part of
> the initial series which was later divided [1] into smaller,
> easier-to-review chunks. Thus, many patches found here were already
> present on the list.
> 
> This series consists of code typical to many drivers - PCI driver
> operations, trace ability, PM operations - as well as PCM handlers for
> all standard audio interfaces, that is, HDA, I2S and DMIC are found
> here.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/15] ASoC: Intel: avs: Account for libraries when booting basefw
        commit: 81a299105d69344233e6aed8565522da9beec99e
[02/15] ASoC: Intel: avs: Generic soc component driver
        commit: f1b3b320bd6519b16e3480f74f2926d106e3bcba
[03/15] ASoC: Intel: avs: Generic PCM FE operations
        commit: 9114700b496c6ce16ad6fc0073f0502cd0f46991
[04/15] ASoC: Intel: avs: non-HDA PCM BE operations
        commit: b9062f9867f0e601c64e973e2eecda37ccac2ee8
[05/15] ASoC: Intel: avs: HDA PCM BE operations
        commit: d070002a20fc071c6f14c2fd8ff5ebeabead8d2a
[06/15] ASoC: Intel: avs: Coredump and recovery flow
        commit: 2f1f570cd730c81807ae143a83766068dd82d577
[07/15] ASoC: Intel: avs: Prepare for firmware tracing
        commit: 4b86115cb91a3d34ce7da87b734572ce6063babc
[08/15] ASoC: Intel: avs: D0ix power state support
        commit: 335c4cbd201d4b74942ff37e6c644d56b9247df3
[09/15] ASoC: Intel: avs: Event tracing
        commit: 69b23b3937a1a1019f3d34696897d89f2d987edf
[10/15] ASoC: Intel: avs: Replace link_mask usage with i2s_link_mask
        commit: 25b552f192877bec5aea44a6b060a36f78de9675
[11/15] ASoC: Intel: avs: Machine board registration
        commit: beed983621fbdfd291e6e3a0cdc4d10517e60af8
[12/15] ASoC: Intel: avs: PCI driver implementation
        commit: 1affc44ea5dd554c103e0ce1e809f3aa5d942349
[13/15] ASoC: Intel: avs: Power management
        commit: cfbc100e6bbfd01a56bb83fe796318a02dc18ce4
[14/15] ASoC: Intel: avs: SKL-based platforms support
        commit: b3e29075b2346564f1bef7f8e19a1a7fcbcf7ed8
[15/15] ASoC: Intel: avs: APL-based platforms support
        commit: c8c960c109716d96cfd1de65396fb8021eed4202

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
