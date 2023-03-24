Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 368096C7592
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 03:24:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E1C1EC7;
	Fri, 24 Mar 2023 03:23:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E1C1EC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679624667;
	bh=YYYMqLs58P3EATou6ZQ5bpZOczsT5kbSkdnjUZn61hc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T8ctBp1zLvc7/X9GHT5dAAWsu3Ae3Lm7ovk203k85ipCWdqEBN8aoJXVUcD79tRhN
	 B2pqhNHaXs9WxPyp0jHgTe3v1NgEzu92YUE7Y+JNT+NUIm8KNIFQHGsn3OYJLOXQ+F
	 i4mLlgKtl7VJl/MwDsLtKfubxtFtDmrG3Gm7P9QU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC415F80093;
	Fri, 24 Mar 2023 03:23:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08194F8027B; Fri, 24 Mar 2023 03:23:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=5.0 tests=ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_IN_DEF_SPF_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1331F800C9
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 03:23:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1331F800C9
X-Alimail-AntiSpam: 
 AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0VeVutzY_1679624587;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VeVutzY_1679624587)
          by smtp.aliyun-inc.com;
          Fri, 24 Mar 2023 10:23:18 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: james.schulman@cirrus.com
Subject: [PATCH] ASoC: cs35l56: Fix an unsigned comparison which can never be
 negative
Date: Fri, 24 Mar 2023 10:23:03 +0800
Message-Id: <20230324022303.121485-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OKS5MHZAVUFCYMSEMIJMV5TKTMAQMT5G
X-Message-ID-Hash: OKS5MHZAVUFCYMSEMIJMV5TKTMAQMT5G
X-MailFrom: jiapeng.chong@linux.alibaba.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: david.rhodes@cirrus.com, tanureal@opensource.cirrus.com,
 rf@opensource.cirrus.com, lgirdwood@gmail.com, broonie@kernel.org,
 tiwai@suse.com, alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OKS5MHZAVUFCYMSEMIJMV5TKTMAQMT5G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The variable 'rv' is defined as unsigned type, so the following if
statement is invalid, we can modify the type of rv to int.
if (rv < 0) {
	dev_err(cs35l56->dev, "irq: failed to get pm_runtime:
		%d\n", rv);
	goto err_unlock;
}

./sound/soc/codecs/cs35l56.c:333:5-7: WARNING: Unsigned expression compared with zero: rv < 0.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4599
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/codecs/cs35l56.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 90fc79b5666d..d97b465f0d3c 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -321,7 +321,9 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	struct cs35l56_private *cs35l56 = data;
 	unsigned int status1 = 0, status8 = 0, status20 = 0;
 	unsigned int mask1, mask8, mask20;
-	unsigned int rv, val;
+	unsigned int val;
+	int rv;
+
 	irqreturn_t ret = IRQ_NONE;
 
 	if (!cs35l56->init_done)
-- 
2.20.1.7.g153144c

