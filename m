Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F554424684
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 21:09:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC978822;
	Wed,  6 Oct 2021 21:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC978822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633547391;
	bh=5vtrxa2ZSZI/xltxgb+4xsUMcvv8Ge9zP/BPBICVw6o=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DjCY8Lyx1t6ObL7cVRb9TsRx5NS7mZRBWG86oq1f0Y3ot9wQ/g+UttJH5EONew3x+
	 K7YSDUshiSAC/4U39rTjdqG+tPz38ngQID+E579Eefyzp/mtOFscQfRESn1Hvb5upF
	 +SNwAU6FZwaYFCzkEkOEhKuQkor9wPezq1H8v3ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65D81F8020D;
	Wed,  6 Oct 2021 21:08:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EACDF80240; Wed,  6 Oct 2021 21:08:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE222F8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 21:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE222F8010B
Received: by mail-ot1-f53.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so4425119otx.3
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 12:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=UtwrzsrYrexw7egYl4wU8hBbEuUQZK7E7w2jgOhW2FY=;
 b=ZYhwymEZOTou3K11t/PzPcoo3Ln7vFjcka6R3HGCxT/PEFJilyxhmx72nVpccbA9sy
 aYCFetxmJqZ2kswueyOmYvyj/oVMTebW4oLzRCVZNjFl7v608UVkr893BVQl22KvEpgu
 NctXXaYqXX8CQ4erw0GlQaG0fO3WLduBuwRqeO5V42KXW3YKlw5BF68yR1YHHiRhhk3v
 DPUZHpDdYNdzSZGPQ7fPyVhtkOhb+YXf+5G9hUaT8rO5J+c79oHQReGvGFWpq+VpJ8/v
 lXxaz1kiJ18561CK9bwKCZiY62BaNrfYkxuxnANn0i5KhdA37gIHEYju97dwlzdW4XdX
 cD6g==
X-Gm-Message-State: AOAM531Fx0/JXhYPzBb+qoOauj2QX3LbYIfXe+S+vShyztoa37pZCHiw
 JdLjzUOn/vdws7N7SfG1Hg==
X-Google-Smtp-Source: ABdhPJzCcOPOOJdCjqSevCGuw5AOGRSNXRgCFkbO/1DpFLBrPrHrCVeoHRNZya0eH6wzs4sJ3fSSQw==
X-Received: by 2002:a9d:4702:: with SMTP id a2mr347403otf.271.1633547297462;
 Wed, 06 Oct 2021 12:08:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q39sm268643oiw.47.2021.10.06.12.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:08:16 -0700 (PDT)
Received: (nullmailer pid 2218064 invoked by uid 1000);
 Wed, 06 Oct 2021 19:08:13 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20211006113950.10782-9-srinivas.kandagatla@linaro.org>
References: <20211006113950.10782-1-srinivas.kandagatla@linaro.org>
 <20211006113950.10782-9-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v9 08/17] ASoC: dt-bindings: add q6apm digital audio
 stream bindings
Date: Wed, 06 Oct 2021 14:08:13 -0500
Message-Id: <1633547293.527218.2218062.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 bjorn.andersson@linaro.org
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

On Wed, 06 Oct 2021 12:39:41 +0100, Srinivas Kandagatla wrote:
> On AudioReach audio Framework, Audio Streams (PCM/Compressed) are managed by
> Q6APM(Audio Process Manager) service. This patch adds bindings for this DAIs
> exposed by the DSP.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/sound/qcom,q6apm-dai.yaml        | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/qcom,q6apm-dai.example.dts:19:18: fatal error: dt-bindings/soc/qcom,gpr.h: No such file or directory
   19 |         #include <dt-bindings/soc/qcom,gpr.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/sound/qcom,q6apm-dai.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1537089

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

