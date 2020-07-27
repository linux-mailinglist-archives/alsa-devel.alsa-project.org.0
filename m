Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E33522EF44
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 16:15:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 913A216A1;
	Mon, 27 Jul 2020 16:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 913A216A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595859312;
	bh=NcvzRFn08FMk+XpEsMYgYvqc7TT0oEUoNBJzdA6q7Og=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qXVcNvX4hmsdg0kUunsD/uP76a1ThBhFK6U7ZtZM36LTaM+z4Ag3YexCC57raGoJE
	 JdBMAZid+i3uqiOugKb1ZW9WDXytjIcBIGAdWWGCwuMiN+ZyYQ6V20++QduMDtcYAZ
	 KGhueS2EqpZxVRvv44aXh0+b/iCn0jcsLv/3E3Ko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD96AF800AD;
	Mon, 27 Jul 2020 16:13:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1153FF80171; Mon, 27 Jul 2020 16:13:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F274F800DE
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 16:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F274F800DE
IronPort-SDR: XeDKRgkbqR+EmlSndBLkMcARmCVg+koFolNVN+S6OKbbfsPvCfuri/tlk4WLVXyBCzmyWrW1hq
 OwkKwQTgSLjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="212543818"
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; d="scan'208";a="212543818"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 07:13:15 -0700
IronPort-SDR: JzN8m632tAb7YYMiQBLQMIPjhJWU8qI8y81PGQHnF2GJlRZiyLW5mcBtzgCHp3ASKp6cIpegVD
 Ax1KhNirjKww==
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; d="scan'208";a="464072084"
Received: from pdewan-mobl1.amr.corp.intel.com (HELO [10.255.228.220])
 ([10.255.228.220])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 07:13:15 -0700
Subject: Re: [PATCH] ASoC: core: use less strict tests for dailink capabilities
To: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <1jlfj98gb4.fsf@starbuckisacylon.baylibre.com>
 <576823fb-a8a8-1f74-b7e2-d33b734022a7@linux.intel.com>
 <1jk0yp8fb7.fsf@starbuckisacylon.baylibre.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ca2f73d4-d512-37a8-98db-cec2156690d5@linux.intel.com>
Date: Mon, 27 Jul 2020 09:13:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1jk0yp8fb7.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org
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



On 7/27/20 4:42 AM, Jerome Brunet wrote:
> 
> On Fri 24 Jul 2020 at 21:05, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:
> 
>>> Again, this is changing the original meaning of the flag from "playback
>>> allowed" to "playback required".
>>>
>>> This patch (or the orignal) does not explain why this change of meaning
>>> is necessary ? The point I was making here [0] still stands.
>>>
>>> If your evil plan is to get rid of 2 of the 4 flags, why go through the
>>> trouble of the changing the meaning and effect of one them ?
>>
>> My intent was to have a non-ambiguous definition.
> 
> I still fail to understand how it was ambiguous and how throwing an
> error for something that used to work well so far is making things better.
> 
> Maybe there could be have been a better name for it, but what it did was
> clear.
> 
> The flag is even (briefly) documented:
> 	/* DPCM capture and Playback support */
> 	unsigned int dpcm_capture:1;
> 	unsigned int dpcm_playback:1;
> 
> "Support" means the dai_link supports it, not that it is required for it
> work. This is what was implemented.
> 
>>
>> I don't know 'playback allowed' means. What is the point of using this flag
>> if it may or may not accurately describe what is actually implemented? And
>> how can we converge the use of flags since in the contrary 'playback_only'
>> is actually a clear indication of what the link does. We've got to align on
>> the semantics, and I really don't see the point of watering-down
>> definitions. When things are optional or poorly defined, the confusion
>> continues.
> 
> The problem is that commit b73287f0b074 ("ASoC: soc-pcm: dpcm: fix
> playback/capture checks") has changed the semantic:
> * without actually warning that it was doing so in the commit description
> * breaking things for other who relied on the previous semantics
> 
> Previous semantics of the flag allowed to disable a stream direction on
> a link which could have otherwise had it working, if the stream had it.
> It added information/control on the link at least.
> 
> New flag semantics forces the flag and stream capabilities to be somehow
> aligned. This is not clearing the confusion, this is redundant
> information. How is this helping the framework or the users ?
> 
>>
>> WFIW, my 'evil' plan was to rename 'dpcm_playback' as 'can_playback' (same
>> for capture) and replace 'playback_only' by 'can_playback = 1; can_capture
>> = 0'. So this first step was really to align them on the expected behavior
>> and minimal requirements.
> 
> IMO the previous flag semantics was inverted yes, but aligned:
> 
> playback_only = 1 was the same as dpcm_capture = 0
> capture_only = 1 was the same as dpcm_playback = 0
> 
> Having both *_only set does not make sense for a stream, same as having
> none of dpcm_*
> 
> Having none of *_only flag means there is no restriction on the stream,
> same as having both dpcm_* set.
> 
> This seems aligned to me.

Makes no sense to me to have information that's useless. What does 'no 
restrictions' on a stream mean? 'anything goes' is not a scalable design 
principle.
