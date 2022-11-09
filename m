Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C97CA623175
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:27:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67A8016CE;
	Wed,  9 Nov 2022 18:26:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67A8016CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014843;
	bh=r+jW1cqN8KTUUuKT30JKspGk86KsPKDCKk4p1MNXh2I=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=srWbB+wYHuPdZ9RduLap24qMdgS9MEuUok0tLPRXzhlAPhDcfMX8Kd1M631OfUS+I
	 96p0y1TD1o/ftihUgaWjivU0XCd3BPT6etP+SII4OCJQ4jyNT0nB9ssm2Umj/XPxaD
	 BmNy+4QiDsc41d3Q0h99xR8H4Aqpkbz7mck0TPVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4512FF8063D;
	Wed,  9 Nov 2022 18:16:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44FDBF80217; Wed,  9 Nov 2022 14:31:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69F71F800EC
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 14:31:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69F71F800EC
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4N6m7m4qfCz5BNS0;
 Wed,  9 Nov 2022 21:31:00 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
 by mse-fl2.zte.com.cn with SMTP id 2A9DUpd7099677;
 Wed, 9 Nov 2022 21:30:51 +0800 (+08)
 (envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp03[null]) by mapi (Zmail) with MAPI id mid14;
 Wed, 9 Nov 2022 21:30:54 +0800 (CST)
Date: Wed, 9 Nov 2022 21:30:54 +0800 (CST)
X-Zmail-TransId: 2b05636bab8effffffffb2f2727a
X-Mailer: Zmail v1.0
Message-ID: <202211092130548796460@zte.com.cn>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <pierre-louis.bossart@linux.intel.com>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgdjJdIEFTb0M6IFNPRjogcmVtb3ZlIGR1cGxpY2F0ZWQgaW5jbHVkZWQgc29mLWF1ZGlvLmg=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2A9DUpd7099677
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID
 636BAB94.001 by FangMail milter!
X-FangMail-Envelope: 1668000660/4N6m7m4qfCz5BNS0/636BAB94.001/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<yang.yang29@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 636BAB94.001/4N6m7m4qfCz5BNS0
X-Mailman-Approved-At: Wed, 09 Nov 2022 18:15:49 +0100
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, yang.yang29@zte.com.cn, broonie@kernel.org,
 xu.panda@zte.com.cn, yung-chuan.liao@linux.intel.com,
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

From: Xu Panda <xu.panda@zte.com.cn>

The sof-audio.h is included more than once.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
Signed-off-by: Yang Yang <yang.yang29@zte.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

---
change for v2
 - add maintainers and the alsa-devel mailing list in CC.  
---

 sound/soc/sof/amd/acp-common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp-common.c b/sound/soc/sof/amd/acp-common.c
index 27b95187356e..348e70dfe2a5 100644
--- a/sound/soc/sof/amd/acp-common.c
+++ b/sound/soc/sof/amd/acp-common.c
@@ -13,7 +13,6 @@
 #include "../sof-priv.h"
 #include "../sof-audio.h"
 #include "../ops.h"
-#include "../sof-audio.h"
 #include "acp.h"
 #include "acp-dsp-offset.h"

-- 
2.15.2
