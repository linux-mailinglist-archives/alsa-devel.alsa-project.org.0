Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA1384F714
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 15:19:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12B26826;
	Fri,  9 Feb 2024 15:18:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12B26826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707488341;
	bh=UCxlyAg/a2MYNuONkchPOYtImrK3EBH+0TjW3zSWeAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nutVb57v6LVPEgHjYZ4LJx/FEOvnoIksImntd5FUU8zfCZsaW7HdAEwM5T+CmwnVR
	 f26+0H08e/0YhZnZZHz9wraHcPZEFzyOjL2JFlYyB2HMdTT9p9gdqC3JFCOBclpTRM
	 8ywc5IHnnE29HavrFIfVUVcYzV42orUtA/pRx3Ts=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB511F80588; Fri,  9 Feb 2024 15:18:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44DBDF80589;
	Fri,  9 Feb 2024 15:18:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29FFAF801EB; Fri,  9 Feb 2024 15:18:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B5A6F8016E
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 15:18:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B5A6F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GhHkXYEH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C743A61C50;
	Fri,  9 Feb 2024 14:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FEDC433C7;
	Fri,  9 Feb 2024 14:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707488283;
	bh=UCxlyAg/a2MYNuONkchPOYtImrK3EBH+0TjW3zSWeAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GhHkXYEHxSBVkn/p3VFI8Uu1yR75GhVQdPMBn9TRkO1b83zArvrTjA2/0Wk1aqduj
	 PUN5kmWZtE+8kPiHbrAhcOFD21kS+4lWqqOCG9G2vy6CgjjHuj4VfR21BxYPHc11XR
	 Jj31lI0d+eI7uXq8AiVhAjEieIBZdk/bDMxxq7oTEINeIyXyE8hX/O38X3YCbo5gzG
	 +tTSmwz87TcAZMOakl35TTFp4q/GEbmmH485Cs4OUM0f4a4Uq1qCSbfJC6N+Sza1pj
	 gfqa5svOa9tYolp6YFpKwb8BDi3pSR9Ga+ld1G2cu5+1wQeizy4owZ+EKF69q1Sr67
	 pdjP/g28qr9/Q==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/24] ASoC: Intel: Machine driver updates for 6.9
Message-Id: <170748828205.2342323.15381374372489233860.b4-ty@kernel.org>
Date: Fri, 09 Feb 2024 14:18:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: YXIZOAPI37IB3DC5M2TUYYBB24QUPMLA
X-Message-ID-Hash: YXIZOAPI37IB3DC5M2TUYYBB24QUPMLA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YXIZOAPI37IB3DC5M2TUYYBB24QUPMLA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 08 Feb 2024 10:55:21 -0600, Pierre-Louis Bossart wrote:
> A fairly large update this time, with Brent Lu's continued cleanup of
> Chromebook cards, and updates for new SoundWire configurations.
> 
> Bard Liao (11):
>   ASoC: Intel: sof_sdw: use single rtd_init for rt_amps
>   ASoC: Intel: add get_codec_dai_by_name helper function
>   ASoC: Intel: sof_sdw_rt_sdca_jack_common: use helper to get codec dai
>     by name
>   ASoC: Intel: sof_sdw_rt711: use helper to get codec dai by name
>   ASoC: Intel: sof_sdw_rt712_sdca: use helper to get codec dai by name
>   ASoC: Intel: sof_sdw_rt700: use helper to get codec dai by name
>   ASoC: Intel: sof_sdw_cs42l42: use helper to get codec dai by name
>   ASoC: Intel: sof_sdw_rt5682: use helper to get codec dai by name
>   ASoC: Intel: sof_sdw: add common sdw dai link init
>   ASoC: Intel: sof_sdw: remove .init callbacks
>   ASoC: Intel: sof_sdw: starts non sdw BE id with the highest sdw BE id
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/24] ASoC: Intel: sof_rt5682: board id cleanup for jsl boards
        commit: 9be229ffc7a46c645a39d5993a2709d9936e046a
[02/24] ASoC: Intel: sof_rt5682: board id cleanup for tgl boards
        commit: dbda8647fb9ff39a957018673249d6bc0b1ccbf1
[03/24] ASoC: Intel: sof_rt5682: board id cleanup for adl boards
        commit: 41333c351da82a2277bb232aa74cda4181041328
[04/24] ASoC: Intel: sof_rt5682: board id cleanup for rpl boards
        commit: 19ec6b2ef8b6d1320866d2a2508cd16f95738640
[05/24] ASoC: Intel: sof_rt5682: board id cleanup for mtl boards
        commit: 922edacfadf8ca0c9a13788badaf18d41db29cd1
[06/24] ASoC: Intel: sof_rt5682: dmi quirk cleanup for mtl boards
        commit: 7a2a8730d51f95b263a1e8b888598dc6395220dc
[07/24] ASoC: Intel: board_helpers: support DAI link order customization
        commit: fff04329ac4bd21951d65f29934c15ff7e4b03a1
[08/24] ASoC: Intel: sof_cs42l42: use common module for DAI link generation
        commit: 1ad55ee7b5cd6bf6b7d06dd7262a4ddcc057c8ca
[09/24] ASoC: Intel: sof_sdw: use single rtd_init for rt_amps
        commit: 9f3763b3628def09440f1f0405cc127104c31634
[10/24] ASoC: Intel: add get_codec_dai_by_name helper function
        commit: 4ca5ba58f15ae5a9ad1fa7a5f0d0e50b03b36614
[11/24] ASoC: Intel: sof_sdw_rt_sdca_jack_common: use helper to get codec dai by name
        commit: 49f679a175b4fbdea88ba8787c22bce90c60565b
[12/24] ASoC: Intel: sof_sdw_rt711: use helper to get codec dai by name
        commit: 91a959d8913e3f2d3c3baed0a8469f878c838ff2
[13/24] ASoC: Intel: sof_sdw_rt712_sdca: use helper to get codec dai by name
        commit: c44f69bbcc7f0f4fd17ecc9ba13f9a91a6b5ccec
[14/24] ASoC: Intel: sof_sdw_rt700: use helper to get codec dai by name
        commit: 3e522c9852bc22ee4c257062fa6d57b4dd6b0f61
[15/24] ASoC: Intel: sof_sdw_cs42l42: use helper to get codec dai by name
        commit: 5e052fba621c2c57172fc6a1a9d73692fcc6d06d
[16/24] ASoC: Intel: sof_sdw_rt5682: use helper to get codec dai by name
        commit: 7bc6ceba7d354564d6b49d23830fa9d366e8ed31
[17/24] ASoC: Intel: sof_sdw: add common sdw dai link init
        commit: 8266c73126b75eabbebefe7ce489a798e9ef2662
[18/24] ASoC: Intel: sof_sdw: remove .init callbacks
        commit: 579d6596ebea488ad661bfa484c771c2b47eecc5
[19/24] ASoC: Intel: common: DMI remap for rebranded Intel NUC M15 (LAPRC710) laptops
        commit: c13e03126a5be90781084437689724254c8226e1
[20/24] ASoC: Intel: ssp-common: Add stub for sof_ssp_get_codec_name
        commit: c1469c3a8a306e5f1eab1ae9585640d08e183f87
[21/24] ASoC: Intel: sof_sdw: Remove unused function prototypes
        commit: 36fe7a495e32465b3d989459c497f0acf614be47
[22/24] ASoC: Intel: soc-acpi: add RT712 support for LNL
        commit: 0bbb0136b4e7729f533b1b3eb805c4217086e4ce
[23/24] ASoC: Intel: soc-acpi-intel-lnl-match: Add rt722 support
        commit: 7fa43af5b4cc78c4616d8345740203807593ed43
[24/24] ASoC: Intel: sof_sdw: starts non sdw BE id with the highest sdw BE id
        commit: 6b4c7d4d8297a9f395ff4addba8e5fde7f730c37

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

