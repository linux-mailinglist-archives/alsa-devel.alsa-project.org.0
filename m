Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D2942F407
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 15:41:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A96B17A6;
	Fri, 15 Oct 2021 15:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A96B17A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634305314;
	bh=xzYvvkDTdvGyP66jXgGtZCtw48QhAjE9tfA4giUpwvY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ueC6cob23pBwusKpn6pxFuK+WsSgxV1KkjQmE3yq4m8di4g9MkFcws5wOdenpfsdd
	 mBMZBT1BHKQDViAj+Nr07mAOLAjN87Ra2ls6Um4xsaAYaQaOIwzD7ZuA6Rqxkl1een
	 lhpj5omyE44+nvCSMqXjuWbmFcOpTWTkqfCDcnp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33C40F80543;
	Fri, 15 Oct 2021 15:37:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA917F8051F; Fri, 15 Oct 2021 15:36:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1DF8F804FA
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 15:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1DF8F804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HIo9mrU6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19F4c2t2023483; 
 Fri, 15 Oct 2021 08:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=dZAgC/Rt9qiMgH13szDcBCCiLkk5iVRhXXBnSYgZmNk=;
 b=HIo9mrU6PJmx5T+Tt+rzNI3B0txrQPUfq21P9Az0EycaiqKGSAc/13n225/02i79huMq
 XoRfAmaGETNiI3jFATG2oMg+CdkTXlkPQ14vaZFYjZ4qnSjPCtaQROtuVr00d0xe0pct
 +NVfPUYLhVxo+avOGQc8+gWXrVRa4S730SBiSk0t8D6ZrDRAbv1wxJ/pfdMg8rPVSUVu
 SeT+tbaQ0M/OJarRCadfROUJsgZVPWDyc10q2QxpR1fUr472vKjSfOcW6QMHnqhjdPsk
 DQLwmgdzv4qabD9x/KvLwyd4fkfD3Vwg+I9idti/6kzLUNroCg3fqE5lzU3HV8ZxkXeH Kg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bq1gagp5v-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Oct 2021 08:36:26 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 15 Oct
 2021 14:36:24 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Fri, 15 Oct 2021 14:36:24 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.254])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F1A8711DA;
 Fri, 15 Oct 2021 13:36:23 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 08/16] ASoC: cs42l42: Reset and power-down on driver remove()
Date: Fri, 15 Oct 2021 14:36:11 +0100
Message-ID: <20211015133619.4698-9-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211015133619.4698-1-rf@opensource.cirrus.com>
References: <20211015133619.4698-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Ce7s5-7Zf4TaXYo3ZYuPwDgxZtZhWw8q
X-Proofpoint-GUID: Ce7s5-7Zf4TaXYo3ZYuPwDgxZtZhWw8q
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

Driver remove() should assert RESET and disable the supplies.
Previously this assumed that calling pm_runtime_suspend() would result
in a call to cs42l42_runtime_suspend() to power-down. This isn't
guaranteed - pm_runtime can be disabled.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 2b869e0ea598 ("ASoC: cs42l42: Remove power if the driver is being removed")
---
 sound/soc/codecs/cs42l42.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 420e16563c45..cf1f68474d21 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -2131,6 +2131,9 @@ static int cs42l42_i2c_remove(struct i2c_client *i2c_client)
 	pm_runtime_suspend(&i2c_client->dev);
 	pm_runtime_disable(&i2c_client->dev);
 
+	gpiod_set_value_cansleep(cs42l42->reset_gpio, 0);
+	regulator_bulk_disable(ARRAY_SIZE(cs42l42->supplies), cs42l42->supplies);
+
 	return 0;
 }
 
-- 
2.11.0

