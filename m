Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F96B54DBB6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 09:33:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3C981AD7;
	Thu, 16 Jun 2022 09:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3C981AD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655364780;
	bh=u3X8j0aQOk6m0Qmng1sMZzo8XgxdrWDd5lKTvYED25c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cNqSLPAJvptns9WWfB2faAswuBRl8kvwn8OGxV44tcd0DARv4mS7IElO0T/K9I5VI
	 uMtyJ4LjU46XeMp0qwKPR+s+Mna4zNesVrVHxGAEYiQBkchyG6is+p1O9GAIcUDLzQ
	 GtvAPvPwzQ4lVhmm3V2u+PTT2Qt2wa9CKb9sVZb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1D69F80537;
	Thu, 16 Jun 2022 09:31:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1CA8F80310; Thu, 16 Jun 2022 09:31:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56024F801D8;
 Thu, 16 Jun 2022 09:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56024F801D8
X-UUID: 69066bc42df949d598346ed3a799b673-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:d54dda31-b053-4d29-a716-423a9fd8c6ce, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:b14ad71, CLOUDID:7d3a74f6-e099-41ba-a32c-13b8bfe63214,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 69066bc42df949d598346ed3a799b673-20220616
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1054518062; Thu, 16 Jun 2022 15:30:47 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 15:30:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 16 Jun 2022 15:30:46 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, YC Hung
 <yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 "Allen-KH Cheng" <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 4/4] ASoC: SOF: mediatek: Align mt8186 clock names with
 dt-bindings
Date: Thu, 16 Jun 2022 15:30:42 +0800
Message-ID: <20220616073042.13229-5-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220616073042.13229-1-tinghan.shen@mediatek.com>
References: <20220616073042.13229-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

Align clock names in mt8186 dsp driver with dt-bindings.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-clk.c b/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
index 22220fd50b62..2df3b7ae1c6f 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
@@ -18,8 +18,8 @@
 #include "mt8186-clk.h"
 
 static const char *adsp_clks[ADSP_CLK_MAX] = {
-	[CLK_TOP_AUDIODSP] = "audiodsp_sel",
-	[CLK_TOP_ADSP_BUS] = "adsp_bus_sel",
+	[CLK_TOP_AUDIODSP] = "audiodsp",
+	[CLK_TOP_ADSP_BUS] = "adsp_bus",
 };
 
 int mt8186_adsp_init_clock(struct snd_sof_dev *sdev)
-- 
2.18.0

