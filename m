Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A49F44E4F03
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 10:14:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46D6A171D;
	Wed, 23 Mar 2022 10:13:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46D6A171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648026854;
	bh=IU/crHatmngN2x8n8sFszzi8i5dyhqWfy40w/oKZK1Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sk/hMQTDg0S0ga7or5hYC3cszNpft+Sk4PRdnMJ4cRkdMVDEfu1M5ft7R//Zyhqv1
	 K4iClqiKm3FNy0Ep/nBnP70cTTBHw+pR6GK+3MYzUOXMazTAjZvf5a3MPqQVwY3Z+C
	 8Ef08zTVhbE4uJi+HlSflOvkmIkuSwl+pzopVa54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17524F804BC;
	Wed, 23 Mar 2022 10:12:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16A9CF802DB; Wed, 23 Mar 2022 04:43:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.meizu.com (edge05.meizu.com [157.122.146.251])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1427EF800AA
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 04:43:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1427EF800AA
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail12.meizu.com
 (172.16.1.108) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 23 Mar
 2022 11:43:02 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 23 Mar
 2022 11:43:01 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <Vijendar.Mukunda@amd.com>
Subject: [PATCH] ASoC: amd: Fix duplicate included module.h/io.h
Date: Wed, 23 Mar 2022 11:42:59 +0800
Message-ID: <1648006979-31031-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-Mailman-Approved-At: Wed, 23 Mar 2022 10:12:33 +0100
Cc: alsa-devel@alsa-project.org, Haowen Bai <baihaowen@meizu.com>,
 linux-kernel@vger.kernel.org
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

Clean up the following includecheck warning:

sound/soc/amd/vangogh/acp5x-mach.c: linux/module.h is included more than once.
sound/soc/amd/vangogh/acp5x-mach.c: linux/io.h is included more than once.

No functional change.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 14cf325..cc8316b 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -17,10 +17,8 @@
 #include <linux/clk.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
-#include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
-#include <linux/io.h>
 #include <linux/acpi.h>
 #include <linux/dmi.h>
 
-- 
2.7.4

