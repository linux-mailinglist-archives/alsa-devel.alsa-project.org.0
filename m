Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EADCE3A0554
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 22:52:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FA1916D8;
	Tue,  8 Jun 2021 22:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FA1916D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623185572;
	bh=HlISz/6wVsEzQRRdwwTxX2g+2gHxVQw9vWLIsTOoQ6M=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xb/ptW57ZMrgeiSdtdHCZHgXHUjyJE7iR0kcAYG8vBN9C2b8ZXGDYn78Mav896c4y
	 CtLUJSBae+5kNElHxsFbk4CLX7C1/+fcmBLS1iTQyVuXkYaeiiTm25oFpVsdMnVVMv
	 /29Lzf2OTQPaf2N7QoL9Ohsx+o1CkMjDE8Zv6y6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64637F804AC;
	Tue,  8 Jun 2021 22:51:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AADA0F801EC; Tue,  8 Jun 2021 22:51:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94B9FF801EC
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 22:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94B9FF801EC
Received: by mail-ot1-f48.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso21664748otu.10
 for <alsa-devel@alsa-project.org>; Tue, 08 Jun 2021 13:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=i5ca9j8lK8pgPSfrs5VSvC3JrrRJ8T082ZN3VrHz6Dk=;
 b=ihvSz9NZSqizZthop+vYKYu1H3/YFwBqSkvQDJ8/3nRCjNuT0lHKOgMnAy0Hj0r1Sm
 L9VvHRhOwyKPjzPzK6ioEYQPl3lRhj0z/KZToWHzabfehkQwucd5LkEJ1WWOikARDY+N
 YUbwb7sPyXMQp5/pAWT4rjNegsEEEZ2bUVZA35cbTwVI9jcPu9vzd9Vld+gvGoy210CR
 1pxl8gIuERUv9JZbsvlSKUM/pDtB8kHml7vr26R15hfEh04p83LxpOlGTcrdNGfKYpru
 XGAueYCtsTYA301yRaRV/XzhKzY1vYnV9gAfIbjlsqxm6sOGAN3ddwlmEWCpacrjeY2z
 gCuw==
X-Gm-Message-State: AOAM531/dpb9IYQaVYms8l9JpbP2p0vB+OaLLK7JkZTKKHR2UvMPaRiw
 izCwtBR7bvJg63pqlieTug==
X-Google-Smtp-Source: ABdhPJzxxcXmbBy9S9nq+NtNfhNl9dfkw8KfDjwV+1IBzsnUPC7075IUdOvwQSgV/Hjs1h1CM3uMYg==
X-Received: by 2002:a05:6830:1196:: with SMTP id
 u22mr19182854otq.247.1623185461539; 
 Tue, 08 Jun 2021 13:51:01 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l128sm3033425oif.16.2021.06.08.13.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 13:51:01 -0700 (PDT)
Received: (nullmailer pid 1556864 invoked by uid 1000);
 Tue, 08 Jun 2021 20:50:56 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20210607152836.17154-13-srinivas.kandagatla@linaro.org>
References: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
 <20210607152836.17154-13-srinivas.kandagatla@linaro.org>
Subject: Re: [RFC PATCH 12/13] ASoC: qcom: dt-bindings: add audioreach
 soundcard compatibles
Date: Tue, 08 Jun 2021 15:50:56 -0500
Message-Id: <1623185456.805853.1556863.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 plai@codeaurora.org, lgirdwood@gmail.com, bjorn.andersson@linaro.org,
 broonie@kernel.org
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

On Mon, 07 Jun 2021 16:28:35 +0100, Srinivas Kandagatla wrote:
> Add compatible strings for AudioReach DSP firmware based soundcards.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,sm8250.yaml           | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:116:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6apm.h:5: warning: "MSM_FRONTEND_DAI_MULTIMEDIA1" redefined
    5 | #define MSM_FRONTEND_DAI_MULTIMEDIA1 1
      | 
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:20:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6asm.h:5: note: this is the location of the previous definition
    5 | #define MSM_FRONTEND_DAI_MULTIMEDIA1 0
      | 
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:116:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6apm.h:6: warning: "MSM_FRONTEND_DAI_MULTIMEDIA2" redefined
    6 | #define MSM_FRONTEND_DAI_MULTIMEDIA2 2
      | 
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:20:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6asm.h:6: note: this is the location of the previous definition
    6 | #define MSM_FRONTEND_DAI_MULTIMEDIA2 1
      | 
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:116:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6apm.h:7: warning: "MSM_FRONTEND_DAI_MULTIMEDIA3" redefined
    7 | #define MSM_FRONTEND_DAI_MULTIMEDIA3 3
      | 
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:20:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6asm.h:7: note: this is the location of the previous definition
    7 | #define MSM_FRONTEND_DAI_MULTIMEDIA3 2
      | 
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:116:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6apm.h:8: warning: "MSM_FRONTEND_DAI_MULTIMEDIA4" redefined
    8 | #define MSM_FRONTEND_DAI_MULTIMEDIA4 4
      | 
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:20:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6asm.h:8: note: this is the location of the previous definition
    8 | #define MSM_FRONTEND_DAI_MULTIMEDIA4 3
      | 
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:116:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6apm.h:9: warning: "MSM_FRONTEND_DAI_MULTIMEDIA5" redefined
    9 | #define MSM_FRONTEND_DAI_MULTIMEDIA5 5
      | 
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:20:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6asm.h:9: note: this is the location of the previous definition
    9 | #define MSM_FRONTEND_DAI_MULTIMEDIA5 4
      | 
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:116:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6apm.h:10: warning: "MSM_FRONTEND_DAI_MULTIMEDIA6" redefined
   10 | #define MSM_FRONTEND_DAI_MULTIMEDIA6 6
      | 
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:20:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6asm.h:10: note: this is the location of the previous definition
   10 | #define MSM_FRONTEND_DAI_MULTIMEDIA6 5
      | 
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:116:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6apm.h:11: warning: "MSM_FRONTEND_DAI_MULTIMEDIA7" redefined
   11 | #define MSM_FRONTEND_DAI_MULTIMEDIA7 7
      | 
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:20:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6asm.h:11: note: this is the location of the previous definition
   11 | #define MSM_FRONTEND_DAI_MULTIMEDIA7 6
      | 
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:116:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6apm.h:12: warning: "MSM_FRONTEND_DAI_MULTIMEDIA8" redefined
   12 | #define MSM_FRONTEND_DAI_MULTIMEDIA8 8
      | 
In file included from Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:20:
./scripts/dtc/include-prefixes/dt-bindings/sound/qcom,q6asm.h:12: note: this is the location of the previous definition
   12 | #define MSM_FRONTEND_DAI_MULTIMEDIA8 7
      | 
Error: Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:154.5-6 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1488759

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

