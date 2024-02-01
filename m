Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7828457F0
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 13:39:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8038B844;
	Thu,  1 Feb 2024 13:39:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8038B844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706791196;
	bh=hrair1RmHBgldlMnoWXHWrsnzz2X+h/LuQ58ywvvRnw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CNOnAlISzj9P0hcxHiSzsSWuiUaMEg+1zmiY0axmgWzxMpseGsTWsZ79N5Jn47yXI
	 f1dmJC+glez1TzI1gJh0uPD1cUiUHUNXURXJLVocr5VEA5bMXl7Y33ynsTETLfNazB
	 tEAr0zwBGkNVndXwul1Qkml1Gtxl07uBWEugj1cs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE832F8057D; Thu,  1 Feb 2024 13:39:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69720F8056F;
	Thu,  1 Feb 2024 13:39:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C62CF8055C; Thu,  1 Feb 2024 13:39:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C06BF804E7
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 13:39:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C06BF804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rld94aYw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AA9F0CE25DF;
	Thu,  1 Feb 2024 12:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85589C433F1;
	Thu,  1 Feb 2024 12:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706791160;
	bh=hrair1RmHBgldlMnoWXHWrsnzz2X+h/LuQ58ywvvRnw=;
	h=From:To:Cc:Subject:Date:From;
	b=Rld94aYwTP9bW5Fnx48tbTOj3Zy99X3lvbf7PWpJWSVYvrczq9S/7q68FL4wcu0Uf
	 oBlJUDt/aT2P6YfA5LdpziNilp0CZS+oZmvAEz+pqmQQStbrID92jzScXVr/O4G7P+
	 ThxPIQjXpNSfAUIY4MwnZrGoLq1AP2LAhR40s/HYBP2xIv4DBvZr9Z5kAnBlW3FqUr
	 D3CjBo4YrP7tHq31W/ATn8Tf282PPrAF6v6pVVqZUMTgtG2UP7iBwFMmQETc4YS2AA
	 ry5PMNyx0e8qjh/lUGCTxH/TWGyyldsp+xM7jWrJS+NisnSU+jR73lV2VRkCwtyvhB
	 X079NuB2GGWOA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.8-rc2
Date: Thu, 01 Feb 2024 12:39:17 +0000
Message-Id: <20240201123920.85589C433F1@smtp.kernel.org>
Message-ID-Hash: B7SISAH5RB4LINPA44QLLDMPUI3YAIO4
X-Message-ID-Hash: B7SISAH5RB4LINPA44QLLDMPUI3YAIO4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B7SISAH5RB4LINPA44QLLDMPUI3YAIO4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.8-rc2

for you to fetch changes up to 5513c5d0fb3d509cdd0a11afc18441c57eb7c94c:

  ASoC: amd: acp: Fix support for a Huawei Matebook laptop (2024-01-29 20:16:36 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.8

Quite a lot of fixes that came in since the merge window, a large
portion for for Qualcomm and ES8326.

The 8 DAI support for Qualcomm is just raising a constant to allow for
devies that otherwise only need DTs, and there's a few other device ID
updates for sunxi (Allwinner) and AMD platforms.

----------------------------------------------------------------
Chen-Yu Tsai (3):
      ASoC: sunxi: sun4i-spdif: Add support for Allwinner H616
      ASoC: sun4i-spdif: Fix requirements for H6
      ASoC: sun4i-spdif: Add Allwinner H616 compatible

Fei Shao (1):
      ASoC: codecs: ES8326: Remove executable bit

Johan Hovold (5):
      ASoC: codecs: wsa883x: fix PA volume control
      ASoC: codecs: lpass-wsa-macro: fix compander volume hack
      ASoC: codecs: wcd9335: drop unused gain hack remnant
      ASoC: codecs: wcd938x: fix headphones volume controls
      ASoC: qcom: sc8280xp: limit speaker volumes

Krzysztof Kozlowski (4):
      ASoC: codecs: wcd938x: handle deferred probe
      ASoC: codecs: wcd938x: skip printing deferred probe failuers
      ASoC: codecs: wcd934x: drop unneeded regulator include
      ASoC: allow up to eight CPU/codec DAIs

Marian Postevca (1):
      ASoC: amd: acp: Fix support for a Huawei Matebook laptop

Mark Brown (3):
      ASoC: codecs: fix ES8326 performance and pop noise
      ASoC: qcom: volume fixes and codec cleanups
      arm64: sun50i-h616: Add DMA and SPDIF controllers

Techno Mooney (1):
      ASoC: amd: yc: Add DMI quirk for MSI Bravo 15 C7VF

Venkata Prasad Potturu (3):
      ASoC: amd: acp: Enable rt5682s clocks in acp slave mode
      ASoC: amd: acp: Update platform name for different boards
      ASoC: amd: acp: Add check for cpu dai link initialization

Zhu Ning (4):
      ASoC: codecs: ES8326: improving crosstalk performance
      ASoC: codecs: ES8326: Improving the THD+N performance
      ASoC: codecs: ES8326: Minimize the pop noise on headphone
      ASoC: codecs: ES8326: fix the capture noise issue

 .../bindings/sound/allwinner,sun4i-a10-spdif.yaml  |   5 +-
 sound/soc/amd/acp/acp-mach-common.c                |  16 +-
 sound/soc/amd/acp/acp-sof-mach.c                   |   4 +
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c      |   8 +
 sound/soc/amd/yc/acp6x-mach.c                      |   7 +
 sound/soc/codecs/es8326.c                          | 186 +++++++++++++++------
 sound/soc/codecs/es8326.h                          |   3 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |   7 -
 sound/soc/codecs/wcd9335.c                         |   4 -
 sound/soc/codecs/wcd934x.c                         |   1 -
 sound/soc/codecs/wcd938x.c                         |   8 +-
 sound/soc/codecs/wsa883x.c                         |   6 +-
 sound/soc/qcom/sc8280xp.c                          |  12 +-
 sound/soc/soc-core.c                               |   5 +-
 sound/soc/sunxi/sun4i-spdif.c                      |   5 +
 15 files changed, 202 insertions(+), 75 deletions(-)
 mode change 100755 => 100644 sound/soc/codecs/es8326.c
