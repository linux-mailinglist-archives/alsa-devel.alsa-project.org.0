Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F7B6BAFA7
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 12:51:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCE0F12E5;
	Wed, 15 Mar 2023 12:50:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCE0F12E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678881063;
	bh=5Zzzs7FfOtZW+ynIwOaVRwAIQvaEGBJ4NbUf6xSm98M=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=CMLX4lr9PZBGkox54TgZJvYmGalSQpdK7eYFNZHEmQz0PxlUtAot2a8bx8GJo4usc
	 WpKis9g5TCgv/Ul7ZJMs2JsiVaAEz5LzVaqzzyEtdVm2qm11bVgXjIgnKdouzMx9Tb
	 8iuJRR0PpmWC/F3Q2zDNc7pPR049mCy1MnurRZOo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6296F80557;
	Wed, 15 Mar 2023 12:48:39 +0100 (CET)
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>
Subject: [PATCH 05/11] ASoC: dt-bindings: rockchip: i2s-tdm: Document audio
 graph port
Date: Wed, 15 Mar 2023 13:48:00 +0200
In-Reply-To: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VN5NYY6V7N7SMYDB2A4NG7ROZYIENCEK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167888091863.26.3184835875687129903@mailman-core.alsa-project.org>
From: Cristian Ciocaltea via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9057BF8053D; Wed, 15 Mar 2023 12:48:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42C65F80527
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 12:48:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42C65F80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=M9RJ6PAc
Received: from localhost (unknown [188.24.156.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 31F936603097;
	Wed, 15 Mar 2023 11:48:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678880907;
	bh=WmlYIXlwpuzhwVps27jROqCbyY1XeyxnNcY6/AOT2zA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M9RJ6PAceWIS/F096ZRjHDj6oq/zdzauVQqUYqZFKTB41xuqK+bIYLQCdzTH7R6vj
	 EpRExyRFTXNKOIejNh0gMkOrd6TXyIGI3nrGofgMH4W6sdkyO7APNWQPnc5/cNsaA7
	 G86qX2OLQOv2jgP/mjvNUOg1a87Dd/fJXDazjiZLpvt4Gt4l7WKY/eUrvHAykmFDGi
	 fhUhlaqtnz7kT/OnyzLZvesOhgPIoG4l/T7TsCmX/oIRv/Qc5HTqPxkfAiXiTL0DOo
	 zrPAIVTNOTAP3oaZPO1vDSO36JpG19cT+BlQg7MLvsWyAvAGDx/RfTBPXHSSyQHsYH
	 WnhWObIAbXJsw==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>
Subject: [PATCH 05/11] ASoC: dt-bindings: rockchip: i2s-tdm: Document audio
 graph port
Date: Wed, 15 Mar 2023 13:48:00 +0200
Message-Id: <20230315114806.3819515-6-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VN5NYY6V7N7SMYDB2A4NG7ROZYIENCEK
X-Message-ID-Hash: VN5NYY6V7N7SMYDB2A4NG7ROZYIENCEK
X-MailFrom: cristian.ciocaltea@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VN5NYY6V7N7SMYDB2A4NG7ROZYIENCEK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document the 'port' property to allow the Rockchip I2S TDM controller to
be used in conjunction with the audio-graph-card.

The property will be used to provide an endpoint for binding to the
other side of the audio link.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
index 4c95895de75e..7d2c2991c566 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
@@ -86,6 +86,10 @@ properties:
         - tx-m
         - rx-m
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-- 
2.39.1

