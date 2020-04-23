Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C04BE1B6212
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 19:37:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 648DC169F;
	Thu, 23 Apr 2020 19:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 648DC169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587663466;
	bh=Hj4numYq+Pf8UZS4RjrUcJGml4jnQjBPUvbIs/3kBTw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sYbc4+fBos66465rY9peryUiH/GeKoXZJrVALrTEyiH0cckQigF7RjrSs2NeJIQW/
	 SKXodrTeBpYtW1nwE9Yh/1qLP6eYDkx7CbEt8Lj0t8hQgaLlvX7lwncPFik4DEwMOH
	 quIRvc/MIutxTENokJ+oQMayaabKXG0KT+RWsPZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F38A2F80212;
	Thu, 23 Apr 2020 19:36:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED4C5F801F5; Thu, 23 Apr 2020 19:36:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C45B2F80121
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 19:36:09 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E3524A0040;
 Thu, 23 Apr 2020 19:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E3524A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1587663367; bh=vSj8/Qy2kNXIcWX2PH5tOXhlXmsfmgsKIJ5idyCj0YI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OPFPgto7T2rzKcc7Itopxz0jzuO1qWE1LVw3RgsJyxCwwyxzz8ue3I6h1B0HeT381
 TNJe5jN6bShXMTWSGPF/KrDkZfpuRwZTcSDFiBiHWm1lqom6YDqlpE79HmSaAjoe3X
 0gx3yT3h4NE47KbL1SOnE8stbt2NM0KS2ZHpg+rY=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 23 Apr 2020 19:36:03 +0200 (CEST)
Subject: Re: [alsa-devel] [alsa-lib][RFC PATCH] ucm: reset config id of
 condition items
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 libin.yang@linux.intel.com, alsa-devel@alsa-project.org
References: <1587607135-20106-1-git-send-email-libin.yang@linux.intel.com>
 <4b5a1e72-9d8c-221d-f0ea-df44f1ffb1d5@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <79a9e97e-c58a-403a-9ffb-b9d3f9f70ad2@perex.cz>
Date: Thu, 23 Apr 2020 19:36:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4b5a1e72-9d8c-221d-f0ea-df44f1ffb1d5@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: libin.yang@intel.com
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

Dne 23. 04. 20 v 15:06 Pierre-Louis Bossart napsal(a):
> 
> 
> On 4/22/20 8:58 PM, libin.yang@linux.intel.com wrote:
>> From: Libin Yang <libin.yang@intel.com>
>>
>> UCMv2 supports "If" statement and will merge the same items with
>> compound_merge(). If the items have the same id, it will fail to
>> add the config items. And the id of the item in an array is
>> automatically generated with the increased number. It is probably
>> that some items to be merged have the same id. Let's add prefix
>> in the id to avoid such situation.
>>
>> For example:
>>
>> If.seq1 {
>> 	Condition {
>> 		Type ControlExists
>> 		Control "name='PGA1.0 1 Master Playback Volume'"
>> 	}
>> 	True {
>> 		EnableSequence [
>> 			cset "name='PGA1.0 1 Master Playback Volume' 50"
>> 		]
>> 	}
>> }
>>
>> If.seq2 {
>> 	Condition {
>> 		Type ControlExists
>> 		Control "name='PGA2.0 2 Master Playback Volume'"
>> 	}
>> 	True {
>> 		EnableSequence [
>> 			cset "name='PGA2.0 2 Master Playback Volume' 50"
>> 		]
>> 	}
>> }
>>
>> If.seq3 {
>> 	Condition {
>> 		Type ControlExists
>> 		Control "name='PGA3.0 3 Master Playback Volume'"
>> 	}
>> 	True {
>> 		EnableSequence [
>> 			cset "name='PGA3.0 3 Master Playback Volume' 50"
>> 		]
>> 	}
>> }
>>
>> If seq1, seq2 and seq3 conditions are true, UCM will fail to initialize.
>>
>> This patch rename the config id to avoid the same id conflict.
> 
> The example confuses me completely, I checked three times and the seq1,
> seq2 and seq3 parts configure different controls.
> 
> Can you clarify what the conflict is and what id you were referring to?

The arrays in the ALSA configs are represented like:

User syntax:

name [
   value0
   value1
]

Internal tree:

name.0 value0
name.1 value1

or

name {
   0 value0
   1 value1
}

(all three syntaxes are equal, the array just removes the indexes for the 
readability)

This patch tries to change name.0 to something like name.unique-0 or so which 
is not so much pretty.

You can just declare the new sequences like this to avoid clash:

EnableSequence.seq3.cset "name='PGA3.0 3 Master Playback Volume' 50"

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
