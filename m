Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C8745472B
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 14:26:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B05E18C4;
	Wed, 17 Nov 2021 14:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B05E18C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637155564;
	bh=VZOt9fLtvpr9O6ftieZnN53SCB+qbuBNv68jBMvcWkI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bdgqdQkWfSRO5BL4b8QI7y0+caxPL5/cpQdMUnFj7A3QmSkiuxS97d12XjRzAaEqs
	 aFDW7ZdsucJtVmNTR96nqdQUQ6/mMIIv/6Kj5s0Vsg8ePzFpRXaW51Rk71GAcS5T0s
	 QLXJixkhVGxu2aEe1YtMh8AV8Ll8Rk4FnZG2zND8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A65CF80508;
	Wed, 17 Nov 2021 14:23:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13229F804FB; Wed, 17 Nov 2021 14:23:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E53BF8027D
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 14:23:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E53BF8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="R1nZjBsp"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AH4qhZZ020405;
 Wed, 17 Nov 2021 07:23:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=0qQJAVTMHpYzFRrVbUU4QMPmgdxw2s22267GJm0xoxk=;
 b=R1nZjBspxmGdOBeFKW/g89od1d2ZM3Bd3+bRj64qi+7zzrqfcopUEoyS50ktCYg0TvUH
 MWJPmPASBg/OGlourE2eqW0qWe815icrP7RVb7e5IO5Gqwgq4gKwLz6BviwPCRbPYk7q
 upVP0qdQAQBM0DNmm66h0DUB4QCxHZHCCOh2odmVmFpB9fKKJGssM9dUoUYeTQNPCbwm
 BmwXuV+pvPHMf1YTroCxQys5HwaR0FboBiSlRoMHpBNpHAhfNrGLr/BNXiKTzzVScxSc
 JyQk4zgAnIagKMnfvPISLmgUbapF2ioD5S32iUNzORCfmIQ9o4zV6gVi3S/T/BIiqbEy kg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ccgtn14sf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 17 Nov 2021 07:23:02 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 17 Nov
 2021 13:23:00 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 17 Nov 2021 13:23:00 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7287446D;
 Wed, 17 Nov 2021 13:23:00 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 01/10] ASoC: wm_adsp: Remove the wmfw_add_ctl helper
 function
Date: Wed, 17 Nov 2021 13:22:51 +0000
Message-ID: <20211117132300.1290-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: AJLVLF9Cj8HN42dUzynksWftoJ3kT-13
X-Proofpoint-ORIG-GUID: AJLVLF9Cj8HN42dUzynksWftoJ3kT-13
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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

The helper function wmfw_add_ctl is only called from one place and that
place is a function with only 2 lines of code. Merge the helper function
into the work function to simplify the code.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 33 +++++++++------------------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index d4f0d72cbcc80..404717e30f44d 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -537,15 +537,20 @@ static unsigned int wmfw_convert_flags(unsigned int in, unsigned int len)
 	return out;
 }
 
-static int wmfw_add_ctl(struct wm_adsp *dsp, struct wm_coeff_ctl *ctl)
+static void wm_adsp_ctl_work(struct work_struct *work)
 {
+	struct wm_coeff_ctl *ctl = container_of(work,
+						struct wm_coeff_ctl,
+						work);
 	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
+	struct wm_adsp *dsp = container_of(cs_ctl->dsp,
+					   struct wm_adsp,
+					   cs_dsp);
 	struct snd_kcontrol_new *kcontrol;
-	int ret;
 
 	kcontrol = kzalloc(sizeof(*kcontrol), GFP_KERNEL);
 	if (!kcontrol)
-		return -ENOMEM;
+		return;
 
 	kcontrol->name = ctl->name;
 	kcontrol->info = wm_coeff_info;
@@ -571,29 +576,9 @@ static int wmfw_add_ctl(struct wm_adsp *dsp, struct wm_coeff_ctl *ctl)
 		break;
 	}
 
-	ret = snd_soc_add_component_controls(dsp->component, kcontrol, 1);
-	if (ret < 0)
-		goto err_kcontrol;
+	snd_soc_add_component_controls(dsp->component, kcontrol, 1);
 
 	kfree(kcontrol);
-
-	return 0;
-
-err_kcontrol:
-	kfree(kcontrol);
-	return ret;
-}
-
-static void wm_adsp_ctl_work(struct work_struct *work)
-{
-	struct wm_coeff_ctl *ctl = container_of(work,
-						struct wm_coeff_ctl,
-						work);
-	struct wm_adsp *dsp = container_of(ctl->cs_ctl->dsp,
-					   struct wm_adsp,
-					   cs_dsp);
-
-	wmfw_add_ctl(dsp, ctl);
 }
 
 static int wm_adsp_control_add(struct cs_dsp_coeff_ctl *cs_ctl)
-- 
2.11.0

