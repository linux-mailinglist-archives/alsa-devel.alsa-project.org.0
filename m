Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 230525ECC75
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 20:55:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1AD382A;
	Tue, 27 Sep 2022 20:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1AD382A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664304916;
	bh=HQn6AJCOGY9iUnz2rjzNgpjVb78Rd4R1764ccE39xP8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aHYfBhOuPOt+IPvNLdo/8+ttLzFYxLldIEMMGWwWpBAKpcPRvKJ3mKRKPyiy+GjTC
	 xWweiDBP5B1Otm1S1DPNa9TjSgY/2k4YfOjOcwp3g08kDj+ZMsL6WmWfoAPCymwpuO
	 DmZHEbTpmQvhlCWn1XoFMm3KHyfM+QPIeQ2JNOrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3556AF80496;
	Tue, 27 Sep 2022 20:54:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3E56F8025E; Tue, 27 Sep 2022 20:54:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3379EF80166
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 20:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3379EF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="cr+DCfdj"
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E56E380548;
 Tue, 27 Sep 2022 20:54:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664304852;
 bh=r72X1gQ8iyScTz13BxDWYPZsve0RS4joMPFJhECXWJM=;
 h=From:To:Cc:Subject:Date:From;
 b=cr+DCfdjNyWDnWemz2WGC6N7GywwAeV3piVQ97gphRdR8T7VDxoFjeoyOb59lzFu7
 HI9JmPcWXQ2qBUYaEsFiZJa4uc3UF/mpfozxC6Ns/6Li9S+7T0M12F9F+Ddhj0XW6h
 UyBlqS4mqXeyF/0xiO1rXbz3SCVUhjWbyc2xg0asqdDjn0o7wOzFRtQ6jWLUTtuHUq
 p7Z6ZlCiBzC7Yics+dvyJmcWBFpNLY4NQzHWo8ynfeRb9dOgKr6g/uIMUZjgojpmEa
 PyD1JpkynU/MZaeD6LmzbjllEppDkvuMYCl2pIJ1/VYIWbVZyQyVOxJKrpwgFr9ErK
 Mj4QQlE80Y1ow==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] ASoC: dt-bindings: Document audio OF graph
 dai-tdm-slot-num dai-tdm-slot-width props
Date: Tue, 27 Sep 2022 20:53:59 +0200
Message-Id: <20220927185359.294322-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Document dai-tdm-slot-num and dai-tdm-slot-width props as those are
parsed by simple graph card and may therefore appear in audio OF graph
node.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: alsa-devel@alsa-project.org
To: linux-arm-kernel@lists.infradead.org
---
V2: Drop the definition refs and just fill in type and description
---
 .../devicetree/bindings/sound/audio-graph-port.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index bc46a95ed8400..64654ceef2089 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -74,6 +74,12 @@ patternProperties:
       convert-sample-format:
         $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-format"
 
+      dai-tdm-slot-num:
+        description: Number of slots in use.
+        $ref: /schemas/types.yaml#/definitions/uint32
+      dai-tdm-slot-width:
+        description: Width in bits for each slot.
+        $ref: /schemas/types.yaml#/definitions/uint32
       dai-tdm-slot-width-map:
         description: Mapping of sample widths to slot widths. For hardware
           that cannot support a fixed slot width or a slot width always
-- 
2.35.1

