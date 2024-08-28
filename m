Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B440962EA0
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Aug 2024 19:37:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 296AB868;
	Wed, 28 Aug 2024 19:36:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 296AB868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724866623;
	bh=Ipfd1MvAJqgFMf2pYYTe8CSQDsZ7Q06QhFMYtJy3JP4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cTj+3A1T/UXspgXB3IQo+p1tEuBApnM5HsVGrWpvh8CYDoEKQ2rwsh/t6r5qzNK9a
	 TyihCum758NG2+cicSr6OsZiLPZibDqRrJgmE8qjrwlABaRJxlcaJOdiFCDOhulJsH
	 Nn/M4k/38/5A55KCFRVqYNdl3Xhcx97qWNOwfPGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35BC8F805A0; Wed, 28 Aug 2024 19:36:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3721EF805A8;
	Wed, 28 Aug 2024 19:36:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66BACF80528; Wed, 28 Aug 2024 19:36:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D1B3F80087
	for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2024 19:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D1B3F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aQjYMt2R
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 40B71A426BC;
	Wed, 28 Aug 2024 17:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0F9C4CEC0;
	Wed, 28 Aug 2024 17:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724866582;
	bh=Ipfd1MvAJqgFMf2pYYTe8CSQDsZ7Q06QhFMYtJy3JP4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aQjYMt2RV+301uRWwFPXqgxK33MrRo723noY5EFMtxUDhDrEmjgf5SbfNZ5wJQXgT
	 WAL06En1fe9QXyj3V6pLdMorrH+NLRg/dVfw3yiGhvsNp9nJVFKb9soxpgdXKsUp1J
	 Ho9W3OHnT6Ag24I9qUyCeTn0unHvnhaUqlsFt4+uDmF28AY5sdleCNGrUxT9t9wJTb
	 RgSyax/4y3cGmBRbBXLEvb8TobCOFFrfjRLDFDp/YUT2yOqhkyXImiuIjZhC9K6W8r
	 0qCOUUloVrS9MELOuG82iscTj8aF0yzjOnTsIi6CN1/WLdEKrRxVVjwKbK/2Rxq3rF
	 Os5vHW/A04WoA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/18] ASoC: Intel: boards: updates for 6.11
Message-Id: <172486658149.355291.13919555062040611045.b4-ty@kernel.org>
Date: Wed, 28 Aug 2024 18:36:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: 3I7YF26C6VW4HO4G634G33MRHZWAZZMR
X-Message-ID-Hash: 3I7YF26C6VW4HO4G634G33MRHZWAZZMR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3I7YF26C6VW4HO4G634G33MRHZWAZZMR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 May 2024 14:35:34 -0500, Pierre-Louis Bossart wrote:
> More simplifications from Brent Lu for Chromebooks, Bard Liao for
> SoundWire, and support for new Dell SKUs w/ Cirrus Logic codecs added
> by Charles Keepax.
> 
> Bard Liao (7):
>   ASoC: Intel: sof_sdw_cs42l42: use dai parameter
>   ASoC: Intel: sof_sdw_rt711: use dai parameter
>   ASoC: Intel: sof_sdw_rt5682: use dai parameter
>   ASoC: Intel: sof_sdw_rt700: use dai parameter
>   ASoC: Intel: sof_sdw_rt_dmic: use from dai parameter
>   ASoC: Intel: sof_sdw_rt_sdca_jack_common: use dai parameter
>   ASoC: Intel: sof_sdw: remove get_codec_dai_by_name
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/18] ASoC: Intel: sof_sdw_cs42l42: use dai parameter
        (no commit info)
[02/18] ASoC: Intel: sof_sdw_rt711: use dai parameter
        (no commit info)
[03/18] ASoC: Intel: sof_sdw_rt5682: use dai parameter
        (no commit info)
[04/18] ASoC: Intel: sof_sdw_rt700: use dai parameter
        (no commit info)
[05/18] ASoC: Intel: sof_sdw_rt_dmic: use from dai parameter
        (no commit info)
[06/18] ASoC: Intel: sof_sdw_rt_sdca_jack_common: use dai parameter
        (no commit info)
[07/18] ASoC: Intel: sof_sdw: remove get_codec_dai_by_name
        (no commit info)
[08/18] ASoC: Intel: sof_sdw: Add missing controls for cs42l43/cs35l56
        (no commit info)
[09/18] ASoC: Intel: soc-acpi: Add match entries for some cs42l43 laptops
        (no commit info)
[10/18] ASoC: Intel: sof_sdw: Add quirks for some new Dell laptops
        (no commit info)
[11/18] ASoC: Intel: sof_sdw: Add quirks from some new Dell laptops
        commit: 9307694f340e518cac0e007f39dd9ff0736e6144
[12/18] ASoC: SOF: sof-audio: rename dai clock setting query function
        (no commit info)
[13/18] ASoC: SOF: sof-audio: add sof_dai_get_tdm_slots function
        (no commit info)
[14/18] ASoC: SOF: ipc3-topology: support tdm slot number query
        (no commit info)
[15/18] ASoC: SOF: ipc4-topology: support tdm slot number query
        (no commit info)
[16/18] ASoC: Intel: maxim-common: rewrite max_98373_hw_params function
        (no commit info)
[17/18] ASoC: Intel: sof_da7219: remove local max98373 ops
        (no commit info)
[18/18] ASoC: Intel: sof_da7219: disable max98373 speaker pins in late_probe
        (no commit info)

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

