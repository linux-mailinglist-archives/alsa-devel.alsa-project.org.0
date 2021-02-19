Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4973831F75F
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Feb 2021 11:37:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E26DC165D;
	Fri, 19 Feb 2021 11:36:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E26DC165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613731045;
	bh=dL7ydtXq+ZBoiCI2cVhn1yYggsRzDV3cmC20GK0E1zg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b5mkwcIdXSF73HzgeiYHwo0Uv2f3L74DKZ7ZRxkbg/UibvVDG17RouAI6W9CyelPZ
	 CvG2AvqnslDJ26ADu6ABUy8oppOYRVm05kOU7TMKMdR7PzvFVX3b0EW4Ew297EHTPy
	 KLU/hSzSCKesHjN15Cj+wsLdF907/k/xA+gzBJLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21DABF800C7;
	Fri, 19 Feb 2021 11:35:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF68AF8020B; Fri, 19 Feb 2021 11:35:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CF6FF800C7
 for <alsa-devel@alsa-project.org>; Fri, 19 Feb 2021 11:35:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CF6FF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Y3dqrshq"
Received: by mail-wm1-x333.google.com with SMTP id o24so7081366wmh.5
 for <alsa-devel@alsa-project.org>; Fri, 19 Feb 2021 02:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GJzyDbQEHvg9RkTSSUWmUHNbCY2ZbX3arjdVS2a1MdA=;
 b=Y3dqrshqF9TfTg9lBFRHAc4MLVimbvqcVUlP5n5yYvGF9QcGBOl13ZvykEFpZDSIl3
 ZsQdKHSOIGEH98YBVHAY91xzaVGwxYMmbHBht0DmbQqXBbr45Sa9VApxzOBYGOuev5tQ
 +HG5fxBpQ8PuymjEvpo8mDxSEf+4oryltPfuVi+ExU8l92UtsUKQY48aEcgJzWcdeAqp
 mDuvl/c23FaZnMcbRL7k5yR8rhgcA6S8LnrdRQpwwKdT0rnC57Bo/ZXKu7FAJ9Or7L3a
 a+AXFq/Z7P4pzOQwMx8xhgylQ0a1zrT7Jf/vP7W51E8w9go36Gw+R8vcbladaO2TJ667
 xM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GJzyDbQEHvg9RkTSSUWmUHNbCY2ZbX3arjdVS2a1MdA=;
 b=jyYAp6d3l/O/8pej00l8sE+cpNflw1MddJYMj0RD17vP0wngHFRs6sYmfvoFXxbN1M
 92GI7buo6219FpSgdtxeZnThD5t+Pw+4qftpyl1yO/CW4cLiCiO9wM/gCNQg3BlYojjo
 TbkXm7W5UBq4oYKuCcu+bpkU1Mps7k9cwfMjVlZ8JBCOIQEq+vQYvhauNaz8pk4mmNvX
 lbjBgAoRJkh8DYK2sFH1Dvpr3bOIerLw8xcD0gWYvgX3X2wxGsyNUqLS42sOzGJyFkLY
 xKXNRaeVG7cdFMxmpd9NKl6ZujNeNo7GjbnfiRlPFrAFvIpU5OCvuOD2TrYBEA7S8e2S
 rbqQ==
X-Gm-Message-State: AOAM531ZjNfvbVr5HED/o9Jq3R7Cd+KwSiltJflgrlRZwRwVELOMPoHn
 Af4yFmBuvfF9sFOCZSRdZ+7hh4tUWiVLgQ==
X-Google-Smtp-Source: ABdhPJwRUf2mIwFss3MVliBzY3n+8PXZU8YQpwkoTd/sxal4PHFIG7rtsGlvWyEAajW6SS8eX89mjA==
X-Received: by 2002:a7b:c756:: with SMTP id w22mr7568203wmk.116.1613730947917; 
 Fri, 19 Feb 2021 02:35:47 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id q140sm14326786wme.0.2021.02.19.02.35.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 02:35:47 -0800 (PST)
Subject: Re: [RFC PATCH 1/2] soundwire: add support for static port mapping
To: Vinod Koul <vkoul@kernel.org>
References: <9a688b02-80a6-fb1f-d6fa-36ba2d88d3b9@linux.intel.com>
 <c6278763-57d9-2631-7b43-829259a9ea1f@linaro.org>
 <3ee60ad9-9635-649e-ba67-d40a96b25256@linux.intel.com>
 <487c91f9-f6ea-75c2-9150-52db2de42a3a@linaro.org>
 <eaf13d70-86fe-3e18-7a5a-4043f2d8a22d@linux.intel.com>
 <aaf34f07-5eed-3045-e4c6-dc9416689b20@linaro.org>
 <f960757f-ec8b-6d3f-f00e-27242c687926@linux.intel.com>
 <e962caa8-89c3-4a22-5932-4498c406e8f8@linaro.org>
 <adb91730-35db-db7a-75b3-4771723de945@linux.intel.com>
 <31ff9d2b-760a-374e-5b37-45d8e8116f7b@linaro.org>
 <20210201102709.GT2771@vkoul-mobl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c8bb718d-c06d-2942-9c0b-2a6f97031e10@linaro.org>
Date: Fri, 19 Feb 2021 10:35:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210201102709.GT2771@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

Hi Pierre/Vinod,

On 01/02/2021 10:27, Vinod Koul wrote:
>>> It seems you are in a different solution-space, where the codec driver
>>> needs to notify the master of which ports it needs to use?
>> Correct! As Codec is the place where we have mixer controls ant it can
>> clearly tell which master ports should be used for that particular
>> configuration.
> And that should come from firmware (DT etc) and driver should pass on
> this info

Are you okay with the patch as it is, provided this information is 
populated from DT?



--srini
> 
