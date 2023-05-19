Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BD670A659
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 10:22:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C498C851;
	Sat, 20 May 2023 10:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C498C851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684570943;
	bh=Gw9Nk8PkDIR6PLpCsbcwUBf7wrsSxj5ZWCKQZCGzVW0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Fil2F9XykM1x6HmooMHfa2b1hhjmTQtjkNJj/7h1KYZ8pgpQucbFcgYzCpJQw0dGb
	 FA8pKF7Lv1oQwoyzGvhiShmupwSPkFacVZHb7g0GUQ5VvZ0q0S4Z3X7bmCHUluV/9H
	 5INSrllCZqeWJPlIz1nOxNF4k8pCp8t6Ak9uUgyE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62599F8056F; Sat, 20 May 2023 10:20:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE220F80563;
	Sat, 20 May 2023 10:20:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C64AF80272; Fri, 19 May 2023 23:16:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CD31F8024E
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 23:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CD31F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=feoHRJaj
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-64d2467d640so2466266b3a.1
        for <alsa-devel@alsa-project.org>;
 Fri, 19 May 2023 14:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684531001; x=1687123001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5hMrPsXETXdUYGIPUMht35rFX/2A/wIEa9AD1NCqZE=;
        b=feoHRJajVXoGRyT1DlpVtAHKgDO2bRAUJNWq8xCnz05QMOevmCFEB9bWXjmtLfLX1G
         bwCv06j9XAzYtKywaraY1du3bcg/CNfYPPc5D0mqAxbnIpYnSK9mFmxuujnz1gh7pmbh
         GSpHd+P/cz4Vu0UY9cul2DtSIK8hFE3zevLiyHmi/e8dA01R2hgRM8+nS7xMoxTSRQca
         Ce3JnNyIapbbI1AKu7USnqJervS79llMPA3QenKCZVdfKCGv7prVeilEVZaFBTAKY1Ur
         TtA4A2Vjxb3cbMdjoZye7UGL0+5yuBxmqZOXAmrU3VMJdMdOFy94Ce1Y9/ZUjnxmXdWs
         19sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684531001; x=1687123001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5hMrPsXETXdUYGIPUMht35rFX/2A/wIEa9AD1NCqZE=;
        b=GGh3m1QgKEMoqlRIywWf55tLHCmWXgDVZ9oY4cge5c/BDChCX6wTRI6phxp2mlkUPn
         4xGH3FbKIbdNY6K/9Z4LdF/2SOJLh6919STTePppO7do6r1umFkEdFDLu2WilZ0J9nsZ
         W9h27jf0ZTc1YaV42HfJ0GETGJLdciGN5Gb6bpWTo+C64+ZrdnDDgGUAkASIHfyH0H7+
         XFyEkFVDlL2s0Pypw5EeqEuczXFg9WM9DuYBbIwUyel48tYnV0irGjszjdkyLkEb+ZR4
         V6GVeztP6nCGBf9mEMDRJJNSovdLSGO77hspK1KMI37fXH+SXHGSEIhq2EfMOdSQtwIL
         b3aw==
X-Gm-Message-State: AC+VfDw37Nm4PdPY6Nnn6MXh6WS+oePhFLmh5jgApPB+tfbfJfyAWkbj
	7coNztrXKVs3G3GsS0NMpO4=
X-Google-Smtp-Source: 
 ACHHUZ445VWHeMjyyHhoM02szw1B7s5OGkgW9z17+MhAY5V98leMuZwdsDxZF09fT2aYyVu6pehJ4A==
X-Received: by 2002:a05:6a21:100a:b0:100:a636:6f22 with SMTP id
 nk10-20020a056a21100a00b00100a6366f22mr2546019pzb.19.1684531000853;
        Fri, 19 May 2023 14:16:40 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-97-28.dynamic-ip.hinet.net.
 [36.228.97.28])
        by smtp.gmail.com with ESMTPSA id
 z6-20020aa785c6000000b00643aa9436c9sm110457pfn.172.2023.05.19.14.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 14:16:40 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Min-Hua Chen <minhuadotchen@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] SoC: ti: davinci-mcasp: Use pcm_for_each_format() macro
Date: Sat, 20 May 2023 05:16:36 +0800
Message-Id: <20230519211636.3699-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: minhuadotchen@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6WNGKPNR3HNTE4IRIISHKJQ53SA5YXEH
X-Message-ID-Hash: 6WNGKPNR3HNTE4IRIISHKJQ53SA5YXEH
X-Mailman-Approved-At: Sat, 20 May 2023 08:20:42 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WNGKPNR3HNTE4IRIISHKJQ53SA5YXEH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use pcm_for_each_format for the PCM format iteration and fix the
following sparse warnings.

sound/soc/ti/davinci-mcasp.c:1336:26: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/ti/davinci-mcasp.c:1358:26: sparse: warning: restricted snd_pcm_format_t degrades to integer
sound/soc/ti/davinci-mcasp.c:1438:26: sparse: warning: restricted snd_pcm_format_t degrades to integer

No functional changes.

Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---

Change since v1:
use clear subject format

---
 sound/soc/ti/davinci-mcasp.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index c0892be2992b..172fea764a31 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1328,15 +1328,16 @@ static int davinci_mcasp_hw_rule_slot_width(struct snd_pcm_hw_params *params,
 	struct davinci_mcasp_ruledata *rd = rule->private;
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	struct snd_mask nfmt;
-	int i, slot_width;
+	int slot_width;
+	snd_pcm_format_t i;
 
 	snd_mask_none(&nfmt);
 	slot_width = rd->mcasp->slot_width;
 
-	for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
-		if (snd_mask_test(fmt, i)) {
+	pcm_for_each_format(i) {
+		if (snd_mask_test_format(fmt, i)) {
 			if (snd_pcm_format_width(i) <= slot_width) {
-				snd_mask_set(&nfmt, i);
+				snd_mask_set_format(&nfmt, i);
 			}
 		}
 	}
@@ -1350,15 +1351,16 @@ static int davinci_mcasp_hw_rule_format_width(struct snd_pcm_hw_params *params,
 	struct davinci_mcasp_ruledata *rd = rule->private;
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	struct snd_mask nfmt;
-	int i, format_width;
+	int format_width;
+	snd_pcm_format_t i;
 
 	snd_mask_none(&nfmt);
 	format_width = rd->mcasp->max_format_width;
 
-	for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
-		if (snd_mask_test(fmt, i)) {
+	pcm_for_each_format(i) {
+		if (snd_mask_test_format(fmt, i)) {
 			if (snd_pcm_format_width(i) == format_width) {
-				snd_mask_set(&nfmt, i);
+				snd_mask_set_format(&nfmt, i);
 			}
 		}
 	}
@@ -1431,12 +1433,13 @@ static int davinci_mcasp_hw_rule_format(struct snd_pcm_hw_params *params,
 	struct snd_mask nfmt;
 	int rate = params_rate(params);
 	int slots = rd->mcasp->tdm_slots;
-	int i, count = 0;
+	int count = 0;
+	snd_pcm_format_t i;
 
 	snd_mask_none(&nfmt);
 
-	for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
-		if (snd_mask_test(fmt, i)) {
+	pcm_for_each_format(i) {
+		if (snd_mask_test_format(fmt, i)) {
 			uint sbits = snd_pcm_format_width(i);
 			unsigned int sysclk_freq;
 			int ppm;
@@ -1454,7 +1457,7 @@ static int davinci_mcasp_hw_rule_format(struct snd_pcm_hw_params *params,
 							 sbits * slots * rate,
 							 false);
 			if (abs(ppm) < DAVINCI_MAX_RATE_ERROR_PPM) {
-				snd_mask_set(&nfmt, i);
+				snd_mask_set_format(&nfmt, i);
 				count++;
 			}
 		}
-- 
2.34.1

