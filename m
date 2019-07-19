Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B556E10B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 08:35:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE9AD1692;
	Fri, 19 Jul 2019 08:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE9AD1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563518133;
	bh=xC2gMjgTfl1PAFl27S54xsfipHJkHXrqCMIrjcnHyVM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=skIBhX85Zl8E51ijxxQlMAnhBMleiqr3dUgxjcYW+2/QZEpNjWl18y35w9sKmtHBC
	 2LmKLOjHfPG8AdACrbbS9AzfsCExvmraHWRyvpXIZeStOdj055VRlPvpUlzAngaPtu
	 24l9GBbdcOFATjTmVSKgHIVw/INaE4Va9FNWz02E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD24CF803D1;
	Fri, 19 Jul 2019 08:33:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA742F8036B; Fri, 19 Jul 2019 08:33:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBED5F800B2
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 08:32:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBED5F800B2
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x6J6WrIf016463,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x6J6WrIf016463
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 14:32:53 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server id
 14.3.439.0; Fri, 19 Jul 2019 14:32:53 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Fri, 19 Jul 2019 14:32:49 +0800
Message-ID: <20190719063249.18806-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, Shuming Fan <shumingf@realtek.com>,
 flove@realtek.com
Subject: [alsa-devel] [PATCH 2/3] ASoC: rt1308: add silence detection and
	manual PDB control
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

We enable the silence detection function in initial settings.
PDB control changes to manual mode, hence the driver could
fully control the AMP output on/off.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1308.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index 19d255e01827..cf3d72f99705 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -40,10 +40,10 @@ static const struct reg_sequence init_list[] = {
 	{ RT1308_VREF,			0x18100000 },
 	{ RT1308_IV_SENSE,		0x87010000 },
 	{ RT1308_DUMMY_REG,		0x00000200 },
-	{ RT1308_SIL_DET,		0x61c30000 },
+	{ RT1308_SIL_DET,		0xe1c30000 },
 	{ RT1308_DC_CAL_2,		0x00ffff00 },
 	{ RT1308_CLK_DET,		0x01000000 },
-	{ RT1308_POWER_STATUS,		0x00800000 },
+	{ RT1308_POWER_STATUS,		0x08800000 },
 	{ RT1308_DAC_SET,		0xafaf0700 },
 
 };
@@ -308,12 +308,13 @@ static int rt1308_classd_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMU:
 		msleep(30);
 		snd_soc_component_update_bits(component, RT1308_POWER_STATUS,
-			RT1308_POW_PDB_REG_BIT, RT1308_POW_PDB_REG_BIT);
+			RT1308_POW_PDB_REG_BIT | RT1308_POW_PDB_MN_BIT,
+			RT1308_POW_PDB_REG_BIT | RT1308_POW_PDB_MN_BIT);
 		msleep(40);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		snd_soc_component_update_bits(component, RT1308_POWER_STATUS,
-			RT1308_POW_PDB_REG_BIT, 0);
+			RT1308_POW_PDB_REG_BIT | RT1308_POW_PDB_MN_BIT, 0);
 		usleep_range(150000, 200000);
 		break;
 
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
