Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA397B3EED
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:04:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC79DDF4;
	Sat, 30 Sep 2023 10:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC79DDF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061094;
	bh=JIQkC+0Be4DVYZ+uaLpvlmzAMgNRpGBFxiIdL+YbT3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q3hdkzeXNOyMflrmMg/1WeCtUQqsdKbfJh06zcV9aG3R0hpLmfOaBQMQiPiNFxOuu
	 Ksk6YJQh4S9esOOYzyURsjfxhGuJiWSOt5vNe3zqndmDlghUS+QUCwdO9KVmWYP7zN
	 16x/PbTz0qcKJKXkzIRks3f5FpqFQJRIEJKZFOa8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EA5BF805AF; Sat, 30 Sep 2023 10:03:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A59ACF80290;
	Sat, 30 Sep 2023 10:03:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4041DF8001D; Tue, 26 Sep 2023 06:12:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D13E1F8001D
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 06:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D13E1F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=EU7zVQK9
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-77412b91c41so409556585a.1
        for <alsa-devel@alsa-project.org>;
 Mon, 25 Sep 2023 21:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1695701352; x=1696306152; darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AnkYs5/BG/9GOQBaCWwWyOfl1fNQBQrw4AiO+6MYmI8=;
        b=EU7zVQK9JPrbW/J3H9prqi9TeT+NeN5jLGPUEDM8gPxULeXFIA9JInp3J946BJxjFP
         01QyrZCSjLg7mR7kcbZ9xqQP9pEbYHu9izgYELnZvXxTkjIWX6U3TckmyDipc8rstRKc
         DH4h9bI9OEIM/Mn1mlkReyJeGRxzjCHoj6bxKji0L9A3heq9CGeL2d5Q+g8vxk7HVps/
         QLA1DSNikl4R25VcoH9pn3zOIjBqT1kPBw8s9ngHs3elqvr+hMiSvyXR1FD+POcQ1GDO
         dxn1AVkLNqiQOl/xqGQMN7beyOvQREhtS+wZuMcZ0/VQdYktB4ST1Gkty77FiSyrcpUb
         /INA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695701352; x=1696306152;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnkYs5/BG/9GOQBaCWwWyOfl1fNQBQrw4AiO+6MYmI8=;
        b=k9HtM9oORU7+jq/9pIHfv6Z7RA+tqewIIpbt+H4qMElMWFSlwLlQV/lAvYVkx0Oej6
         XRIvzfH8feMoF0PMtX8NE0ww4HudDjPdUbzb5Ejs04PVDCKJjeuKXylhS/W+Usp0XKjY
         +tG9DLWVktAj29jDTaNqr/I4BieWtff/1pyl+TDwR+/G9t+JgvBxrEFYLUTDl37XU/Y3
         BzzqxZ6D679XI/vC9aY68mHSCyrI/D/tZXdbqmfEVFlWZRz0/+sjl+5t3W84ILbiIYA5
         dHr3Q7akRHD+UUkGCrI9Ul/UMWtn++TS5Z5z2An2BnbiA5x9Os+NrARSpO2jwfzRSRM+
         xHSw==
X-Gm-Message-State: AOJu0Yy7YZTy84adxGeQ5XXP9TuyFJxDJlhc3CN0Eh7cipMxmQTvZyy3
	xFDd/C2AkpPhYnb7s/k+8+lVzw==
X-Google-Smtp-Source: 
 AGHT+IEGk8Eh0HkJJqF00QSQdnOkthXsg5tTDBAC/R5jcwbJQegRrx9uaFUuouljq8+bvVSWeshFcA==
X-Received: by 2002:a05:620a:f13:b0:773:a229:5a4a with SMTP id
 v19-20020a05620a0f1300b00773a2295a4amr8412741qkl.25.1695701352202;
        Mon, 25 Sep 2023 21:09:12 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 z22-20020aa791d6000000b00682669dc19bsm8824907pfa.201.2023.09.25.21.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 21:09:11 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	trevor.wu@mediatek.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v2 1/2] ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S
 support
Date: Tue, 26 Sep 2023 12:09:00 +0800
Message-Id: 
 <20230926040901.20338-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: 
 <20230926040901.20338-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: 
 <20230926040901.20338-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IP725NIGITXUZUTJGZCY3MSWEUZKXW2W
X-Message-ID-Hash: IP725NIGITXUZUTJGZCY3MSWEUZKXW2W
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:03:17 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatible string "mediatek,mt8188-rt5682s" to support new board
with rt5682s codec.

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 43b3b67bdf3b..4c8c95057ef7 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - mediatek,mt8188-mt6359-evb
       - mediatek,mt8188-nau8825
+      - mediatek,mt8188-rt5682s
 
   audio-routing:
     description:
-- 
2.17.1

