Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06440490C2B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 17:10:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EA68182B;
	Mon, 17 Jan 2022 17:09:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EA68182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642435825;
	bh=GYJJRk7/eopRKrzPgcmQZZXkBlbvS/5GC0z33Chg1PM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WjwGZ33Er96wcdPg4gh4ljxtRjWWC54RzEqX94ApOpgzDgdRpZYmWc89AYoF+Pkk7
	 rYKCqZr0CI8RK3tWI05Pcgm2dOiwT0ipT5RqwHuzJJaXPNmbuH7lWbdiA6hru+7SYu
	 WNVW5rFQGm2TVXOlOXpIX/YZA2zhfSGnag/G3YYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1586DF80511;
	Mon, 17 Jan 2022 17:08:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86B81F80506; Mon, 17 Jan 2022 17:08:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7E2BF800EB
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 17:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7E2BF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ABYlKoOy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20HFFYHC025138;
 Mon, 17 Jan 2022 10:08:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=bl5u1NTQ5L1xVZfZHeopeNSvmI7iSBTqrV2EHIRtC04=;
 b=ABYlKoOylzmVdR60EJP8p8eXcFV4koeulRwpGDUtSRp3edJ3h5Nkv7TF9n7dsFmfaidQ
 3B/JYwppuhGlNN/71Le3Ov6yWNJxKtqPznrIq0TV3UDyBdFzLtZY5DMnCsJ15ka/nIVA
 acd0NW1nL2Y5sCtwP8AY+Yl3inVYu3uKwIZSwH2xF5147LCd2DL7UvbA3vjav1uNZSdE
 QLW4nhaRJU/k8m7Nn5LcGP4jy09l+kOlIRkFFa8BCsP0AsCC9skeEF26Zf3K+hZWqeTY
 EbOFgPKJBxKRiP+KXnlMctHCdvBYmJxONNcUYY7SDKL8rBMhkTBXolJalCudwWGwy7d6 2A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dnaxhr22c-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 17 Jan 2022 10:08:34 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 16:08:32 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Mon, 17 Jan 2022 16:08:32 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 30A6646C;
 Mon, 17 Jan 2022 16:08:32 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v2 2/6] ALSA: hda: cs35l41: Add calls to newly added test key
 function
Date: Mon, 17 Jan 2022 16:08:26 +0000
Message-ID: <20220117160830.709403-2-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117160830.709403-1-tanureal@opensource.cirrus.com>
References: <20220117160830.709403-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ppEl2H72LnyX2_9CGX-V0GQJPYmIQdqP
X-Proofpoint-ORIG-GUID: ppEl2H72LnyX2_9CGX-V0GQJPYmIQdqP
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

The test key now needs to be manually held when calling
cs35l41_register_errata_patch, after patch:

Add the missing function calls to this driver.

Fixes: f517ba4924ad ("ASoC: cs35l41: Add support for hibernate memory retention mode")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---

V2: Add Fixes tag

---
 sound/pci/hda/cs35l41_hda.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index c47c5f0b4e59..509a380f9be7 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -463,6 +463,10 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 		goto err;
 	}
 
+	ret = cs35l41_test_key_unlock(cs35l41->dev, cs35l41->regmap);
+	if (ret)
+		goto err;
+
 	ret = cs35l41_register_errata_patch(cs35l41->dev, cs35l41->regmap, reg_revid);
 	if (ret)
 		goto err;
@@ -473,6 +477,10 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 		goto err;
 	}
 
+	ret = cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
+	if (ret)
+		goto err;
+
 	ret = cs35l41_hda_apply_properties(cs35l41, acpi_hw_cfg);
 	if (ret)
 		goto err;
-- 
2.34.1

