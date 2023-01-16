Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D17DE66C0C2
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 15:04:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3335556D4;
	Mon, 16 Jan 2023 15:03:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3335556D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673877859;
	bh=5tOmvaesfULeH1TrSOZPXIY3fM3dEnOedhw0AXIl7kI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=u24PPZ3gCw40T6O6WN7/kUy3+nJVqbw3XFjKV4LKh1K8k5BbL9HRqaA3pEJIkiY2W
	 aRaK4GYAbpnGQKvCHlTPhJZHQKlGob8e/lgi4A6y88WAj9GvK47zhl+DgH0hKReiyZ
	 1FY6Tp4Vf2vjcTPLN3gJdExweWnwR4NhAEbaxhZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6740F8023B;
	Mon, 16 Jan 2023 15:02:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47123F80543; Mon, 16 Jan 2023 15:02:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB31AF8053C
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 15:02:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB31AF8053C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QeLvOGaa
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA97160FCB;
 Mon, 16 Jan 2023 14:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E28C433EF;
 Mon, 16 Jan 2023 14:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673877746;
 bh=5tOmvaesfULeH1TrSOZPXIY3fM3dEnOedhw0AXIl7kI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QeLvOGaafFog9e3sfNve0LsCpWqyNfPjvI1HApjuk1bUnwg8fQ8JVxd/MsmfTQnkL
 e1+4KRWc73QuRxFs/zrhW0cuTFvNQgfKPlceTmUXc3edAJsF41/KkM/oprVxS68cPw
 K+hUDyImmKJS9fGe3LnrEeBPtxoMH/K4p9uXwa/S+UPKoZhOCD4INPfOQ0xnrxBvLd
 U0S/As8xDi8uT7D8IHlT6KXbEH94kFh8iX5bwtrk9/PAp9c3COAjF5CvSXQf2QrxfT
 8///tomZ5Dbtttyq/1dilQM9UoWlN3BLdFus0bOORnGAD7ozuBOYCoswUbn+8YAHAt
 bq4g3f2dVrYtQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 09/53] ASoC: mediatek: mt8186: support
 rt5682s_max98360
Date: Mon, 16 Jan 2023 09:01:09 -0500
Message-Id: <20230116140154.114951-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116140154.114951-1-sashal@kernel.org>
References: <20230116140154.114951-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 chunxu.li@mediatek.com, nfraprado@collabora.com,
 ajye_huang@compal.corp-partner.google.com, tiwai@suse.com,
 tongjian <tongjian@huaqin.corp-partner.google.com>, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 jiaxin.yu@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: tongjian <tongjian@huaqin.corp-partner.google.com>

[ Upstream commit 6e1dbf694d7cd1737ee14866e9e05016ccc9ac40 ]

Add support for using the rt5682s codec together with max98360a on
MT8186-MT6366-RT1019-RT5682S machines.

Signed-off-by: tongjian <tongjian@huaqin.corp-partner.google.com>
Link: https://lore.kernel.org/r/20221228122230.3818533-2-tongjian@huaqin.corp-partner.google.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 60fa55d0c91f..6babadb2e6fe 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -991,6 +991,21 @@ static struct snd_soc_card mt8186_mt6366_rt1019_rt5682s_soc_card = {
 	.num_configs = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_codec_conf),
 };
 
+static struct snd_soc_card mt8186_mt6366_rt5682s_max98360_soc_card = {
+	.name = "mt8186_rt5682s_max98360",
+	.owner = THIS_MODULE,
+	.dai_link = mt8186_mt6366_rt1019_rt5682s_dai_links,
+	.num_links = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_dai_links),
+	.controls = mt8186_mt6366_rt1019_rt5682s_controls,
+	.num_controls = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_controls),
+	.dapm_widgets = mt8186_mt6366_rt1019_rt5682s_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_widgets),
+	.dapm_routes = mt8186_mt6366_rt1019_rt5682s_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_routes),
+	.codec_conf = mt8186_mt6366_rt1019_rt5682s_codec_conf,
+	.num_configs = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_codec_conf),
+};
+
 static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
@@ -1132,9 +1147,14 @@ static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
 
 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id mt8186_mt6366_rt1019_rt5682s_dt_match[] = {
-	{	.compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound",
+	{
+		.compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound",
 		.data = &mt8186_mt6366_rt1019_rt5682s_soc_card,
 	},
+	{
+		.compatible = "mediatek,mt8186-mt6366-rt5682s-max98360-sound",
+		.data = &mt8186_mt6366_rt5682s_max98360_soc_card,
+	},
 	{}
 };
 #endif
-- 
2.35.1

