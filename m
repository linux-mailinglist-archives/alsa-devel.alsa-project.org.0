Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ED2409F2B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 23:33:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3B2F1797;
	Mon, 13 Sep 2021 23:32:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3B2F1797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631568803;
	bh=T3g2bP3HpqnQvyVwogH85mi6KZdkz2xL5vsVakln8cY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DUKxjWPyEpr+Fjzk/ZKYRHnupuuQikAXhvcOzxCnC0/sOtmxcboH38LpOxcNhI7HD
	 cVugxG9R1INbbQLrrhb8eK6x3DY3/8qzcrgF/k4yopHKpn3SnUmJHXrkvgvYiczaJ9
	 5f9itMo3eCH0/ObTOEZugFWsAikNacyK6bbWVucg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 335BEF802E8;
	Mon, 13 Sep 2021 23:32:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FD8BF8027C; Mon, 13 Sep 2021 23:32:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B58E5F80169
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 23:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B58E5F80169
Received: by mail-ot1-f48.google.com with SMTP id
 a20-20020a0568300b9400b0051b8ca82dfcso15368372otv.3
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 14:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=XnVyvRrK1owG70oj9OBKMWq8slrlkz/+5/c6V4H3/gU=;
 b=RENs5+2lLMT/30G6yPJDTBI+V/i8KMxjl3+lNV0sH6EDC5D2KiaEM4vGySEVHbbfxt
 4GOiJwr155JHZ40qKzkH6vKHtEfgZ17mnoBigXgEs1M0InqGJv1KFRuVslASbj+lyFPw
 YRmEiHApYFRFBuFKMznVQeLTBmYnXmQ2d2eXmtio7SxuU3ugrHRbR4jIJmG1M8dHEljI
 Z0AiDlPmBlrt5u4IHkeG0gxBDaKHg0CvjdaRKbMu0Dgds3hZ0Xvgrz1NfZqtLtmXsSbM
 Gqb9062LCHBjwk45PJs/4ttuVXXnXzppcCHcHy3hr7/3Qx7kkJ17nO+jDT47BKl6N61r
 2WJw==
X-Gm-Message-State: AOAM530C7IIgR3vbeMRstht1k3tkfhKyWAfTbKig+861X0uFNUmDhxqy
 zGDkZ/1L+79RxmYf2uAmqQ==
X-Google-Smtp-Source: ABdhPJyCDct3Ef1sAiH5at31Q3Pw/8cEU7uq1EmCixfb3ChclnbVNePBX4QBllaF2VGBKlennTyL3g==
X-Received: by 2002:a9d:5a89:: with SMTP id w9mr11641935oth.91.1631568716465; 
 Mon, 13 Sep 2021 14:31:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 67sm2142358ota.70.2021.09.13.14.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 14:31:55 -0700 (PDT)
Received: (nullmailer pid 1412997 invoked by uid 1000);
 Mon, 13 Sep 2021 21:31:54 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
In-Reply-To: <1631539062-28577-2-git-send-email-srivasam@codeaurora.org>
References: <1631539062-28577-1-git-send-email-srivasam@codeaurora.org>
 <1631539062-28577-2-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v2 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
Date: Mon, 13 Sep 2021 16:31:54 -0500
Message-Id: <1631568714.639730.1412996.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 plai@codeaurora.org, tiwai@suse.com, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, agross@kernel.org, broonie@kernel.org,
 rohitkr@codeaurora.org, swboyd@chromium.org, bjorn.andersson@linaro.org,
 judyhsiao@chromium.org
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

On Mon, 13 Sep 2021 18:47:41 +0530, Srinivasa Rao Mandadapu wrote:
> Add devicetree bindings documentation file for sc7280 sound card
> registration.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  .../bindings/sound/google,sc7280-herobrine.yaml    | 169 +++++++++++++++++++++
>  1 file changed, 169 insertions(+)
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

See https://patchwork.ozlabs.org/patch/1527380

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

