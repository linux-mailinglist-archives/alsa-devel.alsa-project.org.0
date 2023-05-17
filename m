Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDBC708FCD
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 08:22:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40C206C0;
	Fri, 19 May 2023 08:21:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40C206C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684477330;
	bh=prvzinuFOY4cUz5izRoMAd55xReB5icUb0I0Jlc2QH4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aixHUfj1sqIQoZF+OVlNGz2l3LPvanmmpXrewvqG1ZiyqIo68V3mjfqU+tannWUAK
	 mY+yX5Qtekij0S/CFY6G/vak37MiQxQ1LSdcNqa51rfxHSmlZDCcylnFlx1gLKsNcc
	 s80YvnqXGmu6LbqO6MiDGFHGlOUgTkHlOLiDyjDc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04E0DF805BF; Fri, 19 May 2023 08:18:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D838DF805D5;
	Fri, 19 May 2023 08:18:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01BC1F80272; Wed, 17 May 2023 15:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71926F8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 15:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71926F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=seZjxxtm
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1ae4d1d35e6so6753185ad.0
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 06:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684328491; x=1686920491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8eTr+kmtQOMistU8xT35doPKpqXFH7Y2/6qZfkliXQY=;
        b=seZjxxtmfTvReRahRdu8pf3VrMApAAYx3KRJlLrsfNCfVrBh3Ch/ftGO+CE6/3KLJp
         Bo+LVzN0mozW5ReZfrmPbMVxhZnaZCHKVoKA5wbnhZ5xxWJKLD4flaFyL7f6gIQaPi8o
         um5/OP1FIsg1tDn755f1ssscGWmiz9rkBrmNJ4B02SClqX+Bf9ASCj/BC4xLVFkdET61
         68STZpPXYoP4BLEfp9buTukZCcc++pU+vUPAviVNc7nteXmVSBKhfIgAficiCBRq0B3d
         gCjKU+8ZtpTD3vmREkn1iMaJed3iVbNRonpxLitDZ8Pfsw2XTNySnhlgsrpZOQYmJVt7
         mH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684328491; x=1686920491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eTr+kmtQOMistU8xT35doPKpqXFH7Y2/6qZfkliXQY=;
        b=AK5eB//gr5aakXZDlL8HB9cyuL5a4twitTwVdCMYy6scVY/Iq7bZ5VhCbCPO+nYYCc
         6OPWazmb+kPP4izQFsx6FS0cpbSKomJzoRKhsuTCem8zn5wp9cZCdXqRfv/sFFBS5GDp
         HdNF2OCTfzmLztnFl0X7sppPf+qf/bW7XDgw2cFQwkr/5QpnX5dMMifhOMSfY8+/y+dL
         Xr2Oa5TEvc3XTje4QMsXn9elwHm/pDeOIRtJw+3d5BYOE8D3l4YRRedMnYz6OxyROPxm
         DOva4HxWoqBaAAfotO9OEJcjrwoCVcRcboKYb6ATPlUvNUrWZFbir7iSHQKBvzq9a9El
         +5vg==
X-Gm-Message-State: AC+VfDzH9Xg1G4L4RzMHoTFcLMx43gmaFTSzQdgyeLc53u+Rlnlt47VV
	BJZq4QxAIL6Ztl4b0HSPCMk=
X-Google-Smtp-Source: 
 ACHHUZ5CKkul94ZbhzG2mkSjbyrZSmL0AOKkrjBht/hCEzVCEhAObHX1vt6n10u0bWU1x65HrPd6Kw==
X-Received: by 2002:a17:902:b7cc:b0:1ac:3ddf:2299 with SMTP id
 v12-20020a170902b7cc00b001ac3ddf2299mr41063963plz.44.1684328489446;
        Wed, 17 May 2023 06:01:29 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-97-28.dynamic-ip.hinet.net.
 [36.228.97.28])
        by smtp.gmail.com with ESMTPSA id
 h7-20020a170902f7c700b001a1d41d1b8asm1725178plw.194.2023.05.17.06.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 06:01:29 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Min-Hua Chen <minhuadotchen@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: ti: Use pcm_for_each_format() macro for PCM format
 iteration
Date: Wed, 17 May 2023 21:01:22 +0800
Message-Id: <20230517130124.26033-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: minhuadotchen@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DFSTBJYUJX3LLSSQ47FI5RLABC2I3SUA
X-Message-ID-Hash: DFSTBJYUJX3LLSSQ47FI5RLABC2I3SUA
X-Mailman-Approved-At: Fri, 19 May 2023 06:16:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DFSTBJYUJX3LLSSQ47FI5RLABC2I3SUA/>
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

