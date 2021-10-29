Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A315B4404BD
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 23:17:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D19631721;
	Fri, 29 Oct 2021 23:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D19631721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635542224;
	bh=0ol6oDqGVKwqjjJ29Gn2Vp8FIbNfdo5YShmIfe6iflk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sne4mpusfv6GoHRpnnzTasRd4ybEZdmjPuNpxD8demE7niva5Ru+T4eyiPHJ/7rBV
	 YqmdgST1vwMV58SZTKaMMclvRxNhr+pcGALK79THgA1Rk54q5LUb9TEnaaQMdiD9X+
	 9EflpN1Fz6ZiKhgad5K+v5/i9NBniUmF3xLmGyBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5473F8032B;
	Fri, 29 Oct 2021 23:15:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 420A8F8025A; Fri, 29 Oct 2021 23:15:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E801F801EC
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 23:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E801F801EC
Received: by mail-oi1-f181.google.com with SMTP id y207so15149135oia.11
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 14:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Lrv4HMu3pJ4ELKYQ4yExPi3yFrqg0rLji7k8MjNUXdo=;
 b=Z8fuGwR4B8R6Iqy9BzYtYsDViS9aesPPpBr4Y38j3sauSf5URSkBINqt2W+ZYNjZee
 nGo+nXlk2qZb55kO7xEfkqf34ltSE10xZkSrc1o5fLaFCmJRJxjhyLB3tQBYYUWN4vU9
 m1YQOnMpXMsR6UamCAgaUSITVb5pBkZjZWNX/00AZnInzk3Zqq2FtoXsUDFfNEeTH6VI
 Kc+j5dVadRthx2wgSj+/ghjDL9JsegFPUay3aNixdcRt5ZUooOyUgs87NXVaiar1KRDK
 oWLE+N+DQlSH4+PRWJFDuwrQ8mtIcAqk6+qDWk9zMHVx26fQAMwStgeqW2ZrHYIBg+jE
 D9Gg==
X-Gm-Message-State: AOAM5319ST65JTDaTN1FSvMfBAmETl/H4Ee/U+mcnmxeXuwPwkESZC3e
 uIGL0S1EbmGzIH8mJD3Fxg==
X-Google-Smtp-Source: ABdhPJwjB0Kh6gEJISuzMDCDeL6VRh6W0N6NspeRpaWZ/L4c9zigIOszctikcivP1FbgRMi2+kWcQA==
X-Received: by 2002:a05:6808:2127:: with SMTP id
 r39mr4600232oiw.116.1635542111994; 
 Fri, 29 Oct 2021 14:15:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q15sm2163138otk.81.2021.10.29.14.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 14:15:11 -0700 (PDT)
Received: (nullmailer pid 3221282 invoked by uid 1000);
 Fri, 29 Oct 2021 21:15:10 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
In-Reply-To: <1635519876-7112-2-git-send-email-srivasam@codeaurora.org>
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org>
 <1635519876-7112-2-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v4 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
Date: Fri, 29 Oct 2021 16:15:10 -0500
Message-Id: <1635542110.100441.3221281.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 broonie@kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, judyhsiao@chromium.org,
 plai@codeaurora.org
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

On Fri, 29 Oct 2021 20:34:35 +0530, Srinivasa Rao Mandadapu wrote:
> Add devicetree bindings documentation file for sc7280 sound card
> registration.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  .../bindings/sound/google,sc7280-herobrine.yaml    | 170 +++++++++++++++++++++
>  1 file changed, 170 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dts:46.24-25 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1548069

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

