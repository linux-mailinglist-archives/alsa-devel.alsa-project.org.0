Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E52B44503FA
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 13:03:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 487231690;
	Mon, 15 Nov 2021 13:03:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 487231690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636977835;
	bh=Qkx6d+ivTfYHRmVr6kJ0J1IMDjFiA24Jt86B3TyZxvQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KYibKwIevHtMuyhp5/FAUXKHWEqVQhc4uZXyyCnizYP1FaDddXrcxcug7pWZZEbkt
	 2V1WGrMGVO5cobFZoDknYkVDkhzi/bk5HRHDu/sTj8HsuFD0MQxB1YgZxdv6+58sr5
	 FWlTCsrwWxw0CeRmMdGU5QI6FFVEq3zC0lD4HR/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 423C3F804BD;
	Mon, 15 Nov 2021 13:02:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9BBDF8049C; Mon, 15 Nov 2021 13:02:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 951A4F8028B
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 13:02:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 951A4F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Vh0nFoIu"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AFBu7I1030566;
 Mon, 15 Nov 2021 06:02:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=ZsfDJPs3AQkoppYF0vvBIPQ+auuj++HTA/sVw3iUTIQ=;
 b=Vh0nFoIurj+w7BD/f8pp83NbVxj26FmlU8vUj0ZMyznh5W3b5A4k8Q9oUuT+qrVS080m
 1u1nOb4xhESAWXTjMjKoLQe247QsaZ3dLWRoaixlKD5jdk4UMlc7lmNNPkd8Q270UO2e
 y2T2YGhDZkrcVOdFpHGbae+Z2V0HtLdnAz+KRra+k+W36PpJ6bLJPgPsWXp6RR3CFdb3
 FVPNRp55yh9VH1mbpuBG+xsKRJmg3DuYa67bGgHbNbwt+dVvdJfo5MR+IcNu5XpY/ry0
 3DJHUwS5mEPzhsDUxqq0mMq8+PxVOcUMHJO87g+KoctrlrkeR4gLpbIQur6AW34HZigD rQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cbdjgrfcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 15 Nov 2021 06:02:22 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 15 Nov
 2021 12:02:20 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 15 Nov 2021 12:02:20 +0000
Received: from simont-vb.lan?044ad.cirrus.com (unknown [198.90.238.231])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 82F86B2F;
 Mon, 15 Nov 2021 12:02:20 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] firmware: cs_dsp: tidy includes in cs_dsp.c and cs_dsp.h
Date: Mon, 15 Nov 2021 12:02:15 +0000
Message-ID: <20211115120215.56824-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: s5wn5ZZwwKNuipaX-mCAvYa6ih8nO0NH
X-Proofpoint-GUID: s5wn5ZZwwKNuipaX-mCAvYa6ih8nO0NH
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Simon Trimmer <simont@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

This patch removes unused included header files and moves others into
cs_dsp.h to ensure that types referenced in the header file are properly
described to prevent compiler warnings.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 6 ------
 include/linux/firmware/cirrus/cs_dsp.h | 5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 948dd8382686..1a0c6c793f6a 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -12,16 +12,10 @@
 #include <linux/ctype.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
-#include <linux/device.h>
-#include <linux/firmware.h>
-#include <linux/interrupt.h>
-#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
-#include <linux/workqueue.h>
 
 #include <linux/firmware/cirrus/cs_dsp.h>
 #include <linux/firmware/cirrus/wmfw.h>
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 9ad9eaaaa552..3a54b1afc48f 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -11,6 +11,11 @@
 #ifndef __CS_DSP_H
 #define __CS_DSP_H
 
+#include <linux/device.h>
+#include <linux/firmware.h>
+#include <linux/list.h>
+#include <linux/regmap.h>
+
 #define CS_ADSP2_REGION_0 BIT(0)
 #define CS_ADSP2_REGION_1 BIT(1)
 #define CS_ADSP2_REGION_2 BIT(2)
-- 
2.33.0

