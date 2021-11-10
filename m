Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD0544CCA1
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Nov 2021 23:24:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC03B165D;
	Wed, 10 Nov 2021 23:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC03B165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636583073;
	bh=UQzsQrfzIK5vwgeoPjpR1WwPp6jqjDsLLYv9eg3hiqo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y+vMdPUnf4jrbRdRGKISu8H8cbbR6nbnNhB8sAPN6fSr0LhARx7ZZ22BtuRODZUuA
	 o/MhWLrKP6uIrvzUTxHkWpf21iVtkRRqS5hnWk37WZqwChGKAz1UtZb/dZvVao1lFl
	 GKWpPQsGjPzZgJ4Bx3nFx/Cv71Mr9IvXSIEtBUZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14016F800C1;
	Wed, 10 Nov 2021 23:23:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81B7EF8049E; Wed, 10 Nov 2021 23:23:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0722F80054
 for <alsa-devel@alsa-project.org>; Wed, 10 Nov 2021 23:23:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0722F80054
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="232646662"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="232646662"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 14:23:02 -0800
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="602383961"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 14:23:00 -0800
Date: Thu, 11 Nov 2021 00:15:40 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda: fix general protection fault in
 azx_runtime_idle
In-Reply-To: <s5hzgqb65h0.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2111110015250.3554566@eliteleevi.tm.intel.com>
References: <20211110210307.1172004-1-kai.vehmanen@linux.intel.com>
 <s5hzgqb65h0.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, mahesh.meena@intel.com
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

On Wed, 10 Nov 2021, Takashi Iwai wrote:

> On Wed, 10 Nov 2021 22:03:07 +0100, Kai Vehmanen wrote:
> > Fix a corner case between PCI device driver remove callback and
> > runtime PM idle callback.
[...]
> > Some non-persistent direct links showing the bug trigger on
> > different platforms with linux-next 20211109:
> >  - https://intel-gfx-ci.01.org/tree/linux-next/next-20211109/fi-tgl-1115g4/igt@i915_module_load@reload.html
> >  - https://intel-gfx-ci.01.org/tree/linux-next/next-20211109/fi-jsl-1/igt@i915_module_load@reload.html
> > 
> > Notably with 20211110 linux-next, the bug does not trigger:
> >  - https://intel-gfx-ci.01.org/tree/linux-next/next-20211110/fi-tgl-1115g4/igt@i915_module_load@reload.html
> 
> Is this the case with CONFIG_DEBUG_KOBJECT_RELEASE?
> This would be the only logical explanation I can think of for now.

hmm, that doesn't seem to be used. Here's a link to kconfig used in the 
failing CI run:
https://intel-gfx-ci.01.org/tree/linux-next/next-20211109/kconfig.txt

It's still a bit odd, especially given Scott just reported the other HDA 
related regression in 5.15 today. The two issues don't seem to be related 
though, although both are fixed by clearing drvdata (but in different 
places of hda_intel.c).

I'll try to run some more tests tomorrow. The fix should be good in any 
case, but it would be interesting to understand better what change made 
this more (?) likely to hit than before. This is not a new test and the 
problem happens on fairly old platforms, so something has changed.

Br, Kai
