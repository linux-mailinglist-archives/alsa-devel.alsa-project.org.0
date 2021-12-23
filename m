Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F2D47E32C
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 13:26:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE1E51908;
	Thu, 23 Dec 2021 13:25:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE1E51908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640262365;
	bh=rI5U0oxlsGILlgkeLQNzOew03m2c8hlO03rGrNOreIw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rTbA3pqa1gdbLRvsyScGpIVC61YL+cxwi5cgRJIdNw8Gld0XqBcbVxV7XMuajuH8q
	 GPA3b4jxEGOHCz0AfOQCD7JSqf8JCs3wt5gOaQv6Zo1uADEt09f273SXbhgyBJV891
	 s3yuez1vC4vBIGClK5UYfv8NzZ49v2FbYI4XyD30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BC9EF80121;
	Thu, 23 Dec 2021 13:25:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D493F8011C; Thu, 23 Dec 2021 13:24:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E112F80084
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 13:24:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E112F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="EdkT3Ai/"
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:4:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4JKTsc0526zQkmF;
 Thu, 23 Dec 2021 13:24:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1640262290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cT0+wkDSDPtvc62/fafJm4zxOwD0FjNk79FqTIHSZUc=;
 b=EdkT3Ai/3oRON67p9O6FnP8hcQRhdlF903+JNWGXDyBk3YMd4EJZt54Z9yt2Oxd0tg0LDc
 Pv8hQlv6w054RDAKsdmVdMMXIQbdRuyaGEKHL1DNYhbC1g/Pv4SBQfLS3nF4gXRxiEqfBr
 5m5Aomp/c68ekiSJDaLBvpnTcOD19c5ZZCDHiQrU6soHU8KahUdqUYknF1PPsv4c3w6iZo
 0n+01YE7CDOdsDJHDhGhef7mFgfCkkcds6p6lRdsS0LeOHBmJ6e3ZBzYYOjXqOrrJZ4qRM
 pCl+1EiBAA512Px/HqdsYkmNTrcWcNflAJ4eznRqQq/wnjsE1m8GPLkT+6jeow==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/3] dt-bindings: display: meson-dw-hdmi: add missing
 sound-name-prefix property
Date: Thu, 23 Dec 2021 13:24:32 +0100
Message-Id: <20211223122434.39378-2-alexander.stein@mailbox.org>
In-Reply-To: <20211223122434.39378-1-alexander.stein@mailbox.org>
References: <20211223122434.39378-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org
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

This is used in meson-gx and meson-g12. Add the property to the binding.
This fixes the dtschema warning:
hdmi-tx@c883a000: 'sound-name-prefix' does not match any of the
regexes: 'pinctrl-[0-9]+'

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
index cf5a208f2f10..343598c9f473 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
@@ -10,6 +10,9 @@ title: Amlogic specific extensions to the Synopsys Designware HDMI Controller
 maintainers:
   - Neil Armstrong <narmstrong@baylibre.com>
 
+allOf:
+  - $ref: /schemas/sound/name-prefix.yaml#
+
 description: |
   The Amlogic Meson Synopsys Designware Integration is composed of
   - A Synopsys DesignWare HDMI Controller IP
@@ -99,6 +102,8 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  sound-name-prefix: true
+
 required:
   - compatible
   - reg
-- 
2.34.1

