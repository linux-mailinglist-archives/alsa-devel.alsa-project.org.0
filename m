Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACFD55E5B6
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 17:36:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57E15163F;
	Tue, 28 Jun 2022 17:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57E15163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656430564;
	bh=REWJIPBZ3DdHZky65H6cXEVQYboR73b/2ng2YncRPI8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L3Ctp5caDQbHbqNCNXRt5jvRweNZ6ATcKMHdSMFfRtoGf1Ly1c3iZ1e6nSYWgVxyb
	 mxWNyfZtD3kaneRHI7AoK7QGiEKcnY99Wq+pNJ10y0XrE5b02Gp2BgW2RVUvHNVN1g
	 VRs5Ya7IRaGP46Z9vaX6mqO0jsEW6D2SpXz6a/WU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46DCBF80536;
	Tue, 28 Jun 2022 17:34:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3EB4F80536; Tue, 28 Jun 2022 17:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB574F80107
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 17:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB574F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AtplLyi0"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25SAPO2I011111;
 Tue, 28 Jun 2022 10:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=h+s9sft2OOTYhSCEtjVTTS2VSJSR6LqopQ6K+pEwIRY=;
 b=AtplLyi05zdDxYYYLThPcpN9i8Bxhxt9LTFfnKSl0gxy/sLXiWTZlmkuB+yAnR1A0Viy
 +s7OsIWVwHcxpVuXhwXT2evs5nVF1C1ndRt4eIKdjJQ8AZn7mNRQxwdVNX3hJ8WU5QHc
 +2ShX/kkaIWRFteDwDyurQ0DFUuNCZGdAgjSntSEBuyf9SlSBvCSro3POnbh9HLvKsBG
 AV2Ns5MwOiYYRBXphznOorzHWLIw6NRvoDUYjA9ZRMIwooo+TKsTb4RRzgrn8qnJXdFL
 UjMf9nG4zDe6iZ/aE0kK5g4zEDBp8QOVkn5cqcNmdzF044Fl8KSk6rdimubCvGRwAFzy 5Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gwys2mat2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 28 Jun 2022 10:34:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 28 Jun
 2022 16:34:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Tue, 28 Jun 2022 16:34:09 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 46FF72A1;
 Tue, 28 Jun 2022 15:34:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/4] ASoC: wm5102: Fix event generation for output compensation
Date: Tue, 28 Jun 2022 16:34:06 +0100
Message-ID: <20220628153409.3266932-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JDtivHhNZ4rrKEk9EKjZzAiA3ElKlLOK
X-Proofpoint-GUID: JDtivHhNZ4rrKEk9EKjZzAiA3ElKlLOK
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

The output compensation controls always returns zero regardless of if
the control value was updated. This results in missing notifications
to user-space of the control change. Update the handling to return 1
when the value is changed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm5102.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index da2f8998df87a..b034df47a5ef1 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -680,12 +680,17 @@ static int wm5102_out_comp_coeff_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
+	uint16_t dac_comp_coeff = get_unaligned_be16(ucontrol->value.bytes.data);
+	int ret = 0;
 
 	mutex_lock(&arizona->dac_comp_lock);
-	arizona->dac_comp_coeff = get_unaligned_be16(ucontrol->value.bytes.data);
+	if (arizona->dac_comp_coeff != dac_comp_coeff) {
+		arizona->dac_comp_coeff = dac_comp_coeff;
+		ret = 1;
+	}
 	mutex_unlock(&arizona->dac_comp_lock);
 
-	return 0;
+	return ret;
 }
 
 static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
@@ -706,12 +711,20 @@ static int wm5102_out_comp_switch_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
+	int ret = 0;
+
+	if (ucontrol->value.integer.value[0] > mc->max)
+		return -EINVAL;
 
 	mutex_lock(&arizona->dac_comp_lock);
-	arizona->dac_comp_enabled = ucontrol->value.integer.value[0];
+	if (arizona->dac_comp_enabled != ucontrol->value.integer.value[0]) {
+		arizona->dac_comp_enabled = ucontrol->value.integer.value[0];
+		ret = 1;
+	}
 	mutex_unlock(&arizona->dac_comp_lock);
 
-	return 0;
+	return ret;
 }
 
 static const char * const wm5102_osr_text[] = {
-- 
2.30.2

