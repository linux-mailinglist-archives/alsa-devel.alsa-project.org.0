Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAC47C7501
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 19:43:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D9DE82B;
	Thu, 12 Oct 2023 19:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D9DE82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697132626;
	bh=Fp8zFin+F4gc5rMyPLTBEeTrhsHn8hjr1pRxpfiAZ1w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NwVSFjERGz5gAQQF6ZC1ICH7+F4CLFxQGqH2AiKACze+JDmSnr2ZBQU6y0nFOI/EV
	 IOed7HeS2hxsqXMqQiZ4+ec5YGQIZB5EOH2X3I2d8OwpmO2snT6AhnjvOzluQf84P0
	 j8Df9npUF8b20ZIICwlb+z/eLUHGFUAglm6PDlG8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93A77F802BE; Thu, 12 Oct 2023 19:42:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 096DEF8027B;
	Thu, 12 Oct 2023 19:42:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25B4FF802E8; Thu, 12 Oct 2023 19:42:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3388F8019B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 19:42:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3388F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ws+CZfyu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DD427B825B6;
	Thu, 12 Oct 2023 17:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DBFC433C8;
	Thu, 12 Oct 2023 17:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697132560;
	bh=Fp8zFin+F4gc5rMyPLTBEeTrhsHn8hjr1pRxpfiAZ1w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ws+CZfyuzASVbWlCdJcvUFdX5ykTlVsJKtbDlMZ3bxaMTMjrgwNk7TL5phCy+jhmy
	 +B5BW+0YCZdaqjeJgmAxeZgBHY4QSokViNnSYReDLIu38TSHWUNWPFIdOj1IrDfRif
	 vR9vBDYx4GIajWZfrDGiet96KglnXWGdONDzTghJRXdlvIf3pPYAbNjDTMBsX4chO1
	 mNtF8SuTzfn/hEXEJRQQiYjQBGhokxXklCEim9VG8BDyRDYEqpoUVX65GSNJMP7vow
	 yhll5O43N9beXqQ6ZfwkCKr3r7GEMY2V6wv1oNbOuaQ10CnjEvdWcf/Yta1QR/i8ni
	 o3DSx6C32oRsQ==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org
In-Reply-To: <20231012083514.492626-1-amadeuszx.slawinski@linux.intel.com>
References: <20231012083514.492626-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v2 00/16] Harden SSP boards and add TDM support
Message-Id: <169713255885.343479.16650110902074371271.b4-ty@kernel.org>
Date: Thu, 12 Oct 2023 18:42:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 45NL5F2VNESTLCPNDYIPMPU4XWOC2EC6
X-Message-ID-Hash: 45NL5F2VNESTLCPNDYIPMPU4XWOC2EC6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/45NL5F2VNESTLCPNDYIPMPU4XWOC2EC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 12 Oct 2023 10:34:58 +0200, Amadeusz Sławiński wrote:
> In quite a few places in code there are checks for number of SSPs
> present on system, to reduce maintenance burden introduce helper
> functions allowing to get SSP and TDM from machine board configuration.
> 
> Current mechanism replaces "%d" present in some routes and widget names
> with SSP number. However there are also configurations which make use of
> of TDM number, in which case expected behavior would be to have string
> in form of SSP:TDM - see implementation of avs_i2s_platform_register()
> in sound/soc/intel/avs/pcm.c. Implement custom function, which parses
> string and make use of it when parsing topology. While at it make sure
> that we generate dynamic names only if there is no multiple SSPs or TDMs
> defined.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ASoC: Intel: avs: Only create SSP%d snd_soc_dai_driver when requested
        commit: 393648ce731b087f5a685044c9e41afb815421f7
[02/16] ASoC: Intel: avs: Introduce helper functions for SSP and TDM handling
        commit: 7a6debe0478596ac892ecf3cc336aacf09a9e4d8
[03/16] ASoC: Intel: avs: Improve topology parsing of dynamic strings
        commit: e6d50e474e45862096932edc31932fbbd5e8f1c7
[04/16] ASoC: Intel: avs: i2s_test: Validate machine board configuration
        commit: d3decc196afdce9456442e2bdc9033fd5d2d00b3
[05/16] ASoC: Intel: avs: rt274: Validate machine board configuration
        commit: b124d7cc6f3c08e5ae084e446e6ceff6c881c087
[06/16] ASoC: Intel: avs: rt5682: Validate machine board configuration
        commit: 2172c5b90d80aedc7cbe571e353ae45040e03a3b
[07/16] ASoC: Intel: avs: max98357a: Validate machine board configuration
        commit: 863e3f18d08bae9ffc70306e251f75bdee5e0674
[08/16] ASoC: Intel: avs: rt298: Validate machine board configuration
        commit: 060c0fd1afaec1d553fdd123ddd47368bd4b3a81
[09/16] ASoC: Intel: avs: da7219: Validate machine board configuration
        commit: fc332ea1176d72502e81a3e9d4ea3bce05e77398
[10/16] ASoC: Intel: avs: es8336: Validate machine board configuration
        commit: 8d5fed3312ebaa83338cf42746b29a01b9d3d13e
[11/16] ASoC: Intel: avs: max98373: Validate machine board configuration
        commit: a1ec836b17f7dea35f6b4b3a7c2ad4306da804c9
[12/16] ASoC: Intel: avs: max98927: Validate machine board configuration
        commit: ef91ae9e682c85e57861234db7d5ad9d071b889b
[13/16] ASoC: Intel: avs: nau8825: Validate machine board configuration
        commit: 70c101917aa1efa52a89dae5d5deee2a0c74de07
[14/16] ASoC: Intel: avs: rt286: Validate machine board configuration
        commit: cc7ea744970176134d48cc6e004ebe7c9a0bb3da
[15/16] ASoC: Intel: avs: rt5663: Validate machine board configuration
        commit: 797611b5ce62f12a2c0812c0e4e3a2fb6ee9fb47
[16/16] ASoC: Intel: avs: ssm4567: Validate machine board configuration
        commit: 5e07eb3ab981c5752c0e5ac324fbd166a12003ee

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

