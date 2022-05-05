Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC5B51BEE4
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 14:11:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C925517E8;
	Thu,  5 May 2022 14:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C925517E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651752677;
	bh=3zx/gEADO4O6IPZ3b2NnUW+Z9SUq6WSSbZ5Igb2dqvo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M8q8eTu95jDXI/soXAVuLxW6M05r4dLrnjBLVGPIxuc6ZKS3wzZICGQiRE4Bya995
	 PD0ZhPwJ43Pa0l4skkf+1g+smGEuF/vmwt1kFnfAlJuuEBHb5RKOvLurTQuLc4g9pW
	 4Os0PcHtHZMgWjYIqXltj6dhuSg9UM+MCMhIVJoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C1E8F8049C;
	Thu,  5 May 2022 14:10:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F47CF8016B; Thu,  5 May 2022 14:10:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 019E5F800BF
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 14:10:09 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 49440A0040;
 Thu,  5 May 2022 14:10:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 49440A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1651752609; bh=0YlvUq55Wf8S0wHGvKJg6ebDaYuR6lmrA5MGI2mAN4k=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=Q9ihQY0TLhRsJaIevkmbzt8OFrIz0k9dGutX1KuH5y7JgY5MahY0mh4nl1jB7z8zS
 0GIgpNCiK4W2uWkpNsttAbDfQlFbyu27S6KBOJ5ttVyNETyazE0mnAyszmoTg2Ry/x
 c6HcOVo/L5N1jhq3vVX/+CD8J+X2fllypYtN55Ws=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  5 May 2022 14:10:06 +0200 (CEST)
Message-ID: <14235475-bd6b-4b86-61f4-8c2aa7f95838@perex.cz>
Date: Thu, 5 May 2022 14:10:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Request for setup of new repositories
Content-Language: en-US
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <YmagC3V3t0k84k9A@workstation>
 <7d90c47a-ce1a-d9d7-ba8a-e794f20487cb@perex.cz>
 <YmfZxmfv5dfgdYG1@workstation> <YmtNgqfFREYKZM6t@workstation>
 <YnO4A43EUdnG0b7n@workstation>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <YnO4A43EUdnG0b7n@workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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

On 05. 05. 22 13:41, Takashi Sakamoto wrote:
> Hi Jaroslav,
> 
> On Fri, Apr 29, 2022 at 11:29:22AM +0900, Takashi Sakamoto wrote:
>> Hi Jaroslav,
>>
>> On Tue, Apr 26, 2022 at 08:38:46PM +0900, Takashi Sakamoto wrote:
>>> Hi Jaroslav,
>>>
>>> On Tue, Apr 26, 2022 at 09:23:38AM +0200, Jaroslav Kysela wrote:
>>>> On 25. 04. 22 15:20, Takashi Sakamoto wrote:
>>>>> Hi Jaroslav, Iwai-san,
>>>>>
>>>>> Thanks for your maintenance for alsa-project organization in github.com.
>>>>> Currently I'd like to add new three repositories under the organization
>>>>> as a part of my work for ALSA firewire stack.
>>>>>
>>>>> I've been maintaining libhinawa since 2014 and recently realized that
>>>>> current design is not necessarily convenient since it includes two
>>>>> functions; operation to Linux FireWire cdev, and operation of ALSA HwDep
>>>>> cdev. Currently I'm working for new library to split the latter operation.
>>>>> Then I'd like you to setup below repositories:
>>>>>
>>>>>    * 'libhitaki'
>>>>>    * 'libhitaki-doc'
>>>>>    * 'hitaki-rs'
>>>>>
>>>>> The library itself and its Rust binding are utilized by
>>>>> 'snd-firewire-ctl-services'[2], thus it's preferable to register them under
>>>>> 'GObject Introspection' Team.
>>>>>
>>>>> Thanks for your assist for my work.
>>>>
>>>> Hi Takashi,
>>>>
>>>> All is set on github. Let me know, if you need other changes.
>>>
>>> Thanks for your arrangement. At present, I have no with for additional
>>> changes.
>>>
>>> However for settings of libhinwa repository, I'd like you to change URL
>>> of documentation. We can see it in right side of top page.
>>>
>>>   * https://github.com/alsa-project/libhinawa
>>>
>>> Currently it points to 'https://takaswie.github.io/libhinawa-docs/'
>>> while it should be 'https://alsa-project.github.io/libhinawa-docs/'.
>>
>> Additionally today I push documentation for libhitaki into the added
>> repository:
>>
>>   * https://github.com/alsa-project/libhitaki-doc
>>   
>> I expect Github Pages makes association between the content and publish
>> URI:
>>
>>   * https://alsa-project.github.io/libhitaki-doc
>>
>> However it doesn't. I think we have missing configuration. Would I ask
>> you to change settings following to this instruction?
>>
>> https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site
> 
> Would I request the above to you, please?

Appologize, I already set this last Friday, but forgot to send the 
confirmation e-mail.

https://alsa-project.github.io/libhitaki-doc/

There's possibility to have the doc and sources in one repo (I can specify doc 
subtree). It may reduce the repositories, but I suspect that your preference 
is to have things separated.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
