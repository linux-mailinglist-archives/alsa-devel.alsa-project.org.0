Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1C45AE443
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 11:30:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 897CD163D;
	Tue,  6 Sep 2022 11:29:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 897CD163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662456641;
	bh=q/pjRlc+P1EXAov84vHYYZkyXsNxDJtdjpHTIHnbw+w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HHYwIvZxcdVBailGTPss4CFCEN65qkBAXQnRPmVAj+bjjado2mCyxELG/t8tZr3SL
	 OsjUmdwZc4nzfkwXwaLgBqYS3TzPKfYWJjm6DS3UtyTjYZzWrs0ACzpuVU4KHX8ugq
	 H08d4QdfvaGABsLWoKVapZtcSp+sdtXN/dHpMrzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B177F80587;
	Tue,  6 Sep 2022 11:28:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD02AF8057D; Tue,  6 Sep 2022 11:27:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76644F8011C;
 Tue,  6 Sep 2022 11:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76644F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="X7j7JJNo"
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A36D6601F39;
 Tue,  6 Sep 2022 10:27:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662456463;
 bh=q/pjRlc+P1EXAov84vHYYZkyXsNxDJtdjpHTIHnbw+w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X7j7JJNoV/4qGA8hHzxbjp29Roe1pEwLywRePOz7quQpuSF3ELkhNFcFELz4usSLR
 ma9qGN9glh2aoynYH44mhPSEr5MX4SB38P5Dzu2KhkvV3PP1Sled5nHEjvl3+4dkAN
 S9d7FBvig4OAydOT3pxG5AipzTqt471gt8hspnXlkaKtFjh3mjSZIpKfU8/Q1XMiLJ
 BNs79djZuVQXHT1FJUSqlU6zKaC9YGJqfwc3pQzc68D7EMRIpjOsLPm+zp3vXLg2LE
 ZublxmPgPhgumD9twr6pXezF0Albz7sAyU/WPAmyuNYyuck3VVOfxwZ7L/O3c5gJ52
 SU+2RwqRrJA7w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Subject: [PATCH 5/5] ASoC: SOF: mediatek: mt8195: Add devicetree support to
 select topologies
Date: Tue,  6 Sep 2022 11:27:27 +0200
Message-Id: <20220906092727.37324-6-angelogioacchino.delregno@collabora.com>
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

Support devicetree by adding a snd_soc_of_mach array, specifying SOF
topologies for a generic MT8195 machine and for Google Tomato
Chromebooks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index c1590e78edd4..8e359c296308 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -615,7 +615,20 @@ static struct snd_sof_dsp_ops sof_mt8195_ops = {
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 };
 
+static struct snd_sof_of_mach sof_mt8195_machs[] = {
+	{
+		.compatible = "google,tomato",
+		.sof_tplg_filename = "sof-mt8195-mt6359-rt1019-rt5682-dts.tplg"
+	}, {
+		.compatible = "mediatek,mt8195",
+		.sof_tplg_filename = "sof-mt8195.tplg"
+	}, {
+		/* sentinel */
+	}
+};
+
 static const struct sof_dev_desc sof_of_mt8195_desc = {
+	.of_machines = sof_mt8195_machs,
 	.ipc_supported_mask	= BIT(SOF_IPC),
 	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
-- 
2.37.2

