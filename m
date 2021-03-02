Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4289132AC38
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:29:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D14311935;
	Tue,  2 Mar 2021 22:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D14311935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614720547;
	bh=DF/soS/vn/lAT3UlyAPe3RoFZ+ptO7MfGf8HQSYDL3Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MATUVDOjgs6QRXciVd2xrEKjnFrSQEPSITK/LwwD86Jna2iaAYsyDe1Bc1K3H5L0k
	 Y9qecQd3waYGb2x5fcd/HeYSWIldi7WhqcqFE4t58cN6NY9BVASDhB1Cn2zAU4IsW7
	 +1uRWs7i6KA/j1mBMCzDQbk0ouyesQ88rsgKz5qY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A0E4F804E4;
	Tue,  2 Mar 2021 22:26:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12CACF804B2; Tue,  2 Mar 2021 22:26:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6F3AF802A9
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:26:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6F3AF802A9
IronPort-SDR: eKPcMq2QIOdOc3fqk+73UAd34u7mEcGd6u4N3oeXYVp3NTrO0vGHzQ+ht/Wcyxvrl0zgbS+Ocy
 ryhGfw4phNrQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="183603748"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="183603748"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:26:03 -0800
IronPort-SDR: LWAC+DNEjYk1y6D8KQDRtEHIpYX4bOEWIDBWQG1h8Vl4CZ/ZyNqeqU6c9PIIsWnpSgMxkQbIun
 njsEva9xgksQ==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="399223360"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:25:48 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/24] ASoC: rt1011: remove redundant test
Date: Tue,  2 Mar 2021 15:25:05 -0600
Message-Id: <20210302212527.55158-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302212527.55158-1-pierre-louis.bossart@linux.intel.com>
References: <20210302212527.55158-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

cppcheck warning:

sound/soc/codecs/rt1011.c:1994:6: style: Condition 'tx_slotnum' is
always true [knownConditionTrueFalse]
 if (tx_slotnum)
     ^
sound/soc/codecs/rt1011.c:1895:24: note: Assuming that condition
'!tx_slotnum' is not redundant
 if (tx_slotnum > 2 || !tx_slotnum) {
                       ^
sound/soc/codecs/rt1011.c:1994:6: note: Condition 'tx_slotnum' is
always true
if (tx_slotnum)
     ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt1011.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index b9dadc8243b3..39a9f17ca0a9 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1987,10 +1987,10 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 		RT1011_TDM_I2S_DOCK_EN_1_MASK, tdm_en);
 	snd_soc_component_update_bits(component, RT1011_TDM2_SET_2,
 		RT1011_TDM_I2S_DOCK_EN_2_MASK, tdm_en);
-	if (tx_slotnum)
-		snd_soc_component_update_bits(component, RT1011_TDM_TOTAL_SET,
-			RT1011_ADCDAT1_PIN_CONFIG | RT1011_ADCDAT2_PIN_CONFIG,
-			RT1011_ADCDAT1_OUTPUT | RT1011_ADCDAT2_OUTPUT);
+
+	snd_soc_component_update_bits(component, RT1011_TDM_TOTAL_SET,
+		RT1011_ADCDAT1_PIN_CONFIG | RT1011_ADCDAT2_PIN_CONFIG,
+		RT1011_ADCDAT1_OUTPUT | RT1011_ADCDAT2_OUTPUT);
 
 _set_tdm_err_:
 	snd_soc_dapm_mutex_unlock(dapm);
-- 
2.25.1

