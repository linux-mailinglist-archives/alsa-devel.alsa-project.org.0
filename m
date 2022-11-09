Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FA36230D3
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 17:57:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4BD7168A;
	Wed,  9 Nov 2022 17:56:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4BD7168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668013052;
	bh=2T8L8sYRWzGqrDY2cUOkUx0oiy3tgh6JwaPPHYQDzLU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HYLt8h2nLiY3j8tRQRn9i1ydLF3d4qnI8bQx3RF/UMs30kgcltE7SYX2urk321omL
	 wZvHPmoHSMRYudXhJJiFX6SWDn2iTIDYg+mgYDWMV/BXshLfpdQhh3Ksvh+CCBOvxn
	 MuV2CWzyu4mAIkquAiFzXYqP0NUv5Oy6o2IdIdY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67027F805C5;
	Wed,  9 Nov 2022 17:54:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3767DF805B5; Wed,  9 Nov 2022 17:54:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65B9BF8055C
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 17:53:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65B9BF8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qTstbbsq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A9EDNja027347; Wed, 9 Nov 2022 10:53:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=1/iqdbl79p07gdmIWrlfhsD3njth3q+lAyMGYPPce6s=;
 b=qTstbbsq0uaNGrb9U9nPZAfnISIIkYaZ0BRhOBGsG1dhW5/ZKqm6ay9vt7NkDLQCt8Ct
 /lQsropm3vuktG8MdsjJcfjZ8WRYfWA/GL5vSUmuhCQV6PBLwUGcR9/8HcN+MrQiihjE
 p/c6qS8E/ydQ2yjW+uZJL4HPGe/8qhQJk2j6BxTUyIb+CCcUsE3VTXrSLWbN1TZ2el/T
 aPqfheLmFfbA5sWoGJFykNIzgqUoPE+uUxP6H0ZRAf0JH7z3gluaLXtpNJ9yct2GVsF0
 aV962D0xDcrT53mqhKzA3wdwW23D/yZ6uZXkuHI0Ng/SUFllLLJ5Vyr4WOJS8+mcedai SQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3knm8pde7v-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 10:53:41 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Wed, 9 Nov
 2022 10:53:37 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.15 via Frontend Transport; Wed, 9 Nov 2022 10:53:37 -0600
Received: from debianA11184.ad.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.92])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2FFE0468;
 Wed,  9 Nov 2022 16:53:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <linus.walleij@linaro.org>,
 <broonie@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
Subject: [PATCH 10/12] ASoC: wm_adsp: Allow client to hook into pre_run
 callback
Date: Wed, 9 Nov 2022 16:53:29 +0000
Message-ID: <20221109165331.29332-11-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221109165331.29332-1-rf@opensource.cirrus.com>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: d-QuLTs7FgaCQWnVepVFNDjx8Dyo62fV
X-Proofpoint-GUID: d-QuLTs7FgaCQWnVepVFNDjx8Dyo62fV
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>
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

Some HALO-based codecs need some additional custom setup in the
pre_run stage of cs_dsp. Implement the callback in wm_adsp to call
an optional codec driver callback.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 11 +++++++++++
 sound/soc/codecs/wm_adsp.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 8a2e9771bb50..34a94b011518 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1035,6 +1035,16 @@ int wm_adsp_early_event(struct snd_soc_dapm_widget *w,
 }
 EXPORT_SYMBOL_GPL(wm_adsp_early_event);
 
+static int wm_adsp_pre_run(struct cs_dsp *cs_dsp)
+{
+	struct wm_adsp *dsp = container_of(cs_dsp, struct wm_adsp, cs_dsp);
+
+	if (!dsp->pre_run)
+		return 0;
+
+	return (*dsp->pre_run)(dsp);
+}
+
 static int wm_adsp_event_post_run(struct cs_dsp *cs_dsp)
 {
 	struct wm_adsp *dsp = container_of(cs_dsp, struct wm_adsp, cs_dsp);
@@ -2043,6 +2053,7 @@ static const struct cs_dsp_client_ops wm_adsp1_client_ops = {
 static const struct cs_dsp_client_ops wm_adsp2_client_ops = {
 	.control_add = wm_adsp_control_add,
 	.control_remove = wm_adsp_control_remove,
+	.pre_run = wm_adsp_pre_run,
 	.post_run = wm_adsp_event_post_run,
 	.post_stop = wm_adsp_event_post_stop,
 	.watchdog_expired = wm_adsp_fatal_error,
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 375009a65828..dc2f7a096e26 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -36,6 +36,7 @@ struct wm_adsp {
 	int fw;
 
 	struct work_struct boot_work;
+	int (*pre_run)(struct wm_adsp *dsp);
 
 	bool preloaded;
 	bool fatal_error;
-- 
2.30.2

