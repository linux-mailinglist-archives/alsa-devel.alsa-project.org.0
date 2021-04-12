Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F6635D1B4
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 22:05:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20C3815E5;
	Mon, 12 Apr 2021 22:04:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20C3815E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618257936;
	bh=ID//auvnRkiSQLQMjdeARxTGFfhcI8kR/SKPI5wOYnk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qUQoe7bdOcj9g459S4sbtokPS6yhodIJtykqIAFh5EAfQQRD9Q31i1kgO8xSfnhqF
	 hIGlKm6xX8Uk91j2x3PeLoq74E6UzBGZHI3tmSU3zShclRvActE1s8wDYFvrBVvcMX
	 PRwH+zoFA2H9sMc6/ceWld61H66/45Hl518VJAEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E3C2F80271;
	Mon, 12 Apr 2021 22:04:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B7CBF80269; Mon, 12 Apr 2021 22:04:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_29,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E13A7F800D3
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 22:03:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E13A7F800D3
Received: by mail-io1-f49.google.com with SMTP id w3so3629822ioc.12
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 13:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V1DKBip1cD3aSFLjp4/QXCXfgqw6DxdHnGOMaVMs/Mk=;
 b=Jv4iRDj5IMlBAhhhGf5kR1b/EgGG8EwzOeAJe/g8tV7UlPuFs4O7h0b66NmmMq1ctl
 ADgRNpvUHMQ+CMiB2NPgRaos/KQFJCsEqwljz+xS/F14jGUu96EptXWISWMHsVRI/dFz
 wTvtLvdL17VW07qZisnNBImNVfZEYYEqz+GdeEp4HuFE5hFSdPRoMw+52oRx4mn8+/Wa
 1wojEaBVzwtFkF+U+NAotuQhwU0diMsJ8zYKqLfAixZYuRrjNToPnOp0+MgZsLViKwfh
 ZLGSpw9MqD00VQuBJBlPWAoxys9G83oXd4126vS5zRV4T3ZxqgNdh1KOM8R5BVxuexcm
 XQYg==
X-Gm-Message-State: AOAM530HNfBHQQizi1dEbqZwrnJpjaLSBIYc2b4HOorspcM3w0Z8my4J
 fo+97XnBNEkllvF38ghjMZNraph1mTiSOTa1o0w=
X-Google-Smtp-Source: ABdhPJyY69c31V3iKZiKQc18J3Idwmvowy5sUcT5nSDjCCDU2vU8FsrTnez4bmmXKiJh9b4vCq2zBbyoii3mC3d+KvE=
X-Received: by 2002:a6b:ec08:: with SMTP id c8mr23006489ioh.55.1618257834792; 
 Mon, 12 Apr 2021 13:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAAd53p6Ef2zFX_t3y1c6O7BmHnxYGtGSfgzXAMQSom1ainWXzg@mail.gmail.com>
 <s5hsg85n2km.wl-tiwai@suse.de> <s5hmtydn0yg.wl-tiwai@suse.de>
 <CAAd53p6MMFh=HCNF9pyrJc9hVMZWFe7_8MvBcBHVWARqHU_TTA@mail.gmail.com>
 <s5h7dpfk06y.wl-tiwai@suse.de>
 <CAAd53p53w0H6tsb4JgQtFTkYinniicTYBs2uk7tc=heP2dM_Cw@mail.gmail.com>
 <CAKb7UvjWX7xbwMKtnad5EVy16nY1M-A13YJeRWyUwHzemcVswA@mail.gmail.com>
 <CAAd53p4=bSX26QzsPyV1sxADiuVn2sowWyb5JFDoPZQ+ZYoCzA@mail.gmail.com>
 <CACO55tsPx_UC3OPf9Hq9sGdnZg9jH1+B0zOi6EAxTZ13E1tf7A@mail.gmail.com>
 <d01e375f-bf16-a005-ec66-0910956cc616@spliet.org>
 <20210410192314.GB16240@wunner.de>
 <bddba2ca-15d5-7fd3-5b64-f4ba7e179ec0@spliet.org>
 <81b2a8c7-5b0b-b8fa-fbed-f164128de7a3@nvidia.com>
 <8d358110-769d-b984-d2ec-825dc2c3d77a@spliet.org>
 <d616715e-b0e3-74f6-9621-805fb5a0c898@nvidia.com>
In-Reply-To: <d616715e-b0e3-74f6-9621-805fb5a0c898@nvidia.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 12 Apr 2021 16:03:43 -0400
Message-ID: <CAKb7UvjMmL3wp4uRCnkAW0r551uj5526RW7u==Arad23zF_Z8g@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v2] ALSA: hda: Continue to probe when codec
 probe fails
To: Aaron Plattner <aplattner@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 nouveau <nouveau@lists.freedesktop.org>, tiwai@suse.com,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Lukas Wunner <lukas@wunner.de>,
 Roy Spliet <nouveau@spliet.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Alan Stern <stern@rowland.harvard.edu>,
 Mike Rapoport <rppt@kernel.org>
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

On Mon, Apr 12, 2021 at 4:01 PM Aaron Plattner <aplattner@nvidia.com> wrote:
>
> On 4/12/21 12:36 PM, Roy Spliet wrote:
> > Hello Aaron,
> >
> > Thanks for your insights. A follow-up query and some observations
> > in-line.
> >
> > Op 12-04-2021 om 20:06 schreef Aaron Plattner:
> >> On 4/10/21 1:48 PM, Roy Spliet wrote:
> >>> Op 10-04-2021 om 20:23 schreef Lukas Wunner:
> >>>> On Sat, Apr 10, 2021 at 04:51:27PM +0100, Roy Spliet wrote:
> >>>>> Can I ask someone with more
> >>>>> technical knowledge of snd_hda_intel and vgaswitcheroo to
> >>>>> brainstorm about
> >>>>> the possible challenges of nouveau taking matters into its own
> >>>>> hand rather
> >>>>> than keeping this PCI quirk around?
> >>>>
> >>>> It sounds to me like the HDA is not powered if no cable is plugged in.
> >>>> What is reponsible then for powering it up or down, firmware code on
> >>>> the GPU or in the host's BIOS?
> >>>
> >>> Sometimes the BIOS, but definitely unconditionally the PCI quirk
> >>> code:
> >>> https://github.com/torvalds/linux/blob/master/drivers/pci/quirks.c#L5289
> >>>
> >>>
> >>> (CC Aaron Plattner)
> >>
> >> My basic understanding is that the audio function stops responding
> >> whenever the graphics function is powered off. So the requirement
> >> here is that the audio driver can't try to talk to the audio function
> >> while the graphics function is asleep, and must trigger a graphics
> >> function wakeup before trying to communicate with the audio function.
> >
> > I believe that vgaswitcheroo takes care of this for us.
> >
> >> I think there are also requirements about the audio function needing
> >> to be awake when the graphics driver is updating the ELD, but I'm not
> >> sure.
> >>
> >> This is harder on Windows because the audio driver lives in its own
> >> little world doing its own thing but on Linux we can do better.
> >>
> >>>> Ideally, we should try to find out how to control HDA power from the
> >>>> operating system rather than trying to cooperate with whatever
> >>>> firmware
> >>>> is doing.  If we have that capability, the OS should power the HDA up
> >>>> and down as it sees fit.
> >>
> >> After system boot, I don't think there's any firmware involved, but
> >> I'm not super familiar with the low-level details and it's possible
> >> the situation changed since I last looked at it.
> >>
> >> I think the problem with having nouveau write this quirk is that the
> >> kernel will need to re-probe the PCI device to notice that it has
> >> suddenly become a multi-function device with an audio function, and
> >> hotplug the audio driver. I originally looked into trying to do that
> >> but it was tricky because the PCI subsystem didn't really have a
> >> mechanism for a single-function device to become a multi-function
> >> device on the fly and it seemed easier to enable it early on during
> >> bus enumeration. That way the kernel sees both functions all the time
> >> without anything else having to be special about this configuration.
> >
> > Right, so for a little more context: a while ago I noticed that my
> > laptop (lucky me, Asus K501UB) has a 940M with HDA but no codec. Seems
> > legit, given how this GPU has no displays attached; they're all hooked
> > up to the Intel integrated GPU. That threw off the snd_hda_intel
> > mid-probe, and as a result didn't permit runpm, keeping the entire
> > GPU, PCIe bus and thus the CPU package awake. A bit of hackerly later
> > we decided to continue probing without a codec, and now my laptop is
> > happy, but...
>
> What is the PCI class of the GPU in your system? If it has no display
> outputs it's probably 0x302 ("3D Controller") rather than 0x300 ("VGA
> Controller"). Looking at the code it looks like this workaround is being
> applied to both but maybe it should be restricted to just VGA controllers.

That was a comment I had back when the quirk was being implemented,
but helpfully there are some of these devices running around which say
"3D Controller" but still have displays attached to them. Lukas
probably remembers more specifics.

  -ilia
