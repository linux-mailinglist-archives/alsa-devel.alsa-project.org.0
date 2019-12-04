Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B06D4112EE1
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 16:45:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 456C3166E;
	Wed,  4 Dec 2019 16:44:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 456C3166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575474334;
	bh=yYyj0wa2Sga/rB0QEACp4HhbZ7rBZ3ivg63WWduO6l0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TpX+dIcKym6ARBbGJa4dvcr90283Y6zwXfMgNBfV7cvdIP6g0+Ka1PIIo8jrgIMuo
	 jvXse7jG/RSBhsYCRBlQdwtsZvJkkvr/MXn4FGQSjhQl+grd8iWCrXLuVJqjFymJmB
	 IyxZciKL8FHmJzXcvubpRN36r7vfOXkiK3jFWEWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58CC6F80216;
	Wed,  4 Dec 2019 16:43:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37977F80217; Wed,  4 Dec 2019 16:43:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D85C7F800B4
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 16:43:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D85C7F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="l3glOs0o"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB4FgBSG013815; Wed, 4 Dec 2019 16:43:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=l5Zh/9KZNI1x8B1FbYAuFO2+pJReKR7Kx2JbNLdAiCE=;
 b=l3glOs0oy0BqdHyFdYQ4D3DEioc6UsuGfiYutdLP8LhdXoG44HX8d7vpKorKOPBcuwW0
 fuls/1IzadbseApEUn3tZzq7VDEi6vX4pqsBAiS7HAsShxitbS7lho0qUIvkqTZokJYN
 A5Qnyidsa/Enxr8IbmTuTQi9I5uUYUEmh3tJF8ueFnSubcNMdiRzNrVzoInpISOo6wRa
 5HZ0Ccv1r1mFH0cLEZVCkYsry/b2xFs0G6Krsl5ViqaNL/IztEduJixYzvkZMUj5lA0r
 l/tXjE6oKm5J3dhoY2Y8MPdZ8Jc5M0Fv3BH4edKsJxtZFLWOi1rRvZ9i4O7lOjzR5Cc1 ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wkeea6724-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 16:43:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9AFE3100034;
 Wed,  4 Dec 2019 16:43:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 894F02C71B5;
 Wed,  4 Dec 2019 16:43:42 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Wed, 4 Dec 2019 16:43:42 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>
Date: Wed, 4 Dec 2019 16:43:31 +0100
Message-ID: <20191204154333.7152-2-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191204154333.7152-1-olivier.moysan@st.com>
References: <20191204154333.7152-1-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_03:2019-12-04,2019-12-04 signatures=0
Subject: [alsa-devel] [PATCH 1/3] ASoC: stm32: spdifrx: fix inconsistent
	lock state
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In current spdifrx driver locks may be requested as follows:
- request lock on iec capture control, when starting synchronization.
- request lock in interrupt context, when spdifrx stop is called
from IRQ handler.

Take lock with IRQs disabled, to avoid the possible deadlock.

Lockdep report:
[   74.278059] ================================
[   74.282306] WARNING: inconsistent lock state
[   74.290120] --------------------------------
...
[   74.314373]        CPU0
[   74.314377]        ----
[   74.314381]   lock(&(&spdifrx->lock)->rlock);
[   74.314396]   <Interrupt>
[   74.314400]     lock(&(&spdifrx->lock)->rlock);

Fixes: 03e4d5d56fa5 ("ASoC: stm32: Add SPDIFRX support")

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_spdifrx.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 3fd28ee01675..9c6beb610c17 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -320,6 +320,7 @@ static void stm32_spdifrx_dma_ctrl_stop(struct stm32_spdifrx_data *spdifrx)
 static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 {
 	int cr, cr_mask, imr, ret;
+	unsigned long flags;
 
 	/* Enable IRQs */
 	imr = SPDIFRX_IMR_IFEIE | SPDIFRX_IMR_SYNCDIE | SPDIFRX_IMR_PERRIE;
@@ -327,7 +328,7 @@ static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 	if (ret)
 		return ret;
 
-	spin_lock(&spdifrx->lock);
+	spin_lock_irqsave(&spdifrx->lock, flags);
 
 	spdifrx->refcount++;
 
@@ -362,7 +363,7 @@ static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 				"Failed to start synchronization\n");
 	}
 
-	spin_unlock(&spdifrx->lock);
+	spin_unlock_irqrestore(&spdifrx->lock, flags);
 
 	return ret;
 }
@@ -370,11 +371,12 @@ static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 static void stm32_spdifrx_stop(struct stm32_spdifrx_data *spdifrx)
 {
 	int cr, cr_mask, reg;
+	unsigned long flags;
 
-	spin_lock(&spdifrx->lock);
+	spin_lock_irqsave(&spdifrx->lock, flags);
 
 	if (--spdifrx->refcount) {
-		spin_unlock(&spdifrx->lock);
+		spin_unlock_irqrestore(&spdifrx->lock, flags);
 		return;
 	}
 
@@ -393,7 +395,7 @@ static void stm32_spdifrx_stop(struct stm32_spdifrx_data *spdifrx)
 	regmap_read(spdifrx->regmap, STM32_SPDIFRX_DR, &reg);
 	regmap_read(spdifrx->regmap, STM32_SPDIFRX_CSR, &reg);
 
-	spin_unlock(&spdifrx->lock);
+	spin_unlock_irqrestore(&spdifrx->lock, flags);
 }
 
 static int stm32_spdifrx_dma_ctrl_register(struct device *dev,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
