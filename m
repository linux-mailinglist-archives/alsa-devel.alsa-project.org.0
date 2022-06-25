Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D3F55ACAA
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jun 2022 22:46:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8704816CB;
	Sat, 25 Jun 2022 22:45:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8704816CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656189965;
	bh=JytkNkH0QsFxN2hdglwySx5ZdWwPa4LqA8jJBFhD3xI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gg05sEUxCJ0jvxTluZq3bBaQIauZ+UHNeV4IAX0yDxlxTegO/PnCeYkWg3UCoq6d7
	 okSQSVBd4bzMEwJB1SNcDYPU3y89Yw/2DsOxDUGCPoJ0zGMH6OTHu2+YDrEdDvVnfY
	 ZsKu8vdNzS8JmSDj2UB3HUhA7NatBzVVlDrc/ro8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFF7CF8016C;
	Sat, 25 Jun 2022 22:45:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15B79F80162; Sat, 25 Jun 2022 22:45:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D48B4F80109
 for <alsa-devel@alsa-project.org>; Sat, 25 Jun 2022 22:44:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D48B4F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="y6cxvDR/"
Received: by mail-ej1-x62d.google.com with SMTP id g26so11338329ejb.5
 for <alsa-devel@alsa-project.org>; Sat, 25 Jun 2022 13:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H+F5Z0mfBJYQ1TfQcrng6IvkUvurloIcIvH/FYvqkLM=;
 b=y6cxvDR/U1IEONYBz/iay5T3a4fJrrXTP/TaSHwaYef9QHD8Y+cj16a+TOP7lUK0eg
 LuvAZN1z5OUmo0KrNfyYL6pr9fY+4/BN8pTFnvAx3UZOZBSkGWG9YmyUDfotF9YaP+FB
 7VrdPy8RNCtM43r9nIEUYAChz51XVTe/yY18ml+Zn77Xj+7p2oIoBuYfVOiAvOruwWvu
 WuJwX6ZN1Q9/3xZicIGOnzRbUqT5WIcDXHC8ftMixV6IaGMzT5nPzV/jPpxHRBYhswo6
 CGRc45xqPauD9dfYgY8KXK7m5S3QntAixxtjRky8fNcIUSMFE8g24tAHH3bMw8q+oJOF
 aJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H+F5Z0mfBJYQ1TfQcrng6IvkUvurloIcIvH/FYvqkLM=;
 b=o5iwJ+yPBaqlKcevIPYvbNZhlVwJCrJDPkJrQSplh60yNA3ZbuOnYPTlKOCmvjif1T
 ZrVRkBg7J/2D8q0CxNeV9Dray1I5SEb6TVQKNDA1cHVVSu292Ckw0NvZJ8auwgwclbeu
 QnKXDEXMM9k0yHYETfnv8hck+BVVD106RLizRAkduChqItGbnJH7ZFtjwtYO8VUQ8VJ/
 yB6vxc1R3PzbEQegSGX5GxhgTZBCwMRW+ki7kdAb2VMq13Mzf28XZugRsKG8DPnxCm4+
 kSFtVjw7JfB5AKttvrSpMCof76P0Um/iKHUYPUKCDYmull+ld1z5iLYC8O5IyNgoMjWz
 ie5Q==
X-Gm-Message-State: AJIora8TyTroimpYMlfL147NUHzwLD+6Ruq/WvVuLrssp/y9hhq+Jh3j
 SBudhnaJJIfGBFYWFGuctsY82g==
X-Google-Smtp-Source: AGRyM1stq1qihX1SSO618jlh5gyWIEwJPPZfqyE6Adl0Y9IsEGshwKvra48Heq8U+1Z+XsacUUCfUg==
X-Received: by 2002:a17:907:72cf:b0:726:77fa:ec58 with SMTP id
 du15-20020a17090772cf00b0072677faec58mr3242767ejc.551.1656189896729; 
 Sat, 25 Jun 2022 13:44:56 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 d10-20020a17090648ca00b0070b8a467c82sm3010694ejt.22.2022.06.25.13.44.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Jun 2022 13:44:56 -0700 (PDT)
Message-ID: <3008fa44-e3b2-f394-5880-e348ace20829@linaro.org>
Date: Sat, 25 Jun 2022 22:44:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Use WCD9335 DT bindings
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20220622161322.168017-1-y.oudjana@protonmail.com>
 <20220622161322.168017-4-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220622161322.168017-4-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
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

On 22/06/2022 18:13, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Replace DAI indices in codec nodes with definitions from the WCD9335
> DT bindings for devices that use WCD9335.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
> Changes since v1:
>  - Maintain the alphabetical order in msm8996-xiaomi-gemini includes
> 
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts         | 5 +++--
>  arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts  | 5 +++--
>  arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts | 5 +++--
>  3 files changed, 9 insertions(+), 6 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
