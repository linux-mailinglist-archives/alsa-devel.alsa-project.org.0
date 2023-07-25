Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DE3760F39
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 11:31:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EBFD1554;
	Tue, 25 Jul 2023 11:31:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EBFD1554
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690277518;
	bh=T6p9VtDwK8167e9dyZCiy9B1REQlIna4UB8eih9akJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bm1cLwLBMN501DkthEm2wigdK7/jdXxTtbjW9WNRSaVeYra3MqbOrPI/589SQ5wug
	 AFEqSy4kSCRGErMhGtThSPWde06KBlAI+G4vwKm7tZEFPt/ACUZbShIg4uE75tJl4b
	 dSMSJ94BTTklkVdWpHo3cMPxK8JNj3Wm2F933qyE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE79CF8067D; Tue, 25 Jul 2023 11:26:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1E49F8067E;
	Tue, 25 Jul 2023 11:26:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6866BF8065E; Tue, 25 Jul 2023 11:26:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AB60F80153
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 11:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AB60F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Gt6FasdC
Received: by mail.gandi.net (Postfix) with ESMTPA id 2A26440006;
	Tue, 25 Jul 2023 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690277163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/7VRBWCE3zQkjZUnwqNM+hf1oXBkNM8jqaefsT3cImE=;
	b=Gt6FasdCK1y9iOK5dlqpx1KvrhbGV7fd8/BtCu7DUhiXguTHlWVJajWZUzkbe/jOYIW+a1
	EQkV5yuPW79QZHp8XY365fScCFPV5cK+ajMI5ZE5DvaSehrCEDatuOIdv5acuv8pssFGMl
	X0GwsbiYiJU2UZV0CRKtGb3225UrU7JaZK/z37kgW3UGJnmmkxejDlDOOJLi2eQzvkztyf
	eo1C+2uTw+RCYxm5OeXfSoiYJJZNRr19fF1DxyC1GaWdg2UOCzImA2XLgkF5jURzOJzk8p
	MxA//vOLiETfZ4DDUx7tl6m+MWpD6YNB3H7YLpwFzlS+Nw1DHjW3wqL/wn6xCg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 25/26] dt-bindings: net: fsl,qmc-hdlc: Add framer support
Date: Tue, 25 Jul 2023 11:24:01 +0200
Message-ID: <20230725092417.43706-26-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725092417.43706-1-herve.codina@bootlin.com>
References: <20230725092417.43706-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: SIZVPRKZLUR2ADL523XJMOVWGDVIZI34
X-Message-ID-Hash: SIZVPRKZLUR2ADL523XJMOVWGDVIZI34
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIZVPRKZLUR2ADL523XJMOVWGDVIZI34/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A framer can be connected to the QMC HDLC.
If present, this framer is the interface between the TDM used by the QMC
HDLC and the E1/T1 line.
The QMC HDLC can use this framer to get information about the line and
configure the line.

Add an optional framer property to reference the framer itself.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
index 8bb6f34602d9..bf29863ab419 100644
--- a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
+++ b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
@@ -27,6 +27,11 @@ properties:
       Should be a phandle/number pair. The phandle to QMC node and the QMC
       channel to use.
 
+  framer:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the framer node
+
 required:
   - compatible
   - fsl,qmc-chan
-- 
2.41.0

