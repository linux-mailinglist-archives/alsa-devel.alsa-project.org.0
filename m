Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9E92FBDF5
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 18:44:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A234918DA;
	Tue, 19 Jan 2021 18:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A234918DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611078293;
	bh=Ygo7po+AAt06+o6JWkVV0C5SxRw/1gifJcMB0XGQKh0=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ulfAvwzEvWF45PTE8yzDl2dgKQeTnvJeJUowQZSxw5pCAXHlrvF/zsRjVSv513qkC
	 OK6JtQnPK3ltSFunvpsIkY31Ui3bINZPw44XyqgBWpNO6j9gXyyjxlQWBGoBD/8sW4
	 XyPafkfYGPfnSF7W0Eaykpn+CH8x7eYd9C2sxzjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15F25F80117;
	Tue, 19 Jan 2021 18:43:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0223CF80117; Tue, 19 Jan 2021 18:43:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBA7CF80117
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:43:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBA7CF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="p4j/1K5X"
Received: by mail-wm1-x32c.google.com with SMTP id c124so547782wma.5
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 09:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NreVrBzRdjWUMhnpyW0Laz51KK4BAiOJ7sHL2lFW67M=;
 b=p4j/1K5XStmkuE8kCFJC9Iu4VM5mc/KqUVyHqFTwQZTyhZGjLUOm0inZYAlIlIEsP0
 kPWxPMb7UsKq0ZxeGvee+GsDlApIcnHwIs3tVGd4QAPqGKAwOsiVhzyN0KEc8zCueW+M
 og/rcV8p4r8twJzW5NEOFf7zPAcTkgiu7bcDH6CN68AzlUevJlgXWJJUWBAo0lWXYLBU
 7+DVDwHsRtjh2sDogCgDR0RUx+65ePkrunOd0vjfZeYP3UHbUnaE70RQqbpcia6uTmyV
 uWcVJVFLHUsMf4vnU7xIkqHuJngx7xQ68lwywkWs75PDAqcpXuo6AbcjBCd+8KFZEwiZ
 PnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NreVrBzRdjWUMhnpyW0Laz51KK4BAiOJ7sHL2lFW67M=;
 b=VYk3iNoK6S2VYU6AJPMqZWSNeE0kNl0OYs6V2m2jQN04xAGOhA4j0rEPQqKzXz0lgv
 VTXF0byKIJu6pFEPNHCnLBAdm0BqQptB1QhpB3OENSWHEh1Ao8LasdnEJEWMJUnnez+O
 ZhEkoS2QPDbqge1D5uktQWQwMKHshOa4PjnT9RaNbPus5b4lfjL5DodxwSrgDUmeZ16G
 a6f8u1VMlq05YO10PCi6doCvBCdjEBi/9dvfsf1Uu2Cfv7rEBL8lXH0XeERbKSjxOnyH
 VxzeoxvcY90rpYGCnBv2pKDHHbKZDCjS81Qrq90dx6SVAU1z0u0fo3ooGEAvLfnRBGJv
 Tv1w==
X-Gm-Message-State: AOAM531ZbtTOzgo+h31tTPmLDCGFURdSAlPkuzpJR4b3l0yZpELJKyUy
 a55sc5RABvIl/GY+eKl8zOX+v9e2ehxYhQ==
X-Google-Smtp-Source: ABdhPJxii8CrSvXRLdl73y2ckjlcDzUwFF3pGoJKBcpvEHZTa1jtaaKK5mF0pBGw3FG+DUznIxqXZg==
X-Received: by 2002:a1c:608b:: with SMTP id u133mr689338wmb.140.1611078192354; 
 Tue, 19 Jan 2021 09:43:12 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id k16sm5463871wmj.45.2021.01.19.09.43.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 09:43:11 -0800 (PST)
Subject: Re: [PATCH] ASoC: qcom: lpass: Fix i2s ctl register bit map
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
References: <20210119071718.3867961-1-jun.nie@linaro.org>
 <875d9fbc-ddad-b62d-0374-2a77bc9d6d83@linaro.org>
Message-ID: <a9e5b6d5-742a-9814-353f-c979543fcb9c@linaro.org>
Date: Tue, 19 Jan 2021 17:43:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <875d9fbc-ddad-b62d-0374-2a77bc9d6d83@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: plai@codeaurora.org, bgoswami@codeaurora.org, alsa-devel@alsa-project.org
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



On 19/01/2021 17:37, Srinivas Kandagatla wrote:
> Thanks for the Patch Jun,
> 
> On 19/01/2021 07:17, Jun Nie wrote:
>> Fix bitwidth mapping in i2s ctl register per APQ8016 document.
>>
>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> 
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


I sent reply too quickly, just realized that this was a regression from

  b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and 
dmactl registers")

So can you add Fixes tag and resend your patch!

--srini

> 
> 
> --srini
> 
>> ---
>>   sound/soc/qcom/lpass-apq8016.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/qcom/lpass-apq8016.c 
>> b/sound/soc/qcom/lpass-apq8016.c
>> index 0aedb3a0a798..7c0e774ad062 100644
>> --- a/sound/soc/qcom/lpass-apq8016.c
>> +++ b/sound/soc/qcom/lpass-apq8016.c
>> @@ -250,7 +250,7 @@ static struct lpass_variant apq8016_data = {
>>       .micmode        = REG_FIELD_ID(0x1000, 4, 7, 4, 0x1000),
>>       .micmono        = REG_FIELD_ID(0x1000, 3, 3, 4, 0x1000),
>>       .wssrc            = REG_FIELD_ID(0x1000, 2, 2, 4, 0x1000),
>> -    .bitwidth        = REG_FIELD_ID(0x1000, 0, 0, 4, 0x1000),
>> +    .bitwidth        = REG_FIELD_ID(0x1000, 0, 1, 4, 0x1000),
>>       .rdma_dyncclk        = REG_FIELD_ID(0x8400, 12, 12, 2, 0x1000),
>>       .rdma_bursten        = REG_FIELD_ID(0x8400, 11, 11, 2, 0x1000),
>>
