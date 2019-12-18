Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3712520C
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 20:43:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4A1D950;
	Wed, 18 Dec 2019 20:42:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4A1D950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576698208;
	bh=F02dl5RkrdEry6mI0NcK2qcrFm6GcytEjpwPLjrFnIM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AkXqWFCDn/QOq/druoISypOxzg59QtV1nuGEpfrunRBmZQyTXGW3MsBJpYI+6DSx6
	 c8dMmX5hHAVPj4Ot627IKgk5KKqUwImaxgwXgHXLwO07u/Xm+vunS+9r/cBhAgiDgS
	 6HH8H0F95fhoMcHxAYfG6v67OlK8qefJIn16Y6YA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64285F80255;
	Wed, 18 Dec 2019 20:41:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DA50F8022C; Wed, 18 Dec 2019 20:41:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DF0DF80096
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 20:41:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DF0DF80096
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 11:41:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="415942791"
Received: from dshoemak-mobl.amr.corp.intel.com (HELO [10.251.3.243])
 ([10.251.3.243])
 by fmsmga005.fm.intel.com with ESMTP; 18 Dec 2019 11:41:33 -0800
To: Takashi Iwai <tiwai@suse.de>
References: <20191126141423.21523-1-pierre-louis.bossart@linux.intel.com>
 <s5h4kyqzpge.wl-tiwai@suse.de>
 <0131b134-46dc-991f-230b-fe843f43f078@linux.intel.com>
 <s5hd0cm16vf.wl-tiwai@suse.de>
 <f442ed39-1a86-28fb-b42c-b0e5273cd79a@linux.intel.com>
 <s5hbls57g43.wl-tiwai@suse.de>
 <a90e86ce-b468-28b2-f0a8-30f66429d921@linux.intel.com>
 <s5hr211zd4q.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <828b260d-a22a-4c44-4a0b-644057336b67@linux.intel.com>
Date: Wed, 18 Dec 2019 13:01:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <s5hr211zd4q.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Intel: add PCI ID for
	CometLake-S
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



>>>>> Then the issue I pointed above can be solved as well.
>>>>
>>>> The ifdefs are still needed in the PCI IDs tables
>>>
>>> Yes, but it halves the messes :)
>>
>> I wish it was true :-)
>>
>> In reality having buildbots play with kconfig options does help
>> identify issues at the code level, just like the namespace use helped
>> identify the .arch_ops just above did not belong here.
>> I find it's a constant battle to avoid accumulated crud in the wrong
>> places when dealing with multiple platforms, and when looking at
>> patches it's very hard (at least for me) to realize where the code
>> gets added and the implications.
> 
> But how it can be worse than ifdef...?  From the resultant code POV,
> it's same, the redundant objects are dropped automatically, while you
> can avoid a pitfall like this case to forget the counter-part ifdef,
> which could be identified at first by some randconfig tests.

In a perfect world it'd be fine.
But the reviews are not perfect and it happens that we let things go 
through.
With the _maybe_unused proposal, I would not know which objects are not 
necessary for a specific config, they would be silently removed by a 
tool. Issues reported by randconfig or 'unused variable' warnings are 
painful but at least they do provide a clear hint that something's not 
right (including in my own code).
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
