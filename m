Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 104A0CFAC0E
	for <lists+alsa-devel@lfdr.de>; Tue, 06 Jan 2026 20:44:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6779F60202;
	Tue,  6 Jan 2026 20:44:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6779F60202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767728670;
	bh=s+1JedlIyWeQqbDvglfgq6oP3kT0MW4kLflc5hfg6E0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZSbulY44+DfVxRtKNhnuYtf2nUFEP9RZ+wVI7MpPxUWeET1l2w19hgxXjXGWZcI4U
	 +eVjlLNXUAfgT6b54j8Okk+6MMngLREJgeZhpzZGw0n6/aoKBEqoXgVPONQ5DlRcw5
	 m8Z0rMcXnPt5ivltU4o8BPX5fU/WepLAHqanTKgo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AA2AF805D9; Tue,  6 Jan 2026 20:44:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B771CF805D8;
	Tue,  6 Jan 2026 20:44:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A4A5F804F3; Tue,  6 Jan 2026 20:42:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C50EEF802DB
	for <alsa-devel@alsa-project.org>; Tue,  6 Jan 2026 20:42:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C50EEF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B1oloWF2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C7E240474;
	Tue,  6 Jan 2026 19:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E92C19422;
	Tue,  6 Jan 2026 19:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767728553;
	bh=s+1JedlIyWeQqbDvglfgq6oP3kT0MW4kLflc5hfg6E0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B1oloWF2QRAYBT24LurkPclFX8FBgMjCnDDwa6f/qv+XyNFyULTFn8d5TisBXnXDR
	 HDj5Nds9SgH4a6LWjtt+B+5rR4jpqActkBtTLLEZwvAQHBvMZMO7jEDlDdSRzJhFyu
	 v7g69obHF/EpvjxP/EUhkJYSgK1aBHQvbxw7R+FaW1yvBxLACFPxO0+lEMzROF4V51
	 TBdXG+ag6L1uUsLs1oFtYiKXky5wwIvU/lWg+9cSksZmPb2p0c2j0plNmiAubiSTWN
	 yq3pPlZddZ2uh4spsHBce1u2VV2Kz4C7xVShR3ygXSxfgMPyAKo15mS5gWuqcFw4fi
	 ST/ZY/qOwmLaw==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, lgirdwood@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 Oder Chiou <oder_chiou@realtek.com>
Cc: linux-spi@vger.kernel.org, perex@perex.cz, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, flove@realtek.com,
 shumingf@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <cover.1767148150.git.oder_chiou@realtek.com>
References: <cover.1767148150.git.oder_chiou@realtek.com>
Subject: Re: [PATCH v11 0/4] ASoC: rt5575: Add the codec driver for the
 ALC5575
Message-Id: <176772855067.328192.13240221041944953554.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 19:42:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
Message-ID-Hash: 6NYK4DNHGIM6CWIQ722VOCCNCVCNE5IQ
X-Message-ID-Hash: 6NYK4DNHGIM6CWIQ722VOCCNCVCNE5IQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6NYK4DNHGIM6CWIQ722VOCCNCVCNE5IQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 31 Dec 2025 10:35:01 +0800, Oder Chiou wrote:
> This patch series adds support for the Realtek ALC5575 audio codec.
> 
> Changes in v11:
> - Patch 1/4:
>   - minor fixes
> - Patch 2/4:
>   - change of_find_spi_controller_by_node() gating to CONFIG_OF
> - Patch 3/4:
>   - nothing
> - Patch 4/4:
>   - achieve reverse-christmas-tree notation
>   - remove formal version check
>   - revise check whether the firmware boots from SPI or not
>   - minor fixes
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] spi: export of_find_spi_controller_by_node()
      commit: ee69f55eb183efb43da14cdad72910b1b1cc2932
[2/4] spi: change of_find_spi_controller_by_node() gating to CONFIG_OF
      commit: 037f8d896688bf3384eb6bf34e24e8fbc9f6e02d
[3/4] ASoC: dt-bindings: realtek,rt5575: add support for ALC5575
      commit: af4c0b951b18a8af73fa8541fabf1bf2484bba9b
[4/4] ASoC: rt5575: Add the codec driver for the ALC5575
      commit: c7ac7499ac5bb50ab3e00add121822c5c904bc91

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

