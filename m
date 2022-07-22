Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4274C57DED3
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 11:50:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D6B1849;
	Fri, 22 Jul 2022 11:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D6B1849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658483405;
	bh=0toR5irzIXM2DYdxmjmW/wIpSx87hglDgTZvO4l3fiI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cRW0CYXyVfTBaRt+0UcgF/ZKw4uoMJKdA0K3vwD6+7iSL9pEWUgXPCNFzAv+XLCF3
	 cf9aOviwHPA0fK281hALxzvFF9TloYLMcqzBtBQMHdjKH0jsyp9Wbt1NrgRaTG8IlO
	 ziqUGypAGPYCuTPur6OPhEdcNC1nhGVyN9oDE3rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B58F0F80279;
	Fri, 22 Jul 2022 11:49:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74B7CF80246; Fri, 22 Jul 2022 11:49:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C4EBF8012A
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 11:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C4EBF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="WXJYmOr2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26M5Vgns024448;
 Fri, 22 Jul 2022 04:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=RqguWUk1rJeah6sayFgpV4hCcMGCEveOejOkfdvaauI=;
 b=WXJYmOr26IMQ/c/8qoDhCKkRgnDcdsn0o3x0IWMIEW2bwOfsP6KBm5a/Fr5+F905Hb88
 udC2qq4EStnbvpYh4+JP8Php7wcMbTmPxdrnGWhU4mEmujfRKB2QPtWRg9h09bw/0Fkg
 jVMuQeDwDuBuHoQDKsX4GOoDzHlJw0lO0/zUZQ+5NMW3QzeaDVtVpRU36JHeZYmHWDPx
 lmey11RTpKGeOGBemc5Mj8x4ejqAx9U4DhNU3zBZHdn+HkovXaoXesnJL5iztxhVbUJ0
 W1UNzZ07g1rH/LlqLj3EvJhzNMtBiI2t5hATG/kdDfF0i3UioDwPwHtEFsLQgvOaHh3A 4w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hdrqfm7mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 04:48:53 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Fri, 22 Jul
 2022 04:48:51 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Fri, 22 Jul 2022 04:48:51 -0500
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9BC8146B;
 Fri, 22 Jul 2022 09:48:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/2] firmware: cs_dsp: Add pre_stop callback
Date: Fri, 22 Jul 2022 10:48:50 +0100
Message-ID: <20220722094851.92521-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 0IoHYEQNb1QF9zb0f0-Z1f0CO81vWuai
X-Proofpoint-GUID: 0IoHYEQNb1QF9zb0f0-Z1f0CO81vWuai
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

The code already has a post_stop callback, add a matching pre_stop
callback to the client_ops that is called before execution is stopped.
This callback provides a convenient place for the client code to
communicate with the DSP before it is stopped.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 3 +++
 include/linux/firmware/cirrus/cs_dsp.h | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 7dad6f57d9704..b402f841d72cf 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -2725,6 +2725,9 @@ void cs_dsp_stop(struct cs_dsp *dsp)
 
 	mutex_lock(&dsp->pwr_lock);
 
+	if (dsp->client_ops->pre_stop)
+		dsp->client_ops->pre_stop(dsp);
+
 	dsp->running = false;
 
 	if (dsp->ops->stop_core)
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 30055706cce21..6ab230218df0e 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -189,7 +189,8 @@ struct cs_dsp {
  * @control_remove:	Called under the pwr_lock when a control is destroyed
  * @pre_run:		Called under the pwr_lock by cs_dsp_run() before the core is started
  * @post_run:		Called under the pwr_lock by cs_dsp_run() after the core is started
- * @post_stop:		Called under the pwr_lock by cs_dsp_stop()
+ * @pre_stop:		Called under the pwr_lock by cs_dsp_stop() before the core is stopped
+ * @post_stop:		Called under the pwr_lock by cs_dsp_stop() after the core is stopped
  * @watchdog_expired:	Called when a watchdog expiry is detected
  *
  * These callbacks give the cs_dsp client an opportunity to respond to events
@@ -200,6 +201,7 @@ struct cs_dsp_client_ops {
 	void (*control_remove)(struct cs_dsp_coeff_ctl *ctl);
 	int (*pre_run)(struct cs_dsp *dsp);
 	int (*post_run)(struct cs_dsp *dsp);
+	void (*pre_stop)(struct cs_dsp *dsp);
 	void (*post_stop)(struct cs_dsp *dsp);
 	void (*watchdog_expired)(struct cs_dsp *dsp);
 };
-- 
2.30.2

