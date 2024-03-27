Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A07B88E80C
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 16:11:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EE722C0A;
	Wed, 27 Mar 2024 16:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EE722C0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711552289;
	bh=6A6/cIs3ao6fcOJ64ZoGLk7MkLR1W7ALJHs7T8okcJE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S2i7afrJl/h5EmbrQTJ2pZzdX248vxkfuPPRfcFfXYbNENQ13gVo6LHsHxxe4Ihx8
	 VPr/xioS0x1Ke7AocbCPlTIYi2pp7laLIaJqGciOwhhvrbTtZpvL22Smk++9LHLlsA
	 /2z7qlP9uypStaCwfYw7IxoYDBmjwFM3n9xB9LeQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B773F805AB; Wed, 27 Mar 2024 16:10:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FCBCF80579;
	Wed, 27 Mar 2024 16:10:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40B2BF8025F; Wed, 27 Mar 2024 16:10:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DBE8F801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 16:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DBE8F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BjVYUL97
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB89F615AD;
	Wed, 27 Mar 2024 15:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B36C433C7;
	Wed, 27 Mar 2024 15:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711552240;
	bh=6A6/cIs3ao6fcOJ64ZoGLk7MkLR1W7ALJHs7T8okcJE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BjVYUL97p7L+r5N4/8oEZIfcEQezxC9JkgTVm2AC4bhn6Gjxw7Hre7Yy88O1aPbL5
	 31s6f0YCSwm+mhBC5pSEYg1bH/PGbbfSiUSNUbWkvQFx46cdt49MHjxaPbaEhPAKXv
	 weXMW21sk2XoosCYO4Oa9f1pk7yzF1B6jvBDkewckun0i769mEfrwEtYXqUf6Pvkv1
	 GqUBt2uBC8RytR6YxuIYJl1u31KGlthhBWJWMir2NfyQOwI48iwsobQoJGYFLBYpQL
	 N3XrJRvpAiSORhpwGZEGJnlYWQt7TEslYzBufxf0JvCZJkfYTtrumsFg0mScmyeZLR
	 GlvQNInUBntsA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/34] ASoC: Intel: boards: updates for 6.10 - part2
Message-Id: <171155223805.34784.17413019510423331842.b4-ty@kernel.org>
Date: Wed, 27 Mar 2024 15:10:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: ACSA7DCU5VTC7QJO4JHACWP2PFEVWF26
X-Message-ID-Hash: ACSA7DCU5VTC7QJO4JHACWP2PFEVWF26
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ACSA7DCU5VTC7QJO4JHACWP2PFEVWF26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 26 Mar 2024 11:03:55 -0500, Pierre-Louis Bossart wrote:
> This second part provides SoundWire-related cleanups and extensions
> required by Realtek RT722 and Cirrus Logic codecs.
> 
> Also included is a cleanup of the RT715-sdca DAI naming and new tables
> for ACPI-based board detections.
> 
> Balamurugan C (1):
>   ASoC: Intel: soc-acpi-intel-arl-match: Add rt711 sdca codec support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/34] ASoC: intel: sof_sdw: Make find_codec_info_part() return a pointer
        commit: 087777347bea060f82fa97827e7d1f625c0f9376
[02/34] ASoC: intel: sof_sdw: Make find_codec_info_acpi() return a pointer
        commit: c2c7a8b3848127f3355109d72c865b7741af9f0c
[03/34] ASoC: intel: sof_sdw: Make find_codec_info_dai() return a pointer
        commit: 1329f5b0d9d0b26021b6bd469a41139b9ccef58a
[04/34] ASoC: intel: sof_sdw: Only pass codec_conf pointer around
        commit: 961e694749fb8ddb8591512216e2fa6b4e3f42e2
[05/34] ASoC: intel: sof_sdw: Set channel map directly from endpoints
        commit: 634ffef9cbc41b9db2b45974969dda06219ffce1
[06/34] ASoC: Intel: sof_sdw: Move get_codec_dai_by_name() into sof_sdw itself
        commit: 0703329606a237c3604230603d58254a8bdf4b81
[07/34] ASoC: Intel: sof_sdw: Move flags to private struct
        commit: d36bfa329ae6d94e435d11960936023c03df0d64
[08/34] ASoC: Intel: sof_sdw: Only pass dai_link pointer around
        commit: c577b747b9a0ad32047dcfa01d0ea7e2441cf590
[09/34] ASoC: Intel: sof_sdw: Use for_each_set_bit
        commit: 2132dbc1a99480bddb995170abaa3c3e1cf8681d
[10/34] ASoC: Intel: sof_sdw: Factor out SSP DAI creation
        commit: 4d96a7f000f04e8041606f074dec5cb21bb4824d
[11/34] ASoC: Intel: sof_sdw: Factor out DMIC DAI creation.
        commit: c2473a0e50f74b1ea9cc0070048d932d9b57c3ac
[12/34] ASoC: Intel: sof_sdw: Factor out HDMI DAI creation
        commit: 914c43ab50f49656f378e748f894f9532ed19a26
[13/34] ASoC: Intel: sof_sdw: Factor out BlueTooth DAI creation
        commit: 0e2c1dd08607de04912b963f5df470d6a6969496
[14/34] ASoC: Intel: sof_sdw: Factor out codec name generation
        commit: b48f238585a49983ae51f77d6494bcfcaad8f217
[15/34] ASoC: Intel: soc-acpi-intel-arl-match: Add rt711 sdca codec support
        commit: aa238217d69b15edc709887248eec5c01370b453
[16/34] ASoC: Intel: sof_sdw: Remove no longer supported quirk
        commit: 17750bc6519f7fb4905e63e3855e4e32b01f9419
[17/34] ASoC: intel: soc-acpi: Add missing cs42l43 endpoints
        commit: 8166bdd2c560e59e9a6ec0c868b996294d8428d1
[18/34] ASoC: Intel: sof-sdw: Add new code for parsing the snd_soc_acpi structs
        commit: 27fd36aefa0013bea1cf6948e2e825e9b8cff97a
[19/34] ASoC: Intel: sof_sdw: Move counting and codec_conf to new parsing
        commit: 0d7b9880db92e1eb07bdd4dc097e574512b894a9
[20/34] ASoC: Intel: sof_sdw: Move ignore_pch_dmic to new parsing
        commit: 22f2a5e71030c5da938c4d3c50f2159582ee2362
[21/34] ASoC: Intel: sof_sdw: Move append_dai_type to new parsing
        commit: 13e698e8ee70cebfcaead8188e77d3e90f94498d
[22/34] ASoC: Intel: sof_sdw: Move generation of DAI links to new parsing
        commit: 5f14d70b7f6e9deb97893d5c09dd0986e92b7021
[23/34] ASoC: intel: sof_sdw: Factor out SoundWire DAI creation
        commit: 59bf457d80551003a06d32f5c3d1da7f64a3d420
[24/34] ASoC: Intel: sof_sdw: use generic rtd_init function for Realtek SDW DMICs
        commit: bee2fe44679f1e6a5332d7f78587ccca4109919f
[25/34] ASoC: Intel: sof_sdw: remove unused rt dmic rtd_init
        commit: 45bbc14fb94698b43636ec18d0df2440934139e7
[26/34] ASoC: Intel: sof_sdw_rt722_sdca: set rtd_init in codec_info_list[]
        commit: 266c9b27cb0a2c11de5956ee4bd7e1266d0baa36
[27/34] ASoC: Intel: sof_sdw_rt722_sdca: use rt_dmic_rtd_init
        commit: df19c6cd0fd0418b779f9c627b159d7ab77bff71
[28/34] ASoC: rt715-sdca: rename dai name with rt715-sdca prefix
        commit: 13112a34d83e0b3c925ff9818e0819ad2fe97e42
[29/34] ASoC: Intel: sof_sdw: change rt715-sdca dai name
        commit: a2e620e4ac87c80e0987bd74c0c345b0da02b33e
[30/34] ASoC: Intel: change cs35l56 name_prefix
        commit: aac976aa3c6a37175eec9d3eb912cd92aa8c3a0b
[31/34] ASoC: Intel: sof_sdw: Don't pass acpi_link_adr to init functions
        commit: 84aa440e02f3b44e927e274b9946b4c79608de43
[32/34] ASoC: Intel: sof_sdw: Remove redundant initialisations
        commit: 36f307d296ad15e3d679d6567112b9ec4c30babc
[33/34] ASoC: Intel: sof_sdw: Add quirk for optional codec speakers
        commit: 9c09bef69fe9376953348bb367c869f3d16c758c
[34/34] ASoC: Intel: sof_sdw: Add support for cs42l43 optional speaker output
        commit: 59ffeb15b2f7b44cf934fd778dc0d98a35aa6a84

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

