Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E0FA2F389
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2025 17:30:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1C2A601E3;
	Mon, 10 Feb 2025 17:30:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1C2A601E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739205048;
	bh=aJQ3wPuA97X/MqiECnTmoH6E+G59Gv0FFvSfYA7GYUU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C/fu1qJQ3tCZJN3zvvWV5szomIjQmWYsG2xqrII/y/eMEgXaIhHUV3DGDMg3IGrXI
	 sRopLlw9XcRVHa4cJtye+u28OaKUiK0u5ZHDbvbCD9OoHMVQ2SWYfYuFl+DZv+MkyU
	 9St/PAUQBVMbItGj0iWD5K9sHBMxxO4u+kXz/qMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB90FF805B4; Mon, 10 Feb 2025 17:30:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D35A5F80424;
	Mon, 10 Feb 2025 17:30:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADE32F80424; Mon, 10 Feb 2025 17:30:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14BC0F800D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2025 17:30:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14BC0F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=epJTwner
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E99B5A40E0A;
	Mon, 10 Feb 2025 16:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C565C4CEE5;
	Mon, 10 Feb 2025 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204999;
	bh=aJQ3wPuA97X/MqiECnTmoH6E+G59Gv0FFvSfYA7GYUU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=epJTwnerpEUsWPGtCbgfAIs2JSjt+ev5r7YF3KffuZvxOKzrElMELgu8JLUW7eKWU
	 GH7U3qG3lnWBDO5CB57RO1EDbbsU79K1GrxswEnHLomwGIjBj6m6mnNi1Yc2DYMRpg
	 IeSOgj5SE9rQrY+YK8RD3Df92skDVEdWs7iRtZmGKh1IM/vzyCp7GZqp2swrtDscbw
	 kNipadcXyeuKW2OrRbVSI9jyRWh1KDbCTvCpzJyYDfhKZjeTHX2Py6aUWRcSjTICoP
	 vC45tvoasfT9K77B8S6ttPpxbhn8v4wPUlV8gQD0qkdRzLNzqEvrXfx/5FVafhHXch
	 z7JKbQ0goyuHA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Mario.Limonciello@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V2 00/23] ASoC: amd: acp70: add soundwire and acp pdm
 support
Message-Id: <173920499691.65690.5029473211250633476.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:29:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
Message-ID-Hash: 7CPYT6OVB2R7Q7OBPPZB4HOZSXM4I34I
X-Message-ID-Hash: 7CPYT6OVB2R7Q7OBPPZB4HOZSXM4I34I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7CPYT6OVB2R7Q7OBPPZB4HOZSXM4I34I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 20 Jan 2025 15:31:07 +0530, Vijendar Mukunda wrote:
> This patch series includes below changes
> 	- Add Audio IO support for ACP7.0 and ACP7.1 platforms for
> 	SoundWire IO and ACP PDM controller combination.
> 	- Add common driver modules for ACP7.0 and ACP7.1 platforms
> 	(acp pci driver, Soundwire dma driver, pdm platform driver).
> 	- Add SoundWire generic machine driver changes for legacy stack
> 	(No DSP enabled) for ACP7.0 & ACP7.1 platforms.
> 	- Add SoundWire machines for ACP7.0 & ACP7.1 platforms.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/23] ASoC: amd: add register header file for ACP7.0 platform
        (no commit info)
[02/23] ASoC: amd: acp70: add acp pci driver for ACP7.0 and ACP7.1 platforms
        (no commit info)
[03/23] ASoC: amd: acp70: add acp init and de-init functions
        (no commit info)
[04/23] ASoC: amd: acp70: add logic for scanning acp child devices
        (no commit info)
[05/23] ASoC: amd: acp70: create platform devices for acp child nodes
        (no commit info)
[06/23] ASoC: amd: acp70: enable driver build for ACP7.0 platform
        (no commit info)
[07/23] ASoC: amd: acp70: add acp pdm platform driver
        (no commit info)
[08/23] ASoC: amd: acp70: add acp pdm driver dma ops and dai ops
        (no commit info)
[09/23] ASoC: amd: acp70: add acp soundwire dma driver
        (no commit info)
[10/23] ASoC: amd: update ACP7.0 KConfig option description
        (no commit info)
[11/23] ASoC: amd: acp70: add soundwire dma driver dma ops
        (no commit info)
[12/23] ASoC: amd: acp70: add acp ip interrupt handler
        (no commit info)
[13/23] ASoC: amd: acp70: add acp pdm driver pm ops
        (no commit info)
[14/23] ASoC: amd: acp70: add pm ops support for soundwire dma driver
        (no commit info)
[15/23] ASoC: amd: acp70: add acp driver pm ops support
        (no commit info)
[16/23] ASoC: amd: acp70: enable wake capability for acp pci driver
        (no commit info)
[17/23] ASoC: amd: acp70: add soundwire wake interrupt handling
        (no commit info)
[18/23] ASoC: amd: acp70: enable soundwire host wake irq mask
        (no commit info)
[19/23] ASoC: amd: acp70: enable acp pme enable during acp init sequence
        (no commit info)
[20/23] ASoC: amd: acp70: create a device node for soundwire machine driver
        (no commit info)
[21/23] ASoC: amd: acp: add machine driver changes for ACP7.0 and ACP7.1 platforms
        commit: 638ad2bdb2f994c8bd99cc40e0c4796a8617ccf3
[22/23] ASoC: amd: acp: add RT711, RT714 & RT1316 support for ACP7.0 platform
        commit: 187150671d83324f1ca56f7ab5e00f16a3b9f2a9
[23/23] ASoC: amd: acp: amd-acp70-acpi-match: Add rt722 support
        commit: d0252b0b945ec67fd09fc764dcadf445fb7757ee

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

