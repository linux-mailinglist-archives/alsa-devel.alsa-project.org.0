Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C31D7A2CEF
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 03:14:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF16B3E8;
	Sat, 16 Sep 2023 03:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF16B3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694826892;
	bh=icgcK+uwSA0+VSZJjA85kWEqslygEVMQ4cqSfA21KZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KLiiHq4Bg6d895KShrnLpMMzP5menc84UShyUkfBhgChU57ovikMgfkvAAzXa6h8Q
	 BtDKmvlbluWgXzwYxc6c7rhiaG9GPkT4fQb6Xl/9n4n0gU4E3obGFjBJ9/a+IAG8AH
	 9X3vhQz9zcYyHQfAPhxAZzYCL3bcPJwP5q6h2erc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6ED5F805CB; Sat, 16 Sep 2023 03:12:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9820F805CB;
	Sat, 16 Sep 2023 03:12:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 281CEF805AC; Sat, 16 Sep 2023 03:11:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D422F80570
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 03:11:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D422F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uJtTiyhi
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B1179B82BF7;
	Sat, 16 Sep 2023 01:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D1BC433C7;
	Sat, 16 Sep 2023 01:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694826706;
	bh=icgcK+uwSA0+VSZJjA85kWEqslygEVMQ4cqSfA21KZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uJtTiyhiB6cJAKqxnior3B21nbAu0y2EFLHp8Got08sO90ZQcF3y3zQtp0jI5JQUO
	 GEB2WXdZR1ivO1QItcgfRF0ya/Q5NuYxqhOvV6f38e41CaYDa11I8ZGBXnXnw9xaZ7
	 zJVI2I6Qjt6wpiF0/Pfd3p33FupPDxz6sZ210JgoGbQAXKL8J9OaUVkUuXrnp/ozZR
	 ++dX/hLVM3G1kbDtJOlDq7rDti6hzuPt3I6fNF5xwVvtbS3ttbjRFj9epRuvb1oa32
	 BJacP/W2J3Ay+08Et8dK7zKALG8xrg27+vciHRRTiVDSwDZJPq8kR9fK9T69e9g4zu
	 9YNOcGwvRyoCQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com, brent.lu@intel.com,
 uday.m.bhat@intel.com, balamurugan.c@intel.com
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 00/19] ASoC: Intel: machine driver update
Message-Id: <169482670447.606223.8805759859695209985.b4-ty@kernel.org>
Date: Sat, 16 Sep 2023 02:11:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: EPU6JVZJ2MLRNEP5XHRWZFPMGDQOQW7W
X-Message-ID-Hash: EPU6JVZJ2MLRNEP5XHRWZFPMGDQOQW7W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPU6JVZJ2MLRNEP5XHRWZFPMGDQOQW7W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Sep 2023 20:48:33 +0800, Bard Liao wrote:
> Some cleanups from Brent Lu for I2S platforms. And minor additions for
> RVPs and Chromebooks.
> 
> Balamurugan C (1):
>   ASoC: Intel: sof_rt5682: add HDMI_In capture feature support for RPL.
> 
> Brent Lu (16):
>   ASoC: Intel: sof_rt5682: cleanup unnecessary quirk flag
>   ASoC: Intel: ssp-common: support codec detection
>   ASoC: Intel: use ACPI HID definition in ssp-common
>   ASoC: Intel: sof_rt5682: use ssp-common module to detect codec
>   ASoC: Intel: sof_cs42l42: use ssp-common module to detect codec
>   ASoC: Intel: sof_ssp_amp: use ssp-common module to detect codec
>   ASoC: Intel: sof_nau8825: use ssp-common module to detect codec
>   ASoC: Intel: sof_rt5682: add adl_rt5650 board config
>   ASoC: Intel: sof_ssp_amp: do not create amp link for nocodec board
>   ASoC: Intel: nuvoton-common: support nau8318 amplifier
>   ASoC: Intel: sof_nau8825: use nuvoton-common module
>   ASoC: Intel: sof_nau8825: use realtek-common module
>   ASoC: Intel: sof_da7219: rename driver file and kernel option
>   ASoC: Intel: sof_da7219: use maxim-common module
>   ASoC: Intel: sof_da7219: add adl_mx98360_da7219 board config
>   ASoC: Intel: sof_da7219: use ssp-common module to detect codec
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/19] ASoC: Intel: sof_rt5682: cleanup unnecessary quirk flag
        commit: 95409545095bca8fd6a48bc66c401e101dfc57e6
[02/19] ASoC: Intel: ssp-common: support codec detection
        commit: 4b38d63916ab0d21c9eb967087e9ccb99d151696
[03/19] ASoC: Intel: use ACPI HID definition in ssp-common
        commit: 02a204dd4e627900fad66b4362f6c4fb6a0a7a26
[04/19] ASoC: Intel: sof_rt5682: use ssp-common module to detect codec
        commit: 5f706c5e929b10c6fa38c0170d9ddec21e373f20
[05/19] ASoC: Intel: sof_cs42l42: use ssp-common module to detect codec
        commit: 811e874dd3fbe61709c246a99168f6416b76ddf3
[06/19] ASoC: Intel: sof_ssp_amp: use ssp-common module to detect codec
        commit: 6308c12507c0c24fe594a26a1d92ed899fc1eea5
[07/19] ASoC: Intel: sof_nau8825: use ssp-common module to detect codec
        commit: 19fa16b6b66b9ec5fcd1db6ba308062a8090d27f
[08/19] ASoC: Intel: sof_rt5682: Add support for Rex with discrete BT offload.
        commit: aa3216f52a64c833866b94b1e3e215540f562343
[09/19] ASoC: Intel: sof_rt5682: Modify number of HDMI to 3 for MTL/Rex devices
        commit: c1cecc920a7fd2f4d3cc5f77be0de58f2cee4f35
[10/19] ASoC: Intel: sof_rt5682: add adl_rt5650 board config
        commit: db31e3a1c5bcf9dc6fe12325f162946e3161bb57
[11/19] ASoC: Intel: sof_rt5682: add HDMI_In capture feature support for RPL.
        commit: 14b7ed66e394d097eed9469abef1434a0e07b383
[12/19] ASoC: Intel: sof_ssp_amp: do not create amp link for nocodec board
        commit: 48bc32d94c360a8501e632d24557ad3aba304e9e
[13/19] ASoC: Intel: nuvoton-common: support nau8318 amplifier
        commit: e82907e7c10ef87768a625e732083f8dc4fe75e3
[14/19] ASoC: Intel: sof_nau8825: use nuvoton-common module
        commit: e8f34882622274f6d107774d9f621ef924df0b03
[15/19] ASoC: Intel: sof_nau8825: use realtek-common module
        commit: 8d2671d12a305ccd81c117a2293b87376a9d8e84
[16/19] ASoC: Intel: sof_da7219: rename driver file and kernel option
        commit: 18e12093e3da13f32bc5521a894a9c92357f7f55
[17/19] ASoC: Intel: sof_da7219: use maxim-common module
        commit: 729fd8b233c9a716f38834d486eacb952034fdb0
[18/19] ASoC: Intel: sof_da7219: add adl_mx98360_da7219 board config
        commit: 6bd912d75dcf2c919a715b6e163f90a125e66d78
[19/19] ASoC: Intel: sof_da7219: use ssp-common module to detect codec
        commit: 5f017134e42df6208a828f2aca26d56ecca9747c

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

