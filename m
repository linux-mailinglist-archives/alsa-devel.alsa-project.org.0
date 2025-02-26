Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F6EA45FA8
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2025 13:46:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66925602D5;
	Wed, 26 Feb 2025 13:46:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66925602D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740573977;
	bh=v7ZauxEkKjGbV+nPAeMypKY9bPiXqp1EoZS0H+Hp8cY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=l5Aw0nn60mkNsSjEjYorw5WgTJdEg5gEyZc3Ui+um6uyVgzYNQXEek/PMMUl/SXP2
	 V1/yuXSOWf7FeBTXlbegXF+XZeY4UYy7o13KsgfF30koqTZHqK6bhabD3E5F20KWQ1
	 USLNgsRQEphvPjUt6+qETBLBIM0vwNtJp4X1594I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA71DF805C3; Wed, 26 Feb 2025 13:45:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54DBFF805AE;
	Wed, 26 Feb 2025 13:45:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76AC4F805C9; Wed, 26 Feb 2025 13:45:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DFD3F800D2
	for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2025 13:45:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DFD3F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mQ49ICta
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A86E61155;
	Wed, 26 Feb 2025 12:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D29C4CED6;
	Wed, 26 Feb 2025 12:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740573925;
	bh=v7ZauxEkKjGbV+nPAeMypKY9bPiXqp1EoZS0H+Hp8cY=;
	h=From:To:Cc:Subject:Date:From;
	b=mQ49ICtaw8ts2wvVhA+8cOZpZ023Gz7IDReEYIMoH7pf+l/BF/75IbHZXsuMM4kYp
	 uH0X0ISsMLgWQqNsNYDvA1SfyPty3gSSM7OWHZSVmA+jZaQ+rT77HdVWYlUIhS2tD2
	 +6OkCD0zMTT81VENPfKhosmD4SnS3yKsZa4DCIHeCswL+ebopVukWr4LPpS720gKlc
	 iipgNXqQSYNto0hFUXYn6BzuSrdBYxlyz74hxnBVPr442RfZ85L+B7BLsslD64ef3p
	 afOaezCxQydv/nooSeqVszXP4356zoKXjeAjaIacRDjylEJJl+ADbqwuhYpyhGrPXB
	 H8a/oIr3u9pkw==
Message-ID: <7ff673840a72f27faae049d16ea12029.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.14-rc4
Date: Wed, 26 Feb 2025 12:45:14 +0000
Message-ID-Hash: R4TYMA5J5Q2XVNDA6RBFZLGSOJFKPVMC
X-Message-ID-Hash: R4TYMA5J5Q2XVNDA6RBFZLGSOJFKPVMC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R4TYMA5J5Q2XVNDA6RBFZLGSOJFKPVMC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 571b69f2f9b1ec7cf7d0e9b79e52115a87a869c4:

  ASoC: imx-audmix: remove cpu_mclk which is from cpu dai device (2025-02-13 11:34:32 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc4

for you to fetch changes up to 9da0ed4a85027063441fa1c73967cafc38f0677c:

  ASoC: Intel: don't check number of sdw links when set (2025-02-25 17:47:04 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.14

More driver specific fixes, the firmware change is part of fixing the
race conditions in the Cirrus driver.

----------------------------------------------------------------
Bard Liao (2):
      ASoC: SOF: Intel: don't check number of sdw links when set dmic_fixup
      ASoC: Intel: sof_sdw: warn both sdw and pch dmic are used

Chancel Liu (1):
      ASoC: fsl: Rename stream name of SAI DAI driver

Hector Martin (3):
      ASoC: tas2770: Fix volume scale
      ASoC: tas2764: Fix power control mask
      ASoC: tas2764: Set the SDOUT polarity correctly

Mark Brown (1):
      ASoC: Intel: don't check number of sdw links when set

Nicolas Frattaroli (2):
      ASoC: es8328: fix route from DAC to output
      ASoC: dapm-graph: set fill colour of turned on nodes

Richard Fitzgerald (2):
      firmware: cs_dsp: Remove async regmap writes
      ASoC: cs35l56: Prevent races when soft-resetting using SPI control

 drivers/firmware/cirrus/cs_dsp.c  | 24 +++---------
 include/sound/cs35l56.h           | 31 +++++++++++++++
 sound/pci/hda/cs35l56_hda_spi.c   |  3 ++
 sound/soc/codecs/cs35l56-shared.c | 80 +++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56-spi.c    |  3 ++
 sound/soc/codecs/es8328.c         | 15 ++------
 sound/soc/codecs/tas2764.c        | 10 ++++-
 sound/soc/codecs/tas2764.h        |  8 +++-
 sound/soc/codecs/tas2770.c        |  2 +-
 sound/soc/fsl/fsl_sai.c           |  6 +--
 sound/soc/fsl/imx-audmix.c        |  4 +-
 sound/soc/intel/boards/sof_sdw.c  |  7 ++++
 sound/soc/sof/intel/hda.c         | 18 +--------
 tools/sound/dapm-graph            |  2 +-
 14 files changed, 159 insertions(+), 54 deletions(-)
