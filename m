Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B08201AFD
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 21:14:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C094167C;
	Fri, 19 Jun 2020 21:13:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C094167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592594089;
	bh=45dE/JGLcOQIqNlowrWupINZFFsLLcwgm92kXiogCnI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cjxk0dhRLWvxWT1mWUK5C8yg/+cLkOhLCk3CFi1aitRcAzuH/+CyanQ3vM5oKq4H8
	 SDCYdCsSCqnibXoFgJYOXQDQHheu3vMRrwUKD+qQBHtdghDHGUn1i4JO2SX6Wl/iGO
	 Kfhga3V9Hgf77TRwcEhz7QpsVba9aSL9+XkSkQ2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17A51F800EF;
	Fri, 19 Jun 2020 21:13:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BC5EF80252; Fri, 19 Jun 2020 21:13:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=PRX_BODY_167,PRX_BODY_30,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 890BFF800EF
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 21:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 890BFF800EF
IronPort-SDR: ODJW064ZIxSCT2Tti0ldyt+hKEOGqztioncDUP48wn25IMkB0Mea6lGrNFoCeYTA2cox8QhpX4
 yZZ3GMgcpNHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9657"; a="122793010"
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; d="scan'208";a="122793010"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 12:12:55 -0700
IronPort-SDR: srS7X0GE/o7kzdquAJofFGu+zUHdvFeZ8pkY4oM8HficNyKjKwJZedfUKo3UTpL9autT6I0JL9
 LdG/gEUvPWUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; d="scan'208";a="477733617"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.24.47])
 ([10.213.24.47])
 by fmsmga005.fm.intel.com with ESMTP; 19 Jun 2020 12:12:52 -0700
Subject: Re: [PATCH] ASoC: Intel: haswell: Power transition refactor
To: Curtis Malainey <cujomalainey@google.com>
References: <20200330194520.13253-1-cezary.rojewski@intel.com>
 <293372ae-5270-a1d4-2577-04991c08e33f@intel.com>
 <ee6c0545-a325-8df4-9c26-d823582735af@linux.intel.com>
 <49a16c64-5951-f327-c12a-d3264353b74b@intel.com>
 <685b8be3-4ff8-5012-c900-8521c2772121@linux.intel.com>
 <CAOReqxiTDafvSiUQFZuqhp1DYT_buaCp5oq01QDSgRm-YK57ng@mail.gmail.com>
 <91f8b0d8-6015-6090-40cf-0647eaa73686@intel.com>
 <CAOReqxh8TxfRm64eeQu5Ns-fbO2VuJGSGYQ9UmcYdPCHg_XAHw@mail.gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <971825d7-ce93-631e-d4a6-1c9fc883f018@intel.com>
Date: Fri, 19 Jun 2020 21:12:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAOReqxh8TxfRm64eeQu5Ns-fbO2VuJGSGYQ9UmcYdPCHg_XAHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ross Zwisler <zwisler@google.com>,
 Takashi Iwai <tiwai@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>
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

On 2020-06-19 8:24 PM, Curtis Malainey wrote:
> On Fri, Jun 19, 2020 at 1:34 AM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:
>>
>> On 2020-06-19 3:21 AM, Curtis Malainey wrote:
>>> On Thu, Jun 18, 2020 at 6:19 PM Pierre-Louis Bossart
>>> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>>>
>>> We reverted this patch locally due to regressions and raised the issue
>>> with Cezary on Github, we got no response.
>>>
>>> Curtis
>>>> 8ec7d6043263ecf250b9b7c0dd8ade899487538a is the first bad commit
>>>> commit 8ec7d6043263ecf250b9b7c0dd8ade899487538a
>>>> Author: Cezary Rojewski <cezary.rojewski@intel.com>
>>>> Date:   Mon Mar 30 21:45:20 2020 +0200
>>>>
>>>>        ASoC: Intel: haswell: Power transition refactor
>>>>
>>
>> Hello,
>>
>> This is the very first time I see hear about the issue. You raised no
>> issue Curtis, instead, you did write a comment mentioning me in Closed
>> thread thesofproject/linux which isn't even the driver issue relates to.
> That thread was directed to getting that fixed, you were active on the
> thread, regardless of whether the repo is or not. The bugs fell past
> their SLOs that were sent to your team through issue trackers which
> meant your team was not responding.
>>
>> If you scroll up a bit, in the very same thread there is a message
>> notifying about official path for such issues. Said message was ack'ed
>> by management before posting and that's why it's split from technical
>> explanation.
> And if you scroll down you see this comment from Ross
> https://github.com/thesofproject/linux/pull/1842#issuecomment-606232124
> We both attended meetings with your team where this request was
> ignored. It took you only a couple of days to fix once we took this
> approach yet it sat in the backlog for months. Forgive me if I have
> little faith in your "official path." This was a major blocker for us
> and it sat untouched.
>>
>> We've received no response from Harsha and Cedrik about the issue being
>> risen. Official HSD-ticket is left unchanged since my feedback from 3rd
>> April.
> When someone tags you in a comment it is your job to read it as a
> Github developer, regardless of the status of the thread.
>>
>> Help me help you - don't wait until problem escalates. Adhere to
>> official protocols, notify early and stay in contact. Last time when
>> your 'SOF github-IntelSST BDW' ticket finally did arrive at my desk, I
>> drove back to campus, borrowed the only SAMUS we have and by the end of
>> the week, the problem was fixed. Monday Mar30 you had the official
>> response and patches applied.
> Yes, after months of trying to get this fixed through the "official
> path" and failing. Don't let the issue escalate outside the trackers
> in the first place. Be active and respond to high priority requests. I
> still have yet to see a response from intel regarding a solution on
> any of the bugs regarding this issue. Our PM pinged Carol many times
> during the course of getting this fixed with no response. I don't see
> why I should post there when posting here clearly got a quicker
> response. In fact your are actually CCed on the bug where the revert
> was posted and you didn't even respond. Don't feed me lines.
>>
>> I've forwarded your issue to required entities within Intel so issue is
>> tracked appropriately.
>>
>> Regards,
>> Czarek

Let's make something clear - none of people from our companies found on 
the list who actively post changes or review them are decisive. Neither 
me nor you, Liam and Pierre and whoever else you find missing. That's 
the truth.

 From Intel's perspective, I'm a resource. And those usually work with 
priority list in mind. If I were to take request from every mention/ 
tag/ CC/ To, you'd be waiting at least till Feb next year as that's 
roughly my current schedule. Under no circumstances treat SOF github or 
google-partner account as mean for assigning Intel's resources to fit 
your needs.
You may have different deal with OTC but I'm not even part of SOF 
project team Curtis, thesofproject/linux isn't in my scope. If you 
insist on details, my github account was added to SOF project to help 
them deliver probe feature for you guys. When in need, priority list is 
shifted and resources are allocated where necessary. So, considering 
I've been helping at least 8 diff projects within past months, these 
should demand my full attention daily from then on?

No. That's management job - deal with issue prioritization as they see 
fit. I cannot speak for Harsha's, Cedrik's or Carol's teams and won't be 
defending them here. If what you say is true, it's sad official path 
failed so badly.

Thanks for being honest though, Curtis. I prefer facing the truth 
upfront. While as a dev lead I cannot escalate anything myself really, 
I'll certainly make sure your message is sound for those who can.

Regards,
Czarek
