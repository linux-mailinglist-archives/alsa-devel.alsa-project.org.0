Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D63E53BC68
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 18:23:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DD42175A;
	Thu,  2 Jun 2022 18:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DD42175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654187031;
	bh=j+rjHQXfhULR6Nu84kPhhNf2FypCaSsX83sAPSYcmpc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W4ClFh8Ljv0b6IPM+spDb6rKy90iHwKxd1XnKGPQtYwfHkgzKUFv9e3LEVGaNunZS
	 ryI2KGzvS4FwwDqJG/hirudrG+phoIprWuJ1EVnkhS5rOVPJ0dO10fvBZXzeM62NE1
	 bQYNDab9GuyWksuyc0CISEwZkXUkGGKA0D5pYXLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3B79F8053B;
	Thu,  2 Jun 2022 18:21:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11523F80536; Thu,  2 Jun 2022 18:21:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39BD2F80272
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 18:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39BD2F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ewDv9Vs0"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252Ao5gD026091;
 Thu, 2 Jun 2022 11:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=0IeA4yIE6WcG+qW9hTFM5cHREHoUthyn64w2bgHrobo=;
 b=ewDv9Vs0LvLo1B4jhhvAkazO6kvDYjz4kzUQ6Msu8Z8YzHMCDF+LVXTGi1BbRZ68Y6jZ
 x7s+bkjWpUDtFlw8lfY6lG4wMsY4pg7dF+fR8NOsCmjo2EswIxKgprg2zRZjtkD7OTgm
 LhvbqeoVX3CCdyPgq+mah5huqM2h96iZaec7qZ/CS7W0DGgYtjaNMBQolp9q5+6L515o
 lCC5PimI/+QCILn+ApYFRTpUIErFQ9LEhr6M+HC3TBXdosppOr0UNlf+XuPPxyZz+Q6F
 gGWupm9ml0NX36Ghaq5HuyC43TCYhUICQWPR8HjoSSisZieuDi7aQ4lOzvs2cFXDm4cm bg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gbh51nq0d-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 02 Jun 2022 11:21:22 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 2 Jun
 2022 17:21:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 2 Jun 2022 17:21:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3C72D11D3;
 Thu,  2 Jun 2022 16:21:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 3/6] ASoC: cs53l30: Correct number of volume levels on SX
 controls
Date: Thu, 2 Jun 2022 17:21:16 +0100
Message-ID: <20220602162119.3393857-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602162119.3393857-1-ckeepax@opensource.cirrus.com>
References: <20220602162119.3393857-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0eGjFAiCPLPWlT9YKPozGF5ZOyEEII_w
X-Proofpoint-ORIG-GUID: 0eGjFAiCPLPWlT9YKPozGF5ZOyEEII_w
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, james.schulman@cirrus.com,
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

This driver specified the maximum value rather than the number of volume
levels on the SX controls, this is incorrect, so correct them.

Reported-by: David Rhodes <david.rhodes@cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs53l30.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 703545273900f..360ca2ffd5069 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -348,22 +348,22 @@ static const struct snd_kcontrol_new cs53l30_snd_controls[] = {
 	SOC_ENUM("ADC2 NG Delay", adc2_ng_delay_enum),
 
 	SOC_SINGLE_SX_TLV("ADC1A PGA Volume",
-		    CS53L30_ADC1A_AFE_CTL, 0, 0x34, 0x18, pga_tlv),
+		    CS53L30_ADC1A_AFE_CTL, 0, 0x34, 0x24, pga_tlv),
 	SOC_SINGLE_SX_TLV("ADC1B PGA Volume",
-		    CS53L30_ADC1B_AFE_CTL, 0, 0x34, 0x18, pga_tlv),
+		    CS53L30_ADC1B_AFE_CTL, 0, 0x34, 0x24, pga_tlv),
 	SOC_SINGLE_SX_TLV("ADC2A PGA Volume",
-		    CS53L30_ADC2A_AFE_CTL, 0, 0x34, 0x18, pga_tlv),
+		    CS53L30_ADC2A_AFE_CTL, 0, 0x34, 0x24, pga_tlv),
 	SOC_SINGLE_SX_TLV("ADC2B PGA Volume",
-		    CS53L30_ADC2B_AFE_CTL, 0, 0x34, 0x18, pga_tlv),
+		    CS53L30_ADC2B_AFE_CTL, 0, 0x34, 0x24, pga_tlv),
 
 	SOC_SINGLE_SX_TLV("ADC1A Digital Volume",
-		    CS53L30_ADC1A_DIG_VOL, 0, 0xA0, 0x0C, dig_tlv),
+		    CS53L30_ADC1A_DIG_VOL, 0, 0xA0, 0x6C, dig_tlv),
 	SOC_SINGLE_SX_TLV("ADC1B Digital Volume",
-		    CS53L30_ADC1B_DIG_VOL, 0, 0xA0, 0x0C, dig_tlv),
+		    CS53L30_ADC1B_DIG_VOL, 0, 0xA0, 0x6C, dig_tlv),
 	SOC_SINGLE_SX_TLV("ADC2A Digital Volume",
-		    CS53L30_ADC2A_DIG_VOL, 0, 0xA0, 0x0C, dig_tlv),
+		    CS53L30_ADC2A_DIG_VOL, 0, 0xA0, 0x6C, dig_tlv),
 	SOC_SINGLE_SX_TLV("ADC2B Digital Volume",
-		    CS53L30_ADC2B_DIG_VOL, 0, 0xA0, 0x0C, dig_tlv),
+		    CS53L30_ADC2B_DIG_VOL, 0, 0xA0, 0x6C, dig_tlv),
 };
 
 static const struct snd_soc_dapm_widget cs53l30_dapm_widgets[] = {
-- 
2.30.2

