Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF440BE80
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 05:52:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35F15165E;
	Wed, 15 Sep 2021 05:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35F15165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631677947;
	bh=4O18xt7fllfkyzvIUwTYrESNgU8AQfDRjnaua6uwSuo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AzjLyOBn8cCXwoUjHd/fipaQyiHXyLkbgqUOqcYSYqsegNMC4I8adGDH7EmvaQ7lq
	 rZGOYUC+nJK4kn/rMY9jKVPIpsu56uYxXNycYQkSQy5Yt+R7VLg1udQu7Xl4pB/pXs
	 /+zkJMiOUHee6ZsACGEP+dHTtEf+mXOIrGNsOpQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73140F802E8;
	Wed, 15 Sep 2021 05:51:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F352F8027C; Wed, 15 Sep 2021 05:51:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69AF0F80117
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 05:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69AF0F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lSfbmwK3"
Received: by mail-pl1-x62c.google.com with SMTP id v1so770415plo.10
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 20:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=wbjRVASw+zxpO6EqyjGgznQeJsqDXt+6lE5PYCZva9o=;
 b=lSfbmwK3C68S5bprensdr+5G+OVo8mHyoxFOroyMiFhc/VYyoRoRX53hvLZnNTRkJ1
 2Z4reWao0rsk+p0dJSgQd2tbS/u8FU3Ky0z+SXzGvXrY/LgHQaauwJL0L8uakXXZN8pn
 HYAv3SyE1H8V9+aYs873cshuy/T/3H0A6mwdM6cUUxVpHCaK8pgkgcKEhzKbZyuAxMX8
 s8QG3U1zApGi37LbhdjqktKF0o9MmZ6Ef28NI6TlifXo4P48NPMtI7fX19GBPEJrF425
 1F4ru3wCucI6lzbHTahooXeYrxpSOLlHzI+B+ZZJSpLCc4+ouM+L3weMZfto6DdJ3paP
 6wqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wbjRVASw+zxpO6EqyjGgznQeJsqDXt+6lE5PYCZva9o=;
 b=ClHbTjGLZ+qwTIU2nAxxjgRlCyuLt+R/CAQH0cNzvSbCRRNHL7IUYXbQ1WPHCKwfvp
 0tieLYFx2VVk0Nohn4v6zTNHRv8ja1QBOX5Qs3vmTP+1CXYbHkYHat2Mu6zmL592U5cO
 4UTfRusB/+NugMe/7NuIunVCJ/KMl4ZvsV/RI22mtn7Qs4oqRCg5TBm+urUMivISPqDl
 VW3xrIXkbbzOl9khPUyZtxi5dDtjoDuQbyM+OitPyfOsIUXfxe/lcHxyGPbEt7cNkSa5
 G7qLMIko9+/Ir71+mxVpYfkUabFiDc3LcYpjfXL9uHYYT0MpmNRZFLD9MtGzxCrG2Axy
 1/VQ==
X-Gm-Message-State: AOAM533akRBwWfdguTSatFw8sYSeq+UnJhQWAk3Rr+sE57pABh9Ybs0M
 bMTXl75PbuNBJ9PITyYDsUM=
X-Google-Smtp-Source: ABdhPJwyR2awJbwxJgsLK7CMxr1hvs4/Qezlly9hrrdeRiflieEJ8gTcDyzknY90sLFSbE9k2VAOKw==
X-Received: by 2002:a17:902:7ecf:b0:138:fe47:3068 with SMTP id
 p15-20020a1709027ecf00b00138fe473068mr17733505plb.21.1631677860167; 
 Tue, 14 Sep 2021 20:51:00 -0700 (PDT)
Received: from ?IPv6:2001:b400:e3df:8666:4004:ab45:e89d:a0d9?
 (2001-b400-e3df-8666-4004-ab45-e89d-a0d9.emome-ip6.hinet.net.
 [2001:b400:e3df:8666:4004:ab45:e89d:a0d9])
 by smtp.gmail.com with ESMTPSA id v6sm11989003pfv.83.2021.09.14.20.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 20:50:59 -0700 (PDT)
Subject: Re: [PATCH] ASoC: nau8821: Add driver for Nuvoton codec NAU88L21
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20210824041647.1732378-1-wtli@nuvoton.com>
 <1651f0ee-5667-c7ef-9cb0-a648e2ad7d02@linux.intel.com>
 <20210824173237.GM4393@sirena.org.uk>
From: Seven Lee <scott6986@gmail.com>
Message-ID: <cbc4985a-9a09-78e5-9023-708febc4c00f@gmail.com>
Date: Wed, 15 Sep 2021 11:50:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210824173237.GM4393@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Seven Lee <wtli@nuvoton.com>,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 CTLIN0@nuvoton.com, dardar923@gmail.com, supercraig0719@gmail.com
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


On 2021/8/25 上午 01:32, Mark Brown wrote:
> On Tue, Aug 24, 2021 at 11:02:57AM -0500, Pierre-Louis Bossart wrote:
>> On 8/23/21 11:16 PM, Seven Lee wrote:
>>> +static inline void nau8821_sema_release(struct nau8821 *nau8821)
>>> +{
>>> +	if (!nau8821->irq)
>>> +		return;
>>> +	up(&nau8821->jd_sem);
>>> +}
>> is there any specific reason why Nuvoton codec drivers use a semaphore?
>> isn't a mutex good enough?
> I've been asking for documentation of what's going on with the locking
> on every revision of this so far to no success.  As far as I can tell
> the driver is doing something weird where it needs to take and release
> the lock in different contexts which doesn't work with the kernel's
> mutex implementation where you need to take and release the mutex in the
> same context.

Currently, we have deleted the semaphore and actual measurement. We plan to
remove the semaphore after estimation and discussion. We estimate that the
operation time of jack detection is less 100ms so that the risk is much 
smaller.

>
>>> +	switch (event) {
>>> +	case SND_SOC_DAPM_POST_PMU:
>>> +		msleep(125);
>> use a define to keep track of sleep times in a header file?
> I'm never sure that moving the magic numbers for sleeps out of line is
> actually helpful, it's an extra barrier to figuring out the actual
> sequence of operations and unless there's multiple users of the same
> underlying delay it doesn't really buy anything.

I agree with Mark description.

