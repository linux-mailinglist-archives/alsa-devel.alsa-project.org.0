Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 695AE773F80
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 18:49:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72307851;
	Tue,  8 Aug 2023 18:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72307851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691513361;
	bh=S+ZLyoWMRp6vyh7fd6ikYxIQJLsjTYXpmR8xvH/Z5W4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zj/I0BaWLlBNBqnNIJ3dMd9tqkgHsSxfgE7HqlScJZkNhx13QzZ+JoWU0KTRbmNqN
	 Q3ZzaP1kaUnlIfiTrSyIkMCAdofxiemZ8qnLeQeELIpmLbfCBNKVXRhVD0g0rpmYJc
	 Zn7ph6cpLMJxKfMsB1O/a7TpWE/qg7ZBakcCduNk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86499F805A1; Tue,  8 Aug 2023 18:47:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF968F8057E;
	Tue,  8 Aug 2023 18:47:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42884F8057F; Tue,  8 Aug 2023 18:47:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4EF1F8053B
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 18:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4EF1F8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=c2D/cGWn
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 378F5h5e030864;
	Tue, 8 Aug 2023 11:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=DHwKlQABuWJSJlMrBP0tMZ5Qj6m10MGJY4M7p6mGmqo=; b=
	c2D/cGWnZfcQ0Jk8sbq5M0/P0rJCE+sXAYOPOGmFcRho+lSTw1WFuLt+nV/JNjSY
	JlaBEvrdq+3GTNQAc3SU5mUCNOleKoGqI8gvHFB90SUiCrjs3D9Y8JTqW6Cex7Xq
	RXP1+OfBty7GPUvV4B1G9DJj9es86UMWLhvndAeTn6dWb9CzTxvxNWgcrari8HDD
	Yngfs1BHgflsN7EAD0bhQAV4pPTRXJIKoCjrmSojfBEIVRcg+jCporpaCMwSNGQJ
	FNmldr4+3vLZfUkORq9x59HFweD0ZEVVLI3qo5htBfYyOhqpMFsffn1AJV1Lx2UY
	/QHj/mHz56Bf7db/5SUN2Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s9juhtucq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 11:47:06 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 17:47:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Tue, 8 Aug 2023 17:47:06 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.220])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A949F15B7;
	Tue,  8 Aug 2023 16:47:05 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 4/5] ASoC: wm_adsp: Expose the DSP power down actions as
 wm_adsp_power_down()
Date: Tue, 8 Aug 2023 17:47:01 +0100
Message-ID: <20230808164702.21272-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808164702.21272-1-rf@opensource.cirrus.com>
References: <20230808164702.21272-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ZAU_kgMQiXl-jgql4BPkaDIKLgpxLNZQ
X-Proofpoint-ORIG-GUID: ZAU_kgMQiXl-jgql4BPkaDIKLgpxLNZQ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: AXXG4YJLSOA4DG6CMNVWH374LOWCKIYE
X-Message-ID-Hash: AXXG4YJLSOA4DG6CMNVWH374LOWCKIYE
X-MailFrom: prvs=3584a5a98c=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXXG4YJLSOA4DG6CMNVWH374LOWCKIYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

To support self-booting DSPs that operate outside of a conventional DAPM
event life cycle expose a companion function to wm_adsp_power_up() so
that the correct state of the DSP firmware and controls can be recorded.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 8 +++++++-
 sound/soc/codecs/wm_adsp.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 5a89abfe8784..13f500fa9a5f 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1025,6 +1025,12 @@ int wm_adsp_power_up(struct wm_adsp *dsp)
 }
 EXPORT_SYMBOL_GPL(wm_adsp_power_up);
 
+void wm_adsp_power_down(struct wm_adsp *dsp)
+{
+	cs_dsp_power_down(&dsp->cs_dsp);
+}
+EXPORT_SYMBOL_GPL(wm_adsp_power_down);
+
 static void wm_adsp_boot_work(struct work_struct *work)
 {
 	struct wm_adsp *dsp = container_of(work,
@@ -1046,7 +1052,7 @@ int wm_adsp_early_event(struct snd_soc_dapm_widget *w,
 		queue_work(system_unbound_wq, &dsp->boot_work);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
-		cs_dsp_power_down(&dsp->cs_dsp);
+		wm_adsp_power_down(dsp);
 		break;
 	default:
 		break;
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 769904d34a87..3044f964ac14 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -92,6 +92,7 @@ int wm_adsp_early_event(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *kcontrol, int event);
 
 int wm_adsp_power_up(struct wm_adsp *dsp);
+void wm_adsp_power_down(struct wm_adsp *dsp);
 
 irqreturn_t wm_adsp2_bus_error(int irq, void *data);
 irqreturn_t wm_halo_bus_error(int irq, void *data);
-- 
2.30.2

