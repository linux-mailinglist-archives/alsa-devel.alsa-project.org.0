Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 927ABCB45EB
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Dec 2025 01:51:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D147E6020F;
	Thu, 11 Dec 2025 01:51:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D147E6020F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765414307;
	bh=ugYzIIND/LcIOVmEMPIMFDr53DhGYIWESwbexiw2vIY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HKxTBcjn7EXBWLKDZ0ArQ/n95qEV8hWEFi/EaoeH4tJRyySdauE1EAr7ltl6GwwO2
	 m/31Dd2oIsSaPmUCIHiA7DW3zKvifLTOvip55y7Ign8qarYAT/ef1bAeP3trBCN0zh
	 Zjfh4Omm04POn4yr7Sy+Epiyb9bNOl16+Q5tLFeI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA36DF805C8; Thu, 11 Dec 2025 01:51:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84EB8F805D8;
	Thu, 11 Dec 2025 01:51:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D417F804CC; Thu, 11 Dec 2025 01:49:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B645F80448
	for <alsa-devel@alsa-project.org>; Thu, 11 Dec 2025 01:48:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B645F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UQeYRf6n
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0765A41869;
	Thu, 11 Dec 2025 00:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FAAC4CEF1;
	Thu, 11 Dec 2025 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765414129;
	bh=ugYzIIND/LcIOVmEMPIMFDr53DhGYIWESwbexiw2vIY=;
	h=From:To:Cc:Subject:Date:From;
	b=UQeYRf6nMfdNfoY9qa+qNYjSPErFlkrtdsanbnxGUPj5IzJRKTBYconp7FFoa/zXL
	 RyoV5ahEfAMk6kFIBE2VSG9oewfJoxlV9oTDrBxnH4uD7IbsQIL7e37EB7P1SB+/PA
	 k/FgZy1nj4VPGUrH7JfLrppnh5L9gc/+4JJrvpU6w0GPR1/M0zf5mtm0eMpbIVr3BR
	 T2qENNRKjz3/eDLJ9N6ITecE8BNKJsRZoeIU4u+J3vlJMwAlqmxCWBxP+Uf41GotFy
	 +6cfxtWlKKzrd127lRq/nKw9SZBetPwLReWxlYalM+wKfz5nY7/qKzqb6buLWTCwCH
	 5qD0U23WUXEAw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5B15D1ACB974; Thu, 11 Dec 2025 00:48:47 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.19-merge-window
Date: Thu, 11 Dec 2025 09:48:41 +0900
Message-Id: <20251211004847.5B15D1ACB974@finisterre.sirena.org.uk>
Message-ID-Hash: U4TXUPB5G67T3X64JQEVGBZ6H2QAAFUM
X-Message-ID-Hash: U4TXUPB5G67T3X64JQEVGBZ6H2QAAFUM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4TXUPB5G67T3X64JQEVGBZ6H2QAAFUM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit c5fae31f60a91dbe884ef2789fb3440bb4cddf05:

  ASoC: fsl_micfil: Set default quality and channel (2025-11-29 00:59:00 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.19-merge-window

for you to fetch changes up to f34836a8ddf9216ff919927cddb705022bf30aab:

  ASoC: amd: acp: update tdm channels for specific DAI (2025-12-10 09:17:53 +0900)

----------------------------------------------------------------
ASoC: Fixes for v6.19

A small pile of fixes that came in during the merge window, it's all
fairly standard device specific stuff.

----------------------------------------------------------------
Eric Biggers (1):
      ASoC: cros_ec_codec: Remove unnecessary selection of CRYPTO

Eric Naim (1):
      ASoC: cs35l41: Always return 0 when a subsystem ID is found

Haotian Zhang (1):
      ASoC: bcm: bcm63xx-pcm-whistler: Check return value of of_dma_configure()

Hemalatha Pinnamreddy (2):
      ASoC: amd: acp: Audio is not resuming after s0ix
      ASoC: amd: acp: update tdm channels for specific DAI

Johan Hovold (4):
      ASoC: codecs: wcd937x: fix OF node leaks on probe failure
      ASoC: codecs: wcd938x: fix OF node leaks on probe failure
      ASoC: codecs: wcd939x: fix OF node leaks on probe failure
      ASoc: qcom: q6afe: fix bad guard conversion

Krzysztof Kozlowski (2):
      ASoC: codecs: nau8325: Silence uninitialized variables warnings
      ASoC: rockchip: Fix Wvoid-pointer-to-enum-cast warning (again)

Mark Brown (2):
      ASoC: ak4458 & ak5558: disable regulator if error
      ASoC: codecs: wcd93xx: fix OF node leaks on probe

Richard Fitzgerald (2):
      ASoC: cs-amp-lib: Revert use of __free(kfree) back to normal C cleanup
      ASoC: cs35l56: Fix incorrect select SND_SOC_CS35L56_CAL_SYSFS_COMMON

Shengjiu Wang (3):
      ASoC: dt-bindings: cirrus,cs42xx8: Reference common DAI properties
      ASoC: ak4458: Disable regulator when error happens
      ASoC: ak5558: Disable regulator when error happens

 .../devicetree/bindings/sound/cirrus,cs42xx8.yaml  |  5 +++-
 sound/soc/amd/acp/acp-i2s.c                        |  2 ++
 sound/soc/amd/acp/acp-legacy-common.c              | 30 +++++++++++++++++-----
 sound/soc/bcm/bcm63xx-pcm-whistler.c               |  4 ++-
 sound/soc/codecs/Kconfig                           |  3 +--
 sound/soc/codecs/ak4458.c                          | 10 +++++++-
 sound/soc/codecs/ak5558.c                          | 10 +++++++-
 sound/soc/codecs/cs-amp-lib.c                      | 29 ++++++++++++---------
 sound/soc/codecs/cs35l41.c                         |  7 ++---
 sound/soc/codecs/nau8325.c                         |  4 +--
 sound/soc/codecs/wcd937x.c                         |  4 +--
 sound/soc/codecs/wcd938x.c                         |  3 +--
 sound/soc/codecs/wcd939x.c                         |  3 +--
 sound/soc/qcom/qdsp6/q6afe.c                       |  4 +--
 sound/soc/rockchip/rockchip_pdm.c                  |  2 +-
 15 files changed, 82 insertions(+), 38 deletions(-)
