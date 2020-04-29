Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 397D51BDF70
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 15:49:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8349168A;
	Wed, 29 Apr 2020 15:48:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8349168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588168140;
	bh=7V+sht2yELa1pBbNgCpi4oqnkCgw/9InXUyEVUGwEWs=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UUoRNpNMQPUP/GSb8CVYqatCm9dbpCK/YygoWKSfDK4KGUkNes5uKmChV+j9Hh6Cc
	 e36t4l/Qz3ld4fjEXUldnaD7yxkdobIFXHi/vqhaot8do2YcFcL9MvtprvDEykCdeS
	 wCK2FpQbxgPbFHf6js3qw+24mGaui6to+okej2n0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A46EAF80232;
	Wed, 29 Apr 2020 15:47:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04230F800B6; Wed, 29 Apr 2020 15:47:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5D6BF800B6
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 15:47:12 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 64807A0042;
 Wed, 29 Apr 2020 15:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 64807A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1588168031; bh=4Lqkr6o8drolT2N9pf+I1mPGBAta8DXzqnmx3RuXNqc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=DTjR1/uYAOSyspu5tpCxGxeF5bMzqScM3ACq9gXzsJcTS3+9ypRxL3lbiy2JE7Cqc
 tGKmQspQVzkJkMzecBzs7VLzhhmY6BavcrHnzuWmLoVVVFzYMZuIu9FWyuFSm0jNre
 2ob/iNLp66aYhsjk6SDwveWW72ylIxtJ/r7oSeTs=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 29 Apr 2020 15:47:07 +0200 (CEST)
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
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <45ac8cce-e925-e795-0bca-4b924360cf9a@perex.cz>
Date: Wed, 29 Apr 2020 15:47:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BYAPR11MB2614DF61F17186141D35059C90D00@BYAPR11MB2614.namprd11.prod.outlook.com>
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

Dne 24. 04. 20 v 5:22 Yang, Libin napsal(a):
> Hi Jaroslav,
> 
>>>
>>> Can you clarify what the conflict is and what id you were referring to?
>>
>> The arrays in the ALSA configs are represented like:
>>
>> User syntax:
>>
>> name [
>>     value0
>>     value1
>> ]
>>
>> Internal tree:
>>
>> name.0 value0
>> name.1 value1
>>
>> or
>>
>> name {
>>     0 value0
>>     1 value1
>> }
>>
>> (all three syntaxes are equal, the array just removes the indexes for the
>> readability)
>>
>> This patch tries to change name.0 to something like name.unique-0 or so which
>> is not so much pretty.
>>
>> You can just declare the new sequences like this to avoid clash:
>>
>> EnableSequence.seq3.cset "name='PGA3.0 3 Master Playback Volume' 50"
> 
> I tried your suggestion, the code like:
> If.seq1p {
>          Condition {
>                  Type ControlExists
>                  Control "name='PGA1.0 1 Master Playback Volume'"
>          }
>          True {
>                  EnableSequence.seq1p.cset "name='PGA1.0 1 Master Playback Volume' 50"
>          }
> }
> 
> It seems not work. When I run "alsaucm -c sof-soundwire open sof-soundwire"
> It shows:
> ALSA lib parser.c:470:(parse_sequence) error: string type is expected for sequence command
> ALSA lib parser.c:1257:(parse_verb) error: failed to parse verb enable sequence
> ALSA lib parser.c:1370:(parse_verb_file) error: HiFi.conf failed to parse verb
> ALSA lib main.c:962:(snd_use_case_mgr_open) error: failed to import sof-soundwire use case configuration -22
> alsaucm: error failed to open sound card sof-soundwire: Invalid argument
> 
> My understanding is that "EnableSequence.seq1p.cset" will create
> a new snd_config_t "seq1p" between "EnableSequence" and "cset".
> This will cause executing EnableSequence failure.

Oops. I was too quick in the idea. The configuration is the tree inside memory 
and [] is just a special case where the ids are replaced with the continuous 
integer range, thus:

EnableSequence [
   cmd1 arg1
   cms2 arg2
]

is expanded to:

EnableSequence {
   0 cmd1
   1 arg1
   2 cmd2
   3 arg2
}

or

EnableSequence.0 cmd1
EnableSequence.1 arg1
EnableSequence.2 cmd2
EnableSequence.3 arg2

So if you like to add a new sequence which is outside the declared array, then 
you need to add this:

EnableSequence { cmdid3 cmd3 argid3 arg3 }

or (maybe more readable):

EnableSequence { cmdid3=cmd3 argid3=arg3 }

or:

EnableSequence.cmdid3 cmd3
EnableSequence.argid3 arg3

The ids names can be anything but they must be unique in the block (tree leaf).

The declaration order matters in this context (_arg_ must be right behind 
_cmd_ for the sequences). Note that the functions which works on top of the 
configuration tree (like the in-place evaluation - If blocks) are executed on 
top of this tree (which is parsed at first)! Keep it in the mind.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
