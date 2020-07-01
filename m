Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E722103AB
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 08:10:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B00C6167D;
	Wed,  1 Jul 2020 08:09:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B00C6167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593583846;
	bh=Q6PIE/Pm4qDhgK19inPjmvhsoSBovNM+lvWhqIkKVrk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iREfpqsGVHmoqVlehNEf0vCfTCjTdNNYue2cX8R2mc+8xNLsQILoPLZVqDvB4tmyx
	 SU9U9jk4z77QAaeuRQeTfUMGZkeyDIA0x3H/BFloRVynY4zsYjb5dvcaGsnXplAxAh
	 4HG+V6biGvDxlMPI9yi6tEB9qcjky4brmWaIUh8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68CC9F8025F;
	Wed,  1 Jul 2020 08:09:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52EA0F80256; Wed,  1 Jul 2020 08:08:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05761F80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 08:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05761F80217
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 06168iuK6016619,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 06168iuK6016619
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 1 Jul 2020 14:08:44 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 1 Jul 2020 14:08:44 +0800
Received: from localhost.localdomain (172.22.102.1) by RTEXMB01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Wed, 1 Jul 2020
 14:08:43 +0800
From: <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt1015: DAC volume range modification.
Date: Wed, 1 Jul 2020 14:08:36 +0800
Message-ID: <20200701060836.15117-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB05.realtek.com.tw (172.21.6.98) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, kent_chen@realtek.com, kenny_chen@realtek.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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

From: Jack Yu <jack.yu@realtek.com>

RT1015 dac volume range modification.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt1015.c | 4 ++--
 sound/soc/codecs/rt1015.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 548f68649064..90bd7e22ec3b 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -401,7 +401,7 @@ static bool rt1015_readable_register(struct device *dev, unsigned int reg)
 	}
 }
 
-static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -9525, 75, 0);
+static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -95625, 375, 0);
 
 static const char * const rt1015_din_source_select[] = {
 	"Left",
@@ -517,7 +517,7 @@ static int rt1015_bypass_boost_put(struct snd_kcontrol *kcontrol,
 
 static const struct snd_kcontrol_new rt1015_snd_controls[] = {
 	SOC_SINGLE_TLV("DAC Playback Volume", RT1015_DAC1, RT1015_DAC_VOL_SFT,
-		127, 0, dac_vol_tlv),
+		255, 0, dac_vol_tlv),
 	SOC_DOUBLE("DAC Playback Switch", RT1015_DAC3,
 		RT1015_DA_MUTE_SFT, RT1015_DVOL_MUTE_FLAG_SFT, 1, 1),
 	SOC_ENUM_EXT("Boost Mode", rt1015_boost_mode_enum,
diff --git a/sound/soc/codecs/rt1015.h b/sound/soc/codecs/rt1015.h
index 7bd159e8f958..cc1ae33ca753 100644
--- a/sound/soc/codecs/rt1015.h
+++ b/sound/soc/codecs/rt1015.h
@@ -214,8 +214,8 @@
 #define RT1015_ID_VERB				0x1
 
 /* 0x0102 */
-#define RT1015_DAC_VOL_MASK			(0x7f << 9)
-#define RT1015_DAC_VOL_SFT			9
+#define RT1015_DAC_VOL_MASK			(0xff << 8)
+#define RT1015_DAC_VOL_SFT			8
 
 /* 0x0104 */
 #define RT1015_DAC_CLK				(0x1 << 13)
-- 
2.27.0

