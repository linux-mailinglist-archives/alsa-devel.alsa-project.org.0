Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B246240B567
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 18:54:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A67D1831;
	Tue, 14 Sep 2021 18:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A67D1831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631638487;
	bh=DgA5IyvFHLnRh5etnSR6s8GRrr+JVZ15ZfNtsM+HgEg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=moWCZUsPGPGMyI3YvMwvqnrap5WIdW+s2CsUIvUrlLQqTX3UWBvXgSDk/AmB5a2/h
	 +URSVJsoIusMnYiwD5WkrG036tN61v7XtvusCgAhbCr5n4l0zwvb6WrDJN7wxRsf+d
	 /yde1zfwDK2dP6YXp6HG/3vmFXxqUDntCctkib1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A4E4F804B0;
	Tue, 14 Sep 2021 18:52:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5598F804B3; Tue, 14 Sep 2021 18:52:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E53DF8025E
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 18:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E53DF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CtegOSoq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18E6cAGU023919; 
 Tue, 14 Sep 2021 11:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=gCzzPt3/u/djsUDB7B0Tqho7J20/PY/Oaga6nTwOlOM=;
 b=CtegOSoqZJvhLoO+M9ytB4GZNiw03HI3gpu1KsJlVxdbMoMbjuLBsuT05Ah6S4i3VSnZ
 zHcegmlGbSi7VFHBCBz2onDZWq1JGUWnJTngPf2ySWT1ivUjacHJCKAhXCsZIM95yFZF
 1QvxZgso3R+EvsG7rUg+Fr+oxIFw3xkajPpCoTENc55TvuhiDAVBopQLj3uK3WaqPSug
 tsSDdY2f9Xd6wqW5wEz0p8X3B2kzLhMAQV/3128NrjRCly50zNSTHxVY5pmieGzhpX2T
 2+b6iOGZetFvpCrps77dSCaWXmpB+ikHMIPsipS2OZhrrPBTc6OnhjHtzATzSUgw8Wn6 CA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3b29n3sa0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Sep 2021 11:52:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 14 Sep
 2021 17:52:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 14 Sep 2021 17:52:33 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.230])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 59530B2F;
 Tue, 14 Sep 2021 16:52:33 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH 1/2] ASoC: cs42l42: Minor fix all errors reported by
 checkpatch.pl script
Date: Tue, 14 Sep 2021 17:52:19 +0100
Message-ID: <20210914165220.752498-2-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914165220.752498-1-vitalyr@opensource.cirrus.com>
References: <20210914165220.752498-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tnt3qF4nAPsVY_vd8NV3ffiEkUKc2cEP
X-Proofpoint-ORIG-GUID: tnt3qF4nAPsVY_vd8NV3ffiEkUKc2cEP
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
index fb1e4c33e27d..ca76d907da52 100644
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
@@ -1492,7 +1492,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	if ((~masks[5]) & irq_params_table[5].mask) {
 		if (stickies[5] & CS42L42_HSDET_AUTO_DONE_MASK) {
 			cs42l42_process_hs_type_detect(cs42l42);
-			switch(cs42l42->hs_type){
+			switch (cs42l42->hs_type) {
 			case CS42L42_PLUG_CTIA:
 			case CS42L42_PLUG_OMTP:
 				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADSET,
@@ -1524,7 +1524,7 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 				cs42l42->plug_state = CS42L42_TS_UNPLUG;
 				cs42l42_cancel_hs_type_detect(cs42l42);
 
-				switch(cs42l42->hs_type){
+				switch (cs42l42->hs_type) {
 				case CS42L42_PLUG_CTIA:
 				case CS42L42_PLUG_OMTP:
 					snd_soc_jack_report(cs42l42->jack, 0, SND_JACK_HEADSET);
-- 
2.25.1

