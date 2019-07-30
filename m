Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 054727B29B
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 20:49:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DE361797;
	Tue, 30 Jul 2019 20:48:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DE361797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564512556;
	bh=AyOV5no+IEKiraZAx3e5+qt6oXnIL6GVErU/3p8zIB8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QQyyj2UEjZ+PSlHv5TpENIG0RZNYJlM7Pk1HR3QxW9ovk/njFZ9cjwBk3fWlUe7sd
	 f2igBFAF+Pjbb3Cf7GNNK6xVukDr3Kul8T0cs5zBOKBsveNzaD0lMoBf9hPR3WTJS4
	 yM9WTN8CLxBmhW3d58A0vCkPThE/lp9ts/6sUJ1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93863F804CA;
	Tue, 30 Jul 2019 20:47:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D1A3F804CA; Tue, 30 Jul 2019 20:47:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDBBBF800BF
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 20:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDBBBF800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 11:47:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; d="scan'208";a="190957724"
Received: from deharris-mobl.amr.corp.intel.com ([10.251.148.13])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2019 11:47:24 -0700
Message-ID: <356b3f4eacb43f23c40c4cd8e3c54ae9514a34c6.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Jon Flatley <jflat@chromium.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Date: Tue, 30 Jul 2019 11:47:24 -0700
In-Reply-To: <CACJJ=pyb==xWqKMB-gAzW7-FCFgEU7Rm+b-CL-ANO-eorDKy=A@mail.gmail.com>
References: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
 <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
 <ac7bcb42e40ac12d9924fd65c3e2c68b9b11b093.camel@linux.intel.com>
 <37ede7ea-e760-eac9-a1d5-0eb8e3bff3cb@linux.intel.com>
 <CACJJ=pyb==xWqKMB-gAzW7-FCFgEU7Rm+b-CL-ANO-eorDKy=A@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: benzh@chromium.org, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
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

On Tue, 2019-07-30 at 10:45 -0700, Jon Flatley wrote:
> On Mon, Jul 29, 2019 at 7:23 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
> > 
> > 
> > 
> > On 7/29/19 7:53 PM, Ranjani Sridharan wrote:
> > > On Mon, 2019-07-29 at 18:02 -0500, Pierre-Louis Bossart wrote:
> > > > 
> > > > On 7/29/19 4:53 PM, Jon Flatley wrote:
> > > > > I've been working on upstreaming the bdw-rt5650 machine
> > > > > driver for
> > > > > the
> > > > > Acer Chromebase 24 (buddy). There seems to be an issue when
> > > > > first
> > > > > setting the hardware controls that appears to be crashing the
> > > > > DSP:
> > > > > 
> > > > > [   51.424554] haswell-pcm-audio haswell-pcm-audio: FW
> > > > > loaded,
> > > > > mailbox
> > > > > readback FW info: type 01, - version: 00.00, build 77, source
> > > > > commit
> > > > > id: 876ac6906f31a43b6772b23c7c983ce9dcb18a19
> > > > > ...
> > > > > [   84.924666] haswell-pcm-audio haswell-pcm-audio: error:
> > > > > audio
> > > > > DSP
> > > > > boot timeout IPCD 0x0 IPCX 0x0
> > > > > [   85.260655] haswell-pcm-audio haswell-pcm-audio: ipc: --
> > > > > message
> > > > > timeout-- ipcx 0x83000000 isr 0x00000000 ipcd 0x00000000 imrx
> > > > > 0x7fff0000
> > > > > [   85.273609] haswell-pcm-audio haswell-pcm-audio: error:
> > > > > stream
> > > > > commit failed
> > > > > [   85.279746]  System PCM: error: failed to commit stream
> > > > > -110
> > > > > [   85.285388] haswell-pcm-audio haswell-pcm-audio: ASoC:
> > > > > haswell-pcm-audio hw params failed: -110
> > > > > [   85.293963]  System PCM: ASoC: hw_params FE failed -110
> > > > > 
> > > > > This happens roughly 50% of the time when first setting
> > > > > hardware
> > > > > controls after a reboot. The other 50% of the time the DSP
> > > > > comes up
> > > > > just fine and audio works fine thereafter. Adding "#define
> > > > > DEBUG 1"
> > > > > to
> > > > > sound/soc/intel/haswell/sst-haswell-ipc.c makes the issue
> > > > > occur
> > > > > much
> > > > > less frequently in my testing. Seems like a subtle timing
> > > > > issue.
> > > > > 
> > > > > There were timing issues encountered during the bringup of
> > > > > the 2015
> > > > > chromebook pixel (samus) which uses the bdw-rt5677 machine
> > > > > driver.
> > > > > Those were slightly different, and manifested during repeated
> > > > > arecords. Both devices use the same revision of the sst2
> > > > > firmware.
> > > > > 
> > > > > Any ideas for how to debug this?
> > > > 
> > > > this could be trying to send an IPC while you are already
> > > > waiting
> > > > for
> > > > one to complete. we've seen this before with SOF, if the IPCs
> > > > are
> > > > not
> > > > strictly serialized then things go in the weeds and timeout.
> > > 
> > > Pierre/Jon
> > > 
> > > In this case it looks like the DSP boot failed leading to the IPC
> > > timeout? WOndering if increasing the boot timeout would help?
> 
> I did actually try this without success.
> 
> > 
> > Yes, that too. The boot timeout is typically experimentally
> > defined, and
> > never decreasing due to platform variations...
> > I am still leaning more on the side of an side effect between two
> > IPCs,
> > the added DEBUG points to the printk which solves timing issues.
> > The
> > boot timeout would typically not be impacted by such changes.
> 
> I think the real struggle I'm having is finding a good debugging
> method that doesn't impact the timing of the IPCs significantly (as
> adding DEBUG seems to). This could maybe be overcome with using a
> stress test to reproduce. The crash only seems to occur when first
> booting the DSP, and so far I've been testing this by completely
> power
> cycling the machine on every test, which is very slow and tedious. So
> maybe the issue with DEBUG defined occurs 1 in 20 reboots rather than
> 1 in 2, I wouldn't know. If there's a way to reboot the DSP and
> reproduce this crash without rebooting the entire device that would
> be
> very helpful to me.
Maybe you've already tried this. But, how about blacklisting the audio
driver and then trying a modprobe/rmmod to insert and remove themodule. This should attempt to boot the DSP upon every modprobe. 
But what I am not sure about is whether the rmmod would succeed if the
IPC times out because the DSP has crashed.

Thanks,
Ranjani
> 
> Thanks,
> Jon

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
