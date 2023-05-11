Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8526FF9B0
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 20:57:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14CEC206;
	Thu, 11 May 2023 20:56:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14CEC206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683831432;
	bh=8diD/Bq41b082OkUMdzNXdgnkNpYeOgsXf5A+TRXZqo=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ha4zD4e540UYmLlv5mcINe0yv1EKPRZADiNPQcUAk3U7d+z6q6gL9gEN6Jsj4std6
	 ZQhFmfztOpV3TFW8q7PR2kSaMpqeadXESADblSC1DFfxzr8yRSBM4JGq6dMCZy8v+a
	 BEj3gEOHTQCSucyvsXhIqMJBf4rRYyEQajeqAGHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DFADF805BA; Thu, 11 May 2023 20:54:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87F3AF805B3;
	Thu, 11 May 2023 20:54:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9774F8053B; Thu, 11 May 2023 14:09:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9F45F80310
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 14:09:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9F45F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=s+ibXT5L
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-ba1b052e540so16489360276.3
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 05:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683806979; x=1686398979;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gq50IKagmAfx+KtR1kRor/KE8cLkJvCa6loH1PRIiT0=;
        b=s+ibXT5LhfW0Hyd5StfD45uuSAvx2H35hDpVPqOWumUSnfgb134dW44DYQTgLH6880
         Qb+kPoclvkP8Wre0VOySezhrld8bbiXeYV3QHpnqVstEYYfOZWqS5aJI/EpjJ6SZXfOY
         b9QWDFOt5zwBAxzL/I9XAM4IQSRsuPaW09RG0Zad4Mf8ek2BRVFrEcoymoKGP8wp1fk9
         ImAAH6jR/E/s7O8CutcWKEMY/XG3HYzhvmU0gvEvSg9/rUe546yR4t45/mKklroGj6HA
         jPcIK5VNpzuyNey3AuoxcAgvbMYlb18wc6gUpAO2AkbX+4bXGxiWaRd+BAkn+LnYoQln
         Cwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806979; x=1686398979;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gq50IKagmAfx+KtR1kRor/KE8cLkJvCa6loH1PRIiT0=;
        b=NBhrHF3FfwKMATAx2zE+NRHljHVsyI4frmaY7O9PP/cz3qu5H4p4XfkZt9LGvhug6h
         GgJhVbaLmF6H8psarmqZAupQdIzAPU8L321rDD+6L2F4yiJYB9ajf0H15TjJgJjCXXBY
         OSNFcV/fWd6H8PNVnyWLr7mZEhoarBqWVwwawSSZM8FCzix5dyQAzh+9RhdEQZz02PgR
         saS32CdWVtki7pFKSfMlSMo/aY5nERT1p69cbjeIFDOmvpGzZ159V/vzstok1whDw14T
         0+Z2ysvZdP3HV2xDxgZyapux1fxUV8icPmoEqAWnT6Gfn0wwZNRG4aNiGLR17jAkG48M
         zbRw==
X-Gm-Message-State: AC+VfDy502DQzuRbeRv6CQ8P2nABnrKE8r5xyRND9DCBAgopmyc3Z0le
	xQg/dSHZnVdGqkesM9cpO/gIyI4+BxJUDf9SYQ==
X-Google-Smtp-Source: 
 ACHHUZ7GXRvobpmjcTV1wtH42bsAR8OSXx4rcv3iFvcVWxwI4sZT6AufYn5/awPTYWKCyvVEL5XHKRiPeMfsWd2itA==
X-Received: from yixuanjiang.ntc.corp.google.com
 ([2401:fa00:fc:202:6c9a:64c9:7e44:6b1d])
 (user=yixuanjiang job=sendgmr) by 2002:a25:abb0:0:b0:b9e:71a7:3bc9 with SMTP
 id v45-20020a25abb0000000b00b9e71a73bc9mr12788020ybi.10.1683806978838; Thu,
 11 May 2023 05:09:38 -0700 (PDT)
Date: Thu, 11 May 2023 20:08:40 +0800
In-Reply-To: <20230511120841.2096524-1-yixuanjiang@google.com>
Mime-Version: 1.0
References: <20230511120841.2096524-1-yixuanjiang@google.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
Message-ID: <20230511120841.2096524-6-yixuanjiang@google.com>
Subject: [PATCH 5/6] ASoC: soc-pcm: test refcount before triggering
From: yixuanjiang <yixuanjiang@google.com>
To: tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yixuan Jiang <yixuanjiang@google.com>,
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: 
 3AttcZAsKClUL5KHxA65xA33BB381.zB9x8Fx-01I18x8Fx-CEB61zG.BE3@flex--yixuanjiang.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BY2LCNY22QCLR3ETFDMVKYNKRB7LLL7R
X-Message-ID-Hash: BY2LCNY22QCLR3ETFDMVKYNKRB7LLL7R
X-Mailman-Approved-At: Thu, 11 May 2023 18:54:31 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 848aedfdc6ba25ad5652797db9266007773e44dd ]

On start/pause_release/resume, when more than one FE is connected to
the same BE, it's possible that the trigger is sent more than
once. This is not desirable, we only want to trigger a BE once, which
is straightforward to implement with a refcount.

For stop/pause/suspend, the problem is more complicated: the check
implemented in snd_soc_dpcm_can_be_free_stop() may fail due to a
conceptual deadlock when we trigger the BE before the FE. In this
case, the FE states have not yet changed, so there are corner cases
where the TRIGGER_STOP is never sent - the dual case of start where
multiple triggers might be sent.

This patch suggests an unconditional trigger in all cases, without
checking the FE states, using a refcount protected by the BE PCM
stream lock.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20211207173745.15850-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Fixes: aa9ff6a4955f ("ASoC: soc-compress: Reposition and add pcm_mutex")
Signed-off-by: Yixuan Jiang <yixuanjiang@google.com>
Cc: stable@vger.kernel.org # 5.15+
---
 include/sound/soc-dpcm.h |  2 ++
 sound/soc/soc-pcm.c      | 53 +++++++++++++++++++++++++++++++---------
 2 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index e296a3949b18b..d963f3b608489 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -101,6 +101,8 @@ struct snd_soc_dpcm_runtime {
 	enum snd_soc_dpcm_state state;
 
 	int trigger_pending; /* trigger cmd + 1 if pending, 0 if not */
+
+	int be_start; /* refcount protected by BE stream pcm lock */
 };
 
 #define for_each_dpcm_fe(be, stream, _dpcm)				\
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7903516c89a6a..b6099d36518f5 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1630,7 +1630,7 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_CLOSE;
 			goto unwind;
 		}
-
+		be->dpcm[stream].be_start = 0;
 		be->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;
 		count++;
 	}
@@ -2116,14 +2116,21 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 
 		switch (cmd) {
 		case SNDRV_PCM_TRIGGER_START:
-			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_PREPARE) &&
+			if (!be->dpcm[stream].be_start &&
+			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PREPARE) &&
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				goto next;
 
+			be->dpcm[stream].be_start++;
+			if (be->dpcm[stream].be_start != 1)
+				goto next;
+
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				be->dpcm[stream].be_start--;
 				goto next;
+			}
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
@@ -2131,9 +2138,15 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_SUSPEND))
 				goto next;
 
+			be->dpcm[stream].be_start++;
+			if (be->dpcm[stream].be_start != 1)
+				goto next;
+
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				be->dpcm[stream].be_start--;
 				goto next;
+			}
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
@@ -2141,9 +2154,15 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				goto next;
 
+			be->dpcm[stream].be_start++;
+			if (be->dpcm[stream].be_start != 1)
+				goto next;
+
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				be->dpcm[stream].be_start--;
 				goto next;
+			}
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
@@ -2152,12 +2171,18 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				goto next;
 
-			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+			if (be->dpcm[stream].state == SND_SOC_DPCM_STATE_START)
+				be->dpcm[stream].be_start--;
+
+			if (be->dpcm[stream].be_start != 0)
 				goto next;
 
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				if (be->dpcm[stream].state == SND_SOC_DPCM_STATE_START)
+					be->dpcm[stream].be_start++;
 				goto next;
+			}
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
 			break;
@@ -2165,12 +2190,15 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
 				goto next;
 
-			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+			be->dpcm[stream].be_start--;
+			if (be->dpcm[stream].be_start != 0)
 				goto next;
 
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				be->dpcm[stream].be_start++;
 				goto next;
+			}
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_SUSPEND;
 			break;
@@ -2178,12 +2206,15 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
 				goto next;
 
-			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
+			be->dpcm[stream].be_start--;
+			if (be->dpcm[stream].be_start != 0)
 				goto next;
 
 			ret = soc_pcm_trigger(be_substream, cmd);
-			if (ret)
+			if (ret) {
+				be->dpcm[stream].be_start++;
 				goto next;
+			}
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_PAUSED;
 			break;
-- 
2.40.1.521.gf1e218fcd8-goog

