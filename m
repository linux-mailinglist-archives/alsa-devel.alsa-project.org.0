Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EDB468333
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 08:30:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFAE022FB;
	Sat,  4 Dec 2021 08:29:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFAE022FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638603010;
	bh=tvpiBWluiI0t0HiFf9DTim6D5QC9SQxtEoEl7rvRhs4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D7X2+fYs/yx610fLt+MpV9kEoEPSoeLQLL1+HuNdqO5ShfO+WYEmxCzzCTqJiiR7a
	 Ypzue9eTTicXehJXghCTqyofg1Co+g9MYe7uQ2GOr+jd6Tj3f/YlnVMq0a5wGrWH47
	 8TXjBDzzxk7z+XXmW3Y74Im1yP8ovd3eC7tsTsj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62746F80240;
	Sat,  4 Dec 2021 08:28:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2171F8023B; Sat,  4 Dec 2021 08:28:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1D85F800D3
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 08:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1D85F800D3
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id tPTNmu8nXMNzvtPTNm2IQC; Sat, 04 Dec 2021 08:28:42 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 04 Dec 2021 08:28:42 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 leon@kernel.org
Subject: [PATCH] sound: Fix some typo
Date: Sat,  4 Dec 2021 08:28:40 +0100
Message-Id: <7b2bcbda298f02a34d46d8b6593daaaed9a09a45.1638602790.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Some comments and include guards are not consistent with the name of the
file where they can be found.

This is likely some typo or cut'n'paste issues.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/pci/ac97/ac97_pcm.c      | 2 +-
 sound/pci/hda/hda_generic.h    | 2 +-
 sound/soc/codecs/sta350.h      | 2 +-
 sound/soc/codecs/tlv320aic26.h | 6 +++---
 sound/usb/usx2y/usbusx2y.c     | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/ac97/ac97_pcm.c b/sound/pci/ac97/ac97_pcm.c
index 491de1a623cb..5fee8e89790f 100644
--- a/sound/pci/ac97/ac97_pcm.c
+++ b/sound/pci/ac97/ac97_pcm.c
@@ -231,7 +231,7 @@ static int set_spdif_rate(struct snd_ac97 *ac97, unsigned short rate)
  * If the codec doesn't support VAR, the rate must be 48000 (except
  * for SPDIF).
  *
- * The valid registers are AC97_PMC_MIC_ADC_RATE,
+ * The valid registers are AC97_PCM_MIC_ADC_RATE,
  * AC97_PCM_FRONT_DAC_RATE, AC97_PCM_LR_ADC_RATE.
  * AC97_PCM_SURR_DAC_RATE and AC97_PCM_LFE_DAC_RATE are accepted
  * if the codec supports them.
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index c43bd0f0338e..8e1bc8ea74fc 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -183,7 +183,7 @@ struct hda_gen_spec {
 	struct automic_entry am_entry[MAX_AUTO_MIC_PINS];
 
 	/* for pin sensing */
-	/* current status; set in hda_geneic.c */
+	/* current status; set in hda_generic.c */
 	unsigned int hp_jack_present:1;
 	unsigned int line_jack_present:1;
 	unsigned int speaker_muted:1; /* current status of speaker mute */
diff --git a/sound/soc/codecs/sta350.h b/sound/soc/codecs/sta350.h
index f16900e00afa..80bf56093d94 100644
--- a/sound/soc/codecs/sta350.h
+++ b/sound/soc/codecs/sta350.h
@@ -14,7 +14,7 @@
 #ifndef _ASOC_STA_350_H
 #define _ASOC_STA_350_H
 
-/* STA50 register addresses */
+/* STA350 register addresses */
 
 #define STA350_REGISTER_COUNT	0x4D
 #define STA350_COEF_COUNT 62
diff --git a/sound/soc/codecs/tlv320aic26.h b/sound/soc/codecs/tlv320aic26.h
index 1f2879b7a080..c86569883e0c 100644
--- a/sound/soc/codecs/tlv320aic26.h
+++ b/sound/soc/codecs/tlv320aic26.h
@@ -6,8 +6,8 @@
  * Copyright (C) 2008 Secret Lab Technologies Ltd.
  */
 
-#ifndef _TLV320AIC16_H_
-#define _TLV320AIC16_H_
+#ifndef _TLV320AIC26_H_
+#define _TLV320AIC26_H_
 
 /* AIC26 Registers */
 #define AIC26_PAGE_ADDR(page, offset)	((page << 11) | offset << 5)
@@ -88,4 +88,4 @@ enum aic26_wlen {
 	AIC26_WLEN_32	= 3 << 10,
 };
 
-#endif /* _TLV320AIC16_H_ */
+#endif /* _TLV320AIC26_H_ */
diff --git a/sound/usb/usx2y/usbusx2y.c b/sound/usb/usx2y/usbusx2y.c
index 099bee662af6..52f4e6652407 100644
--- a/sound/usb/usx2y/usbusx2y.c
+++ b/sound/usb/usx2y/usbusx2y.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * usbusy2y.c - ALSA USB US-428 Driver
+ * usbusx2y.c - ALSA USB US-428 Driver
  *
 2005-04-14 Karsten Wiese
 	Version 0.8.7.2:
-- 
2.30.2

