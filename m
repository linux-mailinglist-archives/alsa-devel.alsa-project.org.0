Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80205312EAC
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 11:16:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1239D1674;
	Mon,  8 Feb 2021 11:15:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1239D1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612779361;
	bh=19e2A+Sm2pvVXcngm6QnLN8Y6nq3lkw0tcu+eUnENaQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j8kmqTQTMUNulH8niqHN0LOM36wJBedhPejI3UTTD1Jcx9p2WAIUuJGSNJekbbLRy
	 yCU2+fisVkmhCsmg4h6uDmssAkJ1qOvd+bMq7vYX1jq4UTJycZmRQIOd+O+ahreqvH
	 9QYUU4+SnH/AFQ5BveCQtD02kEBxqNoBMHQGXzWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BD87F8022D;
	Mon,  8 Feb 2021 11:14:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAFC1F8022B; Mon,  8 Feb 2021 11:14:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 540A0F80114
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 11:14:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 540A0F80114
Received: from [123.112.66.2] (helo=[192.168.0.101])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1l93Yi-0005pM-Vb; Mon, 08 Feb 2021 10:14:21 +0000
Subject: Re: [PATCH] ASoC: SOF: debug: Fix a potential issue on string buffer
 termination
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20210208072257.73900-1-hui.wang@canonical.com>
 <alpine.DEB.2.22.394.2102081129280.864696@eliteleevi.tm.intel.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <d43babca-970c-0f38-7fc3-ab70445c2678@canonical.com>
Date: Mon, 8 Feb 2021 18:14:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2102081129280.864696@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
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


On 2/8/21 5:32 PM, Kai Vehmanen wrote:
> Hi,
>
> On Mon, 8 Feb 2021, Hui Wang wrote:
>
>> The function simple_write_to_buffer() doesn't add string termination
>> at the end of buf, we need to add it on our own if calling that
>> function to write the size of count chars to buf. This change refers
>> to the function tokenize_input() in debug.c and the function
>> sof_dfsentry_trace_filter_write() in trace.c.
> [...]
>> --- a/sound/soc/sof/debug.c
>> +++ b/sound/soc/sof/debug.c
>> @@ -352,9 +352,10 @@ static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
>>   	char *string;
>>   	int ret;
>>   
>> -	string = kzalloc(count, GFP_KERNEL);
>> +	string = kzalloc(count+1, GFP_KERNEL);
> ouch, good catch, thanks! We have this correct in soc/sof/trace.c, but not
> here. To keep up with kernel style, maybe:
>
> +	string = kzalloc(count + 1, GFP_KERNEL);
>
>>   	if (!string)
>>   		return -ENOMEM;
>> +	string[count] = '\0';
> kzalloc() returns zeros, so no need for this.

Right, Other places use kmalloc(), here kzalloc() doesn't need to set 0. 
Will drop it in the v2.

Thanks.

Hui.

>
> Br, Kai
