Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1E78DE0F
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 21:50:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8EE91678;
	Wed, 14 Aug 2019 21:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8EE91678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565812224;
	bh=hamDlznyyGvVM2AMe3lIafYi81punzgxKewm6C2cILM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DI/SbeQnnoM3slbqVv5QECGwls2/oxDhvY/GS+488L1Vf4Yt64c5WB1nkSExYBOj0
	 LWUwkeiVIwvVZvD+ROGgVbStgl9INOwMJAH2ZsnjH2z/uxkUqwgUWGqcTf6XARFIqc
	 wZvsf8y3SckLgW4fBnpyimksdvZMOOU/eloXqxQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BB5CF80214;
	Wed, 14 Aug 2019 21:48:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A77D7F80214; Wed, 14 Aug 2019 21:48:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09950F8015A
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 21:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09950F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Yz9nze7g"
Received: by mail-lf1-x144.google.com with SMTP id h28so127140lfj.5
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 12:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xqb5TEUShlaU/jEI6UYIm0RzVtGNnHdoDW9U8lutOkA=;
 b=Yz9nze7gxu/ZsYAvkH+aPF4ig+h+Pxdu3QYGaqKvzynjcYXcG3oBwCD/FWhxb/cErk
 pIshuzWey2ttjeNxwd25p7prZFzSgy1EQ1zDnfI3w31LwwybHloILdSJGSXGhcKGdG3S
 bOVVbnJrG8GHeH2mOM5U41SNmq/80/yl5YAJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xqb5TEUShlaU/jEI6UYIm0RzVtGNnHdoDW9U8lutOkA=;
 b=TInlmR6I4udZsIuAHBvQm5SefcW4QPviOQGkC56aaKUnzhhEeqs0gp4ILmZAhTpygf
 55LxsAX9deSgBwpJPUSQbR6BEVlri2kDt2fYSDqZSP2bzkWkj9mAOmf5ybhS1udIOKje
 wdySNOnfrFV5ALmC3YGTI8l6GZXtUvBa+R6Hls/Nv/QL1bGoJ5Fr0oTFRUNJyye24Dmq
 kC4a1QMDwHhk/tq5yFnRLXSMcGaqQG7qFmhf80iOr7/bk/XBoTjl8JXRGtG6XmtCOAo3
 ei3Ceo9k0Giw/pVDFTIiBhdttSQHKKQplzS95Sq6jI4RFKdnflFdDc6Dg1OqyA7HVZVs
 /Auw==
X-Gm-Message-State: APjAAAXu3+B3FGZfj6RsgrQ3Y62YGyPKwYMPv1+FvlGElXaUPdL3rLOB
 4MrlymJ+2N+LSsbITNmXN5rwA3ZlEe0=
X-Google-Smtp-Source: APXvYqw0f5aqtY78PAq7DKUo+eYAqXhkT6/PqYZp+DiCRql5ELVxMckk8Osr0hZ2rJnpFYfPIqcGUw==
X-Received: by 2002:a19:48d1:: with SMTP id v200mr544795lfa.190.1565812114187; 
 Wed, 14 Aug 2019 12:48:34 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id b192sm80415lfg.75.2019.08.14.12.48.33
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2019 12:48:33 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id c9so131776lfh.4
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 12:48:33 -0700 (PDT)
X-Received: by 2002:a19:7709:: with SMTP id s9mr540914lfc.86.1565812112760;
 Wed, 14 Aug 2019 12:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
 <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
 <ac7bcb42e40ac12d9924fd65c3e2c68b9b11b093.camel@linux.intel.com>
 <37ede7ea-e760-eac9-a1d5-0eb8e3bff3cb@linux.intel.com>
 <CACJJ=pyb==xWqKMB-gAzW7-FCFgEU7Rm+b-CL-ANO-eorDKy=A@mail.gmail.com>
 <356b3f4eacb43f23c40c4cd8e3c54ae9514a34c6.camel@linux.intel.com>
 <7e08e45d-7cec-9fdd-36c5-5e82632968f8@linux.intel.com>
In-Reply-To: <7e08e45d-7cec-9fdd-36c5-5e82632968f8@linux.intel.com>
From: Jon Flatley <jflat@chromium.org>
Date: Wed, 14 Aug 2019 12:48:21 -0700
X-Gmail-Original-Message-ID: <CACJJ=pzcMCaOvHMVhmYKKL2Z45-XdrBB9FT8VjSzX_obVtKzyw@mail.gmail.com>
Message-ID: <CACJJ=pzcMCaOvHMVhmYKKL2Z45-XdrBB9FT8VjSzX_obVtKzyw@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 yang.jie@intel.com
Cc: benzh@chromium.org, alsa-devel@alsa-project.org,
 Jon Flatley <jflat@chromium.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 cujomalainey@chromium.org
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

On Tue, Jul 30, 2019 at 12:04 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> On 7/30/19 1:47 PM, Ranjani Sridharan wrote:
> > On Tue, 2019-07-30 at 10:45 -0700, Jon Flatley wrote:
> >> On Mon, Jul 29, 2019 at 7:23 PM Pierre-Louis Bossart
> >> <pierre-louis.bossart@linux.intel.com> wrote:
> >>>
> >>>
> >>>
> >>> On 7/29/19 7:53 PM, Ranjani Sridharan wrote:
> >>>> On Mon, 2019-07-29 at 18:02 -0500, Pierre-Louis Bossart wrote:
> >>>>>
> >>>>> On 7/29/19 4:53 PM, Jon Flatley wrote:
> >>>>>> I've been working on upstreaming the bdw-rt5650 machine
> >>>>>> driver for
> >>>>>> the
> >>>>>> Acer Chromebase 24 (buddy). There seems to be an issue when
> >>>>>> first
> >>>>>> setting the hardware controls that appears to be crashing the
> >>>>>> DSP:
> >>>>>>
> >>>>>> [   51.424554] haswell-pcm-audio haswell-pcm-audio: FW
> >>>>>> loaded,
> >>>>>> mailbox
> >>>>>> readback FW info: type 01, - version: 00.00, build 77, source
> >>>>>> commit
> >>>>>> id: 876ac6906f31a43b6772b23c7c983ce9dcb18a19
> >>>>>> ...
> >>>>>> [   84.924666] haswell-pcm-audio haswell-pcm-audio: error:
> >>>>>> audio
> >>>>>> DSP
> >>>>>> boot timeout IPCD 0x0 IPCX 0x0
> >>>>>> [   85.260655] haswell-pcm-audio haswell-pcm-audio: ipc: --
> >>>>>> message
> >>>>>> timeout-- ipcx 0x83000000 isr 0x00000000 ipcd 0x00000000 imrx
> >>>>>> 0x7fff0000
> >>>>>> [   85.273609] haswell-pcm-audio haswell-pcm-audio: error:
> >>>>>> stream
> >>>>>> commit failed
> >>>>>> [   85.279746]  System PCM: error: failed to commit stream
> >>>>>> -110
> >>>>>> [   85.285388] haswell-pcm-audio haswell-pcm-audio: ASoC:
> >>>>>> haswell-pcm-audio hw params failed: -110
> >>>>>> [   85.293963]  System PCM: ASoC: hw_params FE failed -110
> >>>>>>
> >>>>>> This happens roughly 50% of the time when first setting
> >>>>>> hardware
> >>>>>> controls after a reboot. The other 50% of the time the DSP
> >>>>>> comes up
> >>>>>> just fine and audio works fine thereafter. Adding "#define
> >>>>>> DEBUG 1"
> >>>>>> to
> >>>>>> sound/soc/intel/haswell/sst-haswell-ipc.c makes the issue
> >>>>>> occur
> >>>>>> much
> >>>>>> less frequently in my testing. Seems like a subtle timing
> >>>>>> issue.
> >>>>>>
> >>>>>> There were timing issues encountered during the bringup of
> >>>>>> the 2015
> >>>>>> chromebook pixel (samus) which uses the bdw-rt5677 machine
> >>>>>> driver.
> >>>>>> Those were slightly different, and manifested during repeated
> >>>>>> arecords. Both devices use the same revision of the sst2
> >>>>>> firmware.
> >>>>>>
> >>>>>> Any ideas for how to debug this?
> >>>>>
> >>>>> this could be trying to send an IPC while you are already
> >>>>> waiting
> >>>>> for
> >>>>> one to complete. we've seen this before with SOF, if the IPCs
> >>>>> are
> >>>>> not
> >>>>> strictly serialized then things go in the weeds and timeout.
> >>>>
> >>>> Pierre/Jon
> >>>>
> >>>> In this case it looks like the DSP boot failed leading to the IPC
> >>>> timeout? WOndering if increasing the boot timeout would help?
> >>
> >> I did actually try this without success.
> >>
> >>>
> >>> Yes, that too. The boot timeout is typically experimentally
> >>> defined, and
> >>> never decreasing due to platform variations...
> >>> I am still leaning more on the side of an side effect between two
> >>> IPCs,
> >>> the added DEBUG points to the printk which solves timing issues.
> >>> The
> >>> boot timeout would typically not be impacted by such changes.
> >>
> >> I think the real struggle I'm having is finding a good debugging
> >> method that doesn't impact the timing of the IPCs significantly (as
> >> adding DEBUG seems to). This could maybe be overcome with using a
> >> stress test to reproduce. The crash only seems to occur when first
> >> booting the DSP, and so far I've been testing this by completely
> >> power
> >> cycling the machine on every test, which is very slow and tedious. So
> >> maybe the issue with DEBUG defined occurs 1 in 20 reboots rather than
> >> 1 in 2, I wouldn't know. If there's a way to reboot the DSP and
> >> reproduce this crash without rebooting the entire device that would
> >> be
> >> very helpful to me.
> > Maybe you've already tried this. But, how about blacklisting the audio
> > driver and then trying a modprobe/rmmod to insert and remove themodule. This should attempt to boot the DSP upon every modprobe.
> > But what I am not sure about is whether the rmmod would succeed if the
> > IPC times out because the DSP has crashed.
>
> I don't think we can really reduce the 'Heisenbug' nature of code
> instrumentations.
> But as Ranjani suggested it increasing the test frequency would make
> things more observable. I would go for suspend-resume tests, that would
> also force a DSP reboot without requiring a full reboot.
>
> rtcwake -s 3 -m mem
>
> I suspect modprobe/rmmod isn't likely to work, those legacy drivers were
> not exactly written with stress-test in mind. Suspend-resume is likely
> more reliable - been used in real products but tested with older kernels
> so your mileage may vary.
>
> We should really have completed SOF support for Broadwell instead of
> supporting zombie drivers. Gah.

I've been off this issue for a couple of weeks but yesterday I made
some progress.

There seems to be an issue when suspending the ALC5650. I think the
nondeterministic behavior I was seeing just had to do with whether or
not the DSP had yet suspended.

I reverted commit 0d2135ecadb0 ("ASoC: Intel: Work around to fix HW D3
potential crash issue") and things started working, including
suspend/resume of the DSP. Any ideas for why this may be? I would like
to resolve this so I can finish upstreaming the bdw-rt5650 machine
driver.


Thanks,
-Jon
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
