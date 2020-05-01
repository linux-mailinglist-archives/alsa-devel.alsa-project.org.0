Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D841C0B9A
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 03:19:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C096B168C;
	Fri,  1 May 2020 03:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C096B168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588295957;
	bh=Mz6sN8uk0484dPtngixCMMsVEMJZKClCMUn+e0ge4NU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/53x2aOCv/g4P0c6daBhst8pY5sVNdlymrXE/GqeLykVgpt5bT2xWTx420d5dFQa
	 YEnw61oGWi8ANCUSWi1/+tRqySR+EKCuTguuuecotPLEhReV1GPuutV2bDHub65AAf
	 qbbfAbZwJ45The1NAVGeDBQ72det4N5WbsITKcw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B63F4F800E5;
	Fri,  1 May 2020 03:17:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2503BF801EB; Fri,  1 May 2020 03:17:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE87AF800E5
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 03:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE87AF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="x63oQ56c"
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 376C72073E;
 Fri,  1 May 2020 01:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588295845;
 bh=Mz6sN8uk0484dPtngixCMMsVEMJZKClCMUn+e0ge4NU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=x63oQ56cQA9Bl8D50Rpxxf8WvZrBvFUvuXGolJKStkcDajfnGA0hsDp6X5vr8LFVt
 3ogdumnhPxzwfsfy0gmKrSzIoo1dLds7f2tExur8fAAEz9TWhyC+boj7aJPmSBjMt6
 RDkFis3kbIzztbBb9F2PhXedX++P9qV62kAh56+o=
Date: Thu, 30 Apr 2020 21:17:24 -0400
From: Sasha Levin <sashal@kernel.org>
To: Roy Spliet <nouveau@spliet.org>
Subject: Re: [PATCH AUTOSEL 5.6 12/38] ALSA: hda: Skip controller resume if
 not needed
Message-ID: <20200501011724.GF13035@sasha-vm>
References: <20200424122237.9831-1-sashal@kernel.org>
 <20200424122237.9831-12-sashal@kernel.org>
 <s5himhprr32.wl-tiwai@suse.de>
 <f5f301c7-a74d-7c2e-d182-3f003bfc061b@spliet.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <f5f301c7-a74d-7c2e-d182-3f003bfc061b@spliet.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 stable@vger.kernel.org
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

On Thu, Apr 30, 2020 at 11:36:05PM +0100, Roy Spliet wrote:
>(Minus "Linux kernel", that list has enough volume)
>
>Op 24-04-2020 om 13:44 schreef Takashi Iwai:
>>On Fri, 24 Apr 2020 14:22:10 +0200,
>>Sasha Levin wrote:
>>>
>>>From: Takashi Iwai <tiwai@suse.de>
>>>
>>>[ Upstream commit c4c8dd6ef807663e42a5f04ea77cd62029eb99fa ]
>>>
>>>The HD-audio controller does system-suspend and resume operations by
>>>directly calling its helpers __azx_runtime_suspend() and
>>>__azx_runtime_resume().  However, in general, we don't have to resume
>>>always the device fully at the system resume; typically, if a device
>>>has been runtime-suspended, we can leave it to runtime resume.
>>>
>>>Usually for achieving this, the driver would call
>>>pm_runtime_force_suspend() and pm_runtime_force_resume() pairs in the
>>>system suspend and resume ops.  Unfortunately, this doesn't work for
>>>the resume path in our case.  For handling the jack detection at the
>>>system resume, a child codec device may need the (literally) forcibly
>>>resume even if it's been runtime-suspended, and for that, the
>>>controller device must be also resumed even if it's been suspended.
>>>
>>>This patch is an attempt to improve the situation.  It replaces the
>>>direct __azx_runtime_suspend()/_resume() calls with with
>>>pm_runtime_force_suspend() and pm_runtime_force_resume() with a slight
>>>trick as we've done for the codec side.  More exactly:
>>>
>>>- azx_has_pm_runtime() check is dropped from azx_runtime_suspend() and
>>>   azx_runtime_resume(), so that it can be properly executed from the
>>>   system-suspend/resume path
>>>
>>>- The WAKEEN handling depends on the card's power state now; it's set
>>>   and cleared only for the runtime-suspend
>>>
>>>- azx_resume() checks whether any codec may need the forcible resume
>>>   beforehand.  If the forcible resume is required, it does temporary
>>>   PM refcount up/down for actually triggering the runtime resume.
>>>
>>>- A new helper function, hda_codec_need_resume(), is introduced for
>>>   checking whether the codec needs a forcible runtime-resume, and the
>>>   existing code is rewritten with that.
>>>
>>>BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207043
>>>Link: https://lore.kernel.org/r/20200413082034.25166-6-tiwai@suse.de
>>>Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>>Signed-off-by: Sasha Levin <sashal@kernel.org>
>>
>>This commit is known to cause a regression, and the fix patch is
>>included in today's pull request.  If we apply this, better to wait
>>for the next batch including its fix.
>
>These six patches, plus Takashi's fix on top of them, do not seem to 
>have made it to 5.6.7 or 5.6.8 in the end. Is there a plan to include 

AUTOSEL stuff take a while to hit the stable trees, if you want patches
in quicker they should be tagged for stable...

>them in 5.6.9?

What are the commit ids?

-- 
Thanks,
Sasha
