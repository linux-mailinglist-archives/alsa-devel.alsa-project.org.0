Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E94AE479B6A
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Dec 2021 15:36:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 869671AC1;
	Sat, 18 Dec 2021 15:35:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 869671AC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639838184;
	bh=ZUBh3Htb2r03DB6YDVQeoewM3wSFna0ydu1x0Vr7Eas=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bd1RYjmOPED8c9yxZzWl0m4VKyyFS4bzxs4SwJfgBa3B4qo9Da7OjXfRIF8jLGpAN
	 se86N5FsuBfuMh/doGIOSI8MuzUU11kL+T3I4FZY4XRRqmRUNmG4h7QFU20FvL+FRP
	 ZbL0oUbs59o8SVMmewpc4pPgYKOw+uZBsiWGgVaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95272F8032D;
	Sat, 18 Dec 2021 15:34:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5193CF80311; Sat, 18 Dec 2021 15:34:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8629F80139
 for <alsa-devel@alsa-project.org>; Sat, 18 Dec 2021 15:34:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8629F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="CUpKVtUX"
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:4:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4JGSzd2Vc6zQl4q;
 Sat, 18 Dec 2021 15:34:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1639838075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXB+08+k7M9poCYOa2pdqxCM6ES+Bb3wI7MNLLV8K24=;
 b=CUpKVtUXP2RuOXvLx4vEDJu/i7f/IzhyDKNPtHxv/toXjyNDyFIuCrgueB0GTaiFFuGHf1
 vAZdzIh6dR/zfs2vsDaIEUliAHEvalQRRrJ3RhWdrxzkfw6xhp03NYHFiSVpfD8Ou1doXL
 9cs6ikjxTrNO4/MoWXkaSbyP+qxxVPo0ruJdNArHKMzJ823EM0sZTeDYE5+2IlZNfs5vVi
 ujekC6Q+TxTh5hO1rWQdJJGgVk0E1RVk6oVgCEsbgwmS+hVaEj8B9gWNUT8tX+X2La8Ga0
 XQFEPSQ5NxQj0EcTIhjM6x1W9sOk40iTMgKlYHYK81/ZI7vpme0jaJGqEaZB8g==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/3] ASoC: meson: g12a: add missing sound-name-prefix
 property
Date: Sat, 18 Dec 2021 15:34:23 +0100
Message-Id: <20211218143423.18768-3-alexander.stein@mailbox.org>
In-Reply-To: <20211218143423.18768-1-alexander.stein@mailbox.org>
References: <20211218143423.18768-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org
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

This is used in meson-sm1 and meson-g12 .dtsi. Add the property to
the binding.
This fixes the dtschema warning:
audio-controller@740: 'sound-name-prefix' does not match any of the
regexes: 'pinctrl-[0-9]+'

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
All users have set this to "TOACODEC", but I am not sure if this value is
mandatory, so I opted to not set a pattern for this property.

Changes in v2:
* Fix 'pass' -> 'true'

.../devicetree/bindings/sound/amlogic,g12a-toacodec.yaml     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
index 3c3891d17238..77469a45bb7a 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
@@ -9,6 +9,9 @@ title: Amlogic G12a Internal DAC Control Glue
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
+allOf:
+  - $ref: name-prefix.yaml#
+
 properties:
   $nodename:
     pattern: "^audio-controller@.*"
@@ -31,6 +34,8 @@ properties:
   resets:
     maxItems: 1
 
+  sound-name-prefix: true
+
 required:
   - "#sound-dai-cells"
   - compatible
-- 
2.34.1

