Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB60A09242
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2025 14:40:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70B88603B7;
	Fri, 10 Jan 2025 14:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70B88603B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736516450;
	bh=BoJZcSdyQV9YJRlJJQRR4ve9CBNlS1G5QldwJn/UACw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sy9qa++9IZMR7E56DAGZGkyZyx3EJ0tJLeHgfeS35HKd3quuUB6iltCtm8boGI97u
	 FFJL1leR4uQ/I5yoCFQQEpMEIKoIdDQ6ABb7bdyYgJ9K1E+jb/428N1PdNiogHRSRI
	 Lz0tPJHb5VukjIjQkEhKjUdHBfJqbFHZoUt7U3cQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C21DF800F3; Fri, 10 Jan 2025 14:40:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1CEEF805B4;
	Fri, 10 Jan 2025 14:40:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00907F80424; Fri, 10 Jan 2025 14:40:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6FB2F800F3
	for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2025 14:40:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6FB2F800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PnslziZL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AF635C10AB;
	Fri, 10 Jan 2025 13:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54EC3C4CED6;
	Fri, 10 Jan 2025 13:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736516401;
	bh=BoJZcSdyQV9YJRlJJQRR4ve9CBNlS1G5QldwJn/UACw=;
	h=From:To:Cc:Subject:Date:From;
	b=PnslziZLzhW7i1Ie3hQK9KPK2fTQK/k/8rv0sqltzijXzjEZUIM9Vv2LsZgsxB9KY
	 cVk4MrPqFJHYRSiV5yyk7BdJrDCvLyKIbCpPPyNGo2X3V/AAwiH6hoSjPT7rpdba/f
	 sA+6pZAC+q4FcyRydkt0yV8GpZGdBCKeKADusnANg1u2d6RTM7kt2bOeXv/8/bVxv8
	 mXCzfc2DUaN8saL665JF94Z2Ic79a5lrDpL5PbeASpw7qdtoLfvzJqME6u3Rx19DAq
	 FNyFEJyMTI8zWg3xkCIc75bgYfsqCL64NiG5RUi+8W3L0gycvY5nDPJGWQWVc4R8Xd
	 IF586YnxqkO1A==
Message-ID: <ec56d60518413ecceb0ca51a8a6d0806.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.13-rc6
Date: Fri, 10 Jan 2025 13:39:52 +0000
Message-ID-Hash: YDSGM2LZAQXWNKHLY424OQJEWJVMKW2Z
X-Message-ID-Hash: YDSGM2LZAQXWNKHLY424OQJEWJVMKW2Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDSGM2LZAQXWNKHLY424OQJEWJVMKW2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 32c9c06adb5b157ef259233775a063a43746d699:

  ASoC: mediatek: disable buffer pre-allocation (2024-12-19 11:15:09 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.13-rc6

for you to fetch changes up to 139fa599cea0fd9d38e00246ea9f79af6c59acbd:

  ASoC: rsnd: check rsnd_adg_clk_enable() return value (2025-01-09 13:17:02 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.13

A collection of device specific fixes that came in over the holidays,
plus a MAINTAINERS update and some documentation to help users debug
problems with some of the Cirrus CODECs found in modern laptops.

----------------------------------------------------------------
Charles Keepax (3):
      ASoC: wm8994: Add depends on MFD core
      ASoC: samsung: Add missing selects for MFD_WM8994
      ASoC: samsung: Add missing depends on I2C

Kuninori Morimoto (2):
      MAINTAINERS: add missing maintainers for Simple Audio Card
      ASoC: rsnd: check rsnd_adg_clk_enable() return value

Maciej Strozek (1):
      ASoC: cs42l43: Add codec force suspend/resume ops

Marian Postevca (1):
      ASoC: codecs: es8316: Fix HW rate calculation for 48Mhz MCLK

Richard Fitzgerald (2):
      ALSA: doc: cs35l56: Add information about Cirrus Logic CS35L54/56/57
      ALSA: doc: Add codecs/index.rst to top-level index

Shenghao Ding (1):
      ASoC: tas2781: Fix occasional calibration failture

Zhang Yi (1):
      ASoC: codecs: ES8326: Adjust ANA_MICBIAS to reduce pop noise

 Documentation/sound/codecs/cs35l56.rst | 292 +++++++++++++++++++++++++++++++++
 Documentation/sound/codecs/index.rst   |   9 +
 Documentation/sound/index.rst          |   1 +
 MAINTAINERS                            |   2 +
 sound/soc/codecs/Kconfig               |   1 +
 sound/soc/codecs/cs42l43.c             |   1 +
 sound/soc/codecs/es8316.c              |  10 +-
 sound/soc/codecs/es8326.c              |  23 ++-
 sound/soc/codecs/tas2781-i2c.c         |   2 +-
 sound/soc/renesas/rcar/adg.c           |  28 +++-
 sound/soc/renesas/rcar/core.c          |   4 +-
 sound/soc/renesas/rcar/rsnd.h          |   2 +-
 sound/soc/samsung/Kconfig              |   6 +-
 13 files changed, 364 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/sound/codecs/cs35l56.rst
 create mode 100644 Documentation/sound/codecs/index.rst
