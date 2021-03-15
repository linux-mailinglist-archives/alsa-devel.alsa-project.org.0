Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5689533AF90
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 11:06:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBC68178A;
	Mon, 15 Mar 2021 11:05:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBC68178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615802805;
	bh=z1kDFqNfmC79ARDrr5ggN5EzeDoUruJUhl0z8tlf5hM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KjfXgg66roHLW3CWHLWNBC0k/4RDkgz/Be6pf58LTRoyQMmsM/cB3nJb0YaU19tX9
	 G8pNi+WcVEWEcNoe41dPE5Fhqh2s3Egn+SGMUllPMYyYDJ0OXIpWw/sOgnJPsXZ/F3
	 5zyZgbG+BCOAQjNvzI2FZt3yf4+C+ZaysKURMSf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F9F4F8032D;
	Mon, 15 Mar 2021 11:05:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58487F8023E; Mon, 15 Mar 2021 11:05:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D81E6F8023E
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 11:04:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D81E6F8023E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mpOuv4hx"
Received: by mail-wr1-x432.google.com with SMTP id v15so8358677wrx.4
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 03:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5sZ5UpjkgNLtW67WrWBw/5iK//Kn0zjBWk0o6baJMew=;
 b=mpOuv4hx22qNNNdhDjQDFf+0BsGXZDaApfx09MfV79qdf8GqjmIUfn2rNGBOeeDJvM
 qqdJS0vPUCO44UfilSun63fjQEZ7m5P00wHXBcnoM93hXXEYoaiuNsM79wqpZ/qXdWcz
 sZ4hLJenc0Gyj9bcRhey2smGfJdVKfEWPmXoBt9pQBAyDPZISlZcJksI+Z45fxXy30tj
 n2PhG1YW4lwg683e06T5eRbZ6XkCGEAWKwSMbmk8q7s9uex07KPzfMqbKCowRtkBgnDN
 Wnbh3O9+ekCoXRi6l3YWMjDCV2gIkjhYhIPhkOJ4S/e7FwQDrLzRyvVZC4KEot/d8w8M
 GiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5sZ5UpjkgNLtW67WrWBw/5iK//Kn0zjBWk0o6baJMew=;
 b=QvXbPf9tqkOzBuOqn9NQBvmqze5b3InAoxN8UCSgZ9RYIiIODKx/Bq22X4cXo2dvB3
 kz4tGmBvkxOSlYvsvYLu99paw1edjpsDHGKWKC8m9khBwsJc8clbov6ZGl7HCcqMKOEZ
 Q72Z/wpAP/CFl4EDjcF9E2KzuCK4CHXk/1ECF6hwnXxiDC69wY/7OVZeN+wr0R4pFS2X
 OfLxx0yzjVbCsRPOD4sSNuSrJIgFv36Y9o/nJUMQFTlcGGSokGM6TksT00FsKwufT8iD
 FwY6qNeooSdz7p9sWDMoYLZVbFlhnnlL0+lzQRliqxEMKt/UzkR4QwTRqIFGrguzZXBM
 pWgw==
X-Gm-Message-State: AOAM532Vunh9fRUZL0FFelDfJ9NlIMwQ5/hbKYcM72KClarSMPOJiiO4
 1dRxyQNTSDsq7UVwF62oMA1Onw==
X-Google-Smtp-Source: ABdhPJzFkwZDY5ukBN4jHfebVQYaV+QuTKS2OCkFuPV3HA3Jyvm1CPVExhoEUKVtGDxyOIQEbIlb1w==
X-Received: by 2002:adf:ec83:: with SMTP id z3mr26282581wrn.59.1615802697501; 
 Mon, 15 Mar 2021 03:04:57 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id s9sm12119272wmh.31.2021.03.15.03.04.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Mar 2021 03:04:56 -0700 (PDT)
Subject: Re: [PATCH 3/7] ASoC: codecs: wcd938x: add basic driver
To: Mark Brown <broonie@kernel.org>
References: <20210311173416.25219-1-srinivas.kandagatla@linaro.org>
 <20210311173416.25219-4-srinivas.kandagatla@linaro.org>
 <20210312153443.GI5348@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <9e112ca1-f618-6a6c-fc1e-854de3c8acfe@linaro.org>
Date: Mon, 15 Mar 2021 10:04:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210312153443.GI5348@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
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



On 12/03/2021 15:34, Mark Brown wrote:
> On Thu, Mar 11, 2021 at 05:34:12PM +0000, Srinivas Kandagatla wrote:
> 
>> +static int wcd9380_update_status(struct sdw_slave *slave,
>> +				 enum sdw_slave_status status)
>> +{
>> +	return 0;
>> +}
>> +
>> +static int wcd9380_port_prep(struct sdw_slave *slave,
>> +			     struct sdw_prepare_ch *prepare_ch,
>> +			     enum sdw_port_prep_ops state)
>> +{
>> +	return 0;
>> +}
> 
> If these can legitimately be empty I'd expect the framework to support
> them being omitted.

One of them is not mandatory, I will revisit this before sending out 
next version.

thanks,
srini
> 
