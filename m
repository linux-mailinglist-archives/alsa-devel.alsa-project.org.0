Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF27F79DA3
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 02:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F7A31801;
	Tue, 30 Jul 2019 02:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F7A31801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564448099;
	bh=weRz4yBjZMZJwnCDHDKWq6qmsgIx8wQCfjoVXf2wStk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IyfjtTU0BKexw0bdqH1w6Lf66ghcXZSCJN1K+5zmPuGkwc31VonfWRUzCjKJdasRQ
	 +56zrj6HwDaAO10NEew6X+ebDnFugoVXdA1sVAaV+EFYCSoxIj6+IjvkIKDv04UydB
	 NiqujB8YUiSVuJY1HOuA9L2MdBCDUfsV7cTXMeVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6296FF8048E;
	Tue, 30 Jul 2019 02:53:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E1ADF8048D; Tue, 30 Jul 2019 02:53:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B4D7F803D5
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 02:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B4D7F803D5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 17:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,324,1559545200"; d="scan'208";a="171746201"
Received: from achandan-mobl2.gar.corp.intel.com ([10.251.148.186])
 by fmsmga008.fm.intel.com with ESMTP; 29 Jul 2019 17:53:07 -0700
Message-ID: <ac7bcb42e40ac12d9924fd65c3e2c68b9b11b093.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Jon Flatley
 <jflat@chromium.org>, alsa-devel@alsa-project.org
Date: Mon, 29 Jul 2019 17:53:07 -0700
In-Reply-To: <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
References: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
 <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: benzh@chromium.org
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

On Mon, 2019-07-29 at 18:02 -0500, Pierre-Louis Bossart wrote:
> 
> On 7/29/19 4:53 PM, Jon Flatley wrote:
> > I've been working on upstreaming the bdw-rt5650 machine driver for
> > the
> > Acer Chromebase 24 (buddy). There seems to be an issue when first
> > setting the hardware controls that appears to be crashing the DSP:
> > 
> > [   51.424554] haswell-pcm-audio haswell-pcm-audio: FW loaded,
> > mailbox
> > readback FW info: type 01, - version: 00.00, build 77, source
> > commit
> > id: 876ac6906f31a43b6772b23c7c983ce9dcb18a19
> > ...
> > [   84.924666] haswell-pcm-audio haswell-pcm-audio: error: audio
> > DSP
> > boot timeout IPCD 0x0 IPCX 0x0
> > [   85.260655] haswell-pcm-audio haswell-pcm-audio: ipc: --message
> > timeout-- ipcx 0x83000000 isr 0x00000000 ipcd 0x00000000 imrx
> > 0x7fff0000
> > [   85.273609] haswell-pcm-audio haswell-pcm-audio: error: stream
> > commit failed
> > [   85.279746]  System PCM: error: failed to commit stream -110
> > [   85.285388] haswell-pcm-audio haswell-pcm-audio: ASoC:
> > haswell-pcm-audio hw params failed: -110
> > [   85.293963]  System PCM: ASoC: hw_params FE failed -110
> > 
> > This happens roughly 50% of the time when first setting hardware
> > controls after a reboot. The other 50% of the time the DSP comes up
> > just fine and audio works fine thereafter. Adding "#define DEBUG 1"
> > to
> > sound/soc/intel/haswell/sst-haswell-ipc.c makes the issue occur
> > much
> > less frequently in my testing. Seems like a subtle timing issue.
> > 
> > There were timing issues encountered during the bringup of the 2015
> > chromebook pixel (samus) which uses the bdw-rt5677 machine driver.
> > Those were slightly different, and manifested during repeated
> > arecords. Both devices use the same revision of the sst2 firmware.
> > 
> > Any ideas for how to debug this?
> 
> this could be trying to send an IPC while you are already waiting
> for 
> one to complete. we've seen this before with SOF, if the IPCs are
> not 
> strictly serialized then things go in the weeds and timeout.
Pierre/Jon

In this case it looks like the DSP boot failed leading to the IPC
timeout? WOndering if increasing the boot timeout would help?

Thanks,
Ranjani
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
