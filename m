Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A1D76B8E4
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 17:43:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74ECA820;
	Tue,  1 Aug 2023 17:42:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74ECA820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690904597;
	bh=kYHQfSx2ZnIe/mloaLHf4HbNajqw8Gi4jx3qIU/TEH0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ca4WDMDL4qNQESmzmCNMw7PMNFiGR+EjEMxkFyuPP13NUwtKGsVFVA2l85cYA+8JQ
	 73TkMokfP85zhRXmUQhyQ/bhiUOFeN9TgXHG2pI3JpocEC+tFVhFhp/ymVbCHSohyP
	 TmUllQpN/YE5cC0PBMCPYluO5tNCckqFG7VMY8zI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7204F80535; Tue,  1 Aug 2023 17:42:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6309F8015B;
	Tue,  1 Aug 2023 17:42:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B0FEF801D5; Tue,  1 Aug 2023 17:41:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0911F80087
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 17:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0911F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TjTFAppW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B31161515;
	Tue,  1 Aug 2023 15:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4EEC433C9;
	Tue,  1 Aug 2023 15:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690904485;
	bh=kYHQfSx2ZnIe/mloaLHf4HbNajqw8Gi4jx3qIU/TEH0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TjTFAppWCYtBoZahCp184jzYr7jsnC3/rIy5seaNfhN3KWVGkibRimfGxTG9GrxFW
	 VDfAjNMTSXg05YtgW2f2nwhGvlXrZzLnpZa8T9ObZBgcF5lQ6wLAyX6hiSlD+5zgdQ
	 hBxEIRjKeFe8z4QxEIxoe47XsxSflvn+TAbqw1ZPMyQLFVapE/UjXHiAbPiOLeSN/i
	 98+aMVQqHVtp3kEzwjEud7S5cSBi4bwHu7HHGQ/k5wVs4ouE+IlM+GU9CNGahdw0wG
	 teKB8jqLofiqGJ3XI2WIjPznLqcv9F3TD+vqzT8LhRcGaoWMDvmjTozaFDnKOUyHr2
	 l8raXubYSGerw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/23] ASoC: Intel: machine driver updates for 6.6
Message-Id: <169090448461.50882.6811703974217949939.b4-ty@kernel.org>
Date: Tue, 01 Aug 2023 16:41:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: UTTPT3IKODIPI47QBINY4E4T345KZH2X
X-Message-ID-Hash: UTTPT3IKODIPI47QBINY4E4T345KZH2X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UTTPT3IKODIPI47QBINY4E4T345KZH2X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 31 Jul 2023 16:42:34 -0500, Pierre-Louis Bossart wrote:
> Lots of small cleanups coming from Bard Liao and Charles Keepax for
> SoundWire platforms, and minor additions for RVPs and Chromebooks.
> 
> Balamurugan C (1):
>   ASoC: Intel: soc-acpi: Add entry for rt711-sdca-sdw at link 0 in RPL
>     match table
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/23] ASoC: Intel: soc-acpi: Add entry for rt711-sdca-sdw at link 0 in RPL match table
        commit: e63e2810edd229e320249dc85c20c22f4894919e
[02/23] ASoC: Intel: sof_rt5682: add RPL support for MAX98357A speaker
        commit: 26d9726f667e18134bfc77a3e4e0da7518a8b180
[03/23] ASoC: Intel: sof_rt5682 add support for HDMI_In capture
        commit: f3c37847c704c5d398fa6808c77e4f7c997c0abb
[04/23] ASoC: Intel: sof_sdw: Update BT offload config for soundwire config
        commit: a14aded9299187bb17ef90700eb2cf1120ef5885
[05/23] ASoC: Intel: sof_sdw: reorder SoundWire codecs in Kconfig
        commit: 4b68ce6912fd87b1743eb2e66aeba81cae2067fe
[06/23] ASoC: Intel: sof_sdw: allow mockup amplifier to provide feedback
        commit: 3390d4ed823e716618095c16ad6792f33cc66190
[07/23] ASoC: Intel: sof_sdw: rename link_id to be_id
        commit: 616bee2c06ca1cd24631ae0db1b4cba1d6b9ad25
[08/23] ASoC: Intel: sof_sdw: add support for SKU 0AFE
        commit: 0cc85f2bfbcb84754ee6cd43a6fb9953f18cd2dc
[09/23] ASoC: intel: sof_sdw: Use consistent variable naming for links
        commit: 1d1062382b1807679e9001d79704112525576057
[10/23] ASoC: intel: sof_sdw: Rename codec_idx to codec_dlc_index
        commit: 4fc16d21b7abb969935162d8b01fba21496cf513
[11/23] ASoC: intel: sof_sdw: Remove some extra line breaks
        commit: 08f62f6291bae6e0cc5f3f50e4e1043e6a270e80
[12/23] ASoC: intel: sof_sdw: Use a module device table
        commit: 18c45cb362fcd6918548a4e11128304aa634acf3
[13/23] ASoC: intel: sof_sdw: Simplify find_codec_info_acpi
        commit: 31a54f78ad1d294432d63e9f72db08dc14cca432
[14/23] ASoC: intel: sof_sdw: Constify parameter to find_codec_part_info
        commit: fad1a9eff67d34b6f90cf4d1d2f1dc2632dfeeb4
[15/23] ASoC: intel: sof_sdw: Minor tidy up of mc_probe
        commit: 855e69f4ff9d726df4c8c47e7b40934fdb49d9c5
[16/23] ASoC: intel: sof_sdw: Remove redundant parameters in dai creation
        commit: febac07b4c69242d7870944457c3a1158ab97bdc
[17/23] ASoC: intel: sof_sdw: Move amp_num initialisation to mc_probe
        commit: 8673e68b594684fac53398ec5783a6c8469a07a1
[18/23] ASoC: Intel: sof_sdw: break earlier when a adr link contains different codecs
        commit: 656dd91a3a1ca27a02d9a79d1720b2ca40d272cf
[19/23] ASoC: intel: sof_sdw: Allow direct specification of CODEC name
        commit: 009582008182bc0a2956d245fd0362e036f31dfe
[20/23] ASoC: Intel: sof_sdw: add cs35l56 codec info
        commit: 4754e29c779fe2a2677ba62896daf4bf980602a1
[21/23] ASoC: intel: sof_sdw: Clean up DAI link counting
        commit: 98a7a1143f83289a84cba6dab60a4531cc4dfae2
[22/23] ASoC: intel: sof_sdw: Merge codec_conf_alloc into dailink_info
        commit: a386162e7dc2c8bc1be2777b1c6d41156f69b210
[23/23] ASoC: intel: sof_sdw: Move group_generated logic
        commit: a60ed3b738705dbcb4afce9a24af00e2671edf19

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

