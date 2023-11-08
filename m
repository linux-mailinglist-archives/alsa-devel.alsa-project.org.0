Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCB67E5B84
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 17:40:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EAC1844;
	Wed,  8 Nov 2023 17:40:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EAC1844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699461655;
	bh=fjIN9zVPLMc/bPGiJA0dcLwDOVeX3TJnOWVJAAggkws=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AeN2repFWJ9aAijCZbG1WkmmOYEIQ2W697qs4nHf4Tl3gvuiDBo6As3jLGLnKRCTR
	 jY5Ri4mX3KjELc72vTg0TzgGcCgJv1Y4uEpSAlyurdIt4P7fQOkj1ltKavqynEf1df
	 RyXtieK7jXaNzIrPRrAoqm8xdZPFcNGPW1Hz8cUo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7CFFF80169; Wed,  8 Nov 2023 17:39:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2C8FF80169;
	Wed,  8 Nov 2023 17:39:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59A80F8016D; Wed,  8 Nov 2023 17:39:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15B44F80100
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 17:39:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15B44F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NO5xP0Wp
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D064EB81DA4;
	Wed,  8 Nov 2023 16:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647C4C433C8;
	Wed,  8 Nov 2023 16:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699461557;
	bh=fjIN9zVPLMc/bPGiJA0dcLwDOVeX3TJnOWVJAAggkws=;
	h=From:To:Cc:Subject:Date:From;
	b=NO5xP0Wp7pLUr98exC3tkUokMXlf6Hl3jGP6oqr1inG07kx3F4Q0a2E6kA+rCys8f
	 MtURB1lJI4eDZ4vQEFwCdanqulXT3BF1SEDZ2etkLvM4Bop4xs0h77iO8mb8MbmUp3
	 y4GWWEDVBSdc/P5DU8wj6U3Xh0YEiffAAKVMqEmR34GPot2AGLm3I2xtjq/KYS/AR6
	 HD95VeDFzOlFyDaIWpajvP67C5HxxyyREfgYwQ+kDt6u9fOz5+I7ycinxEX5e5eLVR
	 toeZxNdfsWd15u/yXsvPt3QIpNoOMpXYccn0loMlnW6i3Lir/Q6whCqcTomwEYgar2
	 wDkoagkyGXw3g==
Message-ID: <c4dc4d36e05e84071dfbaf0e1e1a172a.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.7-merge-window
Date: Wed, 08 Nov 2023 16:38:08 +0000
Message-ID-Hash: RYOAZQ2I3OQW4BEFXOH4PHKWXZSQZCP5
X-Message-ID-Hash: RYOAZQ2I3OQW4BEFXOH4PHKWXZSQZCP5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYOAZQ2I3OQW4BEFXOH4PHKWXZSQZCP5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit bdb7e1922052b1e7fcce63e2cfa195958ff97e05:

  ASoC: Merge up workaround for CODECs that play noise on stopped stream (2023-10-27 22:33:15 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.7-merge-window

for you to fetch changes up to 45f2f28bd498fb697d07a38775d55f0f50fee5ca:

  ASoC: SOF: sof-client: trivial: fix comment typo (2023-11-07 11:10:19 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.7

A collection of fixes that have come in during the merge window, the
majority of this is driver specific with one core fix for handling of
DAPM clock widgets when a name prefix is specified for the card - the
name should not be applied to the clock name we request from the clock
API.

----------------------------------------------------------------
David Rau (1):
      ASoC: da7219: Improve system suspend and resume handling

Eugen Hristev (2):
      ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: trivial: fix error messages
      ASoC: SOF: sof-client: trivial: fix comment typo

Jerome Brunet (2):
      ASoC: hdmi-codec: register hpd callback on component probe
      ASoC: dapm: fix clock get name

Mark Brown (1):
      ASoC: codecs: Modify some error codes

Nathan Chancellor (1):
      ASoC: codecs: aw88399: Fix -Wuninitialized in aw_dev_set_vcalb()

Rob Herring (1):
      ASoC: rockchip: Fix unused rockchip_i2s_tdm_match warning for !CONFIG_OF

Shuming Fan (1):
      ASoC: rt712-sdca: fix speaker route missing issue

Syed Saba Kareem (1):
      ASoC: amd: acp: fix for i2s mode register field update

Tony Lindgren (1):
      ASoC: ti: omap-mcbsp: Fix runtime PM underflow warnings

Weidong Wang (3):
      ASoC: codecs: Modify the maximum value of calib
      ASoC: codecs: Modify the wrong judgment of re value
      ASoC: codecs: Modify macro value error

 sound/soc/amd/acp/acp-i2s.c                        |  4 ++--
 sound/soc/codecs/aw88395/aw88395.c                 |  2 +-
 sound/soc/codecs/aw88399.c                         |  8 +++----
 sound/soc/codecs/aw88399.h                         |  2 +-
 sound/soc/codecs/da7219-aad.c                      |  9 ++++++--
 sound/soc/codecs/hdmi-codec.c                      | 27 +++++++++++++++-------
 sound/soc/codecs/rt712-sdca.c                      | 14 +++++------
 .../mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c |  4 ++--
 sound/soc/rockchip/rockchip_i2s_tdm.c              |  2 +-
 sound/soc/soc-dapm.c                               |  2 +-
 sound/soc/sof/sof-client.c                         |  2 +-
 sound/soc/ti/omap-mcbsp.c                          |  6 +++--
 12 files changed, 50 insertions(+), 32 deletions(-)
