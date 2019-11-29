Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFFF10D76F
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Nov 2019 15:49:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E65216D0;
	Fri, 29 Nov 2019 15:48:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E65216D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575038946;
	bh=+BIwhuiuEQgyhAg9YYzksHbIeoqM+gCz5+J+DNJdrQ4=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jP7IOC2RoDA/UlSnBI9/NasKQsVBV+eXJNYR7XumZPNXgUhWeQ+6Zbnabz3887H5l
	 4fuuWK9tRpocpRc07jzUMCvpUzB7XB5FzftMp4Xbx2WS/1kLHyvs+M+XwkQmkufHRe
	 8LXrm3VJ3V+siqRmkAxdesdR6njVausQgN5IJZ0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEC1EF8014D;
	Fri, 29 Nov 2019 15:47:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28F75F80141; Fri, 29 Nov 2019 15:47:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0388F80106
 for <alsa-devel@alsa-project.org>; Fri, 29 Nov 2019 15:47:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0388F80106
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 06:47:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="203755861"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga008.jf.intel.com with ESMTP; 29 Nov 2019 06:47:12 -0800
Date: Fri, 29 Nov 2019 16:47:11 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20191129143756.23941-2-kai.vehmanen@linux.intel.com>
Message-ID: <alpine.DEB.2.21.1911291638430.16459@zeliteleevi>
References: <20191129143756.23941-1-kai.vehmanen@linux.intel.com>
 <20191129143756.23941-2-kai.vehmanen@linux.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Nikhil Mahale <nmahale@nvidia.com>
Subject: Re: [alsa-devel] [PATCH 2/2] [RFC] ALSA: hda: hdmi - preserve
 non-MST PCM routing for Intel platforms
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

Hi Takashi, Nikil and others,

On Fri, 29 Nov 2019, Kai Vehmanen wrote:
> This difference leads to some subtle differences in hdmi_find_pcm_slot()
> with regards to how non-MST monitors are assigned to PCMs.
> This patch restores the original behaviour on Intel platforms while
> keeping the new allocation policy on other platforms.

hmm, there seems a couple of more issues. The first patch is a clear bug 
that leads to segfault with SOF+patch_hdmi on some platforms (pipe B used
for single monitor HDMI case -> dev_id=1 -> non-existant pcm selected
and eventual kernel oops).

This second patch is however trickier. Nikhil your patch changed the 
default allocation a bit, so the routing might be difference also with 
snd-hda-intel (i.e. not SOF) for existing platforms and this may surprise 
users.

Digging deeper, we seem to have a slight semantics difference in how
intel_pin_eld_notify() and generic_acomp_pin_eld_notify() handle
the third pipe/dev_id parameter.

Any thoughts how to solve? I first I thought making separate functions
for hdmi_find_pcm_slot() and allow platforms to define an alternative
implementation, but in this RFC patch I opted for a simpler quirk in the 
function. This is becoming fairly messy I must say -- the amount of 
code commentary needed is a good indication some simplifaction would
be in order.

PS I did not have time to fully test the RFC patch, so this is just
   for discussion now...

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
