Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2FB490C2F
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 17:10:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50B2A1838;
	Mon, 17 Jan 2022 17:10:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50B2A1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642435854;
	bh=ziFdbF4qxwJAQPFrXZTHiwWTyM0Fy9EzGPLsny91jXA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iLo7KzRGyvdmnf4OpXx/+0p3CaFZ5mv9dy1lAcjDSnZDN1+OS460ftOYMjPZCbeC9
	 zI+4fjIxLJQ//IEX6IhdvZpb6qyhC8Xw0pjOyRaoCrNYItn4+PEfqA/4OzpXYBhw9d
	 h2MHhtVSFqI6YuxC3CmU56cUWNY6UYV6tFTvdkqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEA58F80516;
	Mon, 17 Jan 2022 17:08:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82061F800EB; Mon, 17 Jan 2022 17:08:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8B28F80100
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 17:08:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8B28F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="aH9gWWxr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20HFFYHA025138;
 Mon, 17 Jan 2022 10:08:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=KUv7ngvVuTUvfvAzKJH6kDlqhmw0mCvg7E2LNqztcsg=;
 b=aH9gWWxrwrp06o1iVySEwmvNsSTgYwG3Ih6PrPl5mQK2OtTIVgSJFBtnMcZPvx00KLEn
 lRu8ZMc5ZG30X8sOOqm8/9U/SpXt5iqCalnGKyCWQPLtnQo4aqDOF/Zv34oBSfhjynjB
 nUfSTmghIHhMDnPaEJyI8mFgtQ4C0a2X07Mi1Ce7mo/Ed5eji2bJuDbRWPGdnh+1/mw3
 oT97g+6BEWL/ncFLmgaI4RmRAKspU393prnqPwJbN7MAJl1K6iKvA2OSJvkZ5Zmenx/y
 BvLKRy8mDHfj81LDZBm/Ew4d25Hg9VBjxWNsHMQfMTsJB52T1XMr0HjyT4CF1mysj8hl mQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dnaxhr22c-1
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
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D679E459;
 Mon, 17 Jan 2022 16:08:31 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v2 1/6] ALSA: hda: cs35l41: Avoid overwriting register patch
Date: Mon, 17 Jan 2022 16:08:25 +0000
Message-ID: <20220117160830.709403-1-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ZQoJ3bLYtcWhv2KkilNAPdRESf1c6SdB
X-Proofpoint-ORIG-GUID: ZQoJ3bLYtcWhv2KkilNAPdRESf1c6SdB
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

regmap_register_patch can't be used to apply the probe sequence as a
patch is already registers with the regmap by
cs35l41_register_errata_patch and only a single patch can be attached to
a single regmap. The driver doesn't currently rely on a cache sync to
re-apply this probe sequence so simply switch it to a multi write.

Fixes: 7b2f3eb492da ("ALSA: hda: cs35l41: Add support for CS35L41 in HDA systems")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---

V2: Add Fixes tag

---
 sound/pci/hda/cs35l41_hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 30b40d865863..c47c5f0b4e59 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -480,7 +480,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	acpi_hw_cfg = NULL;
 
 	if (cs35l41->reg_seq->probe) {
-		ret = regmap_register_patch(cs35l41->regmap, cs35l41->reg_seq->probe,
+		ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41->reg_seq->probe,
 					    cs35l41->reg_seq->num_probe);
 		if (ret) {
 			dev_err(cs35l41->dev, "Fail to apply probe reg patch: %d\n", ret);
-- 
2.34.1

