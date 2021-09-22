Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C48804146EE
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Sep 2021 12:46:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19C0815E5;
	Wed, 22 Sep 2021 12:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19C0815E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632307578;
	bh=Nf07hmNOVq/Gp6J1ZxGBIXD9LLFI9S8GlgPtVSkppxI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j4TUGDvpF/HuUrDZwqeMcAHk5fgmrVF1uRhGKLqwRAczHywVN8eZ3eRs6o7rEDVwB
	 tbRybmh/obiFNgHV/SbGcEsNoxh4XLMESbho8tqRNyfpqV1mDcD84i//cfqp81sy5n
	 OZqRYZITGgHDrhuWeNh4gl3Wo30mHv/ugybPTgQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37760F804CA;
	Wed, 22 Sep 2021 12:44:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA3EEF804CA; Wed, 22 Sep 2021 12:44:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75938F8011F
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 12:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75938F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="t34hOung"
Received: by mail-ed1-x52f.google.com with SMTP id c21so8340605edj.0
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SRZe8k0LGBc2OCz5mUOFuCLcs/67FvV5YwUhYh6HZsY=;
 b=t34hOung2S1fBFw2y0C+HzTILfa9+D3PuKk49e8Rg1fiY7/Eo1SzEwPGGRkIcORkCo
 phwf5Rco0afwLIs+24MBEjrfmveTrKsT1lomUz1Zo688saC1wS6cKZUTV/olAW8btIdc
 tyJGMyHqAgLaVQKGjtrwrDq2mxyfFjRnIr+ecPUjyKOKsAsQbW4MiIjOiM03msZR3S4V
 RjEEaJJmX01AaWnXedAZpVAxZtZh3JEUMmdcxh0xoWyq1G9HWeJQTim/WhhNewU0igEP
 W37d9Y/DBVNGcQx0eHl5f4qBGXxOGgOBqUiSl4XO+mb9uilmQDcufZgDPQ8kwwnxu7z+
 OmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SRZe8k0LGBc2OCz5mUOFuCLcs/67FvV5YwUhYh6HZsY=;
 b=WA1+d9faeP7jK/WPcgP6xEcpVwm8nxnsfU/pN59aZPzRPkGYCc9JGqfM6Mws9flzx5
 F54qzWa/hGxe/cEj6uOatVi2qufl3Yd09qSgK74EsHVcHwks3EK4wCozLe0Gh9co5XS/
 vWsghtFk03kefzbqY7K5k2nZho1MzHDPRBASEEQf3fgnm8d+EfSMggip6NStLyrZ2CFN
 ZFzld14w9MZmFIh0GyUIajgpVVmWuCs2teemamas92RVRI7CEIQBaK6UuY+Ia1JZ0ZT0
 BPtwRxYXtdqupCbSeC3yjH0t88YjWccVA7MfqhoUgo95WBFM36VNFsYI/ToqljRyMGWC
 t/CA==
X-Gm-Message-State: AOAM531XyACRAoXX/HodLHad+Pw8vDVLFD1VDIwQ2gZOMnX56teH6OCe
 yUT9WnLtRgFKcy5NiJekZuEiTg==
X-Google-Smtp-Source: ABdhPJyrnf9oxDk/Jpd9Qw9wJ83DmUFtKnm6bOi+SK7z52FeNh+F8+hfmm6KHPXdqx0GZcpt12A5Dg==
X-Received: by 2002:a17:907:7755:: with SMTP id
 kx21mr39884947ejc.463.1632307478313; 
 Wed, 22 Sep 2021 03:44:38 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id di4sm1023113edb.34.2021.09.22.03.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 03:44:37 -0700 (PDT)
Subject: Re: [PATCH v7 09/22] ASoC: qdsp6: q6afe-dai: move lpass audio ports
 to common file
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210921133709.4973-1-srinivas.kandagatla@linaro.org>
 <20210921133709.4973-10-srinivas.kandagatla@linaro.org>
 <767aebb5-9aa2-8d6c-2569-eaa03f47379f@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3c8e3a24-10e2-c9cb-01ae-498220f234b3@linaro.org>
Date: Wed, 22 Sep 2021 11:44:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <767aebb5-9aa2-8d6c-2569-eaa03f47379f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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



On 21/09/2021 17:51, Pierre-Louis Bossart wrote:
> 
> 
> On 9/21/21 8:36 AM, Srinivas Kandagatla wrote:
>> Various Q6DSP frameworks will use LPASS Audio IP, so move all the hardware
>> specific details to a common file so that they could be reused across
>> multiple Q6DSP frameworks.
>>
>> In this case all the audio ports definations can be moved to a common file
> 
> definitions
done.
> 
>> so that AudioReach and Elite Framework can reuse this.
> 
> What is 'Elite'? It's the only mention of this framework in this entire
> series. It was present in previous versions, I just noticed this today.

Elite is Signal Processing framework name that is used on older Qualcomm 
SoCs.

May be I should just remove that last line from commit log to make it 
consistent across all such patches.



--srini

> 
