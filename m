Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F8A7B3EE7
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:03:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E53CDEE;
	Sat, 30 Sep 2023 10:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E53CDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061024;
	bh=qpAsrFPKMcQbhw9pKHFg4WuyvWFoFU6xX4NmSN9SDmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QIg2b9h9ApXGVKR7a67KJ7q4BPeGljDqy68iZex6vzE1q45YvZubSb+KYmLXVXP2t
	 5H5L/8F/6dpKJtgAU9FHndZeJi/820WTR6wtUgbhMfU0n6GKp/RM57VKftB1HnWO/Z
	 e2OJpZ6rbENL1l90C86FPamNKcpBc2pnNNyFik4I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DAA0F8055B; Sat, 30 Sep 2023 10:02:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 253F0F801D5;
	Sat, 30 Sep 2023 10:02:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DA04F80290; Mon, 25 Sep 2023 10:39:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D3E6F800AA
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 10:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D3E6F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=gaffo69N
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5809d5fe7f7so1275303a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 25 Sep 2023 01:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1695631148; x=1696235948; darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kt531lV/49PNzylTwWw5xyk5QvUpAoPyaIHXHiJOv2c=;
        b=gaffo69N5wnYKbCTKi3v96n9tShawIY0KFG+Ci7JTZKdCR1ODkC1vqIDI8FK+fAtRi
         udxmYXWML9VCmpe4yZ/5rxjgEM337ItgqHZOrrxaotgwIihRPr8jd2x8ZdERTS704B88
         2UNH1kE5adULQQTnKjm4uAv5w0smfdfMT75ozD3z4fFk6FMj9DFtt4CLQhqWC+KrS0br
         tzwYlQ80EekF/80aaOvgcJiOx0cHIdQX0syVBykvFskIXptRYpkoB7oQ1xwdFxhJ4e4y
         9ZwSY7Qe/hqoU42qc0ZAzQ6sCoBZnSY0a9vJfvdAToD/+pYjPV/ltt6QQahuEHDc2R9A
         vF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695631148; x=1696235948;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kt531lV/49PNzylTwWw5xyk5QvUpAoPyaIHXHiJOv2c=;
        b=ki8hQI/ECa8UQNMlSk3iSV3cqudolB3ghnHcR+XZbvOI1Gw3JJCLGXLsdlVUusiE/a
         obo6cN+xzA8NVLVGmI04cQQyBcw7WcCepdMaVvAo48W/yBOjh5Pw+YZPZk4+aMpiC20u
         Hj1Mm5NKb6e3O2t3/ooXGvwwGiAIsZO9f9JrtFHdVyUuRE5VD189jWHBhqJaSDXl9ztE
         2yCEqc+RIjtJwtQ3Ytfs0KgiQUrDubYLsjLuqaE7sv5y0b0HEfw1n0b8ixJ94m+iDBDa
         ThKMpVI+VF7fMZU24I75Txhs08WLH40eTf9aSQWizIHhU+zNFBqHsQa0UNzkRxVfyESo
         8pPg==
X-Gm-Message-State: AOJu0YxmYAh0WDQkI1ojb/Tju68QQgA5JPZjleS75i8GDGtBwrab/hVN
	cLUn3ZI6/BhPruGsqXvnH516Lg==
X-Google-Smtp-Source: 
 AGHT+IHx3J5ySfw9Wuxosg5Z6sG1PprCJbEmmIZOATHNOQ864gnhC7D7+VS5LClGiArL8V2tqHkKDQ==
X-Received: by 2002:a17:90a:e50c:b0:274:1bb1:415a with SMTP id
 t12-20020a17090ae50c00b002741bb1415amr3509215pjy.41.1695631147932;
        Mon, 25 Sep 2023 01:39:07 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 14-20020a17090a004e00b0025dc5749b4csm10141132pjb.21.2023.09.25.01.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 01:39:07 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v1 1/2] ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S
 support
Date: Mon, 25 Sep 2023 16:38:46 +0800
Message-Id: 
 <20230925083847.1496-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: 
 <20230925083847.1496-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: 
 <20230925083847.1496-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DPH2BTKUFSLRXV56LKRRIWI4ZLJKOA27
X-Message-ID-Hash: DPH2BTKUFSLRXV56LKRRIWI4ZLJKOA27
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:01:59 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DPH2BTKUFSLRXV56LKRRIWI4ZLJKOA27/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatible string "mediatek,mt8188-rt5682" to support new board
with rt5682s codec.
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 43b3b67bdf3b..92da36137270 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - mediatek,mt8188-mt6359-evb
       - mediatek,mt8188-nau8825
+      - mediatek,mt8188-rt5682
 
   audio-routing:
     description:
-- 
2.17.1

