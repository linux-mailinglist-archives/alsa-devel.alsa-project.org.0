Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6556B724814
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 17:43:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E53EE836;
	Tue,  6 Jun 2023 17:42:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E53EE836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686066226;
	bh=mbiFHcsMottQvXih8Mk9lJdkwwYezQxqUMnGkw7k6Mo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XvFrD9s1n0u36RIX2yLTeOSqOpq2xtpDrFbNhmcYOxjYQ65V6Q+9GO4w4YLTDgO7+
	 c3x/9LxCjAOfuJ/awwixnhPbzYGp3lvd2tZ0hufo8uQmZ+KEYf+c8mybt0WtZypVyA
	 PQvKb9deIa/feYPKfbWwxOhN9Rn132iApiNnFMEQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF09EF80254; Tue,  6 Jun 2023 17:42:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DDEFF8016C;
	Tue,  6 Jun 2023 17:42:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FE5AF80494; Tue,  6 Jun 2023 17:42:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6225CF800C8
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 17:42:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6225CF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mx9UsR/L
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 51B9962CB8;
	Tue,  6 Jun 2023 15:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092CBC4339B;
	Tue,  6 Jun 2023 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686066161;
	bh=mbiFHcsMottQvXih8Mk9lJdkwwYezQxqUMnGkw7k6Mo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mx9UsR/LyuFnCEc9iWyNKVGP07oH88lxVTjbl4ZCZrlpCvniLPbP/Hki6J6fvnTCZ
	 NFV5dGpONbUqsQkwXAuA8hk/QqH5nnIYIHIktAWWuWsJyG1yohXZL8BwTTLHh0s20p
	 6t4hfNdPDqssrBPL/moQHj92qot8YkDdWgi5i3ssQx3X3rvdrMVkbdmDXa8BVqp8IS
	 ogw2852Ba5wk8kmRw/2IXpSLJSwfW5lYqm6uWdV8eKRDnGh6hs6X76aTgSpuHIDGox
	 aOyT7f4km1N2CJGWW3rSd2S8FvPFE8Tc1NBiKRIhaj4FoujOx9Fo76032I/sVF5Kv9
	 0+Kk1v7tCi5lw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/28] ASoC: Intel: machine driver updates for 6.5
Message-Id: <168606616074.43644.4627322145312642664.b4-ty@kernel.org>
Date: Tue, 06 Jun 2023 16:42:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: X5FKDFPXAFADPMXT7XG3JII2J5TANC54
X-Message-ID-Hash: X5FKDFPXAFADPMXT7XG3JII2J5TANC54
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5FKDFPXAFADPMXT7XG3JII2J5TANC54/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 02 Jun 2023 15:21:57 -0500, Pierre-Louis Bossart wrote:
> An unusually large set of patches to deal with new SoundWire-based
> platforms.
> 
> The bulk of the patches addresses support for MTL using RT712, RT713,
> MAX98363, CS42L42 jack codec and amplifiers. The sof_sdw machine
> driver had to be updated to remove limitations on number of codecs per
> links, dai types, dai naming, etc. We also moved parts of the Realtek
> and Maxim support in common code to avoid duplication.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/28] ASoC: Intel: sof_sdw: add missing exit callback
        commit: ba032909bb2d15fd3014c829fdc7a2a74a8b88ad
[02/28] ASoC: Intel: sof_sdw: add dai info
        commit: 07140abbbf9e3dc412a34ed4a60c4b0d58fbe192
[03/28] ASoC: Intel: sof_sdw: use predefine dailink id
        commit: b274586533f516b35519f409a4d089341a9c2690
[04/28] ASoC: Intel: sof_sdw: add codec_info pointer
        commit: cededa5a6486821402c5e9bb7fd3cfd71d7999bc
[05/28] ASoC: Intel: sdw_sof: append dai_type and remove codec_type
        commit: 5714aabdf9713297947615fd2325719a6f9db316
[06/28] ASoC: Intel: sof_sdw: add multi dailink support for a codec
        commit: d3fc5c4da599482a3ada60b26b22fa7de9c6da42
[07/28] ASoC: Intel: sof_sdw_rt_sdca_jack_common: test SOF_JACK_JDSRC in _exit
        commit: 526a1876fc48e2d0c0ea8ad63b58bdb2cc13047f
[08/28] ASoC: Intel: sof_sdw: rename SOF_RT711_JDSRC to SOF_JACK_JDSRC
        commit: 752d4de4c614d639fdb636e4a1ce102328696453
[09/28] ASoC: Intel: sof_sdw: make rt711_sdca be generic
        commit: 43f8012c3a6e2b33003ba7ec8c23fbb5bed2ca30
[10/28] ASoC: Intel: sof_sdw: add rt712 support
        commit: 5360c67046385f90406ec17e367ba9aeb42d5459
[11/28] ASoC: Intel: soc-acpi-intel-tgl-match: add rt712 ID
        commit: a2f4d70921f218db768cf3e879fe87dea0a354a5
[12/28] ASoC: Intel: soc-acpi-intel-mtl-match: add rt712 ID
        commit: 9efa6f46bc8b606df4226630c668af0e9d25ba7f
[13/28] ASoC: Intel: sof_sdw: add rt713 support
        commit: fbaaf80d8cf6f5da4397108efceca99abfaebbc8
[14/28] ASoC: Intel: sof_sdw: increase sdw pin index for each sdw link
        commit: 35d28ccd185cfbf5748d4d25dd013e41286a4bf2
[15/28] ASoC: Intel: soc-acpi: add table for RPL Dell SKU 0BDA
        commit: eeb9f9f7e59d75c97909c3bd51574191d205765a
[16/28] ASoC: Intel: sof_sdw: add quick for Dell SKU 0BDA
        commit: 3daf02819ac3fd8d7605804a00213cf123ac880d
[17/28] ASoC: Intel: soc-acpi: add tables for Dell SKU 0B34
        commit: b62a1a839b48f55046727089c3ba7a8ebbf97f0e
[18/28] ASoC: Intel: sof-sdw: add Dell SKU 0B34
        commit: 332f618756e61bee564e0919f97faef788c6a6e6
[19/28] ASoC: Intel: ADL: Enable HDMI-In capture feature support for non-I2S codec boards.
        commit: 5376d37b2a8bf7382cd627504e27c5e42cdc820f
[20/28] ASoC: Intel: ADL: Moving amp only boards into end of the table.
        commit: c3a3c06e05c244374fb773c80e4055a5e8aa45f7
[21/28] ASoC: Intel: Sof_ssp_amp: Correcting author name.
        commit: 1529d344dd49059c114c200dbe1c1a55d45ea120
[22/28] ASoC: Intel: Add rpl_rt1019_rt5682 driver
        commit: 5dc51e50457a1ddafad47fcd668910a5bd91106f
[23/28] ASoC: Intel: sof_sdw: Add helper function for cs42l42 codec
        commit: 43cdea08a4acc8f61daf0050f713314f0bfbedf7
[24/28] ASoC: Intel: sof_sdw: Rename sof_sdw_max98373.c file to sof_sdw_maxim.c
        commit: 85565f8047668b6727127df539f7a6ecc0f9b9c0
[25/28] ASoC: Intel: sof_sdw: Modify maxim helper functions and structure names
        commit: fcb3f0fb4c7255b7617d3d0e98414ab36ddcbee3
[26/28] ASoC: Intel: sof_sdw: Add support for MAX98363 codec
        commit: dea4138d7794f3041f6969bff637b7e5ed89ae90
[27/28] ASoC: Intel: sof_sdw: Add support for Rex soundwire
        commit: 164e5dc17525181c05563f0a06796f1a363801d5
[28/28] ASoC: Intel: soc-acpi: add Rex CS42l42 and MAX98363 SoundWire entries
        commit: a0503817c0be5ea15164f64e06350e3363466021

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

