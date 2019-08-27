Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BD1A1D97
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:49:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C836016CF;
	Thu, 29 Aug 2019 16:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C836016CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567090166;
	bh=EuvCRGraolzG1tTUhzUAmnkw4dYftbB+4NbOOrdsji8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YaDQg1jKvnOHUhOTqgdWw8zSUDXGQEpqLXJomBCWJzLK/yku0FSTfagUKZ/Y37AlT
	 OLFCPmXewG85Dr8vBwbcq2PN5EEjsAvVv//bQcbiEzRfA3t1I4lOk41C8f7iiJGQ84
	 Q4jgTRi8dtjnYIgU8PKcJBNyXNmPZNZF8/6VEq1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3FB5F80C1B;
	Wed, 28 Aug 2019 00:03:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2FA1F80C1B; Wed, 28 Aug 2019 00:03:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09882F80709
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 00:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09882F80709
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="fkDsId+2"
Received: by mail-lj1-x231.google.com with SMTP id x3so694580lji.5
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 15:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=efF/bgwjqcBMidHNMOYENoxMEiv6PJmgHZUErkA4Ld0=;
 b=fkDsId+2VllG9LmRS6z0TheEHO4ymqrEkBdpDIHRUp7Yyz6XQoiQBVPhinpiUAyPp2
 +7SItG8lieHP6D2P/CaARtcNHf2P0jgILlvDmzE66Fj5HuWo3H74NZtl9Z8zPbAAH+lj
 wi8k8gSuKdq1vJRLxuT+Jth4NvRMJSp65Uj/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=efF/bgwjqcBMidHNMOYENoxMEiv6PJmgHZUErkA4Ld0=;
 b=i/iFmLALvApEw4S+cq253Zl5CcdGABsg56Oic9P+IFcAlWhuNtbHkH71rzNnn5OFrA
 WSpDkqpIDJnZpRvnkfhktX2Ezo+YsOJzyxFX8aYI8R+etuhzjdMndLQnCJkl1xBi/xZA
 g0SrAJcHby9uyvPrA5TeMgXYHhhaU61LY8OwAvYYi2Sh7hD72cPdE6TZyY3+cRRFmGLR
 u6hPFRJe5OwyasGRjhB2+chOoXeIrIHbjlMdj1G+8BR/u+IQoPDCfKDqyq4YryG6gOiF
 cUDx2Dml0yLQTjfaIDWAfdBh+0ykqaTwi2NUVSML+tV75y+GSkYHHyCgsmp32DRhEWc4
 rT5g==
X-Gm-Message-State: APjAAAW3szgLezYVFn2f4ILkIeFQlwk/qh2uzLyNlF4PNiPGUUNWJROX
 /tT8Prz5iCFPjBzkXsIYnQ9Rg1zB9h0=
X-Google-Smtp-Source: APXvYqxKeJghxM+vaQqul5qH/g5d19FDUMfYpf9aG1eZxQZtoO8iaAaguirWPzCGhSPNsaL6ioqFww==
X-Received: by 2002:a2e:144f:: with SMTP id 15mr260258lju.226.1566943406956;
 Tue, 27 Aug 2019 15:03:26 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id b30sm148452lfq.59.2019.08.27.15.03.25
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2019 15:03:26 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id u29so295373lfk.7
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 15:03:25 -0700 (PDT)
X-Received: by 2002:a19:8c14:: with SMTP id o20mr383105lfd.158.1566943405261; 
 Tue, 27 Aug 2019 15:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
 <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
 <ac7bcb42e40ac12d9924fd65c3e2c68b9b11b093.camel@linux.intel.com>
 <37ede7ea-e760-eac9-a1d5-0eb8e3bff3cb@linux.intel.com>
 <CACJJ=pyb==xWqKMB-gAzW7-FCFgEU7Rm+b-CL-ANO-eorDKy=A@mail.gmail.com>
 <356b3f4eacb43f23c40c4cd8e3c54ae9514a34c6.camel@linux.intel.com>
 <7e08e45d-7cec-9fdd-36c5-5e82632968f8@linux.intel.com>
 <CACJJ=pzcMCaOvHMVhmYKKL2Z45-XdrBB9FT8VjSzX_obVtKzyw@mail.gmail.com>
 <d80c2f4d-b5f4-5bbe-9529-36b9859ab8be@linux.intel.com>
 <CACJJ=pxokT5z+U=nM9QcUVxCk84998ugM5J89U28k=CVGMjG=w@mail.gmail.com>
 <E7B1D079BA13FB44A978CC8F69C7D6A9606FC567@SHSMSX106.ccr.corp.intel.com>
 <d0131c02-3477-8390-e0c6-b37b142169e8@intel.com>
 <E7B1D079BA13FB44A978CC8F69C7D6A9606FC9AE@SHSMSX106.ccr.corp.intel.com>
 <fe0d4511-aecd-bee5-c491-4a093a14110e@intel.com>
 <40cdda08-d5fe-7415-b0d6-f10bf79f0282@linux.intel.com>
In-Reply-To: <40cdda08-d5fe-7415-b0d6-f10bf79f0282@linux.intel.com>
From: Jon Flatley <jflat@chromium.org>
Date: Tue, 27 Aug 2019 16:03:13 -0600
X-Gmail-Original-Message-ID: <CACJJ=pxePiuR0XP=2N+1cqfkhNWhEu-2t4Fue=qX3_JbanvNcg@mail.gmail.com>
Message-ID: <CACJJ=pxePiuR0XP=2N+1cqfkhNWhEu-2t4Fue=qX3_JbanvNcg@mail.gmail.com>
To: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "benzh@chromium.org" <benzh@chromium.org>, Jon Flatley <jflat@chromium.org>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>
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

On Tue, Aug 27, 2019 at 5:53 AM Gustaw Lewandowski
<gustaw.lewandowski@linux.intel.com> wrote:
>
> On 8/22/19 5:29 PM, Cezary Rojewski wrote:
> > On 2019-08-20 04:11, Jie, Yang wrote:
> >>
> >>> -----Original Message-----
> >>> From: Rojewski, Cezary
> >>> Sent: Tuesday, August 20, 2019 2:09 AM
> >>> To: Jie, Yang <yang.jie@intel.com>; Jon Flatley
> >>> <jflat@chromium.org>; Pierre-
> >>> Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >>> Cc: benzh@chromium.org; alsa-devel@alsa-project.org; Jie Yang
> >>> <yang.jie@linux.intel.com>; Ranjani Sridharan
> >>> <ranjani.sridharan@linux.intel.com>; cujomalainey@chromium.org
> >>> Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
> >>>
> >>> On 2019-08-19 04:33, Jie, Yang wrote:
> >>>>
> >>>>> -----Original Message-----
> >>>>> From: Jon Flatley [mailto:jflat@chromium.org]
> >>>>> Sent: Thursday, August 15, 2019 5:25 AM
> >>>>> To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >>>>> Cc: Jon Flatley <jflat@chromium.org>; Jie, Yang <yang.jie@intel.com>;
> >>>>> benzh@chromium.org; alsa-devel@alsa-project.org; Ranjani Sridharan
> >>>>> <ranjani.sridharan@linux.intel.com>; cujomalainey@chromium.org; Jie
> >>>>> Yang <yang.jie@linux.intel.com>
> >>>>> Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
> >>>>>
> >>>>> On Wed, Aug 14, 2019 at 1:51 PM Pierre-Louis Bossart <pierre-
> >>>>> louis.bossart@linux.intel.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>> There seems to be an issue when suspending the ALC5650. I think the
> >>>>>>> nondeterministic behavior I was seeing just had to do with whether
> >>>>>>> or not the DSP had yet suspended.
> >>>>>>>
> >>>>>>> I reverted commit 0d2135ecadb0 ("ASoC: Intel: Work around to fix HW
> >>>>>>> D3 potential crash issue") and things started working, including
> >>>>>>> suspend/resume of the DSP. Any ideas for why this may be? I would
> >>>>>>> like to resolve this so I can finish upstreaming the bdw-rt5650
> >>>>>>> machine driver.
> >>>>>>
> >>>>>> Copying Keyon in case he remembers the context.
> >>>>>>
> >>>>>> Reverting a 5yr-old commit with all sorts of clock/power-related
> >>>>>> fixes looks brave, and it's not clear why this would work with the
> >>>>>> rt5677 and not with 5650.
> >>>>>
> >>>>> No idea, I was just diffing the register writes looking for
> >>>>> sources of
> >>> discrepancy.
> >>>>> The Chromium OS 3.14 kernel tree that Buddy uses doesn't have this
> >>>>> patch, so I figured what's the worst that could happen?
> >>>>
> >>>> Hi Jon, sorry about just noticing this thread.
> >>>>   From the dmesg log, the issue happens at runtime suspend/resume
> >>>> but not
> >>> in boot, am I right(you can disable runtime PM for the device to
> >>> confirm that)?
> >>>>
> >>>> My points here are:
> >>>> 1. the commit 0d2135ecadb0 was suggested by FW team to W/A D3
> >>> potential crash issue.
> >>>> 2. it was verified with rt286(Broadwell.c, e.g. Dell XPS) from our
> >>>> side
> >>> only(and may have been checked with rt5677 by Chrome team).
> >>>> 3. please follow sequence in broadwell.c if issue happen at boot time.
> >>>> If happened at runtime PM from DSP side, we should see it with all
> >>>> kinds of
> >>> machine driver.
> >>>> Could you performing more test and debugging to see what it real
> >>>> happen
> >>> there?
> >>>> 4. we have no reason to remove the commit directly, except
> >>>> correcting if
> >>> some lines are proved wrong. And, as Pierre mentioned, SOF driver is
> >>> preferred, as there is no new development effort to support SST
> >>> haswell/Broadwell driver here(no platform, no developer, :-( ).
> >>>>
> >>>> Thanks,
> >>>> ~Keyon>
> >>>
> >>> Got to disagree with the last one - no platform, no developer.
> >>> We are setting up some BDW/ HSW here to join our happy SKL+ family
> >>> in CI.
> >>> This is because of /common cleanups which will engulf aDSP project
> >>> (hsw/byt) obviously.
> >>
> >> Yes, that's true, good to hear that you will add it to CI.
> >>
> >>>
> >>> These will be tested against the exact same BAT scope as other ADSP
> >>> devices.
> >>> Code here looks much better, at least compared to /skylake - ain't a
> >>> high
> >>> threshold though.. Given how outdated all SKL+ fw binaries are (on
> >>> upstream
> >>> repo) it might even come down simply to fw upgrade.
> >>> Most of FW peps who took part in that project are already out.
> >>> Although,
> >>> found one or two who are willing to help : )
> >>
> >> I remember Pawel Piskorski and Marcin Barlik helped me from the FW
> >> side(including explaining about the S0<->S3 sequence), please contact
> >> me offline if needed, I will try to drag for some mails which I got 5
> >> years back.
> >>
> >> Thanks,
> >> ~Keyon
> >>
> >
> > Please do not name people on official list unless you are 100% sure
> > about their engagement in linux solutions, which for both individuals
> > you have listed, is no longer the case. Any recommendations? - you can
> > provide internally.
> >
> > Anyway, I've contacted Marcin and once he is available, we will review
> > the patch together. Note, that I'm a IGK dweller too, so it's highly
> > probable whomever you had in mind I've either already met or drank a
> > beer with.
> >
> > Czarek
> >
> >>>
> >>> And yes, I'm setting them up with rt286 too. There are some rt56XX
> >>> but I'm
> >>> unsure if rt5650 is amount them.
> >>> Still got some problems with ACPI, but soon two new faces should be
> >>> greeting
> >>> audio CI bonfire..
> >>>
> >>> Czarek
> >>>
> >>>>>>
> >>>>>> Are you using the latest upstream firmware btw? Or the one which
> >>>>>> shipped with the initial device (which could be an issue if the
> >>>>>> protocol
> >>>>> changed).
> >>>>>
> >>>>> The firmware I'm loading is: `FW info: type 01, - version: 00.00,
> >>>>> build 77, source commit id: 876ac6906f31a43b6772b23c7c983ce9dcb18a1`.
> >>>>> Hashes the same as the upstream binary.
>
> I don't have a specified codec for testing so I tried with rt286. I was
> not able to reproduce this issue. Could you collect logs(dmesg) with
> enabled debug like below for S3 or enabled debug during build for
> resting reboot scenario?

Sure thing, thanks for taking a look. Here are the verbose logs for
runtime suspend, followed by a failed resume invoked by a volume
change in alsamixer:

[   31.199071] haswell-pcm-audio haswell-pcm-audio: audio dsp runtime suspend
[   31.199074]  System PCM: ASoC: pop wq checking: Playback status:
inactive waiting: yes
[   31.213871] haswell-pcm-audio haswell-pcm-audio: Item[0]
offset[48a890] - size[770e] - source[1]
[   31.221392] haswell-pcm-audio haswell-pcm-audio: Item[1]
offset[491fa0] - size[3c00] - source[1]
[   31.231038] haswell-pcm-audio haswell-pcm-audio: Item[2] offset[0]
- size[2821d] - source[0]
[   31.239561] haswell-pcm-audio haswell-pcm-audio: Item[3]
offset[484000] - size[246c] - source[0]
[   31.248320] haswell-pcm-audio haswell-pcm-audio: Item[4]
offset[486470] - size[750] - source[0]
[   31.256958] haswell-pcm-audio haswell-pcm-audio: Item[5]
offset[486bc0] - size[3cc8] - source[1]
[   31.265866] haswell-pcm-audio haswell-pcm-audio: ipc: got 6 entry
numbers for state 3
[   31.273080] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0xfff8a890 dest 0x7898a890 size 30480
[   31.284532] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   31.289114] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0xfff91fa0 dest 0x78991fa0 size 15360
[   31.299841] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   31.304423] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0xfff86bc0 dest 0x78986bc0 size 15560
[   31.314922] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   31.319610] haswell-pcm-audio haswell-pcm-audio:  disabled block
1:13 at offset 0x68000
[   31.327990] haswell-pcm-audio haswell-pcm-audio: block freed 1:13
at offset 0x68000
[   31.335168] haswell-pcm-audio haswell-pcm-audio:  disabled block
1:12 at offset 0x60000
[   31.343612] haswell-pcm-audio haswell-pcm-audio:  disabled block
1:11 at offset 0x58000
[   31.352013] haswell-pcm-audio haswell-pcm-audio:  disabled block
1:10 at offset 0x50000
[   31.359324] haswell-pcm-audio haswell-pcm-audio: block freed 1:12
at offset 0x60000
[   31.367615] haswell-pcm-audio haswell-pcm-audio: block freed 1:11
at offset 0x58000
[   31.374813] haswell-pcm-audio haswell-pcm-audio: block freed 1:10
at offset 0x50000
[   31.383127] haswell-pcm-audio haswell-pcm-audio:  disabled block
1:9 at offset 0x48000
[   31.390545] haswell-pcm-audio haswell-pcm-audio:  disabled block
1:8 at offset 0x40000
[   31.398998] haswell-pcm-audio haswell-pcm-audio:  disabled block
1:7 at offset 0x38000
[   31.407451] haswell-pcm-audio haswell-pcm-audio: block freed 1:9 at
offset 0x48000
[   31.414662] haswell-pcm-audio haswell-pcm-audio: block freed 1:8 at
offset 0x40000
[   31.421798] haswell-pcm-audio haswell-pcm-audio: block freed 1:7 at
offset 0x38000
[   31.430126] haswell-pcm-audio haswell-pcm-audio:  disabled block
1:6 at offset 0x30000
[   31.437414] haswell-pcm-audio haswell-pcm-audio: block freed 1:6 at
offset 0x30000
[   31.445635] haswell-pcm-audio haswell-pcm-audio:  disabled block
1:5 at offset 0x28000
[   31.453023] haswell-pcm-audio haswell-pcm-audio: block freed 1:5 at
offset 0x28000
[   31.461213] haswell-pcm-audio haswell-pcm-audio: unloading firmware
[   31.467042] haswell-pcm-audio haswell-pcm-audio:  disabled block
1:19 at offset 0x98000
[   31.475473] haswell-pcm-audio haswell-pcm-audio:  disabled block
1:18 at offset 0x90000
[   31.483918] haswell-pcm-audio haswell-pcm-audio:  disabled block
1:17 at offset 0x88000
[   31.491349] haswell-pcm-audio haswell-pcm-audio:  disabled block
1:16 at offset 0x80000
[   31.499747] haswell-pcm-audio haswell-pcm-audio:  disabled block
0:5 at offset 0xc8000
[   31.507051] haswell-pcm-audio haswell-pcm-audio:  disabled block
0:4 at offset 0xc0000
[   31.515467] haswell-pcm-audio haswell-pcm-audio:  disabled block
0:3 at offset 0xb8000
[   31.523840] haswell-pcm-audio haswell-pcm-audio:  disabled block
0:2 at offset 0xb0000
[   31.531165] haswell-pcm-audio haswell-pcm-audio:  disabled block
0:1 at offset 0xa8000
[   31.539648] haswell-pcm-audio haswell-pcm-audio:  disabled block
0:0 at offset 0xa0000
[   31.547066] haswell-pcm-audio haswell-pcm-audio: block freed 1:19
at offset 0x98000
[   31.555378] haswell-pcm-audio haswell-pcm-audio: block freed 1:18
at offset 0x90000
[   31.562625] haswell-pcm-audio haswell-pcm-audio: block freed 1:17
at offset 0x88000
[   31.570883] haswell-pcm-audio haswell-pcm-audio: block freed 1:16
at offset 0x80000
[   31.578273] haswell-pcm-audio haswell-pcm-audio: block freed 0:5 at
offset 0xc8000
[   31.585505] haswell-pcm-audio haswell-pcm-audio: block freed 0:4 at
offset 0xc0000
[   31.593690] haswell-pcm-audio haswell-pcm-audio: block freed 0:3 at
offset 0xb8000
[   31.600950] haswell-pcm-audio haswell-pcm-audio: block freed 0:2 at
offset 0xb0000
[   31.608174] haswell-pcm-audio haswell-pcm-audio: block freed 0:1 at
offset 0xa8000
[   31.616392] haswell-pcm-audio haswell-pcm-audio: block freed 0:0 at
offset 0xa0000
[   31.623651] haswell-pcm-audio haswell-pcm-audio:  disabled block
1:15 at offset 0x78000
[   31.632020] haswell-pcm-audio haswell-pcm-audio:  disabled block
1:14 at offset 0x70000
[   31.640378] haswell-pcm-audio haswell-pcm-audio: block freed 1:15
at offset 0x78000
[   31.647331] haswell-pcm-audio haswell-pcm-audio: block freed 1:14
at offset 0x70000
[   31.655610] haswell-pcm-audio haswell-pcm-audio: HSW_PM dsp runtime suspend
[   31.662756] haswell-pcm-audio haswell-pcm-audio: HSW_PM dsp runtime
suspend exit
[   46.620599] haswell-pcm-audio haswell-pcm-audio: loading audio DSP....
[   46.626523] haswell-pcm-audio haswell-pcm-audio: HSW_PM dsp runtime resume
[   46.644108] haswell-pcm-audio haswell-pcm-audio: HSW_PM dsp runtime
resume exit
[   46.650309] haswell-pcm-audio haswell-pcm-audio: reloading firmware
[   46.657168] haswell-pcm-audio haswell-pcm-audio: header
size=0x3f8c0 modules=0x8 fmt=0xfe size=32
[   46.665766] haswell-pcm-audio haswell-pcm-audio: new module sign
0x$SST\xe0\xf7\x03 size 0x3f7e0 blocks 0xf type 0x0
[   46.675554] haswell-pcm-audio haswell-pcm-audio:  entrypoint 0x0
[   46.681254] haswell-pcm-audio haswell-pcm-audio:  persistent 0x0 scratch 0x0
[   46.688267] haswell-pcm-audio haswell-pcm-audio: module block 0
type 0x0 size 0x10c ==> ram ffff9e2e83000000 offset 0x0
[   46.699535] haswell-pcm-audio haswell-pcm-audio: block request
0x10c bytes at offset 0xa0000 type 0
[   46.708128] haswell-pcm-audio haswell-pcm-audio: block allocated
0:0 at offset 0xa0000
[   46.716458] haswell-pcm-audio haswell-pcm-audio:  enabled block 0:0
at offset 0xa0000
[   46.724754] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x7884004c dest 0xfffa0000 size 268
[   46.733332] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   46.739020] haswell-pcm-audio haswell-pcm-audio: module block 1
type 0x0 size 0x16c ==> ram ffff9e2e83000000 offset 0x400
[   46.750188] haswell-pcm-audio haswell-pcm-audio: block request
0x16c bytes at offset 0xa0400 type 0
[   46.758830] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x78840168 dest 0xfffa0400 size 364
[   46.767417] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   46.773078] haswell-pcm-audio haswell-pcm-audio: module block 2
type 0x0 size 0x8 ==> ram ffff9e2e83000000 offset 0x584
[   46.784201] haswell-pcm-audio haswell-pcm-audio: block request 0x8
bytes at offset 0xa0584 type 0
[   46.793740] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x788402e4 dest 0xfffa0584 size 8
[   46.802155] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   46.807807] haswell-pcm-audio haswell-pcm-audio: module block 3
type 0x0 size 0x4 ==> ram ffff9e2e83000000 offset 0x5bc
[   46.818967] haswell-pcm-audio haswell-pcm-audio: block request 0x4
bytes at offset 0xa05bc type 0
[   46.827488] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x788402fc dest 0xfffa05bc size 4
[   46.835933] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   46.841564] haswell-pcm-audio haswell-pcm-audio: module block 4
type 0x0 size 0x18 ==> ram ffff9e2e83000000 offset 0x5c0
[   46.852731] haswell-pcm-audio haswell-pcm-audio: block request 0x18
bytes at offset 0xa05c0 type 0
[   46.861296] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x78840310 dest 0xfffa05c0 size 24
[   46.870764] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   46.876392] haswell-pcm-audio haswell-pcm-audio: module block 5
type 0x0 size 0x8 ==> ram ffff9e2e83000000 offset 0x5fc
[   46.887515] haswell-pcm-audio haswell-pcm-audio: block request 0x8
bytes at offset 0xa05fc type 0
[   46.896036] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x78840338 dest 0xfffa05fc size 8
[   46.904714] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   46.910414] haswell-pcm-audio haswell-pcm-audio: module block 6
type 0x0 size 0x8 ==> ram ffff9e2e83000000 offset 0x640
[   46.921485] haswell-pcm-audio haswell-pcm-audio: block request 0x8
bytes at offset 0xa0640 type 0
[   46.930032] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x78840350 dest 0xfffa0640 size 8
[   46.938512] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   46.944220] haswell-pcm-audio haswell-pcm-audio: module block 7
type 0x0 size 0x8 ==> ram ffff9e2e83000000 offset 0x67c
[   46.955296] haswell-pcm-audio haswell-pcm-audio: block request 0x8
bytes at offset 0xa067c type 0
[   46.963832] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x78840368 dest 0xfffa067c size 8
[   46.972307] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   46.978997] haswell-pcm-audio haswell-pcm-audio: module block 8
type 0x0 size 0x8 ==> ram ffff9e2e83000000 offset 0x6b8
[   46.989033] haswell-pcm-audio haswell-pcm-audio: block request 0x8
bytes at offset 0xa06b8 type 0
[   46.998595] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x78840380 dest 0xfffa06b8 size 8
[   47.007021] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   47.012683] haswell-pcm-audio haswell-pcm-audio: module block 9
type 0x0 size 0x8 ==> ram ffff9e2e83000000 offset 0x6f4
[   47.023859] haswell-pcm-audio haswell-pcm-audio: block request 0x8
bytes at offset 0xa06f4 type 0
[   47.032373] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x78840398 dest 0xfffa06f4 size 8
[   47.040819] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   47.046459] haswell-pcm-audio haswell-pcm-audio: module block 10
type 0x0 size 0x8 ==> ram ffff9e2e83000000 offset 0x730
[   47.057604] haswell-pcm-audio haswell-pcm-audio: block request 0x8
bytes at offset 0xa0730 type 0
[   47.067175] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x788403b0 dest 0xfffa0730 size 8
[   47.075556] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   47.081219] haswell-pcm-audio haswell-pcm-audio: module block 11
type 0x0 size 0x4 ==> ram ffff9e2e83000000 offset 0x76c
[   47.092354] haswell-pcm-audio haswell-pcm-audio: block request 0x4
bytes at offset 0xa076c type 0
[   47.100916] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x788403c8 dest 0xfffa076c size 4
[   47.109348] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   47.114985] haswell-pcm-audio haswell-pcm-audio: module block 12
type 0x0 size 0x27a78 ==> ram ffff9e2e83000000 offset 0x7a8
[   47.126184] haswell-pcm-audio haswell-pcm-audio: block request
0x27a78 bytes at offset 0xa07a8 type 0
[   47.135920] haswell-pcm-audio haswell-pcm-audio: block allocated
0:1 at offset 0xa8000
[   47.144179] haswell-pcm-audio haswell-pcm-audio: block allocated
0:2 at offset 0xb0000
[   47.151399] haswell-pcm-audio haswell-pcm-audio: block allocated
0:3 at offset 0xb8000
[   47.159674] haswell-pcm-audio haswell-pcm-audio: block allocated
0:4 at offset 0xc0000
[   47.168081] haswell-pcm-audio haswell-pcm-audio: block allocated
0:5 at offset 0xc8000
[   47.175318] haswell-pcm-audio haswell-pcm-audio:  enabled block 0:5
at offset 0xc8000
[   47.183609] haswell-pcm-audio haswell-pcm-audio:  enabled block 0:4
at offset 0xc0000
[   47.191876] haswell-pcm-audio haswell-pcm-audio:  enabled block 0:3
at offset 0xb8000
[   47.199170] haswell-pcm-audio haswell-pcm-audio:  enabled block 0:2
at offset 0xb0000
[   47.207478] haswell-pcm-audio haswell-pcm-audio:  enabled block 0:1
at offset 0xa8000
[   47.214755] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x788403dc dest 0xfffa07a8 size 162424
[   47.230081] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   47.234656] haswell-pcm-audio haswell-pcm-audio: module block 13
type 0x1 size 0x16ba8 ==> ram ffff9e2e83000000 offset 0x84000
[   47.245946] haswell-pcm-audio haswell-pcm-audio: block request
0x16ba8 bytes at offset 0x84000 type 1
[   47.255645] haswell-pcm-audio haswell-pcm-audio: block allocated
1:17 at offset 0x88000
[   47.263956] haswell-pcm-audio haswell-pcm-audio: block allocated
1:18 at offset 0x90000
[   47.272197] haswell-pcm-audio haswell-pcm-audio: block allocated
1:19 at offset 0x98000
[   47.279482] haswell-pcm-audio haswell-pcm-audio:  enabled block
1:19 at offset 0x98000
[   47.287816] haswell-pcm-audio haswell-pcm-audio:  enabled block
1:18 at offset 0x90000
[   47.296113] haswell-pcm-audio haswell-pcm-audio:  enabled block
1:17 at offset 0x88000
[   47.303481] haswell-pcm-audio haswell-pcm-audio:  enabled block
1:16 at offset 0x80000
[   47.311817] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x78867e64 dest 0xfff84000 size 93096
[   47.323545] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   47.328119] haswell-pcm-audio haswell-pcm-audio: module block 14
type 0x1 size 0xe00 ==> ram ffff9e2e83000000 offset 0x9abb0
[   47.339397] haswell-pcm-audio haswell-pcm-audio: block request
0xe00 bytes at offset 0x9abb0 type 1
[   47.349018] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x7887ea1c dest 0xfff9abb0 size 3584
[   47.357597] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   47.363255] haswell-pcm-audio haswell-pcm-audio: new module sign
0x$SST size 0x0 blocks 0x0 type 0xd
[   47.372935] haswell-pcm-audio haswell-pcm-audio:  entrypoint 0x0
[   47.378643] haswell-pcm-audio haswell-pcm-audio:  persistent
0x16800 scratch 0xdc00
[   47.385780] haswell-pcm-audio haswell-pcm-audio: new module sign
0x$SST size 0x0 blocks 0x0 type 0xb
[   47.395420] haswell-pcm-audio haswell-pcm-audio:  entrypoint 0x0
[   47.401135] haswell-pcm-audio haswell-pcm-audio:  persistent 0x3800
scratch 0x0
[   47.409266] haswell-pcm-audio haswell-pcm-audio: new module sign
0x$SST size 0x0 blocks 0x0 type 0xa
[   47.417922] haswell-pcm-audio haswell-pcm-audio:  entrypoint 0x0
[   47.423617] haswell-pcm-audio haswell-pcm-audio:  persistent 0x4000
scratch 0x0
[   47.431742] haswell-pcm-audio haswell-pcm-audio: new module sign
0x$SST size 0x0 blocks 0x0 type 0xc
[   47.440366] haswell-pcm-audio haswell-pcm-audio:  entrypoint 0x0
[   47.447127] haswell-pcm-audio haswell-pcm-audio:  persistent 0x3000
scratch 0x0
[   47.454274] haswell-pcm-audio haswell-pcm-audio: module 12 scratch
req 0x0 bytes
[   47.461376] haswell-pcm-audio haswell-pcm-audio: module 10 scratch
req 0x0 bytes
[   47.468433] haswell-pcm-audio haswell-pcm-audio: module 11 scratch
req 0x0 bytes
[   47.476576] haswell-pcm-audio haswell-pcm-audio: module 13 scratch
req 0xdc00 bytes
[   47.483771] haswell-pcm-audio haswell-pcm-audio: module 0 scratch
req 0x0 bytes
[   47.490854] haswell-pcm-audio haswell-pcm-audio: scratch buffer
required is 0xdc00 bytes
[   47.499248] haswell-pcm-audio haswell-pcm-audio: allocating scratch blocks
[   47.506228] haswell-pcm-audio haswell-pcm-audio: block request
0xdc00 bytes type 1 at 0xffff0a10
[   47.515784] haswell-pcm-audio haswell-pcm-audio: block allocated
1:15 at offset 0x78000
[   47.523046] haswell-pcm-audio haswell-pcm-audio:  enabled block
1:15 at offset 0x78000
[   47.531470] haswell-pcm-audio haswell-pcm-audio:  enabled block
1:14 at offset 0x70000
[   47.539814] haswell-pcm-audio haswell-pcm-audio: persistent fixed
block request 0x3800 bytes type 1 offset 0x68000
[   47.549754] haswell-pcm-audio haswell-pcm-audio: block allocated
1:13 at offset 0x68000
[   47.558081] haswell-pcm-audio haswell-pcm-audio:  enabled block
1:13 at offset 0x68000
[   47.565419] haswell-pcm-audio haswell-pcm-audio: runtime id 11
created for module 11
[   47.573707] haswell-pcm-audio haswell-pcm-audio: persistent fixed
block request 0x16800 bytes type 1 offset 0x50000
[   47.583680] haswell-pcm-audio haswell-pcm-audio: block allocated
1:11 at offset 0x58000
[   47.591932] haswell-pcm-audio haswell-pcm-audio: block allocated
1:12 at offset 0x60000
[   47.600249] haswell-pcm-audio haswell-pcm-audio:  enabled block
1:12 at offset 0x60000
[   47.607598] haswell-pcm-audio haswell-pcm-audio:  enabled block
1:11 at offset 0x58000
[   47.615918] haswell-pcm-audio haswell-pcm-audio:  enabled block
1:10 at offset 0x50000
[   47.624385] haswell-pcm-audio haswell-pcm-audio: runtime id 13
created for module 13
[   47.631604] haswell-pcm-audio haswell-pcm-audio: persistent fixed
block request 0x16800 bytes type 1 offset 0x38000
[   47.642587] haswell-pcm-audio haswell-pcm-audio: block allocated
1:8 at offset 0x40000
[   47.649916] haswell-pcm-audio haswell-pcm-audio: block allocated
1:9 at offset 0x48000
[   47.658208] haswell-pcm-audio haswell-pcm-audio:  enabled block 1:9
at offset 0x48000
[   47.666537] haswell-pcm-audio haswell-pcm-audio:  enabled block 1:8
at offset 0x40000
[   47.673771] haswell-pcm-audio haswell-pcm-audio:  enabled block 1:7
at offset 0x38000
[   47.682049] haswell-pcm-audio haswell-pcm-audio: runtime id 13
created for module 13
[   47.689239] haswell-pcm-audio haswell-pcm-audio: persistent fixed
block request 0x3000 bytes type 1 offset 0x30000
[   47.700471] haswell-pcm-audio haswell-pcm-audio: block allocated
1:6 at offset 0x30000
[   47.707726] haswell-pcm-audio haswell-pcm-audio:  enabled block 1:6
at offset 0x30000
[   47.716058] haswell-pcm-audio haswell-pcm-audio: runtime id 12
created for module 12
[   47.723207] haswell-pcm-audio haswell-pcm-audio: persistent fixed
block request 0x4000 bytes type 1 offset 0x28000
[   47.734246] haswell-pcm-audio haswell-pcm-audio: block allocated
1:5 at offset 0x28000
[   47.741490] haswell-pcm-audio haswell-pcm-audio:  enabled block 1:5
at offset 0x28000
[   47.749799] haswell-pcm-audio haswell-pcm-audio: runtime id 10
created for module 10
[   47.758050] haswell-pcm-audio haswell-pcm-audio: audio dsp runtime resume
[   47.763959] haswell-pcm-audio haswell-pcm-audio: restoring audio DSP....
[   47.770944] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x7898a890 dest 0xfff8a890 size 30480
[   47.781581] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   47.786154] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x78991fa0 dest 0xfff91fa0 size 15360
[   47.796266] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   47.800849] haswell-pcm-audio haswell-pcm-audio: DMA: src:
0x78986bc0 dest 0xfff86bc0 size 15560
[   47.810971] haswell-pcm-audio haswell-pcm-audio: DMA: callback
[   48.119068] haswell-pcm-audio haswell-pcm-audio: error: audio DSP
boot timeout IPCD 0x0 IPCX 0x0
[   49.535060] haswell-pcm-audio haswell-pcm-audio: ipc: --message
timeout-- ipcx 0x86371000 isr 0x00000000 ipcd 0x00000000 imrx
0x7fff0000
[   49.546866] haswell-pcm-audio haswell-pcm-audio: error: set mixer
volume failed
[   49.553979] haswell-pcm-audio haswell-pcm-audio: ipc_tx_msgs dsp busy
[   49.855054] haswell-pcm-audio haswell-pcm-audio: ipc: --message
timeout-- ipcx 0x86371000 isr 0x00000000 ipcd 0x00000000 imrx
0x7fff0000
[   49.868456] haswell-pcm-audio haswell-pcm-audio: error: set mixer
volume failed
[   49.874794] haswell-pcm-audio haswell-pcm-audio: ipc_tx_msgs dsp busy
[   50.183057] haswell-pcm-audio haswell-pcm-audio: ipc: --message
timeout-- ipcx 0x86371000 isr 0x00000000 ipcd 0x00000000 imrx
0x7fff0000
[   50.194886] haswell-pcm-audio haswell-pcm-audio: error: set mixer
volume failed
> echo -n 'module  snd* +p' |  dd of=/sys/kernel/debug/dynamic_debug/control
> Since enabling debug decreases problem occurrence ratio please also
> check below change:
>
> --- a/sound/soc/intel/haswell/sst-haswell-ipc.c
> +++ b/sound/soc/intel/haswell/sst-haswell-ipc.c
> @@ -81,7 +81,7 @@
>
>   /* IPC message timeout (msecs) */
>   #define IPC_TIMEOUT_MSECS      300
> -#define IPC_BOOT_MSECS         200
> +#define IPC_BOOT_MSECS         300
>
> Gustaw
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
