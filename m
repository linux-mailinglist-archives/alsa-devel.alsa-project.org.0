Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 153B43004A6
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 14:58:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94CC41EFF;
	Fri, 22 Jan 2021 14:57:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94CC41EFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611323911;
	bh=FtCWijawtf1pvmGGoX4f04WfiGzw91dtKhCfp/6ThA4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dv7Fx7T2+zIpTX7GyoJp7YHkvucp71wA2vdjV6dlWK9D6gTNq7lpg/RFez4CaL/13
	 qyITXAodh43NBT5OU6eV+7M+i3fQzahKyjHH4FcV8ZpmgxlL7G26Ya6WMGOuVUyzDT
	 aI2a9Pg6TX5ejZE6gJepzY6UTFXzAbJFJW5u3dcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFB44F8019B;
	Fri, 22 Jan 2021 14:56:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E46B8F8016E; Fri, 22 Jan 2021 14:56:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 201A9F80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 14:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 201A9F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="XIUj9Fwr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611323812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JI98cuo61T5iHBclSh2mvvuL/8A1Wnp+VCQzU86Xq28=;
 b=XIUj9FwroH/kgH0JEYigUUMA9KBJsw2dNC7cWhuOevoygerPMPSHER5M5nAYQcqU/CqWuV
 GwD7joUgt0r2mAROITntiLRC4/6B35UoxXpuYK5UPHwM4bL8sS81kqiFldQDDkVIN5xxEn
 cZk5dtKvDTs4a04IqP4a91J31QmJp1Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-WCfcMykXP-GRWJz2BRsTeQ-1; Fri, 22 Jan 2021 08:56:50 -0500
X-MC-Unique: WCfcMykXP-GRWJz2BRsTeQ-1
Received: by mail-ed1-f70.google.com with SMTP id n18so2949658eds.2
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 05:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JI98cuo61T5iHBclSh2mvvuL/8A1Wnp+VCQzU86Xq28=;
 b=cThGmK4ZyxKz8y+Hikxe+N0WUJIFXOOk85mUnibOsemlMT2OtdQdJCjHCGWXuqDIDE
 7nmdrYxLqTblGmR5NqTk33X9bShHXaKvQMBxOv6SNveSUjudKwl7KceJ6se1rxjIWB7A
 TzsoXcZM39s/SABnJqtKHr8OTz2TzY0NA0tM7k3xV4mROqy41gMtPdw/bE2nNU4C/9qs
 zpNVkMgDa9qBBCngD9iCHWr/G46Avg7AaJ3eQEdibsJgcKWjS4fC8piMLVHFvOAKRtDO
 2X3+YatU9e0W1FTUK6pe+k+0lZJbgazj3QaPX7710d2MuEfPlwPHXmbQO3CPaa/ir6wX
 QmcA==
X-Gm-Message-State: AOAM5303OVh8vW6+Ql3bkORhmoE9DRHGQW12w9sYL0zDSPEjPxfsWocs
 P6EMdsCfL2KIYCDX2e5DGh0SqK1SybSHcV6ZIxXYWXBwZ4+gkTYkV0Rd6X3hcezzbwT246z1vlD
 kwRPYknr1qMrGR3NhOHCi7jdlJ+BCgwz1NXojknQjB+XQJlsV6EFr+L06sycIWIcou4oo5nieuF
 g=
X-Received: by 2002:aa7:c849:: with SMTP id g9mr3255662edt.48.1611323809134;
 Fri, 22 Jan 2021 05:56:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl0clI+ZXuFxo9o1ewV0yt3mNz3W5XcEpO5OutifVV+ErUWOcrs1ovRdHSTzcsjcZByzZNCg==
X-Received: by 2002:aa7:c849:: with SMTP id g9mr3255644edt.48.1611323808938;
 Fri, 22 Jan 2021 05:56:48 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id e19sm5421577eds.79.2021.01.22.05.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 05:56:48 -0800 (PST)
Subject: Re: [PATCH v2 07/12] ASoC: arizona-jack: Use arizona->dev for
 runtime-pm
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210117160555.78376-1-hdegoede@redhat.com>
 <20210117160555.78376-8-hdegoede@redhat.com>
 <CAHp75Vc92WoJm5T1jbF7UUjCNrVZr2as8ccEWxCZ9aP7z+ZyLA@mail.gmail.com>
 <d0189116-d110-f91a-afd9-70f323833e32@redhat.com>
 <CAHp75Vdzqx0XyykL8wxwxRNk=kBMHmUKDGXJQQtdhT_1CCa4_w@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5c20be27-b083-0303-f29f-4ce8502178d3@redhat.com>
Date: Fri, 22 Jan 2021 14:56:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vdzqx0XyykL8wxwxRNk=kBMHmUKDGXJQQtdhT_1CCa4_w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
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

Hi,

On 1/22/21 10:38 AM, Andy Shevchenko wrote:
> On Fri, Jan 22, 2021 at 2:03 AM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 1/18/21 1:02 PM, Andy Shevchenko wrote:
>>> On Sun, Jan 17, 2021 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>> Can you elaborate switchings from get() to get_sync() in few places
>>
>> Sorry, those 2 changes really should have been in a separate commit.
>> I've put the 2 get -> get_sync() changed in their own commit now
>> with the following commit-msg:
>>
>> """
>> extcon: arizona: Always use pm_runtime_get_sync() when we need the device to be awake
>>
>> Before this commit the extcon-arizona code was mixing pm_runtime_get()
>> and pm_runtime_get_sync() in different places. In all cases where
>> either function is called we make use of the device immediately
> 
> called and we

That changes the meaning of the sentence in ways which does not match
my intent. I've changed this to:

"""
In all cases where pm_runtime_get[_sync]() is called, the code
makes use of the device immediately after the call.
This means that we should always use pm_runtime_get_sync().
"""

Regards,

Hans

