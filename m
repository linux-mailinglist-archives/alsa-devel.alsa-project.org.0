Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B7D1904C8
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 06:14:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D44C91655;
	Tue, 24 Mar 2020 06:13:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D44C91655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585026858;
	bh=w1vu2TRw+W55FxjFTS2CBdcEGtclyo9EHWTCjr9alxc=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ivbjv29+j2pydfQ8fWK1cWWD6InJuBfVln8RCbBQ6aCdFzeDRvFwveX/rKAYAxObH
	 anwRqBuKYqQOu60Ig0O6tXHcPeoRU9tq/WnQ75UocvNpDm6v9tZ+M62VYlrGHZl6a3
	 6KO+ULBePbvZBvDzqU3OZB76trR2y5c3hZcsIhJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE322F80095;
	Tue, 24 Mar 2020 06:12:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96D18F801F9; Tue, 24 Mar 2020 06:12:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1AB2F800FE
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 06:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1AB2F800FE
IronPort-SDR: LGpHc/4mUt6U6o7VwrgTmfauGJvR+pdzVUa0lzZhPoSmvEpmbL4Y4OmdTVvH0wEJOTUTJUpppo
 NuhBQvcqloUQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 22:12:17 -0700
IronPort-SDR: dydzh+VV8T+FAK3RWjpN89UV6G5IbCkrh/tAopcSz6+/O3ijGrsMnH8w6HI1+leCPGn8LYrEZO
 CbP62SMx3F/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,299,1580803200"; d="scan'208";a="235443424"
Received: from mthamann-mobl.amr.corp.intel.com (HELO [10.134.64.84])
 ([10.134.64.84])
 by orsmga007.jf.intel.com with ESMTP; 23 Mar 2020 22:12:15 -0700
Subject: Re: [PATCH] ALSA: core: sysfs: show components string
To: alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org
References: <20200323193623.3587-1-pierre-louis.bossart@linux.intel.com>
 <20200324015331.GA3679@workstation>
 <d31659cc-d528-345f-1e56-b0cfae36be5c@linux.intel.com>
 <20200324043336.GA8342@workstation>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a74e4b68-d6f6-c12d-d600-d8cb7321cc00@linux.intel.com>
Date: Tue, 24 Mar 2020 00:12:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200324043336.GA8342@workstation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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




>>> On the other hand, the node of sysfs is quite common in Linux because
>>> it's tightly coupled to kernel objects. Let you see files under
>>> 'Documentation/ABI/'. We can find efforts to maintain sysfs node so
>>> safe and stable. Due to this reason, it's better to take more care when
>>> adding new node.
>>>
>>> Would I request you the reason to add this node and the reason that
>>> current ALSA control interface doesn't satisfy your requirement?
>>
>> simplicity for user support. Anyone can peak at a sysfs file, not everyone
>> is familiar with the alsa control interface.
>>
>> We get lots of bug reports from people who are asking for configuration
>> help, and the simpler the command is the better.
> 
> For my information, would I request you to disclose the part of such reports?
> 
> I need supplemental information about the reason to add the alternative
> path to expose it, especially the reason that no developers work to
> improve existent tool relevant to UCM and are going to wish to add the
> alternative without utilizing ALSA control character device.

I don't understand your question, sorry. UCM already uses the control 
interface, it's not a matter of adding a new interface but making it 
easier to visualize the contents reported by the machine driver.

See for example 
https://github.com/alsa-project/alsa-ucm-conf/blob/4722f5b3859903521ba0f92a64d86af31083ca50/ucm2/sof-hda-dsp/HiFi.conf#L145

when people report that their microphone is not reported by 
PulseAudio/UCM, it's very helpful to know what UCM was supposed to use 
in the first place. We don't have a debugger or step-by-step mechanisms 
to figure out what the configurations are.

There is zero intent to advertise this sysfs node as a basis for 
applications to bypass the control interface, if that was what you 
thought I was promoting.
