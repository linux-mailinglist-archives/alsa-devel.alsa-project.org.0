Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D47CA33DB9F
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 18:56:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A59618F1;
	Tue, 16 Mar 2021 18:55:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A59618F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615917362;
	bh=NPprGX8BJ4tQnxGo72qZi23hyb1ValoJ4BM1yd9cnM0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=myKUaK4+4Z3viGUA256rQNPIqhVQDB4ErvdJCl+YOxV42bW6xwRCVr/u0c7PaoirO
	 2pllTKiwKgYJmjzkB80XXjGgrB3xDFC7ua87rzhi1vXfXdiKR/I7lv/RfZ0tvLcJY5
	 QmDVRSdnXaqf8tV7aOvbI8dVrdu8k7nU2XCEsZOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17720F80148;
	Tue, 16 Mar 2021 18:54:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ABAFF80163; Tue, 16 Mar 2021 18:54:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BB4EF80148
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 18:54:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BB4EF80148
Received: by mail-il1-f169.google.com with SMTP id p10so13530087ils.9
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 10:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=+kI9PWgxxjp5TX4kZseCNqfbTJcpurWf3Z5A5Al1nrg=;
 b=aMMzTuLS8Z8FDQT4CfNjbyA4SFLyflw7FVR9oPmw7iLPSuQD2S909pC4iyW3AZKssL
 tAo8NHYaBpukh2Dt6XrJ4v3l/3Tvz1j/QUTcCKYUN4IRMyzHJibOeecAvbHLZB/wWApG
 UcjG6ndvY1c8YhjqeZWjGCkDW37SUfCkAFaCzbf1TO55nM3CRU2t/EF3NygVEjSFfUuP
 Z8R650nHwdv4fNTYluK1VdH/K0bf9WsQwgExcVuRxL8Cc+R05jCW+nFqEINbUxgyG7Dz
 KEYs8GgigrppJtgItSYdmibsglEzf6mhgc1wQTQuFQLvE52jzrY1mph5+l9PhXPNWt7K
 iqyQ==
X-Gm-Message-State: AOAM531HKvYFcwF+2A70awxkUVEFAmxVji+UCh+HLJYGlYiGbdFrgNC9
 mhP6mOOvGgnb9gcZHyKbqg==
X-Google-Smtp-Source: ABdhPJzj4jwke+G26mZFGHSOiXxtNewCW2IJj+QfJpWnFbUQSSzi2iviqzwbAWxsbu9ZU1nAgGlJbQ==
X-Received: by 2002:a05:6e02:b25:: with SMTP id
 e5mr4852271ilu.119.1615917261431; 
 Tue, 16 Mar 2021 10:54:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id h128sm8978507ioa.32.2021.03.16.10.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 10:54:21 -0700 (PDT)
Received: (nullmailer pid 3326127 invoked by uid 1000);
 Tue, 16 Mar 2021 17:54:09 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20210316105828.16436-2-srinivas.kandagatla@linaro.org>
References: <20210316105828.16436-1-srinivas.kandagatla@linaro.org>
 <20210316105828.16436-2-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/7] ASoC: dt-bindings: wcd938x: add bindings for
 wcd938x
Date: Tue, 16 Mar 2021 11:54:09 -0600
Message-Id: <1615917249.257390.3326126.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

On Tue, 16 Mar 2021 10:58:22 +0000, Srinivas Kandagatla wrote:
> Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
> connected over SoundWire. This device has two SoundWire device RX and
> TX respectively, supporting 4 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
> 7 x TX diff inputs, 8 DMICs, MBHC.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,wcd938x.yaml          | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml: properties:qcom,mbhc-vthreshold-microvolt: 'anyOf' conditional failed, one must be fixed:
	'$ref' is not one of ['maxItems', 'description', 'deprecated']
	'minItems' is not one of ['maxItems', 'description', 'deprecated']
	Additional properties are not allowed ('$ref' was unexpected)
	'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref']
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref']
	1 was expected
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml: ignoring, error in schema: properties: qcom,mbhc-vthreshold-microvolt
warning: no schema found in file: ./Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml

See https://patchwork.ozlabs.org/patch/1453827

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

