Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B737D85B9
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 17:14:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47237846;
	Thu, 26 Oct 2023 17:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47237846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698333246;
	bh=RFW7uLv+twmN9Zxx5uVVI8VSIlPDPbQpUmh2VkD4x9k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hT1VFZGnx4ZF3L8+h3Hej2OaxaeTu7N9AgaeK9fEQl52SA3kN1qT0ASCSO97frGML
	 VGm0/qoHcZIApClNbYG/c0O0MILCnqupTJKsuHwmPeb5Db4Se4b2zPSfpGExthFmsy
	 YALsgieh97svBKQRvInu9HOXrUKnwbmB5Mp15obA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C57E8F80571; Thu, 26 Oct 2023 17:12:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34022F8056F;
	Thu, 26 Oct 2023 17:12:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9835F80579; Thu, 26 Oct 2023 17:12:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35CD1F8055B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 17:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35CD1F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GulcXol7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8D02CB836F1;
	Thu, 26 Oct 2023 15:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BAC3C43397;
	Thu, 26 Oct 2023 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698333143;
	bh=RFW7uLv+twmN9Zxx5uVVI8VSIlPDPbQpUmh2VkD4x9k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GulcXol7u27lGmQgmhDNiBfxYfP0KhogF94kF5tQQyEFprZFbudlGycHPQDGqpWMm
	 StXBPINVD5jSzJON1+YAY+ZwN+plg2tRq/bCrNmeLEXo4yVcG0gOT1JMU4QX1TVvIJ
	 ofwRpvMKWnDNFenCbb/rfVdJigbBLF83RH370yOKUw6g0OR6q21zcCOANVIqDSb2EI
	 W09Zjqp+oSlhqnbnKxQFb+5jlgPnY0jc9odh/wI/VHxRzSSnrlfFYSsXCeWGojIxRh
	 wfePpyLFt+3x9BYBudisbdhHCtzNT5lPovYnGw+sjK0QeF37GL7TyTjTZD6SHIHGtf
	 kLLO6RUUU4VTg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com,
 venkataprasad.potturu@amd.com, arungopal.kondaveeti@amd.com,
 mastan.katragadda@amd.com, juan.martinez@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 V Sujith Kumar Reddy <vsujithkumar.reddy@amd.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Yang Li <yang.lee@linux.alibaba.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
References: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
Subject: Re: [PATCH 01/13] ASoC: amd: acp: Add acp6.3 pci legacy driver
 support
Message-Id: <169833313785.133649.17022798870659830462.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 16:12:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: D6DMA2Q5CH4FNQQ2MIUMRNNQULMIB44O
X-Message-ID-Hash: D6DMA2Q5CH4FNQQ2MIUMRNNQULMIB44O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D6DMA2Q5CH4FNQQ2MIUMRNNQULMIB44O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 21 Oct 2023 20:20:42 +0530, Syed Saba Kareem wrote:
> Add pci legacy driver support and create platform driver for
> acp6.3 based platforms.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: amd: acp: Add acp6.3 pci legacy driver support
        commit: 33d120a49b970acbe465041d7b71e0cd6a1d1de0
[02/13] ASoC: amd: acp: refactor acp i2s clock generation code
        commit: 40f74d5f09d7c068bd7a980dc06a688dc8d2b3e3
[03/13] ASoC: amd: acp: add i2s clock generation support for acp6.3 based platforms
        commit: c7bf9156f811bcffb4201a0bf5d1b32d97ec0e5f
[04/13] ASoC: amd: acp: add machine driver support for acp6.3 platform
        commit: 9393bfb4c4dea406dd345820a6b39b9c70a7f934
[05/13] ASoC: amd: acp: add Kconfig options for acp6.3 based platform driver
        commit: d4c2d5391d7efc29fdd59d54355526c9ace16bec
[06/13] ASoC: amd: acp: add code for scanning acp pdm controller
        commit: 3a94c8ad0aae2b14a55059869871ea2d199af489
[07/13] ASoC: amd: acp: add platform and flag data to acp data structure
        commit: 57e857770f6021a73af85e6b201203520cb1a529
[08/13] ASoC: amd: acp: add condition check for i2s clock generation
        commit: 16fb2a25440a85708778f6442914066c98dc2f1e
[09/13] ASoC: amd: acp: add machine driver support for pdm use case
        commit: 39d9ee47167a2210d803f651c8fdcac84f03e766
[10/13] ASoC: amd: acp: change acp-deinit function arguments
        commit: 1b6180c095bc9a6c25e38ae1ec6481f8df20a81f
[11/13] ASoC: amd: acp: change acp power on mask macro value
        commit: caa126f2b0c821811eedf2e2fd435b11844bf0f1
[12/13] ASoC: amd: acp: Add pci legacy driver support for acp7.0 platform
        commit: e84db124cb2158b538820f31f641c28b86fb3ca3
[13/13] ASoC: amd: acp: add machine driver support for acp7.0
        commit: b97f4dac40eecfc2fc9b818b427a8eda44cb7763

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

