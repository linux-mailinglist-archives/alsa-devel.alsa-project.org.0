Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 822D11717CC
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 13:47:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CBF7169B;
	Thu, 27 Feb 2020 13:46:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CBF7169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582807658;
	bh=1CPN/ERKX9LmY4WzGC8/HcDS4EYyjLg6AA7nICRDHE8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V7UPmPAy4GUOGULJo+TmnAVLUTDr3R1M5467uLiGQ2HLQIuONaRYSC29S+ocOTn/l
	 +wA2H+z3FsbYIAt8/ddB5zrea2hqS62Lr+f+yMWqTMxzYpZUFI6o7GpexDMldn0p4u
	 LJCpL2vvH6v0TGzfGE4J+CTb2YeQqf85R7GLrDF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84C21F80089;
	Thu, 27 Feb 2020 13:45:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F057F80142; Thu, 27 Feb 2020 13:45:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61DDAF80089
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 13:45:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61DDAF80089
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 04:45:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,492,1574150400"; d="scan'208";a="227126673"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga007.jf.intel.com with ESMTP; 27 Feb 2020 04:45:43 -0800
Date: Thu, 27 Feb 2020 14:45:43 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: SOF - topology - do not change the link trigger
 order for pre-1.4 firmware
In-Reply-To: <aa6805c3-212b-13ce-3d91-dcd377b4a491@perex.cz>
Message-ID: <alpine.DEB.2.21.2002271426070.2957@eliteleevi.tm.intel.com>
References: <20200221100739.3883842-1-perex@perex.cz>
 <alpine.DEB.2.21.2002211510050.2957@eliteleevi.tm.intel.com>
 <3901b16e-372e-4839-0e97-929115ea130a@perex.cz>
 <1ebd94a8-a461-4b5b-dc30-53f35a7fca47@linux.intel.com>
 <aa6805c3-212b-13ce-3d91-dcd377b4a491@perex.cz>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, Mark Brown <broonie@kernel.org>
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

On Fri, 21 Feb 2020, Jaroslav Kysela wrote:
> Dne 21. 02. 20 v 20:23 Pierre-Louis Bossart napsal(a):
> > > Ok, it's really weird that we cannot determine the firmware/driver
> > > combination which cause the DSP lock. I would propose to block the older
> > > firmware load <1.4 (or 1.4.2 which has the correct firmware version!)
[...]
> It makes sense. At least a hint that something may be wrong. I believe that it
> might help to identify issues.

I've continued testing today on multiple machines using the official (old) 
v1.3 binaries [1] we have and I cannot reproduce the DSP error you 
Jaroslav have seen. On all of my machines, latest sound tree with old v1.3 
FW works just fine. This matches earlier reports on SOF issue #2102.

I also looked back at the history of the kernel trigger order change, and 
it's a kernel-only change, to fix issues with certain pause-resume cases. 
It's not a change that was done in tandem with some specific FW side 
change, so I can't find a solid reason why DMA triggering order should be 
changed for old FW versions. One FW patch that was done at a time (and 
referred in the discussions) is:

dai: prevent dai_config while in active state 
https://github.com/thesofproject/sof/commit/c623e9246325dbee615a5cad0c8e4b0c29976056

.. but this is not changing the logic, just avoiding a DSP crash by 
returning an error (but IPC and use-case will still fail).

So although I cannot explain why Jaroslav you see the crash on the old 
v1.3 firmware on the Lenovo device, I would still recommend to leave 
current kernel code as is and not add any warnings. To summarize my 
rationale:

- we have known error in SOF driver logic, which was fixed
  in 5.5, and now backported to 5.4
- if above driver error was hit, very old FW versions would 
  end up with DSP crash, instead returning a proper error
- for many systems, new 5.5 kernel and old 1.3 FW works ok with 
  no notable issues
- we have at least one system, where new kernel and old FW does
  not work -> on these machines, upgrade to v1.4.2 firmware helps

Unless we get more reports, I'd lean towards not adding any new warnings. 
If someone hits a similar case as Jaroslav you did, we can see this from 
dmesg based on fw version and DSP oops dump (and/or reported IPC error). 
And the recommended action is to upgrade the FW to 1.4.2.

How about it?

[1] https://github.com/thesofproject/sof/releases

Br, Kai
