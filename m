Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A0E737848
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 02:36:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76B6DAE8;
	Wed, 21 Jun 2023 02:36:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76B6DAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687307815;
	bh=CvPLa21qOcHHzS7WQJn0EDUN7g4eV8Nh/KF67rNRsho=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MzNDfys74CNOWU5HqpsbKJzjIuuiMnpsULIffEOXSvf17ctRE37G/V8v6Foc9S1Fd
	 5YJYp4oyDNyjoU6ckyF2i3XrtroESne59ue7tKsHub7wbL6RMzXOyYXdAx2lAwIg6S
	 ft8vbuEQtBkLYkzgeJ6YaJ8HbW/tiMd2MM298lu0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0562F805A8; Wed, 21 Jun 2023 02:34:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EA78F805A1;
	Wed, 21 Jun 2023 02:34:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 662DBF80549; Wed, 21 Jun 2023 02:34:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1998F80141
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 02:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1998F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aIiHbVlq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A21BA61382;
	Wed, 21 Jun 2023 00:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB46C433C9;
	Wed, 21 Jun 2023 00:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687307678;
	bh=CvPLa21qOcHHzS7WQJn0EDUN7g4eV8Nh/KF67rNRsho=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aIiHbVlqTs39VL29T+EX9fhBs804GDMsZ/KdbpBwMNezOvfLmAahd3BBXOPwfBqrv
	 k8pO9S7uXVGsoCzTa17rQ9FmbkgommMKqtC+0JaJsjJvNiwIXsg4k0QdjC+bLCWPXy
	 7hVOV4VXinQVRcs1uixShWhNK+Kn5S7ijiC4zbEggXdl3MuhUBdHxo3X+FgvP1qF7r
	 curw0rcZVzxaj+0dfRjNpyTQCstIQERSGKrvvSErFEXAd5EHAIaidAx5DFvC2HsNXO
	 cujZ9XAr9x7PVPR3U98Twbhn0ova6GI9d/m/vb5NiTPX5lG3m+i16AONALQsvPNr46
	 ktF54x+UvXl6g==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 mario.limonciello@amd.com
In-Reply-To: <20230612095903.2113464-1-Vijendar.Mukunda@amd.com>
References: <20230612095903.2113464-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V4 0/9] ASoC: amd: ps: add SoundWire support
Message-Id: <168730767623.219941.16415263181056526432.b4-ty@kernel.org>
Date: Wed, 21 Jun 2023 01:34:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: ULYN4CM3JPIVKXBH3AKM2QPH2CVOY72N
X-Message-ID-Hash: ULYN4CM3JPIVKXBH3AKM2QPH2CVOY72N
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ULYN4CM3JPIVKXBH3AKM2QPH2CVOY72N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 Jun 2023 15:28:54 +0530, Vijendar Mukunda wrote:
> This patch series add support for
> 	- Platform device creation for SoundWire Manager instances and
> 	  PDM controller.
> 	- SoundWire DMA driver.
> 	- Interrupt handling for SoundWire manager related interrupts,
> 	  SoundWire DMA interrupts and ACP error interrupts.
> 	- ACP PCI driver PM ops modification with respect to SoundWire
> 	  Power modes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: amd: ps: create platform devices based on acp config
      commit: d1351c30ac8a6cf61b0bbe9fcbc8d2851cd44f3c
[2/9] ASoC: amd: ps: handle SoundWire interrupts in acp pci driver
      commit: e1cb350610ce88d9995b8b287930d3ba821d9f2b
[3/9] ASoC: amd: ps: add SoundWire dma driver
      commit: 665dd181a97ff9588060f76887c3b61fd4ccb8b0
[4/9] ASoC: amd: ps: add SoundWire dma driver dma ops
      commit: f722917350ee0b802a62d888f4e8b23bd5f1f641
[5/9] ASoC: amd: ps: add support for SoundWire DMA interrupts
      commit: 298d4f7b176538d41356d145c044442b8456a14e
[6/9] ASoC: amd: ps: add pm ops support for SoundWire dma driver
      commit: 5a06c3ac4cf9a8ca5edf99a07a1129ae25ab581e
[7/9] ASoC: amd: ps: enable SoundWire dma driver build
      commit: 7b33594130405cbcfdef2a4c582f9c67aef8d292
[8/9] ASoC: amd: update comments in Kconfig file
      commit: 6e8f7cb4cbae8e2b03190d26674a14be22d7df53
[9/9] ASoC: amd: ps: add acp_reset flag check in acp pci driver pm ops.
      commit: 198c93e2fc0b74ae520393118d7cb02762c04bf3

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

