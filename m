Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 809DE629556
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 11:09:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D7DF167B;
	Tue, 15 Nov 2022 11:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D7DF167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668506975;
	bh=krGGGwc15FaLeZWMJuiTEkYXjFwVeyiPJax1PwMNth8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tglWvWvTioFnvPDWJSDmu7MalJ60Sov359B0M9EvKcX0EMi70a3ByVFlUMAAGZbSZ
	 vLcD1hiJDLzmqBI9UkCIoH2wuFwx6LpW1qHX5t7zpnAt7v4tXGK3s071zTFm7iygld
	 mvEEWvMdt5VGu1iSCPFafl/GE4tSVSh65qXXcVac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D246F8047C;
	Tue, 15 Nov 2022 11:08:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A249CF8016D; Tue, 15 Nov 2022 11:08:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44CEBF800B5
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 11:08:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44CEBF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Dnj8nhpo"
Received: by mail-lj1-x231.google.com with SMTP id s24so16843710ljs.11
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 02:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v3DsWZVFtpbNXGTShfit8HHPANHhrxpo6GXZ45P9FAU=;
 b=Dnj8nhpo4s+HBeOM6JtnrL67Ep6BF1AgY+/Vq30lGxgLBb0Z02neWQsvr/u98Q+3ik
 LIszYHiaYhfqR1tEjcnxAzpFhNAEbXGETkMRqaxKgXxSwuhrcIpVD0zEmGObvNzX8Y2t
 CH/lUtm4HP6j/h5ocNPVhZGKU7wS2JDE451lydlS2zJoJ07853s7VCI7IVtc4G3pcaAR
 ib3cX4pESLFVTA7Ucy7knn2jcejRdxrz1DdHKnqDoe+fJ7CG20bvgIf8UKb5AB7Eac5N
 VzDk+W9hcM7AP60OTeGEy6M9M7JXu1JUvsUeX6STmTfSpUd5F2eu0KZNdx0ogKvXO+3A
 UxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v3DsWZVFtpbNXGTShfit8HHPANHhrxpo6GXZ45P9FAU=;
 b=QkMa6W2jI33z4KYHCbI02DApoIjzYZq8s1YJ0te3oXdZ6T4UeKWuzbk8f8HG+sQVmH
 LE3qPL6IfpivnmI0PpwimOXfq/3jPj0f9iREtqU0sqtTNi1OTkpkIZtepnFE1FguDpyX
 26Zi5+wKpAwQjRLMKOdQhDNIjj+FAZlAJfCm0j5M0fRruVKadFAJbleV9lVF9qyvMyO7
 HOQXnlqqQ+Knhq9zIc4KXA9Ta8EsSx1FUqJNWQ9x36qb7wV9DUbYK4GBzW9HN8gijWcr
 Y41J/hxm3pJDx9CW/on02fPwjRorJXNPVVotFVAfL9e0ES2vpjWA8Iaqa6RiCw9lwL/v
 HXRg==
X-Gm-Message-State: ANoB5pk8B3s7GWmkr7tXmlt08t+mRD61zVqhPNVvbL3B3GU4egQo6rK5
 v+SstHE/Lvkp/eSoRNDLxkNWjA==
X-Google-Smtp-Source: AA0mqf5IWhBna+1xbnMchpIHew5YfB67mohXGmtSjbI2iriY2BYeGntWSDThzr/wjCKr2d5A3CVE2g==
X-Received: by 2002:a2e:a553:0:b0:277:3ca2:dacc with SMTP id
 e19-20020a2ea553000000b002773ca2daccmr5234109ljn.121.1668506910950; 
 Tue, 15 Nov 2022 02:08:30 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a056512200b00b004b257fef958sm2165641lfb.94.2022.11.15.02.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 02:08:30 -0800 (PST)
Message-ID: <2e4224e8-fb03-7316-92df-c6654755aa9b@linaro.org>
Date: Tue, 15 Nov 2022 11:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V4 5/6] ASoC: dt-bindings: Add schema for "awinic, aw883xx"
Content-Language: en-US
To: wangweidong.a@awinic.com, broonie@kernel.org, perex@perex.cz,
 alsa-devel@alsa-project.org, tiwai@suse.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, quic_potturu@quicinc.com,
 pierre-louis.bossart@linux.intel.com, cy_huang@richtek.com
References: <1668165992-6493-2-git-send-email-wangweidong.a@awinic.com>
 <20221115022423.6437-1-wangweidong.a@awinic.com>
 <20221115022423.6437-6-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115022423.6437-6-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: duanyibo@awinic.com, yijiangtao@awinic.com, zhangjianming@awinic.com,
 zhaolei@awinic.com, liweilei@awinic.com
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

On 15/11/2022 03:24, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
> controlled using I2C.
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  .../bindings/sound/awinic,aw883xx.yaml        | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> new file mode 100644
> index 000000000000..04cdcf25a6d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/awinic,aw883xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Awinic AW883xx Smart Audio Amplifier
> +
> +maintainers:
> +  - Stephan Gerhold <stephan@gerhold.net>
> +
> +description:
> +  The Awinic AW883XX is an I2S/TDM input, high efficiency
> +  digital Smart K audio amplifier with an integrated 10.25V
> +  smart boost convert.
> +
> +allOf:
> +  - $ref: name-prefix.yaml#
> +
> +properties:
> +  compatible:
> +    const: awinic,aw883xx_smartpa
> +
> +  reg:
> +    description:
> +      The I2C address of the device for I2C

What happened here? This was not present before. Drop description.

> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      Reset pin of aw883xx chip

The same case. Drop description.

I commented only for irq-gpios that they need description.

> +    maxItems: 1
> +
> +  sound-channel:
> +    description:
> +      Number of sound channels of the aw883xx chip

Your description does not explain me much. Number of supported sound
channels is usually fixed in the hardware, thus coming from compatible.
Therefore this might mean something else... but anyway your driver does
not use it really, so just drop it.


Best regards,
Krzysztof

