Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E0754DBB4
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 09:32:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E82761AC9;
	Thu, 16 Jun 2022 09:31:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E82761AC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655364752;
	bh=EOlCgDSESFEHej+OBgK4JovTm/nBnNweRcysKlVqBIM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FuVOIJeHl+nC0MYQiqiIlnVi0zwDH7TstEO2MDZQkC13TzYqy0KD9O8Bl7/Q7HP0b
	 /zAcsa1dRmg1p6duv20sQKjf61vIiB/YL96j9x+TLkeQVSmuiRmlUQ84z4F2He82Gc
	 cNfaJ4xIfWy8Db3Jym/obh48f8uEK+eddLQkMpXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70A8AF8052D;
	Thu, 16 Jun 2022 09:31:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FECEF8047C; Thu, 16 Jun 2022 09:31:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0829EF800B9;
 Thu, 16 Jun 2022 09:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0829EF800B9
X-UUID: 36261da59e4b42b4b2d19b836396d293-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:1c4aa51a-309a-4d40-a1f8-1ca44eee49dc, OB:20,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:90
X-CID-INFO: VERSION:1.1.6, REQID:1c4aa51a-309a-4d40-a1f8-1ca44eee49dc, OB:20,
 LOB
 :0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,A
 CTION:quarantine,TS:90
X-CID-META: VersionHash:b14ad71, CLOUDID:6291b748-4c92-421c-ad91-b806c0f58b2a,
 C
 OID:a9cbaf6056d7,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 36261da59e4b42b4b2d19b836396d293-20220616
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2127911726; Thu, 16 Jun 2022 15:30:47 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 16 Jun 2022 15:30:46 +0800
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
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, YC Hung
 <yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>, Allen-KH
 Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 2/4] firmware: mediatek: Use meaningful names for mbox
Date: Thu, 16 Jun 2022 15:30:40 +0800
Message-ID: <20220616073042.13229-3-tinghan.shen@mediatek.com>
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

Rename mbox according to actions instead of 'mbox0' and 'mbox1'

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/firmware/mtk-adsp-ipc.c | 36 +++++++++++----------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/firmware/mtk-adsp-ipc.c b/drivers/firmware/mtk-adsp-ipc.c
index cb255a99170c..3c071f814455 100644
--- a/drivers/firmware/mtk-adsp-ipc.c
+++ b/drivers/firmware/mtk-adsp-ipc.c
@@ -12,6 +12,8 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+static const char * const adsp_mbox_ch_names[MTK_ADSP_MBOX_NUM] = { "rx", "tx" };
+
 /*
  * mtk_adsp_ipc_send - send ipc cmd to MTK ADSP
  *
@@ -72,7 +74,6 @@ static int mtk_adsp_ipc_probe(struct platform_device *pdev)
 	struct mtk_adsp_ipc *adsp_ipc;
 	struct mtk_adsp_chan *adsp_chan;
 	struct mbox_client *cl;
-	char *chan_name;
 	int ret;
 	int i, j;
 
@@ -83,12 +84,6 @@ static int mtk_adsp_ipc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
-		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
-		if (!chan_name) {
-			ret = -ENOMEM;
-			goto out;
-		}
-
 		adsp_chan = &adsp_ipc->chans[i];
 		cl = &adsp_chan->cl;
 		cl->dev = dev->parent;
@@ -99,17 +94,20 @@ static int mtk_adsp_ipc_probe(struct platform_device *pdev)
 
 		adsp_chan->ipc = adsp_ipc;
 		adsp_chan->idx = i;
-		adsp_chan->ch = mbox_request_channel_byname(cl, chan_name);
+		adsp_chan->ch = mbox_request_channel_byname(cl, adsp_mbox_ch_names[i]);
 		if (IS_ERR(adsp_chan->ch)) {
 			ret = PTR_ERR(adsp_chan->ch);
 			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "Failed to request mbox chan %d ret %d\n",
-					i, ret);
-			goto out_free;
-		}
+				dev_err(dev, "Failed to request mbox chan %s ret %d\n",
+					adsp_mbox_ch_names[i], ret);
+
+			for (j = 0; j < i; j++) {
+				adsp_chan = &adsp_ipc->chans[j];
+				mbox_free_channel(adsp_chan->ch);
+			}
 
-		dev_dbg(dev, "request mbox chan %s\n", chan_name);
-		kfree(chan_name);
+			return ret;
+		}
 	}
 
 	adsp_ipc->dev = dev;
@@ -117,16 +115,6 @@ static int mtk_adsp_ipc_probe(struct platform_device *pdev)
 	dev_dbg(dev, "MTK ADSP IPC initialized\n");
 
 	return 0;
-
-out_free:
-	kfree(chan_name);
-out:
-	for (j = 0; j < i; j++) {
-		adsp_chan = &adsp_ipc->chans[j];
-		mbox_free_channel(adsp_chan->ch);
-	}
-
-	return ret;
 }
 
 static int mtk_adsp_ipc_remove(struct platform_device *pdev)
-- 
2.18.0

