Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A9056AEFF
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 01:26:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8069CE0F;
	Fri,  8 Jul 2022 01:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8069CE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657236414;
	bh=fsozfwXZ2IbPjiC3nnJvKxigVD9M9ZefNQRrGlPQy2k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z9x6kwTqV3hyxDT2juIKvSIRjVedFRXYagIL62g2Rcl4lv2xXwsmy3wcFFuQrasVp
	 JA89rTpHK4rF94YdCoQ/q8DeOCKNmCg8jr+B7ovglTnvN0y3RzrBX0U2jB4e06KI0S
	 BQWdooGGtT86Wnz4bUSAowluUEisJtrwa9hb6FFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09960F800C5;
	Fri,  8 Jul 2022 01:25:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 325EDF8016A; Fri,  8 Jul 2022 01:25:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34DD0F800C5
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 01:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34DD0F800C5
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VIfzb5u_1657236342; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VIfzb5u_1657236342) by smtp.aliyun-inc.com;
 Fri, 08 Jul 2022 07:25:42 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: tiwai@suse.com
Subject: [PATCH -next] ASoC: amd: Remove duplicated include in acp-es8336.c
Date: Fri,  8 Jul 2022 07:25:40 +0800
Message-Id: <20220707232540.22589-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, Yang Li <yang.lee@linux.alibaba.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Fix following includecheck warning:
./sound/soc/amd/acp-es8336.c: linux/module.h is included more than once.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 sound/soc/amd/acp-es8336.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index eec3d57092fa..ae9e23749cb3 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -20,7 +20,6 @@
 #include <linux/input.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/module.h>
 #include <linux/acpi.h>
 
 #include "../codecs/es8316.h"
-- 
2.20.1.7.g153144c

