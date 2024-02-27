Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63205868FD4
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 13:11:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4A49E8E;
	Tue, 27 Feb 2024 13:11:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4A49E8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709035904;
	bh=/pS8nnncjy2TDDWZ2CUchnxDIc/k7Kdx/uqwdwe7Xs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pk0liDq5H38bbfrLMN9+KSDQRdgvLJ33+7/9CXiwKKnhFRKmKHeAw/rDDOdRc6ALT
	 lgQdIDPcURWr81xRHMwfAEOFDetcdQvSSj2oI2fWIsbRXfLZYwLlHrdOqA9bK7x98p
	 tiBPtvxJFwBFBCrqeDn7mMErgOcOZLLIm0KvFSVQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94528F8060D; Tue, 27 Feb 2024 13:10:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 948D0F80619;
	Tue, 27 Feb 2024 13:10:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56E22F805B0; Tue, 27 Feb 2024 13:10:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1CACF8024C
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 13:10:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1CACF8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=kcmZurdL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709035819;
	bh=/pS8nnncjy2TDDWZ2CUchnxDIc/k7Kdx/uqwdwe7Xs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kcmZurdLnb4NEeZOVMoPq/n8gPZAqhxwuwBD8VPzFg0oWVwIufkSxFD6aQ0pyHAJd
	 fj7YijGOi8P2qG+qlY9fyK94FRrqQFD0RPcuwlnLiSCrS66q/47ZUSwqNFeenUR5S7
	 I0KxZUODXTW7uGFiIbMBVF5Woz/A6rICBd8j0SFSccC0fbyNGOrRx5+Ooh9iMtYdjx
	 QYP0SETzpxQ8ipsxKTutuSjHhtcGpiD9ts/N2Fo31fHlWAuYWa4GSoPF5jLBzZtcz4
	 TMWWK3d8pHRZKm8LrXg8A8R1fhU6VT7FXDXtd1RmQ01ft2/iXm3easJHEPZcl+VkAk
	 lB6qzluGyiNpA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 00F2A37820D0;
	Tue, 27 Feb 2024 12:10:16 +0000 (UTC)
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
Subject: [PATCH 04/22] ASoC: mediatek: Assign dummy when codec not specified
 for a DAI link
Date: Tue, 27 Feb 2024 13:09:21 +0100
Message-ID: <20240227120939.290143-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I3FZMGVRERZIDSQTXFNDELZM4VEYT7JQ
X-Message-ID-Hash: I3FZMGVRERZIDSQTXFNDELZM4VEYT7JQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3FZMGVRERZIDSQTXFNDELZM4VEYT7JQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

MediaTek sound card drivers are checking whether a DAI link is present
and used on a board to assign the correct parameters and this is done
by checking the codec DAI names at probe time.

If no real codec is present, assign the dummy codec to the DAI link
to avoid NULL pointer during string comparison.

Fixes: 4302187d955f ("ASoC: mediatek: common: add soundcard driver common code")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/common/mtk-soundcard-driver.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index a58e1e3674de..000a086a8cf4 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -22,7 +22,11 @@ static int set_card_codec_info(struct snd_soc_card *card,
 
 	codec_node = of_get_child_by_name(sub_node, "codec");
 	if (!codec_node) {
-		dev_dbg(dev, "%s no specified codec\n", dai_link->name);
+		dev_dbg(dev, "%s no specified codec: setting dummy.\n", dai_link->name);
+
+		dai_link->codecs = &snd_soc_dummy_dlc;
+		dai_link->num_codecs = 1;
+		dai_link->dynamic = 1;
 		return 0;
 	}
 
-- 
2.44.0

