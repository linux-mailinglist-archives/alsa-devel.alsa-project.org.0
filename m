Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A40907CFC3A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:13:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1023E8F;
	Thu, 19 Oct 2023 16:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1023E8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724839;
	bh=fmKfvLN/li5VItX2e8K3xtMqM8Q1s6qVgM2RB5uUjQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tJfvLzvBY1/7ILOJ3mAPfi4C2K1e6t8BlEiAer/ddPyZSTvxyrsHNfi+2C1K70X7I
	 1p6xtElDN7npndRsr+P5d9JzTrnG3h9v9wkymZnMJixwgcp4iZgBfVjsCu9ttmuY0S
	 29HMC28Vmcqmy84VPXM4FBbqQ8GJ0LDPw3C5qW/Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28165F80580; Thu, 19 Oct 2023 16:11:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D13FF80571;
	Thu, 19 Oct 2023 16:11:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B14C1F8027B; Thu, 19 Oct 2023 04:11:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18F71F80166
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 04:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18F71F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=0lxIHKtR
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6b709048f32so4240644b3a.0
        for <alsa-devel@alsa-project.org>;
 Wed, 18 Oct 2023 19:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1697681503; x=1698286303; darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Azt+KfO9BoapxXrqgvd2zufA2s8NVZ07Ks//tnwBWjg=;
        b=0lxIHKtREJrVqID1V8D6ZnJunf1mJQG52q5lf8kY7wxyBA8ADXsG8gEGHu8uvWn2Va
         mLP1U4h5DWPTQEzeumqzqErE2aAp7souTbDb+S5a1WXUCHMPyZbDoYy7f47QIN7uCTir
         YjiUVm2et42yzbnre2gvezZE3wpmXGaWTG+dnlnclkntktVBaGIwFNNTVOpD1J3Iofa0
         WBr9FyW1CBoNNWj5Eq5ZRYz/GrXi8HGzBmD1CI3eibBfc2vFx7v65EHforPNNx/WMZAj
         RVwOwRu9rRE0kK5gcZyvji0VDDxlw4dZxLJnJsFutg6una/rUCY+1J8dYzuVrl6wl3jU
         p6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697681504; x=1698286304;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Azt+KfO9BoapxXrqgvd2zufA2s8NVZ07Ks//tnwBWjg=;
        b=JGEO1w9R/IIOKjAXv/qgFQOclJtVINHV5zKGN4GXaiB1ljjOC+ZPODzSF+eioklFZP
         o8LRRaAW22Ou0QJBQe62BwmHgmOrUrT5v0mr1bqkE++8/inSzdIp6W5pinfTia+ll2wN
         cSEy5L57+/r+CoRxyvU2S/jYmuOzyQqLLLTkz0nd9Z8DbhUJphCtD7xYvhjA3C+4/ema
         aWAIvBoXHKnb9YHZ8mwtwg7OUsRYyY/cMsKphotj6ABKBraOg0k/UcQ0NM/YRT1D7S8X
         a6Jq0MnB8QBEiL+KoWYlh65DABWtAJEyPvdlNqrRU7N4rblPPo8dBd8uJdb6F0rk88L3
         8hwg==
X-Gm-Message-State: AOJu0YxmcB/qQYdFadY5LQuorWrHra0U9i+Po7vIge4aE6Z8zPEujEih
	fIz0HonJcIql0rAWJApJi/omFw==
X-Google-Smtp-Source: 
 AGHT+IFNM9DN+I31MJZtznVBNyudmhbiTq1tVGLCtePwCwctczzofTe/a2wJR7hJZK/9i/gwrSmiFg==
X-Received: by 2002:a05:6a00:2d1a:b0:68e:2d59:b1f3 with SMTP id
 fa26-20020a056a002d1a00b0068e2d59b1f3mr748544pfb.13.1697681503421;
        Wed, 18 Oct 2023 19:11:43 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 d7-20020aa797a7000000b0068fadc9226dsm3974278pfq.33.2023.10.18.19.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 19:11:43 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	jiaxin.yu@mediatek.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v1 1/2] ASoC: dt-bindings: mt8186-mt6366-rt1019-rt5682s: add RT5650
 support
Date: Thu, 19 Oct 2023 10:11:32 +0800
Message-Id: 
 <20231019021133.23855-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: 
 <20231019021133.23855-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: 
 <20231019021133.23855-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OSL7OUE6IT3LQ4K7RKW7IXBLECQG6IKD
X-Message-ID-Hash: OSL7OUE6IT3LQ4K7RKW7IXBLECQG6IKD
X-Mailman-Approved-At: Thu, 19 Oct 2023 14:11:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OSL7OUE6IT3LQ4K7RKW7IXBLECQG6IKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new sound card "mt8186_rt5650". RT5650 comes with amp and
earphone codec.

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index d80083df03eb..bdf7b0960533 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - mediatek,mt8186-mt6366-rt1019-rt5682s-sound
       - mediatek,mt8186-mt6366-rt5682s-max98360-sound
+      - mediatek,mt8186-mt6366-rt5650-sound
 
   mediatek,platform:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.17.1

