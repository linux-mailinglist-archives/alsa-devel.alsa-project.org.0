Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA63054F054
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 06:44:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81B8E1DE4;
	Fri, 17 Jun 2022 06:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81B8E1DE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655441092;
	bh=qJqdRhppLHf8Ht0qI14YI59McVuZNxX+kjzP3VWebok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SkWzYPhRCpPZlAK485Qzrbre1OSLIIuPtEXBzaT6DsdKDzmGN7iY1YOV+7GJzfnE8
	 lU7dV5hdPhhH6bV6bCHCfSR80GBZ+ymHaclfucQpxXP4yO6/Ofk93m7GvsuAgd8KpO
	 X13rXOl8VcuOa4fYr1W3b3bTBkoEAo/+HhypypxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5E0BF80529;
	Fri, 17 Jun 2022 06:43:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CAC3F80248; Fri, 17 Jun 2022 06:43:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3864F8028B
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 06:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3864F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="IZdqemgj"
Received: by mail-pj1-x1032.google.com with SMTP id a10so3057513pju.3
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 21:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fjP9Be4hnegvsgOyWKGbkMNBDmKFNmzp11PphlEg+I=;
 b=IZdqemgjM011t7qSaeazGC5ggc3b5p1NDSvXtc+PuYsJrlv/olkGHyV8kaSghNi7KW
 9TzKTQfhxWc31HVBifhIwFyTieKiEnksb0h9otWk5FFg9Xky6MpqgNSfBT8Am+60SFNX
 N/FsTDI5dlR673K0ktxd/t1h8azx7yqqJpME4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2fjP9Be4hnegvsgOyWKGbkMNBDmKFNmzp11PphlEg+I=;
 b=TqsSKztHkJl7erSIboiaNsBppsZCsvT3OSZQWScSsb19TqpT7yillLjl/Q4PYl20vD
 nVicp8riFas7Zyj6DUepnqpHy/nX4IK0ybDtjWBfPE4Habo/lcmxSA6H3zaio5/F0lXO
 wcHLAo4ReXn9xKBFZBQVFCTyEbO+9pzQoIvX6jviCqozt07bArd30S1M4js5vkgA3WZZ
 gszKa1kQiwF9xEPyheM5Yk4EnemctdKB5N9YVIzYB0uCN5sWDur41W31mvWDFQZIMpIP
 HkJKbbs4sA2QdZgZzMqrq3cLQdi5QYxV9to+aLAM/cadLWIRhRjFzm7/aZ19y5oOy9jq
 MzjQ==
X-Gm-Message-State: AJIora9rpgM/liqwZ8GTZlaaJLB7xwJTB/yxrCaKTb17zusOhyi5UzyF
 x8YSwpDy238iGKAkWaCQGhuqqg==
X-Google-Smtp-Source: AGRyM1vLs55QXCgklZT2ekRxVqDn+icjviHTpjMZkA9w+4RQE27UUTrD8lRbDtZ8X4JwMc8QXD9xGQ==
X-Received: by 2002:a17:902:9b83:b0:164:59e:b189 with SMTP id
 y3-20020a1709029b8300b00164059eb189mr7540998plp.91.1655440988545; 
 Thu, 16 Jun 2022 21:43:08 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com
 (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a17090a778800b001eab0a27d92sm4491030pjk.51.2022.06.16.21.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 21:43:08 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 3/3] ASoC: dt-bindings: rockchip: Document pinctrl-names
 for i2s
Date: Fri, 17 Jun 2022 04:42:51 +0000
Message-Id: <20220617044251.4029697-4-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220617044251.4029697-1-judyhsiao@chromium.org>
References: <20220616155836.3401420-1-judyhsiao@chromium.org>
 <20220617044251.4029697-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Judy Hsiao <judyhsiao@chromium.org>, linux-arm-kernel@lists.infradead.org
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

This patch documents pinctrl-names for i2s.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
index 5ea16b8ef93f..7e36e389e976 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
@@ -61,6 +61,13 @@ properties:
           - const: tx
           - const: rx
 
+  pinctrl-names:
+    oneOf:
+      - const: default
+      - items:
+          - const: bclk_on
+          - const: bclk_off
+
   power-domains:
     maxItems: 1
 
-- 
2.36.1.476.g0c4daa206d-goog

