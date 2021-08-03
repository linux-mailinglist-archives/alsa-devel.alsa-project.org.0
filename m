Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA953DF227
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 18:10:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 843EB171C;
	Tue,  3 Aug 2021 18:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 843EB171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628007032;
	bh=ZoQYGObsUaSzaoxcF0gDwvqHoVqjDYq123mR+Cs2y80=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YjrUs9yMPMfFpDfONUjhuSZEluVoObjHD9G0nGWJRZw1h8nb11uupoKvEpQtS8H5B
	 MoxWcjZqs7OzrYejreUxRUccd6anGKmkb41XD/5h3j6wNjJNQ+TqfWTcKG+bh64HlN
	 HA6lNoYilSFvfaLcxd+YH76L7twjCjtSskmfKYp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03272F804D8;
	Tue,  3 Aug 2021 18:08:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F56EF804D8; Tue,  3 Aug 2021 18:08:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89717F802E8
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 18:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89717F802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RH0ttlns"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 173DLO6n010886; 
 Tue, 3 Aug 2021 11:08:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=OVfZ3pt8A3wXqJh2udmbOd+r3erd/wK8N4VYd970WG4=;
 b=RH0ttlnsyE26gFHHzDrQ8UWxHeNfp9uJMCs8iV3ejxWU9lJV7MlEQ+Qsb20TfEr1mmPh
 2xA3uiowQBsKaihxi8bBzDse2ogRpt+GsXsAPq9iVllbagHH1a29bmtNBecqh0EoZye5
 dBqMW0mAxCfpT7suzfpaG/76IQj5Z80lUZg0h3GX8gdIftYRtXierLKwVSSBOFofD82D
 HuWNu2E+9oXa+y49V7NBphyHmeeNBX0Z+Ucc4INq78QgBYXaJ6vdXd+M2eKcPsLqweke
 P8KePXKH7vXKVui8gloF3esTk9pLIdsseAIEZ/OGTjmftNGBjq9RXsYTHFcOgIW8gotJ Xw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a6r9fhbme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 03 Aug 2021 11:08:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 3 Aug
 2021 17:08:38 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 3 Aug 2021 17:08:38 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.37])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4CCC42BA;
 Tue,  3 Aug 2021 16:08:38 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: cs42l42: Remove duplicate control for WNF filter
 frequency
Date: Tue, 3 Aug 2021 17:08:34 +0100
Message-ID: <20210803160834.9005-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803160834.9005-1-rf@opensource.cirrus.com>
References: <20210803160834.9005-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ebl6xWMYHEmi4vTN7nxvH6dLUn9I1Oe3
X-Proofpoint-ORIG-GUID: ebl6xWMYHEmi4vTN7nxvH6dLUn9I1Oe3
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108030106
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

The driver was defining two ALSA controls that both change the same
register field for the wind noise filter corner frequency. The filter
response has two corners, at different frequencies, and the duplicate
controls most likely were an attempt to be able to set the value using
either of the frequencies.

However, having two controls changing the same field can be problematic
and it is unnecessary. Both frequencies are related to each other so
setting one implies exactly what the other would be.

Removing a control affects user-side code, but there is currently no
known use of the removed control so it would be best to remove it now
before it becomes a problem.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
---
 sound/soc/codecs/cs42l42.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 2db87e3a4dc3..a00dc3c65549 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -425,15 +425,6 @@ static SOC_ENUM_SINGLE_DECL(cs42l42_wnf3_freq_enum, CS42L42_ADC_WNF_HPF_CTL,
 			    CS42L42_ADC_WNF_CF_SHIFT,
 			    cs42l42_wnf3_freq_text);
 
-static const char * const cs42l42_wnf05_freq_text[] = {
-	"280Hz", "315Hz", "350Hz", "385Hz",
-	"420Hz", "455Hz", "490Hz", "525Hz"
-};
-
-static SOC_ENUM_SINGLE_DECL(cs42l42_wnf05_freq_enum, CS42L42_ADC_WNF_HPF_CTL,
-			    CS42L42_ADC_WNF_CF_SHIFT,
-			    cs42l42_wnf05_freq_text);
-
 static const struct snd_kcontrol_new cs42l42_snd_controls[] = {
 	/* ADC Volume and Filter Controls */
 	SOC_SINGLE("ADC Notch Switch", CS42L42_ADC_CTL,
@@ -451,7 +442,6 @@ static const struct snd_kcontrol_new cs42l42_snd_controls[] = {
 				CS42L42_ADC_HPF_EN_SHIFT, true, false),
 	SOC_ENUM("HPF Corner Freq", cs42l42_hpf_freq_enum),
 	SOC_ENUM("WNF 3dB Freq", cs42l42_wnf3_freq_enum),
-	SOC_ENUM("WNF 05dB Freq", cs42l42_wnf05_freq_enum),
 
 	/* DAC Volume and Filter Controls */
 	SOC_SINGLE("DACA Invert Switch", CS42L42_DAC_CTL1,
-- 
2.11.0

