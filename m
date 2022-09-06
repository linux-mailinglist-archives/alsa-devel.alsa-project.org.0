Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0AA5AE437
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 11:29:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9444E1652;
	Tue,  6 Sep 2022 11:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9444E1652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662456565;
	bh=WyVYZj+c9maI28dTmRLQ5XLV8nr4NB4/PmV9sY12Gmk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SwKe+Y6nz9d/6DVnN9geV1JzXv9/7D4MUJhSE8gjPlh/asYQGWkLa9eEPuFYBNLdY
	 47svOEHOmVBkitmE6/NHISULLB9sqHqWCFwYwRgsvax/xsrq/Oj+8giwj/KHhD6c5j
	 gh1Jnu1AzzDulRCeUm9/g5Nynz/1cFspFyyR38ls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0F16F80542;
	Tue,  6 Sep 2022 11:27:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E963F80535; Tue,  6 Sep 2022 11:27:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F492F80165;
 Tue,  6 Sep 2022 11:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F492F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="YvL7hcmY"
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 363D46601EB2;
 Tue,  6 Sep 2022 10:27:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662456459;
 bh=WyVYZj+c9maI28dTmRLQ5XLV8nr4NB4/PmV9sY12Gmk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YvL7hcmYNk/2CwJ3pZ9ZoLT98cjdp69vFL19MlIdv+b7lziyVountzzH4vlXnc+OW
 ZTh6WDE0KOWl2orEeVlPnAn/FoTp89rCJcgn2Vpe/cDljqQ1xRznKoc7ZYK8cniwN0
 oJHCPQFf/HvsWwA8hz7UHDIyTlINe1FLJIbh3GOKC5BODT2+k0UE27D5qFz2nsXsBb
 HjWhFFGg4O4ItFmN6/wKmHnXBw10ndrFevUobUu9h7fUP4TFpVz2mWYvfXa6e/ey2g
 J7Ef/JeNGkzLlWg2byJkSY0xCD5IQRHpbQPRs7/ogKE7A7NCgHzZASY5PMPtOxELof
 zDGl05rTg4iwQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Subject: [PATCH 2/5] ASoC: SOF: mediatek: mt8195: Import namespace
 SND_SOC_SOF_MTK_COMMON
Date: Tue,  6 Sep 2022 11:27:24 +0200
Message-Id: <20220906092727.37324-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
References: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, chunxu.li@mediatek.com,
 Allen-KH.Cheng@mediatek.com, lgirdwood@gmail.com, kernel@collabora.com,
 yung-chuan.liao@linux.intel.com, sound-open-firmware@alsa-project.org,
 peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, tzungbi@google.com, geert@linux-m68k.org,
 ranjani.sridharan@linux.intel.com, wenst@chromium.org, trevor.wu@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 daniel.baluta@nxp.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, yc.hung@mediatek.com
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

Here we're using function mtk_adsp_dump() from mtk-adsp-common:
explicitly import its namespace.

Fixes: 3a054f90e955 ("ASoC: SOF: mediatek: Add mt8195 debug dump")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 9c146015cd1b..ff575de7e46a 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -652,4 +652,5 @@ static struct platform_driver snd_sof_of_mt8195_driver = {
 module_platform_driver(snd_sof_of_mt8195_driver);
 
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
+MODULE_IMPORT_NS(SND_SOC_SOF_MTK_COMMON);
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.37.2

