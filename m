Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BA041EA2C
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 11:54:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04CDB16DC;
	Fri,  1 Oct 2021 11:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04CDB16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633082089;
	bh=U8zAJCxBg1krB/fvwpClEGGvIBz5l1rainTNWvCWniY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XDyiMrswKkdjW01KIteyEAdpnNSs+HsDCmcg5kJt9YBWYM39uKPUiNJ72RSHGbmI/
	 Gsb/uGYht8Opc6uN8qunjxRrP28CdXGhsRceUHrXAWEYh50U0qvRXaehPeop7qosk1
	 3My88AakvdNhsXynkPZsaAaP6xh0RbCzaQhlmL7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AA00F8026D;
	Fri,  1 Oct 2021 11:53:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC23AF80245; Fri,  1 Oct 2021 11:53:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED143F801F7
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 11:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED143F801F7
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="225041219"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="225041219"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 02:53:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="618986914"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 02:53:17 -0700
Date: Fri, 1 Oct 2021 12:46:26 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: hda: how to implement component master_unbind?
In-Reply-To: <s5ha6jxnekp.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2110011129450.3554566@eliteleevi.tm.intel.com>
References: <alpine.DEB.2.22.394.2109221456080.3554566@eliteleevi.tm.intel.com>
 <s5ha6jxnekp.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, alsa-devel@alsa-project.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
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

On Tue, 28 Sep 2021, Takashi Iwai wrote:

> Removing a component from the card is a PITA for now, indeed,
> especially when its influence is over different APIs (PCM, control,
> whatever)...
> 
> One thing I can think of is to perform like the vga_switcheroo
> handling in hda_intel.c; it's essentially a forced runtime suspend,
> and disable the whole card.  But in the case of audio-component
> unbind, we need to think about re-binding -- or completely ignore
> re-binding until the whole driver gets unloaded. 

thanks for the feedback! The switcheroo approach doesn't work too well for 
integrated HDA controllers that will typically have other codecs connected 
as well (and may have a DSP -> e.g. SOF/SST used as controller driver 
which would all need to implement this separately), but for the discrete 
GPU case this might be a workable approach (and makes sense as this is 
what switcheroo is meant for). I think gracefully handling the unbind is 
priority, but re-binding should be possible as well. We could do a 
switcheroo-enable type of flow in hdac_component_master_bind() and have 
the controller back up.

Of course it's not perfect still. I'd guess at least attempt to reach the 
codec#x procfs entry would hit timeouts if the controller is disabled this 
way.

Br, Kai
