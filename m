Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A93A166182E
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Jan 2023 19:32:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49D9EC6A0;
	Sun,  8 Jan 2023 19:31:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49D9EC6A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673202736;
	bh=zGCTIc/usMz1ib2ckuvqIGmkqMHyqYhijXJbiIML8WE=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cH0FTokhFEgT3ZZlvhiQT4cNDcyp/adr9S1gHEuOrlTGGk1mNnD7KtDy4XAaru0AN
	 YP4fsz5qn+tmGIIwdNcnQMP+C7Vr2nIC26JRS4Y9SzM9aKptY5JKVHMTnfw+P7i0OO
	 Hj8CWwVtPNA4EsKJKbeRasYDCE8uFDlPmzEfrVl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8DC8F804C1;
	Sun,  8 Jan 2023 19:31:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B445FF804CA; Sun,  8 Jan 2023 19:31:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29D9DF804BD
 for <alsa-devel@alsa-project.org>; Sun,  8 Jan 2023 19:31:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29D9DF804BD
Received: by mail-il1-f176.google.com with SMTP id u8so3879462ilg.0
 for <alsa-devel@alsa-project.org>; Sun, 08 Jan 2023 10:31:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nXBbO2P+g4sf54JRtHUcYoNVdaz5jhylNXMvr/njs6o=;
 b=68PnvSJl0Lsi1q1FwWe48IwzM1QZ897wlbOKPdgUZPAVfdgbeMjWsmEgp0Yd17WloK
 83LUdz4YsnFS6djt7Mv+jdmihEhr07NNkQmy9CRxFNDfMDoWj3uvSFkjB7ZprbxbteCX
 SoXq14pGpe6hTji1MRavUG/7VDbw9+GYRaXQDOjePYv37H4KTCBjQS1/DGKxesnIFv/F
 cGt4HpjAh/dNyVwvcUhxHrAwGMSZ6Gc5N9M6gflf8XR35E9YaYqcBizcdr4y5MKwsO7d
 poFezkhSHpTSlYHTR4jK/7bhdSmbmp55T6fJH6Bf0GBBv17lossBxp3Xfj00kjtz8z63
 JZ1A==
X-Gm-Message-State: AFqh2ko62Q/nFWFYywF2o3fql7nuKR//NeRrWtQ+oe5u8PPUeYgOcidg
 aYntK7nHszv90QXOSf+h/A==
X-Google-Smtp-Source: AMrXdXugH3E0ejS19Wkv/PJBMkYM23FfNcI74V9Fr5FWS9x0/SUgUUs+79aDicB6uQD5q0iMLDMMbA==
X-Received: by 2002:a92:ce48:0:b0:30c:6616:6fb with SMTP id
 a8-20020a92ce48000000b0030c661606fbmr13768343ilr.2.1673202672349; 
 Sun, 08 Jan 2023 10:31:12 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
 by smtp.gmail.com with ESMTPSA id
 3-20020a056e020ca300b00304ae88ebebsm2104584ilg.88.2023.01.08.10.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 10:31:11 -0800 (PST)
Received: (nullmailer pid 177585 invoked by uid 1000);
 Sun, 08 Jan 2023 18:31:09 -0000
Date: Sun, 8 Jan 2023 12:31:09 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: qcom,lpass-cpu: Correct and
 constrain clocks, interrupts, reg
Message-ID: <167320266826.177510.14546851275083337747.robh@kernel.org>
References: <20221227163135.102559-1-krzysztof.kozlowski@linaro.org>
 <20221227163135.102559-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221227163135.102559-3-krzysztof.kozlowski@linaro.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Bjorn Andersson <andersson@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Tue, 27 Dec 2022 17:31:35 +0100, Krzysztof Kozlowski wrote:
> The binding allowed multiple variations and number of
> reg/interrupts/clocks properties for SC7180 and SC7280.  Maybe this was
> done for different use-cases of LPASS CPU audio node, but DTS is
> supposed to be a complete picture of the hardware.  The upstreamed
> SC7180 and SC7280 DTSes contain the widest set of these
> reg/interrupts/clocks, sometimes being even sum of these different
> variations.
> 
> Correct and narrow the reg, interrupts and clocks to match existing DTS:
> 
>   sc7280-herobrine-evoker-lte.dtb: audio@3987000: clock-names: 'oneOf' conditional failed, one must be fixed:
>     ['aon_cc_audio_hm_h', 'audio_cc_ext_mclk0', 'core_cc_sysnoc_mport_core', 'core_cc_ext_if0_ibit', 'core_cc_ext_if1_ibit',
>      'audio_cc_codec_mem', 'audio_cc_codec_mem0', 'audio_cc_codec_mem1', 'audio_cc_codec_mem2', 'aon_cc_va_mem0'] is too long
>     'core_cc_sysnoc_mport_core' was expected
>     'audio_cc_codec_mem' was expected
>     'audio_cc_codec_mem0' was expected
>     'audio_cc_codec_mem1' was expected
>     'audio_cc_codec_mem2' was expected
>     'aon_cc_va_mem0' was expected
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-cpu.yaml        | 131 +++++++++---------
>  1 file changed, 62 insertions(+), 69 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
