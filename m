Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3D81F7361
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 07:18:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50F2C168D;
	Fri, 12 Jun 2020 07:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50F2C168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591939123;
	bh=pyi1PL6m34EEjFiiQB1NLjOCIvY1R4cvNgq9K7gNIzI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qJGv537d7gOlfzNyucE93pamdEqxiMT0wdQvDHKoocjtQbI1U3fDHBplsFN2DzHaq
	 0WeV+AjvpO2F8cNFTiW9Rb6yf49QqDmIUlAF0+eDCa2l9xnPk67L90jhGp36dBS4KC
	 iSq1CLMoVoLxUGZdnz1fNNOylzSkqlNph3BCKc+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B295F80279;
	Fri, 12 Jun 2020 07:16:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 229B2F8024A; Fri, 12 Jun 2020 07:16:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E76BF801F7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 07:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E76BF801F7
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 05C5FtxC6027422,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 05C5FtxC6027422
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 12 Jun 2020 13:15:55 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 12 Jun 2020 13:15:55 +0800
Received: from derek-pvm.localdomain (172.22.234.205) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 12 Jun 2020 13:15:54 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 3/5] ASoC: rt5682: Let PLL2 support the freq conversion for
 44100Hz sample rate
Date: Fri, 12 Jun 2020 13:15:23 +0800
Message-ID: <1591938925-1070-3-git-send-email-derek.fang@realtek.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591938925-1070-1-git-send-email-derek.fang@realtek.com>
References: <1591938925-1070-1-git-send-email-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.234.205]
X-ClientProxiedBy: RTEXMB05.realtek.com.tw (172.21.6.98) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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

From: "derek.fang" <derek.fang@realtek.com>

PLL2 of rt5682 only supports the freq conversion for 48000Hz
sample rate so far, this patch lets it support 44100Hz.

Signed-off-by: derek.fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682.c | 9 ++++++++-
 sound/soc/codecs/rt5682.h | 4 ++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index ca8e1f2..5959b6a 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2246,7 +2246,7 @@ static int rt5682_set_component_pll(struct snd_soc_component *component,
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 	struct rl6231_pll_code pll_code, pll2f_code, pll2b_code;
-	unsigned int pll2_fout1;
+	unsigned int pll2_fout1, pll2_ps_val;
 	int ret;
 
 	if (source == rt5682->pll_src[pll_id] &&
@@ -2315,8 +2315,15 @@ static int rt5682_set_component_pll(struct snd_soc_component *component,
 			pll2b_code.n_code);
 		snd_soc_component_write(component, RT5682_PLL2_CTRL_3,
 			pll2f_code.n_code << RT5682_PLL2F_N_SFT);
+
+		if (freq_out == 22579200)
+			pll2_ps_val = 1 << RT5682_PLL2B_SEL_PS_SFT;
+		else
+			pll2_ps_val = 1 << RT5682_PLL2B_PS_BYP_SFT;
 		snd_soc_component_update_bits(component, RT5682_PLL2_CTRL_4,
+			RT5682_PLL2B_SEL_PS_MASK | RT5682_PLL2B_PS_BYP_MASK |
 			RT5682_PLL2B_M_BP_MASK | RT5682_PLL2F_M_BP_MASK | 0xf,
+			pll2_ps_val |
 			(pll2b_code.m_bp ? 1 : 0) << RT5682_PLL2B_M_BP_SFT |
 			(pll2f_code.m_bp ? 1 : 0) << RT5682_PLL2F_M_BP_SFT |
 			0xf);
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index f172c9e..6d94327 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1080,6 +1080,10 @@
 #define RT5682_PLL2F_N_SFT			8
 
 /* PLL2 M/N/K Code Control 2 (0x009e) */
+#define RT5682_PLL2B_SEL_PS_MASK		(0x1 << 13)
+#define RT5682_PLL2B_SEL_PS_SFT			13
+#define RT5682_PLL2B_PS_BYP_MASK		(0x1 << 12)
+#define RT5682_PLL2B_PS_BYP_SFT			12
 #define RT5682_PLL2B_M_BP_MASK			(0x1 << 11)
 #define RT5682_PLL2B_M_BP_SFT			11
 #define RT5682_PLL2F_M_BP_MASK			(0x1 << 7)
-- 
2.7.4

