Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 154B01DABF9
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 09:25:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B71B9179C;
	Wed, 20 May 2020 09:24:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B71B9179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589959547;
	bh=/nvDptrW6xQYifOimPO0gVr6oGUy3wRz9ku5uobLDp4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LmCAtTFDUDQY9ioYV9ROA+FLfzzwtP/xz9Fatbjf9s76npPH3cs3QJUqFsDdzP24X
	 WnsHJXfnRXQUrvGKtY/uaO1NRRWTo7t1/sgUR2LGiFEaDiYhw+hvepa2REB5hF/UP1
	 hl1CxOSD3UcqU++nW6lLbFFJWe75qWVwe+wyMOoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 796A1F802A9;
	Wed, 20 May 2020 09:21:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D601CF801F9; Wed, 20 May 2020 09:21:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A9CFF80216
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 09:21:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A9CFF80216
IronPort-SDR: dLMg8gaCAchjvYn9j1QQijXoiTYkY1LkXq+Mef/f5gFBJVniu9c+L1SmChvbT7MVcWpT3USqnw
 avH02B95TUpWAiDdHWL2+gi4XrDtPUJB8NR+0U7FsAOkyl96v+d739/+MEmnIzpqK8qvOvAIh/
 S5gprgG1PoGaLYsa3aHPpnY42Wglu84ljAL8r39e/hTupe1uAO2Uk84VXYzHZMkvReU03fFoQJ
 nZDS9SwtcPtZrG24LdvRX31Z+pk7n01qIvRpasRgEc8OGkvOFioIqS2gQzpO5DQgpft1NB2Qhh
 Bc4=
X-IronPort-AV: E=Sophos;i="5.73,413,1583190000"; 
   d="scan'208";a="8662021"
From: Pavel Dobias <dobias@2n.cz>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH 5/6] ASoC: max9867: add mono playback switch
Date: Wed, 20 May 2020 09:19:03 +0200
Message-ID: <20200520071904.15801-5-dobias@2n.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200520071904.15801-1-dobias@2n.cz>
References: <20200520071904.15801-1-dobias@2n.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX04.axis.com (10.0.5.18)
Cc: broonie@kernel.org, ladis@linux-mips.org, Pavel Dobias <dobias@2n.cz>
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

Add Mono Playback switch to codec controls which enables codec's
capability of mixing left and right channel at the DAC output.

Signed-off-by: Pavel Dobias <dobias@2n.cz>
---
 sound/soc/codecs/max9867.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 9fa2acc73e18..902b1387b797 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -79,6 +79,7 @@ static const struct snd_kcontrol_new max9867_snd_controls[] = {
 	SOC_ENUM("DSP Filter", max9867_filter),
 	SOC_ENUM("ADC Filter", max9867_adc_filter),
 	SOC_ENUM("DAC Filter", max9867_dac_filter),
+	SOC_SINGLE("Mono Playback Switch", MAX9867_IFC1B, 3, 1, 0),
 };
 
 /* Input mixer */
@@ -361,7 +362,8 @@ static int max9867_dai_set_fmt(struct snd_soc_dai *codec_dai,
 	}
 
 	regmap_write(max9867->regmap, MAX9867_IFC1A, iface1A);
-	regmap_write(max9867->regmap, MAX9867_IFC1B, iface1B);
+	regmap_update_bits(max9867->regmap, MAX9867_IFC1B,
+			   MAX9867_IFC1B_BCLK_MASK, iface1B);
 
 	return 0;
 }
-- 
2.20.1

