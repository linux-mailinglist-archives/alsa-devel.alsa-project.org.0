Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A7289FCA5
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 18:13:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A9A322AA;
	Wed, 10 Apr 2024 18:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A9A322AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712765638;
	bh=radcFVg3iOeeJnuXe+M9J3S/vIGLXH4HKrdOXck3UEE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MhaHfdyteF030RTvcR8UXKMO58HU8iBZbE+Cg08bWyHAvMbwArdBMrOMFJ/hdLtYU
	 gxBZ1lj1XE9HMoPKB379+APuDF92+RUN3x+n+xGdOGNiAZI4jo+CuUfAtpIkXyjDZ6
	 mG2zKHAjM8Z2qkeedJIAL8gf4oONVnZDt6ZENo5Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2090F8059F; Wed, 10 Apr 2024 18:13:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E507F80570;
	Wed, 10 Apr 2024 18:13:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5692F8026D; Wed, 10 Apr 2024 18:13:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15791F800C9
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 18:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15791F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=jWq9QT2F
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43A7a5uI006286;
	Wed, 10 Apr 2024 11:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=4
	wLQKrE2rPX+Nz55VubE8mQ7/UkXJmjP/U3JM/SK6X4=; b=jWq9QT2F28EMvuQvL
	wKTCDtt7695eNQceKeivMCAgZH/8jlDFWg1QpLABVkB65wtf/3yPwitOKq9zjf+/
	ArC+ho+rxXwsLB0Wu7hNN227wHgIbAI93SRG+oEd55GeCmL3ateBZUnpg4VLPL+X
	FP9xaatHioL3SJVUf94X9xybnkhAmmsEdZMpf62ONGbSU2l/bafAJQkyNJB3Cr1I
	4679s6L3gu+zP1dIuWDgQYa1XjKz/QIGe0QP7d7pBRb2aigJNdMdeDxTmo1Z51Oc
	qa8/vnRueJ4MvIswHIJz+ZAB2NrG/72d1QAm22XwwPPmcK8Nv5XlWDNqTCsKcucl
	A3S4Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xb3sxn7xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 11:13:16 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Apr
 2024 17:13:14 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 10 Apr 2024 17:13:14 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.213])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1D00182024A;
	Wed, 10 Apr 2024 16:13:14 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: wm_adsp: Include array_size.h
Date: Wed, 10 Apr 2024 17:13:12 +0100
Message-ID: <20240410161312.22313-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: svg_RbcpAcZNzpchFjMUujb1CX9AXgvT
X-Proofpoint-GUID: svg_RbcpAcZNzpchFjMUujb1CX9AXgvT
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 42LAG7ZWKXU76S5BMUNGM267VOHHBPUI
X-Message-ID-Hash: 42LAG7ZWKXU76S5BMUNGM267VOHHBPUI
X-MailFrom: prvs=1830ba3822=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/42LAG7ZWKXU76S5BMUNGM267VOHHBPUI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Explicitly #include array_size.h for the ARRAY_SIZE() macro.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 7d5c096e06cd..9a89682ebc1f 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/array_size.h>
 #include <linux/ctype.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-- 
2.39.2

