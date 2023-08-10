Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 207B877790B
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 15:04:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ADEB843;
	Thu, 10 Aug 2023 15:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ADEB843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691672684;
	bh=eX8IFB4VqjmsK2aOgxhkJlTTzhrJH5MSEzRAdCwKJEk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DQ4WWcxYaLgzK8zLT2Ag6H19//e1LyedT0cExLxFX9ZHW5ISaAj9pc8QL23If1IgI
	 2Raz3MC3+Nma3/d5rMCq24049yNqFMUgnlR8Z8comUbpA//oSY15SsnudObwNmz9Bd
	 tKfJZldhDHsFKF5r62tqLfDxbbAWU1xYv/URGfvM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 736BCF805DA; Thu, 10 Aug 2023 15:01:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1456F805D6;
	Thu, 10 Aug 2023 15:01:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EF23F8016E; Thu, 10 Aug 2023 13:49:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85B3DF800FB
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 13:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85B3DF800FB
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RM4rk6rMWzqT0h;
	Thu, 10 Aug 2023 19:46:30 +0800 (CST)
Received: from huawei.com (10.67.175.31) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 19:49:21 +0800
From: GUO Zihua <guozihua@huawei.com>
To: <pierre-louis.bossart@linux.intel.com>, <lgirdwood@gmail.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <daniel.baluta@nxp.com>,
	<kai.vehmanen@linux.intel.com>
CC: <alsa-devel@alsa-project.org>
Subject: [PATCH -next] ASoC: SOF: amd: Remove duplicated include
Date: Thu, 10 Aug 2023 19:48:54 +0800
Message-ID: <20230810114854.20073-1-guozihua@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.31]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected
X-MailFrom: guozihua@huawei.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7UI3UCPZPCVZO2Q5FOGMMSAWB4N64IJV
X-Message-ID-Hash: 7UI3UCPZPCVZO2Q5FOGMMSAWB4N64IJV
X-Mailman-Approved-At: Thu, 10 Aug 2023 13:01:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7UI3UCPZPCVZO2Q5FOGMMSAWB4N64IJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove duplicated include of sof-audio.h. Resolves checkincludes message.

Signed-off-by: GUO Zihua <guozihua@huawei.com>
---
 sound/soc/sof/amd/acp-common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp-common.c b/sound/soc/sof/amd/acp-common.c
index 3a0c7688dcfe..2d72c6d55dc8 100644
--- a/sound/soc/sof/amd/acp-common.c
+++ b/sound/soc/sof/amd/acp-common.c
@@ -13,7 +13,6 @@
 #include "../sof-priv.h"
 #include "../sof-audio.h"
 #include "../ops.h"
-#include "../sof-audio.h"
 #include "acp.h"
 #include "acp-dsp-offset.h"
 #include <sound/sof/xtensa.h>
-- 
2.17.1

