Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2947CFC40
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:15:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA816EA6;
	Thu, 19 Oct 2023 16:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA816EA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724922;
	bh=IPFgMIrp1GSFF3mUIPxfAkL3B0XQKx+ThTYmxS/CacE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EjHBFCoaEba/fEKnx6R7a3/M3JnOgBdbop1EJgTe4GYjwmFryywqnRUIeKiebNvx8
	 qAwQ2Fj+zxtHqo1fJHmH4s1vWjeMknRO26/P5774cvTEVjjqRqesAiqnPGP95ghtnD
	 pUEoFJlGV1smbns59rVmFv+LYV08cHkOINFOoys0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CFA0F8061F; Thu, 19 Oct 2023 16:11:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2264F8057B;
	Thu, 19 Oct 2023 16:11:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D99CF8025F; Thu, 19 Oct 2023 12:03:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61B98F8019B
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 12:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61B98F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=ceZPGX3y
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6cd1918afb2so732635a34.0
        for <alsa-devel@alsa-project.org>;
 Thu, 19 Oct 2023 03:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1697709813; x=1698314613; darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5wsY49uZ0sW2zj7EjCcx/YK/WYmzlSkW4xxNGfJP9+0=;
        b=ceZPGX3yIV+kSQlN7Eg1fRHkH2Xb+BIOlQGJ3o1C5BOZOk23rvixFPq82kCyRQZvzo
         KGYqLl+ADDO0cSl6ydLivKtkHQ7cmxaHdpumnTNUK46Svb3dPu0Kdzz7eq/yWcOsJ/rH
         O2SVTPfqBABmBuRtUI1nFP9/+Ll4/xJWgxBVc8rdxeUrqMzOTGQJmVAbfYY+VnS2Rb/M
         TIWaLs99McYiUHRIIjnTeSOErtmvDVFoDJlDSxKF5i4bvYaOZRj1GJrH7rE1tMT97Yhn
         7j3An75+eECE3ymsUQGLFzDBnyuAe0dx35BT3WodPDDmMkeB0L5i70vr9ewDqp2oq3Cy
         qdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697709813; x=1698314613;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wsY49uZ0sW2zj7EjCcx/YK/WYmzlSkW4xxNGfJP9+0=;
        b=Hy2w2NVdsrqrR9UT1GVUQRv8yuFTII31+MwRSQoJkw3ypKxeyquSLXtgMTXBm91iLL
         tXWSfUUEr0p52upF4CZYdfYM6d4AosZuGFKalwnTTnQlE8pUbPdAwQo1B+9JkNFi2Hxn
         KM6NUhrPBQ4t0QY4LmL2kauf/8JJmIGVhIN1usCECHX6xb1+S4eAwrZztfglGB2swLQk
         mTxC0SHkhGNiAvjm6sDyfUajiTU/NEQRbKRySO5RrSugH6joQF9auaiI6x6qJXm4O6o/
         mkue9v3ycBMEIjSbEd/Rcs1djn+0HrPhlRNWA4DyRg9bUTZl1fg8Z8rX0enUKtXqXJHm
         oEcg==
X-Gm-Message-State: AOJu0YzIQNdGxOMLaeHSRwRTB13s0GRGmkdUI/uzNgDQdW37sfwD1loP
	RxnGpwnYVd5xh3uy1+L363fWcw==
X-Google-Smtp-Source: 
 AGHT+IFRtM1aQjA9L8wQX9Kq28giIwiNpXL5LKBilDP5tSmVfdlclp57rVoPeY14GdZt2QNPKW0YwQ==
X-Received: by 2002:a05:6870:40c7:b0:1b0:3cd4:76d5 with SMTP id
 l7-20020a05687040c700b001b03cd476d5mr2081463oal.37.1697709812589;
        Thu, 19 Oct 2023 03:03:32 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 o9-20020a655209000000b005b46e691108sm2606680pgp.68.2023.10.19.03.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:03:32 -0700 (PDT)
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
Subject: [v2 1/2] ASoC: dt-bindings: mt8186-mt6366-rt1019-rt5682s: add RT5650
 support
Date: Thu, 19 Oct 2023 18:03:21 +0800
Message-Id: 
 <20231019100322.25425-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: 
 <20231019100322.25425-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: 
 <20231019100322.25425-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UQKORP5BR4ZYX5MK2F56VBOZKXABB3G4
X-Message-ID-Hash: UQKORP5BR4ZYX5MK2F56VBOZKXABB3G4
X-Mailman-Approved-At: Thu, 19 Oct 2023 14:11:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQKORP5BR4ZYX5MK2F56VBOZKXABB3G4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new sound card "mt8186_rt5650". RT5650 comes with amp and
earphone codec.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

