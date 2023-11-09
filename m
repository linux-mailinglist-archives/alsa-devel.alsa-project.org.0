Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CF77E6981
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Nov 2023 12:26:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DAA3210;
	Thu,  9 Nov 2023 12:25:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DAA3210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699529208;
	bh=2ssDZTLymurEkUDyTi0V9CWM1/7ETzD0Yw02EIA8t4w=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BrahZEeGFyI+lmi5qtLNIS6BIZJb227CDicB0HpXzfvU++wDytgYG436CQSTxIu8r
	 omM7vFNon7nAIyLOoMlgPBBgFauBSyQDHcyAeWY8zdtAzelUoX9BWfK9Re2YwmQoMJ
	 sWOcEyr4HlYK+igjPAMqVwjW988WTbP53m4L9daw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0F0CF80169; Thu,  9 Nov 2023 12:25:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A9F7F80166;
	Thu,  9 Nov 2023 12:25:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E4AAF80169; Thu,  9 Nov 2023 12:24:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC29BF80125
	for <alsa-devel@alsa-project.org>; Thu,  9 Nov 2023 12:24:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC29BF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NO7OHmRo
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8619FCE127F;
	Thu,  9 Nov 2023 11:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D759C433C7;
	Thu,  9 Nov 2023 11:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699529058;
	bh=2ssDZTLymurEkUDyTi0V9CWM1/7ETzD0Yw02EIA8t4w=;
	h=From:To:Cc:Subject:Date:From;
	b=NO7OHmRovA46vbzBqFxE+xepMvxUXrzAF1duJ75vXhgpW/wyX3RxHqlNvIebWj3Yw
	 EpSkU10c+4wm+PIlnzLu81c4TV349JQnw19LRguSoi0XRAnGhz7nVVlag0Js4c2Wz3
	 m2bRyjoukKcyOggIqkjp4V0wdkYUVUQJ8nnWPzyq22k1igywcfOCs44qXDU9YFDXa5
	 cNNTDvYEpWLBJ/tnHP5wgcbq2yy82j0NZdpCnOQbJ9HpSF9E2/X7PKD54lEOObOAu3
	 vuENcNFWCs59c39+Uv/6NRArBzn61XlBQ1zCp6gidIAWP0ZvgV2UQN6R4/q4iMpqmr
	 MCOlWfOVZgJSw==
Message-ID: <80a36a7ac7e67694c72bbf94744ec647.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.7-merge-window-2
Date: Thu, 09 Nov 2023 11:24:08 +0000
Message-ID-Hash: TPPJHKPQ75ISBEWW73SGAXESAJDT3D3N
X-Message-ID-Hash: TPPJHKPQ75ISBEWW73SGAXESAJDT3D3N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TPPJHKPQ75ISBEWW73SGAXESAJDT3D3N/>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.7-merge-window-2

for you to fetch changes up to a60a609b7f548050d1e84c7aa1c0a57d5d7e22d5:

  ASoC: nau8540: Add self recovery to improve capture quility (2023-11-08 13:21:05 +0000)

----------------------------------------------------------------
ASoC: One more fix for the merge window

One additional driver fix that came in during the merge window.

----------------------------------------------------------------
David Lin (1):
      ASoC: nau8540: Add self recovery to improve capture quility

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

 sound/soc/amd/acp/acp-i2s.c                        |  4 +-
 sound/soc/codecs/aw88395/aw88395.c                 |  2 +-
 sound/soc/codecs/aw88399.c                         |  8 ++--
 sound/soc/codecs/aw88399.h                         |  2 +-
 sound/soc/codecs/da7219-aad.c                      |  9 +++-
 sound/soc/codecs/hdmi-codec.c                      | 27 ++++++++----
 sound/soc/codecs/nau8540.c                         | 49 ++++++++++++++++++++++
 sound/soc/codecs/nau8540.h                         | 15 +++++++
 sound/soc/codecs/rt712-sdca.c                      | 14 +++----
 .../mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c |  4 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |  2 +-
 sound/soc/soc-dapm.c                               |  2 +-
 sound/soc/sof/sof-client.c                         |  2 +-
 sound/soc/ti/omap-mcbsp.c                          |  6 ++-
 14 files changed, 114 insertions(+), 32 deletions(-)
