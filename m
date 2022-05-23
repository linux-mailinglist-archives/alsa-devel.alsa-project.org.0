Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 899EF531E3E
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 23:55:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21D2C1720;
	Mon, 23 May 2022 23:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21D2C1720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653342913;
	bh=3UgIOXmK4AaD6AEWEEsIhTKXCdZUA5b950IrKiOS4Lo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lEm9QE3iDCd2wZNi7cEDmpD5SLlcHEBgJ9pcV/Tb+PJKsOyBGHbHNDvdhobSWMmjy
	 moKF3Gpc7rAC/R8FjQxYobrtoRQDqkrZOBI5LPLMK05zyb/+b7e2uFpVFaVuGPgmNY
	 Wk6BXBBeLLsVTHMX1bb5e6EPMgZaoq984LqgjUDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F43CF8025E;
	Mon, 23 May 2022 23:54:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD789F80236; Mon, 23 May 2022 23:54:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_32,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52D8EF80116
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 23:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52D8EF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="deaz39fo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653342847; x=1684878847;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3UgIOXmK4AaD6AEWEEsIhTKXCdZUA5b950IrKiOS4Lo=;
 b=deaz39focKug8ObfF4Oiwcq6UNdbRY0QGR1pQRqT2hSr1Fsdqscm67ym
 YKD69U23PLU/3Bb+YyBiL6+rHIrcYXW/K2gPpengCnmsjqawzkCAHD2Ew
 +i5xiJanc8lCzG03a0oIHI2aoix+Z6HPr5DFvE6S9UeGaIcxvJ5CW+Vcb
 1ShE7PPZxgqyGmVAdl5rNxYmns0A6GUi8zno+06pkH1tuh5tSxWX876zZ
 Ed8T9Ki8Sj3f3MGUMS9oj7rrOQa8hQz3cihXZIT9kXqN9YqbsVsgq0hE9
 2PDgztfPSYP1fbXbSA40oTzP9vvzWBXes6LU9G7WgFD+cTIi1aBmtNiu2 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253870568"
X-IronPort-AV: E=Sophos;i="5.91,247,1647327600"; d="scan'208";a="253870568"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 14:54:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,247,1647327600"; d="scan'208";a="558865522"
Received: from smannesu-mobl1.amr.corp.intel.com (HELO [10.212.215.154])
 ([10.212.215.154])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 14:54:00 -0700
Message-ID: <5224aed8-02ed-6cac-50bd-999404324c65@linux.intel.com>
Date: Mon, 23 May 2022 16:53:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] Enable SPDIF output on Intel Hades Canyon
Content-Language: en-US
To: Dag B <dag@bakke.com>, alsa-devel@alsa-project.org
References: <5d5924ee-a52a-04f0-5080-2b8d91bce5ba@bakke.com>
 <3526166d-15ce-5260-200e-5c1650388956@linux.intel.com>
 <091a2af3-ff49-97b7-faa5-4527fb70d758@bakke.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <091a2af3-ff49-97b7-faa5-4527fb70d758@bakke.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.com
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



On 5/23/22 16:29, Dag B wrote:
> On 23.05.2022 22:30, Pierre-Louis Bossart wrote:
>> On 5/23/22 15:20, Dag B wrote:
>>> Without the attached patch, the s/pdif output on the Hades Canyon NUC
>>> does not work.
>>>
>>> "Well known" issue, less known fix. As far as I can tell, there is no
>>> risk of any averse side-effects. But a bonus fix is enabling on-wire
>>> headset microphone, by chaining the right 'model' choice for the
>>> hardware.
>>>
>>> If I should Cc: someone directly for this patch to be picked up, please
>>> let me know.
>>>
>>>
>>> I have been running with this patch for half a year or so.
>>>
>>> Patch passes checkpatch.pl
>>>
>>> Patch is based on what 'cyber4o' posted on the insanelymac forum [1].
>>> All the glory to this person, any error is likely mine.
>> Thanks for the patch.
>>
>> You would need a Signed-off-by tag for this patch, and CC: Takashi
>> (added)
>>
>> +    [ALC700_FIXUP_NUC_SPDIF] = {
>>
>> Maybe use HC_NUC, there are multiple versions of those devices?
>>
>> +        .type = HDA_FIXUP_FUNC,
>> +        .v.func = alc700_fixup_nuc_spdif,
>>
>> alc700_fixup_hc_nuc_spdif ?
>>
>> +        .chained = true,
>> +        .chain_id = ALC269_FIXUP_DELL1_MIC_NO_PRESENCE,
>>
>> that chain_id doesn't seem quite right?
>>
> Thank you for reviewing this. I have made adjustments as suggested.
> Revised patch attached.
>  
> The chain_id may appear odd, I can assure you that it does the job. I
> picked up the suggestion from the excellent Arch Linux wiki:
> 
> https://wiki.archlinux.org/title/Intel_NUC#Hades_Canyon_NUC_-_No_External_Microphones

Parts of my comment was the reference to ALC269 when this is an ALC700,
but it seems the two parts are identical if I understand this
definition well:	

ALC269_TYPE_ALC700,

The other point was the reference to Dell when this isn't a Dell
platform. ALC269_FIXUP_DELL1_MIC_NO_PRESENCE may do the job but so far
it's only used for Dell platforms, so it's a bit confusing.

> So my patch equates to:
> 
> a) creating a fixup for enabling spdif
> 
> and
> 
> b) making the new "model=nuc-hc" equate to the spdif fix +
> "model=dell-headset-multi"
> 
> I hope this is acceptable. As stated, I have used this solution for half
> a year or so.
> 
> |Signed-off-by: Dag Bakke <dag@bakke.com>|

usually this comes inside the patch with a git commit title and message.

> 
> Dag B
> 
> 
> 
>>> Some other users with issues: [2] [3]
>>>
>>>
>>> Dag Bakke
>>>
>>>
>>> [1]
>>> https://www.insanelymac.com/forum/topic/339291-guide-hac-mini-osx-mojave-on-intel-hades-canyon-nuc8i7hvknuc8i7hnk/page/8/
>>>
>>>
>>>
>>> 2]https://bbs.archlinux.org/viewtopic.php?id=270917
>>>
>>> [3]
>>> https://www.reddit.com/r/intelnuc/comments/9ft9x8/any_linux_users_got_the_spdif_toslink_to_work_on/
>>>
>>>
>>>
>>>
