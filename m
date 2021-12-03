Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B372546924B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 10:25:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D7581F94;
	Mon,  6 Dec 2021 10:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D7581F94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638782723;
	bh=7eL7hTg/gQ+yxm1a7NJ1xPCnS9Ku4/rujW9uVQl9SDM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d9IpaZSvcRZVPn1R6bsfxzm+sqSTcQtHjgA6PFdx8TsMeVJQ2ZfAAcamKrfjp+mg4
	 Oj+gRum+/SKgNwmmbSuElYJ2QCPtxj5Go1Tx+EAX2fuGAG7YfGSvXINk4yaSrSTCaJ
	 dO9cS9YNrDtaicqqL+kn7tBIpByq3UYTAwjWRGRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CE0AF80147;
	Mon,  6 Dec 2021 10:24:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0DDFF80246; Sat,  4 Dec 2021 00:33:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D33C9F800A7
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 00:33:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D33C9F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jxcsgtyI"
Received: by mail-ed1-x52b.google.com with SMTP id y13so17492286edd.13
 for <alsa-devel@alsa-project.org>; Fri, 03 Dec 2021 15:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ORDgCwxDYcfAZntuJ93VZDx/QIq60uOtQOgXtaXnCEY=;
 b=jxcsgtyI++iOJ2ZYC1mi/OMa96CgybRPko4UpPSSkmI5mtGy1OSdgySa6T1TKqnYLg
 b9sYYsrQOtlSWGgYZlGoagq3691GBdDsUVCJaFyLa5fBQOTjVKtjDN8A5RoIME4+Uzdz
 zSrWzHx/nzosiZwp4G407DnWFqzAQXQBG3TtSLYHHqewymSbtJNcTqnwDvTJwBkZAMh8
 cs8InjKeDZJs+Fmf9deRm2Ad7jkvOlMr9lJx9J/qZ4z1aiIIW9MmwxO4agEIcjeknrKc
 kKMYCn19qbj1jzliUGoEve8fQqZNVulrXEy8OoJLRLSs4PRLE8pXv+OOdyS/2g9xTPBX
 wPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ORDgCwxDYcfAZntuJ93VZDx/QIq60uOtQOgXtaXnCEY=;
 b=eZQsNr4FH1wD3gUfJJWLJQUNOtv+MhU8t7BYZTVTXi9f/dLK7djcB0JUR5inaL/MaN
 Bk/6awmsL1wzRkZm1IXZHivBp/O11lWJfLbjVeppzWhpLI9WjZ+fPavaSdeClRxGU+qw
 BDxvCWoWxJIP2eucaZINr74Zlj/eGU6AAVYerUBdUS3QLPGOpI6Nk3gVFP1IUV3glsxK
 6qp9RCMs7HAAAbs0INeIQKQCTzCl8SFehWGUbxcuOgu2xdKFf2AbIzRVudCmnj3KtTd3
 p8LDogZ2GbH/hBVvL1UfLLVsGe81/peL1sLgkp1onZm5MI+E6TRKBK+Jr17MQjhjXE4k
 HL9A==
X-Gm-Message-State: AOAM5321ozNsh6NbLmU6tZnbNzJjSZO+OgZo01Q3m8N4WV9jV50yQci/
 +3vwjHuSCgEdydL/ZjwbZD7GJHR7gVE=
X-Google-Smtp-Source: ABdhPJxZvnsDdocE5MPmYo09qDL4F0N378PRF4vv/HTwLTjLWrvUf9W2sKnaC+4U+ka9pXhbsme51A==
X-Received: by 2002:a17:907:6d20:: with SMTP id
 sa32mr27260981ejc.108.1638574418244; 
 Fri, 03 Dec 2021 15:33:38 -0800 (PST)
Received: from ?IPV6:2001:981:6fec:1:eb68:7cba:f9c7:ce4b?
 ([2001:981:6fec:1:eb68:7cba:f9c7:ce4b])
 by smtp.gmail.com with ESMTPSA id eg8sm2665773edb.75.2021.12.03.15.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 15:33:37 -0800 (PST)
Message-ID: <9484f796-41ba-516f-154f-4980689ca484@gmail.com>
Date: Sat, 4 Dec 2021 00:33:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [bug report] ASoC: Intel: mrfld - create separate module for pci
 part
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20211202151322.GA21325@kili>
 <19647b98-83fd-b493-0fed-3c4e43cbeba8@linux.intel.com>
 <Yap/80NxtU0QLqo0@smile.fi.intel.com> <YaqA30mx4nUVdJoZ@smile.fi.intel.com>
 <27281df2-5429-c9b0-8264-b030faa6a539@linux.intel.com>
From: Ferry Toth <fntoth@gmail.com>
In-Reply-To: <27281df2-5429-c9b0-8264-b030faa6a539@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 06 Dec 2021 10:24:03 +0100
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Hans de Goede <hdegoede@redhat.com>, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
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

Hi

Op 03-12-2021 om 23:58 schreef Pierre-Louis Bossart:
> 
> 
>>>> I would guess that indeed a return 0; is missing, but maybe it's time to
>>>> remove this PCI code completely. I can't think of any user of the PCI
>>>> parts of this driver.
>>>>
>>>> Andy, Hans, Mark, Takashi, what do you think?
>>>
>>> The Edison platform and actually some more based on Intel Merrifield are still
>>> alive and on the (second hand) market. But yes, I would rather focus on making
>>> SOF working there, but via PCI bus (or with ACPI, ASL code for which one should
>>> actually write down, currently it's a device with PCI interface only).
>>
>> That said, Pierre, have you been able to setup your Edison to see anything on
>> I2S with SOF?

I checked with oscilloscope signal was present but did not connect any 
actual codec.

> No, I haven't touched my Edison boards since the initial integration
> with you and Ferry in 2020. I see that the firmware was updated to 1.8
> and the kernel is 5.10+ now, so that should be easier than last time.
> We don't really need any change for the driver probe, PCI is just fine,
> what's missing is an ACPI recipe to enable audio functionality over the
> SSP pins.
> 
