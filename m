Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB3855E5B5
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 17:35:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B625AE8;
	Tue, 28 Jun 2022 17:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B625AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656430552;
	bh=HMiiR+bbTNsCQKvUj0uF5h3tcDrIpx/Hl1hsZYf3+PQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X9fEWjINcnNmO4J2QXko7yn33Gr4AADv1blS0wPoDjgBBd3t54MqSn/EZ/ntYOxF6
	 HyESbkvXHnVTZOClWYuHLLSurWq6mxCKBEhc214BYJJxFm4ojZkiEEZD2N0MkW/exa
	 OEpvOFUoxVhHigr2/8AdDiJFEYRxrYSQNTgO6wXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7398F804CF;
	Tue, 28 Jun 2022 17:34:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 421E3F80115; Tue, 28 Jun 2022 17:34:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D21EF80166
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 17:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D21EF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AZHNrj+B"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25SAsNkW030341;
 Tue, 28 Jun 2022 10:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=fx+brN5T0/y3MeHTGAc+TGmH8wXatk2qoGD+69ypeB4=;
 b=AZHNrj+BilsuHdrkfOalqJizww2CFm7M31ggBSGO2rEWVTw8f7As6NRPNg8Ok9TOEf+3
 zNDBdqZU0assZGssg/6lTJ6N6eQ8LB/l25q2RTBI20j+4Yu6cr1zMSSJXjpD6ulYnwaw
 XvhG/Mc3fY0lrCkXg8UH/Lg8QZzCeovSLeCWHFHQgpg7i9OSkUGeoy9jyWnzPunQZBDy
 EK+Iph5VmK15HMnqkVOdYlM6Fxyamn3LewjlTQI0Bjf/ZEDr1tQDt6ZnjQDLErMbDCGZ
 7jtk0hyMUq2CSzKRn3AL/Z4oa4pxpN6QjkXTni0GoV8c9RPuhb0lLEtJRNfCb3R6UFGd 3w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gwxsq437w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 28 Jun 2022 10:34:10 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 28 Jun
 2022 16:34:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Tue, 28 Jun 2022 16:34:09 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5B61411D3;
 Tue, 28 Jun 2022 15:34:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 4/4] ASoC: arizona: Update arizona_aif_cfg_changed to use
 RX_BCLK_RATE
Date: Tue, 28 Jun 2022 16:34:09 +0100
Message-ID: <20220628153409.3266932-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220628153409.3266932-1-ckeepax@opensource.cirrus.com>
References: <20220628153409.3266932-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: MyYhvriIpCSaOzLNIL3qCf1g0HfwjtPH
X-Proofpoint-ORIG-GUID: MyYhvriIpCSaOzLNIL3qCf1g0HfwjtPH
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

Currently the function arizona_aif_cfg_changed uses the TX_BCLK_RATE,
however this register is not used on wm8998. This was not noticed as
previously snd_soc_component_read did not print an error message.
However, now the log gets filled with error messages, further more the
test for if the LRCLK changed will return spurious results.

Update the code to use the RX_BCLK_RATE register, the LRCLK parameters
are written to both registers and the RX_BCLK_RATE register is used
across all Arizona devices.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/arizona.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index e32871b3f68ac..7434aeeda292e 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -1760,8 +1760,8 @@ static bool arizona_aif_cfg_changed(struct snd_soc_component *component,
 	if (bclk != (val & ARIZONA_AIF1_BCLK_FREQ_MASK))
 		return true;
 
-	val = snd_soc_component_read(component, base + ARIZONA_AIF_TX_BCLK_RATE);
-	if (lrclk != (val & ARIZONA_AIF1TX_BCPF_MASK))
+	val = snd_soc_component_read(component, base + ARIZONA_AIF_RX_BCLK_RATE);
+	if (lrclk != (val & ARIZONA_AIF1RX_BCPF_MASK))
 		return true;
 
 	val = snd_soc_component_read(component, base + ARIZONA_AIF_FRAME_CTRL_1);
-- 
2.30.2

