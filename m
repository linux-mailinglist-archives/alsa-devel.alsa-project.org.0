Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E273A2F38C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2025 17:31:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C463601E2;
	Mon, 10 Feb 2025 17:30:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C463601E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739205066;
	bh=vxbaXpNi0Rlbv5xiUxgUrErzeRA1WuHdZBaX791dnaM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jksBwfwLuRUA9gLyelT9OBvbB/n5b3XLHcIQXfKhbwo/0MF5MLlsBnScRfzDhx8VW
	 5b7zqt1ddPk+Ko5a8yBeBzefmWe++m55pjDVBM7OMMtB3uVKRRhTOr7ccYRBSvq1tV
	 KtqYnevXzq4q7xZKIB5vZLRMaVWMQtLXi333ouFY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD791F805E6; Mon, 10 Feb 2025 17:30:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 819B6F805F2;
	Mon, 10 Feb 2025 17:30:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1782F805C9; Mon, 10 Feb 2025 17:30:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2A33F805AE
	for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2025 17:30:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2A33F805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=R2a2CX90
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0B25A40E0A;
	Mon, 10 Feb 2025 16:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B959C4CEE5;
	Mon, 10 Feb 2025 16:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205009;
	bh=vxbaXpNi0Rlbv5xiUxgUrErzeRA1WuHdZBaX791dnaM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R2a2CX90esB4UW0/ykYzJL7n5qfcK/nSLsK0Gx5tGVsOK3LfsCySuoX0RegB8rY13
	 TG7b7FwyR+3PK1IMlkw+e2Q1aZiIwegtahZIxINNjYIn23bmcFFvmEtxJ6E6Zun3Uh
	 J8ikjyOeGMqwSqq0lW/39RsrvWamiR7qbBukHiK7kRhylAl3KH784ClDEZa6/hmSbu
	 NA/9UxhCzjfVQtKj1RrJ8+yqZAEZXdY+QXtNg59MllVZ1uM7/mjDF9rXZi75yPXymA
	 uZVL6sPlYu/+11JvaLxgDdjaA6VpLdoceCfCGkDznDls7cn4miAjgkND/VVW4h/Q4L
	 g7WKN7v21sxgg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: venkataprasad.potturu@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com
In-Reply-To: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
References: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V3 00/25] ASoC: amd: Add support for ACP7.0 & ACP7.1
 platforms
Message-Id: <173920500520.65690.5365981028345549480.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:30:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
Message-ID-Hash: FV5CWOYSRAJ2F3S7YROI2MMYFRPS24E4
X-Message-ID-Hash: FV5CWOYSRAJ2F3S7YROI2MMYFRPS24E4
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FV5CWOYSRAJ2F3S7YROI2MMYFRPS24E4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 07 Feb 2025 11:57:54 +0530, Vijendar Mukunda wrote:
> This patch series includes the below changes
> 	- Refactor existing ACP6.3 platform ACP PCI driver, SoundWire
> 	  DMA driver code.
> 	- Add Audio IO support for ACP7.0 and ACP7.1 platforms for
> 	SoundWire IO and ACP PDM controller combination.
> 	- Add SoundWire generic machine driver changes for legacy stack
> 	(No DSP enabled) for ACP7.0 & ACP7.1 platforms.
> 	- Add SoundWire machines for ACP7.0 & ACP7.1 platforms.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/25] ASoC: amd: ps: rename structure names, variable and other macros
        commit: e2ceac2f323625632f12dd5333092976298a0cde
[02/25] ASoC: amd: ps: use macro for ACP6.3 pci revision id
        commit: 4b36a47e2d989b98953dbfb1e97da0f0169f5086
[03/25] ASoC: amd: ps: add acp pci driver hw_ops for acp6.3 platform
        commit: db746fff89a14419379226ce0df8b94f472cf38c
[04/25] ASoC: amd: ps: add callback functions for acp pci driver pm ops
        commit: 491628388005a26c02d6827e649284357daec213
[05/25] ASoC: amd: ps: add callback to read acp pin configuration
        commit: 6547577e94ae3d9f8ff30d3267fe7ec394e3b20d
[06/25] ASoC: amd: ps: add soundwire dma irq thread callback
        commit: 0a27b2d7a224326fab543ca586d501fe1857b655
[07/25] ASoC: amd: ps: refactor soundwire dma interrupt handling
        commit: 4516be370ced14c4fb454fd6cc016e47bffe109e
[08/25] ASoC: amd: ps: store acp revision id in SoundWire dma driver private data
        commit: fcb754602724fa2a1d0db72f13ddc3ef0306f911
[09/25] ASoC: amd: ps: refactor soundwire dma driver code
        commit: 0fa0843db17ccd427fc7a23d313aafa88fc89e04
[10/25] ASoC: amd: ps: refactor soundwire dma interrupts enable/disable sequence
        commit: 43d6140cedad9f031b47dfde6f85856e007b3f04
[11/25] ASoC: amd: ps: rename acp_restore_sdw_dma_config() function
        commit: 605aab3b3ca83f58681841b2dd16d4a7baefde6c
[12/25] ASoC: amd: ps: add pci driver hw_ops for ACP7.0 & ACP7.1 variants
        commit: 7c0ea26c57b0bb72d503fe27d6533f5addc5e3a3
[13/25] ASoC: amd: ps: add pm ops related hw_ops for ACP7.0 & ACP7.1 platforms
        commit: fde277dbcf53be685d0b9976d636366c80a74da8
[14/25] ASoC: amd: ps: add ACP7.0 & ACP7.1 specific soundwire dma driver changes
        commit: c878d5c1a525b88807d9d79888fe8340bcbf1aa3
[15/25] ASoC: amd: ps: implement function to restore dma config for ACP7.0 platform
        commit: 1c35755f46423150e19ff57448786b4bb48fdb46
[16/25] ASoC: amd: ps: add soundwire dma interrupts handling for ACP7.0 platform
        commit: 0b6914a0121b4c9fc8f575b60a5dd43b74612908
[17/25] ASoC: amd: ps: add soundwire wake interrupt handling
        commit: 3898b189079c85735f57759b0d407518c01c745e
[18/25] ASoC: amd: ps: update module description
        commit: 0eb8f83c055cb3461734710d1b1ce2dd4f01806e
[19/25] ASoC: amd: ps: update file description and copyright year
        commit: f1e91acacf86fb2cd7478af490326cb9aa63e8ae
[20/25] ASoC: amd: update Pink Sardine platform Kconfig description
        commit: 552f66c40134542f15d4302837e7d581a0b8e217
[21/25] ASoC: amd: acp: add machine driver changes for ACP7.0 and ACP7.1 platforms
        commit: 638ad2bdb2f994c8bd99cc40e0c4796a8617ccf3
[22/25] ASoC: amd: acp: add RT711, RT714 & RT1316 support for ACP7.0 platform
        commit: 187150671d83324f1ca56f7ab5e00f16a3b9f2a9
[23/25] ASoC: amd: acp: amd-acp70-acpi-match: Add rt722 support
        commit: d0252b0b945ec67fd09fc764dcadf445fb7757ee
[24/25] ASoC: amd: acp: amd-acp70-acpi-match: Add RT1320 & RT722 combination soundwire machine
        commit: 31e3100d5e1fe69f944f84867be0cbfa5fd380c8
[25/25] ASoC: amd: amd_sdw: Add quirks for Dell SKU's
        commit: 4bb5b6f13fd83b32c8a93fbd399e7558415d1ce0

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

