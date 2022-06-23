Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D135570F5
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 04:14:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3411D1B4C;
	Thu, 23 Jun 2022 04:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3411D1B4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655950449;
	bh=UCtJH068qqKKP0oEibevroKjFqXTWspvGwLyFGrDuo0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G1qOVR28AC9evsMXZRJagUqjBZhKp+MXC8AgewzauRF/S540aJKY1au2g9+Jc3Moj
	 d+yp9SAiJn5e7VtLNX9l2I/hr2DfJ6OHd4yZ41j0trxpn5v3pGWMUtqqO54tNhzklc
	 4NnTaZ4kr3rwbof0gduOhe8q4EO8yWoamHkyLRJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 129CFF80542;
	Thu, 23 Jun 2022 04:12:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84B8BF8053E; Thu, 23 Jun 2022 04:12:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08C30F80537
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 04:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08C30F80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="YTdodIHe"
Received: by mail-pj1-x1032.google.com with SMTP id
 g10-20020a17090a708a00b001ea8aadd42bso1211683pjk.0
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 19:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LO7XuaEC/0vDNLbgeDoJilJKS3NWSolp4n621az3TKo=;
 b=YTdodIHecq0rIHPbOUNfMDsBOBFCCQZTpt8Mae1FUo/OzFM6XdXMJqT6FAiu7e9CXF
 PxEgtptDJcI0oMyWCxN8NsK8HX4VKQAnnRy7sEUIStaqxwAiGptBSPMulN6V+Gcit6n2
 NDv7VnHGcSOV1n6yNb6uEy6L+zlw+RJ1HHkXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LO7XuaEC/0vDNLbgeDoJilJKS3NWSolp4n621az3TKo=;
 b=TzqJxz9ZaKjvpgKRtCV37hzSEESPsqmWmNXZOQm4cwAsnjgzrHGPit7rnDHwtgGDI4
 ZKCJ7myDbcdHlhsW9qdeyaexbyHBv06ztwVPxvihYjGuDpxnclu2ZH8eJ4lyf3lCIokb
 6eovoaJPzO9d40+dodMVJ3zlMuvBt7vIQf5oFO2Y18iBYKahImeMFtjK0ndkxpjOXFfM
 96U6ibqVHoE34shl5j3FglffD7xVzGPe8sALNkWBn/s/WBMqSOzlucJAaVrI033/fVj5
 QCgO5dxtc64agoiBk9r9wRZ6IgseyffFWx+SmI5OgheBMTvyBWQMf/MAm9wopJe6M9Fe
 bZvA==
X-Gm-Message-State: AJIora9+NCCHbtoh/QJpUkMyxb3umT8rYUbPll7KuU59qhw3QwlQL4Zg
 FLDeQhgrpxMGWsyuRET9IdFrrA==
X-Google-Smtp-Source: AGRyM1vyoRc4GfoYYaOKyQJWI5gEHK7cxz3myYUl/C/h7waRa2CFuT2tcdE9FdsAox69KLspbd1rCg==
X-Received: by 2002:a17:902:ee55:b0:16a:5e4:26b with SMTP id
 21-20020a170902ee5500b0016a05e4026bmr29350254plo.29.1655950337415; 
 Wed, 22 Jun 2022 19:12:17 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com
 (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a170902768600b0016196bd15f4sm6194000pll.15.2022.06.22.19.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 19:12:16 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v5 3/3] ASoC: dt-bindings: rockchip: Document pinctrl-names
 for i2s
Date: Thu, 23 Jun 2022 02:11:53 +0000
Message-Id: <20220623021153.587423-4-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
In-Reply-To: <20220623021153.587423-1-judyhsiao@chromium.org>
References: <20220623021153.587423-1-judyhsiao@chromium.org>
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
2.37.0.rc0.104.g0611611a94-goog

