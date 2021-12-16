Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D4E4767E6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 03:25:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 072CC1B04;
	Thu, 16 Dec 2021 03:25:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 072CC1B04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639621555;
	bh=CNwjVEcCkdQFNlkvCdjw02XyNM/blNNqYDvbsfb6TFk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qjGOZpIzKabVf+47WboZcZrUcO2StIUTjtN4SigfW1gum5BBQw4eX19dJ5r307knE
	 gSP4eT3dUtpGNzBMXWzueRsylvg8ew8KQjsT3U1qCcfO7m0ypb7i1xQh9GQhDwnB0n
	 Ed9/PZthERY4sj3iv7G1Arib1EzRHi5w6R0lFTOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 602FAF80157;
	Thu, 16 Dec 2021 03:24:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3AD1F8019D; Thu, 16 Dec 2021 03:24:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F826F80157
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 03:24:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F826F80157
X-UUID: 0e311d87e129456c830bbb56eb241c3c-20211216
X-UUID: 0e311d87e129456c830bbb56eb241c3c-20211216
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1773176115; Thu, 16 Dec 2021 10:24:29 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Dec 2021 10:24:28 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 16 Dec 2021 10:24:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 16 Dec 2021 10:24:28 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8195: correct default value
Date: Thu, 16 Dec 2021 10:24:24 +0800
Message-ID: <20211216022424.28470-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

mt8195_cg_patch is used to reset the default value of audio cg, so the
register value could be consistent with CCF reference count.
Nevertheless, AUDIO_TOP_CON1[1:0] is used to control an internal mux,
and it's expected to keep the default value 0.

This patch corrects the default value in case an unexpected behavior
happens in the future.

Fixes: 6746cc8582599 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 8a6db24116e3..e425f868476a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3029,7 +3029,7 @@ static const struct reg_sequence mt8195_afe_reg_defaults[] = {
 
 static const struct reg_sequence mt8195_cg_patch[] = {
 	{ AUDIO_TOP_CON0, 0xfffffffb },
-	{ AUDIO_TOP_CON1, 0xfffffffa },
+	{ AUDIO_TOP_CON1, 0xfffffff8 },
 };
 
 static int mt8195_afe_init_registers(struct mtk_base_afe *afe)
-- 
2.18.0

