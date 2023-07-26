Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17392762F01
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 10:01:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A3057F4;
	Wed, 26 Jul 2023 10:01:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A3057F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690358510;
	bh=wnGTcF05GhLGa2Lq/PkYkmIXWvLVUZRJ7AocCs+7P7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fTE6QERJLkjYuU8ej6srdGYkVM3mlIh7cg3eDtd5UepJL1MOgBuGrr3Zu9JXTgr/P
	 DdkId5Ptd7rAEzffiieci0iAK3LFcz9lUxd/I80luvR7p2fYBk+RiJhnnOuMo6nd+1
	 YINhToRdnQc40BBAZ3gN8uZdvRbb051IcdVRDKDU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8793F802E8; Wed, 26 Jul 2023 10:00:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40F6EF80153;
	Wed, 26 Jul 2023 10:00:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 894C0F8019B; Wed, 26 Jul 2023 10:00:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61FE5F800C7
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 10:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61FE5F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=O0IeSms8
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99b78fda9a8so746813566b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 26 Jul 2023 01:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690358444; x=1690963244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gBi4DXkLkJk2Dg/EkHSHB5+DOP2xfu33PAuJukEQqto=;
        b=O0IeSms8+KrpFhWEWODiOcZPWu7XE/w7h3JOelgJ1u+V9ps8nlSF+lr+InbxFPs6XS
         5nvks7NbBBTFP2kfFdwkLuFRlzvMd5WpBYuvWxZs2FPikTsRGX8CgpzMGrq3SDbW7/g/
         cb+kDdUrgtqK7QEaDferyxoNRuu6OLW4vYujM9WN1+AXTaRlt0rsTDFZ4cTizKHLpNbg
         4HMoyv718YERB/ONenjnlfdCd643YpVN60h2L5dy7AEfdiVG9B/NQhfXXeQe3dhMQXGU
         MnlajdbDA63LmK4GWKRGcGxHSTIuhETxZ2M/Olf28mMWyJuJzV7koTwGJAWHtWb71u2i
         9+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690358444; x=1690963244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gBi4DXkLkJk2Dg/EkHSHB5+DOP2xfu33PAuJukEQqto=;
        b=WmyK8+IHVS5KEUyisqaHF8rdepiKsfq9SCxKcooyBYP5sTr3+3M4Fd/g1K4oAs/94f
         zaFIKBFgrSkwvaQwmDrygTXkcfyvc956qLJbuGbf7hpA1GC1HNpqlht8TozljxOsfcG1
         ivPZEmiZigD70mOqYyFTWP9LtyAZSPzBIqk1QTsNdKdC8NPwvKH7wrjkT3h0GyTGPUgK
         LZkJX1ozJJUpU85ZtFZsk5J860wWUXETPfPCkcCTaJo7A97IzbzxG/YJ815X/vy63Hsw
         c/fn7pitxTtHsZ0CvEWoEsZ4sb29WeJn3SCXrawA1G3RE/zJiiwL61vQgwT+685+yK0K
         N2Ow==
X-Gm-Message-State: ABy/qLa/Mk7XqnJtFMWABTrh4FmxE+K97WqMMNJOWGfotce67gJD4xtM
	jbGUMbew3Y9Vr4xzj4p1aiLPRA==
X-Google-Smtp-Source: 
 APBJJlEy6J8EY+FQdZGq40ZDRrTuULzJoDlHK38119KLstNODFT2nRCtqILtEmSUP2tSfvA4Ge7tJg==
X-Received: by 2002:a17:906:7795:b0:991:c9da:70da with SMTP id
 s21-20020a170906779500b00991c9da70damr1212478ejm.61.1690358444448;
        Wed, 26 Jul 2023 01:00:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 si1-20020a170906cec100b00992d70f8078sm9302120ejb.106.2023.07.26.01.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 01:00:44 -0700 (PDT)
Message-ID: <b030ce33-afd1-7b11-db38-7d48f81690d6@linaro.org>
Date: Wed, 26 Jul 2023 10:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 23/32] ASoC: dt-bindings: Add Q6USB backend bindings
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_jackp@quicinc.com, pierre-louis.bossart@linux.intel.com,
 oneukum@suse.com, albertccwang@google.com, o-takashi@sakamocchi.jp
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-24-quic_wcheng@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230725023416.11205-24-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CHOGUSEAFYPK6TWQQ7DLG6FTJ7U3N4GR
X-Message-ID-Hash: CHOGUSEAFYPK6TWQQ7DLG6FTJ7U3N4GR
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CHOGUSEAFYPK6TWQQ7DLG6FTJ7U3N4GR/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/07/2023 04:34, Wesley Cheng wrote:
> Add a dt-binding to describe the definition of enabling the Q6 USB backend
> device for audio offloading.  The node carries information, which is passed
> along to the QC USB SND class driver counterpart.  These parameters will be
> utilized during QMI stream enable requests.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.

> ---
>  .../bindings/sound/qcom,q6usb-dais.yaml       | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> new file mode 100644
> index 000000000000..77bc9b4c3c90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,q6usb-dais.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm ASoC DPCM USB backend DAI
> +
> +maintainers:
> +  - Wesley Cheng <quic_wcheng@quicinc.com>
> +
> +description:
> +  The USB port is a supported AFE path on the Q6 DSP.  This ASoC DPCM
> +  backend DAI driver will communicate the required settings to the QC USB SND
> +  class driver for properly enabling the audio stream.  Parameters defined
> +  under this node will carry settings, which will be passed along during
> +  the QMI stream enable request.

You still refer to the drivers. I said this should be rephrased and you
confirmed that "driver" here means Linux. If you are adding bindings for
Linux drivers, then it won't work. Bindings are for hardware.


Also, missing $ref to dai-common.yaml


> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,q6usb
> +


Best regards,
Krzysztof

