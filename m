Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BAE4D2C7B
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 10:50:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A17FA174B;
	Wed,  9 Mar 2022 10:49:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A17FA174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646819412;
	bh=cFfI6vG30MN8c6f0ChAcUW0bKNeCWZvgFlXcJRGc81k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pCRGZppp/c0i716mbNOC3dd0mBuh6Ns7OWPQt1vSeOozcbjzcxQY5mqpffcczwxLT
	 ge0Y/Ldi155MBxzigiPtfWqmcvqqCib/v0Akdf8vY6lSkBAJ18J68D97W/LMSeS8bm
	 RKYG+ND0tkZOJUxY2h+RhcppR72ZJJNSHEoM48Hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 022DEF8012F;
	Wed,  9 Mar 2022 10:49:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29A6FF8016C; Wed,  9 Mar 2022 10:49:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HK_RANDOM_ENVFROM,HK_RANDOM_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BF5CF800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 10:48:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BF5CF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dU09OIWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646819339; x=1678355339;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cFfI6vG30MN8c6f0ChAcUW0bKNeCWZvgFlXcJRGc81k=;
 b=dU09OIWyb58+d1bHSufsnIY2GzOvR9dMkx1ynsE/FqkEHxSWa/7Up8JE
 FWCa7RjyCgYYsCOYc8gIgjT757PMOZqqjfyBg5oey1Y+6BCY1gDQYzIuM
 /kreJV4vwMnk8U5KFg7IfCH/B4WQ9e/4j0WCF4bVb2bRLiZHPQuuf1A6H
 2yoFVG3d4nD3Ae8sitF76+6Qxv3e+YeuRq5NtB1UiWUynKnT8cIqOqCfI
 GnjpfiuyYMamCn9wZVK4Hj9PpDhpXLKNiyfdq/So70F9uffVvtTbUO1Tn
 4l5+sQieecI5Zksqz8INEXKE1hfAXzE90rTAltKmLB9j95LJr+usmqGwA A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="279659803"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="279659803"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 01:48:53 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="642092100"
Received: from hedwards-mobl1.ger.corp.intel.com (HELO [10.213.198.86])
 ([10.213.198.86])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 01:48:52 -0800
Message-ID: <f0c12164-b266-2513-b8e6-323186338181@linux.intel.com>
Date: Wed, 9 Mar 2022 09:48:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v2] ALSA: hda/i915 - avoid hung task timeout
 in i915 wait
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220308172759.920551-1-kai.vehmanen@linux.intel.com>
 <f9f6f831-a05d-2d20-8ade-ab717f342ba5@linux.intel.com>
 <alpine.DEB.2.22.394.2203091035350.3088432@eliteleevi.tm.intel.com>
 <9dabb68b-f2af-ae97-0fb2-869367c496bf@linux.intel.com>
 <s5h5yonjx7i.wl-tiwai@suse.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <s5h5yonjx7i.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Paul Menzel <pmenzel+alsa-devel@molgen.mpg.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 amadeuszx.slawinski@linux.intel.com
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


On 09/03/2022 09:23, Takashi Iwai wrote:
> On Wed, 09 Mar 2022 10:02:13 +0100,
> Tvrtko Ursulin wrote:
>>
>>
>> On 09/03/2022 08:39, Kai Vehmanen wrote:
>>> Hi,
>>>
>>> On Wed, 9 Mar 2022, Tvrtko Ursulin wrote:
>>>
>>>>> -			/* 60s timeout */
>>>>
>>>> Where does this 60s come from and why is the fix to work around
>>>> DEFAULT_HUNG_TASK_TIMEOUT in a hacky way deemed okay? For instance would
>>>> limiting the wait here to whatever the kconfig is set to be an option?
>>>
>>> this was discussed in
>>> https://lists.freedesktop.org/archives/intel-gfx/2022-February/290821.html
>>> ... and that thread concluded it's cleaner to split the wait than try
>>> to figure out hung-task configuration from middle of audio driver.
>>>
>>> The 60sec timeout comes from 2019 patch "ALSA: hda: Extend i915 component
>>> bind timeout" to fix an issue reported by Paul Menzel (cc'ed).
>>>
>>> This patch keeps the timeout intact.
>>
>> I did not spot discussion touching on the point I raised.
>>
>> How about not fight the hung task detector but mark your wait context
>> as "I really know what I'm doing - not stuck trust me".
> 
> The question is how often this problem hits.  Basically it's a very
> corner case, and I even think we may leave as is; that's a matter of
> configuration, and lowering such a bar should expect some
> side-effect. OTOH, if the problem happens in many cases, it's
> beneficial to fix in the core part, indeed.

Yes argument you raise can be made I agree.

>> Maybe using
>> wait_for_completion_killable_timeout would do it since
>> snd_hdac_i915_init is allowed to fail with an error already?
> 
> It makes it killable -- which is a complete behavior change.

Complete behaviour change how? Isn't this something ran on probe so 
likelihood of anyone sending SIGKILL to the modprobe process is only the 
init process? And in that case what is the fundamental difference in 
init giving up before the internal 60s in HDA driver does? I don't see a 
difference. Either party decided to abort the wait and code can just 
unwind and propagate the different error codes.

Regards,

Tvrtko
