Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B49FF4B8569
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 11:22:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 506FC18DA;
	Wed, 16 Feb 2022 11:21:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 506FC18DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645006966;
	bh=6Tg9QJNOKAXhZQBJCTExyB3LzQL7MgRhVSaXR0nZIww=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A4xMRyf8ddijyfZkAa0AL/UQYD9PjtwLYVsWKbeT7rRHeffo2VsKFg8kIFwfTz+pb
	 2eZd3ovNnQ1Ew7KcpMDOOCszDSbgLFHc1kVD7nqY+3cMJxna3GwwVDOzl6oQVpsqzP
	 ROjDdA+q2crNf6q371XMYc5mCtouiESE2tUEZpNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5B1AF800D8;
	Wed, 16 Feb 2022 11:21:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E62DF80128; Wed, 16 Feb 2022 11:21:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD081F800D8
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 11:21:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD081F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Oi7L83xI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645006895; x=1676542895;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=6Tg9QJNOKAXhZQBJCTExyB3LzQL7MgRhVSaXR0nZIww=;
 b=Oi7L83xIIQjCT3nzD5OhE7+61H4s6y14mYUvs94BCTaQuxIzsT2BncCp
 fNpHupj0yU/QH1+mp0V9PPIcxzSnW0vUlTgOogf0rsQJzYFHEZvb964WZ
 piIFX3AvQnE1umLkEDc24DC+c0+7eeLjMU1fnUqydHCbzTD39y+fO0v5G
 r7ShOrquv1fv8Q+PR8Z4kgQ5yBsljWRhhqwnRV3K3zTxX9eHBIuVhbuMW
 Rko62M1umDGgAQgb5PERI3TxLAt4+CEdKOOuqR7TZ/w7yauqZhuT2hTOd
 mwgZjaIfcivTmfN2mKsQVVsM3rbrk70i0giVKEKkCNioVgEHIuAbxHOQe A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="275154187"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="275154187"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 02:21:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="544859099"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 02:21:26 -0800
Date: Wed, 16 Feb 2022 12:12:43 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/hdmi: add keep-alive support for ADL-P and DG2
In-Reply-To: <s5ha6erb2cy.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2202161205530.3088432@eliteleevi.tm.intel.com>
References: <20220215140118.3856001-1-kai.vehmanen@linux.intel.com>
 <68cbcd13-00dc-a3e3-244a-773c4fd4707d@linux.intel.com>
 <s5ha6erb2cy.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Jyri Sarha <jyri.sarha@intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Amadeusz SX2awiX4ski <amadeuszx.slawinski@linux.intel.com>
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

On Wed, 16 Feb 2022, Takashi Iwai wrote:

> >  static void silent_stream_enable(struct hda_codec *codec,
> >  				 struct hdmi_spec_per_pin *per_pin)
> >  {
(snip)
> >   unlock_out:
> >  	mutex_unlock(&per_pin->lock);
> > +
> > +	if (err || !keep_power)
> > +		snd_hda_power_down_pm(codec);
> 
> So this may leave the power up.  But where is the corresponding part
> that turns it down?  The newly added snd_hda_power_up_pm() in
> silent_stream_disable() is paired with the one at the tail of that
> function, so it looks like a refcount unbalance.  Kai?

indeed it is. I'll send a V2 with this fixed. 

Br, Kai
