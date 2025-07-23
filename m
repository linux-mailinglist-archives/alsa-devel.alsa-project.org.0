Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A51FB0F8E6
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jul 2025 19:21:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D51E9601ED;
	Wed, 23 Jul 2025 19:20:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D51E9601ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753291267;
	bh=UI/81IiG3CPmX3FTZGJmco5ZdU4RhdKMOvL3QjjyAQI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ob5WpSm6QtaY8yumYQDi5BA/e+HYltXdYNQ2NmKzXoC1ezioP+2GXxuna+1eF7Yy6
	 qfo99mVIYeNMs4wghVys20CHokMDm7uiL+ZQbj4XTyhH0wxqPJB9zz/vPh7YFyWkuw
	 alV+tsiuqOYZrkXqgaVfkFqbXN+XQLrXokTZFbYg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 591E0F805C2; Wed, 23 Jul 2025 19:20:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F05BF805C3;
	Wed, 23 Jul 2025 19:20:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03101F8042F; Wed, 23 Jul 2025 19:20:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F09D8F800B8
	for <alsa-devel@alsa-project.org>; Wed, 23 Jul 2025 19:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F09D8F800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fpUCirDY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2A741A5471E;
	Wed, 23 Jul 2025 17:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D08EC4CEF4;
	Wed, 23 Jul 2025 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753291222;
	bh=UI/81IiG3CPmX3FTZGJmco5ZdU4RhdKMOvL3QjjyAQI=;
	h=From:To:Cc:Subject:Date:From;
	b=fpUCirDYplzPUr9ji7rEGtTobMpbIavX8NfSLfKrNfh/+hTDpApb9oJz23bYtJ0be
	 cQCew3KqhlXspziOzTJSr4odGL6aQCXs2jZ/PW8tc5389N9FzV5YttOuYeUG+am/EV
	 nQwxaJ5By1B4fEhspgEwt0vEao/ujE7q3uryP7iKQNB9+xAdLVnfA5o9flq2K6GLzx
	 /mITVBRIA8NRL7yGY9tM4HE1sju0w30z3I1RWlxVV9KSGrxFmkHD5wFtWYeqpUXspb
	 IMrgjCFXkEFaPA/n3Kx8BFLUFFe62T25/ITUL4D/ADNaNubJc7YsD+0frXSSLcznIy
	 xipr300KPlY3Q==
Message-ID: <bcb82e4ad25ee3af0e561906a507efa3.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.16-rc7
Date: Wed, 23 Jul 2025 18:20:13 +0100
Message-ID-Hash: ZPRTXMI7JVO6VFALEU6XGP6WRY7O2KML
X-Message-ID-Hash: ZPRTXMI7JVO6VFALEU6XGP6WRY7O2KML
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPRTXMI7JVO6VFALEU6XGP6WRY7O2KML/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 7bab1bd9fdf15b9fa7e6a4b0151deab93df3c80d:

  ASoC: amd: yc: Add DMI quirk for HP Laptop 17 cp-2033dx (2025-07-16 11:50:33 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc7

for you to fetch changes up to 696e123aa36bf0bc72bda98df96dd8f379a6e854:

  ASoC: mediatek: common: fix device and OF node leak (2025-07-23 13:03:57 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.16

A few device specific fixes, none especially remarkable though all
useful.

----------------------------------------------------------------
Derek Fang (1):
      ASoC: rt5650: Eliminate the high frequency glitch

Guoqing Jiang (1):
      ASoC: mediatek: mt8365-dai-i2s: pass correct size to mt8365_dai_set_priv

Johan Hovold (1):
      ASoC: mediatek: common: fix device and OF node leak

Ranjani Sridharan (1):
      ASoC: SOF: Intel: PTL: Add the sdw_process_wakeen op

Shuming Fan (1):
      ASoC: SDCA: correct the calculation of the maximum init table size

 sound/soc/codecs/rt5645.c                        | 1 +
 sound/soc/mediatek/common/mtk-soundcard-driver.c | 4 ++++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c       | 3 +--
 sound/soc/sdca/sdca_functions.c                  | 2 +-
 sound/soc/sof/intel/ptl.c                        | 1 +
 5 files changed, 8 insertions(+), 3 deletions(-)
