Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 025B040B4A5
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 18:29:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75CAB17F2;
	Tue, 14 Sep 2021 18:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75CAB17F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631636998;
	bh=LcMl8F1cui8ulIsDje1h5Vd08hVPvIiDrvCexyA8vAY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N+aL9QbxftAUXtfg+A1GHUiRaP4ir3+2UBErDtubI8U1DHOf7+0K0X2YxqwEbR2IN
	 jNiMbhu1Fi45LvdXNCg3tM4yFBWC8YZlewYq1jciEyWuMob3Ai39dEICVon76olyvL
	 p3qqRVW9+FMDIVF1x1H4+e8Z/ufx2X6rVpvBzc2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EFFCF80132;
	Tue, 14 Sep 2021 18:28:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61A0EF8025E; Tue, 14 Sep 2021 18:28:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21912F8025A
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 18:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21912F8025A
Received: by mail-ot1-f53.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso19314054ots.5
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 09:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EGgkGkw6sjpqBD+M2iuTf7hL6aaQjfg7s6iVInhPuTI=;
 b=JhKLiT7ZUIGu8UrP/+ECTNg7y7W5IJzQAFwiJi21FTVJySuG97uWUv1Qv40YzSQG60
 F4bZdZBdnXTxnId2fDFEM55+40oiG+Nm2c/STd7FbyfrhEJxfcv5Twl2F5YCQghRklWm
 CRIRvH9+aPmBvYKOe8HcsKFFdb2/MzwOPFyiV8j7A6SNmpTTzdymtQE20aUDrZ3R4AYw
 kDzQ+jR7e5ZnErUEWwWR59QifBQIkKCh8Deo7Hh3IiM40+k8RGLSoapkLZjYG5sotrPl
 6YNw1w6kT2Sr4XVCv8rqa0S0WIuZ3lkwQ1Dfw1JadjvOm/BQk6rzIMTLpSiYhq+7wMRj
 P27w==
X-Gm-Message-State: AOAM531wwp39E60be0Qs9/twSsjHYCDngXn4xZy0klXg/Uf6U9VtpEEC
 YihhYZGjlyKSR4tRAxbiRw==
X-Google-Smtp-Source: ABdhPJy3ZJ+m09nXL1kvp7uKJWNHLNcerOaV/h081xvO0OPhpoqy/g/M0Zq0vXy2vdjD8t2K9qU4oA==
X-Received: by 2002:a9d:6a4b:: with SMTP id h11mr15597285otn.143.1631636903112; 
 Tue, 14 Sep 2021 09:28:23 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e2sm2707323ooh.40.2021.09.14.09.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 09:28:22 -0700 (PDT)
Received: (nullmailer pid 3511648 invoked by uid 1000);
 Tue, 14 Sep 2021 16:28:20 -0000
Date: Tue, 14 Sep 2021 11:28:20 -0500
From: Rob Herring <robh@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: mediatek: mt8192: re-add audio afe
 document
Message-ID: <YUDNpN7bHFpMlRAE@robh.at.kernel.org>
References: <20210914091204.2204278-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914091204.2204278-1-tzungbi@google.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 robh+dt@kernel.org
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

On Tue, 14 Sep 2021 17:12:04 +0800, Tzung-Bi Shih wrote:
> The document was merged as commit 1afc60e00de3 ("dt-bindings:
> mediatek: mt8192: add audio afe document").
> 
> However, [1] revealed that the commit 1afc60e00de3 breaks
> dt_binding_check due to dt-bindings/clock/mt8192-clk.h doesn't
> exist.
> 
> As a temporary fix, commit 7d94ca3c8acd ("ASoC: mt8192: revert
> add audio afe document") reverted commit 1afc60e00de3.
> 
> dt-bindings/clock/mt8192-clk.h is in mainline per commit
> f35f1a23e0e1 ("clk: mediatek: Add dt-bindings of MT8192 clocks").
> Re-adds the document back.
> 
> [1]: https://mailman.alsa-project.org/pipermail/alsa-devel/2020-November/176873.html
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> Changes from v2 (https://mailman.alsa-project.org/pipermail/alsa-devel/2021-August/189058.html):
> - Simplify the commit message.
> 
> Changes from v1 (https://mailman.alsa-project.org/pipermail/alsa-devel/2021-August/189048.html):
> - Add more context to the commit message.
> 
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> 

With the indentation fixed,

Reviewed-by: Rob Herring <robh@kernel.org>
