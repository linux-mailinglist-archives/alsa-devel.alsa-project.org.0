Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA09A9B206
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 16:31:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3574A1682;
	Fri, 23 Aug 2019 16:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3574A1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566570699;
	bh=7CYPLJ6XfPge20N8IGA38yiAabSV0KNy3sFDjvZNGX4=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CRoHBQxbVq/ZtM/RLTwdYmdS/Gs4AKcL++QlY8MEGab0DHgtNl/Sm3qlE8n0VCsnW
	 Ni1bNR4kTJbdnIAn3WFSjoGPtta0Dz0VPy8JfO5MqDZ6nYlwgXVex99hY85ZNdirbx
	 Z7jhdTYW+Vcf3buiWSLDwLR5h++HQGYjSBBxUxjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DFC1F8014A;
	Fri, 23 Aug 2019 16:29:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D402F80306; Fri, 23 Aug 2019 16:29:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_72,PRX_BODY_76,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF606F80147
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 16:29:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF606F80147
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 07:29:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,421,1559545200"; d="scan'208";a="184227228"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga006.jf.intel.com with ESMTP; 23 Aug 2019 07:29:41 -0700
Date: Fri, 23 Aug 2019 17:29:40 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <s5hr25ma3xs.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.1908231652000.16459@zeliteleevi>
References: <alpine.DEB.2.21.1908151641110.16459@zeliteleevi>
 <s5hr25ma3xs.wl-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] sof/hda rework to share more of patch_hdmi.c logic
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

Hi,

On Thu, 15 Aug 2019, Takashi Iwai wrote:
> Kai Vehmanen wrote:
>> into modifying the SOF Intel backend to use 
>> snd-hda-codec-hdmi/patch_hdmi.c for HDMI/DP audio support, i.e. to be able 
>> to share this code between snd-hda-intel and SOF Intel (and not using 
>> hdac-hdmi).
[..]
>> This will change how HDMI is exposed to user-space with SOF Intel 
>> drivers, so we need to be extra careful how this is introduced. But 

> Agreed.  I guess the biggest difference is the handling of the 
> DP-MST.  The legacy HD-audio HDMI driver takes a different approach
> for DP-MST, namely, it chooses dynamically the pin that is connected
> with a monitor.  It's for keeping the compatibility (more or less)
> with old behavior; the program just needs to open the device that
> corresponds to the notification via jack ctl without fiddling with
> other extra routing.

indeed. I've now got to a point where I have the key functionality
in place. And after some reworks, the changes to patch_hdmi.c 
are pretty minimal, which is very nice (I started with a much more 
evasive patch).

But, but. The DP-MST handling is indeed iffy. I tried a few approaches, 
but it is hard to reconcile concept of "backup PCMs" of patch_hdmi.c with 
concepts of ASoC and ALSA topology, where the PCM and DAIs are supposed to 
be defined in the topology file. This gets worse with SOF (and any similar 
usage) which allow you to have arbitrary DSP processing between a PCM and 
the HDMI/DP DAIs. So this seems like a dead-end.

What I ended up doing was to make a new mode to patch_hdmi.c that limits 
PCM count to actual converter count (and this is aligned with topology), 
and still supporting DP-MST by always mapping monitors to a free PCM. I've 
tested some complex DP-MST scenarios and this seems to work pretty well. 
The jack detection will still be able to tell which of the PCMs have a 
monitor detected.

I wonder if this would be an acceptable approach, given 
the reuse benefits we get. Downsides:
- assignment of monitors to PCMs will depend on ELD update ordering
- in SOF we need to align PCM numbering scheme in all topologies 
  we convert over to patch_hdmi.c

I did not yet figure out how to toggle the new DP-MST mode in patch_hdmi.c 
in a nice way, so didn't sent patches to list yet. I'll do that early next 
week. If you want a sneak preview, I uploaded the series at:

https://github.com/thesofproject/linux/pull/1155

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
