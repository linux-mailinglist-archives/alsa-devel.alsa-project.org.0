Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BFD8A64E4
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 09:20:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EFE0210C;
	Tue, 16 Apr 2024 09:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EFE0210C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713252023;
	bh=SRSwRgJbTBz/3750pVOWh9FKrFSoG2LU80QaUy5HTjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IR6io9w8fpTrRr+/Vk0Ufr+8+ptVHQoXHTYqk8rT0owh/swn7IVl+oVGFe2ecQcEh
	 Hb6ihNEIEwrDu7kd4YX1SVKWL4QE1tsBkla58drvrYX1yePIfnZfTAIdsbv8gv6fre
	 l9OxAoVUrwdeGsl3MBCbed2Nj6NBQ7Su3e/4l6x0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EC20F80C41; Tue, 16 Apr 2024 09:16:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C66D4F80C15;
	Tue, 16 Apr 2024 09:16:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F4AAF80496; Tue, 16 Apr 2024 09:15:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9E6EF8057E
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 09:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9E6EF8057E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=sAcjfMHW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713251701;
	bh=SRSwRgJbTBz/3750pVOWh9FKrFSoG2LU80QaUy5HTjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sAcjfMHWFXTPGeF/nm7OoyhAE4ooMwh1w5xzheHOVXvkUW4AFdfUJg8V/mmPbI+9D
	 Ji/S2alaDeOTs0wan2CUJQgS1eHyP8NEEfJIsxJqNXHmxmvWzsKEI3TyxX9WbMzUwD
	 yKepQZRko8plHDOSZIpzZP0ymKQ6ji9sbe6SZVUA5Ge/RxS/UdcQiYdd0ljr0DvXxq
	 6sJvGBCYYikzv4EyboGrj4oxRpXYYKEIjB9ZNKtVqBWVTtNgaVIda1eHs4OVt/qfKa
	 cAX3a2OUF4R70gUw4jtJ6P+ynNosiF8LwqyyEldPqfWDWx1Y9FxOXxfmdtGLQ7dVyI
	 KZeaRXxalpRvg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 30B26378213E;
	Tue, 16 Apr 2024 07:14:59 +0000 (UTC)
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
Subject: [PATCH v5 18/18] arm64: dts: mediatek: mt8186-corsola: Specify sound
 DAI links and routing
Date: Tue, 16 Apr 2024 09:14:10 +0200
Message-ID: <20240416071410.75620-19-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
References: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BNGQQR42QXZC6F2TXAHQOJYBT5W5I6SM
X-Message-ID-Hash: BNGQQR42QXZC6F2TXAHQOJYBT5W5I6SM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNGQQR42QXZC6F2TXAHQOJYBT5W5I6SM/>
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
index 1807e9d6cb0e..afdab5724eaa 100644
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

