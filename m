Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D6F797953
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 19:11:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2231D84B;
	Thu,  7 Sep 2023 19:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2231D84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694106678;
	bh=sJCfHnubTNfY/3S9mfHkj5m1x1oxHAvtH3b8DUOe0Ek=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JeVu5LKJzf56XqM9X4zbkFY3VOqtltn7pHcY8K5BA7YL0ZkKOMzT0vViU/qMRDh6I
	 MXvoJ8UrOIaBh/2wRuNPx5R4Qgx6yPC1qjAYIOi16FFCbwnqqf4Vtnb8UQVLG48RTG
	 nVpNGSLmGJ7S1cPSfktWuMAaf31/Tf+eJBcm9Uog=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43CA5F8055B; Thu,  7 Sep 2023 19:10:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1E4FF80494;
	Thu,  7 Sep 2023 19:10:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BD8FF804F3; Thu,  7 Sep 2023 19:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A39EF800F5
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 19:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A39EF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=UxdFKSdP
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 13D2B66072AC;
	Thu,  7 Sep 2023 18:10:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694106615;
	bh=sJCfHnubTNfY/3S9mfHkj5m1x1oxHAvtH3b8DUOe0Ek=;
	h=From:To:Cc:Subject:Date:From;
	b=UxdFKSdP6AUDS6OJrN/Phv3NJp5yXNm4NGsQ/r9rGWoihkyFElFi+RQSGywhMPTAm
	 ze3LX6p7plxsL8h69HtmoE7huiWYFxOxwDaCB9pZtMuDm7/PctG8kCkLrFGgKknmEb
	 wbwJwRhJ23PUMjR3/ASjZ9pe79aaivH+2A17gYLxSKZlBiGB6f6tGzRn8gPI+kpA4g
	 qFQxPJlnzIyJsnx1Ic6p9mwlwCX6P2dmnYCCLuo5piR0bFlXw+EVwaF1Pex7sxWvWo
	 xjfgkXhRhLOQMHL85SEEB9dafbOW4mwQL7G9yOVjy7rpqkb8qJE5y7m78jsYp62tGz
	 ZCeM/UhqAI19w==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 00/11] Improve CS35l41-based audio codec drivers
Date: Thu,  7 Sep 2023 20:09:59 +0300
Message-ID: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MEW7G7EUCCLKJQVFBPADBPXD37M6F63U
X-Message-ID-Hash: MEW7G7EUCCLKJQVFBPADBPXD37M6F63U
X-MailFrom: cristian.ciocaltea@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MEW7G7EUCCLKJQVFBPADBPXD37M6F63U/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series contains several fixes and improvements to drivers
based on the CS35l41 audio codec.

It has been verified on Valve's Steam Deck, except the HDA related patches.

Changes in v2:
 - Added Acked-by tags from Charles
 - Reworked the shared boost handling per reviews from Charles and David
 - Dropped PATCH 5/9 and moved PATCH 6/9 a bit down the list, as it doesn't
   contain a Fixes tag
 - Reverted usage of devm_pm_runtime_enable() in PATCH 9/9 and replaced with
   a proper runtime PM changes undo in PATCH v2 06/11
 - Added 3 new patches providing some HDA related fixes
 - v1: https://lore.kernel.org/all/20230902210621.1184693-1-cristian.ciocaltea@collabora.com/

Cristian Ciocaltea (11):
  ASoC: cs35l41: Handle mdsync_down reg write errors
  ASoC: cs35l41: Handle mdsync_up reg write errors
  ASoC: cs35l41: Initialize completion object before requesting IRQ
  ASoC: cs35l41: Fix broken shared boost activation
  ASoC: cs35l41: Verify PM runtime resume errors in IRQ handler
  ASoC: cs35l41: Undo runtime PM changes at driver exit time
  ASoC: cs35l41: Make use of dev_err_probe()
  ASoC: cs35l41: Use modern pm_ops
  ALSA: hda: cs35l41: Fix unbalanced pm_runtime_get()
  ALSA: hda: cs35l41: Undo runtime PM changes at driver exit time
  ALSA: hda: cs35l41: Consistently use dev_err_probe()

 include/sound/cs35l41.h        |  4 +-
 sound/pci/hda/cs35l41_hda.c    | 23 +++++----
 sound/soc/codecs/cs35l41-i2c.c | 11 ++--
 sound/soc/codecs/cs35l41-lib.c | 60 +++++++++++++---------
 sound/soc/codecs/cs35l41-spi.c | 11 ++--
 sound/soc/codecs/cs35l41.c     | 93 +++++++++++++++++++---------------
 sound/soc/codecs/cs35l41.h     |  1 -
 7 files changed, 112 insertions(+), 91 deletions(-)

-- 
2.41.0

