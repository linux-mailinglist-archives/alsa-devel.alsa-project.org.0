Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 104C49BBE4
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2019 07:01:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 747041669;
	Sat, 24 Aug 2019 07:00:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 747041669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566622892;
	bh=7VexdVcCxWWZn3p2tyadYkHUNykHn+Wim8irzZvxBPc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CLHzML67BXuhzJXKVKH6whqMMTioPTIJgkW78TUhvAhLUIcqtTODtr39dO9JPZXbv
	 FTe3SHzR0sLetzgCmlAQln6HjBhc0ot1r7tsxsTdYqyT2zHBZ7c3qGg1QKqT+hNxpt
	 2tj7ghzcCVGWGl1t87m3DZZUQm2jAT0hac0AoxDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2000AF803D5;
	Sat, 24 Aug 2019 06:59:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FFAFF8014A; Sat, 24 Aug 2019 06:59:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id C482BF8014A
 for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2019 06:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C482BF8014A
X-UUID: e369c2c1c47d4de98653d4eed5a9b08a-20190824
X-UUID: e369c2c1c47d4de98653d4eed5a9b08a-20190824
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
 with ESMTP id 84394507; Sat, 24 Aug 2019 12:58:52 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 24 Aug 2019 12:58:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 24 Aug 2019 12:58:44 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
Date: Sat, 24 Aug 2019 12:58:46 +0800
Message-ID: <1566622726-27113-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, eason.yen@mediatek.com
Subject: [alsa-devel] [PATCH v2 1/3] ASoC: mediatek: mt8183: fix tdm out
	data align issue
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

Mt8183 tdm out support S16_LE/S24_LE/S32_LE formats. When output S32_LE,
we need set hd_align so that memif can output MSB 24bits. When output
S24_LE, we need reset hd_align so that memif can output LSB 24bits.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index d16563408465..10ea4fdbeb1e 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -241,7 +241,7 @@ int mtk_afe_fe_prepare(struct snd_pcm_substream *substream,
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mtk_base_afe_memif *memif = &afe->memif[rtd->cpu_dai->id];
 	int hd_audio = 0;
-	int hd_align = 1;
+	int hd_align = 0;
 
 	/* set hd mode */
 	switch (substream->runtime->format) {
@@ -254,7 +254,6 @@ int mtk_afe_fe_prepare(struct snd_pcm_substream *substream,
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
 		hd_audio = 1;
-		hd_align = 0;
 		break;
 	default:
 		dev_err(afe->dev, "%s() error: unsupported format %d\n",
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
