Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C7735DD97
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Apr 2021 13:18:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F311662;
	Tue, 13 Apr 2021 13:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F311662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618312734;
	bh=y5qd2POsXvLEhGOp9KTQsW+WmXUxT8EeddkaOJe0ats=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qeeVOPdsXkhJOwDQp+agAzqG1mAFEPEdl9bgyvyX1XADgZ5n6y6c9d32K5xw1U6lQ
	 1RFyeoEIeYqpYxQW13EC7j+2DwEP4ShSWoKny7PL3jxzdN2vxnhvY/SE+hVk47Hpgt
	 rL0bC1XTIqilbVt+4B+Q+8VaC1qTPXUPHMhOfCaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 657B5F800EB;
	Tue, 13 Apr 2021 13:17:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2388AF8022B; Tue, 13 Apr 2021 13:17:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_29,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mupuf.org (mupuf.org [167.71.42.210])
 by alsa1.perex.cz (Postfix) with ESMTP id 8454FF800EB
 for <alsa-devel@alsa-project.org>; Tue, 13 Apr 2021 13:17:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8454FF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=spliet.org header.i=@spliet.org
 header.b="P07r3HBE"
Received: from [IPv6:2a01:4b00:86b9:100:9ede:1593:85ef:7eda] (unknown
 [IPv6:2a01:4b00:86b9:100:9ede:1593:85ef:7eda])
 by Neelix.spliet.org (Postfix) with ESMTPSA id 658ACF20159;
 Tue, 13 Apr 2021 12:17:11 +0100 (BST)
DKIM-Filter: OpenDKIM Filter v2.11.0 Neelix.spliet.org 658ACF20159
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spliet.org;
 s=default; t=1618312631;
 bh=+M5fxcdRQ49329QkU9YJHmKemaTwxc5EYs0ik4Rr5Q8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=P07r3HBE2BFwVhVoLvo5eJNX015ua6sxBu9whZcZ0LQ6V2SvLYv3wNdZ42jYPQ16g
 8y2NDxRiEaU50g+TqapThf8DxWEFPTtf7/C5UrEWHFnvRG6YH3kLYLt0Opapxqwem/
 /8/mcd5XVpA8Xty9ixnSGpcCPUHplAzrhpGBLVMI=
Subject: Re: [Nouveau] [PATCH v2] ALSA: hda: Continue to probe when codec
 probe fails
To: Karol Herbst <kherbst@redhat.com>
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
 <CACO55tsBDov88YM7phm_SugdEUqD_1S=DWLFXSWr-4H+9wJyAQ@mail.gmail.com>
 <7edf5ed4-40ea-1cee-83e4-6e9b307b432a@spliet.org>
 <CACO55tv57qzis4wO3kLe9MSzR82PW5nVEvh4hVaXaoas7OjoXQ@mail.gmail.com>
From: Roy Spliet <nouveau@spliet.org>
Message-ID: <8e5299d7-573a-e200-83c7-08d5bd69bc79@spliet.org>
Date: Tue, 13 Apr 2021 12:17:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACO55tv57qzis4wO3kLe9MSzR82PW5nVEvh4hVaXaoas7OjoXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at Neelix
X-Virus-Status: Clean
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Lukas Wunner <lukas@wunner.de>,
 Takashi Iwai <tiwai@suse.de>, nouveau <nouveau@lists.freedesktop.org>,
 Aaron Plattner <aplattner@nvidia.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Alan Stern <stern@rowland.harvard.edu>, Linux PCI <linux-pci@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Mike Rapoport <rppt@kernel.org>
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

Op 13-04-2021 om 10:48 schreef Karol Herbst:
> On Tue, Apr 13, 2021 at 10:24 AM Roy Spliet <nouveau@spliet.org> wrote:
>>
>> Op 13-04-2021 om 01:10 schreef Karol Herbst:
>>> On Mon, Apr 12, 2021 at 9:36 PM Roy Spliet <nouveau@spliet.org> wrote:
>>>>
>>>> Hello Aaron,
>>>>
>>>> Thanks for your insights. A follow-up query and some observations in-line.
>>>>
>>>> Op 12-04-2021 om 20:06 schreef Aaron Plattner:
>>>>> On 4/10/21 1:48 PM, Roy Spliet wrote:
>>>>>> Op 10-04-2021 om 20:23 schreef Lukas Wunner:
>>>>>>> On Sat, Apr 10, 2021 at 04:51:27PM +0100, Roy Spliet wrote:
>>>>>>>> Can I ask someone with more
>>>>>>>> technical knowledge of snd_hda_intel and vgaswitcheroo to brainstorm
>>>>>>>> about
>>>>>>>> the possible challenges of nouveau taking matters into its own hand
>>>>>>>> rather
>>>>>>>> than keeping this PCI quirk around?
>>>>>>>
>>>>>>> It sounds to me like the HDA is not powered if no cable is plugged in.
>>>>>>> What is reponsible then for powering it up or down, firmware code on
>>>>>>> the GPU or in the host's BIOS?
>>>>>>
>>>>>> Sometimes the BIOS, but definitely unconditionally the PCI quirk code:
>>>>>> https://github.com/torvalds/linux/blob/master/drivers/pci/quirks.c#L5289
>>>>>>
>>>>>> (CC Aaron Plattner)
>>>>>
>>>>> My basic understanding is that the audio function stops responding
>>>>> whenever the graphics function is powered off. So the requirement here
>>>>> is that the audio driver can't try to talk to the audio function while
>>>>> the graphics function is asleep, and must trigger a graphics function
>>>>> wakeup before trying to communicate with the audio function.
>>>>
>>>> I believe that vgaswitcheroo takes care of this for us.
>>>>
>>>
>>> yeah, and also: why would the driver want to do stuff? If the GPU is
>>> turned off, there is no point in communicating with the audio device
>>> anyway. The driver should do the initial probe and leave the device be
>>> unless it's actively used. Also there is no such thing as "use the
>>> audio function, but not the graphics one"
>>>
>>>>> I think
>>>>> there are also requirements about the audio function needing to be awake
>>>>> when the graphics driver is updating the ELD, but I'm not sure.
>>>>>
>>>
>>> well, it's one physical device anyway, so technically the audio
>>> function is powered on.
>>>
>>>>> This is harder on Windows because the audio driver lives in its own
>>>>> little world doing its own thing but on Linux we can do better.
>>>>>
>>>>>>> Ideally, we should try to find out how to control HDA power from the
>>>>>>> operating system rather than trying to cooperate with whatever firmware
>>>>>>> is doing.  If we have that capability, the OS should power the HDA up
>>>>>>> and down as it sees fit.
>>>>>
>>>>> After system boot, I don't think there's any firmware involved, but I'm
>>>>> not super familiar with the low-level details and it's possible the
>>>>> situation changed since I last looked at it.
>>>>>
>>>>> I think the problem with having nouveau write this quirk is that the
>>>>> kernel will need to re-probe the PCI device to notice that it has
>>>>> suddenly become a multi-function device with an audio function, and
>>>>> hotplug the audio driver. I originally looked into trying to do that but
>>>>> it was tricky because the PCI subsystem didn't really have a mechanism
>>>>> for a single-function device to become a multi-function device on the
>>>>> fly and it seemed easier to enable it early on during bus enumeration.
>>>>> That way the kernel sees both functions all the time without anything
>>>>> else having to be special about this configuration.
>>>
>>> Well, we do have this pci/quirk.c thing, no? Nouveau does flip the
>>> bit, but I am actually not sure if that's even doing something
>>> anymore. Maybe in the runtime_resume case it's still relevant but not
>>> sure _when_ DECLARE_PCI_FIXUP_CLASS_RESUME_EARLY is triggered, it does
>>> seem to be called even in the runtime_resume case though.
>>>
>>>>
>>>> Right, so for a little more context: a while ago I noticed that my
>>>> laptop (lucky me, Asus K501UB) has a 940M with HDA but no codec. Seems
>>>> legit, given how this GPU has no displays attached; they're all hooked
>>>> up to the Intel integrated GPU. That threw off the snd_hda_intel
>>>> mid-probe, and as a result didn't permit runpm, keeping the entire GPU,
>>>> PCIe bus and thus the CPU package awake. A bit of hackerly later we
>>>> decided to continue probing without a codec, and now my laptop is happy,
>>>> but...
>>>> A new problem popped up with several other NVIDIA GPUs that expose their
>>>> HDA subdevice, but somehow its inaccessible. Relevant lines from a
>>>> users' log:
>>>>
>>>> [    3.031222] MXM: GUID detected in BIOS
>>>> [    3.031280] ACPI BIOS Error (bug): AE_AML_PACKAGE_LIMIT, Index
>>>> (0x000000003) is beyond end of object (length 0x0) (20200925/exoparg2-393)
>>>> [    3.031352] ACPI Error: Aborting method \_SB.PCI0.GFX0._DSM due to
>>>> previous error (AE_AML_PACKAGE_LIMIT) (20200925/psparse-529)
>>>> [    3.031419] ACPI: \_SB_.PCI0.GFX0: failed to evaluate _DSM (0x300b)
>>>> [    3.031424] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type
>>>> mismatch - Found [Buffer], ACPI requires [Package] (20200925/nsarguments-61)
>>>> [    3.031619] pci 0000:00:02.0: optimus capabilities: enabled, status
>>>> dynamic power,
>>>> [    3.031667] ACPI BIOS Error (bug): AE_AML_PACKAGE_LIMIT, Index
>>>> (0x000000003) is beyond end of object (length 0x0) (20200925/exoparg2-393)
>>>> [    3.031731] ACPI Error: Aborting method \_SB.PCI0.GFX0._DSM due to
>>>> previous error (AE_AML_PACKAGE_LIMIT) (20200925/psparse-529)
>>>> [    3.031791] ACPI Error: Aborting method \_SB.PCI0.PEG0.PEGP._DSM due
>>>> to previous error (AE_AML_PACKAGE_LIMIT) (20200925/psparse-529)
>>>> [    3.031856] ACPI: \_SB_.PCI0.PEG0.PEGP: failed to evaluate _DSM (0x300b)
>>>> [    3.031859] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
>>>> mismatch - Found [Buffer], ACPI requires [Package] (20200925/nsarguments-61)
>>>
>>> If I am not wrong we are calling the _DSM method inside nouveau when
>>> doing runpm on pre _PR3 systems. As this is all very vendor specific,
>>> we might be doing something incorrectly.
>>>
>>>> [    3.032058] pci 0000:01:00.0: optimus capabilities: enabled, status
>>>> dynamic power,
>>>> [    3.032061] VGA switcheroo: detected Optimus DSM method
>>>> \_SB_.PCI0.PEG0.PEGP handle
>>>> [    3.032323] checking generic (d0000000 410000) vs hw (f6000000 1000000)
>>>> [    3.032325] checking generic (d0000000 410000) vs hw (e0000000 10000000)
>>>> [    3.032326] checking generic (d0000000 410000) vs hw (f0000000 2000000)
>>>> [    3.032410] nouveau 0000:01:00.0: NVIDIA GK107 (0e71f0a2)
>>>> [    3.042385] nouveau 0000:01:00.0: bios: version 80.07.a0.00.11
>>>> --- snip ---
>>>> [    8.951478] snd_hda_intel 0000:01:00.1: can't change power state from
>>>> D3cold to D0 (config space inaccessible)
>>>> [    8.951509] snd_hda_intel 0000:01:00.1: can't change power state from
>>>> D3hot to D0 (config space inaccessible)
>>>
>>> This is actually a little bad, because it means that the device
>>> doesn't come back up from D3. It's a bit weird it's D3cold and D3hot
>>> in the messages, but maybe the device just takes quite some time to
>>> wake up. But it does look like the device gets woken up.
>>>
>>>> [    8.951608] snd_hda_intel 0000:01:00.1: Disabling MSI
>>>> [    8.951621] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio
>>>> client
>>>> [    8.952461] snd_hda_intel 0000:00:1b.0: bound 0000:00:02.0 (ops
>>>> i915_audio_component_bind_ops [i915])
>>>> [    8.952642] snd_hda_intel 0000:01:00.1: number of I/O streams is 30,
>>>> forcing separate stream tags
>>>>
>>>> Now I don't know what's going on, but the snd_hda_intel messages are
>>>> ominous. And so are the ACPI warnings. But I don't know how much these
>>>> two are related.
>>>>
>>>
>>> What is the actual problem though? Seems like everything is fine
>>> despite those messages.
>>
>> The problem, as stated a few e-mails earlier, is that the HDA errors
>> currently prevent snd_hda_intel from properly probing the device and
>> registering it with vgaswitcheroo. As a result, the GPU always stays in
>> DynPwr rather than DynOff even when it's unused, keeping the PCIe bus
>> and the CPU package powered. Basically burning through a charged battery
>> a lot quicker than need be.
> 
> That's not the result of those errors, just the result of having no codecs, no?

If it was just a case of no codecs, Takashi and my patches from last 
year would have fixed it. This one seems a bit more hairy.

> 
>> If we go back a mile on the e-mail thread, I think the problem was
>> narrowed down to snd_hda_intel reading an invalid codec mask on the
>> config space, and using it anyway. That being said, I believe there are
>> also reports of users that don't get HDMI audio unless the cable was
>> plugged in at boot-time, with similar messages in their logs. The codec
>> might in such cases be hiding themselves until a cable is plugged in?
>> @Aaron Plattner: does that latter observation sound right to you?
>>
> 
> yeah, I think that's the thing we should focus on, everything else
> just seems unrelated at this point until we have more information
> (like, codecs hide, because the _DSM calls failed or something)
> 

Sure, but the option of not exposing the HDA device in the first place 
had to be explored, even if it just led to rejecting the idea like it 
seems to have. I'm in favour of pushing forward the original fix that 
makes snd_hda_intel not fail on reading an invalid codec mask, and have 
it register the device with vgaswitcheroo so we can send it to DynOff. 
With the current snd_hda_intel architecture that seems simpler than 
failing to probe and unmapping the driver from the device. However, the 
issue of no HDMI sound unless plugged in as boot is/might be related, 
and needs to be on someone's agenda.

>>>
>>>> You say that it is desirable to switch on HDA at boot-time because the
>>>> PCI subsystem doesn't play nicely with changing a device to
>>>> multi-function. That rules out the option of only enabling the HDA
>>>> device once a cable is plugged in. Are there any other trap doors that
>>>
>>> yeah, we can absolutely not do that. We do quirk the device to put the
>>> GPU into multi function state asap and the intel_hda_snd driver should
>>> deal with it.
>>>
>>>> snd_hda_intel needs to navigate around to make this work fault free on
>>>> all hardware, such as:
>>>> - Codecs not revealing themselves until a display is plugged in,
>>>> requiring perhaps a "codec reprobe" and "codec remove" event from
>>>> nouveau/rm to snd_hda_intel,
>>>
>>> we could trigger the reprobe from within nouveau as we are dealing
>>> with display hotplug events anyway.
>>
>> Right. Are there situations where nouveau needs to? Or is this a
>> misunderstanding of the problem from my end?
>>
> 
> nouveau has to do some configuration anyway, like connecting the audio
> stream with the port used etc...that's the ELD part. We have some
> drm_audio bits though, so maybe we can solve this more general and
> maybe the radeon drivers already have something here? Might be worth
> to take a look there as well.
> 
>>>
>>>> - Borked BIOSes just blindly assigning the MMIO space of the HDA device
>>>> to another device, or nothing at all,
>>>
>>> that exists? *sigh*
>>>
>>>> - ... other things that might give any of us nightmares and heart burn?
>>>>
>>>
>>> hopefully there are none :p
>>>
>>>> Thanks!
>>>>
>>>> Roy
>>>>
>>>>>
>>>>> -- Aaron
>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>> Lukas
>>>>
>>>
>>
> 

