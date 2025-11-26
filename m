Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5CFC8BE7C
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Nov 2025 21:48:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12E3260203;
	Wed, 26 Nov 2025 21:48:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12E3260203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764190135;
	bh=1f9WtfLoQREKfGQ1yA8+WZXm/5js8sppxuI3TY+9a7I=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZLQSLWvN8tIe5quQBjKp8LgEcO3v3yJmxytm6mKEBDke0UG9Onqv4Yed/uJVfm5rI
	 rdYbxFm88h7VZokKFskhPWj1TwSnOFlFdtfCtM3c8SDhcMkdY5n/swX4vG2YC7WUVc
	 CyCm6XGVdt16wMpk06x+Erl6R1OhH7kcRtatlw1s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC381F805BE; Wed, 26 Nov 2025 21:48:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 870DEF805C6;
	Wed, 26 Nov 2025 21:48:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FA2CF804B0; Wed, 26 Nov 2025 21:47:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D738F8003C
	for <alsa-devel@alsa-project.org>; Wed, 26 Nov 2025 21:47:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D738F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rjLj+DeH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61F8760139;
	Wed, 26 Nov 2025 20:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CF6C4CEF7;
	Wed, 26 Nov 2025 20:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764190022;
	bh=1f9WtfLoQREKfGQ1yA8+WZXm/5js8sppxuI3TY+9a7I=;
	h=From:To:Cc:Subject:Date:From;
	b=rjLj+DeHBrv+h8pEKt2VnNYIE7nI2LQDQfiwfX99M//K/Sa4RV6JyhO7PrUHSCS0l
	 8D5obaKX4qJcOUrmxjrxN7VrU3tNhIALPK0exNc+CD6v520OKsD3TOrnIgXni801CB
	 gUX2/9CDRR353AycSpi8xt7q9yMoEslZgJvPz9q43PNKWFIOMfRm98Xew2Nokx/UYs
	 w6xSBWlPPScayLUkuOTDhx5eVaEF8wRxswToiabXrRuiVSsBAdDeByJR4Ro+nBPVzN
	 AOcJDZrNii1jbn3HjJwhQq46riYj9PyvmTYt0q0sVAvJgfjB5zdWzgxGxSyvZY/ouu
	 t3zoZ5Mj+EGKw==
Message-ID: <25d5b5826b2e8d821caf7a37dea59186@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.18-rc7
Date: Wed, 26 Nov 2025 20:46:45 +0000
Message-ID-Hash: PVYBJN64UBZMAT3GVX6WOALE6W2TCS2U
X-Message-ID-Hash: PVYBJN64UBZMAT3GVX6WOALE6W2TCS2U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PVYBJN64UBZMAT3GVX6WOALE6W2TCS2U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 6a23ae0a96a600d1d12557add110e0bb6e32730c:

  Linux 6.18-rc6 (2025-11-16 14:25:38 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-rc7

for you to fetch changes up to 73b97d46dde64fa184d47865d4a532d818c3a007:

  ASoC: fsl_xcvr: clear the channel status control memory (2025-11-26 13:24:19 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.18

A small pile of driver specific fixes that came in during the past few
weeks, none of them especially major.

----------------------------------------------------------------
Baojun Xu (1):
      ASoC: tas2781: Correct the wrong chip ID for reset variable check

Biju Das (2):
      ASoC: renesas: rz-ssi: Fix channel swap issue in full duplex mode
      ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width

Ma Ke (2):
      ASoC: codecs: wcd937x: Fix error handling in wcd937x codec driver
      ASoC: codecs: Fix error handling in pm4125 audio codec driver

Shenghao Ding (1):
      ASoC: tas2781: correct the wrong period

Shengjiu Wang (1):
      ASoC: fsl_xcvr: clear the channel status control memory

Srinivas Kandagatla (1):
      ASoC: codecs: wcd934x: add explicit soundwire depenency

 sound/soc/codecs/Kconfig              |  1 +
 sound/soc/codecs/pm4125.c             | 21 ++++++++++--
 sound/soc/codecs/tas2781-comlib-i2c.c |  2 +-
 sound/soc/codecs/tas2781-i2c.c        |  2 +-
 sound/soc/codecs/wcd937x.c            | 43 ++++++++++++++++++-----
 sound/soc/fsl/fsl_xcvr.c              |  2 +-
 sound/soc/renesas/rz-ssi.c            | 64 +++++++++++++++++++++++++----------
 7 files changed, 103 insertions(+), 32 deletions(-)
