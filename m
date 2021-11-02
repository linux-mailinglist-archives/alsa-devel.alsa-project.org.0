Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2B144379B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 22:00:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC24E1693;
	Tue,  2 Nov 2021 21:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC24E1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635886825;
	bh=zLpClEmfJnwqI8rbzoUQK1l2RL+NvDsEB9KkivRmg0Y=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DP1xCzciLSi3WcAEP0E0b/mi8kHDsefn2VfKEDPBLl7teq9adVEsZQCt/b9PjHL8G
	 xwm7CkoRtX68soe4ecl07LWa57E1K2tDrDbTIErgPnhI4ZlZMmD476hCLPG3Hkq+gL
	 5Cff20vvnLhOCV0ZAzT5veGbIEUQGNDZyk/yg3Bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31B14F800BF;
	Tue,  2 Nov 2021 21:59:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDF25F8025D; Tue,  2 Nov 2021 21:59:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A72C0F80224
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 21:59:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A72C0F80224
Received: by mail-ot1-f45.google.com with SMTP id
 o10-20020a9d718a000000b00554a0fe7ba0so592021otj.11
 for <alsa-devel@alsa-project.org>; Tue, 02 Nov 2021 13:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=X+PbCIBbupD5QlN7dstqXrkneFhSekQ8ud9fjKAPemE=;
 b=14B5nbWexQ/xIbGDwGlhcsfZCip3OQmb4bQpsNNwHn8IJdihKCgMQM3xvkDDwaZUHr
 ML230v75S9PSGZzfqyIeN7ZUPA+tcDlXCfNLVnI3RR7xiUdfU7CtmuiADh/Qo9tMPano
 9J9gPxd9RPQB4fWsEqX3RVByxJUIxeonWA7z1KdVAxkYowIhknCP2+2/dZEii3SIdoP1
 nzWI1Q4VEm7xhPyY4Cu+uit0zpWsRyLq1qZnzySbQrdw6fAPOEiNeK14jY7cGaMRPOQM
 is8yaf2lTqsHCHcZdHMO9nA3jYY3R2Kzbn39pNEsoXaiUKMLbvi4r8JbhIdPTnLSrbXu
 wIKg==
X-Gm-Message-State: AOAM531lR2LjnTT4Mk2ohohDrUpzQM/hJEOQ4zRI7OiVL3KHVNBWOdg+
 iaJmp5cJJhkDbJfmOmEW/Q==
X-Google-Smtp-Source: ABdhPJxd7nHSOxQQYcM1AqgSl5jOlctl2u+Zih91go3saWqDKwRuki9qZYS+68Gyo04l8qmpTPDT3Q==
X-Received: by 2002:a9d:75c2:: with SMTP id c2mr29999973otl.69.1635886738566; 
 Tue, 02 Nov 2021 13:58:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q63sm17699oia.55.2021.11.02.13.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 13:58:58 -0700 (PDT)
Received: (nullmailer pid 3465321 invoked by uid 1000);
 Tue, 02 Nov 2021 20:58:57 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
In-Reply-To: <1635851372-19151-2-git-send-email-srivasam@codeaurora.org>
References: <1635851372-19151-1-git-send-email-srivasam@codeaurora.org>
 <1635851372-19151-2-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v5 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
Date: Tue, 02 Nov 2021 15:58:56 -0500
Message-Id: <1635886737.005870.3465320.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 plai@codeaurora.org, tiwai@suse.com, swboyd@chromium.org, robh+dt@kernel.org,
 broonie@kernel.org, linux-arm-msm@vger.kernel.org, agross@kernel.org,
 rohitkr@codeaurora.org, bjorn.andersson@linaro.org, judyhsiao@chromium.org
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

On Tue, 02 Nov 2021 16:39:31 +0530, Srinivasa Rao Mandadapu wrote:
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

See https://patchwork.ozlabs.org/patch/1549576

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

