Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C14C63BC63
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 09:59:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8F40169A;
	Tue, 29 Nov 2022 09:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8F40169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669712380;
	bh=PfWcdXTaqJ4c+TZe40SH2r60n5F2cqiwXp66UMLlvvI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=npxXX1EsQ/RGn0KthE9aE2nPHdeQlEsZPFT7ZgOcW67uc11mILO5udc3UYG0dwN+k
	 bpzuLjGE4nECX1NCcV+wXbxb9FqKt2N0rDNtZJ53DGqFDtuq26BL8bZ2eY4HOqNj3e
	 Frf8AICdYW3ppjiXLmPs56fGFslYKzvQZmhKO9qw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D1C6F80212;
	Tue, 29 Nov 2022 09:58:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15AA5F801F7; Tue, 29 Nov 2022 09:58:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BD85F80137
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 09:58:36 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 71286A0042;
 Tue, 29 Nov 2022 09:58:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 71286A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1669712316; bh=E1j35Db5ErEl01vccrMNKDU/5Gu/3sMqvX5B78FVOmA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YzV8ZDmhzTA4dxt9l12FKKc03DhKIf0lXcp7NwQPaVEo3HUxVcG6nW0RceTkyhcCX
 WWNM0kKOR76hqwMyxb5tWwhH28qBKWgycN620692mWhAcDBgpAcCCMqH2PdDCnfgMA
 TWUI874Lysmx7QjqpOHAqqI3raxHlcvwFtf5RUdQ=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 29 Nov 2022 09:58:27 +0100 (CET)
Message-ID: <07e6e0b8-dff2-6637-3f12-c6215cc9ee18@perex.cz>
Date: Tue, 29 Nov 2022 09:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] [RFC] selftests: alsa - add PCM test
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20221108115914.3751090-1-perex@perex.cz>
 <Y4USPRrDqIfu50hh@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <Y4USPRrDqIfu50hh@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, Takashi Iwai <tiwai@suse.de>,
 Brian Norris <briannorris@chromium.org>,
 Curtis Malainey <cujomalainey@google.com>,
 Liam Girdwood <liam.r.girdwood@intel.com>, Jesse Barnes <jsbarnes@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

On 28. 11. 22 20:55, Mark Brown wrote:
> On Tue, Nov 08, 2022 at 12:59:14PM +0100, Jaroslav Kysela wrote:
> 
>> --- a/tools/testing/selftests/alsa/Makefile
>> +++ b/tools/testing/selftests/alsa/Makefile
>> @@ -7,6 +7,8 @@ ifeq ($(LDLIBS),)
>>   LDLIBS += -lasound
>>   endif
>>   
>> -TEST_GEN_PROGS := mixer-test
>> +TEST_GEN_PROGS := mixer-test pcm-test
>> +
>> +pcm-test: pcm-test.c conf.c
>>   
>>   include ../lib.mk
> 
> This breaks out of tree kselftest builds - if you specify an output
> directory with O= (as all the main automated test systems do) then any
> target specific rules need to prepend $(OUTPUT)/ to specify the right
> location for the output (this also works fine with in tree builds, a
> default OUTPUT is generated).  Unfortunately looking at this just now
> simply fixing that is causing only pcm-test to be built and not the
> existing mixer-test, and explicitly specifying commands for mixer-test
> causes that to be built and not pcm-test even explicitly asking to build
> "all" as the target for reasons I'm not yet clear on.
> 
> You can see an example failure in:
> 
>     https://storage.kernelci.org/next/master/next-20221128/arm64/defconfig/gcc-10/logs/kselftest.log
> 
> The whole kselftest build setup is rather fragile and frustrating to
> work with unfortunately, especially with tests built from multiple
> objects.  The only fix I've come up with thus far is to inline conf.c
> into pcm-test.c (a #include will do the trick) which isn't great.

Thanks Mark for the feedback. I tried to resolve this issue using the rules 
found in the rseq tests programs - create a shared library and link both test 
programs to this library. It seems working for me. Patch [1].

					Jaroslav

[1] https://lore.kernel.org/alsa-devel/20221129085306.2345763-1-perex@perex.cz/

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
