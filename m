Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7536C43E330
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 16:11:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1507616AA;
	Thu, 28 Oct 2021 16:10:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1507616AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635430286;
	bh=ci6Ukxy0JaCHI7BWdaVVAKnaGruJ1pY2oH2oi1yOA/c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nix+qBQNFq5NsjrZ44/LLQd0sMjH6siUVqhnOkLM9qjs5DMXt3SgMoXQZ8DFmgOzm
	 rPAkf+z4hzzUkXMTLK2D3tW9DQU6Otw9ZqRV+cs/A7OC+9HWXWgL0OgUWKRK90Bnrm
	 WF+hcGUv6v2LA1SA79/QbisMXLey9paJrdBfzWQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBD83F804E5;
	Thu, 28 Oct 2021 16:09:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE85BF804AF; Thu, 28 Oct 2021 16:09:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BCEAF802C8
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 16:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BCEAF802C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="W+yUmcYS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19S8422u008357; 
 Thu, 28 Oct 2021 09:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ngBWTmOs4HWlzyxq6lq8y8I2SnDqznU1MlnyKmnPGYE=;
 b=W+yUmcYSo17ijhXNwEy3chSa70dVNGiQOtdFIfzzJ09BkfJqTOwMXNdcv++QMFXj3AxH
 FkXiwSN/UGiBaBRTev/l4NrWRyjZxzcyKji8FSoKIf0UyTnRoc/WJDHEsrPmT1CQdvRx
 ErZry6Foze3/KcniTItXo8z2+1IshdGhfnGcDtTyEpDiTmHM8yu0B5HMRRCTVm9MXR1X
 gQSIKOP8/nuK0WySTePc/+hDF6Ume3mDvpY12X/dVRPi4umxjTu8KcPNPI8CZ3lyTe2c
 hkvAWpvADlSr2efw8BA4xDWVu4ysh36HW56lzvVRtrQHpw6G2bWbBYLr2/WrWSnKrTN2 QQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bya1wh98x-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Oct 2021 09:09:10 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Thu, 28 Oct
 2021 15:09:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Thu, 28 Oct 2021 15:09:07 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7B3F8B2F;
 Thu, 28 Oct 2021 14:09:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>
Subject: [PATCH 2/3] ASoC: cs42l42: Correct configuring of switch inversion
 from ts-inv
Date: Thu, 28 Oct 2021 15:09:01 +0100
Message-ID: <20211028140902.11786-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211028140902.11786-1-rf@opensource.cirrus.com>
References: <20211028140902.11786-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: EviDpidQclLn-naTXo5TPHnY4VLZgnQ1
X-Proofpoint-ORIG-GUID: EviDpidQclLn-naTXo5TPHnY4VLZgnQ1
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
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

The setting from the cirrus,ts-inv property should be applied to the
TIP_SENSE_INV bit, as this is the one that actually affects the jack
detect block. The TS_INV bit only swaps the meaning of the PLUG and
UNPLUG interrupts and should always be 1 for the interrupts to have
the normal meaning.

Due to some misunderstanding the driver had been implemented to
configure the TS_INV bit based on the jack switch polarity. This made
the interrupts behave the correct way around, but left the jack detect
block, button detect and analogue circuits always interpreting an open
switch as unplugged.

The signal chain inside the codec is:

SENSE pin -> TIP_SENSE_INV -> TS_INV -> (invert) -> interrupts
                  |
                  v
             Jack detect,
          button detect and
            analog control

As the TIP_SENSE_INV already performs the necessary inversion the
TS_INV bit never needs to change. It must always be 1 to yield the
expected interrupt behaviour.

Some extra confusion has arisen because of the additional invert in the
interrupt path, meaning that a value applied to the TS_INV bit produces
the opposite effect of applying it to the TIP_SENSE_INV bit. The ts-inv
property has therefore always had the opposite effect to what might be
expected (0 = inverted, 1 = not inverted). To maintain the meaning of
the ts-inv property it must be inverted when applied to TIP_SENSE_INV.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
---
 sound/soc/codecs/cs42l42.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 1029f6b3eb48..27a1c4c73074 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1818,12 +1818,15 @@ static void cs42l42_setup_hs_type_detect(struct cs42l42_private *cs42l42)
 			(1 << CS42L42_HS_CLAMP_DISABLE_SHIFT));
 
 	/* Enable the tip sense circuit */
+	regmap_update_bits(cs42l42->regmap, CS42L42_TSENSE_CTL,
+			   CS42L42_TS_INV_MASK, CS42L42_TS_INV_MASK);
+
 	regmap_update_bits(cs42l42->regmap, CS42L42_TIPSENSE_CTL,
 			CS42L42_TIP_SENSE_CTRL_MASK |
 			CS42L42_TIP_SENSE_INV_MASK |
 			CS42L42_TIP_SENSE_DEBOUNCE_MASK,
 			(3 << CS42L42_TIP_SENSE_CTRL_SHIFT) |
-			(0 << CS42L42_TIP_SENSE_INV_SHIFT) |
+			(!cs42l42->ts_inv << CS42L42_TIP_SENSE_INV_SHIFT) |
 			(2 << CS42L42_TIP_SENSE_DEBOUNCE_SHIFT));
 
 	/* Save the initial status of the tip sense */
@@ -1867,10 +1870,6 @@ static int cs42l42_handle_device_data(struct device *dev,
 		cs42l42->ts_inv = CS42L42_TS_INV_DIS;
 	}
 
-	regmap_update_bits(cs42l42->regmap, CS42L42_TSENSE_CTL,
-			CS42L42_TS_INV_MASK,
-			(cs42l42->ts_inv << CS42L42_TS_INV_SHIFT));
-
 	ret = device_property_read_u32(dev, "cirrus,ts-dbnc-rise", &val);
 	if (!ret) {
 		switch (val) {
-- 
2.11.0

