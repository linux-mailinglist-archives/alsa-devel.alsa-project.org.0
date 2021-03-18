Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59155340A59
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 17:40:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD271169B;
	Thu, 18 Mar 2021 17:40:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD271169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616085651;
	bh=+Kq7JmtD65IdhzfcXp1AzbAbLJtgrh0Y0E2oVPt1Pwo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IBqGJNtZki5XH6/Jm50JMlsbJHseGeGV0JB81hzQUB82LGTWzVwY82+61DWI928yR
	 Zv3h715WKnxm6Bjv6dRwP26D8FACZ0KjvURQVrOmtQBp27uX9pSyWcG051LbdVmv2N
	 pFJcMNVDJ16cQkFtjGxh5z0zW7rUIRHjlmB/bxIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5974BF80163;
	Thu, 18 Mar 2021 17:39:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A987F80165; Thu, 18 Mar 2021 17:39:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2958CF800E0
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 17:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2958CF800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Tbf3usup"
Received: by mail-wm1-x329.google.com with SMTP id
 z6-20020a1c4c060000b029010f13694ba2so3753379wmf.5
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 09:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RyYTaPS9FmKqW1u2B5AyNaA8m6r9vvKfkq/WyuNVTto=;
 b=Tbf3usup6Ov6osbRd9emgRaNIUwHOlEIXxBVwauVta3eGI1R3Z36XGJMp7CtLlYRJO
 0ARnBxx4Crz70nC8Vg/5ilGf1+jQbAuD35oOLotXJxNuZPsIndYc3y05HzPhsGPPqqNP
 vu/3eaIgWjfJdulsWYC0+X27wL4aGRUZJ62R8dS6SwWT+YFFsbWgqgtk+8N4gUJwoJ9D
 lvghO0kKzaCm/oSDxX5Y9rdF1lg/+4/QKsBEGYbcSAgnM30kqR1Q9tduYzZemI3v/vls
 tqKvGwoNrhTacomUmQtSradchOybaKmwtreuQW96ABBE7KQ4app0phSaB02aBDuSruUl
 bWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RyYTaPS9FmKqW1u2B5AyNaA8m6r9vvKfkq/WyuNVTto=;
 b=hGqg8Dd6srte9K4/uq1kpJBc7614i/jsriEKSpGZwr5PPnaqnQZbQ0NFPvbhdQs9Im
 NLvMbBTRk6DjM9slTawF5rk5lR5HXDxxLI4EDAHP5zmd5yDUGetuLmNwnZmjjrYZkhYQ
 lHGBzXT+WQiGbfrcXQ9nmp/gBasu+XyhQnB8KEJtXbrzXL7JvAKW8uOJMme4Ee2a2LUK
 61dzRSEtt4Z3cTkJaRJ2mFn9d/okH/G1oYgdFUdaxXIH/thBW/HVPjqBL3ghxLMQqOWN
 VBgaV514BqQeiqTEHsH1EdXx7ZLAIPFNpWgUBO6ansk10dKlcp5cHqWdsI3qdBA6fhlP
 DaZQ==
X-Gm-Message-State: AOAM531CXRdPo3wCZ5bf6B3ePXuLBQK/uSSWR5ub0sS3DSn6P9plX/4z
 DM7skHDPtSMLIQwCqRY8YimGYi3HLeupKg==
X-Google-Smtp-Source: ABdhPJzfobwd7oHHVg1jM8v64N2gH6zJ78awyYzfRtACJD4oFOBuLCW1QKNSJNU53dheDFqWv1Hm3A==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr25327wmq.123.1616085556949; 
 Thu, 18 Mar 2021 09:39:16 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id z82sm2842931wmg.19.2021.03.18.09.39.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Mar 2021 09:39:16 -0700 (PDT)
Subject: Re: ASoC topology loading vs card bind
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <09c77d7e-3def-0643-b838-94d748529333@linaro.org>
 <4a4c96df-b145-5bb7-ad91-e5d3644f704c@linux.intel.com>
 <5b10ad71-44f0-d0f7-431e-18447e11596b@linaro.org>
 <27b526b6-9432-f014-d639-d3c80af191d3@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <eefaab3d-896c-7abd-18b8-3761ef63190f@linaro.org>
Date: Thu, 18 Mar 2021 16:39:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <27b526b6-9432-f014-d639-d3c80af191d3@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
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



On 18/03/2021 12:40, Pierre-Louis Bossart wrote:
>>
>> Ex:
>> Lets say we have a dai link in soundcard which has cpus->dai_name 
>> pointing to an FE dai ("MultiMedia1") available in topology file.
>  > Why would you want to do this? You are hard-coding an FE dailink in the
> machine driver, when it can be described in the topology.


By the looks of it, FE DAI and DAI link are created from single PCM 
object (SectionPCM), so no need to describe it separately.

--srini
