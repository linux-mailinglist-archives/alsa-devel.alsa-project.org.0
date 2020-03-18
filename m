Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 076031898B6
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 10:59:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D1FE175D;
	Wed, 18 Mar 2020 10:58:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D1FE175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584525589;
	bh=wlCJfhUNDrgI33XVhaMggt5wvjxcdGWplG5X1IiaYj0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jZpwAHrYMPLUe3R6J1ubqddh7Ckj1COIDMwFKirvNmsiDEGU7LefdNdl2kPrMu3QR
	 NdZcEbyMTBvgHs1JXCjM0KCbEb1feoon0A3RwTSKpLbUNc9k3tzeiviGH3y1AFIyOv
	 P2/c+rYdi0Co26/Yf5VT8mYE5zrA8w0x2a0COGvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 545D7F800C0;
	Wed, 18 Mar 2020 10:58:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87A72F80139; Wed, 18 Mar 2020 10:58:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1B8BF800B7
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 10:58:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1B8BF800B7
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from light.dominikbrodowski.net (brodo.linta [10.1.0.102])
 by isilmar-4.linta.de (Postfix) with ESMTPSA id C0687200ADE;
 Wed, 18 Mar 2020 09:57:59 +0000 (UTC)
Received: by light.dominikbrodowski.net (Postfix, from userid 1000)
 id 2EFF320B19; Wed, 18 Mar 2020 10:57:45 +0100 (CET)
Date: Wed, 18 Mar 2020 10:57:45 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
Message-ID: <20200318095745.GA133849@light.dominikbrodowski.net>
References: <20200318063022.GA116342@light.dominikbrodowski.net>
 <66c719b3-a66e-6a9f-fab8-721ba48d7ad8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66c719b3-a66e-6a9f-fab8-721ba48d7ad8@intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, yang.jie@linux.intel.com, tiwai@suse.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

On Wed, Mar 18, 2020 at 10:41:42AM +0100, Cezary Rojewski wrote:
> On 2020-03-18 07:30, Dominik Brodowski wrote:
> > Hi!
> > 
> > While 5.5.x works fine, mainline as of ac309e7744be (v5.6-rc6+) causes me
> > some sound-related trouble: after boot, the sound works fine -- but once I
> > suspend and resume my broadwell-based XPS13, I need to switch to headphone
> > and back to speaker to hear something. But what I hear isn't music but
> > garbled output.
> > 
> > A few dmesg snippets from v5.6-rc6-9-gac309e7744be which might be of
> > interest. I've highlighted the lines differing from v.5.5.x which might be
> > of special interest:
> > 
> 
> Thank you for the report, Dominik. You definitely got our attention.
> 
> I've checked the market: Dell XPS 13 9343, yes? Once you confirm model id,
> I'll order a piece immediately to our site.

Thanks, for taking a look at this issue, Czarek. Indeed, it's a

	Dell Inc. XPS 13 9343/0TM99H, BIOS A19 12/24/2018

and IIRC there should be at least one of those already at the Linux sound
team at Intel (you may want to check with Yang Jie and Han Lu; I was in
contact with them relating to a different sound-related issue in 2015).

> In regard to logs, thanks for highlighting important lines. Build is of 'rc'
> so bugs can still be in plenty - any reason for switching to cutting-edge
> kernel on production stuff? Our CI didn't detect any anomalies yet as it is
> running on 5.5.

Well, one has to test things to find bugs ;-) -- and as I sometimes
contribute to the kernel, it is better to keep current on things.

> I'll direct your ticket on todays meeting. On the first look, issue seems to
> be connected with recent changes to /drivers/dma/dmaengine.c. DesignWare DMA
> controller drv - which HSW/BDW makes use of - might not have been updated
> accordingly. Will dig further on that.
> 
> One more, just to make it clear for the rest of the viewers:
> 
> > 	haswell-pcm-audio haswell-pcm-audio: Direct firmware load for intel/IntcPP01.bin failed with error -2
> > 	haswell-pcm-audio haswell-pcm-audio: fw image intel/IntcPP01.bin not available(-2)
> 
> Back in the ancient days of DSP (HSW/BDW are actually the very first audio
> DSP hws for Intel) topology was part of FW - SW could not configure it and
> probably that's why library IntcPP01 is attempted to be loaded on every
> boot, even if it's not part of configuration for given hw. Maybe we could
> make it quieter though..
> 
> > 
> > (these last two messages already are printed a couple of time after boot, and then
> > again during a suspend/resume cycle. On v.5.5.y, there are similar messages
> > "no context buffer need to restore!"). Everything is built-in, no modules
> > are loaded.
> > 
> > Unfortunately, I cannot bisect this issue easily -- i915 was broken for
> > quite some time on this system[*], prohibiting boot...
> 
> Hmm, sounds like that issue is quite old. DSP for Haswell and Broadwell is
> available for I2S devices only, so this relates directly to legacy HDA
> driver. Compared to Skylake+, HDAudio controller for older platforms is
> found within GPU. My advice is to notify the DRM guys about this issue.
> 
> Takashi, are you aware of problems with HDMI on HSW/ BDW or should I just
> loop Jani and other DRM peps here?

Well, it works on v5.5, so this issue is not really "quite old" (the "no
context buffer need to restore!" message seen there seems harmless).

Thanks again, and best wishes,
	Dominik
