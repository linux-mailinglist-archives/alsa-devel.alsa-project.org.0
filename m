Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FA6869011
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 13:17:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DE1E14F2;
	Tue, 27 Feb 2024 13:16:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DE1E14F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709036226;
	bh=8bxWkdHWjuivwKz8TBybuK02NLszyCe4cZF3c/Vh6Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g+3lKUeS6Yhj7Knbqy2CcTlSzrpvX5TBfb+r26Ek2bv3rgL1mz0WrW7t8hNQ7XXZB
	 6KxuSpMRur1PIs7ozPDDA1Cq6c9ByJZcPlQkKqHjDUyJtwTG4ZxTqgNKNjmdeX1kHs
	 4fmBzlDgsQdtsJ9elDOZNXaiRwux8zC97QYpeIIg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1725FF89721; Tue, 27 Feb 2024 13:11:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A992F805EC;
	Tue, 27 Feb 2024 13:11:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA27AF896F6; Tue, 27 Feb 2024 13:11:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84BCCF8087C
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 13:11:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84BCCF8087C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=UbZhegny
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709035864;
	bh=8bxWkdHWjuivwKz8TBybuK02NLszyCe4cZF3c/Vh6Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UbZhegny3dX5c5Ge2uf8Vf0e4f5bvOx9G2h0WeuWNKBmlSmVZVJ4pSer12jNuDAgl
	 XLGCdiHd5iIgtvrCebyFu9KAwn93c7avtXOxTOoXDDm+QGKtf78g0Tmr7+qf9YDBTZ
	 WNcMQ5QlycAGFk3qX+VPdvxvOEvaS7GKC1QqBXikVtWwDBnuTi6IHOiqEmzS/qK5A7
	 YZCxu2h1AuTGBMdZrrfTCkrbdQHR2rnwLiJ2dtwrzHd+k0E++sOWc2DqSFjleIt1f+
	 2kWgp4GRvH2dh/X+5niD+4XmJGqYERLi1TyOUQ/oU8s3Y+cAN+g2QMyWYjpbltqeYW
	 gRBO63LnWu6AQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 195D837820EF;
	Tue, 27 Feb 2024 12:11:02 +0000 (UTC)
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
Subject: [PATCH 22/22] arm64: dts: mediatek: mt8186-corsola: Specify sound DAI
 links and routing
Date: Tue, 27 Feb 2024 13:09:39 +0100
Message-ID: <20240227120939.290143-23-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U7LHLJCVMTJFS4IW5GCL4EVKRDQOBF5E
X-Message-ID-Hash: U7LHLJCVMTJFS4IW5GCL4EVKRDQOBF5E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7LHLJCVMTJFS4IW5GCL4EVKRDQOBF5E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The drivers and bindings acquired support for specifying audio hardware
and links in device tree: describe and link the sound related HW of this
machine.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8186-corsola.dtsi     | 42 ++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index 3dea28f1d806..0bdb83c3e560 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -42,7 +42,7 @@ backlight_lcd0: backlight-lcd0 {
 		default-brightness-level = <576>;
 	};
 
-	bt-sco-codec {
+	bt-sco {
 		compatible = "linux,bt-sco";
 		#sound-dai-cells = <0>;
 	};
@@ -223,12 +223,44 @@ sound: sound {
 		mediatek,adsp = <&adsp>;
 		mediatek,platform = <&afe>;
 
-		playback-codecs {
-			sound-dai = <&it6505dptx>, <&rt1019p>;
+		audio-routing =
+			"Headphone", "HPOL",
+			"Headphone", "HPOR",
+			"IN1P", "Headset Mic",
+			"Speakers", "Speaker",
+			"HDMI1", "TX";
+
+		hs-playback-dai-link {
+			link-name = "I2S0";
+			dai-format = "i2s";
+			mediatek,clk-provider = "cpu";
+			codec {
+				sound-dai = <&rt5682s 0>;
+			};
+		};
+
+		hs-capture-dai-link {
+			link-name = "I2S1";
+			dai-format = "i2s";
+			mediatek,clk-provider = "cpu";
+			codec {
+				sound-dai = <&rt5682s 0>;
+			};
 		};
 
-		headset-codec {
-			sound-dai = <&rt5682s 0>;
+		spk-share-dai-link {
+			link-name = "I2S2";
+			mediatek,clk-provider = "cpu";
+		};
+
+		spk-hdmi-playback-dai-link {
+			link-name = "I2S3";
+			dai-format = "i2s";
+			mediatek,clk-provider = "cpu";
+			/* RT1019P and IT6505 connected to the same I2S line */
+			codec {
+				sound-dai = <&it6505dptx>, <&rt1019p>;
+			};
 		};
 	};
 
-- 
2.44.0

