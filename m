Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE525322C13
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 15:19:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D6791662;
	Tue, 23 Feb 2021 15:18:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D6791662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614089959;
	bh=kQvj3okU6koNpUGyFn+0IYJwqd32r0MwtJvzxaOSnr0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BvZdgIIOJb1r4tn+uS2+Dima/6h4PMjisNnVgWQv7XTRB8TBQNTBpT/3ul6DiJC49
	 8wy23qJlX7vJth2LY0+rLE8VLtAwiJ+O66S4tw1ktWU32srvFQs3zEcKV4ebapf3I2
	 2B+EJaCIBP1EF/k6uCMAOnqQq9tIzwl8OGDmzgvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1141F8016D;
	Tue, 23 Feb 2021 15:17:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C2A2F8016A; Tue, 23 Feb 2021 15:17:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=PRX_BODYSUB_1,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3C26F80129
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 15:17:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3C26F80129
IronPort-SDR: o1jfm/XWYmjSQd8cgV81D7oz01R7SOuOWugdsLuMbo7V982VIBbQZ2v+9X4cVF+/SwRLvIVZxa
 s6lX6Yhy49UQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="248864685"
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="248864685"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 06:17:37 -0800
IronPort-SDR: kuxeBnjEmImM23M3QaaNtZYI7gkA0PQ6uqVrG0OKdl+8skPpr/C9pbboAJCAEDDi1CGDyj2xS5
 9bTbWycfybyw==
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="499121984"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 06:17:36 -0800
Date: Tue, 23 Feb 2021 16:14:00 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Hui Wang <hui.wang@canonical.com>
Subject: Re: [PATCH] ALSA: hda/hdmi: let new platforms assign the pcm slot
 dynamically
In-Reply-To: <20210223122205.233701-1-hui.wang@canonical.com>
Message-ID: <alpine.DEB.2.22.394.2102231545050.864696@eliteleevi.tm.intel.com>
References: <20210223122205.233701-1-hui.wang@canonical.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com
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

Hi,

thanks for the patch! 

On Tue, 23 Feb 2021, Hui Wang wrote:

> If the platform set the dyn_pcm_assign to true, it will call
> hdmi_find_pcm_slot() to find a pcm slot when hdmi/dp monitor is
> connected and need to create a pcm.
[...]
> This change comes from the discussion between Takashi and
> Kai Vehmanen. Please refer to:
> https://github.com/alsa-project/alsa-lib/pull/118

I did propose to merge the alsa-lib change to give us a bit more time to 
think about how this should be handled in kernel.

While this patch certainly solves the problem of kernel picking ALSA PCMs, 
which current alsa-lib cannot handle, it leaves us a bit halfway. We'd 
create many PCMs that will never be used. And this change is a bit more 
involved.

> So far only intel_hsw_common_init() and patch_nvhdmi() set the
> dyn_pcm_assign to true, here we let tgl platforms assign the pcm slot
> dynamically first, if the driver runs for a period of time and there
> is no regression reported, we could set no_fixed_assgin to true in
> the intel_hsw_common_init(), and then set it to true in the
> patch_nvhdmi().

Staged plan sounds good here, although I'd be fairly cautious with this. 
People using Pulseaudio/Pipewire+UCM won't notice a thing, but I'm sure 
there are people out there assuming a fixed "physical connector -> ALSA 
PCM" mapping and not using UCM. Probably at least some way to opt-out 
would be needed for older platforms.

> +	if (port_num > 6)
> +		spec->no_fixed_assign = true;

I think this is magic enough of a number to be defined separately along 
with some documentation. So basicly user-space has a max limit of 8 now
and two PCMs are reserved for DP-MST, so that brings us to six, right?

This is somewhat arbitrary still. If we simply want to enable the mode for 
TGL only, easier and cleaned would be to set this flag in 
patch_i915_tgl_hdmi() directly.

Br, Kai
