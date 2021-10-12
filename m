Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF16E42A80F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 17:17:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43D47168C;
	Tue, 12 Oct 2021 17:16:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43D47168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634051869;
	bh=nmBHTb3ca/zyyA36lXeteiyTyeGj+CnLbo13ZWGJAZg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RYHHUwZSJl2J2tc8Lu23TOtnK7Ye6I7mxvzddMuL4ShICwsLkFNKDhei0HPa17LZ+
	 HKjFl3OcZHckQTeVPU/RwaUACuqMeqLcG7bLNt7wBhM0dAtCVInl33EfyxOkDDLaFh
	 G7qTk2bQg9WCN/kwxUl8HoyDAvlzOdmoZ2pJOvqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A9BF80088;
	Tue, 12 Oct 2021 17:16:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59810F80212; Tue, 12 Oct 2021 17:16:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E8A7F80088
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 17:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E8A7F80088
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="288053036"
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="288053036"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 08:16:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="486426134"
Received: from csharp1-mobl.amr.corp.intel.com (HELO [10.213.183.127])
 ([10.213.183.127])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 08:15:59 -0700
Subject: Re: [PATCH v2 1/3] ALSA: pcm: introduce INFO_NO_REWINDS flag
To: Takashi Iwai <tiwai@suse.de>
References: <20211004162423.85323-1-pierre-louis.bossart@linux.intel.com>
 <20211004162423.85323-2-pierre-louis.bossart@linux.intel.com>
 <s5h8rz8ez3s.wl-tiwai@suse.de>
 <c62b3749-c5ea-7b1e-2831-272c8a14d3ac@linux.intel.com>
 <s5hbl43egs8.wl-tiwai@suse.de>
 <1ae2012b-d6bd-77ce-0a9e-98aec4d0f868@linux.intel.com>
 <s5hv9223h86.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e630eb5f-f0f2-c193-ab68-46df26083275@linux.intel.com>
Date: Tue, 12 Oct 2021 10:15:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5hv9223h86.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 P9ter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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



>>> For example, check snd_pcm_playback_avail() and co.  That contains a
>>> couple of more condition checks and corrections due to the possible
>>> boundary crossing.  (Here, runtime->boundary may differ depending on
>>> 32 or 64bit context.)
>>>
>>> The actual implementation of the backward move check would be slightly
>>> different from those, but I hope you get my idea.
>>
>> I think I do but not sure how to precisely deal with the boundary
>> wrap-around.
>>
>> The only suggestion I have at this point would be to compare the 'avail'
>> space before and after the appl_ptr changes in pcm_lib_apply_appl_ptr().
>> If the 'avail' space grows as a result of user-space changes, that
>> indicates a rewind (both for capture and playback), doesn't it?
> 
> There are a few different ways, and a simple one would be to treat as
> a rewind if the change isn't 0..buffer_size.  e.g.
> 
> 	snd_pcm_sframes_t diff = new_ptr - old_ptr;
> 
> 	if (diff >= 0) {
> 		if (diff > buffer_size)
> 			return REWIND;
> 	} else {
> 		if (boundary + diff > buffer_size)
> 			return REWIND;
> 	}
> 	return OK;
> 
> Or, if a rewind is defined to be -buffer_size..-1, it'd be like:
> 
> 	snd_pcm_sframes_t diff = new_ptr - old_ptr;
> 
> 	if (diff >= 0) {
> 		if (boundary - diff <= buffer_size)
> 			return REWIND;
> 	} else {
> 		if (-diff <= buffer_size)
> 			return REWIND;
> 	}
> 	return OK;

ok, I'll trust your math :-)

> In either way, the new_ptr has to be validated beforehand that it's
> within 0..boundary-1.  (old_ptr is assumed to be valid.)

In the 3 of the calls to pcm_lib_apply_appl_ptr(), the check is done
already prior to calling that function
	if (appl_ptr >= runtime->boundary)
		appl_ptr -= runtime->boundary;
	err = pcm_lib_apply_appl_ptr(substream, appl_ptr);


it's rather unclear to me why the same check is not done for sync_ptr, e.g.

if (!(sync_ptr.flags & SNDRV_PCM_SYNC_PTR_APPL)) {
	err = pcm_lib_apply_appl_ptr(substream,	
			     sync_ptr.c.control.appl_ptr);

if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL)) {
	err = pcm_lib_apply_appl_ptr(substream,
				scontrol.appl_ptr);

Should I add a check there, or add a check inside of
pcm_lib_apply_appl_ptr() which would be a duplicate in the majority of
cases?

