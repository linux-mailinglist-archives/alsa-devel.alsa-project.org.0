Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC85167B89
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 12:11:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1A5316C5;
	Fri, 21 Feb 2020 12:10:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1A5316C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582283496;
	bh=6vuQ0kYppmxKkNdThDeXKzsQJd/6umjovXDPzW71Wu8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oAF7JqBU0StJWGamxG5N4QGy6XTN1oyRWbelprL/89eU7snuDQsDUi6hLQl4Lvm4X
	 DyOS9MkP5+31OuAQ53QlFzxGSkdJktihCLUgzX9No3dhi3akI+18zxclJQ/IbM4q1s
	 EfeoSEBUtdJaBpT8hhUTNIipA4HyQ41xHFnb4WLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAF6FF8025F;
	Fri, 21 Feb 2020 12:09:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1620CF8025F; Fri, 21 Feb 2020 12:09:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAA91F8011D
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 12:09:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAA91F8011D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 03:09:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,468,1574150400"; d="scan'208";a="316026195"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001.jf.intel.com with ESMTP; 21 Feb 2020 03:09:45 -0800
Date: Fri, 21 Feb 2020 13:09:44 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm: Revert "call snd_soc_component_open/close()
 once"
In-Reply-To: <87mu9cspyf.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <alpine.DEB.2.21.2002211251280.2957@eliteleevi.tm.intel.com>
References: <20200219182650.1416-1-kai.vehmanen@linux.intel.com>
 <87blput7hh.wl-kuninori.morimoto.gx@renesas.com>
 <alpine.DEB.2.21.2002201103060.2957@eliteleevi.tm.intel.com>
 <87mu9cspyf.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, digetx@gmail.com
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

Hello Morimoto-san,

On Fri, 21 Feb 2020, Kuninori Morimoto wrote:

> Kai Vehmanen wrote:
> > So if the primary problem is the messy rollback in case one open fails, 
> > what if we do the rollback directly in soc_pcm_components_open() and do
> > not add any additional tracking..?
> > 
> > Let me send a proposal patch for that.
> It seems the patch was not so good cleanup...
> 
> Thank you for your proposal patch. I checked it.
> But, if it rollback when error with *last,
> my opinion is original code
> (= soc_pcm_components_close() needs *last parameter)
> (= same as just revert the patch) is better.

well, I do think the original code could still need a cleanup, so the 
effort is very much welcome. Having to pass the "last" parameter to 
components_open() just so that we can clean up if errors happen, seems
a bit out of place.

But yeah, easier said than done. We have now three alternatives to solve 
this:

1. do the cleanup locally in soc_pcm_components_open()
	[PATCH] ASoC: soc-pcm: fix state tracking error in snd_soc_component_open/close()

2. revert to original implementation with "last" passed to components_open()
	[PATCH] ASoC: soc-pcm: Revert "call snd_soc_component_open/close() once"

3. implement opened/module counters
	[PATCH][RFC] ASoC: soc-component: count snd_soc_component_open/close()

... I have tested all three and they seem to work.

I still don't really like (1), but I agree (2) adds more code in total.
I worry (3) might backfire with some component-substream combinations.

So maybe we'll go with (1)? We do need to merge one of them, because 
current merged code is broken on many platforms.

Br, Kai
