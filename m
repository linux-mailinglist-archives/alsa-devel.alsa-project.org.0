Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95528776D40
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 02:57:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3272582A;
	Thu, 10 Aug 2023 02:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3272582A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691629030;
	bh=tVdhnROyygPahtqZQ1pBSUjxGSVaTZV1NCQbYYRsDDQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DnVUl8e7ad7sYBvq9yvKg7BekPVODyrNY/UA4RzRpSXCwv1H2WZsmDVHIl5IyNBwe
	 P/OP+VyC6ZA7Br6SIXYsqc3B44qG3QEvhnhy8qYiISi/lUr6inCEDaxMoa/NZpFVLY
	 FNwvQyaPqvKfhc0rpoww9V83XI/Cz5cm3FbXms0g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70561F80508; Thu, 10 Aug 2023 02:56:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE393F800F4;
	Thu, 10 Aug 2023 02:56:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC46FF8016E; Thu, 10 Aug 2023 02:56:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=5.0 tests=ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out30-119.freemail.mail.aliyun.com
 (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 843F0F800EE;
	Thu, 10 Aug 2023 02:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 843F0F800EE
X-Alimail-AntiSpam: 
 AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VpROvVB_1691628956;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VpROvVB_1691628956)
          by smtp.aliyun-inc.com;
          Thu, 10 Aug 2023 08:55:57 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: perex@perex.cz,
	tiwai@suse.com,
	pierre-louis.bossart@linux.intel.com,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Cc: sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] ASoC: SOF: Intel: Remove duplicated include in lnl.c
Date: Thu, 10 Aug 2023 08:55:55 +0800
Message-Id: <20230810005555.4610-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F4IE46AJUGORP5QXPD4Q6LUKWHC5PC3J
X-Message-ID-Hash: F4IE46AJUGORP5QXPD4Q6LUKWHC5PC3J
X-MailFrom: yang.lee@linux.alibaba.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F4IE46AJUGORP5QXPD4Q6LUKWHC5PC3J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

./sound/soc/sof/intel/lnl.c: hda.h is included more than once.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 sound/soc/sof/intel/lnl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index 3d919b0b6891..db94b45e53af 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -16,7 +16,6 @@
 #include "hda-ipc.h"
 #include "../sof-audio.h"
 #include "mtl.h"
-#include "hda.h"
 #include <sound/hda-mlink.h>
 
 /* LunarLake ops */
-- 
2.20.1.7.g153144c

