Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3249F581678
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 17:32:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B995715F9;
	Tue, 26 Jul 2022 17:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B995715F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658849570;
	bh=7rJfG8kXp3w5LU4NYR1zhF9VDBnXHsgsoM4YjJvJZx0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eAe2kkJHGk0gQo7B3OQ4gvAsGRqR4plUE8AK9R6obSnJHAMvnqDk/8/wTqRS359EN
	 ciSLnVVp5JabFE8WqB1QBLxP0Ap9L+PQDbSPlTJe2mqk7uMMBs2cIAyEhTnD3RMZZe
	 dmoXFGAN+U7qCC31wXiRf8f9Nfhtz8ialywmp81c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3926AF80155;
	Tue, 26 Jul 2022 17:31:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BA43F8025A; Tue, 26 Jul 2022 17:31:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 902EEF80155
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 17:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 902EEF80155
X-UUID: 36940567af7140c897fa69c7a1f330d0-20220726
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:6800985f-b994-48a6-860c-bc08bb50d045, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:95
X-CID-INFO: VERSION:1.1.8, REQID:6800985f-b994-48a6-860c-bc08bb50d045, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,ACT
 ION:quarantine,TS:95
X-CID-META: VersionHash:0f94e32, CLOUDID:609d14ee-db04-4499-9fdf-04ef44b9468c,
 C
 OID:e4b8c560132e,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 36940567af7140c897fa69c7a1f330d0-20220726
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1986539326; Tue, 26 Jul 2022 23:31:34 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 26 Jul 2022 23:31:32 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Tue, 26 Jul 2022 23:31:32 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <angelogioacchino.delregno@collabora.com>,
 <dan.carpenter@oracle.com>
Subject: [PATCH] ASoC: mediatek: mt8186: set the correct string to strncmp()
Date: Tue, 26 Jul 2022 23:31:30 +0800
Message-ID: <20220726153130.27584-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

Fix Smatch static checker warning. strncmp() here only needs to compare
the first seven bytes, so in order to make the code more clear, only the
first seven bytes of the string used as the comparison are reserved.

Bug report: https://www.spinics.net/lists/alsa-devel/msg145608.html

sound/soc/mediatek/mt8186/mt8186-dai-adda.c:78 get_adda_priv_by_name()
warn: strncmp() with weird length: 17 vs 7

sound/soc/mediatek/mt8186/mt8186-dai-adda.c
    72 static struct mtk_afe_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
    73                                                        const char *name)
    74 {
    75         struct mt8186_afe_private *afe_priv = afe->platform_priv;
    76         int dai_id;
    77
--> 78         if (strncmp(name, "aud_dac_hires_clk", 7) == 0 ||
    79             strncmp(name, "aud_adc_hires_clk", 7) == 0)

Fixes: b65c466220b3 ("ASoC: mediatek: mt8186: support adda in platform driver")
Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
index db71b032770d..81976f7c444e 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
@@ -75,8 +75,7 @@ static struct mtk_afe_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	int dai_id;
 
-	if (strncmp(name, "aud_dac_hires_clk", 7) == 0 ||
-	    strncmp(name, "aud_adc_hires_clk", 7) == 0)
+	if (strncmp(name, "aud_dac", 7) == 0 || strncmp(name, "aud_adc", 7) == 0)
 		dai_id = MT8186_DAI_ADDA;
 	else
 		return NULL;
-- 
2.25.1

