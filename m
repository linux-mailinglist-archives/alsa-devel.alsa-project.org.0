Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB10623578
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 22:10:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8F2A163C;
	Wed,  9 Nov 2022 22:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8F2A163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668028244;
	bh=YNM7WwaeawogLz2B6INoqKNV8T7ZO7gltvl8gH4SDxo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cDbLigh0aD3DBvbNlPXhzvmiF0ndkxQsL89O/xZj+y8OVVTwmTOhBG7rIZOm90r+B
	 895JgwHE1KcueloXEGirMb97/+JY0L8ZWqmaDgpARweI8vDMtgfMhdkl4SWQEiSxcf
	 bwE/j5qTRg1rqWHFTBHkcTf3Tk1lku8cXD3UWtZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38ABFF80559;
	Wed,  9 Nov 2022 22:09:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 429CBF8023B; Wed,  9 Nov 2022 22:09:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A891BF800EC
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 22:09:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A891BF800EC
Received: by mail-oi1-f178.google.com with SMTP id s206so20205661oie.3
 for <alsa-devel@alsa-project.org>; Wed, 09 Nov 2022 13:09:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3JK7iAPYbPLR42yscRzAFOhzDf8fswRFehByP99Ej2k=;
 b=MKhYy1uASX0qX4e6QnNztwZ46yL4f4zr3QiDRW9Qrs6bMo3PJSoGbOUT6qWqNdGRjN
 V8yoaVydol8LUe67jbzF+0mpxATS0tkh3SmwvJ0+5qq0TrPe48j6xf2utP1saqAxMjNl
 QaebTHmokbeSGjp9unZilr3+GVbknE7jZKAwEBBB/ASrFnseFPWIgZDySBA3J3fCnAyU
 y22awxc8H7uO4juMNHxvrOp5tdXo0jmQzBtnd3cV8Yzt+EBHn05EEB/sKGbZVaqM5sNw
 pNX0Yus69jnHywxICpV/RIgA/NCHaJ0VoxQBBSn7dEBsWz4kCEcWfDPpuMEb5GOHWQeH
 tXUw==
X-Gm-Message-State: ACrzQf30wcxJM9iterbobudaQ7nYJI89NT8ZB5NStYXG2kcJg022ci5B
 qj132V/Q5a/8YeQiNLGfyA==
X-Google-Smtp-Source: AMsMyM4226V1B9Bim9hiyYeb6rDAaHwH3K5mNu+jN4Zyeeyhhcguqx9bi8mkRs06U2LeKMBT4m+sHA==
X-Received: by 2002:a05:6808:f8f:b0:35a:6eed:42f with SMTP id
 o15-20020a0568080f8f00b0035a6eed042fmr12756467oiw.192.1668028154584; 
 Wed, 09 Nov 2022 13:09:14 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o30-20020a056870911e00b0012779ba00fesm6657392oae.2.2022.11.09.13.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 13:09:14 -0800 (PST)
Received: (nullmailer pid 2868048 invoked by uid 1000);
 Wed, 09 Nov 2022 21:09:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20221109165331.29332-5-rf@opensource.cirrus.com>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
 <20221109165331.29332-5-rf@opensource.cirrus.com>
Message-Id: <166802788390.2833223.7991217464686925936.robh@kernel.org>
Subject: Re: [PATCH 04/12] dt-bindings: pinctrl: Add Cirrus Logic CS48L31/32/33
Date: Wed, 09 Nov 2022 15:09:10 -0600
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linus.walleij@linaro.org, lee@kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, maz@kernel.org,
 tglx@linutronix.de
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


On Wed, 09 Nov 2022 16:53:23 +0000, Richard Fitzgerald wrote:
> Codecs in this family have multiple digital I/O functions for audio,
> DSP subsystem, GPIO and various special functions. All muxable pins
> are selectable as either a GPIO or one of the available alternate
> functions.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  .../bindings/pinctrl/cirrus,cs48l32.yaml      | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.yaml:14:1: [error] syntax error: could not find expected ':' (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.example.dts'
Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.yaml:14:1: could not find expected ':'
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.yaml:14:1: could not find expected ':'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.yaml: ignoring, error parsing file
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):
Documentation/devicetree/bindings/pinctrl/cirrus,cs48l32.yaml: Documentation/devicetree/bindings/mfd/cirrus,cs48l32.yaml

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

