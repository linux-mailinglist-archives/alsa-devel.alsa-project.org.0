Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A593F7CDF67
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 16:23:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B22F1DEC;
	Wed, 18 Oct 2023 16:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B22F1DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697639015;
	bh=8QCm23ZRZII1EsgTvTnLkIwJYkr4K4AdZwzs1IEXVBU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=m3m4MvRxWIygBE/5YCaQjdFAltzLrSV9AruR3i6zbSf9Sn1Y2Z1TVkJ1aknIG34kY
	 0hu/nCEut47iD/oOzP9GNQghbPLXI1nXDEKj/qqini6YZhlEmJmUWzm5jMwsruxDy4
	 CnFfa78VhuuOsVYoQ/rPvFoI6MqJMNqhA8Z3ra2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02730F8024E; Wed, 18 Oct 2023 16:22:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A10A4F8024E;
	Wed, 18 Oct 2023 16:22:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94E7BF8025F; Wed, 18 Oct 2023 16:22:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8517BF8019B
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 16:22:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8517BF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tu+e+z6H
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D5DA4B8239F;
	Wed, 18 Oct 2023 14:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A433EC433C7;
	Wed, 18 Oct 2023 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697638957;
	bh=8QCm23ZRZII1EsgTvTnLkIwJYkr4K4AdZwzs1IEXVBU=;
	h=From:To:Cc:Subject:Date:From;
	b=tu+e+z6HtLfys5stA6+K/LOTHeOIdRyQV+qkaJxNCisvY/3s6hg9IwYgr9TdWP0ZP
	 F6aJsYpiA7X6VoBkOse2bQ8/9bSJE3sfXhs8J+P48jsZ4TnEmyKwea8SDg8JkSDqAj
	 II1rRlV00SXqTMJFSbRICTG2q6R5oxMDb5InKh6zDG2s3tNvPRXpsJ4gOQ7uNktecU
	 PuhBG6IX+HRCrEESGueEppvCpl/pf70UrLYn8akna+LiEsb2Nc0KEg0Qwe+hej0TkP
	 v73+w2asP/Hjx9vXRXmYMpRu5GqnnFYtD7wfVKLfFF93Yw3JE4Q3BiPcD4fhhByl9+
	 368dzO4CLrKHg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.6-rc6
Date: Wed, 18 Oct 2023 15:22:28 +0100
Message-Id: <20231018142236.A433EC433C7@smtp.kernel.org>
Message-ID-Hash: FHBNMBQQ3JFLTEFORQJP7HUFTEG6ZJUF
X-Message-ID-Hash: FHBNMBQQ3JFLTEFORQJP7HUFTEG6ZJUF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FHBNMBQQ3JFLTEFORQJP7HUFTEG6ZJUF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 1426b9ba7c453755d182ebf7e7f2367ba249dcf4:

  ASoC: dt-bindings: fsl,micfil: Document #sound-dai-cells (2023-10-04 13:58:54 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.6-rc6

for you to fetch changes up to e8ecffd9962fe051d53a0761921b26d653b3df6b:

  ASoC: da7219: Correct the process of setting up Gnd switch in AAD (2023-10-17 12:59:13 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.6

A fairly large set of fixes here but all driver specific, the biggest
block is Johan's work shaking out issues with device setup and teardown
for the wcd938x driver which is a relatively large but clearly broken
down set of changes.

There is one core helper function added as part of a fix for wsa-macro.

----------------------------------------------------------------
Charles Keepax (2):
      ASoC: dt-bindings: cirrus,cs42l43: Update values for bias sense
      ASoC: cs42l43: Update values for bias sense

Dan Carpenter (1):
      ASoC: pxa: fix a memory leak in probe()

David Rau (1):
      ASoC: da7219: Correct the process of setting up Gnd switch in AAD

Johan Hovold (7):
      ASoC: codecs: wcd938x: drop bogus bind error handling
      ASoC: codecs: wcd938x: fix unbind tear down order
      ASoC: codecs: wcd938x: fix resource leaks on bind errors
      ASoC: codecs: wcd938x: fix regulator leaks on probe errors
      ASoC: codecs: wcd938x: fix runtime PM imbalance on remove
      ASoC: codecs: wcd938x-sdw: fix use after free on driver unbind
      ASoC: codecs: wcd938x-sdw: fix runtime PM imbalance on probe errors

Krzysztof Kozlowski (2):
      ASoC: soc-dapm: Add helper for comparing widget name
      ASoC: codecs: wsa-macro: handle component name prefix

Mark Brown (3):
      ASoC: codecs: wcd938x: fix probe and bind error
      ASoC: codecs: fix widget name comparisons
      ASoC: dwc: Fix non-DT instantiation

Richard Fitzgerald (3):
      ASoC: cs35l56: Fix illegal use of init_completion()
      ASoC: cs35l56: ASP1 DOUT must default to Hi-Z when not transmitting
      ASoC: cs42l42: Fix missing include of gpio/consumer.h

Roy Chateau (1):
      ASoC: codecs: tas2780: Fix log of failed reset via I2C.

Shuming Fan (1):
      ASoC: rt5650: fix the wrong result of key button

 .../devicetree/bindings/sound/cirrus,cs42l43.yaml  |  2 +-
 include/sound/soc-dapm.h                           |  1 +
 sound/soc/codecs/cs35l56.c                         |  8 ++-
 sound/soc/codecs/cs42l42-sdw.c                     |  1 +
 sound/soc/codecs/cs42l43-jack.c                    |  2 +-
 sound/soc/codecs/da7219-aad.c                      | 11 ++--
 sound/soc/codecs/lpass-wsa-macro.c                 |  4 +-
 sound/soc/codecs/rt5645.c                          |  2 +
 sound/soc/codecs/tas2780.c                         |  2 +-
 sound/soc/codecs/wcd938x-sdw.c                     | 27 +++++++-
 sound/soc/codecs/wcd938x.c                         | 76 ++++++++++++++++------
 sound/soc/dwc/dwc-i2s.c                            |  2 +-
 sound/soc/pxa/pxa-ssp.c                            |  2 +-
 sound/soc/soc-component.c                          |  1 +
 sound/soc/soc-dapm.c                               | 12 ++++
 15 files changed, 119 insertions(+), 34 deletions(-)
