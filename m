Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 241D4724AB9
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 20:01:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F57D74C;
	Tue,  6 Jun 2023 20:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F57D74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686074471;
	bh=vvoos0Vm8C75AL0lJpxSF+zp3pSVJ2QhBidNLr1gifQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vWGxEkb8saULur/8UTh7I1/1JTtOSayuEDx69u9cvAYDTf+ax2VWvIJVG9e5VegxG
	 YK8AVuOC96LcwjLfrtE9VuMBJD6F85vudBlRiQj14aLS7ma5nyfPb69fwuhcBx7Hmj
	 5fXPr0kASyEgFJPinlNs0PERlun3r323QX0bTLx4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEFB4F80254; Tue,  6 Jun 2023 20:00:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7353DF8016C;
	Tue,  6 Jun 2023 20:00:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53218F80199; Tue,  6 Jun 2023 20:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1119F800C8
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 20:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1119F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=H12XuWtK
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 66DB185BC7;
	Tue,  6 Jun 2023 20:00:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1686074405;
	bh=F5ZNqjEs3oTfsrAMdqCV2n+Sc4o/8z8mTGUPDw5VqgU=;
	h=From:To:Cc:Subject:Date:From;
	b=H12XuWtKt+LOY+ZzWB7JyHe/yLSRGfungMIQF/RrGyTGtj2w8RVnkwt+C0IDb9i/A
	 2phvVb/YqRQWQENBNGZTtrfngwJYwrxCfgIzZiKnpL6LZ6vKwg+KGsG6Si0IVEaf3O
	 +kpK7QEBuo01zHcOSZGLeqnaIrpT64mCTQJmk/Tr986+TRm5YZ71hRnb24KCdT5+AS
	 gw/BVGJFj0WdvH4/qz24q9m4HxiqRmNDy1cNEqaE5VWmZeOAv7/XF7xk/HVfrfgeNt
	 GcZQt9iw12yY8S7BMyP8NJW87uxxgKKi8WLmNYRL0qkroXKJDuLA3jmC2F+AxnIln5
	 wPgyArGVR9Xyg==
From: Marek Vasut <marex@denx.de>
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: dt-bindings: audio-graph-card: Expand 'widgets'
 documentation
Date: Tue,  6 Jun 2023 19:59:51 +0200
Message-Id: <20230606175951.215740-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Message-ID-Hash: 47U6JWFZBSEPTQQFY2JCU5Z36LOA6ZZD
X-Message-ID-Hash: 47U6JWFZBSEPTQQFY2JCU5Z36LOA6ZZD
X-MailFrom: marex@denx.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/47U6JWFZBSEPTQQFY2JCU5Z36LOA6ZZD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document the encoding of 'widgets' property to avoid confusion.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/sound/audio-graph.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
index c87eb91de1593..ed31e04ff6a68 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
@@ -24,7 +24,11 @@ properties:
       connection's sink, the second being the connection's source.
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
   widgets:
-    description: User specified audio sound widgets.
+    description: |
+      User specified audio sound widgets.
+      Each entry is a pair of strings, the first being the type of
+      widget ("Microphone", "Line", "Headphone", "Speaker"), the
+      second being the machine specific name for the widget.
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
   convert-rate:
     $ref: /schemas/sound/dai-params.yaml#/$defs/dai-sample-rate
-- 
2.39.2

