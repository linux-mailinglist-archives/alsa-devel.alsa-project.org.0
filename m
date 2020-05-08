Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A76721CA889
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 12:48:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F0181860;
	Fri,  8 May 2020 12:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F0181860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588934939;
	bh=FeNTjscanod1TIhqiEie593/RJljWiQeW+FklGxsMh4=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LQwCr1if+xWVNk9Rtmv3s6fnhznDeFTtJCY+ODrqydh7917ULWYPES9XfJ6yoSmCF
	 oFHaJ8q9hiWbCJztC53CotOxXY3caX0c953z40KkQApw6aYHpSM78Q+BPA9cZVLFj8
	 tH3Mx/0kfBSqmyq0//9fulXJb3kx+RcY0m2b6rmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 686C8F800AD;
	Fri,  8 May 2020 12:47:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA2ECF8023E; Fri,  8 May 2020 12:47:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBA41F800F6
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 12:47:09 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A197AA004B;
 Fri,  8 May 2020 12:47:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A197AA004B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1588934826; bh=dQHcwvE8LwPmabefrZB9iJF/70pL3if+3+TeD/g2P/8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=LDYLWnnqI+UDyVHRx53xTt+xDwik44bnW/j6vAipsyt6E5fE4VjpvZkY11jlFpMds
 TsW86SQXOdEX0IswarMWPFDFW+kBuKlh+52BNOQrcIDlcdxyAYg+o5vuCkgdw63a52
 7GW1vHpvmVtLWMXacYzMLAnkNS1wX3p6a54NDmK0=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  8 May 2020 12:47:02 +0200 (CEST)
Subject: Re: [alsa-devel] [alsa-lib][RFC PATCH] ucm: reset config id of
 condition items
To: "Yang, Libin" <libin.yang@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "libin.yang@linux.intel.com" <libin.yang@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1587607135-20106-1-git-send-email-libin.yang@linux.intel.com>
 <4b5a1e72-9d8c-221d-f0ea-df44f1ffb1d5@linux.intel.com>
 <79a9e97e-c58a-403a-9ffb-b9d3f9f70ad2@perex.cz>
 <BYAPR11MB2614DF61F17186141D35059C90D00@BYAPR11MB2614.namprd11.prod.outlook.com>
 <45ac8cce-e925-e795-0bca-4b924360cf9a@perex.cz>
 <BYAPR11MB2614D0F1F4470C9572FBB72A90AB0@BYAPR11MB2614.namprd11.prod.outlook.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f0b87412-4df9-72ed-354c-a125f0c41cc4@perex.cz>
Date: Fri, 8 May 2020 12:47:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BYAPR11MB2614D0F1F4470C9572FBB72A90AB0@BYAPR11MB2614.namprd11.prod.outlook.com>
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

Dne 01. 05. 20 v 15:44 Yang, Libin napsal(a):
> Hi Jaroslav,
> 
>>
>> EnableSequence [
>>     cmd1 arg1
>>     cms2 arg2
>> ]
>>
>> is expanded to:
>>
>> EnableSequence {
>>     0 cmd1
>>     1 arg1
>>     2 cmd2
>>     3 arg2
>> }
>>
>> or
>>
>> EnableSequence.0 cmd1
>> EnableSequence.1 arg1
>> EnableSequence.2 cmd2
>> EnableSequence.3 arg2
>>
>> So if you like to add a new sequence which is outside the declared array, then
>> you need to add this:
>>
>> EnableSequence { cmdid3 cmd3 argid3 arg3 }
>>
>> or (maybe more readable):
>>
>> EnableSequence { cmdid3=cmd3 argid3=arg3 }
>>
>> or:
>>
>> EnableSequence.cmdid3 cmd3
>> EnableSequence.argid3 arg3
>>
>> The ids names can be anything but they must be unique in the block (tree leaf).
>>
>> The declaration order matters in this context (_arg_ must be right behind _cmd_
>> for the sequences). Note that the functions which works on top of the
>> configuration tree (like the in-place evaluation - If blocks) are executed on top
>> of this tree (which is parsed at first)! Keep it in the mind.
> 
> Yes, it works with your new suggestion now.
> 
> Do you think this patch is necessary or not? With this patch we can use the
> style of:
> EnableSequence [
>      cmd1 arg1
>      cms2 arg2
> ]

The patch changes the consistency in the id values for the array 
representation in memory (so you cannot address them). I tried to move this 
change to the right place (UCM conditions):

https://github.com/perexg/alsa-lib/commits/array-merge

Could you check this tree? The last commit implements the merge operation for 
the block from the condition tree to the parent tree. Also the "before" and 
"after" hints should be accepted, too.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
