Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFDE2802B5
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 17:26:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 185BE18F2;
	Thu,  1 Oct 2020 17:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 185BE18F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601565982;
	bh=QbMlH8RALXbCpUOBeZH9Clb6woNu16AkGaE88Ss2rLg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BYusQLguq2hL62MtLP9+p6Y5gQygFYU+1sipk7/4u1/+vHromONyqgvbz5VLDl+RJ
	 ZMVbdmlipF29ZkmVkXHHRdnH3AtKJ3PTaDohd7eKaCsbB5Oz18T8UHV4QG71vzzd8Q
	 7z6eeRgo4PhVBifVPwBDrdz2AUNAA6itzAVt33eM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38D9EF801D8;
	Thu,  1 Oct 2020 17:24:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCE0CF801F5; Thu,  1 Oct 2020 17:24:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E26FF800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 17:24:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E26FF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jlI6dbWf"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 091FKxcD000398; Thu, 1 Oct 2020 10:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=LHCWKOOcbrQlatytupaTTbRczWfrU9H6oZLDr1FxPks=;
 b=jlI6dbWfMfRZhxKNKfIQeX/Gl4Q3U9Va7mQxBMxs18t957gfze0sB5BBCNWlLKoxtG6m
 L/NU07BOchBrsbLLZXlgampkR1moqnKwG2pvfZtRrY88gJAc6xr121sadDR8pfvib8fF
 CA++cjWHV/sev/O1OOeB8fxqozNVGApZdQb+95XssJa3xSnSxDKQmD1mi6UALVavLx2V
 EXorRwKKPxoqiqt71SSxBuWYLVn8lTCNvXFkbF8Tkj5sOVlw9EVYCxjjbS9hcNgtvfPk
 xI+jQxKgYJ50hl2e0i2c0ERhyxgWsu+c6Bern9TAtfWglXsjC19SlO27uXsooSSuIkvw GQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 33t322fsv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 01 Oct 2020 10:24:28 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 1 Oct 2020
 16:24:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 1 Oct 2020 16:24:25 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D9B9B2A1;
 Thu,  1 Oct 2020 15:24:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: wm_adsp: Pass full name to snd_ctl_notify
Date: Thu, 1 Oct 2020 16:24:25 +0100
Message-ID: <20201001152425.8590-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 lowpriorityscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 suspectscore=1 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010010132
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, Adam.Brickman@cirrus.com
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

From: Adam Brickman <Adam.Brickman@cirrus.com>

A call to wm_adsp_write_ctl() could cause a kernel crash if it
does not retrieve a valid kcontrol from snd_soc_card_get_kcontrol().
This can happen due to a missing control name prefix. Then,
snd_ctl_notify() crashes when it tries to use the id field.

Modified wm_adsp_write_ctl() to incorporate the name_prefix (if applicable)
such that it is able to retrieve a valid id field from the kcontrol
once the platform has booted.

Fixes: eb65ccdb0836 ("ASoC: wm_adsp: Expose mixer control API")
Signed-off-by: Adam Brickman <Adam.Brickman@cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 410cca57da52d..344bd2c33bea1 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -2049,6 +2049,7 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 {
 	struct wm_coeff_ctl *ctl;
 	struct snd_kcontrol *kcontrol;
+	char ctl_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	int ret;
 
 	ctl = wm_adsp_get_ctl(dsp, name, type, alg);
@@ -2059,8 +2060,25 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 		return -EINVAL;
 
 	ret = wm_coeff_write_ctrl(ctl, buf, len);
+	if (ret)
+		return ret;
+
+	if (ctl->flags & WMFW_CTL_FLAG_SYS)
+		return 0;
+
+	if (dsp->component->name_prefix)
+		snprintf(ctl_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s %s",
+			 dsp->component->name_prefix, ctl->name);
+	else
+		snprintf(ctl_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s",
+			 ctl->name);
+
+	kcontrol = snd_soc_card_get_kcontrol(dsp->component->card, ctl_name);
+	if (!kcontrol) {
+		adsp_err(dsp, "Can't find kcontrol %s\n", ctl_name);
+		return -EINVAL;
+	}
 
-	kcontrol = snd_soc_card_get_kcontrol(dsp->component->card, ctl->name);
 	snd_ctl_notify(dsp->component->card->snd_card,
 		       SNDRV_CTL_EVENT_MASK_VALUE, &kcontrol->id);
 
-- 
2.11.0

