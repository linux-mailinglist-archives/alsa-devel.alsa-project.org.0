Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAB81BC1D8
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 16:50:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5B4A1687;
	Tue, 28 Apr 2020 16:50:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5B4A1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588085452;
	bh=pZaBjBAa/6e64QDu6CV1kaD69HSQ/1jB5tM5yHOKJZo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G7ijKc616/GwEFjJHlsMlkgK9eqeVh0YiO2iKofh8cQidKVGyvxxO0eqyC3I8UL1g
	 TaFGMDu5zsqa7f7ib4U9GziFCvnSxbH9Fj9YhIK1fYB518SOEl3n2zIqHh0/Skk917
	 g8L/8I5iazzVYWUKWzH/GrlWS73qgCrp655MqDoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB349F801EB;
	Tue, 28 Apr 2020 16:49:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E20FF800D2; Tue, 28 Apr 2020 16:49:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MSGID_FROM_MTA_HEADER,
 PRX_BODY_14,PRX_BODY_30,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253011.outbound.protection.outlook.com [40.92.253.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DF18F800D2
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 16:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DF18F800D2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fz6+cpVkuTFV1k2o6s8jaQFZMyToykktLrPdupbJQ2disbH8Q0ZAHDZo8zNADUptkQblyH9vNh/3bdutAof32HY1Bnt/a0JTSoE/s5RMeV248m8pInWdzhX0NfbDnxa3eXRnLwsnmCdK2R4vB56V2yv9MUA5MZj57zxlOYfkgbJC6oeokdAZzavKSXCICw3hhou3lBs2KMXzvl6+NrIqBcrz19nPuV05gZlA/D7aJ7dBs7rq9j71ZMQDwfbo23XAu34cSqwX5VRZiLd0ZhquYR2LwxmBQ0gwHfsVqFLblWAkclpSyIWE7bt5zeCzSA/XnWvF1MKk/3No/nbqWiJ9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVqU5JkLLeC2WjHRol2wioZoDNGeMioAk7wAvRzT030=;
 b=gP2KuT5liQWEo878IyPMIMNRyUENmI726zNASkLQu6Ha+BJkkA1nTWTViCqqa/YaKHz8ALqXkKdWeAsINrcpRHoVwZ/hu/uF8MvVoWzCurC4ylX3n9unZXQWDQjjsXC8PiRChGctChX6C1QYjJVqS8AojivMnvE6BHw+2XDR5pIEVbN9Cyue6KEt58gXThwrRwDzwWzcszTrBovsHVT/n6FOInVWtLFEspte/Iwz4klf6k4eh3iYuMxJ5s3LW7RUSSH91yJIFaHgqxuQaa+bJ/Im2XCqnCPmundOPIjPIiQeAKREqjjzxk4v3r7QQID+f2FFCBTp4nBfIyrdd3DXnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com.au; dmarc=pass action=none
 header.from=outlook.com.au; dkim=pass header.d=outlook.com.au; arc=none
Received: from SG2APC01FT046.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::51) by
 SG2APC01HT045.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::264)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Tue, 28 Apr
 2020 14:48:55 +0000
Received: from PSXP216MB0438.KORP216.PROD.OUTLOOK.COM (10.152.250.53) by
 SG2APC01FT046.mail.protection.outlook.com (10.152.251.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.15 via Frontend Transport; Tue, 28 Apr 2020 14:48:55 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:51EDA924EE5575836B2BE8E89D68A30908D9B850C57A44654175E43D00B0DCAA;
 UpperCasedChecksum:5800F732756826CCE29519EA3F0C8B1F67387221CD5E5A76FB26774C131BABEC;
 SizeAsReceived:8515; Count:48
Received: from PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 ([fe80::21f1:20fb:d1f:8e25]) by PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 ([fe80::21f1:20fb:d1f:8e25%7]) with mapi id 15.20.2958.019; Tue, 28 Apr 2020
 14:48:55 +0000
Date: Tue, 28 Apr 2020 22:48:45 +0800
From: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/1] Fiji GPU audio register timeout when in BACO state
Message-ID: <PSXP216MB043899DC52E6C6BF728D77CD80AC0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
References: <PSXP216MB0438D2AF96CE0D4F83F48C4D80AE0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <MN2PR12MB4488E4909C1488FB507E0BF5F7AF0@MN2PR12MB4488.namprd12.prod.outlook.com>
 <s5ho8rdnems.wl-tiwai@suse.de>
 <PSXP216MB04387BF6B5F8DA84749E5D6F80AF0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <CADnq5_M=QEqxuCKjb_qZvFSvwM5eLEFfsepxYYXoouFoe5bn7A@mail.gmail.com>
 <s5h4kt4ojrf.wl-tiwai@suse.de>
 <CADnq5_MMQ5_MjEg=bkJJGMJP53RjB3yxvOW0nUDeWxzg3Q0pVQ@mail.gmail.com>
 <s5hv9lkm49n.wl-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hv9lkm49n.wl-tiwai@suse.de>
X-ClientProxiedBy: MEXPR01CA0122.ausprd01.prod.outlook.com
 (2603:10c6:200:2c::31) To PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 (2603:1096:300:d::20)
X-Microsoft-Original-Message-ID: <20200428144845.GA1547@nicholas-dell-linux>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nicholas-dell-linux (2001:44b8:605f:11:45ec:d37e:a989:bf24) by
 MEXPR01CA0122.ausprd01.prod.outlook.com (2603:10c6:200:2c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.13 via Frontend Transport; Tue, 28 Apr 2020 14:48:51 +0000
X-Microsoft-Original-Message-ID: <20200428144845.GA1547@nicholas-dell-linux>
X-TMN: [IUGqIC7/Zv7twGS6RVxoYzVam1CA7NZrEjvBBgbRbB98FB2DWIA8dbv+bvNICPsO]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 8e4b4306-4dba-4988-ebed-08d7eb8345db
X-MS-TrafficTypeDiagnostic: SG2APC01HT045:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dCk4q+BikjfVpAHuBnEjPOxoOji2VyGkIKuZw2/4FJYAAUwW9kI2QkomRGL3hgcH5FSy1RXWLXDnTdpDgWa4HM9ilSB+gbTPxdCp+bsBQ0cPOY9OGEPtXrd8Po0kjYKzHvVkISz2IymFM0qIqfkU6Rc9NfIe+G1W8wcZbaU2NOAOy5WEez5Ci8ixHVFxW63jwyHy4uesfg1ubaShO5Y6yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:PSXP216MB0438.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: xcdHaXoakmq/JoXDcjPo742TnHoCTzPmZnYYGDCesfAVzWzUUAH4lceZ+WKDDBEy0q31E2ecfGAEM9CeHqH5/m6fLxXCdDalpm3mElZcC3LCzukmmxvB3CnRgPM7PM/xvcFyv5IiehgmeAfQB4k32CTf4QPVl0szzdu4c6AYEYTyy0hnCBLVF4RP1om/Fru13/rHzUbzny1+NtClaUYsUg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4b4306-4dba-4988-ebed-08d7eb8345db
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2020 14:48:54.9904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT045
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Takashi Iwai <tiwai@suse.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Lukas Wunner <lukas@wunner.de>,
 Alex Deucher <alexdeucher@gmail.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
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

On Tue, Apr 28, 2020 at 09:57:24AM +0200, Takashi Iwai wrote:
> On Mon, 27 Apr 2020 20:43:54 +0200,
> Alex Deucher wrote:
> > 
> > On Mon, Apr 27, 2020 at 2:39 PM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Mon, 27 Apr 2020 20:28:12 +0200,
> > > Alex Deucher wrote:
> > > >
> > > > On Mon, Apr 27, 2020 at 2:07 PM Nicholas Johnson
> > > > <nicholas.johnson-opensource@outlook.com.au> wrote:
> > > > >
> > > > > On Mon, Apr 27, 2020 at 05:15:55PM +0200, Takashi Iwai wrote:
> > > > > > On Mon, 27 Apr 2020 16:22:21 +0200,
> > > > > > Deucher, Alexander wrote:
> > > > > > >
> > > > > > > [AMD Public Use]
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>
> > > > > > > > Sent: Sunday, April 26, 2020 12:02 PM
> > > > > > > > To: linux-kernel@vger.kernel.org
> > > > > > > > Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> > > > > > > > <Christian.Koenig@amd.com>; Zhou, David(ChunMing)
> > > > > > > > <David1.Zhou@amd.com>; Nicholas Johnson <nicholas.johnson-
> > > > > > > > opensource@outlook.com.au>
> > > > > > > > Subject: [PATCH 0/1] Fiji GPU audio register timeout when in BACO state
> > > > > > > >
> > > > > > > > Hi all,
> > > > > > > >
> > > > > > > > Since Linux v5.7-rc1 / commit 4fdda2e66de0 ("drm/amdgpu/runpm: enable
> > > > > > > > runpm on baco capable VI+ asics"), my AMD R9 Nano has been using runpm /
> > > > > > > > BACO. You can tell visually when it sleeps, because the fan on the graphics
> > > > > > > > card is switched off to save power. It did not spin down the fan in v5.6.x.
> > > > > > > >
> > > > > > > > This is great (I love it), except that when it is sleeping, the PCIe audio function
> > > > > > > > of the GPU has issues if anything tries to access it. You get dmesg errors such
> > > > > > > > as these:
> > > > > > > >
> > > > > > > > snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last cmd=0x170500
> > > > > > > > snd_hda_intel 0000:08:00.1: azx_get_response timeout, switching to polling
> > > > > > > > mode: last cmd=0x001f0500 snd_hda_intel 0000:08:00.1: No response from
> > > > > > > > codec, disabling MSI: last cmd=0x001f0500 snd_hda_intel 0000:08:00.1: No
> > > > > > > > response from codec, resetting bus: last cmd=0x001f0500
> > > > > > > > snd_hda_codec_hdmi hdaudioC1D0: Unable to sync register 0x2f0d00. -11
> > > > > > > >
> > > > > > > > The above is with the Fiji XT GPU at 0000:08:00.0 in a Thunderbolt enclosure
> > > > > > > > (not that Thunderbolt should affect it, but I feel I should mention it just in
> > > > > > > > case). I dropped a lot of duplicate dmesg lines, as some of them repeated a
> > > > > > > > lot of times before the driver gave up.
> > > > > > > >
> > > > > > > > I offer this patch to disable runpm for Fiji while a fix is found, if you decide
> > > > > > > > that is the best approach. Regardless, I will gladly test any patches you come
> > > > > > > > up with instead and confirm that the above issue has been fixed.
> > > > > > > >
> > > > > > > > I cannot tell if any other GPUs are affected. The only other cards to which I
> > > > > > > > have access are a couple of AMD R9 280X (Tahiti XT), which use radeon driver
> > > > > > > > instead of amdgpu driver.
> > > > > > >
> > > > > > > Adding a few more people.  Do you know what is accessing the audio?  The audio should have a dependency on the GPU device.  The GPU won't enter runtime pm until the audio has entered runtime pm and vice versa on resume. Please attach a copy of your dmesg output and lspci output.
> > > > >
> > > > > pci 0000:08:00.1: D0 power state depends on 0000:08:00.0
> > > > > The above must be the dependency of which you speak from dmesg.
> > > > >
> > > > > Accessing the audio? I did not have a single method for triggering it.
> > > > > Sometimes it happened on shutdown. Sometimes when restarting gdm.
> > > > > Sometimes when playing with audio settings in Cinnamon Desktop. But most
> > > > > often when changing displays. It might have something to do with the
> > > > > audio device associated with a monitor being created when the monitor is
> > > > > found. If an audio device is created, then pulseaudio might touch it.
> > > > > Sorry, this is a very verbose "not quite sure".
> > > > >
> > > > > To trigger the bug, this time I did the following:
> > > > >
> > > > > 1. Boot laptop without Fiji and log in
> > > > >
> > > > > 2. Attach Fiji via Thunderbolt (no displays attached to Fiji) and
> > > > > approve Thunderbolt device
> > > > >
> > > > > 3. Log in again because the session gets killed when GPU is hot-added
> > > > >
> > > > > 4. Wait for Fiji to fall asleep (fan stops)
> > > > >
> > > > > 5. Open "dmesg -w" on laptop display
> > > > >
> > > > > 6. Attach display to DisplayPort on Fiji (it should still stay asleep)
> > > > >
> > > > > 7. Do WindowsKey+P to activate external display. The error appears in
> > > > > dmesg window that instant.
> > > > >
> > > > > Could it be a race condition when waking the card up?
> > > > >
> > > > > I cannot get the graphics card fan to spin down if the Thunderbolt
> > > > > enclosure is attached at boot time. It only does it if hot-added.
> > > > >
> > > > > If you think it will help, I can take out the Fiji and put it in a test
> > > > > rig and try to replicate the issue without Thunderbolt, but it looks
> > > > > like it will not spin the fan down if Fiji is attached at boot time.
> > > > >
> > > > > Question, why would the fan not spin down if Fiji is attached at boot
> > > > > time, and how would one make the said fan turn off? Aside from being
> > > > > useful for pinning down the audio register issue, I would like to make
> > > > > sure the power savings are realised whenever the GPU is not being used.
> > > >
> > > > Presumably something is using the device.  Maybe a framebuffer console
> > > > or X?  Or maybe the something like tlp has disabled runtime pm on your
> > > > device?  You can see the current status by reading the files in
> > > > /sys/class/drm/cardX/device/power/ .  Replace cardX with card0, card1,
> > > > etc. depending on which device is the radeon card.
I had card1 = Fiji stuck awake and card2 = Fiji asleep (both in separate 
Thunderbolt enclosures).

The sysfs values in /sys/class/drm/card{0,1}/device/power/ were the 
same.

The powertop utility did not help in "tunables" tab.

I compiled kernel without fbcon and it still did it.

But moving from Arch to Ubuntu changed the behaviour. I am still 
investigating.

> > > >
> > > > FWIW, I have a fiji board in a desktop system and it worked fine when
> > > > this code was enabled.
> > >
> > > Is the new DC code used for Fiji boards?  IIRC, the audio component
> > > binding from amdgpu is enabled only for DC, and without the audio
> > > component binding the runtime PM won't be linked up, hence you can't
> > > power up GPU from the audio side access automatically.
> > >
> > 
> > Yes, DC is enabled by default for all cards with runtime pm enabled.
> 
> OK, thanks, I found that amdgpu got bound via component in the dmesg
> output, too:
> 
> [   21.294927] snd_hda_intel 0000:08:00.1: bound 0000:08:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> 
> This is the place soon after amdgpu driver gets initialized.
> Then we see later another initialization phase:
> 
> [   26.904127] rfkill: input handler enabled
> [   37.264152] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
> 
> here shows 10 seconds between them.  Then, it complained something:
> 
> 
> [   37.363287] [drm] UVD initialized successfully.
> [   37.473340] [drm] VCE initialized successfully.
> [   37.477942] amdgpu 0000:08:00.0: [drm] Cannot find any crtc or sizes

The above would be me hitting WindowsKey+P to change screens, but with 
no DisplayPort attached to Fiji, hence it unable to find crtc.

> 
> ... and go further, and hitting HD-audio error:
> 
That would be me having attached the DisplayPort and done WindowsKey+P 
again.

> 
> [   38.936624] [drm] fb mappable at 0x4B0696000
> [   38.936626] [drm] vram apper at 0x4B0000000
> [   38.936626] [drm] size 33177600
> [   38.936627] [drm] fb depth is 24
> [   38.936627] [drm]    pitch is 15360
> [   38.936673] amdgpu 0000:08:00.0: fb1: amdgpudrmfb frame buffer device
> [   40.092223] snd_hda_intel 0000:08:00.1: azx_get_response timeout, switching to polling mode: last cmd=0x00170500
> 
> After this point, HD-audio communication was screwed up.
> 
> This lastcmd in the above message is AC_SET_POWER_STATE verb for the
> root node to D0, so the very first command to power up the codec. 
> The rest commands are also about the power up of each node, so the
> whole error indicate that the power up at runtime resume failed.
> 
> So, this looks to me as if the device gets runtime-resumed at the bad
> moment?
It does. However, this is not going to be easy to pin down.

I moved from Arch to Ubuntu, and it behaves differently. I cannot 
trigger the bug in Ubuntu. Plus, it puts the GPUs asleep, even if 
attached at boot, unlike Arch. I will continue to try to trigger it. But 
even if this is a problem with the Linux distribution, it should not be 
able to trigger a kernel mode bug, so we should persist with finding it.

Regards,
Nicholas

> 
> 
> thanks,
> 
> Takashi
