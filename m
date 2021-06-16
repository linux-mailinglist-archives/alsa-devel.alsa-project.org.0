Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1583A9169
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 07:52:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B0341689;
	Wed, 16 Jun 2021 07:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B0341689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623822779;
	bh=xv3hujBSWj7SNu7XZSKqNaQCdCnOfuEKfKCZ92uY/dc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gUNttJxg0H+/XdjYz+7g65gSm+/78uqBEY1I9ey/v34HfOP9GM4JyV01RrhHBud4N
	 YSE+1tKuDCLUfv79wvCGDY21XIgEUd4yFb/ADEcM4FMdjVadi0jFoQOxvhVgzkuZTp
	 +uQO7OpivcW17OTrYDr98Qxf4H+PS1VP4PrcU94w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA882F80148;
	Wed, 16 Jun 2021 07:51:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CE5EF80423; Wed, 16 Jun 2021 07:51:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F89AF80148
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 07:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F89AF80148
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0UcaDBpQ_1623822676; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UcaDBpQ_1623822676) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 16 Jun 2021 13:51:19 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: codecs: Fix duplicate included sound/soc.h
Date: Wed, 16 Jun 2021 13:51:07 +0800
Message-Id: <1623822667-130511-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org
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

Clean up the following includecheck warnings:

./sound/soc/codecs/wcd938x.c: sound/soc.h is included more than once.
./sound/soc/codecs/wcd938x-sdw.c: sound/soc.h is included more than
once.

No functional change.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/codecs/wcd938x-sdw.c | 1 -
 sound/soc/codecs/wcd938x.c     | 1 -
 2 files changed, 2 deletions(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index d82c40e..88334d3 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -7,7 +7,6 @@
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/component.h>
-#include <sound/soc.h>
 #include <linux/pm_runtime.h>
 #include <linux/irqdomain.h>
 #include <linux/of.h>
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 2cf6145..c0d7452 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -9,7 +9,6 @@
 #include <linux/kernel.h>
 #include <linux/pm_runtime.h>
 #include <linux/component.h>
-#include <sound/soc.h>
 #include <sound/tlv.h>
 #include <linux/of_gpio.h>
 #include <linux/of.h>
-- 
1.8.3.1

