Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDA07C93C9
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 11:29:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B300A868;
	Sat, 14 Oct 2023 11:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B300A868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697275743;
	bh=G18K9/NbjyU0eodhg6uBP+C2urhz0Zryadum4wUyL1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UTKszHBhZYLcrhDZaHGqUO0eJvSPkukEMflbbU1LhsCkap2VCZXo+uSM+oppqnLJL
	 KZCwSQ+oH7TtxbhJwbH21CmVElOnOSS5NSoZb2+4H6Zjg/hDsjotCn0reonaz+GpxA
	 d9PAVmP8fXCOULuyYLv5/th+V3WfwEBx8NWDgf+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21065F80571; Sat, 14 Oct 2023 11:27:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A494F8055C;
	Sat, 14 Oct 2023 11:27:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B35BFF802BE; Tue, 10 Oct 2023 04:37:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F9C9F8019B
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 04:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F9C9F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=X1n+xpHk
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c60f1a2652so38373065ad.0
        for <alsa-devel@alsa-project.org>;
 Mon, 09 Oct 2023 19:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1696905474; x=1697510274; darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FBRoIXxc4ljc8DF/PDtBoqS0A6CYruv097EKMy33JAI=;
        b=X1n+xpHk0uspTLV6iqQJn4l9XvmKL2SSBEmi21tMoWHeoFOGfimUmmaNhV/o0yg8Y5
         Zb+x3pvv++xUw0uvMeGOvR0UqA2nqg21x0Ow7JejfmNpRTj7lFgeMBfcr3LlpPX6Rmls
         TqGwJ9x3CGHA37BJfR1ylfYla271PjpcFHlRIvTxE8oG05a6XdaGHiwCZrWZO5iIwwnL
         lpWaK75585q8puUbSwbQIzc6AGvxeUlHuHrQRJob8fGPSRY7p7brWuFveSZxPoEaTFDN
         3mT98ExS/2l4n2dZeKTMVMXUg0sR53lFJaX3YNRP1IxReCZ5VQirbqxt0omtmXc79OT3
         5oOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696905474; x=1697510274;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FBRoIXxc4ljc8DF/PDtBoqS0A6CYruv097EKMy33JAI=;
        b=fppBx8YchSN18WOvtlu8hiy736sEncCCu44oBP8f5Qvr+ibUlpaueIb9jYC1m+v0T4
         kmB19l4ZZk6PyRYGnuey1YG/wktucbMcALwM0wR2Ys9SCVs0bhguXE/Zcc8CvBUG8OJg
         KHp53JW8q2H2VPjvQKP+3o7ou7KhOAPn21s42WV6RZKwq3dAXIicGGWZzN0o0HQ18vvT
         RgqkEOX4LpvUuet8WooufCE/HJ4y9WiW821ZRnGNxWGdpjub+BtH5zbQp7lXgwsvS5Y9
         cC0wgLPbsQQ+FuGZtv4D4c89I14ZqaMdUhIW9khZ5yOvu3cKJ9UXetsMWNpP6iMntCce
         8kWg==
X-Gm-Message-State: AOJu0YwEzciG1y+PSQAIagJhgFRNq+78qRNhgfcRMzWeSPwRxAXpMVmo
	FYa2g7BGFwHgs484dJPq0Fr3SOt7D9oL3EwgQgk=
X-Google-Smtp-Source: 
 AGHT+IEv18QaxmdXF/vUEo7prCg0gx1O29LYJaDyQoUVhpU9JZshh+ovBSvE4QZw0O7F38u1Ae0ekQ==
X-Received: by 2002:a17:902:ecd1:b0:1bc:1e17:6d70 with SMTP id
 a17-20020a170902ecd100b001bc1e176d70mr20438926plh.24.1696905473655;
        Mon, 09 Oct 2023 19:37:53 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 e1-20020a17090301c100b001c613091aeesm10269039plh.293.2023.10.09.19.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 19:37:53 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	trevor.wu@mediatek.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v5 1/2] ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S
 support
Date: Tue, 10 Oct 2023 10:37:37 +0800
Message-Id: 
 <20231010023738.8241-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: 
 <20231010023738.8241-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: 
 <20231010023738.8241-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TO3HNA5DJ3NQJT2BARZZPC6ZWAG275SD
X-Message-ID-Hash: TO3HNA5DJ3NQJT2BARZZPC6ZWAG275SD
X-Mailman-Approved-At: Sat, 14 Oct 2023 09:24:38 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TO3HNA5DJ3NQJT2BARZZPC6ZWAG275SD/>
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

