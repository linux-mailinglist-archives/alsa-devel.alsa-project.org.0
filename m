Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 835C75A79F6
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 11:19:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3204016CD;
	Wed, 31 Aug 2022 11:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3204016CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661937544;
	bh=qQiJiGTDX2hLl/q6qWoXC3OF8anyXmMkuly9eSlmyeg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bkMqOkcNVM8EBvelVTiulrx1VNNN5jM+T36lnvF3dY0Jao+zobZU7w0kqP0QBjTnG
	 B+Z6QHN5GQ4tMOtGjQhrgeVqLNTrZdzC2Q6/2v0YkRsYWn64O3Vvyq8c1oUsBMqSTo
	 bvKraWiBxLQNJyap+YBqJ9aPWSKwyddlEI7VvmIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91BB8F80448;
	Wed, 31 Aug 2022 11:18:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B11EF8042F; Wed, 31 Aug 2022 11:18:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D303F800AA
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 11:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D303F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="X3x24bF6"
Received: by mail-wr1-x434.google.com with SMTP id c7so10734146wrp.11
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 02:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=SXvbV5rcvavP4Jcb2izxYcl7CbRhtBP4rr55k+HGuNU=;
 b=X3x24bF6e1FAOnPOGPbkcK7pFdN7G4u8EQYVcJVjQQXTgufSKLHtIl3ZQe0VghbytW
 Du2+8Ec7aNljPJv6ObaPdvyEkH1Wwam9fzUydUDgl66FRPgYmj1zGbjzK39Tuf6Nvoex
 yU3l9CTgYqLDJflN+BwpL2FhKgNDfukBBVgdY2sz5mqAxYWgQ2EvtLVEg8Bic6ADlQQp
 1HcbHQfR3pC4V/k6OPENbevkVZzFmrXidf/PJha0HUqPnuQDAH8rUW2S+/0JkOKdIie0
 9icy0P6voEfb3ahVNuQLxO8A9ZnSs6D5cTcBL6Jn+FutMrbvKSsELxqAeQgOlCPbBRFz
 wgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=SXvbV5rcvavP4Jcb2izxYcl7CbRhtBP4rr55k+HGuNU=;
 b=lBZqEYyMJquiVhflsH+mvDLvyKAqGyWtgpkOD9s8r1IyOGKTuBCth40v7UGlcJKke0
 rHw3ilfxmJrOmf72ORnUgeX0GVrqQUhRIORWzbFT71IB+y02YUc5QiHcU1HaNQA2jTdf
 HI51OmaShkSa3hQkoY1SVlxmxiS9BFrWQmfdP3+t0ZHIjg7nfkzM2D0rEnjRTEp5QKww
 G9y4l6Yh4PQJtSNj7DosM5+fv1o0sDuzi03HsuGJBPIJ34vJD2qRIyzL2lxTt7WP/DxP
 m66esdBqvZ3LAqbo35E07M/5Y/C6x9ylIjuhjvdOmfm4ju6tfm4cEM22BllZyvatFJCu
 zCUA==
X-Gm-Message-State: ACgBeo23031Z1KH32EX9bX3/RZggixoeKX5Hq2mOL1n2qMxigBmffTvF
 QQWMCIO9efbjpC0z2j8E2PtGfA==
X-Google-Smtp-Source: AA6agR7mYp7d04nyA8tkM4i7/eoK54yX1PZ3lHZvWrDfNfkP3f5n/Q6nL+co9c5v4UI8d75UmPjhvA==
X-Received: by 2002:a5d:5143:0:b0:226:de76:be7b with SMTP id
 u3-20020a5d5143000000b00226de76be7bmr6469642wrt.308.1661937473326; 
 Wed, 31 Aug 2022 02:17:53 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 l42-20020a05600c1d2a00b003a3170a7af9sm1659640wms.4.2022.08.31.02.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 02:17:52 -0700 (PDT)
Message-ID: <9c9226d9-8470-6672-d8ce-3fb1e4df3fda@linaro.org>
Date: Wed, 31 Aug 2022 10:17:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/6] ASoC: codecs: wsa-macro: add support for sm8450 and
 sc8280xp
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
 <20220818134619.3432-3-srinivas.kandagatla@linaro.org>
 <20220818171222.GG1978870-robh@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220818171222.GG1978870-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org
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



On 18/08/2022 18:12, Rob Herring wrote:
> On Thu, Aug 18, 2022 at 02:46:15PM +0100, Srinivas Kandagatla wrote:
>> Add compatible for sm8450 and sc8280xp.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/lpass-wsa-macro.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
>> index 27da6c6c3c5a..f82c297ea3ab 100644
>> --- a/sound/soc/codecs/lpass-wsa-macro.c
>> +++ b/sound/soc/codecs/lpass-wsa-macro.c
>> @@ -2561,6 +2561,8 @@ static const struct dev_pm_ops wsa_macro_pm_ops = {
>>   static const struct of_device_id wsa_macro_dt_match[] = {
>>   	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
>>   	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
>> +	{.compatible = "qcom,sm8450-lpass-wsa-macro"},
>> +	{.compatible = "qcom,sc8280xp-lpass-wsa-macro" },
> 
> Looks like these are backwards compatible with the existing versions,
> why not reflect that in the binding?
Backward compatibility is not always true, some of the registers and 
there defaults tend to change across SoCs. Having SoC specific 
compatible could help us deal with this and also make code more inline 
with other codec macros in LPASS IP.

--srini

> 
> Rob
