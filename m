Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97605490C2A
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 17:10:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25D9517F4;
	Mon, 17 Jan 2022 17:09:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25D9517F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642435823;
	bh=33yTT70QHlNBG648jZa4WM6Ipo3972gBKUUjoatyUGM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mi9G6Pj5w6yewEik80X5ZwrgjF0DaxFr0/+DsPGXJz9wmf1gqzwmqcA589D6uNxnS
	 9QD/KMQ4w2GsplJs4FRx1a9IskclllE+9VePyoNzexux++QpdCVEbrnllaMEYcFx1l
	 tMrJu2qJ+yriCDMqxg0Sq5D+94ectxFQGniNHNxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62BF9F8014B;
	Mon, 17 Jan 2022 17:08:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F736F80249; Mon, 17 Jan 2022 17:08:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93778F80249
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 17:08:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93778F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="K1jiK7zT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20HFFYHF025138;
 Mon, 17 Jan 2022 10:08:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ckVtzevqA4xEJuoQpPtGyoEZQ52WPU9G2ryA25vdTls=;
 b=K1jiK7zTH68LhnKTRwBxnEYQNLryayc+bC5Sswo1kpNoU5z2iHf9C+ztpm2KqPtAyK6Q
 LZDKnTIdhsdBG0czs/AjH//WuQSjdX+mw5imVMn0CcWMPPzvKzFYY4IwluBonzrWrqul
 0dx0HaiBGu9bGIWAoRMleQe0cXG39kDegj1cx0nczX3rGhM5jYrhXVn8JiBA9XQr2AZ3
 L9QsTxXd36XJkOTvjp8FkfQJqxFoeMuhyVKRkh3ljoj44GblzaiUVKcQ7kpO1eBduv/P
 0AKWmJJVuudQlArLdndJ38s/+pzRMbCUmlicgw1sQ0X4zbyXoX9Vizkt7fYRfg25vs1H pA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dnaxhr22c-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 17 Jan 2022 10:08:36 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 16:08:33 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Mon, 17 Jan 2022 16:08:33 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1E92446C;
 Mon, 17 Jan 2022 16:08:33 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v2 5/6] ALSA: hda: cs35l41: Make use of the helper function
 dev_err_probe()
Date: Mon, 17 Jan 2022 16:08:29 +0000
Message-ID: <20220117160830.709403-5-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117160830.709403-1-tanureal@opensource.cirrus.com>
References: <20220117160830.709403-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: LdW5S1a2eD39MAr7yv-u5LsfcYP51c3E
X-Proofpoint-ORIG-GUID: LdW5S1a2eD39MAr7yv-u5LsfcYP51c3E
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>
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

When possible use dev_err_probe help to properly deal with the
PROBE_DEFER error, the benefit is that DEFER issue will be logged
in the devices_deferred debugfs file.
Using dev_err_probe() can reduce code size, and the error value
gets printed.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---

V2: New patch with code split from Tidyup patch in this series

---
 sound/pci/hda/cs35l41_hda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 82f982f574a9..c317b392c3e3 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -429,8 +429,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 		if (ret == -EBUSY) {
 			dev_info(cs35l41->dev, "Reset line busy, assuming shared reset\n");
 		} else {
-			if (ret != -EPROBE_DEFER)
-				dev_err(cs35l41->dev, "Failed to get reset GPIO: %d\n", ret);
+			dev_err_probe(cs35l41->dev, ret, "Failed to get reset GPIO: %d\n", ret);
 			goto err;
 		}
 	}
-- 
2.34.1

