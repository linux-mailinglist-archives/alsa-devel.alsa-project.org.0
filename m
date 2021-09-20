Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8324115A6
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 15:26:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AC7716A5;
	Mon, 20 Sep 2021 15:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AC7716A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632144388;
	bh=QWXFMqqiVmfAE2uaYW+YOYBHoiyIkf0blEoegCuNOIs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jZ7QPDwpxOt2mWBru3EcBB2wQDabcwzja8TePr9HUnho2DiMjbd1l9/yZABiDTdpG
	 D8t7upfwQUU6nltKnfG1SuuePRECx4ac5LZvJlzeaNtn0eB8Hko97eXiPcctR9L3yN
	 ps6EZLXbaQ/gduBnUPWX5KNV6NSO3HxOuX6m1fYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C89D9F80279;
	Mon, 20 Sep 2021 15:25:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B8B8F8025D; Mon, 20 Sep 2021 15:25:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE1FAF80152
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 15:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE1FAF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xoT5NPcx"
Received: by mail-ed1-x52a.google.com with SMTP id v5so60630666edc.2
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 06:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zHVonDiIKOidenYlcCsevl+U2ckQNMnx2NKq+Q4lJ+4=;
 b=xoT5NPcx8DInitXeB0UKu0hQHUwQU4lRfCwxIULDJvq+hMnb29LVCbXVnfaV9N530M
 l51cSknPG8z/139JGdnHTbOQjJm4hYfoy/5SspTk5SsrTLW4IheL14qbnSqZtkpxhDKU
 JHLMpNQmBEuLzpGeHRn16DIjkv/jdKnHMozXrSMQxpe8z4L5SXgLD1sI0mxMdNnK0epn
 Gh3G2xwHQ6HRMNoLmTUOSW8c8QnrUfJlOYmolUR2sLyX8QBNS5QSZ1aFwxhANjRooA6T
 G8RAOLIrpxifni7FmEG1xZRJuFMX/HjobycX+m8asCEKJnUs5v5YuYSTBmjuf13v0KX5
 Lyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zHVonDiIKOidenYlcCsevl+U2ckQNMnx2NKq+Q4lJ+4=;
 b=Uki5/hpFRtMJp5bfYnm9dmYGf9UQ2L/7l3AHqn2iXmEG64kmrwum9iksQvZJqVDLau
 8yTTNxy5zPnfGHTcDKQ9h2WO/C/OimKBVapdQcivjUAw9a0YgdshFaCFtbjEvEyHgw1q
 X36Hwu9ZJQ+yjbXCg6acmFbOsJ3/aIGrYdrUZCj3lIhgKKJzbgDRm4UuRPc510OYQ52X
 iNioj4NcKF7UTz5yOR9CfwVMnL6YIavlQO4YCM+NsIYPdMBJh/j99Z9NUdjRLDzibOAi
 a3zrzmgz8RdDDeIsp9gMGaPjuz4k7wIlJhNO3OXkyoypdG+v6Eaj0MsfDJUfQz5eT3Mp
 TFQg==
X-Gm-Message-State: AOAM53036FiZsM9M9gNG/KLp4Scn3xwYLfAAV8wgkLyZW7qQAqN+M0Mk
 AsLqRrPNjBxq2T4oqInCl+zV8A==
X-Google-Smtp-Source: ABdhPJwjGdIItEsvSqiN7t+4FGcgarp0izJCucyWEMUojF95CxEnksKLGxBDs+NwjN0Mcqwpp0YLeA==
X-Received: by 2002:a17:906:a18f:: with SMTP id
 s15mr29516593ejy.269.1632144292611; 
 Mon, 20 Sep 2021 06:24:52 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id 19sm3042079ejw.31.2021.09.20.06.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 06:24:52 -0700 (PDT)
Subject: Re: [PATCH 2/7] ASoC: qcom: dt-bindings: Add compatible names for
 lpass sc7280 digital codecs
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
 <1632123331-2425-3-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7c12126d-99a8-4572-6e95-b63131cae300@linaro.org>
Date: Mon, 20 Sep 2021 14:24:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1632123331-2425-3-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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



On 20/09/2021 08:35, Srinivasa Rao Mandadapu wrote:
> Update compatible names in va, wsa, rx and tx macro codes for lpass sc7280
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 4 +++-
>   Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml  | 4 +++-
>   Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 4 +++-
>   Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml | 4 +++-
>   4 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> index 443d556..a4e767e 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> @@ -11,7 +11,9 @@ maintainers:
>   
>   properties:
>     compatible:
> -    const: qcom,sm8250-lpass-rx-macro
> +    oneOf:
> +      - const: qcom,sm8250-lpass-rx-macro
> +      - const: qcom,sc7280-lpass-rx-macro
>   
Recently Rob did tree wide change to use enum instead of oneOf for below 
reason
"
'enum' is equivalent to 'oneOf' with a list of 'const' entries, but 
'enum' is more concise and yields better error messages."

So, can you move these to enums like:

enum:
   - qcom,sm8250-lpass-rx-macro
   - qcom,sc7280-lpass-rx-macro

--srini

>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
> index 6b5ca02..cdec478 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
> @@ -11,7 +11,9 @@ maintainers:
>   
>   properties:
>     compatible:
> -    const: qcom,sm8250-lpass-tx-macro
> +    oneOf:
> +      - const: qcom,sm8250-lpass-tx-macro
> +      - const: qcom,sc7280-lpass-tx-macro
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> index 679b49c..e15bc05 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> @@ -11,7 +11,9 @@ maintainers:
>   
>   properties:
>     compatible:
> -    const: qcom,sm8250-lpass-va-macro
> +    oneOf:
> +      - const: qcom,sm8250-lpass-va-macro
> +      - const: qcom,sc7280-lpass-va-macro
>   
>     reg:
>       maxItems: 1
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
> index 435b019..2dcccb5 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
> @@ -11,7 +11,9 @@ maintainers:
>   
>   properties:
>     compatible:
> -    const: qcom,sm8250-lpass-wsa-macro
> +    oneOf:
> +      - const: qcom,sm8250-lpass-wsa-macro
> +      - const: qcom,sc7280-lpass-wsa-macro
>   
>     reg:
>       maxItems: 1
> 
