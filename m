Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D989596E67
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 14:25:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D7251650;
	Wed, 17 Aug 2022 14:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D7251650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660739140;
	bh=fbtJo2sApG5LGqpq2O6UlJULkSZcHQDvZhBh5rD+L8A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HYNDKulyiaLELd3YXBxEKxnGWa1bYfVlUI8s8ePGJgNU6avZGv7kIwJOEwmMT2NDc
	 z7magRYUTuDvbln+HVRMn+G/sETINSOFOJyISU9cCSy6CDhMS5lCjG2pKH4CVZz6UY
	 eV3fStY8L7vazQ76KOaGCPxAaFVdid3PNpcriZ/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C677F80237;
	Wed, 17 Aug 2022 14:24:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49DB8F80544; Wed, 17 Aug 2022 14:24:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AFA5F80237
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 14:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AFA5F80237
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="XFSQX9Yr"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HBro3T026619;
 Wed, 17 Aug 2022 07:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=xQ3qvl9IMuy/CeupuXMZunDSLtXwsJGURkPujaWBUU0=;
 b=XFSQX9Yr+vUpg5KZK/AbF+IOT2pQDvuD90KZj38i7U5pZNgzXfuEZWyAnUyPMFoDMvxn
 98wkx0fGurxAXcvuJsAoJjRiTClgT4R+o/683GtzGHK1lti8/oTyl+lzPO5xi4ClUpAI
 +UjEZkep3lTNna9pv4LSxd+xPAs6TpfJxaOwzzYFG52J5vNzAiINXxoc64LaDKplkL+P
 EkSwskT6KBSkhSIDSH5SzAhf16ncax326NjDOOR5h5AZIlLhfpnVqr8VvSDAew1XdM0L
 VQ3PdQWrwVKLc7dbw2GWrPkrNtn73fk0Vxp/kNW1YOHZ8HzBviXMvTVCM+A+TRlif5mo UQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hx8cpcueb-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 07:23:50 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Wed, 17 Aug
 2022 07:23:47 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Wed, 17 Aug 2022 07:23:47 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B9BE6B0E;
 Wed, 17 Aug 2022 12:23:47 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/5] ASoC: cs42l42: Add include dependencies to cs42l42.h
Date: Wed, 17 Aug 2022 13:23:44 +0100
Message-ID: <20220817122347.1356773-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220817122347.1356773-1-rf@opensource.cirrus.com>
References: <20220817122347.1356773-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: A17s6qErAzGztvenkHtPWOst6oX6nLOc
X-Proofpoint-GUID: A17s6qErAzGztvenkHtPWOst6oX6nLOc
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

Make cs42l42.h include the other headers it depends on instead of
assuming that the .c file already included them.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 5f50970375d4..1d53e0e050ee 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -12,7 +12,12 @@
 #ifndef __CS42L42_H__
 #define __CS42L42_H__
 
+#include <dt-bindings/sound/cs42l42.h>
+#include <linux/device.h>
+#include <linux/gpio.h>
 #include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <sound/jack.h>
 #include <sound/cs42l42.h>
 
-- 
2.30.2

