Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D700070383
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 17:20:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ADAD1811;
	Mon, 22 Jul 2019 17:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ADAD1811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563808819;
	bh=eFnNBY9mNphWmiA/1XaJDGGqqo8M2pltcZWdp31Rq1k=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R/IHxO9l3U+5cOg0vVyWS6aWuEwXAbr7XBZYDfqJvrHbfS5oM/7wBf/d4Cj2zx71E
	 GJcg0TWA2LMmrdg/9PZTQAqEDv4ZwzSQxXorG3AOXkuE1Tb1fmNJFktNmyX+3ntsxj
	 5rn7cx7dQ3BFGJ35dzHA1azfDHKZm39Hmkpo2GLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 885B8F803D7;
	Mon, 22 Jul 2019 17:18:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4199F803D1; Mon, 22 Jul 2019 17:18:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_64,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9733F800E8
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 17:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9733F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 08:18:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="177014956"
Received: from agalla-mobl1.amr.corp.intel.com (HELO [10.254.103.46])
 ([10.254.103.46])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jul 2019 08:18:25 -0700
To: Arnd Bergmann <arnd@arndb.de>
References: <20190721142308.30306-1-yamada.masahiro@socionext.com>
 <de9e94ee-9c01-1c0c-4359-b637319a298f@linux.intel.com>
 <s5hftmy8byl.wl-tiwai@suse.de>
 <ec306745-052d-f52c-2cce-d8915822d4ff@linux.intel.com>
 <CAK8P3a2tLuqu+upt0nW8dUzXc+t_kEJwVhLcqY8TXydHLb_nCw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9a56ccdb-397b-3046-4043-49bc20aaa804@linux.intel.com>
Date: Mon, 22 Jul 2019 10:18:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2tLuqu+upt0nW8dUzXc+t_kEJwVhLcqY8TXydHLb_nCw@mail.gmail.com>
Content-Language: en-US
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: use __u32 instead of uint32_t
 in uapi headers
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 7/22/19 8:34 AM, Arnd Bergmann wrote:
> On Mon, Jul 22, 2019 at 3:16 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>> On 7/22/19 7:56 AM, Takashi Iwai wrote:
>>> On Mon, 22 Jul 2019 14:49:34 +0200,
>>> Pierre-Louis Bossart wrote:
>>>>
>>>>
>>>>
>>>> On 7/21/19 9:23 AM, Masahiro Yamada wrote:
>>>>> When CONFIG_UAPI_HEADER_TEST=y, exported headers are compile-tested to
>>>>> make sure they can be included from user-space.
>>>>>
>>>>> Currently, header.h and fw.h are excluded from the test coverage.
>>>>> To make them join the compile-test, we need to fix the build errors
>>>>> attached below.
>>>>>
>>>>> For a case like this, we decided to use __u{8,16,32,64} variable types
>>>>> in this discussion:
>>>>>
>>>>>      https://lkml.org/lkml/2019/6/5/18
>>>>
>>>> these files are shared with the SOF project and used as is (with minor
>>>> formatting) for the firmware compilation. I am not sure I understand
>>>> the ask here, are you really asking SOF to use linux-specific type
>>>> definitions?
>>>
>>> Actually this is linux-kernel UAPI header files, so yes, we should
>>> follow the convention there as much as possible.
>>>
>>> So far we haven't been strict about these types.  But now we have a
>>> unit test for checking it, so it's a good opportunity to address the
>>> issues.
>>
>> Maybe a bit of background. For SOF we split the includes in 4 directories
>>
>> https://github.com/thesofproject/sof/tree/master/src/include
>>
>> - sof: internal includes for firmware only
>> - ipc: definitions of the structures for information exchanged over the
>> IPC channel. This directory is used as is by the Linux kernel and
>> mirrored in include/sound/sof
>> - user: definitions needed for firmware tools, e.g. to generate the
>> image or parse the trace. this directory is not used by the Linux kernel.
>> - kernel: definitions for the firmware format, needed for the loader to
>> parse the firmware files. This is not directly used by applications
>> running on the target, it really defines the content passed to the
>> kernel with request_firmware. This directory is mirrored in the Linux
>> include/uapi/sound/sof directory.
>>
>> Our goal is to minimize the differences and allow deltas e.g. for
>> license or comments. We could add a definition for __u32 when linux is
>> not used, I am just not sure if these two files really fall in the UAPI
>> category and if the checks make sense.
> 
> If you can build all the SOF user space without these headers being
> installed to /usr/include/sound/sof/, you can move them from
> include/uapi/sound/sof to include/sounds/sof and leave the types
> unchanged.

yes we don't need those files to build userspace stuff. The idea was 
that these format definitions establish a contract between userspace 
(more specifically the files stored in /lib/firmware) and the kernel. 
IIRC we wanted to make sure that any changes would be tracked as 
breaking userspace. If the consensus is that the uapi directory is 
strictly used for builds then we should indeed move those files
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
