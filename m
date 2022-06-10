Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72470546D09
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 21:11:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C8661A42;
	Fri, 10 Jun 2022 21:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C8661A42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654888280;
	bh=cgPWrZH+Vp/ZsOt1KxDsP38j88nIRs5QGVyQbw4SGd0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HD8ZhITst/eKNpJapoZ7rRKNZXSbCDFoVF29yJs8U7pDxVO8+RP0rOn7P8VDcMJx4
	 xcDes0AQK8DC+Ga3DteveNIXYGTugPlUhCmNPCEgz4MsIUk5D0kcWasVG7BpD1nf4A
	 VncM7Kdn3ktapnhsyHJu/ocZk51NPnryTgbT+WRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 699B8F804D8;
	Fri, 10 Jun 2022 21:10:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C793CF804D2; Fri, 10 Jun 2022 21:10:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3708CF800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 21:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3708CF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="rKYIYIsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654888210; x=1686424210;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/6gzHtB1xLwyi5VfMRs3ROaVhmZ8nPMCJI4IxPVkTTk=;
 b=rKYIYIswnkShk6NZNViFud0Kc0uZiyJ0rhYpjlp3JtJswpt9t2F/6/fi
 qL68F3C5eDTOJPso5XOyRCunNYMVOnaqoNcqYUj5NbMKX4PCL8KfaP/mj
 oaoqFZacWCFgw1nFpaY43ye4WqD1qLZJiTjwCkJuKJH7Sj/pkU671tXom E=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 10 Jun 2022 12:10:04 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 12:09:48 -0700
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 10 Jun 2022 12:09:48 -0700
Received: from plai-linux.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 10 Jun 2022 12:09:47 -0700
From: Patrick Lai <quic_plai@quicinc.com>
To: <tiwai@suse.com>
Subject: [PATCH] ALSA: pcm: add 24KHz sample rate definition
Date: Fri, 10 Jun 2022 12:09:31 -0700
Message-ID: <20220610190931.24760-1-quic_plai@quicinc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Cc: Patrick Lai <quic_plai@quicinc.com>, alsa-devel@alsa-project.org
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

Add 24KHz sample rate definition as some hardware
can support 24KHz sample rate PCM data

Signed-off-by: Patrick Lai <quic_plai@quicinc.com>
---
 include/sound/pcm.h     | 24 +++++++++++++-----------
 sound/core/pcm_native.c |  4 ++--
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 6b99310b5b88..a761a4459091 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -111,23 +111,25 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_RATE_11025		(1<<2)		/* 11025Hz */
 #define SNDRV_PCM_RATE_16000		(1<<3)		/* 16000Hz */
 #define SNDRV_PCM_RATE_22050		(1<<4)		/* 22050Hz */
-#define SNDRV_PCM_RATE_32000		(1<<5)		/* 32000Hz */
-#define SNDRV_PCM_RATE_44100		(1<<6)		/* 44100Hz */
-#define SNDRV_PCM_RATE_48000		(1<<7)		/* 48000Hz */
-#define SNDRV_PCM_RATE_64000		(1<<8)		/* 64000Hz */
-#define SNDRV_PCM_RATE_88200		(1<<9)		/* 88200Hz */
-#define SNDRV_PCM_RATE_96000		(1<<10)		/* 96000Hz */
-#define SNDRV_PCM_RATE_176400		(1<<11)		/* 176400Hz */
-#define SNDRV_PCM_RATE_192000		(1<<12)		/* 192000Hz */
-#define SNDRV_PCM_RATE_352800		(1<<13)		/* 352800Hz */
-#define SNDRV_PCM_RATE_384000		(1<<14)		/* 384000Hz */
+#define SNDDV_PCM_RATE_24000		(1<<5)		/* 24000Hz */
+#define SNDRV_PCM_RATE_32000		(1<<6)		/* 32000Hz */
+#define SNDRV_PCM_RATE_44100		(1<<7)		/* 44100Hz */
+#define SNDRV_PCM_RATE_48000		(1<<8)		/* 48000Hz */
+#define SNDRV_PCM_RATE_64000		(1<<9)		/* 64000Hz */
+#define SNDRV_PCM_RATE_88200		(1<<10)		/* 88200Hz */
+#define SNDRV_PCM_RATE_96000		(1<<11)		/* 96000Hz */
+#define SNDRV_PCM_RATE_176400		(1<<12)		/* 176400Hz */
+#define SNDRV_PCM_RATE_192000		(1<<13)		/* 192000Hz */
+#define SNDRV_PCM_RATE_352800		(1<<14)		/* 352800Hz */
+#define SNDRV_PCM_RATE_384000		(1<<15)		/* 384000Hz */
 
 #define SNDRV_PCM_RATE_CONTINUOUS	(1<<30)		/* continuous range */
 #define SNDRV_PCM_RATE_KNOT		(1<<31)		/* supports more non-continuos rates */
 
 #define SNDRV_PCM_RATE_8000_44100	(SNDRV_PCM_RATE_8000|SNDRV_PCM_RATE_11025|\
 					 SNDRV_PCM_RATE_16000|SNDRV_PCM_RATE_22050|\
-					 SNDRV_PCM_RATE_32000|SNDRV_PCM_RATE_44100)
+					 SNDRV_PCM_RATE_24000|SNDRV_PCM_RATE_32000|\
+					 SNDRV_PCM_RATE_44100)
 #define SNDRV_PCM_RATE_8000_48000	(SNDRV_PCM_RATE_8000_44100|SNDRV_PCM_RATE_48000)
 #define SNDRV_PCM_RATE_8000_96000	(SNDRV_PCM_RATE_8000_48000|SNDRV_PCM_RATE_64000|\
 					 SNDRV_PCM_RATE_88200|SNDRV_PCM_RATE_96000)
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 4adaee62ef33..72e3eab09518 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2442,12 +2442,12 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
 }
 
-#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12
+#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 13
 #error "Change this table"
 #endif
 
 static const unsigned int rates[] = {
-	5512, 8000, 11025, 16000, 22050, 32000, 44100,
+	5512, 8000, 11025, 16000, 22050, 24000, 32000, 44100,
 	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000
 };
 
-- 
2.36.1

