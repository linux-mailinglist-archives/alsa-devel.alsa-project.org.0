Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0477797221
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 14:01:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C45F884B;
	Thu,  7 Sep 2023 14:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C45F884B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694088103;
	bh=fGYmQGGT7gnWS9Nm/ioxTZGDPllSUiGWM3SgqQbNMLk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oJR8ZM+eOhLlpxbblFscXG3IYLGBxqHhjvIa/wGkURYQDQruQVu3+wv+nsLwKA2pf
	 zMjuk8f5qfU/jMsqVSQjT6ul/G44C4wjdEh5PC9bQxyIRT5zg2inVJkAXAQctN+oEC
	 dSVLYLNorYnGJWsTkohzPwSiR0EVdOEHSdMNJCqs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B99ECF80551; Thu,  7 Sep 2023 14:00:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52181F8047D;
	Thu,  7 Sep 2023 14:00:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C401F80494; Thu,  7 Sep 2023 14:00:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PP_MIME_FAKE_ASCII_TEXT,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96CC2F800F5
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 14:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96CC2F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nKEJ2QOY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 66ACFCE1953;
	Thu,  7 Sep 2023 12:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25138C32785;
	Thu,  7 Sep 2023 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694088019;
	bh=fGYmQGGT7gnWS9Nm/ioxTZGDPllSUiGWM3SgqQbNMLk=;
	h=From:To:Cc:Subject:Date:From;
	b=nKEJ2QOYJ/qIi+EePKdfgSlgFYSQn8hhjWavew7ish7W76KFOnb9wSfAvRtZkwO8d
	 FiFs8rcTPd7hlWYKKa+OARos5+0SIkdLU/HYS+eYkqGPhsNXAQ3wh01hi4gIV2K9ZW
	 U7zLCx97oQPAS76S/rve8Awvhal+IXV6HcQ1s1L2mmITunOjKocFXBOmhGMqZCyYQx
	 afdnCXOuGbiZUKGMvgJPSEUATQ5oKXdaSjmADRa9n0HEZFuD9Z3y/5J0fVcl8WTOFQ
	 I5pw5/eiidA7CAKQqs1VsUhEcDMYdlVASTQCaisA7A97A4G+N0iHJgxUONR6V4md8b
	 U456gihK86bjQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.6-merge-window
Date: Thu, 07 Sep 2023 13:00:06 +0100
Message-Id: <20230907120019.25138C32785@smtp.kernel.org>
Message-ID-Hash: MVDVM5FTXF7XG4F5O3QF7OV3YYJEHGKW
X-Message-ID-Hash: MVDVM5FTXF7XG4F5O3QF7OV3YYJEHGKW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MVDVM5FTXF7XG4F5O3QF7OV3YYJEHGKW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 199cd64140f222c66b68ebe288a3fcd0570e2e41:

  ASoC: soc-core.c: Do not error if a DAI link component is not found (2023-08-24 21:10:45 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.6-merge-window

for you to fetch changes up to cfff2a7794d23b03a3ddedd318bf1df1876c598f:

  ASoC: amd: yc: Fix a non-functional mic on Lenovo 82TL (2023-09-06 20:06:36 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.6

A bunch of fixes and new IDs that came in since the initial pull request
- all driver specific and nothing too exciting.

There's a trivial conflict in the AMD driver ID table due to the last
v6.5 fixes not having been merged up.

----------------------------------------------------------------
Adam Ford (1):
      ASoC: dt-bindings: fsl_easrc: Add support for imx8mp-easrc

Amadeusz Sławiński (1):
      ASoC: Intel: avs: Provide support for fallback topology

Brent Lu (1):
      ASoC: rt5645: NULL pointer access when removing jack

Harshit Mogalapalli (1):
      ASoC: cs42l43: Fix missing error code in cs42l43_codec_probe()

Kevin-Lu (1):
      MAINTAINERS: Update the MAINTAINERS enties for TEXAS INSTRUMENTS ASoC DRIVERS

Krzysztof Kozlowski (1):
      ASoC: codecs: wcd93xx: fix object added to multiple drivers

Mario Limonciello (1):
      ASoC: amd: yc: Fix a non-functional mic on Lenovo 82TL

Shubh (1):
      ASoC: amd: yc: Add DMI entries to support Victus by HP Gaming Laptop 15-fb0xxx (8A3E)

Simon Trimmer (1):
      ASoC: cs35l56: Waiting for firmware to boot must be tolerant of I/O errors

Vlad Karpovich (3):
      ASoC: cs35l45: Add support for Chip ID 0x35A460
      ASoC: cs35l45: Fix "Dead assigment" warning
      ASoC: cs35l45: Rename DACPCM1 Source control

 .../devicetree/bindings/sound/fsl,easrc.yaml       |  8 +++++-
 MAINTAINERS                                        |  2 +-
 sound/soc/amd/yc/acp6x-mach.c                      | 14 +++++++++++
 sound/soc/codecs/Kconfig                           |  6 +++++
 sound/soc/codecs/Makefile                          |  8 +++---
 sound/soc/codecs/cs35l45.c                         | 11 ++++----
 sound/soc/codecs/cs35l56-shared.c                  | 29 +++++++++++-----------
 sound/soc/codecs/cs42l43.c                         |  3 ++-
 sound/soc/codecs/rt5645.c                          | 16 +++++++-----
 sound/soc/codecs/wcd-clsh-v2.c                     |  8 ++++++
 sound/soc/intel/avs/pcm.c                          | 22 ++++++++++++++++
 11 files changed, 96 insertions(+), 31 deletions(-)
