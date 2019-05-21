Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B5A24B97
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 11:33:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B12681671;
	Tue, 21 May 2019 11:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B12681671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558431193;
	bh=E7OkrXEbTwm0tM8iOAJUb+KTDminI+xRvtMT3PFaxaA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bzqLfF0GoCuwNdy6ljh8s/oSvS4NTSsbG504IB4D2OowXKnmLMalCNGl7Ngpc3xu6
	 VIe/uCORp130k7okA1ca5b4a8qbbDyxTHHSmSmUE3EnBGl1InRXt0YTZ/XYyVAmuk4
	 4oSytwrB6Upl/LC2NbxOnNF8xRkN5LHIzE+JJZZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 533FFF89728;
	Tue, 21 May 2019 11:30:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B5B6F89709; Tue, 21 May 2019 11:30:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCAF2F806E7
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 11:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCAF2F806E7
X-UUID: a4f6417aeaf64441b928e7b8d5fad8f0-20190521
X-UUID: a4f6417aeaf64441b928e7b8d5fad8f0-20190521
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1696502; Tue, 21 May 2019 17:29:52 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs03n2.mediatek.inc (172.21.101.182) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 May 2019 17:29:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 21 May 2019 17:29:43 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
Date: Tue, 21 May 2019 17:29:37 +0800
Message-ID: <1558430978-2440-2-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1558430978-2440-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1558430978-2440-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6041E3935DF2EB47530DCC13BC892BD73048309CBC0EE37183E313E98AE0528C2000:8
X-MTK: N
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com,
 garlic.tseng@mediatek.com, Jiaxin
 Yu <jiaxin.yu@mediatek.com>, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, kaichieh.chuang@mediatek.com
Subject: [alsa-devel] [PATCH 1/2] ASoC: Mediatek: MT8183: fix compile error
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

mtk_regmap_update_bits() has been changed from four
parameters to five parameters.

Fixes: 1628fc3f4771 ("ASoC: Mediatek: MT8183: add memory interface data align")

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
Hi,
	This patch is based on for-5.3 branch.
	And tested pass on kukui board locally.
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 19048c3..d165634 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -266,8 +266,7 @@ int mtk_afe_fe_prepare(struct snd_pcm_substream *substream,
 			       1, hd_audio, memif->data->hd_shift);
 
 	mtk_regmap_update_bits(afe->regmap, memif->data->hd_align_reg,
-			       memif->data->hd_align_mshift,
-			       hd_align ? memif->data->hd_align_mshift : 0);
+			       1, hd_align, memif->data->hd_align_mshift);
 
 	return 0;
 }
-- 
1.8.1.1.dirty

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
