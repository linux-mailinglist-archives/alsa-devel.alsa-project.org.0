Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9493033AF91
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 11:07:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 203D21792;
	Mon, 15 Mar 2021 11:06:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 203D21792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615802840;
	bh=640/7dwngXQChQe8hi/tPbPLZCzP3nlXY5UfWyMoISA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=twpMpL5ULlUSthQExv9nJOxrmevYH9nTLHOUPZZTW3WSi9At0HARdNeSVwrGE+dpP
	 TsjmVMx/sIzznZ1V9f3JySpRZjJ5VJ0UcCnTo5cV1hw9fa7v7SL+noTCGM9jZoH7nI
	 MVFPM5ZgYCHdmp4Jwyij3fYgMvBi/vkdvST4/Zec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE49CF8042F;
	Mon, 15 Mar 2021 11:05:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57BFBF80425; Mon, 15 Mar 2021 11:05:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 984A6F80423
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 11:05:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 984A6F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="inE43yh5"
Received: by mail-wr1-x435.google.com with SMTP id 7so8349223wrz.0
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 03:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8SMiahey8v4BV8lToy6R2QEYE5blVKIxUsXSY4XKVRQ=;
 b=inE43yh5mxV2P8ekxS9v30Ff7VpTHlXC3ZjGUi1QDZ7nvdwPXd1Pg3DfXspYVOqh5T
 w75/Df4puJBkXNBhzHVJw1veurtp9RIKxzlmFK9EZCopSo5WjhgpfyhYbWBo/7dCNJzE
 +jZp4ek4nU+VTf9AS+ULq6g1ERI3ClvKHn8VllyeBcgSDTApgaIX9nIRIghpnt1QTnQe
 2eZl9H4kktV3Dbv0t239yPxofr+dsCvCwgsC/g97ukmq0VJ7WyIVr7z8dK9pc+rMVxEY
 G5fefnzN50DQ9wUmLf2HNX7AnX9K6OV0lWzwtP23Uc+/XoZsR6XChfPLO1YKJZh0KC/8
 L8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8SMiahey8v4BV8lToy6R2QEYE5blVKIxUsXSY4XKVRQ=;
 b=ZSVYSkoPy6wcU2hWU4/J6QtTG0ofxV5079jhpxokHM1uW2UJ5RLbQKy+vAlZZe4w83
 3Nn1JxIvu59FDoqNrIWc3VCsHE3EyMFUsxJXw1BvwSOqryUReE7BsZ/aIAbOafoOjACS
 6RUQ15c8ybN9iaFydH8WgVAXqfh3bn7fMAjbfhnhwJPf6ir+PhWBYX/xg2vOtYj3Ziex
 8h/UIDA421ODNGjdaMVgBLWqIWIxHQKEyfGM8HJEu1BJk3g2akvpZtKKjGznyF3w19OR
 RqW+DFgsQFcClKFdsonHAlo7Eq7LVan3NToV3R5vOZfoODgeJrIfv+nBZoxW62jKnxjS
 qLOA==
X-Gm-Message-State: AOAM5329spqdJrFFhRWq9pNQ8x1Q6z2pBD18KYxKFn0EHykTap2Oq/ve
 dDaqFJU4bGnoDM9fGJvt5ifNkg==
X-Google-Smtp-Source: ABdhPJx7Dtu9ZS9xqeYGJ2GbicmlaYaRmGAHNW4y1Jny+wn05eTed91yW2P8HTmYZ5pXC1gUShoDnQ==
X-Received: by 2002:a5d:5492:: with SMTP id h18mr27037131wrv.340.1615802701475; 
 Mon, 15 Mar 2021 03:05:01 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id g11sm17704589wrw.89.2021.03.15.03.05.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Mar 2021 03:05:01 -0700 (PDT)
Subject: Re: [PATCH 1/7] ASoC: dt-bindings: wcd938x: add bindings for wcd938x
To: Mark Brown <broonie@kernel.org>
References: <20210311173416.25219-1-srinivas.kandagatla@linaro.org>
 <20210311173416.25219-2-srinivas.kandagatla@linaro.org>
 <20210312152143.GH5348@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b68f9c7b-7c44-9a98-01bf-ee1fa8d5ee3a@linaro.org>
Date: Mon, 15 Mar 2021 10:05:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210312152143.GH5348@sirena.org.uk>
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

Thanks for your feedback,

On 12/03/2021 15:21, Mark Brown wrote:
> On Thu, Mar 11, 2021 at 05:34:10PM +0000, Srinivas Kandagatla wrote:
> 
>> +  qcom,mbhc-hphl-switch:
>> +    description: Indicates that HPHL switch type is normally closed!
>> +    type: boolean
>> +
>> +  qcom,mbhc-ground-switch:
>> +    description: Indicates that Headset Gound switch type is normally closed!
>> +    type: boolean
> 
> Why do these descriptions have exclamation marks?

This was not intentional, will remove those instances in next version.

Thanks,
srini
> 
