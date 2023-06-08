Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F80E728294
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 16:24:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4209174C;
	Thu,  8 Jun 2023 16:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4209174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686234256;
	bh=2e4SP2ffwyqrwPSDQy2RgoYxujjpnaVM7dDmFtNciE8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q0sByE5wiprsXK8myqBUfTm9Mpnf5kr+YmCipt0RHwEdnWzSjTncUxvCKN6QM5Mog
	 xftOOWEH/Iog9KZXRSCrlHrMzxPsYrB9UW4SIjIV+BW/D7fK7lfjKi0eYBicPjkwhQ
	 Yi+RrKsuyxgTwT2rhDLxfkm2EhPP6nFXi8UEEV6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE3C5F80520; Thu,  8 Jun 2023 16:23:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B69EF8016C;
	Thu,  8 Jun 2023 16:23:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9C0BF80199; Thu,  8 Jun 2023 16:23:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C65FEF80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 16:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C65FEF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lC10Wy9g
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f78a32266bso5990065e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Jun 2023 07:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686234187; x=1688826187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yDI2LBlFR8sITE2QFoLi3AUonttlw9k/UkWS9UEYZTk=;
        b=lC10Wy9gPzHJ6NnRAsIwUXnVpDb4XlofuxCgQjtk/rjWYr8LaqO/4tZz5jBjg1dy0+
         i1d3+ywhfHP/z3TZRxyse48aQV29v6+ymP9Y2xfOnmsafHMF7OU8MFnqh5OG4j2SI4Eh
         gr6xDrGNBIF3R9PSPaIiuAOfpjwKg6Nn+7FWN+I7nK8rvfsJ6HxZm5n3z6XTRDebz5BH
         9Xwg9rdveV0wz/Ifywl/ek2ibxhIpCOKIl7fbLZZmMMFrdH3sFjzbjIa2QdEDsfCfR3u
         jSBlxUnUgG9q8tLuHOE6oGt3K+oW2rRrra3zBg+hQsLkYSpNhbWkWZlNdh1Jpy8MMu4C
         uCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686234187; x=1688826187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yDI2LBlFR8sITE2QFoLi3AUonttlw9k/UkWS9UEYZTk=;
        b=jDZicfYYZl7VYbUjCvEXJnR4N51yABrWQlF9Tmrw2BEb24miOTO3/e2R4zWYx4x3Cc
         WJcs87ceOpE0A/ez6cU7eIy7IBMiNCKI9oV6sk+K/DnerNz06JGzhQRXC0rXhR42rYOK
         CeDfmzOTaxKtoUMi530Cd7XQrMBtCP+1r86pgZpdcSEJvbQUnZ9zRMPvh9ktkg3+ghWj
         MxOSPwPTOVI7MpSS7oxHDVnsUVaHW7i8hUKWe1AUnE5tZQeGsZikeq3UMuNe4HOlyRj+
         1LW/Yc9/35j2P9fGL+rjxEsJTKrD5UIWeidrIQSNuqYlbDlr+91Sm4c3uNlFluDPuiKP
         U1EA==
X-Gm-Message-State: AC+VfDx+CgsUuENZKdUHhdAWn6nNl7k1Cc+PW1yuGNoM4von8TZwFGAZ
	sMLmwzxTGdSByGLXrhEH6X3eCw==
X-Google-Smtp-Source: 
 ACHHUZ70DZ36Tht5HkFG+bq4gQE4IqNFTe2YyyowzeRiFrZVN+Uf+ci5LYbWchKC8QNsI1RTxeAM6w==
X-Received: by 2002:a7b:cc84:0:b0:3f7:2323:e012 with SMTP id
 p4-20020a7bcc84000000b003f72323e012mr1498068wma.5.1686234187535;
        Thu, 08 Jun 2023 07:23:07 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 b14-20020adfe30e000000b00307a86a4bcesm1737355wrj.35.2023.06.08.07.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 07:23:06 -0700 (PDT)
Message-ID: <71712242-ffc3-69d0-6abe-6ee61d3630bf@linaro.org>
Date: Thu, 8 Jun 2023 15:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/4] soundwire: qcom: stablity fixes
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
Cc: vkoul@kernel.org, andersson@kernel.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
 <ZH2l-UbMyLi5Uwph@hovoldconsulting.com>
 <5d6bcc6a-151e-ac21-2dd2-f72a91f562d5@linaro.org>
 <ZIGpYPrNYDlkRQIf@hovoldconsulting.com>
 <ZIHMMFtuDtvdpFAZ@hovoldconsulting.com>
 <a236e2f6-0fd7-f814-f68d-ae0a3e3dfc92@linaro.org>
 <ZIHSGf18w7htb9o8@hovoldconsulting.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ZIHSGf18w7htb9o8@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NRKMBOZOCCHXDIT4AD6EYOODOWXSVDUY
X-Message-ID-Hash: NRKMBOZOCCHXDIT4AD6EYOODOWXSVDUY
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NRKMBOZOCCHXDIT4AD6EYOODOWXSVDUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 08/06/2023 14:05, Johan Hovold wrote:
> On Thu, Jun 08, 2023 at 01:45:22PM +0100, Srinivas Kandagatla wrote:
>> On 08/06/2023 13:40, Johan Hovold wrote:
> 
>>> Looking at the above log it seems like we hit a probe deferral somewhere
>>> as some resource is not available yet, and this is eventually turned
>>> into a hard failure that breaks audio as the error is propagated up the
>>> stack.
>>
>> I was looking at this too, And I think this change should help..
>> Not tried it though
> 
>>    	ret = snd_soc_tplg_component_load(component, &audioreach_tplg_ops, fw);
>> -	if (ret < 0) {
>> +	if (ret < 0)
>>    		dev_err(dev, "tplg component load failed%d\n", ret);
>> -		ret = -EINVAL;
>> -	}
> 
> That in itself only seems to make the problem worse with new follow-on
> errors. Looks like a dereference of an error pointer in a codec driver:

Thanks Johan,

I will try to see if we can fix this properly.

--srini
