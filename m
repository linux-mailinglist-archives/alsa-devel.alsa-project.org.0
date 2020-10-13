Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDAC28C6F4
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Oct 2020 03:58:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE669169F;
	Tue, 13 Oct 2020 03:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE669169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602554295;
	bh=L9goI6ubFQZeRMHWbwjGQ6RMhay5XVNV8BRPcepIAG4=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pz+QS0xpf0zMcvPkJHnNX+D3CYKnUkQKCM8oo1EG2MJ43vSHZpzADChlDTG0ltIhU
	 F+WqtBtqQ7vW+9K+SLkVSMeeieO+JzzTQhIRlrqLmH3jIeKetplsNHr3cqnlscChia
	 lYpbdEuNFhBKdMipjMxGQT3MhCbYKJPtAUMNZSbo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8FFDF8016F;
	Tue, 13 Oct 2020 03:57:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98563F801DA; Tue, 13 Oct 2020 03:57:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6F6BF800CE
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 03:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6F6BF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="V7Z8AV8X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=bofq6aL5/+29OZsHkddC1oB1vsNZ0db2q5pYJHTnMUQ=; b=V7Z8AV8Xtib3nBBeqBFkaHoOj6
 M+hjTGZc9UkYF0l/s8IUvD50nTKjpAgaNSWPlZwfX1z+qzeZq2rk8fcLfHzWG56VZqbOVVnOi4xEe
 5LaoPCylHKs6v9VE6s60Cw8X1nYKl7oY2Cvjyc4MgTfaOJH0oAw0XkWj2iM9chRv+JhIkg4rJBgCt
 Knw1bXklm4JtT6GHkAnvj/Vm9Dspje1W9/Y55josQ+H2hxfhFmCQjKEZSdCQqvDIHx9UHzUXdzbl6
 SWBcxg9lJFIyqPaRgl0QASA2TmYuNegMxcwv5YwJc/5KJH8ZZuECKkfowS22OuaFlHa7FGLbPrZD/
 259McASA==;
Received: from [2601:1c0:6280:3f0::507c]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS9Yi-0003ts-LD; Tue, 13 Oct 2020 01:57:01 +0000
Subject: Re: [PATCH v2 2/6] ASoC: SOF: Introduce descriptors for SOF client
From: Randy Dunlap <rdunlap@infradead.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Dave Ertman <david.m.ertman@intel.com>, alsa-devel@alsa-project.org
References: <20201005182446.977325-1-david.m.ertman@intel.com>
 <20201005182446.977325-3-david.m.ertman@intel.com>
 <076a0c53-0738-270e-845f-0ac968a4ea78@infradead.org>
 <d9f062ee-a5f0-b41c-c8f6-b81b374754fa@linux.intel.com>
 <9ef98f33-a0d3-579d-26e0-6046dd593eef@infradead.org>
Message-ID: <5b447b78-626d-2680-8a48-53493e2084a2@infradead.org>
Date: Mon, 12 Oct 2020 18:56:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9ef98f33-a0d3-579d-26e0-6046dd593eef@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: parav@mellanox.com, tiwai@suse.de, netdev@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, fred.oh@linux.intel.com,
 linux-rdma@vger.kernel.org, dledford@redhat.com, broonie@kernel.org,
 jgg@nvidia.com, gregkh@linuxfoundation.org, kuba@kernel.org,
 dan.j.williams@intel.com, shiraz.saleem@intel.com, davem@davemloft.net,
 kiran.patil@intel.com
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

On 10/12/20 6:55 PM, Randy Dunlap wrote:
> On 10/12/20 6:31 PM, Pierre-Louis Bossart wrote:
>>
>>>> +config SND_SOC_SOF_CLIENT
>>>> +    tristate
>>>> +    select ANCILLARY_BUS
>>>> +    help
>>>> +      This option is not user-selectable but automagically handled by
>>>> +      'select' statements at a higher level
>>>> +
>>>> +config SND_SOC_SOF_CLIENT_SUPPORT
>>>> +    bool "SOF enable clients"
>>>
>>> Tell users what "SOF" means.
>>
>> This option can only be reached if the user already selected the topic-level option. From there on the SOF acronym is used. Is this not enough?
> 
> Yes, that's enough. I didn't see it. Sorry about that.

Huh. I still don't see that Kconfig option.
Which patch is it in?

I only saw patches 1,2,3 on LKML.

>> config SND_SOC_SOF_TOPLEVEL
>>     bool "Sound Open Firmware Support"
>>     help
>>       This adds support for Sound Open Firmware (SOF). SOF is a free and
>>       generic open source audio DSP firmware for multiple devices.
>>       Say Y if you have such a device that is supported by SOF.
>>
>>>
>>>> +    depends on SND_SOC_SOF
>>>> +    help
>>>> +      This adds support for ancillary client devices to separate out the debug
>>>> +      functionality for IPC tests, probes etc. into separate devices. This
>>>> +      option would also allow adding client devices based on DSP FW
>>>
>>> spell out firmware
>>
>> agree on this one.
>>
>>>
>>>> +      capabilities and ACPI/OF device information.
>>>> +      Say Y if you want to enable clients with SOF.
>>>> +      If unsure select "N".
>>>> +
>>>
>>>
> 
> thanks.
> 


-- 
~Randy

