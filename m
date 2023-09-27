Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A907B3EF6
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:06:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E45D3EAB;
	Sat, 30 Sep 2023 10:06:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E45D3EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061215;
	bh=Bs/W8SHBpMCYwAPE/CeMhrACKuIIC0a0rIFveEXbKhc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jw8cxW0VuFPvmYETdvt0r0k1CQoJTQW1tzlTdCfsPTolu6jxXB4zD3aErNzZUeC8A
	 4+jXj/RWGQPVa6Wg2jaEdXLMskrdu2wweLdzeSXGDqebCcqAKWuS/tuMvRqqCtxBFP
	 tL84bbXzKLid0oy7JRkSqRYl6MHExN3XC3ZLCDO0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D177DF801D5; Sat, 30 Sep 2023 10:06:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF0E0F801D5;
	Sat, 30 Sep 2023 10:05:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7482F80290; Wed, 27 Sep 2023 05:36:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3123F8007C
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 05:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3123F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=ioqHt4Nn
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-691c05bc5aaso8841515b3a.2
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Sep 2023 20:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1695785774; x=1696390574; darn=alsa-project.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8iHvx1dsePHhcovY1cm1S5dLZsg/5oNsoEJEmRXpTU=;
        b=ioqHt4NnQ0aEvZXYXd3XlL+ZnBw5isk6n+oO1rDmpFRNvzgc9p8NJwAMqfh7WwcU2m
         3nw4rzSV2y3CI03x5a9BJ6hKtyW7X6qzzRyr1Vhgxbkb+mXW/TR2FLUNoyzEBrWPO1L8
         9IPNydJNJOAHEMeNXDLNX15squOmnK5OrzpzmwcXHENDMi/vwxxDLSkJkSL9xAa6DIsh
         YjWml2RhmqJuYRLbsIfqUzRCMOlqHbOj6uksvpcdFASQ99iiTKNiR+kgLKi5Kbw8eg6S
         dysU9U4YAGQfzeYSr9AH10vEU1wRdFIylxiN1XQ3Bea6IBx+t8EnEy4yKKB2PwBkg/UI
         OTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695785774; x=1696390574;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8iHvx1dsePHhcovY1cm1S5dLZsg/5oNsoEJEmRXpTU=;
        b=BM9h9rlv+L+b72zQi5tYQdgCk47ln8WxVH+yILlJQ4ISnepXgHlEBKtxLYsz9lGQTA
         R1r9GslujWVFGGWPHhI6DTfoZ1rlQNrERCmwbN0JGB/Z9VGsFS342Z4U7B22CF9NvUF5
         QJ92BFsOTIzsDxGtmJAU1OUxrRaifwKwymHAa5mZWa3+7DJDF4OmKqaTXC+bp3wbqtk9
         9rC1y/7kMRKDN/UtedtwX1GdULVQVYSeliAh3vjMyb9f7hMgAYDh8fGBzsj92uY7dJyw
         TxvitulWa/axPdc55vHl+u+xo6GWQn7lzHEoVF+Rr8WFd+pI9xKy2yXfdZ6ml+/mF0JJ
         +DJg==
X-Gm-Message-State: AOJu0YzlDF38y1hCYSmWKCGh5AW7HskCeUDwGP8vAENIjSXaE0gkZofQ
	fgO8Y7xCj3AwHpvWrdYVReAM8Q==
X-Google-Smtp-Source: 
 AGHT+IFg9MWz/BGS1JWCEp53YleO3c0zitqJhgHShflpegjZA+hBbgouhBmH37EO3HQwfo42LiHEhA==
X-Received: by 2002:a05:6a00:2493:b0:690:1857:3349 with SMTP id
 c19-20020a056a00249300b0069018573349mr1043900pfv.25.1695785774386;
        Tue, 26 Sep 2023 20:36:14 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b006870ed427b2sm11067570pfo.94.2023.09.26.20.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 20:36:14 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patchwork-bot@kernel.org
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v3 0/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Date: Wed, 27 Sep 2023 11:36:06 +0800
Message-Id: 
 <20230927033608.16920-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 65VIB6G6IJPWIOJVZ5EGMZMC7JOLMSAE
X-Message-ID-Hash: 65VIB6G6IJPWIOJVZ5EGMZMC7JOLMSAE
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:05:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/65VIB6G6IJPWIOJVZ5EGMZMC7JOLMSAE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To use RT5682S as the codec and MAX98390 as the amp, add a new
sound card named mt8188_rt5682s.

Changes in v3:
- PATCH 2/2: modify mt8186_rt5682s_i2s_hw_params to mt8188_rt5682s_i2s_hw_params
- Link to v2: https://lore.kernel.org/all/20230926040901.20338-3-xiazhengqiao@huaqin.corp-partner.google.com/ 
              https://lore.kernel.org/all/20230926040901.20338-2-xiazhengqiao@huaqin.corp-partner.google.com/
   
Changes in v2:
- PATCH 1/2: Modify mt8188_rt5682 to mt8188_rt5682s
- PATCH 2/2: Modify all string "rt5682" to "rt5682s" and merge code 
             in mt8188_fixup_controls
- Link to v1: https://lore.kernel.org/all/20230925083847.1496-3-xiazhengqiao@huaqin.corp-partner.google.com/
              https://lore.kernel.org/all/20230925083847.1496-2-xiazhengqiao@huaqin.corp-partner.google.com/

xiazhengqiao (2):
  ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S support
  ASoC: mediatek: mt8188-mt6359: add rt5682s support

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 141 +++++++++++++++++-
 3 files changed, 141 insertions(+), 2 deletions(-)

-- 
2.17.1

