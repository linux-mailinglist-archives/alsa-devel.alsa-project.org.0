Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF07A3DA9C4
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 19:11:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81A9E1AD5;
	Thu, 29 Jul 2021 19:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81A9E1AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627578673;
	bh=C2N9hEZ8+p9o9VNhU4nXs0G9Hgy6uzE93JRZSI0AzCs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ftn4bH6Z4TSMV7sip3DqE5D1lQraOa8n1IloXMSJFj9CoEcQMv6FisCDt1V5L3jRq
	 N8o3ABNmmt1de+opkBBLoDDMhLnDyS741KejQs6+XI6AfDfhyXT8O7n9qhph2lv0V8
	 gGyVMMCKV4kyZI6yG8JUSzHODD6BL/oUQQ+O3d3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A4CBF802E7;
	Thu, 29 Jul 2021 19:09:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45A31F802E7; Thu, 29 Jul 2021 19:09:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12B22F800E9
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 19:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B22F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="UZMaq1oU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16T6K8ls018919; 
 Thu, 29 Jul 2021 12:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=UeeA8HJNBJuHL3JDloEC88DdmSyhtbl+rgqLeCpvz1c=;
 b=UZMaq1oUOogQYAEor29jINZBNrQrfVmbBKLf2CUpzXEv+5it+2hfOWsQ2BPGCh2wNYjK
 fSl5nzUed8JgibrIKMaY2frlGYkRODCT7+fza7WZwlrFgjVc4kOBajv1wf6kko0wLzaU
 i4ZKQJue93ZgV1WGVThFSG5I71CBAarWyfDHkLlCO1VMv7upsC2SMly7MW/L1B1MqCDj
 r2WGKQkOir+lqQWTmDgdHRcJd/L+x2mz2OZepT2PCoeEReJcN1hG8RnbTg/WoPsOZroT
 QfqqdrGPimTzUk35n4+yK1Nsf8k+FweH5G/p0HcpyBLBijWj/6vK5jgiNvW2p1zH/104 wg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a31m2t69n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 29 Jul 2021 12:09:34 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 29 Jul
 2021 18:09:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Thu, 29 Jul 2021 18:09:32 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.56])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 08CBE2BA;
 Thu, 29 Jul 2021 17:09:31 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: cs42l42: Correct definition of ADC Volume control
Date: Thu, 29 Jul 2021 18:09:27 +0100
Message-ID: <20210729170929.6589-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ovCb4bbfgpYhwz1KZuV46m-uKeXlOvbf
X-Proofpoint-ORIG-GUID: ovCb4bbfgpYhwz1KZuV46m-uKeXlOvbf
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107290101
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

The ADC volume is a signed 8-bit number with range -97 to +12,
with -97 being mute. Use a SOC_SINGLE_S8_TLV() to define this
and fix the DECLARE_TLV_DB_SCALE() to have the correct start and
mute flag.

Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index eff013f295be..2fd20511f246 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -405,7 +405,7 @@ static const struct regmap_config cs42l42_regmap = {
 	.use_single_write = true,
 };
 
-static DECLARE_TLV_DB_SCALE(adc_tlv, -9600, 100, false);
+static DECLARE_TLV_DB_SCALE(adc_tlv, -9700, 100, true);
 static DECLARE_TLV_DB_SCALE(mixer_tlv, -6300, 100, true);
 
 static const char * const cs42l42_hpf_freq_text[] = {
@@ -444,8 +444,7 @@ static const struct snd_kcontrol_new cs42l42_snd_controls[] = {
 				CS42L42_ADC_INV_SHIFT, true, false),
 	SOC_SINGLE("ADC Boost Switch", CS42L42_ADC_CTL,
 				CS42L42_ADC_DIG_BOOST_SHIFT, true, false),
-	SOC_SINGLE_SX_TLV("ADC Volume", CS42L42_ADC_VOLUME,
-				CS42L42_ADC_VOL_SHIFT, 0xA0, 0x6C, adc_tlv),
+	SOC_SINGLE_S8_TLV("ADC Volume", CS42L42_ADC_VOLUME, -97, 12, adc_tlv),
 	SOC_SINGLE("ADC WNF Switch", CS42L42_ADC_WNF_HPF_CTL,
 				CS42L42_ADC_WNF_EN_SHIFT, true, false),
 	SOC_SINGLE("ADC HPF Switch", CS42L42_ADC_WNF_HPF_CTL,
-- 
2.11.0

