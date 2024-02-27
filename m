Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3148B868FFB
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 13:15:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DD03E76;
	Tue, 27 Feb 2024 13:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DD03E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709036109;
	bh=ClgWR4mgcTFs9Nig5y7IuRN0DOliEM0btt6YY0gL/ck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vYgnqhrYQ6731JyRt+o9g6I8ybzAZ3qpL/A731gv2jNLETMCu1wi33JpyNW+DaKHi
	 tZW6gdwU/eUxlW2FtR+10uK7hBLViZ3KcEtN/6fr5LMJtzSFSXK4hSNcXXk0xf2q4j
	 PI/ma0S0KTvMuE7JtS939RFSnXrH/oN31dMCHjLU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6853F80C25; Tue, 27 Feb 2024 13:11:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEFEDF80C58;
	Tue, 27 Feb 2024 13:11:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD366F805AD; Tue, 27 Feb 2024 13:10:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E55C4F805BE
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 13:10:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E55C4F805BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=PxKJrPqM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709035847;
	bh=ClgWR4mgcTFs9Nig5y7IuRN0DOliEM0btt6YY0gL/ck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PxKJrPqMOSSWdSburZpg2bjJQWDpQdvdb0zPTq4SLThj7h+vWlJmRKG3ZqxgDJ3To
	 rzoidfXTwGN6Nsj2E//vdwpWN5TZv7NXFmEqv51v1MsyMFXK/PJPNMZiK3nBUMUMoz
	 JAfe7nRPWSMkuFB5WJrl0vXux/lzadqsRJiV66gjADTLxvW5rE6lC3GwhjJhfxHU+m
	 2b9L94eEO2uczZ/oUOBbbsSMPJFMXGk2VaXHsF5f2MN14dYFYDrdjanDjhycazISyJ
	 /jzhUhpy3Cjq+vovD5YegSnyyGiVxpIDtFZWIpfMBdV+TZiHKqF8QDHMxJ+ttTumNk
	 sqNX9ZoYDKP4A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A88D437820E5;
	Tue, 27 Feb 2024 12:10:44 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: wenst@chromium.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com,
	arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com,
	shraash@google.com,
	amergnat@baylibre.com,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	dianders@chromium.org,
	frank.li@vivo.com,
	allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com,
	claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com,
	jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com,
	ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	shane.chien@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 15/22] ASoC: mediatek: Add common mtk_afe_component_probe
 callback
Date: Tue, 27 Feb 2024 13:09:32 +0100
Message-ID: <20240227120939.290143-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UZ3YUNFPT2VG7TLVVHZCGNILNBNQGWHA
X-Message-ID-Hash: UZ3YUNFPT2VG7TLVVHZCGNILNBNQGWHA
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UZ3YUNFPT2VG7TLVVHZCGNILNBNQGWHA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Multiple MediaTek AFE PCM component drivers are using their own .probe()
callback, but most of those are simply duplicated functions as they are
doing exactly the same thing over and over.

Add a common probe callback for this component to reduce duplication.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/common/mtk-afe-platform-driver.c  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 32edcb6d5219..9b72b2a7ae91 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -126,10 +126,28 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_new);
 
+static int mtk_afe_component_probe(struct snd_soc_component *component)
+{
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	snd_soc_component_init_regmap(component, afe->regmap);
+
+	/* If the list was never initialized there are no sub-DAIs */
+	if (afe->sub_dais.next && afe->sub_dais.prev) {
+		ret = mtk_afe_add_sub_dai_control(component);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 const struct snd_soc_component_driver mtk_afe_pcm_platform = {
 	.name		= AFE_PCM_NAME,
 	.pointer	= mtk_afe_pcm_pointer,
 	.pcm_construct	= mtk_afe_pcm_new,
+	.probe		= mtk_afe_component_probe,
 };
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_platform);
 
-- 
2.44.0

