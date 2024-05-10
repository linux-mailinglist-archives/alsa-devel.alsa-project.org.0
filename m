Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 010418C258A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 15:18:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16936E0F;
	Fri, 10 May 2024 15:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16936E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715347135;
	bh=/nLsy48cn/5/FJ4H2kS5Kmi1MFvqq7NkJ0ZXBMVar6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jBslSKCdvRsPdO0l7qGKz/XCGV9WljvnzcPXs/QLO1xFmWj88bGD2uu2A/yvVo9Ud
	 xj0U++4++GikQa6S6JxQjECTTcbSt6r2ZFNhYAXXC/oacRCldn1WIqWM3fXpy2QcZK
	 5SPxN3OCDkSSpz2J0im5Q2jFg4mrEGY0LLi9JieM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 077C2F805A0; Fri, 10 May 2024 15:18:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E391F805A8;
	Fri, 10 May 2024 15:18:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C189F804E7; Fri, 10 May 2024 15:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,TRACKER_ID shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C143AF800E2
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 15:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C143AF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KGK170le
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB52F61ED6;
	Fri, 10 May 2024 13:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA70C113CC;
	Fri, 10 May 2024 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715347088;
	bh=/nLsy48cn/5/FJ4H2kS5Kmi1MFvqq7NkJ0ZXBMVar6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KGK170le9IrM6k/85ad+hhi3wONQlnHC53+/fw6UwaYzFzEEsDC5hNwBqR6InCtuZ
	 JdG2PpU+RFRjAIvpp7Tz7xSJWOkDaah1ZwzjOGiz5S7DhGDX9+XRHxUIMzswExIZcK
	 VVjTgndLZNX4/Xtwz6hcLfOY3LTfgQQxVwvFdofypqk5Zh3Xmp67xQvjRgnR5OXHj+
	 s1FxXohocsRzefzsrfWVKH/YegRC9cJTNRHY41SD0oIWOQh2Ulga/nOK3px63pXebt
	 h85mxPHnliuA+M5TWwNHoK0XO10znlFyDBOQn4Rl4XfVORzs9k2YstJ+zj1PNtif0y
	 ah3LwgsaXKQ6g==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/18] ASoC: Intel: updates for 6.10 - part7
Message-Id: <171534708631.2178997.6324249665709740.b4-ty@kernel.org>
Date: Fri, 10 May 2024 14:18:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: OGZLRH3R3WPNGXZRC3ZJG5E5KYE6YG4V
X-Message-ID-Hash: OGZLRH3R3WPNGXZRC3ZJG5E5KYE6YG4V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OGZLRH3R3WPNGXZRC3ZJG5E5KYE6YG4V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 May 2024 11:34:00 -0500, Pierre-Louis Bossart wrote:
> This patchset should be the last batch for this kernel cycle!
> 
> Brent Lu continued his cleanups to refactor and use fewer machine
> drivers on Chrmebooks.
> 
> Bard Liao updated the sof-sdw machine driver to deal with UCM support
> of the RT712 configuration. Note that this sof-sdw driver will be
> refactored in the next kernel cycle to allow AMD and others to reuse
> common SoundWire parts that are not Intel-specific. Initial changes
> are described here: https://github.com/thesofproject/linux/pull/4967
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/18] ASoC: Intel: sof_sdw_rt_sdca_jack_common: remove -sdca for new codecs
        commit: 9a9d31b149f3a71ad0835ea295743482601dd322
[02/18] ASoC: Intel: sof-rt5682: remove DMI quirk for hatch
        commit: 426c43ae9549559f5f5fd405bf464f9fa175e418
[03/18] ASoC: Intel: sof_rt5682: board id cleanup for mtl boards
        commit: f1a5cb6a3bd2fc518dc21561dfc784530dab60b2
[04/18] ASoC: Intel: realtek-common: remove 2-spk rt1015p config
        commit: eed867325e4b825a16946539275364699eed83d9
[05/18] ASoC: Intel: soc-acpi-intel-mtl-match: add cs42l43 only support
        commit: f77ae7fcdc47630eb7653983f3c57ac44103aebc
[06/18] ASoC: Intel: soc-acpi-intel-lnl-match: add cs42l43 only support
        commit: dd3bd9dc47084195fcb3c1b371cb03046abb13ab
[07/18] ASoC: Intel: maxim-common: add max_98373_dai_link function
        commit: 3895aa82b665d43b24ba1ac307e20df3396a6b65
[08/18] ASoC: Intel: sof_da7219: use max_98373_dai_link function
        commit: b533ed0d85cb64f9323b4221fcaad41259b08556
[09/18] ASoC: Intel: sof_nau8825: use max_98373_dai_link function
        commit: d304ab5ecb758f76bd4eafa6d7e0fac4eba48e88
[10/18] ASoC: Intel: sof_rt5682: use max_98373_dai_link function
        commit: 834c4f95673fdb4394c6cf26242d8763ee6ccf28
[11/18] ASoC: Intel: sof_sdw: add max98373 dapm routes
        commit: 15ce635f396bdb416a41840bfb5e911128585e4d
[12/18] ASoC: Intel: maxim-common: change max98373 data to static
        commit: 2bb765f053910339126626d49ae851b937d06206
[13/18] ASoC: Intel: sof_sdw_cs_amp: rename Speakers to Speaker
        commit: 1628e1c8f6f1446460fc33a06f52e5ce52ac587a
[14/18] ASoC: Intel: sof_sdw: use generic name for controls/widgets
        commit: 01c266af92f4d24d44939e7d21c36e898caaa18f
[15/18] ASoC: Intel: sof_sdw: add controls and dapm widgets in codec_info
        commit: 70d470f05f0b5bb8dea67915cac6ed6308120a89
[16/18] ASoC: Intel: sof_sdw: use .controls/.widgets to add controls/widgets
        commit: 2e3bc94796776e2695054183e7324d1a6ac27837
[17/18] ASoC: Intel: sof_sdw: add dai parameter to rtd_init callback
        commit: 84e0a19adb73d7cec5a43e02f9e2d2aafc5c7176
[18/18] ASoC: Intel: sof_sdw_rt_amp: use dai parameter
        commit: 4c11132a886ea93865e205e2d92d810722237b48

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

