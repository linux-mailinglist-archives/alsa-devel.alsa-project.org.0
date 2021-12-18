Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8D4479B52
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Dec 2021 15:26:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B97601891;
	Sat, 18 Dec 2021 15:25:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B97601891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639837585;
	bh=6aGetMSe5wCWDFqOejK8BUrr6MsgJ0DO51IlD41Qqww=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DLlrSU/QNy+htO/fx8GKo5EzzzRXJ1RsqUV6cn1mZxSwWFIVUJYJoIPD/UVVgSSCn
	 iT6t7dDbSN3sVYExvt9J/O5rOd2ztwYhJiW/kwbJIF1an0GeUIC9zVtTOPtRP6+ljU
	 ahic8i6iwSnlxXcpVyidldWIPAN2+kKzECKCybLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E89BF800E9;
	Sat, 18 Dec 2021 15:25:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50231F80139; Sat, 18 Dec 2021 15:25:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 789BDF800B0
 for <alsa-devel@alsa-project.org>; Sat, 18 Dec 2021 15:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 789BDF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="SrZRa4EF"
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4JGSmg2WMBzQlMN;
 Sat, 18 Dec 2021 15:25:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1639837505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XF9vQjylQsXIaoxe2xV57DPHnmDDChvv1OAmnlTSlAM=;
 b=SrZRa4EFPNZtE5k8EMDMIYbfeTdQhyFmB1NKZax7Dw+r8Xu9Y9AERvNWxrXmHVPbxJ+UDY
 bsbGSU0f8UWchBkPXCvy5h77alqvNckvQhL7n0PQr1ZqYPM+ugiDzPjWZwBuyW9DJ89f0i
 TbgXPWK583RoV8oRMtICYfXAcQyKzVnjahqxmFQo1v9tx97j8LJ0wDuO/hOP9QCYuRfB5o
 65XIrFH/po5T55DjUOb4HwbH8klo0dfZddkXY7/suOvytTmVasIApF5RLou4/3VbURUhF1
 eJf7y3oXUcmY+sB8wRpBcahpHn9BVH3BnGIRpWbVlFBN3hx8yp5z9slIiHXfWg==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/3] ASoC: meson: g12a: add missing sound-name-prefix property
Date: Sat, 18 Dec 2021 15:24:51 +0100
Message-Id: <20211218142451.15010-3-alexander.stein@mailbox.org>
In-Reply-To: <20211218142451.15010-1-alexander.stein@mailbox.org>
References: <20211218142451.15010-1-alexander.stein@mailbox.org>
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

 .../devicetree/bindings/sound/amlogic,g12a-toacodec.yaml     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
index 3c3891d17238..28c082b07c3e 100644
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
 
+  sound-name-prefix: pass
+
 required:
   - "#sound-dai-cells"
   - compatible
-- 
2.34.1

