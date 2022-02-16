Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA59E4B8B4B
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 15:21:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 402551941;
	Wed, 16 Feb 2022 15:20:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 402551941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645021274;
	bh=9WZ/2T36Zl73pRKFRn/3TKLwFZYMU/9ePLV0f2Bf3YE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A1QfuieG5FSUsi7ZKr1aOG9YXu7MnHloxxmrEZC/dzGhmSuf6aaVg4gK81CfA2qTL
	 MLvkDILLC7I9Jc9bq3Xmzp2JJ7IJg6ZGbst6/alMyu1inLuA7/KtHeOIp8P/MEYDme
	 GsnX2bmWhSH6TL+H6RvzL72jY+q+mTy4IRwrS7G0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99455F8012E;
	Wed, 16 Feb 2022 15:20:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CE8CF80128; Wed, 16 Feb 2022 15:20:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5039F800C0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 15:20:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5039F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qWaQazsW"
Received: by mail-wm1-x32b.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso1728182wme.1
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 06:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mSFzl3/wzkj8B4robF+rT58JmUNz8Bt1vcKE9GcyCwE=;
 b=qWaQazsWcyxf1G4B6EGDrfsseJJosl/k0UfpvosPf6n+J1HV/HjfQpC0Tom0QNZ1Rz
 1v9XhQsgMTvBE1hc0NKX6ff0Vc3EGOAkOuzxz8vVh8tYle4CSk3lf4zCHb/fe/0/c3uY
 sHS6/fw+6GxVTVwPcrUEmHOk9T2XIt3eovIQzFqFHEIO/6UpK+lOqvVl5Bg1aCo6cZD5
 f0PjcuFcRCBMvDWALKKIIQjtfgu6hxMo5ZleypdxwtmnEhRZDq7G15vHWYelkJVlzLfk
 kZYzjuqFAcsGE1UPH7jhvEtoFDxhP9CsSsTM/2cxWL/wybeup0lt+DZjHBgaIPaBTfbH
 baLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mSFzl3/wzkj8B4robF+rT58JmUNz8Bt1vcKE9GcyCwE=;
 b=RCk+5Ut7+pOCQPYx3SXU2FSqgSu/5HyJ9yegjH2xD93w8kuoaJ2oEfTkWJUo+W+itl
 8K8BsD0Y+/3TTEJaOpP2nopsYqjgiu10rjzuRxtD5+poRYPf3qPHVuArmjlt43UWqclC
 aZp5X4COWWxKiPqbB3WGlXwh2fqtYUyjsGl/m9oRSLcMd+GHDXx+o+avCWiRqzoG7YHB
 o/Uiom7qgORz6IJMo2CbB47yvPxpwjFhl4na2Ar2wOUpkHgaOBJjk4H4RRCnF+rJiu+W
 reUvbdfM6h7cBm0f9bBcMLfr1M/HTw/cu8INMokqSdyTCzGrcBjbsK1e31exmidkv5T1
 f7xQ==
X-Gm-Message-State: AOAM533TAVdwUtewnzLhL2VFOrRDrwLkgqtaKIB+NZpMDEWhu6VLgUpQ
 IKqcE0aYuUODbJbl5Nhx7m2XmQ==
X-Google-Smtp-Source: ABdhPJyU3J3lvMMCNLF0N2wQe96ZdbZH9SCrjsnTaZ2jPrJRpnULhe9FgIb+nWQxNkhcR+80fRpI5w==
X-Received: by 2002:a05:600c:3b04:b0:37d:342c:3696 with SMTP id
 m4-20020a05600c3b0400b0037d342c3696mr1899249wms.62.1645021199445; 
 Wed, 16 Feb 2022 06:19:59 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id k28sm20051554wms.23.2022.02.16.06.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 06:19:58 -0800 (PST)
Message-ID: <e0d6678e-51a7-9c93-bcbc-abfbf38a8633@linaro.org>
Date: Wed, 16 Feb 2022 14:19:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 6/7] pinctrl: qcom: Add SC7280 lpass pin configuration
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-7-git-send-email-quic_srivasam@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1644851994-22732-7-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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



On 14/02/2022 15:19, Srinivasa Rao Mandadapu wrote:
> +module_platform_driver(lpi_pinctrl_driver);
> +MODULE_DESCRIPTION("QTI SC7280 LPI GPIO pin control driver");
> +MODULE_LICENSE("GPL");
> +
New line not required!

--srini
> -- 
