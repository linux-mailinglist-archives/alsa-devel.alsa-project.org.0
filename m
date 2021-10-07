Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C91F2424F3C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 10:25:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D5331666;
	Thu,  7 Oct 2021 10:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D5331666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633595115;
	bh=A4eii+LO9mBzYSeoNAo4hsZWi4bmaHD7ay6cCuN5HK0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=chDIJRfAfZ+reNWlL6dqafcToRcI/0k7RMMSkzspkPBp8tb9GZrs9sdFTvOXwzAwD
	 TFOTyyMxiUZpGiHdeAoVvdv+vUidTRgKYbaILOJXA1gOsoaqVTia75vWrT9T46eiGw
	 Oyn6NCD84tp3AZyFHpWKhjJJoNa/lI6Ac1z5FLzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73828F800F0;
	Thu,  7 Oct 2021 10:23:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A523F8027D; Thu,  7 Oct 2021 10:23:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F249F800FE
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 10:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F249F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XWcAScmr"
Received: by mail-wr1-x42f.google.com with SMTP id m22so16588159wrb.0
 for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021 01:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xe+XRJeApLVn7A/vQhil5r3wZhwLCdq+ejWt2cjD2gA=;
 b=XWcAScmr6njF3YDdwtBuWNoW21XyoTU9jU89jfK0LpmzTFcU+O4TeqlEU4RhdIwjDz
 QBb7bdwJFX1tdJnNXSE8eoxIONmFpqfMdVo/jEOkWjQyoCGzVy/znhTluRcphckXNXWU
 4Ve8h0nZwQiNFTcJakBELhVFtPHosT75Ivbd3PfLUw7opjyC1f2lvUS70hkgd+Szw7z4
 dthOY9QyJyCtKve/dS3LEPYU1l1y4NyZThhSNQ66lnXfccJRMinALTx1lB4FFzAHQ77T
 djlPS4CYVesYL1D4Cc1PMQlXFqOcdk+zUi9q4t3FKuF4LzUAjqcXX6oK2ervT8R5BBCu
 kijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xe+XRJeApLVn7A/vQhil5r3wZhwLCdq+ejWt2cjD2gA=;
 b=JQQ51/zQF6BFhI07lKZUMRdcFQWcQv3dx4ll1Gu7YY2sGQwAs2yUqsGRDU1Gkc8MYT
 H+Hz6GuiXgbmhi0l8q/T3ypBa7ILQJlx+sPtHUifP0oBME4gntupFNgWLTVbGsFSefuQ
 Dpba232u03uZuKgdzs3QlkCWnLozJjaC3BQ+WA1kR5QGO4W5DOhappUFi6+BAVER6NVN
 Hyi78iDcFziU8g5U3BuWUGFEViWZBXnJmRMAvSprwBbkIoXzlewvXRjCIKJXuUKLkaH5
 bkuxJD2IsGdeKljd1TZZrjHqrAE4W0403k8x7MK2Q+K1U4fymWOaOuTZT6sLQLVuUlBi
 zmIg==
X-Gm-Message-State: AOAM5315d+KzKiX7Mgkh2pH5P6vDd6XYH9I+Umvn4hEi1MUu1LxYsLGi
 sWIU9bjasO2hdCMZZA7LGEXVbg==
X-Google-Smtp-Source: ABdhPJz2laknS3HcVubqmystTFIi96a9XD2RFlG+VlYikPz8L6hf/dtomFr4mAZE0x1m+d/b3BjgqQ==
X-Received: by 2002:a5d:6d01:: with SMTP id e1mr3560205wrq.410.1633595027311; 
 Thu, 07 Oct 2021 01:23:47 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id u17sm9211793wrw.85.2021.10.07.01.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 01:23:46 -0700 (PDT)
Subject: Re: [PATCH v9 08/17] ASoC: dt-bindings: add q6apm digital audio
 stream bindings
To: Rob Herring <robh@kernel.org>
References: <20211006113950.10782-1-srinivas.kandagatla@linaro.org>
 <20211006113950.10782-9-srinivas.kandagatla@linaro.org>
 <1633547293.527218.2218062.nullmailer@robh.at.kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4e70e1e3-162e-13c0-5cbd-0135d2585e96@linaro.org>
Date: Thu, 7 Oct 2021 09:23:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1633547293.527218.2218062.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 bjorn.andersson@linaro.org
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



On 06/10/2021 20:08, Rob Herring wrote:
> On Wed, 06 Oct 2021 12:39:41 +0100, Srinivas Kandagatla wrote:
>> On AudioReach audio Framework, Audio Streams (PCM/Compressed) are managed by
>> Q6APM(Audio Process Manager) service. This patch adds bindings for this DAIs
>> exposed by the DSP.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   .../bindings/sound/qcom,q6apm-dai.yaml        | 53 +++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/sound/qcom,q6apm-dai.example.dts:19:18: fatal error: dt-bindings/soc/qcom,gpr.h: No such file or directory
>     19 |         #include <dt-bindings/soc/qcom,gpr.h>

This is because QCOM SoC relevant non-audio patches in this series have 
been merged into the Qualcomm drivers-for-5.16 tree, as this series 
depends those patches an immutable tag is available at:
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 
tags/20210927135559.738-6-srinivas.kandagatla@linaro.org

which is mentioned in cover-letter.

--srni

>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/sound/qcom,q6apm-dai.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1441: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1537089
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
