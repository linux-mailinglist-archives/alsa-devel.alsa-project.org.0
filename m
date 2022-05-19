Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B9252DBFC
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 19:53:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92DAF17E2;
	Thu, 19 May 2022 19:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92DAF17E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652982802;
	bh=4FpNAoyag4fkpYCxlWaxnX3rgKsKUm8EKPi3usTzqtA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pcey3o1nSOQYu9t7JJXk9Tihs3r4oZHHAvG5ab1v8tYRNOPUyBz9Y0j12d1yaLjbV
	 bLuMMu2bM6FU7ajPEg/DciChlW1CYQiJATRN2sfrntQOTQpbR7VKRGW2uZM0GyeHFZ
	 Pc488GdkSzCaDw14JGIck/WxpCKar2Gw5EgUU+nM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88F78F805B2;
	Thu, 19 May 2022 19:48:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DAE6F8051D; Thu, 19 May 2022 19:48:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67B22F80524
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 19:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67B22F80524
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Y9N8YgVd"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k19E002261;
 Thu, 19 May 2022 12:47:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=WCDKyNszpTkK132PkGJoQgMJ3LGwxsgI4k0HIIXEq10=;
 b=Y9N8YgVdqMXuWPcWXfGzzsH3aycf4OxE5FYooT7WVFI5qCMU5vz/MSpmf7C0N6YygpM2
 CL8k8F0TbQ/lfCXP4Nd5iVILW81400HV1fNUo2CJ1Fc3QCZgS57J//A4Ao5hml4NKCTW
 C/j0qc8I5zzIyC/UsmM60ebgy8okQ5q4gSutMQPU2kFuNq+BS08STGYuoAA4YcGFZRNz
 0F4Px05UFU0gjsxRvtBpRXw1M4ZtKy8Va98w8FgnB1WABo60WRum0ra0T2Y4ZIfqqiRc
 4XSKsr/9O/NGuj+yiweBkLEVQFuCttVZq7cgirVUOcKjrq4pQ8GIv1GrOWbk+ASgd8Vf XQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37ted-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 12:47:55 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 18:47:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 18:47:54 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.59])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3EB02476;
 Thu, 19 May 2022 17:47:54 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v3 11/17] ASoC: cs35l41: Add common cs35l41 enter hibernate
 function
Date: Thu, 19 May 2022 18:47:43 +0100
Message-ID: <20220519174749.15459-12-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519174749.15459-1-vitalyr@opensource.cirrus.com>
References: <20220519174749.15459-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: E_2ngAPO-9OaDrTzAcEMdMrPdkLpwg1y
X-Proofpoint-ORIG-GUID: E_2ngAPO-9OaDrTzAcEMdMrPdkLpwg1y
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

Since the CS35L41 HDA driver also support hibernation, it
makes sense to move code from the ASoC driver to enter
hibernation into common code.

Since HDA must support laptops which do not support hibernation
due to lack of external boost GPIO it is necessary to
ensure the function returns an error when an unsupported
boost type is in use.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes since v2:
 - No change
 
 include/sound/cs35l41.h        |  2 ++
 sound/soc/codecs/cs35l41-lib.c | 19 +++++++++++++++++++
 sound/soc/codecs/cs35l41.c     | 10 +---------
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index f848ba1e75b3..9ac5918269a5 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -885,6 +885,8 @@ void cs35l41_configure_cs_dsp(struct device *dev, struct regmap *reg, struct cs_
 int cs35l41_set_cspl_mbox_cmd(struct device *dev, struct regmap *regmap,
 			      enum cs35l41_cspl_mbox_cmd cmd);
 int cs35l41_write_fs_errata(struct device *dev, struct regmap *regmap);
+int cs35l41_enter_hibernate(struct device *dev, struct regmap *regmap,
+			    enum cs35l41_boost_type b_type);
 int cs35l41_exit_hibernate(struct device *dev, struct regmap *regmap);
 int cs35l41_init_boost(struct device *dev, struct regmap *regmap,
 		       struct cs35l41_hw_cfg *hw_cfg);
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index e726a38f1997..0c7d1c791279 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -1322,6 +1322,25 @@ int cs35l41_write_fs_errata(struct device *dev, struct regmap *regmap)
 }
 EXPORT_SYMBOL_GPL(cs35l41_write_fs_errata);
 
+int cs35l41_enter_hibernate(struct device *dev, struct regmap *regmap,
+			    enum cs35l41_boost_type b_type)
+{
+	if (!cs35l41_safe_reset(regmap, b_type)) {
+		dev_dbg(dev, "System does not support Suspend\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "Enter hibernate\n");
+	regmap_write(regmap, CS35L41_WAKESRC_CTL, 0x0088);
+	regmap_write(regmap, CS35L41_WAKESRC_CTL, 0x0188);
+
+	// Don't wait for ACK since bus activity would wake the device
+	regmap_write(regmap, CS35L41_DSP_VIRT1_MBOX_1, CSPL_MBOX_CMD_HIBERNATE);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cs35l41_enter_hibernate);
+
 static void cs35l41_wait_for_pwrmgt_sts(struct device *dev, struct regmap *regmap)
 {
 	const int pwrmgt_retries = 10;
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index be7d02517739..a115ea35b92d 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1335,15 +1335,7 @@ static int __maybe_unused cs35l41_runtime_suspend(struct device *dev)
 	if (!cs35l41->dsp.preloaded || !cs35l41->dsp.cs_dsp.running)
 		return 0;
 
-	dev_dbg(cs35l41->dev, "Enter hibernate\n");
-
-	cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type);
-	regmap_write(cs35l41->regmap, CS35L41_WAKESRC_CTL, 0x0088);
-	regmap_write(cs35l41->regmap, CS35L41_WAKESRC_CTL, 0x0188);
-
-	// Don't wait for ACK since bus activity would wake the device
-	regmap_write(cs35l41->regmap, CS35L41_DSP_VIRT1_MBOX_1,
-		     CSPL_MBOX_CMD_HIBERNATE);
+	cs35l41_enter_hibernate(dev, cs35l41->regmap, cs35l41->hw_cfg.bst_type);
 
 	regcache_cache_only(cs35l41->regmap, true);
 	regcache_mark_dirty(cs35l41->regmap);
-- 
2.34.1

