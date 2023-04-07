Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6786DB110
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Apr 2023 19:01:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F078DED1;
	Fri,  7 Apr 2023 19:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F078DED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680886904;
	bh=5pjuGcBc3CjW0GPZxxx5xx1+FEXHzkRcUklMJL35Oxk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WmQMLdQ3TxYaq0TrjM9CWemxgYTssQfgasqTEFVNYHfMLY8p3t5m9IjD9SWyrjl3f
	 AiCnw61DXUPhu4VdiqDJnszI7/jSzr5UEXwqY0+oCX/JzidcRlFtqcK37xKIxKJnPE
	 Cc7Hcyz4eIva2iawqLKE0wxFGMYUdUjF9PVjnPNs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BEA2F8015B;
	Fri,  7 Apr 2023 19:00:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66EB1F8026A; Fri,  7 Apr 2023 19:00:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B136F8015B
	for <alsa-devel@alsa-project.org>; Fri,  7 Apr 2023 19:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B136F8015B
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 242F6650B5;
	Fri,  7 Apr 2023 17:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DE7C433EF;
	Fri,  7 Apr 2023 17:00:35 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Saalim Quadri <danascape@gmail.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: asahi-kasei,ak4458: fix missing quotes
 around hash
Date: Fri,  7 Apr 2023 19:00:32 +0200
Message-Id: <20230407170032.102412-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FPWFCJ5R3YQPGL2K6PRBS524KWV4AWAX
X-Message-ID-Hash: FPWFCJ5R3YQPGL2K6PRBS524KWV4AWAX
X-MailFrom: SRS0=hRHz=76=linaro.org=krzysztof.kozlowski@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPWFCJ5R3YQPGL2K6PRBS524KWV4AWAX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The yamllint expect comments to start with hash and space ('# '), so
quote the description to fix:

  asahi-kasei,ak4458.yaml:40:30: [error] missing starting space in comment (comments)

Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/all/CAL_JsqJzxQb1g=yVgHduLnYOpk8-Q3jppA1qQT1Ce51_gNWjhg@mail.gmail.com/
Fixes: 009e83b591dd ("ASoC: dt-bindings: ak4458: Convert to dtschema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/asahi-kasei,ak4458.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
index 0db0c8e923a0..4477f84b7acc 100644
--- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
@@ -37,9 +37,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     oneOf:
       - const: 0
-        description: select #16, #17, #19 pins
+        description: "select #16, #17, #19 pins"
       - const: 1
-        description: select #3, #4, #5 pins
+        description: "select #3, #4, #5 pins"
 
 required:
   - compatible
-- 
2.34.1

