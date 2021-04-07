Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 689C2357257
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 18:46:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8C3D166B;
	Wed,  7 Apr 2021 18:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8C3D166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617813990;
	bh=w9M1aaPGK6HseaRoAD35mjLGoWGlSj6xljqTzpb5ni0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=skfbKRYC7XMPAZGF96aCBnHVdATY08wbzFB7k41Ni7b7oWMgo8cFyS3Dq9KlSrf+K
	 47ZpeEzUl2oOVyuY2m6rAr42GfKW3LcxTTUmkI3pLUjhRje71fn7akCEyVZqp8vfu+
	 rkhPtHiVuk8PDCfSODGaal6TSJSo9U6ybpfvaVJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8605FF80162;
	Wed,  7 Apr 2021 18:45:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EEBEF80168; Wed,  7 Apr 2021 18:45:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCC63F80124
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 18:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCC63F80124
IronPort-SDR: JsUW8RiyWtsln/rpEEQOU2GSp6UhEqfbnN49maeEWOpdkpkIYREueUvsdTcjRHRyLZXiAAr/5D
 1SPMutjsfh3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="173428790"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="173428790"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 09:44:51 -0700
IronPort-SDR: a8ZMiRbBQzQgDE5b0eKSZ0JW0oI0EzkBWx6U612mnYIlWdiu5m9i33Yqj+4ZBb2OlWq4b0JtsE
 jNnDHNfWte9w==
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="458440655"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 09:44:49 -0700
Date: Wed, 7 Apr 2021 19:40:29 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [RFC PATCH] ALSA: hda/hdmi: fix race in handling acomp ELD
 notification at resume
In-Reply-To: <s5hr1jm8494.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2104071925200.864696@eliteleevi.tm.intel.com>
References: <20210407154727.589017-1-kai.vehmanen@linux.intel.com>
 <s5hr1jm8494.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
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

Hey,

On Wed, 7 Apr 2021, Takashi Iwai wrote:

> On Wed, 07 Apr 2021 17:47:27 +0200, Kai Vehmanen wrote:
> > 
> > When snd-hda-codec-hdmi is used with ASoC HDA controller like SOF (acomp
> > used for ELD notifications), display connection change done during suspend,
> > can be lost due to following sequence of events:
> > 
> >   1. system in S3 suspend
> >   2. DP/HDMI receiver connected
> >   3. system resumed
> >   4. HDA controller resumed, but card->deferred_resume_work not complete
> >   5. acomp eld_notify callback
> >   6. eld_notify ignored as power state is not CTL_POWER_D0
> >   7. HDA resume deferred work completed, power state set to CTL_POWER_D0
> > 
> > This results in losing the notification, and the jack state reported to
> > user-space is not correct.
> 
> Hrm, that's odd.  The logic there is: there is a manual call of
> hdmi_present_sense() for each pin in the resume call back of HDMI
> codec driver, so at the point 7, update_eld() is invoked from
> hdmi_present_sense(), which notifies the state to user-space.

In the bug case, the codec resume is completed in step (4). i915 is up and 
running but no HDMI/DP receiver is yet found/setup at this point. So HDA 
codec driver resumes and concludes no HDMI/DP receivers are available.

A bit later, the HDMI/DP receiver is found and i915 calls eld_notify. But 
as HDA controller's soc_resume_deferred() is still running, 
card->power_state==D2 still at this point. patch_hdmi.c:*pin_eld_notify() 
checks power_state, figures card is not in D0 and ignores the 
notification.

Then another moment later, HDA controller's deferred resume work completes 
and card power state is set to D0, but at this point there are no actions 
left that would trigger reprocessing the ELD nodification.

I now changed this so that if card is in D2, that's good enough and we 
process the notification in patch_hdmi.c:*pin_eld_notify().

> So I don't see what's missing there.  Could you check whether the
> scenario above is correct?  The state is updated in
> snd_hdac_acomp_get_eld() call in sync_eld_via_acomp().  We can see
> what state is returned there at which timing.

At this point, state for the ports is still disconnected (monitor was
connected while system was in suspend).

> The only possible case I can think of now is that the graphics driver
> isn't ready for returning the right value at the HDMI codec resume.
> But this should have been covered by the device link...

Yes, this seems to be the case. The device link seems to be honoured,
but the fact that 1) monitor/receiver is not immediately found, and 2) 
ASoC core does some of the resume work in a work-queue, opens this race 
still.

Seems quite odd indeed, but I've now got reports of systems where this is 
hit, and unfortunately it's very systematic on these systems. By adding 
some arbitrary delay to soc_resume_deferred(), I could easily hit this
myself as well on the systems I have at hand.

Br, Kai
