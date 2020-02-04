Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DAE1518DE
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 11:33:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E4DE168E;
	Tue,  4 Feb 2020 11:32:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E4DE168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580812428;
	bh=e59rXJtJDh+ZP1Qipr4EYQIuMJVn1dwKqTZqFLWj1xI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fdlCtL+uC/P9S1NLg95x+jyhojRCQOktPzqUVEYu+UrFEaAAU88K5JgcFp42jtU9V
	 QYCmJi4styAB2D8jGNyYGXWkWE1liwoUhmlB17wWRpWVd5QAO/Z9te5z0rq9KiaJzl
	 NwEDVvvE4rgf2YeHbrlImH2CjS8VQOJZVull2Ed4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BCD3F801DB;
	Tue,  4 Feb 2020 11:32:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52270F80162; Tue,  4 Feb 2020 11:32:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 194AEF800F4
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 11:31:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 194AEF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="RbeLQ+pL"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e39480b0000>; Tue, 04 Feb 2020 02:31:39 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 04 Feb 2020 02:31:53 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 04 Feb 2020 02:31:53 -0800
Received: from [10.24.218.119] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 10:31:51 +0000
To: Takashi Iwai <tiwai@suse.de>
References: <20200203100617.3856-1-nmahale@nvidia.com>
 <s5hk154rm2f.wl-tiwai@suse.de>
 <acd84229-07f8-46c5-fe5b-e027e918c56c@nvidia.com>
 <s5hzhdy7q2e.wl-tiwai@suse.de> <s5hpneu7mi5.wl-tiwai@suse.de>
From: Nikhil Mahale <nmahale@nvidia.com>
Message-ID: <1672c477-8795-8a37-4033-bb3982f64225@nvidia.com>
Date: Tue, 4 Feb 2020 16:01:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5hpneu7mi5.wl-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580812299; bh=UKfeQJe9mSop6LyglHXmJr08+VG/luFGK2qBalorGRY=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=RbeLQ+pLCeRDGYI+vlONj77N1zKBPQOfV6w62qLzuBlBdiF23wGsb04xa6t1bn26R
 8Jvw4f6rgFO7vTeOrdyqZL7me37++F2VCcXtQWAZfCgwvZUsbwtefdU+BliiYM83Bu
 9dj4piF1TmzhojuERB4jNzlUxVinpEYa6YGDcPnqq/57dV9BmtkXuzxV1TOxCgM2We
 Y2+/Qb6VH0OT3rstpkzVSEn7pF8RmaGf5AG99r8lbE6KKQsdRMdWviib1WSIZ+QFWm
 JYjmiGrambfQ3Q7QY6FXs8mvoiC9mge+neTD6+SL/gT5BlbHKrtd19cEYOE+4s6P1J
 JSADGA59cPjng==
Cc: alsa-devel@alsa-project.org, martin@larkos.de, kai.vehmanen@linux.intel.com,
 aplattner@nvidia.com
Subject: Re: [alsa-devel] [PATCH] ALSA: hda - Fix DP-MST support for NVIDIA
	codecs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2/4/20 2:33 PM, Takashi Iwai wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Tue, 04 Feb 2020 08:46:17 +0100,
> Takashi Iwai wrote:
>>
>> On Tue, 04 Feb 2020 06:08:19 +0100,
>> Nikhil Mahale wrote:
>>>
>>> On 2/3/20 4:10 PM, Takashi Iwai wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On Mon, 03 Feb 2020 11:06:17 +0100,
>>>> Nikhil Mahale wrote:
>>>>>
>>>>> If dyn_pcm_assign is set, different jack objects are being created
>>>>> for pcm and pins.
>>>>>
>>>>> If dyn_pcm_assign is set, generic_hdmi_build_jack() calls into
>>>>> add_hdmi_jack_kctl() to create and track separate jack object for
>>>>> pcm. Like sync_eld_via_acomp(), hdmi_present_sense_via_verbs() also
>>>>> need to report status change of the pcm jack.
>>>>>
>>>>> Rename pin_idx_to_jack() to pin_idx_to_pcm_jack(). The code to
>>>>> report status change of pcm jack, move it to update_eld() which is
>>>>> common for acomp and !acomp code paths.
>>>>
>>>> Thanks, that's the cause of the regression.
>>>> However, this needs yet more careful handling, I'm afraid.
>>>>
>>>> - hdmi_present_sense_via_verbs() may return true, and its callers
>>>> (both check_presence_and_report() and hdmi_repoll_eld()) do call
>>>> snd_hda_jack_report_sync() again.
>>>>
>>>> - For non-dyn_pcm_assign case, we shouldn't call jack report there,
>>>> but rather simply return true for calling report sync.
>>>>
>>>> - There is another workaround to block the jack report in
>>>> hdmi_present_sense_via_verbs() which is applied after update_eld(),
>>>> and this will be ignored.
>>>>
>>>> So, I guess that we need the conditional application of the individual
>>>> snd_jack_report() only for spec->dyn_pcm_assign==true, and assure that
>>>> hdmi_present() returns false.
>>> Yeah, you are right. But I don't think we should return false from
>>> hdmi_present().
>>>
>>> Before dyn_pcm_assign support for non-acomp drivers:
>>> 1) pcm and pin plug detection were controlled by same jack object, and
>>> 2) change in plug status was reported from snd_hda_jack_report_sync().
>>>
>>> If dyn_pcm_assign support is enabled for non-acomp drivers, then pcm
>>> and pin detection are controlled by different jack object. Now, report
>>> for plug status change of both jack object, requires to be in sync.
>>
>> That's my concern.  Basically we're seeing two different jacks for a
>> single hotplug.  OTOH, from the user-space POV, it must be one jack
>> that should report back.  IOW, with dyn_pcm_assign, you should ignore
>> the jack triggered from the unsol handler but report back only for the
>> jack that is assigned to the PCM.
> 
> Scratch this.  The code is so complex and fuzzing me.  Oh well.
> 
> For dyn_pcm_assign, the snd_hda_jack stuff is used only for the unsol
> event notification but it's not bound with snd_jack object.  Hence
> snd_hda_jack_report_sync() is harmless -- but it's also useless for
> dyn_pcm_assign, too.
> 
> So basically the logic of your patch 4 is OK.  But it's still
> misleading in a few points.
> 
> - The snd_hda_jack state was already updated via
>   snd_hda_jack_pin_sense() call at the beginning of
>   hdmi_present_sense_via_verbs() before calling
>   snd_hda_jack_report_sync().
> 
>   That implies that what's jack->pinse_sense assignment at the end
>   of this function does is to override the jack->pin_sense value that
>   was already updated.
> 
> - snd_hda_jack_report_sync() is superfluous for dyn_pcm_assign case.
>   The jack update was already performed, as mentioned in the above,
>   and hda_jack->jack is NULL for dyn_pcm_assign.
> 
>   Moreover, snd_hda_jack_report_sync() can be replaced with the
>   individual snd_jack_report() call even for non-dyn_pcm_assign case,
>   too.  The difference is only how to get snd_jack object; for
>   dyn_pcm_assign, it's pin_idx_to_jack() while non-dyn_pcm_assign,
>   it's hda_jack->jack.  I guess the call of snd_jack_report() can be
>   unified in a helper (that can be called from sync_eld_via_acomp()
>   too).
The code is really complex and fuzzing me too. Anyways, I have send
out fresh patch for review, see that is exactly what we are
looking for. As you said earlier, cleanup change will go in separate
patch set.

Thanks,
Nikhil Mahale

> thanks,
> 
> Takashi
> 

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
