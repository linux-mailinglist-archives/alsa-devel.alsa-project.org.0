Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAD68A64CD
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 09:18:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12AF914FD;
	Tue, 16 Apr 2024 09:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12AF914FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713251904;
	bh=ZihqOvAsqLa0MvqNqKVldLZPj/NVl1J4njOx31ufWsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lZcAEPFqlBuE5OOcJK2A61d+oTeyWlUllAx56ehHrtFNzcUq+lWDPNe4QPbqP3LiD
	 dyDSdXb3GMKH2wYiqA2JwxiktncYZprwcYbj0GgWeNO+5QRuWkZt2eXhm9gVG3phJS
	 QczBS7Dc3/Wswnsz7NFqAzXSc+kr61My6vJFHwyk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7650BF80713; Tue, 16 Apr 2024 09:16:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99E21F806DB;
	Tue, 16 Apr 2024 09:16:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17712F8003A; Tue, 16 Apr 2024 09:14:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23C3DF80568
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 09:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23C3DF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Rq4HZUZ3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713251684;
	bh=ZihqOvAsqLa0MvqNqKVldLZPj/NVl1J4njOx31ufWsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rq4HZUZ3E3NWylxpfqb3YWQ7uGToD4AoQLEpIj4QzP5CXUZnSVMksgV1kN6+p7hBU
	 7VBzx5dPCVVWSbuu0NiJ5GN3VWZppUrgskfOZLuej4mFvpl54zE7BSTcY4DyuxkJ3u
	 tWg/HybegIjqli+sTup6etrGwZHiAhPYZ2gf1BGvgeJyNKMf3cHzcf/nQV3fszJKG0
	 +fC/tDbJK9sA8Ziz3l/da3HsXG9V85WnIQXfMPNKhsCrWeSR7G4J64S+4iJreCTsLA
	 t5ovTOct7L+KbYRm25nKoBh/gk2ndsrfffhEdAOB6KYtZ+s5tnM3/p3IwGQ3bDd48S
	 cBZHDv6OPJscQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8E96A3782123;
	Tue, 16 Apr 2024 07:14:42 +0000 (UTC)
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
Subject: [PATCH v5 11/18] ASoC: mediatek: Add common mtk_afe_component_probe
 callback
Date: Tue, 16 Apr 2024 09:14:03 +0200
Message-ID: <20240416071410.75620-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
References: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A6KBURLE262X6OLYNDLFFEERGJC4VN7I
X-Message-ID-Hash: A6KBURLE262X6OLYNDLFFEERGJC4VN7I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A6KBURLE262X6OLYNDLFFEERGJC4VN7I/>
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
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

