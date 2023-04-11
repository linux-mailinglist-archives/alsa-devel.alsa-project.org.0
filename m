Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F796DE448
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 20:49:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C00A4ED6;
	Tue, 11 Apr 2023 20:48:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C00A4ED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681238951;
	bh=0jOCv6Cb49uZQjQfigRBnkFQqWnrScNrbGxiuU5DAHc=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kseIZnE6BenrLT+rJB1y3I1IAXNbPrdpYXhGzgH3TeKGT5A+u/mX44KE2nq9BkVeD
	 tcfrnXM3StBXePzYd/sLZgpzZV+Uta2zzILwdJsUDh9dbdEzk+j4KMN1HhTmBDqOA9
	 0xCMDrupc25dXg3gtX2l6lC2ABevc0T/BgiioGmY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AB32F8025E;
	Tue, 11 Apr 2023 20:48:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6FF2F8032B; Tue, 11 Apr 2023 20:48:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37E7DF80100
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 20:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E7DF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Lz6fTEIQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C77166023F;
	Tue, 11 Apr 2023 18:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C930AC433D2;
	Tue, 11 Apr 2023 18:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681238885;
	bh=0jOCv6Cb49uZQjQfigRBnkFQqWnrScNrbGxiuU5DAHc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Lz6fTEIQmlpqn5YdtQz/d7H5KDhIwZGGfFaP9Q9zoYLiLfmE+PE2dccuUI0SWERol
	 IsnnV71fB0M7iX6u7l3dOfCy/NtVWeHiAPSm5X0GoNjjE9SoPDKkE+Y8sK78DCUMWy
	 o7KEocriV0iay0i8lLXLZR9+L9ellpq/HGTVm3rQwlVVE06xXYxUHx9pi9k5PBHBV+
	 devE8yOrap3ZB3zqJgWHdefQsLFpXD9PLKqd4DhbFWf0sB+rvoL5prcGPWpM2WmxXI
	 RCxzfuscrln7C54l1+U8mfCK2TEgi1gPGRT30LF0A1OlPR2lOmtr0Qcg3uC4lJIrbs
	 vrfCdBGXnZeUQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.de, perex@perex.cz,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 00/18] ASoC: SOF: Intel: hda-mlink: HDaudio
 multi-link extension update
Message-Id: <168123888252.850945.12076144065029229571.b4-ty@kernel.org>
Date: Tue, 11 Apr 2023 19:48:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: J3F6BHX5GMWAY2GYZMAL4EVCT2MYXJOE
X-Message-ID-Hash: J3F6BHX5GMWAY2GYZMAL4EVCT2MYXJOE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, amadeuszx.slawinski@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3F6BHX5GMWAY2GYZMAL4EVCT2MYXJOE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 04 Apr 2023 13:41:09 +0300, Peter Ujfalusi wrote:
> Changes since v1:
> - Rename hda_bus_ml_get_capabilities() to hda_bus_ml_init() - patch 06/18
> - Rename check_power_active() to check_sublink_power() and the parameter from
>   enable to enabled - patch 08/18
> 
> Not changed: the poll timeout implementation for now, as Pierre mentioned it can
> be done at a later time.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/18] Documentation: sound: add description of Intel HDaudio multi-links
        commit: c7a92574ec03692a057db541db12e41744a862fa
[02/18] ALSA: hda: add HDaudio Extended link definitions
        commit: 34e582b559c78746c544442b3925554e0665351b
[03/18] ASoC: SOF: Intel: hda-mlink: improve hda_bus_ml_free() helper
        commit: 8a55786a1875bd0b9c22156e800557a931baacb8
[04/18] ASoC: SOF: Intel: hda-mlink: add return value for hda_bus_ml_get_capabilities()
        commit: 68376a3ef41f0a2d6c1c603e7293ba0e00b293da
[05/18] ASoC: SOF: Intel: hda-mlink: move to a dedicated module
        commit: 18227585d8374ce16d3a2792deb125794710de43
[06/18] ASoC: SOF: Intel: hda-mlink: add structures to parse ALT links
        commit: 17c9b6ec35c0d6228db4f94590702a0cb03cd96a
[07/18] ASoC: SOF: Intel: hda-mlink: special-case HDaudio regular links
        commit: 4c2d4e446d5673db2c653a6e53ca9be908582c4e
[08/18] ASoC: SOF: Intel: hda-mlink: introduce helpers for 'extended links' PM
        commit: fc7dab8ec0b4a451dd5737aa4f06a0e8bd6efa32
[09/18] ASoC: SOF: Intel: hda-mlink: add convenience helpers for SoundWire PM
        commit: 725218f1d8210ee6eba2c2e923ea26a312fb3f46
[10/18] ASoC: SOF: Intel: hda-mlink: add helper to return sublink count
        commit: 6857c7ee202cf4b8224882bcee8e3b97c26b6484
[11/18] ASoC: SOF: Intel: hda-mlink: add helpers to enable/check interrupts
        commit: 2e4288319ad3e18a266461d3e63c86eb36f7a152
[12/18] ASoC: SOF: Intel: hda-mlink: add helpers to set link SYNC frequency
        commit: 02ba1b021c28670011b361be3be4bda49f348c43
[13/18] ASoC: SOF: Intel: hda-mlink: add helpers for sync_arm/sync_go
        commit: 1f5a6e8b5147b7bc49c0e091f8b458e45d8ee56c
[14/18] ASoC: SOF: Intel: hda-mlink: add helper to check cmdsync
        commit: d56d205857a2f6e10a1047532134321072f758b7
[15/18] ASoC: SOF: Intel: hda-mlink: program SoundWire LSDIID registers
        commit: 87a6ddc0cf1c62dbc7c2cc4b5f764a2e992c5ba6
[16/18] ASoC: SOF: Intel: hda-mlink: add helpers to retrieve DMIC/SSP hlink
        commit: 2b864e969be29958eb810fb611d1eac50eb7104b
[17/18] ASoC: SOF: Intel: hda-mlink: add helper to offload link ownership
        commit: 82958c406da4fec8f818826624c33cf2e62f4147
[18/18] ASoC: SOF: Intel: hda-mlink: add helper to retrieve eml_lock
        commit: 681f27f302ff85ddf3f6e7fd0231059f99c0f26e

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

