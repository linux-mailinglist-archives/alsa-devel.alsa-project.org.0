Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8A47EA117
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 17:16:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08BF5208;
	Mon, 13 Nov 2023 17:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08BF5208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699892171;
	bh=krVHrXS5PV9CzkAfsNTg/W56xEGehy+8LPySVsIbTxs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JWSH2EPGjtYnLxVaHQNZmiuqjTDAkZ18TPSLnRD2jV45cmJBe0IA2dcIN1wSSJM9b
	 ZCUYxGgO3YxM+OoKSgD8Kcjje35H1hdPQAyM1cl2H9Bg5shhh/KiaDcG33vhFwCGAj
	 k14akWMgT8Tk55X9CX2N6HRNY1XUXnGoQgK1a/XU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC09CF801D5; Mon, 13 Nov 2023 17:14:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43AEBF801D5;
	Mon, 13 Nov 2023 17:14:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC138F801D5; Mon, 13 Nov 2023 17:14:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A762F80093
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 17:14:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A762F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TIigimbI
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3D3A1B80E74;
	Mon, 13 Nov 2023 16:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006F4C433C8;
	Mon, 13 Nov 2023 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699892080;
	bh=krVHrXS5PV9CzkAfsNTg/W56xEGehy+8LPySVsIbTxs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TIigimbIoRuWhhm3Th4+fgA8yMzgiTe4VLcuRRKdV0SOlu7mmypkRkeJvnGPeS4ck
	 Fo2eWhgE++fTHoC/3G+oUOyWNWCKpg5UizVYnwO4eg719cz07Sqbj6I9ck7v7bC7/K
	 nkeah1evION4qUMpjW/SM5/DTldGFQFPsTC1N1xk2pPlmbsKrC8N4+5Ti6lv+QfK5z
	 SmYcQ0JKqz2HVigFoI1udM8EaSIido8WUTI5wSAbdVTb6OogP1PZG5c4sUPkQssznL
	 9YjHePPR3uAMlaeSg0E0s/F1nhdJ4mC6n98VavtZaZEgOxvcBnHFgGBSasPPkJAifz
	 E+yopjB5pShAA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
References: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 00/17] ASoC: Intel: avs: Properly identify boards
Message-Id: <169989207732.3289099.17592806378739900331.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 16:14:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: GSC64TT6RIF6VBTD7GSVLCZBPBYCKCKJ
X-Message-ID-Hash: GSC64TT6RIF6VBTD7GSVLCZBPBYCKCKJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GSC64TT6RIF6VBTD7GSVLCZBPBYCKCKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 02 Nov 2023 13:46:55 +0100, Amadeusz Sławiński wrote:
> Instead of using MODULE_ALIAS() to load boards, add proper device id
> table and use MODULE_DEVICE_TABLE() macro to create board alias.
> 
> Amadeusz Sławiński (17):
>   ASoC: Intel: avs: da7219: Add proper id_table
>   ASoC: Intel: avs: dmic: Add proper id_table
>   ASoC: Intel: avs: es8336: Add proper id_table
>   ASoC: Intel: avs: hdaudio: Add proper id_table
>   ASoC: Intel: avs: i2s_test: Add proper id_table
>   ASoC: Intel: avs: max98357a: Add proper id_table
>   ASoC: Intel: avs: max98373: Add proper id_table
>   ASoC: Intel: avs: max98927: Add proper id_table
>   ASoC: Intel: avs: nau8825: Add proper id_table
>   ASoC: Intel: avs: probe: Add proper id_table
>   ASoC: Intel: avs: rt274: Add proper id_table
>   ASoC: Intel: avs: rt286: Add proper id_table
>   ASoC: Intel: avs: rt298: Add proper id_table
>   ASoC: Intel: avs: rt5514: Add proper id_table
>   ASoC: Intel: avs: rt5663: Add proper id_table
>   ASoC: Intel: avs: rt5682: Add proper id_table
>   ASoC: Intel: avs: ssm4567: Add proper id_table
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/17] ASoC: Intel: avs: da7219: Add proper id_table
        commit: 59fff33e9d923779b68fe46f39262256caba71d6
[02/17] ASoC: Intel: avs: dmic: Add proper id_table
        commit: deb8dcad7bc3505881e2c0680d8f01f23fcbba98
[03/17] ASoC: Intel: avs: es8336: Add proper id_table
        commit: 9441450e171fc90aa3fceadae9728acf8bd0726a
[04/17] ASoC: Intel: avs: hdaudio: Add proper id_table
        commit: 9a872caede56d20564caf30d7ea7cf61b66f4060
[05/17] ASoC: Intel: avs: i2s_test: Add proper id_table
        commit: 8267213c54db078db091b778e904ec1af8fc6ee6
[06/17] ASoC: Intel: avs: max98357a: Add proper id_table
        commit: f1e9f4f5e9e5506edbd17b33065ec8c8a9e6caab
[07/17] ASoC: Intel: avs: max98373: Add proper id_table
        commit: 8e660f303230741ecaab561a30e123e7dc76abda
[08/17] ASoC: Intel: avs: max98927: Add proper id_table
        commit: c3ff01859c31408eadfd607352d4f87e52096371
[09/17] ASoC: Intel: avs: nau8825: Add proper id_table
        commit: c94643c2b416afc473541943291e61c453846a6d
[10/17] ASoC: Intel: avs: probe: Add proper id_table
        commit: 4a5403e3a75ddc24941f754c14c3299cc0e28fe8
[11/17] ASoC: Intel: avs: rt274: Add proper id_table
        commit: 54c830fd4e38261adffa51bb22c44a2e33d803ba
[12/17] ASoC: Intel: avs: rt286: Add proper id_table
        commit: 027ab0cab18071fa3476ffe7bb69ade551515ce6
[13/17] ASoC: Intel: avs: rt298: Add proper id_table
        commit: 3d4021f30abdb7cef51a901adc0dfc4d4ee98e9d
[14/17] ASoC: Intel: avs: rt5514: Add proper id_table
        commit: 389f3c6c7ed89d53ecd83e629b7e529630cdb96c
[15/17] ASoC: Intel: avs: rt5663: Add proper id_table
        commit: 5f249523d3fcf1fe28e567a17a3053ea7ff899a0
[16/17] ASoC: Intel: avs: rt5682: Add proper id_table
        commit: ba096fc618254918056061ecef32aa77c2fcaf84
[17/17] ASoC: Intel: avs: ssm4567: Add proper id_table
        commit: ca5abf5d2e1c3860382e0e33599e969cb9c9b42b

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

