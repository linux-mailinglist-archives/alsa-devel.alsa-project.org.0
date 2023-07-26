Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFD2763A85
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 17:12:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73F95E75;
	Wed, 26 Jul 2023 17:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73F95E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690384323;
	bh=T6p9VtDwK8167e9dyZCiy9B1REQlIna4UB8eih9akJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T1hoWlCknQjaqU0nmRgirWZqoDlwD4inS3mbpRkIpCYoGGDvT80Xl/vIlAwviNZOX
	 kgTUXmdPrwDQzOHEzI4XcPva1WlBTTVAwQX9GH236HTjqFJIU8iwP21xOzxdimNm+p
	 02e07KIn0KdvQGS2sWn2z+wZQMjtAsP0XpOJNMRE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9566AF805AF; Wed, 26 Jul 2023 17:04:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3958FF80570;
	Wed, 26 Jul 2023 17:04:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18D2DF806A2; Wed, 26 Jul 2023 17:04:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA827F80659
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 17:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA827F80659
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VDJFTfsl
Received: by mail.gandi.net (Postfix) with ESMTPA id 480361C0008;
	Wed, 26 Jul 2023 15:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690383856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/7VRBWCE3zQkjZUnwqNM+hf1oXBkNM8jqaefsT3cImE=;
	b=VDJFTfslBhM2nEBN2krY5yuVwQ57ITkjy49bePw0G/vUAySjFFFSODJmXjyc8WgsHYxDUV
	yKyv5zavc5TfUk7zyy/R6xPyJs3yjGgqKDPq/l6u79zljmSq7gSeY34yxPEewido5vbTbc
	hmGtsQpR4QSIBiOPJ+cDkUZ/rGO66jVKqa3l0gajvDgwWEh41jfoPHZOf/uOhYQNfcQCnt
	fyOzi0dizFQgwnSufUVSbz4P8izRFttN9KDckFAZH/VUL/S+cvW6nahdNSXNIYloYJ7i2P
	to//NoUd3WvlqBZkelmr5GZW506i/Pz7TBngjE0DMKndauYkU0mP2kObKvMp7w==
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
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 27/28] dt-bindings: net: fsl,qmc-hdlc: Add framer support
Date: Wed, 26 Jul 2023 17:02:23 +0200
Message-ID: <20230726150225.483464-28-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726150225.483464-1-herve.codina@bootlin.com>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: PDH342FXNBS44KD555FOEEYMTOM4YXTW
X-Message-ID-Hash: PDH342FXNBS44KD555FOEEYMTOM4YXTW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PDH342FXNBS44KD555FOEEYMTOM4YXTW/>
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

