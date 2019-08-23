Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 162069B40D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 17:57:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84AEE1693;
	Fri, 23 Aug 2019 17:56:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84AEE1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566575820;
	bh=7oo6jvdasWF4nPwoB+FVnIExn2nPqLSy9j7qJDGAFZA=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ue058K5tC3QF948w3rw2JgIki7NPJHb8gQtBxYFA49vSHWV2/XkFH5WJI4l7sKsXk
	 mW5ixXcyhae45P5CBsFpyHxfgHajXprgd6+m+K3fkpeG5h4b5B6rsb9xeqywMY+Gvw
	 uja5X6jz7FxlaEHw5DBgYBcJUM1tgwcY6Z3SnPKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 128C2F802FB;
	Fri, 23 Aug 2019 17:55:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C0EAF80306; Fri, 23 Aug 2019 17:55:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 281F3F8014A
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 17:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 281F3F8014A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 08:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,421,1559545200"; d="scan'208";a="184247579"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga006.jf.intel.com with ESMTP; 23 Aug 2019 08:55:06 -0700
Date: Fri, 23 Aug 2019 18:55:05 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <s5h36hrrk1j.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.1908231831310.16459@zeliteleevi>
References: <alpine.DEB.2.21.1908151641110.16459@zeliteleevi>
 <s5hr25ma3xs.wl-tiwai@suse.de>
 <alpine.DEB.2.21.1908231652000.16459@zeliteleevi>
 <s5h5zmoq6cy.wl-tiwai@suse.de> <s5h36hrrk1j.wl-tiwai@suse.de>
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

Hey,


On Fri, 23 Aug 2019, Takashi Iwai wrote:
> On Fri, 23 Aug 2019, Takashi Iwai wrote:
> > The current patch_hdmi.c implementation is based on the theoretical
> > possibility, and limitation to the reduced PCM streams would work, I
> > suppose.
[...]
> access to the fixed PCM device (e.g. hw:1,1).  But, it's hardly
> possible to get more than three audio-monitors active in the real
> scenario, we've almost never seen this necessity.

ack. This does feel very unlikely to be a problem. And one could implement 
a wait list -> delay PCM attach if all audio converters are taken when the 
new monitor ELD update happens. Upon next disconnect of an already 
attached audio enabled monitor, one could check the wait list and hook up 
monitors to the freed converters. But yeah, at least on i915 I don't see 
the need for this.

This does raise the question whether we should change the behaviour 
for the non-DSP HD driver as well...? Tempting, but the risk for breaking 
apps may be too high.

> The actual behavior can be found in the description of commit
> a76056f2e57e:
> 
>     When monitor is connected, find a proper PCM for the monitor.
>     When monitor is disconnected, unbind the PCM from the pin.
>     
>     The binding policy (use Intel platform as example) is:
>     1. Try to use the legacy pin-pcm mapping for the device entry 0
>        of the pin.
>     2. If step 1 fails, try to bind pin to the backup PCMs. For example,
>        on Intel platform, if DP MST is enabled, 5 PCMs will be created.
>        PCM 3, PCM 7, PCM 8 are supposed to be used by device entry 0 of
>        pin 5, pin 6 and pin 7. PCM 9 and PCM 10 are the backup PCMs.
>     3. If step 2 fails, try to find any PCM to bind to the pin.
>     
> Removing the backup streams means the removal of step 2, but the
> driver will keep working in step 3.

Yes, I didn't have to actually change this code at all. I just limit the 
PCM count to number of converters, and the above code works without 
modifications (and skips (2)). Only problem left is how to change to 
toggle the different rules for calculing pcm count. Unless we change the 
behaviour for non-DSP HD driver as well, there needs to be some dynamic 
configuration of patch_hdmi. Kconfig/module-param won't do, I assume 
distros want to enable both options with same kernel.

Thanks for the quick response!

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
