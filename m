Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F85B1B6A09
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 01:40:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C6451697;
	Fri, 24 Apr 2020 01:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C6451697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587685212;
	bh=4hbpZdcTfPbAGBHDyVNA+6dOMoqNOuuDw+PduwNGMG8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g8qjz9vmpwsib1hhlRHiNqZIMCcusFae3c+OwUncjH767fwEqHp8k9DIIdi8WxVrK
	 RB2vIzY1sZUy0e03wCMD6TbAas7Uw3RPUy18CmOINITaFua/7DLe0SGwoLQyhkv1EH
	 CVEsFoy5FUoHc8hlwuF9UrvUKR3Qkk8vGbsLWn6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 348D6F801ED;
	Fri, 24 Apr 2020 01:38:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D9DAF801ED; Fri, 24 Apr 2020 01:38:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD595F800F2
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 01:38:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD595F800F2
IronPort-SDR: 7XfNcKh+/gjinEr1sCvp3nrNS6GlC7EOXCFvzs+l3EhBlS6BrG5lsF4H1o48pjErOoCzioFylD
 708c2/tGi+9g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 16:38:21 -0700
IronPort-SDR: 8gikWGmCROnoMKKs1CgGyV674cjut9m7Fvc/I5GxEOmqbOkr6Gq9od/9U3JoktBGBKPPOYt2Dg
 PC9K3GUEZJxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,309,1583222400"; d="scan'208";a="280613632"
Received: from rguevarr-mobl1.amr.corp.intel.com (HELO [10.251.131.195])
 ([10.251.131.195])
 by fmsmga004.fm.intel.com with ESMTP; 23 Apr 2020 16:38:21 -0700
Subject: Re: [alsa-devel] [alsa-lib][RFC PATCH] ucm: reset config id of
 condition items
To: Jaroslav Kysela <perex@perex.cz>, libin.yang@linux.intel.com,
 alsa-devel@alsa-project.org
References: <1587607135-20106-1-git-send-email-libin.yang@linux.intel.com>
 <4b5a1e72-9d8c-221d-f0ea-df44f1ffb1d5@linux.intel.com>
 <79a9e97e-c58a-403a-9ffb-b9d3f9f70ad2@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <aadd877b-c153-6ee3-e955-b0c20d28a472@linux.intel.com>
Date: Thu, 23 Apr 2020 13:27:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <79a9e97e-c58a-403a-9ffb-b9d3f9f70ad2@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 4/23/20 12:36 PM, Jaroslav Kysela wrote:
> Dne 23. 04. 20 v 15:06 Pierre-Louis Bossart napsal(a):
>>
>>
>> On 4/22/20 8:58 PM, libin.yang@linux.intel.com wrote:
>>> From: Libin Yang <libin.yang@intel.com>
>>>
>>> UCMv2 supports "If" statement and will merge the same items with
>>> compound_merge(). If the items have the same id, it will fail to
>>> add the config items. And the id of the item in an array is
>>> automatically generated with the increased number. It is probably
>>> that some items to be merged have the same id. Let's add prefix
>>> in the id to avoid such situation.
>>>
>>> For example:
>>>
>>> If.seq1 {
>>>     Condition {
>>>         Type ControlExists
>>>         Control "name='PGA1.0 1 Master Playback Volume'"
>>>     }
>>>     True {
>>>         EnableSequence [
>>>             cset "name='PGA1.0 1 Master Playback Volume' 50"
>>>         ]
>>>     }
>>> }
>>>
>>> If.seq2 {
>>>     Condition {
>>>         Type ControlExists
>>>         Control "name='PGA2.0 2 Master Playback Volume'"
>>>     }
>>>     True {
>>>         EnableSequence [
>>>             cset "name='PGA2.0 2 Master Playback Volume' 50"
>>>         ]
>>>     }
>>> }
>>>
>>> If.seq3 {
>>>     Condition {
>>>         Type ControlExists
>>>         Control "name='PGA3.0 3 Master Playback Volume'"
>>>     }
>>>     True {
>>>         EnableSequence [
>>>             cset "name='PGA3.0 3 Master Playback Volume' 50"
>>>         ]
>>>     }
>>> }
>>>
>>> If seq1, seq2 and seq3 conditions are true, UCM will fail to initialize.
>>>
>>> This patch rename the config id to avoid the same id conflict.
>>
>> The example confuses me completely, I checked three times and the seq1,
>> seq2 and seq3 parts configure different controls.
>>
>> Can you clarify what the conflict is and what id you were referring to?
> 
> The arrays in the ALSA configs are represented like:
> 
> User syntax:
> 
> name [
>    value0
>    value1
> ]
> 
> Internal tree:
> 
> name.0 value0
> name.1 value1
> 
> or
> 
> name {
>    0 value0
>    1 value1
> }
> 
> (all three syntaxes are equal, the array just removes the indexes for 
> the readability)
> 
> This patch tries to change name.0 to something like name.unique-0 or so 
> which is not so much pretty.
> 
> You can just declare the new sequences like this to avoid clash:
> 
> EnableSequence.seq3.cset "name='PGA3.0 3 Master Playback Volume' 50"

Wow, I had no idea. Thanks for enlightening us :-)

