Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C58576B1F27
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 10:01:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E65911899;
	Thu,  9 Mar 2023 10:01:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E65911899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678352519;
	bh=unC7FOPXWsbPFbB7AiTaUP32+ZTpl7Pzycp0nr5pXno=;
	h=Date:From:Subject:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PjD3yEIy1Qje8Xid6UwQSmlggtlWIHehzlgMjRdr4aoHGMUgnGgTYwKOkDiBlAJ1e
	 m2SqCz4ea9+7Gn22O91NaKNGFJdl52EjWR5seIBMScn7Coa0QFHjVxwtus8uXEBdkO
	 dse+S1LOXQ0AapLjeIbB7ys9Ok6RmIjnb1F7mzEI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EF78F80236;
	Thu,  9 Mar 2023 10:01:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 013ECF8042F; Thu,  9 Mar 2023 10:01:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2858F80093
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 10:00:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2858F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DAJ0wh1l
Received: by mail-wm1-x32d.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so3228619wms.0
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Mar 2023 01:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678352457;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ahQvvXgpAC4sImhVbYw58xhhuuWXnXUtY4vE77nNUsU=;
        b=DAJ0wh1lZGDn+vomPLVfpSlOyFbTrd5Wlpt0nO9fRINX6sd9KSKydH3US/nr2bfQct
         5y31vlBveHuehveBeAJgy2NJkl8KpBq8ZBP2hGfA+ZE8RI7gOlMUAST87NVMxkiaxrpQ
         wFMQg5grA8BvMczuP9wa8kRztYq0XepRae8v+BakFuc1joPLr0wka5AGyWjCEaR9Tq3I
         sh0olYH/OoNZcQ7iMpP+C5evP0Ob6rkUAzxSzV36vqJrMMQ+287TOrJReRi+qNRZdfal
         r73ArPt/fqnWG78h9x3U+dBhvZQBm1u4ldiKQjxkoJGfLqW5ZCW7jd1MNu7BoVMLIjCF
         bnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678352457;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahQvvXgpAC4sImhVbYw58xhhuuWXnXUtY4vE77nNUsU=;
        b=iRi8PCxoxnz0K9cRK4amJpmu1kS71yRNObG97lOpQMmCRd3hDOoeyMKdSzPISbXyty
         JgZMf4KZRv1yM7p3YwMmkBJTWHQwQDawjtCSAQhJ6euOSBEnZtwHuACQ3oLlgpd6Zvvx
         UwVmlF7b6v2vP0XPyXMqWOS5JBK4MRgR2EoPJ5aRhs5HCCIOU3U6SrlnyIMTo/AC+bGQ
         qjzVkb5+xT9GnIiI7GePloEzhV+69XmDb3iutziSFYpEbfm0mrbRUmTxR5SF+6GqIyG7
         a8DYaAKXxIAskisoyZrtZ4LhTvaspH7qiTuKQDhf405Xy7lZ3vuXKVEbigy4i+gQtkkq
         ulWQ==
X-Gm-Message-State: AO0yUKUTTvauFXhFiVwq6SkkaVtZ4ZOOdFGGdr4/d0VIv9nTTb0TJBkb
	1+Fa0Y5MEH3xfKNwPlaYF9zfIg==
X-Google-Smtp-Source: 
 AK7set++QhcnMV+CVFS+bcpFv3gMgCZjfUlt/K24s/n+K9yXjdLVCJScvyhpqvbKUYy4QHqVvjxCYw==
X-Received: by 2002:a05:600c:5107:b0:3eb:2de9:8af3 with SMTP id
 o7-20020a05600c510700b003eb2de98af3mr18113595wms.23.1678352456810;
        Thu, 09 Mar 2023 01:00:56 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 bg42-20020a05600c3caa00b003e6efc0f91csm1972470wmb.42.2023.03.09.01.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 01:00:55 -0800 (PST)
Message-ID: <1d0f3570-ac71-70aa-f9e4-b6d12f3a17c5@linaro.org>
Date: Thu, 9 Mar 2023 09:00:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 05/28] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add
 USB_RX port
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, andersson@kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-6-quic_wcheng@quicinc.com>
Content-Language: en-US
In-Reply-To: <20230308235751.495-6-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YCDTAF5NG72VW7XIRKPQMR5B5Z3THOO7
X-Message-ID-Hash: YCDTAF5NG72VW7XIRKPQMR5B5Z3THOO7
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YCDTAF5NG72VW7XIRKPQMR5B5Z3THOO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 08/03/2023 23:57, Wesley Cheng wrote:
> Q6DSP supports handling of USB playback audio data if USB audio offloading
> is enabled.  Add a new definition for the USB_RX AFE port, which is
> referenced when the AFE port is started.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 9f7c5103bc82..746bc462bb2e 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -131,6 +131,7 @@
>   #define RX_CODEC_DMA_RX_7	126
>   #define QUINARY_MI2S_RX		127
>   #define QUINARY_MI2S_TX		128
> +#define USB_RX				129
>   
>   #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
>   #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
