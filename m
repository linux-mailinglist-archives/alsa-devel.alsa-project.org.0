Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC34B69917F
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 11:36:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C0FFA4D;
	Thu, 16 Feb 2023 11:35:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C0FFA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676543792;
	bh=ZpcE2oB019Vx9W+2McN1zJf+PPUx52lteTlLNDgCDzw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CnA5ychYwwSVqbWml+/EySoBaZgbL4JKdwJ/DKeMxWfiw35+hpcva4eC8YN2fcpNV
	 QrXnst0APl2JgxJ5NLYpP25CEppiWed1f0Bz2LRBHOpz3Sl3sYHnmYVyurT2OeeRX7
	 arxVT8vcJHrTFwSrfDr6Z60eCkrBXYG0lFRS2NSU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EC4BF80568;
	Thu, 16 Feb 2023 11:34:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36F11F80551; Thu, 16 Feb 2023 11:33:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 864C5F80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 11:33:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 864C5F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=ToJ0nZWn
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0682166021A9;
	Thu, 16 Feb 2023 10:33:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676543597;
	bh=ZpcE2oB019Vx9W+2McN1zJf+PPUx52lteTlLNDgCDzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ToJ0nZWnBnVV2z3olLVYeW1e9I3ZCqwCWY/jXJHAMgZCY5nKJXSs1PCDAa/WhSWwH
	 sf0h80qfowBSUv+NgmnoIir+BNBlgfI4ew5KUgiIeoNmSaBBCtFSW/bV4KqKqaTQ1g
	 MF3tsLOsM7gtUD1LJdiznqSKKb/D+WLp7gJahIvggxHqdzNuZvEIkRWvqNu1z1OEEu
	 ghwQgd/XrgROHQEO4K55OJPdHtsPyDCLyIXrOnV0dVh+ryq2Hp1uIPWvZhCcEi0aau
	 /AIvVGBF0XiFlP9hV2PuA7Jx0HmWYyhd8/mDxpf3ucIcwsHk9C49MrfBI5d7i8nBxl
	 ZHqgP2edOk2Pg==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 4/9] ASoC: amd: vangogh: remove unnecessarily included headers
Date: Thu, 16 Feb 2023 10:32:55 +0000
Message-Id: <20230216103300.360016-5-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230216103300.360016-1-lucas.tanure@collabora.com>
References: <20230216103300.360016-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DUFHOQ2VM37TBSHNFZX4OBGP4T25CBJ7
X-Message-ID-Hash: DUFHOQ2VM37TBSHNFZX4OBGP4T25CBJ7
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <lucas.tanure@collabora.com>, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove unused includes and replace <linux/input.h> by
<linux/input-event-codes.h>

Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index ec67345bcda4..841b79fa6af5 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -5,23 +5,19 @@
  *
  * Copyright 2021 Advanced Micro Devices, Inc.
  */
+
 #include <linux/acpi.h>
-#include <linux/clk.h>
 #include <linux/dmi.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
-#include <linux/io.h>
 #include <linux/i2c.h>
-#include <linux/input.h>
+#include <linux/input-event-codes.h>
 #include <linux/module.h>
 #include <sound/jack.h>
-#include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 
 #include "../../codecs/nau8821.h"
-#include "../../codecs/cs35l41.h"
 #include "acp5x.h"
 
 #define DRV_NAME			"acp5x_mach"
-- 
2.39.2

