Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B355376FDC2
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:47:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C49ACDF3;
	Fri,  4 Aug 2023 11:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C49ACDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691142457;
	bh=dUMTFHP/0VO+3n12J9pkG9/InFi6va7dULi2HiLsDb0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YbiMQo6x67qZrjZakXSA/X/hSf+EE3pmA2komgnpHRnKOuyFcDPSW0wtxNnUZx4s/
	 Lo9JMoY24RmFNb/CIqMInljQKxXuO9ATolH6yO2yB+6WKBWb7LvDr9Mp7ns3ieJFZj
	 X2dMBcoC1a3X7NXu45u+MJNv4fzDAkBkoKGbCgdQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C8A8F805F3; Fri,  4 Aug 2023 11:44:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF282F80564;
	Fri,  4 Aug 2023 11:44:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EA67F8025A; Thu,  3 Aug 2023 17:28:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BDB7F80149
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 17:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BDB7F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=MnDCwmQ/
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9aae28f03so1941931fa.0
        for <alsa-devel@alsa-project.org>;
 Thu, 03 Aug 2023 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691076521; x=1691681321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fv1LCJk+f7RVF8k/ixLAQ0iB0AzU0l/9VwQdVFGXgR8=;
        b=MnDCwmQ/dByCs/tojD4nKtp/RjoX793JDmx/Fzbo1WQVxl0M1xtoQsEIM/VaV9a+BD
         r1XxSYLb0h7ULkYpFKtX93xDcs1B11R9AZH+MW+mBm+T9RCjHse3ImhTqOzDu1mG4WNz
         f6bkEZ8kXrWmG7t22bXhWkgN+ZwyiVat7+cupd/GeGWOkAo2+cO0s0ePNEV7Upz7CROP
         koP+HjuaDobs81LngADNHkHYgO02MRjnamX0P22G1i3HH+ObcNlPVr/po4UVplDm5MQv
         Gg3wVklxRDpBUEc564EKnogGcbmGUkpMgRVg1PtmXFKZ0HSsyzqjmSk+J4zQannNiuk0
         0TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691076521; x=1691681321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fv1LCJk+f7RVF8k/ixLAQ0iB0AzU0l/9VwQdVFGXgR8=;
        b=VIBA1rkSj5ddi0OS9vDNGeVS8yr8Y+9+lQi+ntwXASA5ZQHsHbL40wDxdPkIJ/rwWt
         r6rpBY5LymtAbozLcAF1YeqfLGS8SwNS01BPTluHIbA2dhE7+UCUUoE/FSa51UgqdlNG
         Y9kK1NbNZO6gEFRLLf2wdzRLG+zBePNF+/dzxsTQHfHMtDDxBUtWnyS/fJJQVHo9pLuS
         OzGq1X8lstwKmC+6PDRxHaeVY+qyUDvfCyfdbEGDcN1oMuy+mcbbxqzmptjja6twToEp
         aM02JAtM47qz3yi0D3rdoV+Qs2okJ4A2ZWfnSSpTcsMMC0N73HB1YOf1HxDqsmTMcXjX
         ZANQ==
X-Gm-Message-State: ABy/qLbmytB+dBh7rjtV7cK2uJ5G6VrWgdtlTxvkMveDeC+JUhB6skJM
	1D2c//3YM+3iv0wKLYpJ5WM=
X-Google-Smtp-Source: 
 APBJJlH7BTs2SskwP8aha/5LX92ptdWcFqDZlLUmmHykJcslucD1S0yT5lOPHU67HB/TX5d5nkmHyw==
X-Received: by 2002:a05:651c:31a:b0:2b7:34c0:a03a with SMTP id
 a26-20020a05651c031a00b002b734c0a03amr9667022ljp.3.1691076520920;
        Thu, 03 Aug 2023 08:28:40 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([141.136.93.39])
        by smtp.gmail.com with ESMTPSA id
 e3-20020a17090681c300b00997d76981e0sm10617559ejx.208.2023.08.03.08.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 08:28:40 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcmtest: Move buffer iterator initialization to prepare
 callback
Date: Thu,  3 Aug 2023 19:28:24 +0400
Message-Id: <20230803152824.7531-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5ZZ2VYMKDDWE46SYEM43GHIHA25PJEYI
X-Message-ID-Hash: 5ZZ2VYMKDDWE46SYEM43GHIHA25PJEYI
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:44:31 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZZ2VYMKDDWE46SYEM43GHIHA25PJEYI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Trigger callback is not the best place for buffer iterator
initialization, so move it out to the prepare callback, where it
have to be.

Minor enhancement: remove redundant definitions and blank line.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 sound/drivers/pcmtest.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 08e14b5eb772..7f170429eb8f 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -41,8 +41,6 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 
-#define DEVNAME "pcmtestd"
-#define CARD_NAME "pcm-test-card"
 #define TIMER_PER_SEC 5
 #define TIMER_INTERVAL (HZ / TIMER_PER_SEC)
 #define DELAY_JIFFIES HZ
@@ -74,11 +72,11 @@ static u8 ioctl_reset_test;
 static struct dentry *driver_debug_dir;
 
 module_param(index, int, 0444);
-MODULE_PARM_DESC(index, "Index value for " CARD_NAME " soundcard");
+MODULE_PARM_DESC(index, "Index value for pcmtest soundcard");
 module_param(id, charp, 0444);
-MODULE_PARM_DESC(id, "ID string for " CARD_NAME " soundcard");
+MODULE_PARM_DESC(id, "ID string for pcmtest soundcard");
 module_param(enable, bool, 0444);
-MODULE_PARM_DESC(enable, "Enable " CARD_NAME " soundcard.");
+MODULE_PARM_DESC(enable, "Enable pcmtest soundcard.");
 module_param(fill_mode, short, 0600);
 MODULE_PARM_DESC(fill_mode, "Buffer fill mode: rand(0) or pattern(1)");
 module_param(inject_delay, int, 0600);
@@ -92,7 +90,6 @@ MODULE_PARM_DESC(inject_trigger_err, "Inject EINVAL error in the 'trigger' callb
 module_param(inject_open_err, bool, 0600);
 MODULE_PARM_DESC(inject_open_err, "Inject EBUSY error in the 'open' callback");
 
-
 struct pcmtst {
 	struct snd_pcm *pcm;
 	struct snd_card *card;
@@ -405,25 +402,9 @@ static int snd_pcmtst_pcm_close(struct snd_pcm_substream *substream)
 
 static int snd_pcmtst_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct pcmtst_buf_iter *v_iter = runtime->private_data;
-
 	if (inject_trigger_err)
 		return -EINVAL;
 
-	v_iter->sample_bytes = runtime->sample_bits / 8;
-	v_iter->period_bytes = frames_to_bytes(runtime, runtime->period_size);
-	if (runtime->access == SNDRV_PCM_ACCESS_RW_NONINTERLEAVED ||
-	    runtime->access == SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED) {
-		v_iter->chan_block = runtime->dma_bytes / runtime->channels;
-		v_iter->interleaved = false;
-	} else {
-		v_iter->interleaved = true;
-	}
-	// We want to record RATE * ch_cnt samples per sec, it is rate * sample_bytes * ch_cnt bytes
-	v_iter->s_rw_ch = runtime->rate / TIMER_PER_SEC;
-	v_iter->b_rw = v_iter->s_rw_ch * v_iter->sample_bytes * runtime->channels;
-
 	return 0;
 }
 
@@ -454,8 +435,24 @@ static void pcmtst_pdev_release(struct device *dev)
 
 static int snd_pcmtst_pcm_prepare(struct snd_pcm_substream *substream)
 {
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct pcmtst_buf_iter *v_iter = runtime->private_data;
+
 	if (inject_prepare_err)
 		return -EINVAL;
+
+	v_iter->sample_bytes = samples_to_bytes(runtime, 1);
+	v_iter->period_bytes = snd_pcm_lib_period_bytes(substream);
+	v_iter->interleaved = true;
+	if (runtime->access == SNDRV_PCM_ACCESS_RW_NONINTERLEAVED ||
+	    runtime->access == SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED) {
+		v_iter->chan_block = snd_pcm_lib_buffer_bytes(substream) / runtime->channels;
+		v_iter->interleaved = false;
+	}
+	// We want to record RATE * ch_cnt samples per sec, it is rate * sample_bytes * ch_cnt bytes
+	v_iter->s_rw_ch = runtime->rate / TIMER_PER_SEC;
+	v_iter->b_rw = v_iter->s_rw_ch * v_iter->sample_bytes * runtime->channels;
+
 	return 0;
 }
 
-- 
2.34.1

