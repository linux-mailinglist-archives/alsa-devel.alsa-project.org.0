Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D48962BA0CB
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 04:08:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F0A09F6;
	Fri, 20 Nov 2020 04:07:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F0A09F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605841690;
	bh=MTghn/67snUfhp/xHV64LypA3Dz3jG0VnyBVQHGBq9s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C4ATg2mrmyVtrsa6ubkD3wsdbIMFwE6XjXR8c5y5peW7zlynKNXzcsFN2WzNuwk31
	 93qakc/qI06uDQl2ZipJ0L9BjJs4ugHYa1rr6NcM55BJZ7S8AUXoTpdO1cByKwTWog
	 3yZYkm6iyqU6ruF8zJZ4uF2G8ctfn9IWQpQ8cBtw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B1A5F80168;
	Fri, 20 Nov 2020 04:06:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3CDAF8016E; Fri, 20 Nov 2020 04:06:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id E71D4F800C5
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 04:06:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E71D4F800C5
X-UUID: daa51e0990e146df93aceb079cb5fba3-20201120
X-UUID: daa51e0990e146df93aceb079cb5fba3-20201120
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1709812961; Fri, 20 Nov 2020 11:06:17 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 11:06:15 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Nov 2020 11:06:15 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <tzungbi@google.com>, <alsa-devel@alsa-project.org>, <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: mediatek: mt6359: Fix regulator_dev_lookup() fails
 for id "LDO_VAUD18"
Date: Fri, 20 Nov 2020 11:06:12 +0800
Message-ID: <1605841573-1442-2-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1605841573-1442-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1605841573-1442-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: shane.chien@mediatek.com, Trevor.Wu@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
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

Mt6359 platform device is instantiated by mfd_add_devices(). In the
case, dev->of_node is NULL so that always fails to get the regulator_dev.

Use regualator-name "vaud18" that in dts node instead of
"LDO_VAUD19-supply". So that we can get regulator_dev through
regulator_lookup_by_name() directly.

Fixes: 64a70744b778 ("ASoC: Fix vaud18 power leakage of mt6359")
Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/codecs/mt6359.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index d37dbd2b50c2..6de0d744fa9e 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -1943,7 +1943,6 @@ static const struct snd_soc_dapm_widget mt6359_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY_S("CLK_BUF", SUPPLY_SEQ_CLK_BUF,
 			      MT6359_DCXO_CW12,
 			      RG_XO_AUDIO_EN_M_SFT, 0, NULL, 0),
-	SND_SOC_DAPM_REGULATOR_SUPPLY("LDO_VAUD18", 0, 0),
 	SND_SOC_DAPM_SUPPLY_S("AUDGLB", SUPPLY_SEQ_AUD_GLB,
 			      MT6359_AUDDEC_ANA_CON13,
 			      RG_AUDGLB_PWRDN_VA32_SFT, 1, NULL, 0),
@@ -1963,6 +1962,8 @@ static const struct snd_soc_dapm_widget mt6359_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY_S("AUDIF_CK", SUPPLY_SEQ_TOP_CK,
 			      MT6359_AUD_TOP_CKPDN_CON0,
 			      RG_AUDIF_CK_PDN_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_REGULATOR_SUPPLY("vaud18", 0, 0),
+
 	/* Digital Clock */
 	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_AFE_CTL", SUPPLY_SEQ_AUD_TOP_LAST,
 			      MT6359_AUDIO_TOP_CON0,
@@ -2312,7 +2313,7 @@ static int mt_dcc_clk_connect(struct snd_soc_dapm_widget *source,
 static const struct snd_soc_dapm_route mt6359_dapm_routes[] = {
 	/* Capture */
 	{"AIFTX_Supply", NULL, "CLK_BUF"},
-	{"AIFTX_Supply", NULL, "LDO_VAUD18"},
+	{"AIFTX_Supply", NULL, "vaud18"},
 	{"AIFTX_Supply", NULL, "AUDGLB"},
 	{"AIFTX_Supply", NULL, "CLKSQ Audio"},
 	{"AIFTX_Supply", NULL, "AUD_CK"},
@@ -2440,7 +2441,7 @@ static const struct snd_soc_dapm_route mt6359_dapm_routes[] = {
 
 	/* DL Supply */
 	{"DL Power Supply", NULL, "CLK_BUF"},
-	{"DL Power Supply", NULL, "LDO_VAUD18"},
+	{"DL Power Supply", NULL, "vaud18"},
 	{"DL Power Supply", NULL, "AUDGLB"},
 	{"DL Power Supply", NULL, "CLKSQ Audio"},
 	{"DL Power Supply", NULL, "AUDNCP_CK"},
-- 
2.18.0

