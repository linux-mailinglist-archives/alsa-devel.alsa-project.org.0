Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB8469A9F0
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 12:11:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBC5FF14;
	Fri, 17 Feb 2023 12:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBC5FF14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676632298;
	bh=b02ydShPBaSHojbDWpln2wCVcx6gcsVv5n+Og/pMkOE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CcPb5d71PcyKspBaB7rYihu75StXcKeJ6H7ctiIGoG37ETx5LVFbiJIQ56Y3TcW2L
	 tjJNRWmoDGvwi6+V2Q3hdyLJvwFcANzpUcd1MY/m84I6rsrlVA1z9RdZofJEEC7/p2
	 YjQw+M8RcuTnJnc2PyO5FJeszt8tCqEfU//O99Os=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFF2CF80527;
	Fri, 17 Feb 2023 12:09:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDF5EF8052D; Fri, 17 Feb 2023 12:09:51 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BA3EF80083
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 12:09:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BA3EF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=NJceWvOg
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3874266021C2;
	Fri, 17 Feb 2023 11:09:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676632175;
	bh=b02ydShPBaSHojbDWpln2wCVcx6gcsVv5n+Og/pMkOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NJceWvOgsA1IBEJCzLLq3zzFkr90PhXq/97d0JG3ZN+nYgJRFYLXV+cbkE9d+X7sB
	 UZL3l4CywbhxsMjlTmXLukXH0rDQzJQr8hsuyc9QOevwEzI5WnMsgBoBCONXuoxpUr
	 6rnKDdNizRr9LFoxcD4MrEmdbvNZungx92p2NkI/zHrawdsh5GslQfN0KC5D5egpXC
	 PVPNbwDrEPsJ1fMRCF6rVK7vJCuIS2+DnPgEGd4hhr1BIT0Q9BRTbWjY+nutduKzru
	 WBASxieF5Jhp7//JqJ/2BkOrQGRBqmZ/zt7Ky+/WhPTC+FVVpuaUHdXiTfAWBj7AjV
	 hjwJjXckW9eAA==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 4/9] ASoC: amd: vangogh: remove unnecessarily included
 headers
Date: Fri, 17 Feb 2023 11:08:45 +0000
Message-Id: <20230217110850.1045250-5-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230217110850.1045250-1-lucas.tanure@collabora.com>
References: <20230217110850.1045250-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YLCBWHYD7AKHJWA7QUTXHATLKLSFILLM
X-Message-ID-Hash: YLCBWHYD7AKHJWA7QUTXHATLKLSFILLM
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YLCBWHYD7AKHJWA7QUTXHATLKLSFILLM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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
index 43c80103d138..a1cd52e58574 100644
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

