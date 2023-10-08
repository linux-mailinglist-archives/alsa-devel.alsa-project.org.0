Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6A07BE5AB
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 17:59:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EEBBE75;
	Mon,  9 Oct 2023 17:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EEBBE75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696867152;
	bh=JIQkC+0Be4DVYZ+uaLpvlmzAMgNRpGBFxiIdL+YbT3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lQCyUJXugoDUaTrGUzDSIqERWCYtCKgYgjQTgzzehljATUwxjQoOIbxd6b7ZqYgVN
	 XkslR/f3e4pTdIpCBPcfMFnwoAJhOzahboKc72VGJy6TN2vANDT8oKfMk0sr3G1U6b
	 BrBtemfnOuiGS1thyrV3UqXJbcILrbw0I91bSqec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BBFAF8057D; Mon,  9 Oct 2023 17:57:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D58EEF80564;
	Mon,  9 Oct 2023 17:57:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0AF2F80310; Sun,  8 Oct 2023 03:46:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CDCDF8027B
	for <alsa-devel@alsa-project.org>; Sun,  8 Oct 2023 03:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CDCDF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=Hbv186f6
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-692d2e8c003so3345491b3a.1
        for <alsa-devel@alsa-project.org>;
 Sat, 07 Oct 2023 18:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1696729604; x=1697334404; darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AnkYs5/BG/9GOQBaCWwWyOfl1fNQBQrw4AiO+6MYmI8=;
        b=Hbv186f6hpze7KMR3CtdlC66NJf0PrsM+WJe9wbwNOVtk2zn9SoOUIGGHA+dvLkV82
         +pEZZ56M3Nwr0JSry11MNgw+SWUL4GlbsehbpaNgB64EDe0Zt0PXNjcY5G364yPAE4Wj
         o/rMnbkv07YabTDeS8wn6zHfsOB4J5tavIvRq8uHVp+pzryEws0ttDTtLwF60DT0IuhB
         EDXPnOWc74V6VxhaBj33MMl9XTUPP5P7PiMUXymrzIJGmphA+PMlsB3ciFhMm+FHSqsj
         Hj/HSRs+SzC2YWp3DSi+rp0y48Xyitz5ZjwyQwmP7fjVSoqMdIEpJSeIddQG8+dO9RR6
         w4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696729604; x=1697334404;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnkYs5/BG/9GOQBaCWwWyOfl1fNQBQrw4AiO+6MYmI8=;
        b=Vs1/sc+WjTvu0gosfHtX5uUZBcsquVDHkNOzB7kWA7cwfxGCT/pjaCbcCj62UKYCJx
         zvLqYokg76WyWrewBDd5y7kzPwWbw+MG6JozWWGuUxxKGOBwpxT2KvDe9tlyK9g1E4rU
         bOKqBtVzCQrjtpInfeXph0A2KzoQ+qYfrgfn4H6PnP5l9y7reEC/kJner0173A6OqJXg
         3AVtVWd2XQIlf75mmOKrK7ZrPv2UE61xY9bJQniZ2KHjgTh1+xj7BRZSet9kvGXsT8tJ
         cHELnqAkP2otnaKTGft+EazHHu+3qRO2viQBp0u/X3E1Kx5rLzbPmxRRKgak2Ec1++Xo
         lXsg==
X-Gm-Message-State: AOJu0YwBt6w8MJFLf9KnYZOtb0clXf2PBhyYY3WRl6fMetBZGS0EvIpU
	4VUwE5HJM9r7MJHy5zr/g1joOg==
X-Google-Smtp-Source: 
 AGHT+IGWr16rliwrfcLVvoGiO2V3+fKoKVyKcsYrbchWrREpwol8Erq4V6J5un5az6Bk51HfqHF5TA==
X-Received: by 2002:a05:6a20:8425:b0:135:bf8d:b758 with SMTP id
 c37-20020a056a20842500b00135bf8db758mr13343502pzd.16.1696729603504;
        Sat, 07 Oct 2023 18:46:43 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 v1-20020a63bf01000000b00563826c66eesm4888846pgf.61.2023.10.07.18.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 18:46:43 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	robh+dt@kernel.org,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	maso.huang@mediatek.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v4 1/2] ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S
 support
Date: Sun,  8 Oct 2023 09:46:28 +0800
Message-Id: 
 <20231008014629.4971-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: 
 <20231008014629.4971-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: 
 <20231008014629.4971-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: P7U3VTKRSOT4H5VFTXD5QCDRRTUJ24N2
X-Message-ID-Hash: P7U3VTKRSOT4H5VFTXD5QCDRRTUJ24N2
X-Mailman-Approved-At: Mon, 09 Oct 2023 15:57:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7U3VTKRSOT4H5VFTXD5QCDRRTUJ24N2/>
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

