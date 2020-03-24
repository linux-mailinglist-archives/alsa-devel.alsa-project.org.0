Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 477811913C9
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 16:01:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C80E91612;
	Tue, 24 Mar 2020 16:00:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C80E91612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585062084;
	bh=wHdWgw1z7G3SiJoNBBzZ3tzG/+5WPOvSbq5X7qxCxwI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kxIRr8pH2gnOr13ybZToizvU8SzVy1ujCqtRuhOhsF6MW7X/SNvuHg8/8+Q2Z6t29
	 Bxxmexf17gkidgg4AiNrEz7MfvL7ld2868+/FTXRLPGN/eADv81aukLmst33SYb77Q
	 ptWt5Mq5Npa8+SkNmTdd4VZFvZWdLRYLEjnC5b7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C69C8F80227;
	Tue, 24 Mar 2020 15:59:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3387F801F9; Tue, 24 Mar 2020 15:59:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94C0EF80095
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 15:59:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94C0EF80095
IronPort-SDR: 44pGBxCuxQ6UlE7KMLHYbyBQcO7MlfkePbv52Vwu1z9JF17SCoPkqcgF+JWOK++LVE/CLXni3/
 TDYYhPZLjvBw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 07:59:30 -0700
IronPort-SDR: zADVtNoi/pxeQyDd+Wlk104slh/VnpDBfKHepWSytcgdzxTFIpQTO8l4aBl6CHJDXLFvX7fR9B
 rHmJUf3FdYkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,300,1580803200"; d="scan'208";a="357447178"
Received: from bpsimon-mobl2.amr.corp.intel.com (HELO [10.212.197.66])
 ([10.212.197.66])
 by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2020 07:59:29 -0700
Subject: Re: [PATCH] ALSA: core: sysfs: show components string
To: Takashi Iwai <tiwai@suse.de>
References: <20200323193623.3587-1-pierre-louis.bossart@linux.intel.com>
 <20200324015331.GA3679@workstation>
 <d31659cc-d528-345f-1e56-b0cfae36be5c@linux.intel.com>
 <20200324043336.GA8342@workstation>
 <a74e4b68-d6f6-c12d-d600-d8cb7321cc00@linux.intel.com>
 <20200324090152.GA14579@workstation>
 <69761ee4-463b-25ff-1d2d-635a19487663@linux.intel.com>
 <s5h8sjpn6np.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <72705dc9-f91f-2d8c-18f2-384db87b590f@linux.intel.com>
Date: Tue, 24 Mar 2020 09:59:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5h8sjpn6np.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org
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


>>>> when people report that their microphone is not reported by PulseAudio/UCM,
>>>> it's very helpful to know what UCM was supposed to use in the first place.
>>>> We don't have a debugger or step-by-step mechanisms to figure out what the
>>>> configurations are.
>>>
>>> If I get your intension correctly, the addition of sysfs node is just to
>>> investigate which use-case configuration is applied in cases that people
>>> get issues. If so, it's really exaggerative in a point of the concept of
>>> sysfs.
>>>
>>> I have two alternatives. If it's possible to focus on ALSA SoC part only,
>>> addition of node to debugfs is reasonable for this purpose.
>>>
>>> Another alternative is to change output of 'cards' node of procfs. The
>>> latter is commonly available for all cases. For example:
>>
>> I initially wanted to use /proc but thought it was a thing from the
>> past so I looked at sysfs. If this is the recommendation I don't mind
>> using it.
> 
> procfs will practically never die, and it's already there, so I'm fine
> with that path, too, supposing that the primary purpose is for help
> debugging / analyzing.  If it's used by UCM or whatever configuration
> tool, sysfs is the better choice, OTOH.
> 
>> debugsfs is not something the average user is familiar with, and it's
>> not available in all cases. I'd like to extend existing pieces of
>> information than add new things.
> 
> Right, debugfs isn't available per card as default, so it's no good
> option.

ok, let's go with procfs then, thanks for the feedback. I'll work on an 
update and resubmit.
-Pierre
