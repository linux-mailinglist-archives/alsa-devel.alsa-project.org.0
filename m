Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E17C640D823
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 13:11:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59B551887;
	Thu, 16 Sep 2021 13:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59B551887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631790678;
	bh=qkcZzBfqYD/ibyDoYNCGiSJ0n/kwxcXKRCFSTTsV4uQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EGWSfKxVguUcMX8AqIt/bS5cW2tUu6Rtba8qja55I9+BQhLTeREvfcHNSMN4Eknjn
	 VdLjWSJ6T58TjvgSPQktl615s3U8lfqpmL6HhNE1PxPfGrttqPl+swbq4o4y6r79Nl
	 0f0nf2inhMMhtzEtqiCxb2aR2QhjhRSAFTq36vRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3C59F80271;
	Thu, 16 Sep 2021 13:10:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C39CF8025E; Thu, 16 Sep 2021 13:09:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 228C4F80117
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 13:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 228C4F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="cNK5xIVp"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18G8MpLU022854; 
 Thu, 16 Sep 2021 06:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=mFi19XvaUko6t2jE/3cXw+dmfQOl+cAX8w3Eh3SXVLI=;
 b=cNK5xIVpUYTAN4lPVng+rG1fjX6r99Co1P/v69M8Vv+IFd5LKJMKkLZaJsTt5WyWzhTX
 7anXHhQ80kaF7s1SghC3/q/NPw6tjUU9xYyEHEhh7VIZr4A674wlETDf5cldOvZsCs4V
 QZSqW6OQWi6+/NuV+4a7tQgh40rI4YzcIN1ZQcQWCXllNioHsa5ZKUpxlezCFhuLEHmN
 X7mHkxY9/NdPcUeui1YM8HS2vn2ZfxllNiQNDuiCXsc6UYU6Z15xvBzm5mlMSaIA4bix
 2MIHTQSi4jCTvNtcxhVFYPEY75VtrD/qZnLcAXD1wEK4HoFKQeuxjjSBxLxsgsT8N2A2 UA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3b42c3g55h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Sep 2021 06:09:48 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 16 Sep
 2021 12:09:46 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Thu, 16 Sep 2021 12:09:46 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.230])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 88961B15;
 Thu, 16 Sep 2021 11:09:46 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH] ASoC: cs42l42: Minor fix all errors reported by checkpatch.pl
 script
Date: Thu, 16 Sep 2021 12:09:32 +0100
Message-ID: <20210916110932.10293-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: RFJnzexq69DN1V7fEWUT_fyrWmZroRwF
X-Proofpoint-ORIG-GUID: RFJnzexq69DN1V7fEWUT_fyrWmZroRwF
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index c586ebff45f7..d5e1e5228b5f 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -851,7 +851,7 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (params_width(params) == 24)
 		cs42l42->bclk = (cs42l42->bclk / 3) * 4;
 
-	switch(substream->stream) {
+	switch (substream->stream) {
 	case SNDRV_PCM_STREAM_CAPTURE:
 		if (channels == 2) {
 			val |= CS42L42_ASP_TX_CH2_AP_MASK;
@@ -935,7 +935,7 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 						      CS42L42_HP_ANA_BMUTE_MASK);
 
 		cs42l42->stream_use &= ~(1 << stream);
-		if(!cs42l42->stream_use) {
+		if (!cs42l42->stream_use) {
 			/*
 			 * Switch to the internal oscillator.
 			 * SCLK must remain running until after this clock switch.
@@ -1015,7 +1015,7 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 
 #define CS42L42_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
 			 SNDRV_PCM_FMTBIT_S24_LE |\
-			 SNDRV_PCM_FMTBIT_S32_LE )
+			 SNDRV_PCM_FMTBIT_S32_LE)
 
 static const struct snd_soc_dai_ops cs42l42_ops = {
 	.startup	= cs42l42_dai_startup,
@@ -1572,7 +1572,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	if ((~masks[5]) & irq_params_table[5].mask) {
 		if (stickies[5] & CS42L42_HSDET_AUTO_DONE_MASK) {
 			cs42l42_process_hs_type_detect(cs42l42);
-			switch(cs42l42->hs_type){
+			switch (cs42l42->hs_type) {
 			case CS42L42_PLUG_CTIA:
 			case CS42L42_PLUG_OMTP:
 				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADSET,
@@ -1604,7 +1604,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 				cs42l42->plug_state = CS42L42_TS_UNPLUG;
 				cs42l42_cancel_hs_type_detect(cs42l42);
 
-				switch(cs42l42->hs_type){
+				switch (cs42l42->hs_type) {
 				case CS42L42_PLUG_CTIA:
 				case CS42L42_PLUG_OMTP:
 					snd_soc_jack_report(cs42l42->jack, 0, SND_JACK_HEADSET);
-- 
2.25.1

