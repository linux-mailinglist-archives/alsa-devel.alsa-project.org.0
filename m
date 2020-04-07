Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E31A099A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 10:55:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD066167F;
	Tue,  7 Apr 2020 10:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD066167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586249741;
	bh=ESeN2fVEMIHkP4A4xVX1pyGYrIqzwOoIpEgNsYp7q+w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N0sHK56xRm0FTk5Na3Khv4yKepe9fOodenHQxWjF9Fq/+hNtt0nA7O0uOZoF5ON9T
	 yURjhe6Ed6WNrAzugP7p3cnYgjxa+QvLzk+w56pVUj4yYKg6ybhvKtsaBN3UUXhKDw
	 tGhYCUr0a9f0e3T+3tuJOGO6H6swF2q49rPh43mc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D37DAF802A0;
	Tue,  7 Apr 2020 10:51:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21BB6F801DA; Tue,  7 Apr 2020 10:31:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16B00F801D8
 for <alsa-devel@alsa-project.org>; Tue,  7 Apr 2020 10:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16B00F801D8
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4439BAEA954144C91373;
 Tue,  7 Apr 2020 16:31:05 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 7 Apr 2020
 16:30:58 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/4] ASoC: wm8991: remove defined but not used
 'wm8991_dapm_rxvoice_controls'
Date: Tue, 7 Apr 2020 16:29:30 +0800
Message-ID: <20200407082932.41511-3-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20200407082932.41511-1-yanaijie@huawei.com>
References: <20200407082932.41511-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 07 Apr 2020 10:51:32 +0200
Cc: Jason Yan <yanaijie@huawei.com>
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

Fix the following gcc warning:

sound/soc/codecs/wm8991.c:480:38: warning:
‘wm8991_dapm_rxvoice_controls’ defined but not used
[-Wunused-const-variable=]
 static const struct snd_kcontrol_new wm8991_dapm_rxvoice_controls[] = {
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 sound/soc/codecs/wm8991.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index 93c156782d59..f8375d67e901 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -476,14 +476,6 @@ static SOC_ENUM_SINGLE_DECL(wm8991_ainrmux_enum,
 static const struct snd_kcontrol_new wm8991_dapm_ainrmux_controls =
 	SOC_DAPM_ENUM("Route", wm8991_ainrmux_enum);
 
-/* RXVOICE */
-static const struct snd_kcontrol_new wm8991_dapm_rxvoice_controls[] = {
-	SOC_DAPM_SINGLE_TLV("LIN4RXN", WM8991_INPUT_MIXER5, WM8991_LR4BVOL_SHIFT,
-		WM8991_LR4BVOL_MASK, 0, in_mix_tlv),
-	SOC_DAPM_SINGLE_TLV("RIN4RXP", WM8991_INPUT_MIXER6, WM8991_RL4BVOL_SHIFT,
-		WM8991_RL4BVOL_MASK, 0, in_mix_tlv),
-};
-
 /* LOMIX */
 static const struct snd_kcontrol_new wm8991_dapm_lomix_controls[] = {
 	SOC_DAPM_SINGLE("LOMIX Right ADC Bypass Switch", WM8991_OUTPUT_MIXER1,
-- 
2.17.2

