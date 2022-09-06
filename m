Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C70525AE42B
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 11:29:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60461E11;
	Tue,  6 Sep 2022 11:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60461E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662456554;
	bh=vXQl6sWYH3s9nZcdEQtm9bzb3mf6vHvob18mX522u5Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QI1SOrlhXDJ4I/wmzSydKi1Mk5Q7aHqiPvxD924Xd8Foca3MeYI+t+Db/n51aGXBg
	 XDy3weBCTCCxRmeQXU2GFjvNBzuCtaJkmvQ9GkjDX2Q+Z9HR6096Evid8wH3BPvkKz
	 G/mfIXsfhPZf8vFAqiy3GiBIYZC8uz0RpjQDdKhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1FBFF8019B;
	Tue,  6 Sep 2022 11:27:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A31EF8019B; Tue,  6 Sep 2022 11:27:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09F32F8019B;
 Tue,  6 Sep 2022 11:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09F32F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="gaP7CzHI"
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 68B55660037F;
 Tue,  6 Sep 2022 10:27:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662456458;
 bh=vXQl6sWYH3s9nZcdEQtm9bzb3mf6vHvob18mX522u5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gaP7CzHIWz3oofHqZpF1nJ/2SBzJ0tEF/o0JbZuWbZzz0jtYTgk1OjQ9MhHoPbYte
 +InfDwR1jByO1iziZY8SbfOS2imRGasoF9EQVvm5lxVaaVdciPurOQ9vV7njksGjgZ
 Ms628sECmg3Lk39rxRRyEMz98uT8B/xAtkNukUqWKmCOhFn6HaqVmmlfIfOr6zmUBa
 y9BZ6HipY9RZyh1ADzEmgq5bFBl0Q/ZD1EwwkufgDQV0JtHsAGDu3OfBVC1/0PkChw
 VjXWrMQauz4mC7iw6B+VCQUvq9nSWNNrJz5SGheCGz0if30q5Fj6NrbRTWIf28rLmK
 Jhcg30Re66o5g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Subject: [PATCH 1/5] ASoC: mediatek: mt8195-mt6359: Properly register sound
 card for SOF
Date: Tue,  6 Sep 2022 11:27:23 +0200
Message-Id: <20220906092727.37324-2-angelogioacchino.delregno@collabora.com>
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

Adding a probe callback on this snd_soc_card is required when
Sound Open Firmware support is desired, as we need to appropriately
populate the stream_name for SOF to be able to bind widgets.
Failing to do so will produce errors when applying the SOF topology
leading to card registration failure (so, no sound).
While at it, also make sure to fill the topology_shortname as required.

Fixes: 0caf1120c583 ("ASoC: mediatek: mt8195: extract SOF common code")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index c530e3fc27e4..961e769602d6 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1383,7 +1383,13 @@ static int mt8195_mt6359_dev_probe(struct platform_device *pdev)
 		sof_priv->num_streams = ARRAY_SIZE(g_sof_conn_streams);
 		sof_priv->sof_dai_link_fixup = mt8195_dai_link_fixup;
 		soc_card_data->sof_priv = sof_priv;
+		card->probe = mtk_sof_card_probe;
 		card->late_probe = mtk_sof_card_late_probe;
+		if (!card->topology_shortname_created) {
+			snprintf(card->topology_shortname, 32, "sof-%s", card->name);
+			card->topology_shortname_created = true;
+		}
+		card->name = card->topology_shortname;
 		sof_on = 1;
 	}
 
-- 
2.37.2

