Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4265D35AEF0
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 17:53:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96E4F165E;
	Sat, 10 Apr 2021 17:52:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96E4F165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618069990;
	bh=J1E/gPica0SWrC4rHYmBZWxRVbeyh5Gx4wt9oMnKbsQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WZFivP0CaWAM+lE3705pZPPY88iZqvgwQX61bg7S8k1rkMgachkSID0TJbvGm95IF
	 iHT0n2ALySt19ilM3cseJ9L/tmYcyvRNDt6j0j5v03Lfq/bw7LWn6V18P4VR99UqyU
	 XqHd3u4XLl1GDWmjja3OTnQ5Tk+45Ns/HY49mw40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC6CDF80246;
	Sat, 10 Apr 2021 17:51:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1031F8020B; Sat, 10 Apr 2021 17:51:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mupuf.org (mupuf.org [167.71.42.210])
 by alsa1.perex.cz (Postfix) with ESMTP id E52F9F800BC
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 17:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E52F9F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=spliet.org header.i=@spliet.org
 header.b="gBCPJoSz"
Received: from [IPv6:2a01:4b00:86b9:100:3a72:2134:f4fb:f726] (unknown
 [IPv6:2a01:4b00:86b9:100:3a72:2134:f4fb:f726])
 by Neelix.spliet.org (Postfix) with ESMTPSA id 5964DF20111;
 Sat, 10 Apr 2021 16:51:29 +0100 (BST)
DKIM-Filter: OpenDKIM Filter v2.11.0 Neelix.spliet.org 5964DF20111
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spliet.org;
 s=default; t=1618069889;
 bh=k2lVuNhhyJZ9m1XrTo42m98YzGLcO7suMUeViVTMkQk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gBCPJoSz0yL9JpfaOx5UYCv5PCkdSVV0o2wQUAQVB0dP9ra1Tc7vfUTd4aVWQpHMn
 MvJ3ZE/ghE90wQGRwjiC0n5Bpg0AcZ41Ka2ibuOmkN7FQFSVst3xJK//ASD/P5dcpL
 iGNKsMJvNdcXp22p/zDect3Q+yFTZBVwNb55rEQQ=
Subject: Re: [Nouveau] [PATCH v2] ALSA: hda: Continue to probe when codec
 probe fails
To: Karol Herbst <kherbst@redhat.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20201214060621.1102931-1-kai.heng.feng@canonical.com>
 <20201216124726.2842197-1-kai.heng.feng@canonical.com>
 <s5h5z51oj12.wl-tiwai@suse.de>
 <CAAd53p6kORC1GsW5zt+=0=J5ki43iriO-OqtFvf5W67LWhyyhA@mail.gmail.com>
 <s5hzh2dn3oa.wl-tiwai@suse.de>
 <CAAd53p6Ef2zFX_t3y1c6O7BmHnxYGtGSfgzXAMQSom1ainWXzg@mail.gmail.com>
 <s5hsg85n2km.wl-tiwai@suse.de> <s5hmtydn0yg.wl-tiwai@suse.de>
 <CAAd53p6MMFh=HCNF9pyrJc9hVMZWFe7_8MvBcBHVWARqHU_TTA@mail.gmail.com>
 <s5h7dpfk06y.wl-tiwai@suse.de>
 <CAAd53p53w0H6tsb4JgQtFTkYinniicTYBs2uk7tc=heP2dM_Cw@mail.gmail.com>
 <CAKb7UvjWX7xbwMKtnad5EVy16nY1M-A13YJeRWyUwHzemcVswA@mail.gmail.com>
 <CAAd53p4=bSX26QzsPyV1sxADiuVn2sowWyb5JFDoPZQ+ZYoCzA@mail.gmail.com>
 <CACO55tsPx_UC3OPf9Hq9sGdnZg9jH1+B0zOi6EAxTZ13E1tf7A@mail.gmail.com>
From: Roy Spliet <nouveau@spliet.org>
Message-ID: <d01e375f-bf16-a005-ec66-0910956cc616@spliet.org>
Date: Sat, 10 Apr 2021 16:51:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACO55tsPx_UC3OPf9Hq9sGdnZg9jH1+B0zOi6EAxTZ13E1tf7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at Neelix
X-Virus-Status: Clean
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 nouveau <nouveau@lists.freedesktop.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Alan Stern <stern@rowland.harvard.edu>, Mike Rapoport <rppt@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 open list <linux-kernel@vger.kernel.org>
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

Reviving this thread as we have another user (rightfully) complaining on 
IRC about this.

The way I see it there's two issues:
1) snd_hda_intel not allowing runpm (or w/e vgaswitcheroo needs) when 
there's missing codecs, inhibiting the entire GPU from performing runpm. 
This needlessly wastes lots of battery power.
2) HDMI audio not working on such machines unless it was plugged in at 
boot-time.

The original workarounds proposed by Kai-Heng seem to fix 1), which is 
progress. I don't see a reason why that should be held off even if it 
doesn't fix 2).
To fix 2), more work is needed. On a high level, I suspect nouveau 
should start controlling the enabling/disabling of the HDA controller 
based on connector events and/or connector state at module load. 
Currently the PCI quirk seems to enable it wholesale, and I don't know 
why. If no GPU driver is loaded, it's pointless to turn the HDA device 
on. The blob presumably doesn't need this either, as it can control the 
device just as well as nouveau. If it doesn't, NVIDIA should fix it 
rather than rely on this quirk. The only reason I can think of is that 
snd_hda_intel or vgaswitcheroo isn't prepared for hot(un)plugging (or 
alternatively reprobing) devices. Without that, we presumably won't 
solve issue 2). Can I ask someone with more technical knowledge of 
snd_hda_intel and vgaswitcheroo to brainstorm about the possible 
challenges of nouveau taking matters into its own hand rather than 
keeping this PCI quirk around?

Roy

Op 04-01-2021 om 13:20 schreef Karol Herbst:
> On Tue, Dec 22, 2020 at 3:50 AM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
>>
>> On Tue, Dec 22, 2020 at 1:56 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>>>
>>> On Mon, Dec 21, 2020 at 11:33 AM Kai-Heng Feng
>>> <kai.heng.feng@canonical.com> wrote:
>>>>
>>>> [+Cc nouveau]
>>>>
>>>> On Fri, Dec 18, 2020 at 4:06 PM Takashi Iwai <tiwai@suse.de> wrote:
>>>> [snip]
>>>>>> Quite possibly the system doesn't power up HDA controller when there's
>>>>>> no external monitor.
>>>>>> So when it's connected to external monitor, it's still needed for HDMI audio.
>>>>>> Let me ask the user to confirm this.
>>>>>
>>>>> Yeah, it's the basic question whether the HD-audio is supposed to work
>>>>> on this machine at all.  If yes, the current approach we take makes
>>>>> less sense - instead we should rather make the HD-audio controller
>>>>> working.
>>>>
>>>> Yea, confirmed that the Nvidia HDA works when HDMI is connected prior boot.
>>>>
>>>>>>> - The second problem is that pci_enable_device() ignores the error
>>>>>>>    returned from pci_set_power_state() if it's -EIO.  And the
>>>>>>>    inaccessible access error returns -EIO, although it's rather a fatal
>>>>>>>    problem.  So the driver believes as the PCI device gets enabled
>>>>>>>    properly.
>>>>>>
>>>>>> This was introduced in 2005, by Alan's 11f3859b1e85 ("[PATCH] PCI: Fix
>>>>>> regression in pci_enable_device_bars") to fix UHCI controller.
>>>>>>
>>>>>>>
>>>>>>> - The third problem is that HD-audio driver blindly believes the
>>>>>>>    codec_mask read from the register even if it's a read failure as I
>>>>>>>    already showed.
>>>>>>
>>>>>> This approach has least regression risk.
>>>>>
>>>>> Yes, but it assumes that HD-audio is really non-existent.
>>>>
>>>> I really don't know any good approach to address this.
>>>> On Windows, HDA PCI is "hidden" until HDMI cable is plugged, then the
>>>> driver will flag the magic bit to make HDA audio appear on the PCI
>>>> bus.
>>>> IIRC the current approach is to make nouveau and device link work.
>>>
>>> I don't have the full context of this discussion, but the kernel
>>> force-enables the HDA subfunction nowadays, irrespective of nouveau or
>>> nvidia or whatever:
>>
>> That's the problem.
>>
>> The nvidia HDA controller on the affected system only gets its power
>> after HDMI cable plugged, so the probe on boot fails.
>>
> 
> it might be that the code to enable the sub function is a bit broken
> :/ but it should work. Maybe the quirk_nvidia_hda function needs to be
> called on more occasions? No idea.
> 
>> Kai-Heng
>>
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/quirks.c?h=v5.10#n5267
>>>
>>> Cheers,
>>>
>>>    -ilia
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>>
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
> 
