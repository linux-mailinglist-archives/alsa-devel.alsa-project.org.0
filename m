Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F41FE654130
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 13:42:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B4FC4255;
	Thu, 22 Dec 2022 13:41:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B4FC4255
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671712966;
	bh=nXfPIHEyivtXUbYcR13q++Ubes22Vse23vQhKAd2ufU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XfLwJzwWINLwESqpybK/UUEgjwlFl3SoUWI+Bd2B+v/OvyGF+fko9F9orXZwEkva3
	 eaamoIOBQE3YfTuJT3kd2WEVJ3uZ1btZer9fUvYPmMfX1kqHFfPdjCdo3LGxqQm8Z+
	 Nh50/mUTfFjbuYXtpG+t3/33F9n33/g8xxXZ7R1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 241BFF8024D;
	Thu, 22 Dec 2022 13:41:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00155F8026D; Thu, 22 Dec 2022 13:41:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4D66F8024D
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 13:41:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4D66F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=E7YDzpOw
Received: by mail-lj1-x22f.google.com with SMTP id g14so1747628ljh.10
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 04:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0RC77huOuZ1tL4G8TsG8hVc4JWG5AumcDRtuYq9SLKc=;
 b=E7YDzpOwi6G6CgOH+oI5odto7tZlUB+aKr5uh5nxFX5mSEYqom+cJvHx6y5XQTOs2F
 DFgoASkAQbIHRd33qAk5J7VYNKnjq8XNTbPN9BFNVO+q51I3jKXRyycsMqNqEL5klQWz
 uxMc8Rud2W/YEuc1ddqTboYD/4WjMsPIXdd+agHxWg9HFl0bgKi/1lKK+6VtK7+2LHsn
 71iAM2dqzISnZRa1x/ezCuJuzGW2uVYkrfVolzBj1gBdyxaxWZ4Gb6OeWLkpFEXeLkDU
 boqScC+FcDFJ5nTn1w1ap6IIJp/v1HMmKE9GQsPfIHwSBmrPCpmgZ/2hc+MCjfd4trKV
 GtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0RC77huOuZ1tL4G8TsG8hVc4JWG5AumcDRtuYq9SLKc=;
 b=5DhaMhp+lsrmJkbKAiMhvKwdgqIeIGvy9JZwTQPmEawXinmOhRy9tXJ3DZPB4ZiIj5
 9g2WBvcOx3QPM7jC8Xkw8JDfsFwsEtN12O8PcKCjzk+4QrvvuzzYDhPu77+5iYR1ez45
 /hP3rRlEcq8QrTDPtXPwwSqG326zExnsOP53ScSt3OEJBRjJiFMG5Jfy7xqOOHlD6A7H
 zEocXFvt5ACwwV09L11wOX3Don0jaamtaj3tmanqbTiIu7YHlSRwG1wkk7Nc+MjVZm5h
 oPUYBIrQttgxJ0/kW6oGMvU8yAQen3h3i+kV5OTWVQRyWT4k7RTm1600oiD1Z+NOXOmE
 obqw==
X-Gm-Message-State: AFqh2kpPyT5jCt4DvJiF3O5kdUbubUdyaIkLct2KP8Qr6kFXvuoISnoQ
 SKnPGbCbpmkpsXvqA8vDT4vAPg==
X-Google-Smtp-Source: AMrXdXsvXowNhJXCaGGsO8mKuYF+/MQWHP2HfUgvhMuGS+EhnuwqM/q9CQssShr902wvC5qi9gT5Kw==
X-Received: by 2002:a2e:8005:0:b0:27a:2e09:c5be with SMTP id
 j5-20020a2e8005000000b0027a2e09c5bemr1395091ljg.16.1671712903511; 
 Thu, 22 Dec 2022 04:41:43 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a05651239c700b004b5766f48d8sm61833lfu.19.2022.12.22.04.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 04:41:42 -0800 (PST)
Message-ID: <bb05ad5b-6109-a618-0f98-6fe267de8b0b@linaro.org>
Date: Thu, 22 Dec 2022 13:41:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH V7 5/5] ASoC: dt-bindings: Add schema for "awinic, aw883xx"
Content-Language: en-US
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz,
 tiwai@suse.com, ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com,
 peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 james.schulman@cirrus.com, flatmax@flatmax.com, ryan.lee.analog@gmail.com,
 jonathan.albrieux@gmail.com, tanureal@opensource.cirrus.com,
 povik+lin@cutebit.org, 13691752556@139.com, cezary.rojewski@intel.com,
 stephan@gerhold.net, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221222123431.106425-1-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221222123431.106425-1-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: duanyibo@awinic.com, yijiangtao@awinic.com, zhangjianming@awinic.com,
 zhaolei@awinic.com, liweilei@awinic.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 22/12/2022 13:34, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
> controlled using I2C.
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  .../bindings/sound/awinic,aw883xx.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> new file mode 100644
> index 000000000000..af4e0e27f8f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml

Filename matching the compatible.

> @@ -0,0 +1,49 @@
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
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: awinic,aw883xx_smartpa

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

