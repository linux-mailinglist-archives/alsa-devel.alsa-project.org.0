Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F3154E68C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 18:01:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52B791AE3;
	Thu, 16 Jun 2022 18:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52B791AE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655395266;
	bh=ZH+9sfto3fC1BBwdISpR1/iFCdv2nwcO9bDS9b98Nn0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FppKPQq6Z7wUk1LzjcWMKpyi8BphO/PRgPVKNFLEk2qG4d+2viS4rbas2iTLBYamO
	 QXRZP/RvCeoWAY5mv2QASLyrE2z6xc3pMaO9KRYRQkZy/epgrmD2Y+kcHJQ2lZLhmx
	 H3ntuoKRJHIcBPZdjgYzt7ED856soVRuLwaOAB/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74137F801D8;
	Thu, 16 Jun 2022 17:59:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC757F80536; Thu, 16 Jun 2022 17:59:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A305F801D8
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 17:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A305F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="j1+LKGPK"
Received: by mail-pf1-x429.google.com with SMTP id z17so1875439pff.7
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DgrwewMce2rCEAP+XlA9uqVT9sKMIcKrgNTnswDM33Y=;
 b=j1+LKGPK//opsez1h3IZYLmloo+4hPEoxEk8xMICOmbOhqlBLGAMND2zjOoFyug2EY
 5w+Wt5QkKbiSzcJfiUrlZXilCZK7CzVdOKye1m0P35pjQXxCnDRhlzva6yupERBJDrHJ
 N5pZ4c/wqoz867w4DqOPA5KqOEfbKkO/oGYIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DgrwewMce2rCEAP+XlA9uqVT9sKMIcKrgNTnswDM33Y=;
 b=6ELayldtyQ4SWB51fTO+2ykzYyd9MtyUA4wi7gnHCmmyu7v9D0hacKLF9lUfHP6aWO
 Et81N+2UIbFnF8HmyalYITHQ++qIOMfzdbGQk3Mf/f8SsBDvr6H9CE6qBF84hcLPcXwG
 m8bQbNCkHbEqZ6cikOtD4IqZfAD6kGdvOECjflzLYEFpQWxZi+MCtqTxVBqLP0kouqGb
 gJhG8F1Pgk53TR2k9reDsQdI2rP5WvQ4nQlnERiwl0KtMSgwWiSVHuHXhRk0X99T+sP6
 5WHSDLj3ZLy8VazCUN2NLkruucqmIxxAk9FBrsqe4OC1rxvIrtxSXbtZIT5hgIp0sifC
 1ZWg==
X-Gm-Message-State: AJIora/sz1s7fkStM1M3Kf7ObuJiYcNwBDC18YxTIQKCt4kUoZrqOqWI
 Bkam/inKGKtL6jVK6+tzR8ZJzg==
X-Google-Smtp-Source: AGRyM1tJ4+JyFVVgPMz5uyUA7b8XnLeEV3bIK43Yl9Qo91NqaGe+fP3lYzpmcrF6e9DSJkwDcLQiGQ==
X-Received: by 2002:a62:b802:0:b0:51b:f4d2:65be with SMTP id
 p2-20020a62b802000000b0051bf4d265bemr5477983pfe.79.1655395156957; 
 Thu, 16 Jun 2022 08:59:16 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com
 (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a170902684800b00161478027f5sm1779797pln.150.2022.06.16.08.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 08:59:16 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 3/3] ASoC: dt-bindings: rockchip: Document pinctrl-names
 for i2s
Date: Thu, 16 Jun 2022 15:58:36 +0000
Message-Id: <20220616155836.3401420-4-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220616155836.3401420-1-judyhsiao@chromium.org>
References: <20220616155836.3401420-1-judyhsiao@chromium.org>
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
index 5ea16b8ef93f..af1069278623 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
@@ -61,6 +61,13 @@ properties:
           - const: tx
           - const: rx
 
+  pinctrl-names:
+    oneOf:
+      - const: default
+        - items:
+          - const: bclk_on
+          - const: bclk_off
+
   power-domains:
     maxItems: 1
 
-- 
2.36.1.476.g0c4daa206d-goog

