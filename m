Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE451BABA6
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 19:49:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9617D16AF;
	Mon, 27 Apr 2020 19:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9617D16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588009742;
	bh=cYhxig7n1w8+NjrihhNBKlaN+H965pDqOmHJNzHNTLA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TvOUEzqKpiDd0DbXYKxrrrDZGIVWJhO2lWbLp4CurBsE22BPYB8xI1N2kPlU/fK+R
	 7HUXXS7UB57tBGNFVPS05KH4hushYMVVqtAz+Yk/919fH4OOoP/0FKm4jtzTuhA56F
	 dOpmzB4u17PuoUfdfXsYVbeZcp/7Rj/K3a3bEGoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D505F802A9;
	Mon, 27 Apr 2020 19:20:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B509F802A9; Mon, 27 Apr 2020 19:20:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=MSGID_FROM_MTA_HEADER,
 PRX_BODY_13,PRX_BODY_14,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253053.outbound.protection.outlook.com [40.92.253.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B366FF802A7
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 19:20:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B366FF802A7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAcChugOQ5BkeOOD6F8LMCIzuaAwzYmmsodZSdjr7HibHeHXx60Xe8huiCmM9YVIVP1iugpy0s+2Ee64E+22gZA98KtKDH/uwTWEzT2oqfzf9qwOqyycFSTloQR+lSHyzvqpXWVjeFTPgqFnqJvSalk9KHQyNaAQHnUvpzPzk5Ej1Ed7/WhyIkpSssrYPBkk/WavcI1YHjaC3piy7h/Ru7Rjy4JSkY6KEzP/hzRzYy2ppzJI+3W45Os6YDinj4EXe/fyrpgwLV8tehzuXW+PL9vJW2hQy1WCihMvGry2A6APmRLGlm6P1c6sSo2MXWz609yy9+n5JtcLbSuaV1r5QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvRjMzUMvfzUhxJTtboRqJ5ZvlmGRb7x2RKQK7guB+M=;
 b=A8tArUdkEaHpPsorXU4XNgBkSxKCMVDTskBErmt/+1EJQKDxwVStZyNRWUGrDbYYeqRIU5SQITRUumRzIYWIi54eJ2wIl3SIwRUGpimdbYEoUmiw73P43g+AYOBro/l3aBgSNlTf/A8vLZyM+9kRSi+eq3mzVJWu/C2SOUFOqqOp7+3nPSvbom/6VI1G3BdpDrhIjdjWgYaXvvWBix4mH59aL+edefZumhBU8XfuTorJXXLIwb4hW/OtceRIjIrvy7ANGaljiN14bNB7M8i7Dk6iHTtFSpvOeX5Ll3ynU5P0n1FUjXshfqSr4ihrVVcl2P9nEd3z/zOjeh/Hj22kog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com.au; dmarc=pass action=none
 header.from=outlook.com.au; dkim=pass header.d=outlook.com.au; arc=none
Received: from HK2APC01FT020.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::49) by
 HK2APC01HT062.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::327)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Mon, 27 Apr
 2020 17:20:31 +0000
Received: from PSXP216MB0438.KORP216.PROD.OUTLOOK.COM (10.152.248.53) by
 HK2APC01FT020.mail.protection.outlook.com (10.152.248.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.15 via Frontend Transport; Mon, 27 Apr 2020 17:20:31 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:E951C09BAFCBF01FDC7ED0EF3E32359AB7E3B5ED716B2AC2A724903EF3ED7E43;
 UpperCasedChecksum:4F2B937C72643E51CAC922BDF827F8397677C912D5DFA045EAFD0AF07EE1F8CE;
 SizeAsReceived:8229; Count:48
Received: from PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 ([fe80::21f1:20fb:d1f:8e25]) by PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 ([fe80::21f1:20fb:d1f:8e25%7]) with mapi id 15.20.2937.023; Mon, 27 Apr 2020
 17:20:31 +0000
Date: Tue, 28 Apr 2020 01:20:20 +0800
From: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/1] Fiji GPU audio register timeout when in BACO state
Message-ID: <PSXP216MB04387BF6B5F8DA84749E5D6F80AF0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
References: <PSXP216MB0438D2AF96CE0D4F83F48C4D80AE0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <MN2PR12MB4488E4909C1488FB507E0BF5F7AF0@MN2PR12MB4488.namprd12.prod.outlook.com>
 <s5ho8rdnems.wl-tiwai@suse.de>
Content-Type: multipart/mixed; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
In-Reply-To: <s5ho8rdnems.wl-tiwai@suse.de>
X-ClientProxiedBy: ME1PR01CA0091.ausprd01.prod.outlook.com
 (2603:10c6:200:18::24) To PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 (2603:1096:300:d::20)
X-Microsoft-Original-Message-ID: <20200427172020.GA2658@nicholas-dell-linux>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nicholas-dell-linux (2001:44b8:605f:11:45ec:d37e:a989:bf24) by
 ME1PR01CA0091.ausprd01.prod.outlook.com (2603:10c6:200:18::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.13 via Frontend Transport; Mon, 27 Apr 2020 17:20:27 +0000
X-Microsoft-Original-Message-ID: <20200427172020.GA2658@nicholas-dell-linux>
X-TMN: [1GfpXr0374ATBEsYc9ndCsgodcWIphXr/wTzxAZkL4/gFoba/XaM+1K+BrYBXUtK]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f6ab9161-abf6-45a6-f5a2-08d7eacf48a2
X-MS-TrafficTypeDiagnostic: HK2APC01HT062:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fOl8ERFFdOeTGNlxX6ozpE3qw76pbgLV+3xhwWdPFOcgrk7B28XlnB1ZhOr81qpU9CSCwRD4Wd7NTXcB70eFgOAYF3Q56Dd/dDykiZrIZ3jquOHHofsJxWrQJuRpDXfVb0t7stbUT+Z0EI/O/IycwB36F+dJWy2weScM13w06454cwPI69AdBp8i6M5Ek8qhy2c/rMnFp8p2Pxr3GbgFMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:PSXP216MB0438.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: Bnn/kxf/LewK5VFjKE4xD4B7mFzOcjCchhPz0szFpvlfw73bOprtnErdH7JgQPlGk8mRlp6GIbl0fJFItJKxgRiMZISnfzwUw0PyfoPIpCvvzOWq+6cjkvMn6niWfYOV9JuuWsi7SgQ9jm9gOWbOqPxSAgt/Jj7n9vJsxUgCXyl7WdVTTtVpEPTgsi02/2lI99oiDk3li0/JTIv8LuU9Vg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ab9161-abf6-45a6-f5a2-08d7eacf48a2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2020 17:20:31.3534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT062
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Takashi Iwai <tiwai@suse.com>, Lukas Wunner <lukas@wunner.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
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

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2020 at 05:15:55PM +0200, Takashi Iwai wrote:
> On Mon, 27 Apr 2020 16:22:21 +0200,
> Deucher, Alexander wrote:
> > 
> > [AMD Public Use]
> > 
> > > -----Original Message-----
> > > From: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>
> > > Sent: Sunday, April 26, 2020 12:02 PM
> > > To: linux-kernel@vger.kernel.org
> > > Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> > > <Christian.Koenig@amd.com>; Zhou, David(ChunMing)
> > > <David1.Zhou@amd.com>; Nicholas Johnson <nicholas.johnson-
> > > opensource@outlook.com.au>
> > > Subject: [PATCH 0/1] Fiji GPU audio register timeout when in BACO state
> > > 
> > > Hi all,
> > > 
> > > Since Linux v5.7-rc1 / commit 4fdda2e66de0 ("drm/amdgpu/runpm: enable
> > > runpm on baco capable VI+ asics"), my AMD R9 Nano has been using runpm /
> > > BACO. You can tell visually when it sleeps, because the fan on the graphics
> > > card is switched off to save power. It did not spin down the fan in v5.6.x.
> > > 
> > > This is great (I love it), except that when it is sleeping, the PCIe audio function
> > > of the GPU has issues if anything tries to access it. You get dmesg errors such
> > > as these:
> > > 
> > > snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last cmd=0x170500
> > > snd_hda_intel 0000:08:00.1: azx_get_response timeout, switching to polling
> > > mode: last cmd=0x001f0500 snd_hda_intel 0000:08:00.1: No response from
> > > codec, disabling MSI: last cmd=0x001f0500 snd_hda_intel 0000:08:00.1: No
> > > response from codec, resetting bus: last cmd=0x001f0500
> > > snd_hda_codec_hdmi hdaudioC1D0: Unable to sync register 0x2f0d00. -11
> > > 
> > > The above is with the Fiji XT GPU at 0000:08:00.0 in a Thunderbolt enclosure
> > > (not that Thunderbolt should affect it, but I feel I should mention it just in
> > > case). I dropped a lot of duplicate dmesg lines, as some of them repeated a
> > > lot of times before the driver gave up.
> > > 
> > > I offer this patch to disable runpm for Fiji while a fix is found, if you decide
> > > that is the best approach. Regardless, I will gladly test any patches you come
> > > up with instead and confirm that the above issue has been fixed.
> > > 
> > > I cannot tell if any other GPUs are affected. The only other cards to which I
> > > have access are a couple of AMD R9 280X (Tahiti XT), which use radeon driver
> > > instead of amdgpu driver.
> > 
> > Adding a few more people.  Do you know what is accessing the audio?  The audio should have a dependency on the GPU device.  The GPU won't enter runtime pm until the audio has entered runtime pm and vice versa on resume. Please attach a copy of your dmesg output and lspci output.

pci 0000:08:00.1: D0 power state depends on 0000:08:00.0
The above must be the dependency of which you speak from dmesg.

Accessing the audio? I did not have a single method for triggering it. 
Sometimes it happened on shutdown. Sometimes when restarting gdm. 
Sometimes when playing with audio settings in Cinnamon Desktop. But most 
often when changing displays. It might have something to do with the 
audio device associated with a monitor being created when the monitor is 
found. If an audio device is created, then pulseaudio might touch it. 
Sorry, this is a very verbose "not quite sure".

To trigger the bug, this time I did the following:

1. Boot laptop without Fiji and log in

2. Attach Fiji via Thunderbolt (no displays attached to Fiji) and 
approve Thunderbolt device

3. Log in again because the session gets killed when GPU is hot-added

4. Wait for Fiji to fall asleep (fan stops)

5. Open "dmesg -w" on laptop display

6. Attach display to DisplayPort on Fiji (it should still stay asleep)

7. Do WindowsKey+P to activate external display. The error appears in 
dmesg window that instant.

Could it be a race condition when waking the card up?

I cannot get the graphics card fan to spin down if the Thunderbolt 
enclosure is attached at boot time. It only does it if hot-added.

If you think it will help, I can take out the Fiji and put it in a test 
rig and try to replicate the issue without Thunderbolt, but it looks 
like it will not spin the fan down if Fiji is attached at boot time.

Question, why would the fan not spin down if Fiji is attached at boot 
time, and how would one make the said fan turn off? Aside from being 
useful for pinning down the audio register issue, I would like to make 
sure the power savings are realised whenever the GPU is not being used.

> 
> Also, please retest with the fresh 5.7-rc3.  There was a known
> regression regarding HD-audio PM in 5.7-rc1/rc2, and it's been fixed
> there (commit 8d6762af302d).
Linux v5.7-rc3 still has the same problem, unfortunately.

The dmesg is attached.

Thanks for your replies. Kind regards,
Nicholas

> 
> 
> thanks,
> 
> Takashi

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=dmesg-2020-04-28

[    0.000000] microcode: microcode updated early to revision 0xca, date = 2019-10-03
[    0.000000] Linux version 5.7.0-rc3+ (nicholas@nicholas-dell-linux) (gcc version 9.3.0 (Arch Linux 9.3.0-1), GNU ld (GNU Binutils) 2.34) #6 SMP Tue Apr 28 00:49:09 AWST 2020
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-5.7-rc3 root=UUID=e9880a1b-a4f2-4779-8a98-6c1bee968ebe rw sysrq_always_enabled audit=0 pcie_ports=native pci=assign-busses,hpbussize=0x33,hpmemsize=16K,hpiosize=0,hpmmiosize=400M,hpmmioprefsize=64G,nocrs,realloc intel_iommu=on iommu=on amdgpu.runpm=1
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Hygon HygonGenuine
[    0.000000]   Centaur CentaurHauls
[    0.000000]   zhaoxin   Shanghai  
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000057fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000000058000-0x0000000000058fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000059000-0x000000000009dfff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009e000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000002bd32fff] usable
[    0.000000] BIOS-e820: [mem 0x000000002bd33000-0x000000002bd33fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000002bd34000-0x000000002bd34fff] reserved
[    0.000000] BIOS-e820: [mem 0x000000002bd35000-0x000000003d383fff] usable
[    0.000000] BIOS-e820: [mem 0x000000003d384000-0x000000003d743fff] reserved
[    0.000000] BIOS-e820: [mem 0x000000003d744000-0x000000003d7b4fff] ACPI data
[    0.000000] BIOS-e820: [mem 0x000000003d7b5000-0x000000003de6cfff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000003de6d000-0x000000003ff25fff] reserved
[    0.000000] BIOS-e820: [mem 0x000000003ff26000-0x000000003fffefff] type 20
[    0.000000] BIOS-e820: [mem 0x000000003ffff000-0x000000003fffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000040000000-0x0000000047ffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000048000000-0x0000000048dfffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000048e00000-0x000000004f7fffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000004ae7fffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] efi: EFI v2.40 by American Megatrends
[    0.000000] efi:  ACPI=0x3d778000  ACPI 2.0=0x3d778000  SMBIOS=0xf0000  SMBIOS 3.0=0xf0020  TPMFinalLog=0x3de0e000  ESRT=0x3fdd8698  MEMATTR=0x3a81a018 
[    0.000000] SMBIOS 3.0.0 present.
[    0.000000] DMI: Dell Inc. XPS 13 9370/09DKKT, BIOS 1.12.1 12/11/2019
[    0.000000] tsc: Detected 2100.000 MHz processor
[    0.001104] tsc: Detected 2099.944 MHz TSC
[    0.001104] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.001106] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.001111] last_pfn = 0x4ae800 max_arch_pfn = 0x400000000
[    0.001114] MTRR default type: write-back
[    0.001115] MTRR fixed ranges enabled:
[    0.001116]   00000-9FFFF write-back
[    0.001116]   A0000-BFFFF uncachable
[    0.001117]   C0000-FFFFF write-protect
[    0.001117] MTRR variable ranges enabled:
[    0.001118]   0 base 0080000000 mask 7F80000000 uncachable
[    0.001119]   1 base 0060000000 mask 7FE0000000 uncachable
[    0.001120]   2 base 0050000000 mask 7FF0000000 uncachable
[    0.001120]   3 base 004C000000 mask 7FFC000000 uncachable
[    0.001121]   4 base 004B000000 mask 7FFF000000 uncachable
[    0.001121]   5 disabled
[    0.001122]   6 disabled
[    0.001122]   7 disabled
[    0.001122]   8 disabled
[    0.001122]   9 disabled
[    0.001430] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.001834] last_pfn = 0x48e00 max_arch_pfn = 0x400000000
[    0.007944] esrt: Reserving ESRT space from 0x000000003fdd8698 to 0x000000003fdd86d0.
[    0.007949] check: Scanning 1 areas for low memory corruption
[    0.007953] Using GB pages for direct mapping
[    0.007955] BRK [0x354201000, 0x354201fff] PGTABLE
[    0.007956] BRK [0x354202000, 0x354202fff] PGTABLE
[    0.007957] BRK [0x354203000, 0x354203fff] PGTABLE
[    0.007988] BRK [0x354204000, 0x354204fff] PGTABLE
[    0.007989] BRK [0x354205000, 0x354205fff] PGTABLE
[    0.008111] BRK [0x354206000, 0x354206fff] PGTABLE
[    0.008168] BRK [0x354207000, 0x354207fff] PGTABLE
[    0.008195] BRK [0x354208000, 0x354208fff] PGTABLE
[    0.008210] BRK [0x354209000, 0x354209fff] PGTABLE
[    0.008267] Secure boot could not be determined
[    0.008267] RAMDISK: [mem 0x26f50000-0x27aaafff]
[    0.008273] ACPI: Early table checksum verification disabled
[    0.008276] ACPI: RSDP 0x000000003D778000 000024 (v02 DELL  )
[    0.008278] ACPI: XSDT 0x000000003D7780C8 00010C (v01 DELL   CBX3     01072009 AMI  00010013)
[    0.008282] ACPI: FACP 0x000000003D79E9D8 00010C (v05 DELL   CBX3     01072009 AMI  00010013)
[    0.008286] ACPI: DSDT 0x000000003D778260 026773 (v02 DELL   CBX3     01072009 INTL 20160422)
[    0.008289] ACPI: FACS 0x000000003DE6A180 000040
[    0.008290] ACPI: APIC 0x000000003D79EAE8 0000BC (v03 DELL   CBX3     01072009 AMI  00010013)
[    0.008293] ACPI: FPDT 0x000000003D79EBA8 000044 (v01 DELL   CBX3     01072009 AMI  00010013)
[    0.008294] ACPI: FIDT 0x000000003D79EBF0 0000AC (v01 DELL   CBX3     01072009 AMI  00010013)
[    0.008296] ACPI: MCFG 0x000000003D79ECA0 00003C (v01 DELL   CBX3     01072009 MSFT 00000097)
[    0.008298] ACPI: HPET 0x000000003D79ECE0 000038 (v01 DELL   CBX3     01072009 AMI. 0005000B)
[    0.008300] ACPI: SSDT 0x000000003D79ED18 000359 (v01 SataRe SataTabl 00001000 INTL 20160422)
[    0.008303] ACPI: BOOT 0x000000003D79F078 000028 (v01 DELL   CBX3     01072009 AMI  00010013)
[    0.008304] ACPI: SSDT 0x000000003D79F0A0 0012DE (v02 SaSsdt SaSsdt   00003000 INTL 20160422)
[    0.008307] ACPI: HPET 0x000000003D7A0380 000038 (v01 INTEL  KBL-ULT  00000001 MSFT 0000005F)
[    0.008309] ACPI: SSDT 0x000000003D7A03B8 000CEF (v02 INTEL  xh_rvp07 00000000 INTL 20160422)
[    0.008311] ACPI: UEFI 0x000000003D7A10A8 000042 (v01                 00000000      00000000)
[    0.008313] ACPI: SSDT 0x000000003D7A10F0 0017AE (v02 CpuRef CpuSsdt  00003000 INTL 20160422)
[    0.008315] ACPI: LPIT 0x000000003D7A28A0 000094 (v01 INTEL  KBL-ULT  00000000 MSFT 0000005F)
[    0.008317] ACPI: SSDT 0x000000003D7A2938 000161 (v02 INTEL  HdaDsp   00000000 INTL 20160422)
[    0.008319] ACPI: SSDT 0x000000003D7A2AA0 00029F (v02 INTEL  sensrhub 00000000 INTL 20160422)
[    0.008321] ACPI: SSDT 0x000000003D7A2D40 003002 (v02 INTEL  PtidDevc 00001000 INTL 20160422)
[    0.008323] ACPI: SSDT 0x000000003D7A5D48 000517 (v02 INTEL  TbtTypeC 00000000 INTL 20160422)
[    0.008325] ACPI: DBGP 0x000000003D7A6260 000034 (v01 INTEL           00000002 MSFT 0000005F)
[    0.008327] ACPI: DBG2 0x000000003D7A6298 000054 (v00 INTEL           00000002 MSFT 0000005F)
[    0.008329] ACPI: SSDT 0x000000003D7A62F0 000801 (v02 INTEL  UsbCTabl 00001000 INTL 20160422)
[    0.008331] ACPI: SSDT 0x000000003D7A6AF8 00CFC3 (v02 DptfTa DptfTabl 00001000 INTL 20160422)
[    0.008333] ACPI: MSDM 0x000000003D7B3AC0 000055 (v03 DELL   CBX3     06222004 AMI  00010013)
[    0.008335] ACPI: SLIC 0x000000003D7B3B18 000176 (v03 DELL   CBX3     01072009 MSFT 00010013)
[    0.008337] ACPI: NHLT 0x000000003D7B3C90 00002D (v00 INTEL  EDK2     00000002      01000013)
[    0.008339] ACPI: TPM2 0x000000003D7B3CC0 000034 (v03 DELL   CBX3     00000001 AMI  00000000)
[    0.008341] ACPI: ASF! 0x000000003D7B3CF8 0000A0 (v32 INTEL   HCG     00000001 TFSM 000F4240)
[    0.008343] ACPI: DMAR 0x000000003D7B3D98 0000F0 (v01 INTEL  KBL      00000001 INTL 00000001)
[    0.008345] ACPI: BGRT 0x000000003D7B3E88 000038 (v00                 01072009 AMI  00010013)
[    0.008352] ACPI: Local APIC address 0xfee00000
[    0.008627] No NUMA configuration found
[    0.008627] Faking a node at [mem 0x0000000000000000-0x00000004ae7fffff]
[    0.008635] NODE_DATA(0) allocated [mem 0x4ae7d6000-0x4ae7fffff]
[    0.008867] Zone ranges:
[    0.008867]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.008868]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.008869]   Normal   [mem 0x0000000100000000-0x00000004ae7fffff]
[    0.008870]   Device   empty
[    0.008871] Movable zone start for each node
[    0.008874] Early memory node ranges
[    0.008874]   node   0: [mem 0x0000000000001000-0x0000000000057fff]
[    0.008875]   node   0: [mem 0x0000000000059000-0x000000000009dfff]
[    0.008876]   node   0: [mem 0x0000000000100000-0x000000002bd32fff]
[    0.008877]   node   0: [mem 0x000000002bd35000-0x000000003d383fff]
[    0.008877]   node   0: [mem 0x000000003ffff000-0x000000003fffffff]
[    0.008878]   node   0: [mem 0x0000000048000000-0x0000000048dfffff]
[    0.008878]   node   0: [mem 0x0000000100000000-0x00000004ae7fffff]
[    0.009171] Zeroed struct page in unavailable ranges: 46817 pages
[    0.009172] Initmem setup node 0 [mem 0x0000000000001000-0x00000004ae7fffff]
[    0.009174] On node 0 totalpages: 4114719
[    0.009174]   DMA zone: 64 pages used for memmap
[    0.009175]   DMA zone: 22 pages reserved
[    0.009175]   DMA zone: 3996 pages, LIFO batch:0
[    0.009213]   DMA32 zone: 3911 pages used for memmap
[    0.009213]   DMA32 zone: 250243 pages, LIFO batch:63
[    0.012051]   Normal zone: 60320 pages used for memmap
[    0.012051]   Normal zone: 3860480 pages, LIFO batch:63
[    0.046136] Reserving Intel graphics memory at [mem 0x4b800000-0x4f7fffff]
[    0.046384] ACPI: PM-Timer IO Port: 0x1808
[    0.046386] ACPI: Local APIC address 0xfee00000
[    0.046390] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.046391] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.046392] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.046392] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.046393] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.046393] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.046394] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.046394] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.046421] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.046423] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.046424] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.046425] ACPI: IRQ0 used by override.
[    0.046426] ACPI: IRQ9 used by override.
[    0.046427] Using ACPI (MADT) for SMP configuration information
[    0.046428] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.046432] e820: update [mem 0x39d10000-0x39d83fff] usable ==> reserved
[    0.046439] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.046457] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.046458] PM: hibernation: Registered nosave memory: [mem 0x00058000-0x00058fff]
[    0.046460] PM: hibernation: Registered nosave memory: [mem 0x0009e000-0x000fffff]
[    0.046461] PM: hibernation: Registered nosave memory: [mem 0x2bd33000-0x2bd33fff]
[    0.046462] PM: hibernation: Registered nosave memory: [mem 0x2bd34000-0x2bd34fff]
[    0.046463] PM: hibernation: Registered nosave memory: [mem 0x39d10000-0x39d83fff]
[    0.046464] PM: hibernation: Registered nosave memory: [mem 0x3d384000-0x3d743fff]
[    0.046465] PM: hibernation: Registered nosave memory: [mem 0x3d744000-0x3d7b4fff]
[    0.046465] PM: hibernation: Registered nosave memory: [mem 0x3d7b5000-0x3de6cfff]
[    0.046466] PM: hibernation: Registered nosave memory: [mem 0x3de6d000-0x3ff25fff]
[    0.046466] PM: hibernation: Registered nosave memory: [mem 0x3ff26000-0x3fffefff]
[    0.046468] PM: hibernation: Registered nosave memory: [mem 0x40000000-0x47ffffff]
[    0.046469] PM: hibernation: Registered nosave memory: [mem 0x48e00000-0x4f7fffff]
[    0.046469] PM: hibernation: Registered nosave memory: [mem 0x4f800000-0xdfffffff]
[    0.046470] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0xefffffff]
[    0.046471] PM: hibernation: Registered nosave memory: [mem 0xf0000000-0xfdffffff]
[    0.046471] PM: hibernation: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
[    0.046472] PM: hibernation: Registered nosave memory: [mem 0xfe011000-0xfebfffff]
[    0.046472] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.046473] PM: hibernation: Registered nosave memory: [mem 0xfec01000-0xfedfffff]
[    0.046473] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.046474] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0xfeffffff]
[    0.046475] PM: hibernation: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.046476] [mem 0x4f800000-0xdfffffff] available for PCI devices
[    0.046477] Booting paravirtualized kernel on bare hardware
[    0.046479] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.046485] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
[    0.046615] percpu: Embedded 57 pages/cpu s196608 r8192 d28672 u262144
[    0.046621] pcpu-alloc: s196608 r8192 d28672 u262144 alloc=1*2097152
[    0.046621] pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
[    0.046641] Built 1 zonelists, mobility grouping on.  Total pages: 4050402
[    0.046642] Policy zone: Normal
[    0.046643] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-5.7-rc3 root=UUID=e9880a1b-a4f2-4779-8a98-6c1bee968ebe rw sysrq_always_enabled audit=0 pcie_ports=native pci=assign-busses,hpbussize=0x33,hpmemsize=16K,hpiosize=0,hpmmiosize=400M,hpmmioprefsize=64G,nocrs,realloc intel_iommu=on iommu=on amdgpu.runpm=1
[    0.046684] sysrq: sysrq always enabled.
[    0.046693] audit: disabled (until reboot)
[    0.046733] DMAR: IOMMU enabled
[    0.047359] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.047651] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.047711] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.078443] Memory: 16014028K/16458876K available (14339K kernel code, 2527K rwdata, 5020K rodata, 2592K init, 4980K bss, 444848K reserved, 0K cma-reserved)
[    0.078450] random: get_random_u64 called from __kmem_cache_create+0x42/0x540 with crng_init=0
[    0.078538] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.078547] Kernel/User page tables isolation: enabled
[    0.078562] ftrace: allocating 45079 entries in 177 pages
[    0.091876] ftrace: allocated 177 pages with 4 groups
[    0.091961] rcu: Hierarchical RCU implementation.
[    0.091963] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=8.
[    0.091963] 	Tasks RCU enabled.
[    0.091964] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.091965] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.094691] NR_IRQS: 524544, nr_irqs: 2048, preallocated irqs: 16
[    0.094956] random: crng done (trusting CPU's manufacturer)
[    0.094988] spurious 8259A interrupt: IRQ7.
[    0.095011] Console: colour dummy device 80x25
[    0.095195] printk: console [tty0] enabled
[    0.095208] ACPI: Core revision 20200326
[    0.095497] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
[    0.095600] APIC: Switch to symmetric I/O mode setup
[    0.095603] DMAR: Host address width 39
[    0.095604] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.095609] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 19e2ff0505e
[    0.095611] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.095615] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
[    0.095617] DMAR: RMRR base: 0x0000003d45e000 end: 0x0000003d47dfff
[    0.095619] DMAR: RMRR base: 0x0000004b000000 end: 0x0000004f7fffff
[    0.095621] DMAR: ANDD device: 1 name: \_SB.PCI0.I2C0
[    0.095622] DMAR: ANDD device: 2 name: \_SB.PCI0.I2C1
[    0.095624] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.095626] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.095627] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    0.097124] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.097126] x2apic enabled
[    0.097137] Switched APIC routing to cluster x2apic.
[    0.101110] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.119676] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x1e44fb6c2ab, max_idle_ns: 440795206594 ns
[    0.119681] Calibrating delay loop (skipped), value calculated using timer frequency.. 4199.88 BogoMIPS (lpj=8399776)
[    0.119684] pid_max: default: 32768 minimum: 301
[    0.121574] LSM: Security Framework initializing
[    0.121582] Yama: becoming mindful.
[    0.121602] AppArmor: AppArmor initialized
[    0.121644] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.121674] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.121868] mce: CPU0: Thermal monitoring enabled (TM1)
[    0.121886] process: using mwait in idle threads
[    0.121888] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.121890] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.121892] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.121895] Spectre V2 : Mitigation: Full generic retpoline
[    0.121896] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.121898] Spectre V2 : Enabling Restricted Speculation for firmware calls
[    0.121900] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.121902] Spectre V2 : User space: Mitigation: STIBP via seccomp and prctl
[    0.121904] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[    0.121908] TAA: Mitigation: Clear CPU buffers
[    0.121909] MDS: Mitigation: Clear CPU buffers
[    0.122095] Freeing SMP alternatives memory: 40K
[    0.123738] TSC deadline timer enabled
[    0.123743] smpboot: CPU0: Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz (family: 0x6, model: 0x8e, stepping: 0xa)
[    0.123823] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.123830] ... version:                4
[    0.123831] ... bit width:              48
[    0.123832] ... generic registers:      4
[    0.123833] ... value mask:             0000ffffffffffff
[    0.123835] ... max period:             00007fffffffffff
[    0.123836] ... fixed-purpose events:   3
[    0.123837] ... event mask:             000000070000000f
[    0.123869] rcu: Hierarchical SRCU implementation.
[    0.124680] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.124737] smp: Bringing up secondary CPUs ...
[    0.124799] x86: Booting SMP configuration:
[    0.124801] .... node  #0, CPUs:      #1 #2 #3 #4
[    0.128379] MDS CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more details.
[    0.128379] TAA CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/tsx_async_abort.html for more details.
[    0.128379]  #5 #6 #7
[    0.128600] smp: Brought up 1 node, 8 CPUs
[    0.128600] smpboot: Max logical packages: 1
[    0.128600] smpboot: Total of 8 processors activated (33599.10 BogoMIPS)
[    0.132030] devtmpfs: initialized
[    0.132030] x86/mm: Memory block size: 128MB
[    0.132857] PM: Registering ACPI NVS region [mem 0x2bd33000-0x2bd33fff] (4096 bytes)
[    0.132857] PM: Registering ACPI NVS region [mem 0x3d7b5000-0x3de6cfff] (7045120 bytes)
[    0.132857] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.132857] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.132857] pinctrl core: initialized pinctrl subsystem
[    0.132857] PM: RTC time: 17:06:18, date: 2020-04-27
[    0.132857] thermal_sys: Registered thermal governor 'fair_share'
[    0.132857] thermal_sys: Registered thermal governor 'bang_bang'
[    0.132857] thermal_sys: Registered thermal governor 'step_wise'
[    0.132857] thermal_sys: Registered thermal governor 'user_space'
[    0.132857] NET: Registered protocol family 16
[    0.132857] EISA bus registered
[    0.132857] cpuidle: using governor ladder
[    0.132857] cpuidle: using governor menu
[    0.132857] Simple Boot Flag at 0x47 set to 0x80
[    0.132857] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.132857] ACPI: bus type PCI registered
[    0.132857] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.132857] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.132857] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.132857] PCI: Using configuration type 1 for base access
[    0.132857] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.136067] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.136067] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.136067] fbcon: Taking over console
[    0.136067] ACPI: Added _OSI(Module Device)
[    0.136067] ACPI: Added _OSI(Processor Device)
[    0.136067] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.136067] ACPI: Added _OSI(Processor Aggregator Device)
[    0.136067] ACPI: Added _OSI(Linux-Dell-Video)
[    0.136067] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.136067] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.174916] ACPI: 11 ACPI AML tables successfully acquired and loaded
[    0.239141] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.249013] ACPI: Dynamic OEM Table Load:
[    0.249024] ACPI: SSDT 0xFFFF8ECADBB4D000 0005EE (v02 PmRef  Cpu0Ist  00003000 INTL 20160422)
[    0.251271] ACPI: \_PR_.PR00: _OSC native thermal LVT Acked
[    0.252688] ACPI: Dynamic OEM Table Load:
[    0.252696] ACPI: SSDT 0xFFFF8ECADB884C00 0003FF (v02 PmRef  Cpu0Cst  00003001 INTL 20160422)
[    0.254571] ACPI: Dynamic OEM Table Load:
[    0.254577] ACPI: SSDT 0xFFFF8ECADB896240 0000BA (v02 PmRef  Cpu0Hwp  00003000 INTL 20160422)
[    0.256272] ACPI: Dynamic OEM Table Load:
[    0.256278] ACPI: SSDT 0xFFFF8ECADBB4C000 000628 (v02 PmRef  HwpLvt   00003000 INTL 20160422)
[    0.258238] ACPI: Dynamic OEM Table Load:
[    0.258247] ACPI: SSDT 0xFFFF8ECADBC2B000 000D14 (v02 PmRef  ApIst    00003000 INTL 20160422)
[    0.260668] ACPI: Dynamic OEM Table Load:
[    0.260674] ACPI: SSDT 0xFFFF8ECADB887400 000317 (v02 PmRef  ApHwp    00003000 INTL 20160422)
[    0.262134] ACPI: Dynamic OEM Table Load:
[    0.262139] ACPI: SSDT 0xFFFF8ECADB881C00 00030A (v02 PmRef  ApCst    00003000 INTL 20160422)
[    0.266177] ACPI: EC: EC started
[    0.266179] ACPI: EC: interrupt blocked
[    0.274578] ACPI: EC: EC_CMD/EC_SC=0x934, EC_DATA=0x930
[    0.274580] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC used to handle transactions
[    0.274582] ACPI: Interpreter enabled
[    0.274619] ACPI: (supports S0 S3 S4 S5)
[    0.274621] ACPI: Using IOAPIC for interrupt routing
[    0.274653] PCI: Ignoring host bridge windows from ACPI; if necessary, use "pci=use_crs" and report a bug
[    0.275257] ACPI: Enabled 8 GPEs in block 00 to 7F
[    0.282058] ACPI: Power Resource [WRST] (on)
[    0.302650] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.302656] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.303002] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug SHPCHotplug PME AER]
[    0.303331] acpi PNP0A08:00: _OSC: OS now controls [PCIeCapability LTR]
[    0.303333] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.303618] acpi PNP0A08:00: host bridge window [io  0x0000-0x0cf7 window] (ignored)
[    0.303619] acpi PNP0A08:00: host bridge window [io  0x0cf8-0x0cff] (ignored)
[    0.303620] acpi PNP0A08:00: host bridge window [io  0x0d00-0xffff window] (ignored)
[    0.303621] acpi PNP0A08:00: host bridge window [mem 0x000a0000-0x000bffff window] (ignored)
[    0.303621] acpi PNP0A08:00: host bridge window [mem 0x000c0000-0x000c3fff window] (ignored)
[    0.303622] acpi PNP0A08:00: host bridge window [mem 0x000c4000-0x000c7fff window] (ignored)
[    0.303622] acpi PNP0A08:00: host bridge window [mem 0x000c8000-0x000cbfff window] (ignored)
[    0.303623] acpi PNP0A08:00: host bridge window [mem 0x000cc000-0x000cffff window] (ignored)
[    0.303624] acpi PNP0A08:00: host bridge window [mem 0x000d0000-0x000d3fff window] (ignored)
[    0.303624] acpi PNP0A08:00: host bridge window [mem 0x000d4000-0x000d7fff window] (ignored)
[    0.303625] acpi PNP0A08:00: host bridge window [mem 0x000d8000-0x000dbfff window] (ignored)
[    0.303626] acpi PNP0A08:00: host bridge window [mem 0x000dc000-0x000dffff window] (ignored)
[    0.303626] acpi PNP0A08:00: host bridge window [mem 0x4f800000-0xdfffffff window] (ignored)
[    0.303627] acpi PNP0A08:00: host bridge window [mem 0xfd000000-0xfe7fffff window] (ignored)
[    0.303627] PCI: root bus 00: using default resources
[    0.303987] PCI host bridge to bus 0000:00
[    0.303990] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    0.303991] pci_bus 0000:00: root bus resource [mem 0x00000000-0x7fffffffff]
[    0.303993] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.304002] pci 0000:00:00.0: [8086:5914] type 00 class 0x060000
[    0.304113] pci 0000:00:02.0: [8086:5917] type 00 class 0x030000
[    0.304122] pci 0000:00:02.0: reg 0x10: [mem 0xdb000000-0xdbffffff 64bit]
[    0.304128] pci 0000:00:02.0: reg 0x18: [mem 0x50000000-0x5fffffff 64bit pref]
[    0.304132] pci 0000:00:02.0: reg 0x20: [io  0xf000-0xf03f]
[    0.304144] pci 0000:00:02.0: BAR 2: assigned to efifb
[    0.304267] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000
[    0.304278] pci 0000:00:04.0: reg 0x10: [mem 0xdc320000-0xdc327fff 64bit]
[    0.304476] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
[    0.304497] pci 0000:00:14.0: reg 0x10: [mem 0xdc310000-0xdc31ffff 64bit]
[    0.304554] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.304753] pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
[    0.304774] pci 0000:00:14.2: reg 0x10: [mem 0xdc335000-0xdc335fff 64bit]
[    0.305003] pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000
[    0.305049] pci 0000:00:15.0: reg 0x10: [mem 0xdc334000-0xdc334fff 64bit]
[    0.305315] pci 0000:00:15.1: [8086:9d61] type 00 class 0x118000
[    0.305361] pci 0000:00:15.1: reg 0x10: [mem 0xdc333000-0xdc333fff 64bit]
[    0.305611] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
[    0.305627] pci 0000:00:16.0: reg 0x10: [mem 0xdc332000-0xdc332fff 64bit]
[    0.305673] pci 0000:00:16.0: PME# supported from D3hot
[    0.305816] pci 0000:00:16.3: [8086:9d3d] type 00 class 0x070002
[    0.305829] pci 0000:00:16.3: reg 0x10: [io  0xf060-0xf067]
[    0.305834] pci 0000:00:16.3: reg 0x14: [mem 0xdc331000-0xdc331fff]
[    0.305996] pci 0000:00:1c.0: [8086:9d10] type 01 class 0x060400
[    0.306063] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.306092] pci 0000:00:1c.0: Intel SPT PCH root port ACS workaround enabled
[    0.306263] pci 0000:00:1c.2: [8086:9d12] type 01 class 0x060400
[    0.306330] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.306346] pci 0000:00:1c.2: Intel SPT PCH root port ACS workaround enabled
[    0.306512] pci 0000:00:1c.4: [8086:9d14] type 01 class 0x060400
[    0.306634] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.306649] pci 0000:00:1c.4: Intel SPT PCH root port ACS workaround enabled
[    0.306826] pci 0000:00:1d.0: [8086:9d18] type 01 class 0x060400
[    0.306894] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.306908] pci 0000:00:1d.0: Intel SPT PCH root port ACS workaround enabled
[    0.307095] pci 0000:00:1f.0: [8086:9d4e] type 00 class 0x060100
[    0.307285] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
[    0.307298] pci 0000:00:1f.2: reg 0x10: [mem 0xdc32c000-0xdc32ffff]
[    0.307452] pci 0000:00:1f.3: [8086:9d71] type 00 class 0x040380
[    0.307476] pci 0000:00:1f.3: reg 0x10: [mem 0xdc328000-0xdc32bfff 64bit]
[    0.307500] pci 0000:00:1f.3: reg 0x20: [mem 0xdc300000-0xdc30ffff 64bit]
[    0.307542] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.307756] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500
[    0.307818] pci 0000:00:1f.4: reg 0x10: [mem 0xdc330000-0xdc3300ff 64bit]
[    0.307890] pci 0000:00:1f.4: reg 0x20: [io  0xf040-0xf05f]
[    0.308191] pci 0000:01:00.0: [10ec:525a] type 00 class 0xff0000
[    0.308221] pci 0000:01:00.0: reg 0x14: [mem 0xdc200000-0xdc200fff]
[    0.308316] pci 0000:01:00.0: supports D1 D2
[    0.308318] pci 0000:01:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.308448] pci 0000:00:1c.0: PCI bridge to [bus 01-fe]
[    0.308452] pci 0000:00:1c.0:   bridge window [mem 0xdc200000-0xdc2fffff]
[    0.308457] pci_bus 0000:01: busn_res: [bus 01-fe] end is updated to 01
[    0.308833] pci 0000:02:00.0: [8086:24fd] type 00 class 0x028000
[    0.308930] pci 0000:02:00.0: reg 0x10: [mem 0xdc100000-0xdc101fff 64bit]
[    0.309189] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.309876] pci 0000:00:1c.2: PCI bridge to [bus 02-fe]
[    0.309880] pci 0000:00:1c.2:   bridge window [mem 0xdc100000-0xdc1fffff]
[    0.309885] pci_bus 0000:02: busn_res: [bus 02-fe] end is updated to 02
[    0.309978] pci 0000:03:00.0: [8086:15d3] type 01 class 0x060400
[    0.310033] pci 0000:03:00.0: enabling Extended Tags
[    0.310105] pci 0000:03:00.0: supports D1 D2
[    0.310107] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.310234] pci 0000:00:1c.4: PCI bridge to [bus 03-fe]
[    0.310238] pci 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0fffff]
[    0.310243] pci 0000:00:1c.4:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[    0.310321] pci 0000:04:00.0: [8086:15d3] type 01 class 0x060400
[    0.310382] pci 0000:04:00.0: enabling Extended Tags
[    0.310457] pci 0000:04:00.0: supports D1 D2
[    0.310459] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.310562] pci 0000:04:01.0: [8086:15d3] type 01 class 0x060400
[    0.310619] pci 0000:04:01.0: enabling Extended Tags
[    0.310695] pci 0000:04:01.0: supports D1 D2
[    0.310696] pci 0000:04:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.310813] pci 0000:04:02.0: [8086:15d3] type 01 class 0x060400
[    0.310872] pci 0000:04:02.0: enabling Extended Tags
[    0.310946] pci 0000:04:02.0: supports D1 D2
[    0.310948] pci 0000:04:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.311055] pci 0000:04:04.0: [8086:15d3] type 01 class 0x060400
[    0.311112] pci 0000:04:04.0: enabling Extended Tags
[    0.311190] pci 0000:04:04.0: supports D1 D2
[    0.311191] pci 0000:04:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.311303] pci 0000:03:00.0: PCI bridge to [bus 04-fe]
[    0.311311] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xac1fffff]
[    0.311406] pci 0000:05:00.0: [8086:15d2] type 00 class 0x088000
[    0.311434] pci 0000:05:00.0: reg 0x10: [mem 0xac100000-0xac13ffff]
[    0.311443] pci 0000:05:00.0: reg 0x14: [mem 0xac140000-0xac140fff]
[    0.311485] pci 0000:05:00.0: enabling Extended Tags
[    0.311580] pci 0000:05:00.0: supports D1 D2
[    0.311581] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.311737] pci 0000:04:00.0: PCI bridge to [bus 05-fe]
[    0.311745] pci 0000:04:00.0:   bridge window [mem 0xac100000-0xac1fffff]
[    0.311751] pci_bus 0000:05: busn_res: [bus 05-fe] end is updated to 05
[    0.311797] pci 0000:04:01.0: PCI bridge to [bus 06-fe]
[    0.311809] pci_bus 0000:06: busn_res: [bus 06-fe] end is updated to 38
[    0.311875] pci 0000:39:00.0: [8086:15d4] type 00 class 0x0c0330
[    0.311909] pci 0000:39:00.0: reg 0x10: [mem 0xac000000-0xac00ffff]
[    0.311982] pci 0000:39:00.0: enabling Extended Tags
[    0.312081] pci 0000:39:00.0: supports D1 D2
[    0.312083] pci 0000:39:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.312182] pci 0000:39:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:04:02.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
[    0.312269] pci 0000:04:02.0: PCI bridge to [bus 39-fe]
[    0.312277] pci 0000:04:02.0:   bridge window [mem 0xac000000-0xac0fffff]
[    0.312283] pci_bus 0000:39: busn_res: [bus 39-fe] end is updated to 39
[    0.312327] pci 0000:04:04.0: PCI bridge to [bus 3a-fe]
[    0.312339] pci_bus 0000:3a: busn_res: [bus 3a-fe] end is updated to 6c
[    0.312343] pci_bus 0000:04: busn_res: [bus 04-fe] end is updated to 6c
[    0.312347] pci_bus 0000:03: busn_res: [bus 03-fe] end is updated to 6c
[    0.312435] pci 0000:6d:00.0: [1179:0116] type 00 class 0x010802
[    0.312462] pci 0000:6d:00.0: reg 0x10: [mem 0xdc000000-0xdc003fff 64bit]
[    0.312670] pci 0000:00:1d.0: PCI bridge to [bus 6d-fe]
[    0.312674] pci 0000:00:1d.0:   bridge window [mem 0xdc000000-0xdc0fffff]
[    0.312679] pci_bus 0000:6d: busn_res: [bus 6d-fe] end is updated to 6d
[    0.314321] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.314376] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 15)
[    0.314427] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.314479] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.314530] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.314581] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.314632] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.314683] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.327892] ACPI: EC: interrupt unblocked
[    0.327894] ACPI: EC: event unblocked
[    0.327901] ACPI: EC: EC_CMD/EC_SC=0x934, EC_DATA=0x930
[    0.327902] ACPI: EC: GPE=0x6e
[    0.327904] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC initialization complete
[    0.327906] ACPI: \_SB_.PCI0.LPCB.ECDV: EC: Used to handle transactions and events
[    0.327975] iommu: Default domain type: Translated 
[    0.327975] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.327975] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.327975] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.327975] vgaarb: loaded
[    0.327975] SCSI subsystem initialized
[    0.327975] libata version 3.00 loaded.
[    0.327975] ACPI: bus type USB registered
[    0.327975] usbcore: registered new interface driver usbfs
[    0.327975] usbcore: registered new interface driver hub
[    0.327975] usbcore: registered new device driver usb
[    0.327975] pps_core: LinuxPPS API ver. 1 registered
[    0.327975] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.327975] PTP clock support registered
[    0.327975] EDAC MC: Ver: 3.0.0
[    0.328170] Registered efivars operations
[    0.328170] PCI: Using ACPI for IRQ routing
[    0.348666] PCI: pci_cache_line_size set to 64 bytes
[    0.349325] e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]
[    0.349326] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
[    0.349326] e820: reserve RAM buffer [mem 0x2bd33000-0x2bffffff]
[    0.349327] e820: reserve RAM buffer [mem 0x39d10000-0x3bffffff]
[    0.349327] e820: reserve RAM buffer [mem 0x3d384000-0x3fffffff]
[    0.349328] e820: reserve RAM buffer [mem 0x48e00000-0x4bffffff]
[    0.349329] e820: reserve RAM buffer [mem 0x4ae800000-0x4afffffff]
[    0.349406] NetLabel: Initializing
[    0.349408] NetLabel:  domain hash size = 128
[    0.349409] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.349419] NetLabel:  unlabeled traffic allowed by default
[    0.352245] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.352249] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    0.352249] clocksource: Switched to clocksource tsc-early
[    0.360871] VFS: Disk quotas dquot_6.6.0
[    0.360886] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.360960] AppArmor: AppArmor Filesystem Enabled
[    0.360985] pnp: PnP ACPI init
[    0.361265] system 00:00: [io  0x0680-0x069f] has been reserved
[    0.361268] system 00:00: [io  0xffff] has been reserved
[    0.361269] system 00:00: [io  0xffff] has been reserved
[    0.361271] system 00:00: [io  0xffff] has been reserved
[    0.361273] system 00:00: [io  0x1800-0x18fe] has been reserved
[    0.361275] system 00:00: [io  0x164e-0x164f] has been reserved
[    0.361279] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.361367] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.361399] system 00:02: [io  0x1854-0x1857] has been reserved
[    0.361403] system 00:02: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
[    0.361517] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.361529] pnp 00:04: Plug and Play ACPI device, IDs DLL07e6 PNP0f13 (active)
[    0.361751] system 00:05: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.361753] system 00:05: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.361755] system 00:05: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.361757] system 00:05: [mem 0xe0000000-0xefffffff] has been reserved
[    0.361759] system 00:05: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.361761] system 00:05: [mem 0xfed90000-0xfed93fff] could not be reserved
[    0.361763] system 00:05: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.361765] system 00:05: [mem 0xff000000-0xffffffff] has been reserved
[    0.361766] system 00:05: [mem 0xfee00000-0xfeefffff] could not be reserved
[    0.361768] system 00:05: [mem 0xdffe0000-0xdfffffff] has been reserved
[    0.361772] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.361809] system 00:06: [mem 0xfd000000-0xfdabffff] has been reserved
[    0.361812] system 00:06: [mem 0xfdad0000-0xfdadffff] has been reserved
[    0.361813] system 00:06: [mem 0xfdb00000-0xfdffffff] has been reserved
[    0.361815] system 00:06: [mem 0xfe000000-0xfe01ffff] could not be reserved
[    0.361817] system 00:06: [mem 0xfe036000-0xfe03bfff] has been reserved
[    0.361819] system 00:06: [mem 0xfe03d000-0xfe3fffff] has been reserved
[    0.361821] system 00:06: [mem 0xfe410000-0xfe7fffff] has been reserved
[    0.361824] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.362087] system 00:07: [io  0xff00-0xfffe] has been reserved
[    0.362090] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.363117] system 00:08: [mem 0xfe029000-0xfe029fff] has been reserved
[    0.363120] system 00:08: [mem 0xfe028000-0xfe028fff] has been reserved
[    0.363123] system 00:08: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.366985] pnp: PnP ACPI: found 9 devices
[    0.372263] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.372285] pci_bus 0000:00: max bus depth: 3 pci_try_num: 4
[    0.372292] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.372297] pci 0000:00:1c.0:   bridge window [mem 0xdc200000-0xdc2fffff]
[    0.372315] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    0.372319] pci 0000:00:1c.2:   bridge window [mem 0xdc100000-0xdc1fffff]
[    0.372327] pci 0000:03:00.0: BAR 15: no space for [mem size 0x2000000000 64bit pref]
[    0.372329] pci 0000:03:00.0: BAR 15: failed to assign [mem size 0x2000000000 64bit pref]
[    0.372333] pci 0000:04:01.0: BAR 14: no space for [mem size 0x19000000]
[    0.372334] pci 0000:04:01.0: BAR 14: failed to assign [mem size 0x19000000]
[    0.372336] pci 0000:04:01.0: BAR 15: no space for [mem size 0x1000000000 64bit pref]
[    0.372338] pci 0000:04:01.0: BAR 15: failed to assign [mem size 0x1000000000 64bit pref]
[    0.372341] pci 0000:04:04.0: BAR 14: no space for [mem size 0x19000000]
[    0.372342] pci 0000:04:04.0: BAR 14: failed to assign [mem size 0x19000000]
[    0.372344] pci 0000:04:04.0: BAR 15: no space for [mem size 0x1000000000 64bit pref]
[    0.372346] pci 0000:04:04.0: BAR 15: failed to assign [mem size 0x1000000000 64bit pref]
[    0.372348] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.372353] pci 0000:04:00.0:   bridge window [mem 0xac100000-0xac1fffff]
[    0.372362] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[    0.372373] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.372378] pci 0000:04:02.0:   bridge window [mem 0xac000000-0xac0fffff]
[    0.372386] pci 0000:04:04.0: PCI bridge to [bus 3a-6c]
[    0.372398] pci 0000:03:00.0: PCI bridge to [bus 04-6c]
[    0.372403] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xac1fffff]
[    0.372411] pci 0000:00:1c.4: PCI bridge to [bus 03-6c]
[    0.372414] pci 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0fffff]
[    0.372417] pci 0000:00:1c.4:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[    0.372421] pci 0000:00:1d.0: PCI bridge to [bus 6d]
[    0.372425] pci 0000:00:1d.0:   bridge window [mem 0xdc000000-0xdc0fffff]
[    0.372431] pci_bus 0000:00: No. 2 try to assign unassigned res
[    0.372435] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.372439] pci 0000:00:1c.0:   bridge window [mem 0xdc200000-0xdc2fffff]
[    0.372444] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    0.372448] pci 0000:00:1c.2:   bridge window [mem 0xdc100000-0xdc1fffff]
[    0.372454] pci 0000:03:00.0: BAR 15: no space for [mem size 0x2000000000 64bit pref]
[    0.372456] pci 0000:03:00.0: BAR 15: failed to assign [mem size 0x2000000000 64bit pref]
[    0.372459] pci 0000:04:01.0: BAR 14: no space for [mem size 0x19000000]
[    0.372460] pci 0000:04:01.0: BAR 14: failed to assign [mem size 0x19000000]
[    0.372462] pci 0000:04:01.0: BAR 15: no space for [mem size 0x1000000000 64bit pref]
[    0.372464] pci 0000:04:01.0: BAR 15: failed to assign [mem size 0x1000000000 64bit pref]
[    0.372466] pci 0000:04:04.0: BAR 14: no space for [mem size 0x19000000]
[    0.372468] pci 0000:04:04.0: BAR 14: failed to assign [mem size 0x19000000]
[    0.372470] pci 0000:04:04.0: BAR 15: no space for [mem size 0x1000000000 64bit pref]
[    0.372472] pci 0000:04:04.0: BAR 15: failed to assign [mem size 0x1000000000 64bit pref]
[    0.372474] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.372479] pci 0000:04:00.0:   bridge window [mem 0xac100000-0xac1fffff]
[    0.372487] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[    0.372499] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.372503] pci 0000:04:02.0:   bridge window [mem 0xac000000-0xac0fffff]
[    0.372512] pci 0000:04:04.0: PCI bridge to [bus 3a-6c]
[    0.372523] pci 0000:03:00.0: PCI bridge to [bus 04-6c]
[    0.372528] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xac1fffff]
[    0.372536] pci 0000:00:1c.4: PCI bridge to [bus 03-6c]
[    0.372540] pci 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0fffff]
[    0.372542] pci 0000:00:1c.4:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[    0.372547] pci 0000:00:1d.0: PCI bridge to [bus 6d]
[    0.372550] pci 0000:00:1d.0:   bridge window [mem 0xdc000000-0xdc0fffff]
[    0.372556] pci_bus 0000:00: No. 3 try to assign unassigned res
[    0.372557] release child resource [mem 0xac100000-0xac13ffff]
[    0.372558] release child resource [mem 0xac140000-0xac140fff]
[    0.372559] pci 0000:04:00.0: resource 14 [mem 0xac100000-0xac1fffff] released
[    0.372560] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.372564] release child resource [mem 0xac000000-0xac00ffff]
[    0.372565] pci 0000:04:02.0: resource 14 [mem 0xac000000-0xac0fffff] released
[    0.372567] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.372570] pci 0000:03:00.0: resource 14 [mem 0xac000000-0xac1fffff] released
[    0.372572] pci 0000:03:00.0: PCI bridge to [bus 04-6c]
[    0.372577] pci 0000:00:1c.4: resource 15 [mem 0x60000000-0xa9ffffff 64bit pref] released
[    0.372578] pci 0000:00:1c.4: PCI bridge to [bus 03-6c]
[    0.372589] pci 0000:00:1c.4: BAR 15: assigned [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.372591] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.372595] pci 0000:00:1c.0:   bridge window [mem 0xdc200000-0xdc2fffff]
[    0.372600] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    0.372604] pci 0000:00:1c.2:   bridge window [mem 0xdc100000-0xdc1fffff]
[    0.372609] pci 0000:03:00.0: BAR 14: no space for [mem size 0x32200000]
[    0.372611] pci 0000:03:00.0: BAR 14: failed to assign [mem size 0x32200000]
[    0.372613] pci 0000:03:00.0: BAR 15: assigned [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.372616] pci 0000:04:00.0: BAR 14: no space for [mem size 0x00100000]
[    0.372618] pci 0000:04:00.0: BAR 14: failed to assign [mem size 0x00100000]
[    0.372619] pci 0000:04:01.0: BAR 14: no space for [mem size 0x19000000]
[    0.372621] pci 0000:04:01.0: BAR 14: failed to assign [mem size 0x19000000]
[    0.372623] pci 0000:04:01.0: BAR 15: assigned [mem 0x4b0000000-0x14afffffff 64bit pref]
[    0.372625] pci 0000:04:02.0: BAR 14: no space for [mem size 0x00100000]
[    0.372627] pci 0000:04:02.0: BAR 14: failed to assign [mem size 0x00100000]
[    0.372629] pci 0000:04:04.0: BAR 14: no space for [mem size 0x19000000]
[    0.372630] pci 0000:04:04.0: BAR 14: failed to assign [mem size 0x19000000]
[    0.372632] pci 0000:04:04.0: BAR 15: assigned [mem 0x14b0000000-0x24afffffff 64bit pref]
[    0.372635] pci 0000:05:00.0: BAR 0: no space for [mem size 0x00040000]
[    0.372637] pci 0000:05:00.0: BAR 0: failed to assign [mem size 0x00040000]
[    0.372638] pci 0000:05:00.0: BAR 1: no space for [mem size 0x00001000]
[    0.372640] pci 0000:05:00.0: BAR 1: failed to assign [mem size 0x00001000]
[    0.372642] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.372653] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[    0.372660] pci 0000:04:01.0:   bridge window [mem 0x4b0000000-0x14afffffff 64bit pref]
[    0.372667] pci 0000:39:00.0: BAR 0: no space for [mem size 0x00010000]
[    0.372669] pci 0000:39:00.0: BAR 0: failed to assign [mem size 0x00010000]
[    0.372670] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.372682] pci 0000:04:04.0: PCI bridge to [bus 3a-6c]
[    0.372689] pci 0000:04:04.0:   bridge window [mem 0x14b0000000-0x24afffffff 64bit pref]
[    0.372695] pci 0000:03:00.0: PCI bridge to [bus 04-6c]
[    0.372702] pci 0000:03:00.0:   bridge window [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.372708] pci 0000:00:1c.4: PCI bridge to [bus 03-6c]
[    0.372712] pci 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0fffff]
[    0.372715] pci 0000:00:1c.4:   bridge window [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.372719] pci 0000:00:1d.0: PCI bridge to [bus 6d]
[    0.372723] pci 0000:00:1d.0:   bridge window [mem 0xdc000000-0xdc0fffff]
[    0.372728] pci_bus 0000:00: No. 4 try to assign unassigned res
[    0.372730] pci 0000:00:1c.4: resource 14 [mem 0xac000000-0xda0fffff] released
[    0.372732] pci 0000:00:1c.4: PCI bridge to [bus 03-6c]
[    0.372738] pci 0000:00:1c.4: BAR 14: assigned [mem 0x60000000-0x921fffff]
[    0.372740] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.372744] pci 0000:00:1c.0:   bridge window [mem 0xdc200000-0xdc2fffff]
[    0.372749] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    0.372753] pci 0000:00:1c.2:   bridge window [mem 0xdc100000-0xdc1fffff]
[    0.372759] pci 0000:03:00.0: BAR 14: assigned [mem 0x60000000-0x921fffff]
[    0.372761] pci 0000:04:00.0: BAR 14: assigned [mem 0x60000000-0x600fffff]
[    0.372763] pci 0000:04:01.0: BAR 14: assigned [mem 0x60100000-0x790fffff]
[    0.372765] pci 0000:04:02.0: BAR 14: assigned [mem 0x79100000-0x791fffff]
[    0.372767] pci 0000:04:04.0: BAR 14: assigned [mem 0x79200000-0x921fffff]
[    0.372769] pci 0000:05:00.0: BAR 0: assigned [mem 0x60000000-0x6003ffff]
[    0.372774] pci 0000:05:00.0: BAR 1: assigned [mem 0x60040000-0x60040fff]
[    0.372778] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.372783] pci 0000:04:00.0:   bridge window [mem 0x60000000-0x600fffff]
[    0.372792] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[    0.372796] pci 0000:04:01.0:   bridge window [mem 0x60100000-0x790fffff]
[    0.372800] pci 0000:04:01.0:   bridge window [mem 0x4b0000000-0x14afffffff 64bit pref]
[    0.372807] pci 0000:39:00.0: BAR 0: assigned [mem 0x79100000-0x7910ffff]
[    0.372812] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.372816] pci 0000:04:02.0:   bridge window [mem 0x79100000-0x791fffff]
[    0.372825] pci 0000:04:04.0: PCI bridge to [bus 3a-6c]
[    0.372830] pci 0000:04:04.0:   bridge window [mem 0x79200000-0x921fffff]
[    0.372834] pci 0000:04:04.0:   bridge window [mem 0x14b0000000-0x24afffffff 64bit pref]
[    0.372840] pci 0000:03:00.0: PCI bridge to [bus 04-6c]
[    0.372845] pci 0000:03:00.0:   bridge window [mem 0x60000000-0x921fffff]
[    0.372849] pci 0000:03:00.0:   bridge window [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.372855] pci 0000:00:1c.4: PCI bridge to [bus 03-6c]
[    0.372858] pci 0000:00:1c.4:   bridge window [mem 0x60000000-0x921fffff]
[    0.372861] pci 0000:00:1c.4:   bridge window [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.372866] pci 0000:00:1d.0: PCI bridge to [bus 6d]
[    0.372869] pci 0000:00:1d.0:   bridge window [mem 0xdc000000-0xdc0fffff]
[    0.372875] pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
[    0.372877] pci_bus 0000:00: resource 5 [mem 0x00000000-0x7fffffffff]
[    0.372878] pci_bus 0000:01: resource 1 [mem 0xdc200000-0xdc2fffff]
[    0.372880] pci_bus 0000:02: resource 1 [mem 0xdc100000-0xdc1fffff]
[    0.372882] pci_bus 0000:03: resource 1 [mem 0x60000000-0x921fffff]
[    0.372884] pci_bus 0000:03: resource 2 [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.372886] pci_bus 0000:04: resource 1 [mem 0x60000000-0x921fffff]
[    0.372888] pci_bus 0000:04: resource 2 [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.372890] pci_bus 0000:05: resource 1 [mem 0x60000000-0x600fffff]
[    0.372891] pci_bus 0000:06: resource 1 [mem 0x60100000-0x790fffff]
[    0.372893] pci_bus 0000:06: resource 2 [mem 0x4b0000000-0x14afffffff 64bit pref]
[    0.372895] pci_bus 0000:39: resource 1 [mem 0x79100000-0x791fffff]
[    0.372897] pci_bus 0000:3a: resource 1 [mem 0x79200000-0x921fffff]
[    0.372898] pci_bus 0000:3a: resource 2 [mem 0x14b0000000-0x24afffffff 64bit pref]
[    0.372901] pci_bus 0000:6d: resource 1 [mem 0xdc000000-0xdc0fffff]
[    0.373045] NET: Registered protocol family 2
[    0.373161] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.373221] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.373349] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    0.373409] TCP: Hash tables configured (established 131072 bind 65536)
[    0.373481] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.373515] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.373560] NET: Registered protocol family 1
[    0.373564] NET: Registered protocol family 44
[    0.373572] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.374338] PCI: CLS 0 bytes, default 64
[    0.374364] Trying to unpack rootfs image as initramfs...
[    0.466897] Freeing initrd memory: 11628K
[    0.466932] DMAR: ACPI device "device:75" under DMAR at fed91000 as 00:15.0
[    0.466936] DMAR: ACPI device "device:76" under DMAR at fed91000 as 00:15.1
[    0.466947] DMAR: No ATSR found
[    0.466981] DMAR: dmar0: Using Queued invalidation
[    0.466985] DMAR: dmar1: Using Queued invalidation
[    0.467335] pci 0000:00:00.0: Adding to iommu group 0
[    0.472854] pci 0000:00:02.0: Adding to iommu group 1
[    0.472901] pci 0000:00:04.0: Adding to iommu group 2
[    0.472965] pci 0000:00:14.0: Adding to iommu group 3
[    0.472974] pci 0000:00:14.2: Adding to iommu group 3
[    0.473013] pci 0000:00:15.0: Adding to iommu group 4
[    0.473021] pci 0000:00:15.1: Adding to iommu group 4
[    0.473071] pci 0000:00:16.0: Adding to iommu group 5
[    0.473079] pci 0000:00:16.3: Adding to iommu group 5
[    0.473115] pci 0000:00:1c.0: Adding to iommu group 6
[    0.473165] pci 0000:00:1c.2: Adding to iommu group 7
[    0.473202] pci 0000:00:1c.4: Adding to iommu group 8
[    0.473249] pci 0000:00:1d.0: Adding to iommu group 9
[    0.474496] pci 0000:00:1f.0: Adding to iommu group 10
[    0.474506] pci 0000:00:1f.2: Adding to iommu group 10
[    0.474515] pci 0000:00:1f.3: Adding to iommu group 10
[    0.474523] pci 0000:00:1f.4: Adding to iommu group 10
[    0.474573] pci 0000:01:00.0: Adding to iommu group 11
[    0.474613] pci 0000:02:00.0: Adding to iommu group 12
[    0.474662] pci 0000:03:00.0: Adding to iommu group 13
[    0.474700] pci 0000:04:00.0: Adding to iommu group 14
[    0.474761] pci 0000:04:01.0: Adding to iommu group 15
[    0.474799] pci 0000:04:02.0: Adding to iommu group 16
[    0.474847] pci 0000:04:04.0: Adding to iommu group 17
[    0.474859] pci 0000:05:00.0: Adding to iommu group 14
[    0.474871] pci 0000:39:00.0: Adding to iommu group 16
[    0.474916] pci 0000:6d:00.0: Adding to iommu group 18
[    0.475117] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.476466] check: Scanning for low memory corruption every 60 seconds
[    0.477835] Initialise system trusted keyrings
[    0.477843] Key type blacklist registered
[    0.477865] workingset: timestamp_bits=36 max_order=22 bucket_order=0
[    0.478813] zbud: loaded
[    0.479015] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.479118] fuse: init (API version 7.31)
[    0.479221] integrity: Platform Keyring initialized
[    0.482302] Key type asymmetric registered
[    0.482305] Asymmetric key parser 'x509' registered
[    0.482311] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 244)
[    0.482347] io scheduler mq-deadline registered
[    0.482635] pcieport 0000:00:1c.0: PME: Signaling with IRQ 122
[    0.482672] pcieport 0000:00:1c.0: AER: enabled with IRQ 122
[    0.482833] pcieport 0000:00:1c.2: PME: Signaling with IRQ 123
[    0.482864] pcieport 0000:00:1c.2: AER: enabled with IRQ 123
[    0.482941] pcieport 0000:00:1c.4: PME: Signaling with IRQ 124
[    0.482985] pcieport 0000:00:1c.4: AER: enabled with IRQ 124
[    0.483000] pcieport 0000:00:1c.4: pciehp: Slot #8 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.483174] pcieport 0000:00:1d.0: PME: Signaling with IRQ 125
[    0.483207] pcieport 0000:00:1d.0: AER: enabled with IRQ 125
[    0.483603] pcieport 0000:04:01.0: pciehp: Slot #1 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.483912] pcieport 0000:04:04.0: pciehp: Slot #4 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.484035] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.484083] efifb: probing for efifb
[    0.484092] efifb: framebuffer at 0x50000000, using 3072k, total 3072k
[    0.484094] efifb: mode is 1024x768x32, linelength=4096, pages=1
[    0.484095] efifb: scrolling: redraw
[    0.484097] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.484160] Console: switching to colour frame buffer device 128x48
[    0.485190] fb0: EFI VGA frame buffer device
[    0.485208] intel_idle: MWAIT substates: 0x11142120
[    0.485209] intel_idle: v0.5.1 model 0x8E
[    0.485593] intel_idle: Local APIC timer is reliable in all C-states
[    0.487169] ACPI: AC Adapter [AC] (off-line)
[    0.487232] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
[    0.487273] ACPI: Lid Switch [LID0]
[    0.487301] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
[    0.487334] ACPI: Power Button [PBTN]
[    0.487361] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input2
[    0.487390] ACPI: Sleep Button [SBTN]
[    0.487418] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
[    0.487448] ACPI: Power Button [PWRF]
[    0.490046] thermal LNXTHERM:00: registered as thermal_zone0
[    0.490062] ACPI: Thermal Zone [THM] (25 C)
[    0.490236] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.491170] serial 0000:00:16.3: enabling device (0000 -> 0003)
[    0.512362] 0000:00:16.3: ttyS4 at I/O 0xf060 (irq = 19, base_baud = 115200) is a 16550A
[    0.513341] Linux agpgart interface v0.103
[    0.519082] battery: ACPI: Battery Slot [BAT0] (battery present)
[    0.544040] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0xFC, rev-id 1)
[    0.596350] loop: module loaded
[    0.596800] libphy: Fixed MDIO Bus: probed
[    0.596823] tun: Universal TUN/TAP device driver, 1.6
[    0.596918] PPP generic driver version 2.4.2
[    0.597083] VFIO - User Level meta-driver version: 0.3
[    0.598067] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.598960] ehci-pci: EHCI PCI platform driver
[    0.599866] ehci-platform: EHCI generic platform driver
[    0.600756] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.601636] ohci-pci: OHCI PCI platform driver
[    0.602527] ohci-platform: OHCI generic platform driver
[    0.603422] uhci_hcd: USB Universal Host Controller Interface driver
[    0.604597] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.605510] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[    0.607534] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000081109810
[    0.608733] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[    0.609842] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.07
[    0.610775] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.611717] usb usb1: Product: xHCI Host Controller
[    0.612647] usb usb1: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[    0.613565] usb usb1: SerialNumber: 0000:00:14.0
[    0.614631] hub 1-0:1.0: USB hub found
[    0.615536] hub 1-0:1.0: 12 ports detected
[    0.617708] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.618436] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[    0.619168] xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
[    0.619942] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.07
[    0.620690] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.621342] usb usb2: Product: xHCI Host Controller
[    0.621984] usb usb2: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[    0.622627] usb usb2: SerialNumber: 0000:00:14.0
[    0.623369] hub 2-0:1.0: USB hub found
[    0.624022] hub 2-0:1.0: 6 ports detected
[    0.624927] usb: port power management may be unreliable
[    0.625917] xhci_hcd 0000:39:00.0: xHCI Host Controller
[    0.626472] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bus number 3
[    0.628153] xhci_hcd 0000:39:00.0: hcc params 0x200077c1 hci version 0x110 quirks 0x0000000200009810
[    0.628876] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.07
[    0.629435] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.629983] usb usb3: Product: xHCI Host Controller
[    0.630539] usb usb3: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[    0.631064] usb usb3: SerialNumber: 0000:39:00.0
[    0.631658] hub 3-0:1.0: USB hub found
[    0.632165] hub 3-0:1.0: 2 ports detected
[    0.632960] xhci_hcd 0000:39:00.0: xHCI Host Controller
[    0.633449] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bus number 4
[    0.633939] xhci_hcd 0000:39:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[    0.634451] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.07
[    0.634942] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.635441] usb usb4: Product: xHCI Host Controller
[    0.635977] usb usb4: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[    0.636449] usb usb4: SerialNumber: 0000:39:00.0
[    0.636988] hub 4-0:1.0: USB hub found
[    0.637450] hub 4-0:1.0: 2 ports detected
[    0.638146] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
[    0.639004] i8042: Warning: Keylock active
[    0.640832] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.641273] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.641852] mousedev: PS/2 mouse device common for all mice
[    0.642591] rtc_cmos 00:01: RTC can wake from S4
[    0.643671] rtc_cmos 00:01: registered as rtc0
[    0.643725] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input4
[    0.644638] rtc_cmos 00:01: setting system clock to 2020-04-27T17:06:19 UTC (1588007179)
[    0.645127] rtc_cmos 00:01: alarms up to one month, y3k, 242 bytes nvram
[    0.645568] i2c /dev entries driver
[    0.646029] device-mapper: uevent: version 1.0.3
[    0.646602] device-mapper: ioctl: 4.42.0-ioctl (2020-02-27) initialised: dm-devel@redhat.com
[    0.647072] platform eisa.0: Probing EISA bus 0
[    0.647530] platform eisa.0: Cannot allocate resource for EISA slot 1
[    0.648082] platform eisa.0: EISA: Detected 0 cards
[    0.648531] intel_pstate: Intel P-state driver initializing
[    0.649850] intel_pstate: HWP enabled
[    0.650394] ledtrig-cpu: registered to indicate activity on CPUs
[    0.650906] EFI Variables Facility v0.08 2004-May-17
[    0.896307] intel_pmc_core INT33A1:00:  initialized
[    0.896837] drop_monitor: Initializing network drop monitor service
[    0.897445] NET: Registered protocol family 10
[    0.903688] Segment Routing with IPv6
[    0.904203] NET: Registered protocol family 17
[    0.904745] Key type dns_resolver registered
[    0.905759] RAS: Correctable Errors collector initialized.
[    0.906259] microcode: sig=0x806ea, pf=0x80, revision=0xca
[    0.906935] microcode: Microcode Update Driver: v2.2.
[    0.906939] IPI shorthand broadcast: enabled
[    0.907922] sched_clock: Marking stable (907158887, 754834)->(914143889, -6230168)
[    0.908583] registered taskstats version 1
[    0.909029] Loading compiled-in X.509 certificates
[    0.910864] Loaded X.509 cert 'Build time autogenerated kernel key: d54ce72edc400484e647ca51da6a4a87c88de3d3'
[    0.911339] zswap: loaded using pool lzo/zbud
[    0.912057] Key type ._fscrypt registered
[    0.912521] Key type .fscrypt registered
[    0.912992] Key type fscrypt-provisioning registered
[    0.918456] Key type big_key registered
[    0.918949] Key type trusted registered
[    0.922124] Key type encrypted registered
[    0.922580] AppArmor: AppArmor sha1 policy hashing enabled
[    0.924615] integrity: Loading X.509 certificate: UEFI:db
[    0.925068] integrity: Loaded X.509 cert 'Dell Inc. UEFI DB: 5ddb772dc880660055ba0bc131886bb630a639e7'
[    0.925522] integrity: Loading X.509 certificate: UEFI:db
[    0.925980] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    0.926451] integrity: Loading X.509 certificate: UEFI:db
[    0.926927] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    0.929274] ima: Allocated hash algorithm: sha1
[    0.951929] usb 1-5: new high-speed USB device number 2 using xhci_hcd
[    1.020004] ima: No architecture policies found
[    1.020500] evm: Initialising EVM extended attributes:
[    1.020986] evm: security.selinux
[    1.021461] evm: security.SMACK64
[    1.021948] evm: security.SMACK64EXEC
[    1.022414] evm: security.SMACK64TRANSMUTE
[    1.022869] evm: security.SMACK64MMAP
[    1.023318] evm: security.apparmor
[    1.023820] evm: security.ima
[    1.024258] evm: security.capability
[    1.024699] evm: HMAC attrs: 0x1
[    1.026000] PM:   Magic number: 0:884:138
[    1.027689] Freeing unused decrypted memory: 2040K
[    1.028539] Freeing unused kernel image (initmem) memory: 2592K
[    1.029019] Write protecting the kernel read-only data: 22528k
[    1.030012] Freeing unused kernel image (text/rodata gap) memory: 2044K
[    1.030759] Freeing unused kernel image (rodata/data gap) memory: 1124K
[    1.057847] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.058278] x86/mm: Checking user space page tables
[    1.084917] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.085344] Run /init as init process
[    1.085779]   with arguments:
[    1.085780]     /init
[    1.085780]   with environment:
[    1.085780]     HOME=/
[    1.085781]     TERM=linux
[    1.085781]     BOOT_IMAGE=/boot/vmlinuz-5.7-rc3
[    1.085781]     intel_iommu=on
[    1.146933] usb 1-5: New USB device found, idVendor=0bda, idProduct=58f4, bcdDevice=76.05
[    1.149600] usb 1-5: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[    1.152330] usb 1-5: Product: Integrated_Webcam_HD
[    1.154614] usb 1-5: Manufacturer: CN0FFMHCLOG0081JB3LKA00
[    1.156930] usb 1-5: SerialNumber: 200901010001
[    1.292069] usb 1-7: new full-speed USB device number 3 using xhci_hcd
[    1.446670] usb 1-7: New USB device found, idVendor=8087, idProduct=0a2b, bcdDevice= 0.10
[    1.450526] usb 1-7: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    1.503700] tsc: Refined TSC clocksource calibration: 2112.000 MHz
[    1.505668] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x1e71785e5dd, max_idle_ns: 440795244814 ns
[    1.508040] clocksource: Switched to clocksource tsc
[    1.583938] usb 1-10: new full-speed USB device number 4 using xhci_hcd
[    1.691508] rtsx_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    1.697905] nvme nvme0: pci function 0000:6d:00.0
[    1.707206] nvme nvme0: 8/0/0 default/read/poll queues
[    1.709897]  nvme0n1: p1 p2 p3 p4 p5 p6 p7
[    1.733375] usb 1-10: New USB device found, idVendor=27c6, idProduct=5385, bcdDevice= 1.00
[    1.733868] usb 1-10: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    1.734352] usb 1-10: Product: Goodix Fingerprint Device 
[    1.734796] usb 1-10: Manufacturer: HTMicroelectronics
[    1.735243] usb 1-10: SerialNumber: HTK32
[    1.776347] EXT4-fs (nvme0n1p6): mounted filesystem with ordered data mode. Opts: (null)
[    1.878107] systemd[1]: Inserted module 'autofs4'
[    1.900831] systemd[1]: systemd 245.5-2-arch running in system mode. (+PAM +AUDIT -SELINUX -IMA -APPARMOR +SMACK -SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid)
[    1.919994] systemd[1]: Detected architecture x86-64.
[    1.943624] systemd[1]: Set hostname to <nicholas-dell-linux>.
[    2.092047] systemd[1]: Created slice system-getty.slice.
[    2.093206] systemd[1]: Created slice system-modprobe.slice.
[    2.094329] systemd[1]: Created slice system-ppp.slice.
[    2.095492] systemd[1]: Created slice User and Session Slice.
[    2.096648] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[    2.097712] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[    2.098854] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[    2.100017] systemd[1]: Reached target Local Encrypted Volumes.
[    2.101097] systemd[1]: Reached target Login Prompts.
[    2.102172] systemd[1]: Reached target Paths.
[    2.103298] systemd[1]: Reached target Remote File Systems.
[    2.104414] systemd[1]: Reached target Slices.
[    2.105457] systemd[1]: Reached target Swap.
[    2.106553] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    2.107817] systemd[1]: Listening on LVM2 metadata daemon socket.
[    2.109061] systemd[1]: Listening on LVM2 poll daemon socket.
[    2.111085] systemd[1]: Listening on Process Core Dump Socket.
[    2.112295] systemd[1]: Listening on initctl Compatibility Named Pipe.
[    2.115638] systemd[1]: Condition check resulted in Journal Audit Socket being skipped.
[    2.116271] systemd[1]: Listening on Journal Socket (/dev/log).
[    2.117405] systemd[1]: Listening on Journal Socket.
[    2.118510] systemd[1]: Listening on udev Control Socket.
[    2.119645] systemd[1]: Listening on udev Kernel Socket.
[    2.121229] systemd[1]: Mounting Huge Pages File System...
[    2.122924] systemd[1]: Mounting POSIX Message Queue File System...
[    2.124769] systemd[1]: Mounting Kernel Debug File System...
[    2.126453] systemd[1]: Mounting Kernel Trace File System...
[    2.128590] systemd[1]: Mounting Temporary Directory (/tmp)...
[    2.130333] systemd[1]: Starting Create list of static device nodes for the current kernel...
[    2.132149] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
[    2.133899] systemd[1]: Starting Load Kernel Module drm...
[    2.138711] systemd[1]: Condition check resulted in Set Up Additional Binary Formats being skipped.
[    2.139310] systemd[1]: Condition check resulted in File System Check on Root Device being skipped.
[    2.141311] systemd[1]: Starting Journal Service...
[    2.143920] systemd[1]: Starting Load Kernel Modules...
[    2.146046] systemd[1]: Starting Remount Root and Kernel File Systems...
[    2.148763] systemd[1]: Starting udev Coldplug all Devices...
[    2.154384] systemd[1]: Mounted Huge Pages File System.
[    2.157562] systemd[1]: Mounted POSIX Message Queue File System.
[    2.159135] EXT4-fs (nvme0n1p6): re-mounted. Opts: data=ordered
[    2.162976] systemd[1]: Mounted Kernel Debug File System.
[    2.164528] systemd[1]: Mounted Kernel Trace File System.
[    2.165888] systemd[1]: Mounted Temporary Directory (/tmp).
[    2.167505] systemd[1]: Finished Create list of static device nodes for the current kernel.
[    2.170180] systemd[1]: modprobe@drm.service: Succeeded.
[    2.171013] systemd[1]: Finished Load Kernel Module drm.
[    2.172543] systemd[1]: Finished Load Kernel Modules.
[    2.173972] systemd[1]: Finished Remount Root and Kernel File Systems.
[    2.176462] systemd[1]: Mounting FUSE Control File System...
[    2.178716] systemd[1]: Mounting Kernel Configuration File System...
[    2.182755] systemd[1]: Started LVM2 metadata daemon.
[    2.184351] systemd[1]: Condition check resulted in First Boot Wizard being skipped.
[    2.186612] systemd[1]: Condition check resulted in Rebuild Hardware Database being skipped.
[    2.188922] systemd[1]: Starting Load/Save Random Seed...
[    2.191958] systemd[1]: Starting Apply Kernel Variables...
[    2.195401] systemd[1]: Condition check resulted in Create System Users being skipped.
[    2.196866] systemd[1]: Starting Create Static Device Nodes in /dev...
[    2.199101] systemd[1]: Mounted FUSE Control File System.
[    2.202360] systemd[1]: Mounted Kernel Configuration File System.
[    2.205727] systemd[1]: Finished Load/Save Random Seed.
[    2.210461] systemd[1]: Finished Apply Kernel Variables.
[    2.216948] systemd[1]: Finished Create Static Device Nodes in /dev.
[    2.219050] systemd[1]: Starting udev Kernel Device Manager...
[    2.248093] systemd[1]: Finished udev Coldplug all Devices.
[    2.460045] systemd[1]: Started Journal Service.
[    2.475503] systemd-journald[298]: Received client request to flush runtime journal.
[    2.615181] input: Intel HID events as /devices/platform/INT33D5:00/input/input6
[    2.619125] intel-hid INT33D5:00: platform supports 5 button array
[    2.620047] input: Intel HID 5 button array as /devices/platform/INT33D5:00/input/input7
[    2.676829] wmi_bus wmi_bus-PNP0C14:01: WQBC data block query control method not found
[    2.744118] pstore: Using crash dump compression: deflate
[    2.773626] hid: raw HID events driver (C) Jiri Kosina
[    2.779238] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    2.780399] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    2.837012] thunderbolt 0000:05:00.0: enabling device (0000 -> 0002)
[    2.873763] input: PC Speaker as /devices/platform/pcspkr/input/input9
[    2.895100] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[    2.895617] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    2.909401] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
[    2.912407] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    2.919127] platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
[    2.922538] cfg80211: failed to load regulatory.db
[    2.934589] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
[    2.936204] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    2.937707] RAPL PMU: hw unit of domain package 2^-14 Joules
[    2.942649] RAPL PMU: hw unit of domain dram 2^-14 Joules
[    2.946539] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    2.952699] RAPL PMU: hw unit of domain psys 2^-14 Joules
[    2.968065] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[    2.979487] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    2.981689] Error: Driver 'pcspkr' is already registered, aborting...
[    2.997466] pstore: Registered efi as persistent store backend
[    3.000893] Intel(R) Wireless WiFi driver for Linux
[    3.001956] Copyright(c) 2003- 2015 Intel Corporation
[    3.003855] iwlwifi 0000:02:00.0: enabling device (0000 -> 0002)
[    3.008262] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040380
[    3.009766] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[    3.011299] cryptd: max_cpu_qlen set to 1000
[    3.023230] AVX2 version of gcm_enc/dec engaged.
[    3.024430] AES CTR mode by8 optimization enabled
[    3.043377] iwlwifi 0000:02:00.0: Found debug destination: EXTERNAL_DRAM
[    3.048930] iwlwifi 0000:02:00.0: Found debug configuration: 0
[    3.051362] iwlwifi 0000:02:00.0: loaded firmware version 36.77d01142.0 8265-36.ucode op_mode iwlmvm
[    3.054304] iwlwifi 0000:02:00.0: Direct firmware load for iwl-debug-yoyo.bin failed with error -2
[    3.135275] intel_rapl_common: Found RAPL domain package
[    3.136581] intel_rapl_common: Found RAPL domain core
[    3.137608] intel_rapl_common: Found RAPL domain uncore
[    3.138649] intel_rapl_common: Found RAPL domain dram
[    3.141028] dcdbas dcdbas: Dell Systems Management Base Driver (version 5.6.0-3.3)
[    3.142213] iwlwifi 0000:02:00.0: Detected Intel(R) Dual Band Wireless AC 8265, REV=0x230
[    3.152106] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    3.153538] iwlwifi 0000:02:00.0: Allocated 0x00400000 bytes for firmware monitor.
[    3.389729] i915 0000:00:02.0: VT-d active for gfx access
[    3.391197] checking generic (50000000 300000) vs hw (db000000 1000000)
[    3.391198] checking generic (50000000 300000) vs hw (50000000 10000000)
[    3.391199] fb0: switching to inteldrmfb from EFI VGA
[    3.391261] iwlwifi 0000:02:00.0: base HW address: b4:d5:bd:9e:43:f5
[    3.393536] Console: switching to colour dummy device 80x25
[    3.393595] i915 0000:00:02.0: vgaarb: deactivate vga console
[    3.412963] input: Dell WMI hotkeys as /devices/platform/PNP0C14:01/wmi_bus/wmi_bus-PNP0C14:01/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input10
[    3.428660] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.442263] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[    3.443125] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[    3.445199] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)
[    3.448718] i915 0000:00:02.0: [drm:intel_dp_aux_init_backlight_funcs [i915]] Panel advertises DPCD backlight support, but VBT disagrees. If your backlight controls don't work try booting with i915.enable_dpcd_backlight=1. If your machine needs this, please file a _new_ bug report on drm/i915, see https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs for details.
[    3.459287] intel_rapl_common: Found RAPL domain package
[    3.459290] intel_rapl_common: Found RAPL domain dram
[    3.459498] proc_thermal 0000:00:04.0: Creating sysfs group for PROC_THERMAL_PCI
[    3.471084] ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-rs'
[    3.471534] thermal thermal_zone10: failed to read out thermal zone (-61)
[    3.479284] iwlwifi 0000:02:00.0 wlp2s0: renamed from wlan0
[    3.511300] [drm] Initialized i915 1.6.0 20200313 for 0000:00:02.0 on minor 0
[    3.550058] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    3.583204] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input11
[    3.584009] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[    3.592936] fbcon: i915drmfb (fb0) is primary device
[    3.608229] Console: switching to colour frame buffer device 240x67
[    3.647892] i915 0000:00:02.0: fb0: i915drmfb frame buffer device
[    3.668678] psmouse serio1: synaptics: queried max coordinates: x [..5666], y [..4734]
[    3.697450] psmouse serio1: synaptics: queried min coordinates: x [1276..], y [1118..]
[    3.698298] psmouse serio1: synaptics: Your touchpad (PNP: DLL07e6 PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.
[    3.713850] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC3271: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    3.714062] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    3.714225] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[    3.714403] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[    3.714559] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[    3.714989] snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=0x19
[    3.715147] snd_hda_codec_realtek hdaudioC0D0:      Headphone Mic=0x1b
[    3.719930] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=0x12
[    3.760241] psmouse serio1: synaptics: Touchpad model: 1, fw: 8.2, id: 0x1e2a1, caps: 0xf00323/0x840300/0x12e800/0x0, board id: 3038, fw id: 2375007
[    3.785615] input: HDA Intel PCH Headphone Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input12
[    3.793028] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input13
[    3.793103] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input14
[    3.793166] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input15
[    3.793250] input: HDA Intel PCH HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input16
[    3.793315] input: HDA Intel PCH HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input17
[    3.796837] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input8
[    3.890527] i2c_hid i2c-ELAN24F0:00: supply vdd not found, using dummy regulator
[    3.894936] i2c_hid i2c-ELAN24F0:00: supply vddl not found, using dummy regulator
[    3.943785] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
[    3.949989] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    4.069895] i2c_hid i2c-DELL07E6:00: supply vdd not found, using dummy regulator
[    4.074335] i2c_hid i2c-DELL07E6:00: supply vddl not found, using dummy regulator
[    4.134073] input: ELAN24F0:00 04F3:24F0 Touchscreen as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input18
[    4.139510] input: ELAN24F0:00 04F3:24F0 as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input19
[    4.144940] input: ELAN24F0:00 04F3:24F0 as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input20
[    4.149805] hid-generic 0018:04F3:24F0.0001: input,hidraw0: I2C HID v1.00 Device [ELAN24F0:00 04F3:24F0] on i2c-ELAN24F0:00
[    4.155855] input: DELL07E6:00 06CB:76AF Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input22
[    4.162458] input: DELL07E6:00 06CB:76AF Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input23
[    4.169585] hid-generic 0018:06CB:76AF.0002: input,hidraw1: I2C HID v1.00 Mouse [DELL07E6:00 06CB:76AF] on i2c-DELL07E6:00
[    4.183694] mc: Linux media interface: v0.10
[    4.192891] Bluetooth: Core ver 2.22
[    4.197224] NET: Registered protocol family 31
[    4.202904] Bluetooth: HCI device and connection manager initialized
[    4.208177] Bluetooth: HCI socket layer initialized
[    4.213341] Bluetooth: L2CAP socket layer initialized
[    4.218239] Bluetooth: SCO socket layer initialized
[    4.218877] videodev: Linux video capture interface: v2.00
[    4.308065] input: ELAN24F0:00 04F3:24F0 as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input25
[    4.311654] input: ELAN24F0:00 04F3:24F0 UNKNOWN as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input26
[    4.315301] input: ELAN24F0:00 04F3:24F0 UNKNOWN as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input27
[    4.318903] cdc_acm 1-10:1.0: ttyACM0: USB ACM device
[    4.319042] hid-multitouch 0018:04F3:24F0.0001: input,hidraw0: I2C HID v1.00 Device [ELAN24F0:00 04F3:24F0] on i2c-ELAN24F0:00
[    4.328494] usbcore: registered new interface driver cdc_acm
[    4.332850] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
[    4.347975] usbcore: registered new interface driver btusb
[    4.349000] Bluetooth: hci0: Bootloader revision 0.0 build 26 week 38 2015
[    4.353049] uvcvideo: Found UVC 1.00 device Integrated_Webcam_HD (0bda:58f4)
[    4.363260] uvcvideo 1-5:1.0: Entity type for entity Extension 4 was not initialized!
[    4.364985] Bluetooth: hci0: Device revision is 16
[    4.368053] uvcvideo 1-5:1.0: Entity type for entity Extension 7 was not initialized!
[    4.368054] uvcvideo 1-5:1.0: Entity type for entity Processing 2 was not initialized!
[    4.368056] uvcvideo 1-5:1.0: Entity type for entity Camera 1 was not initialized!
[    4.372261] Bluetooth: hci0: Secure boot is enabled
[    4.372262] Bluetooth: hci0: OTP lock is enabled
[    4.372262] Bluetooth: hci0: API lock is enabled
[    4.372262] Bluetooth: hci0: Debug lock is disabled
[    4.372263] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[    4.373288] Bluetooth: hci0: Found device firmware: intel/ibt-12-16.sfi
[    4.378812] input: Integrated_Webcam_HD: Integrate as /devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.0/input/input29
[    4.412268] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    4.427380] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    4.429300] Bluetooth: BNEP filters: protocol multicast
[    4.437584] Bluetooth: BNEP socket layer initialized
[    4.464506] uvcvideo: Found UVC 1.00 device Integrated_Webcam_HD (0bda:58f4)
[    4.466687] uvcvideo 1-5:1.2: Entity type for entity Extension 10 was not initialized!
[    4.471807] input: DELL07E6:00 06CB:76AF Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input30
[    4.475727] uvcvideo 1-5:1.2: Entity type for entity Extension 12 was not initialized!
[    4.480920] input: DELL07E6:00 06CB:76AF Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input31
[    4.486399] uvcvideo 1-5:1.2: Entity type for entity Processing 9 was not initialized!
[    4.491500] hid-multitouch 0018:06CB:76AF.0002: input,hidraw1: I2C HID v1.00 Mouse [DELL07E6:00 06CB:76AF] on i2c-DELL07E6:00
[    4.496680] uvcvideo 1-5:1.2: Entity type for entity Camera 11 was not initialized!
[    4.507082] input: Integrated_Webcam_HD: Integrate as /devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.2/input/input33
[    4.514481] usbcore: registered new interface driver uvcvideo
[    4.514482] USB Video Class driver (1.1.1)
[    4.574098] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    4.649722] iwlwifi 0000:02:00.0: FW already configured (0) - re-configuring
[    4.705389] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    4.847984] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    4.922412] iwlwifi 0000:02:00.0: FW already configured (0) - re-configuring
[    5.900239] Bluetooth: hci0: Waiting for firmware download to complete
[    5.901013] Bluetooth: hci0: Firmware loaded in 1516659 usecs
[    5.901040] Bluetooth: hci0: Waiting for device to boot
[    5.913030] Bluetooth: hci0: Device booted in 11720 usecs
[    5.913218] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-12-16.ddc
[    5.916063] Bluetooth: hci0: Applying Intel DDC parameters completed
[    5.918069] Bluetooth: hci0: Firmware revision 0.1 build 50 week 12 2019
[    5.972243] NET: Registered protocol family 38
[    6.051859] Bluetooth: RFCOMM TTY layer initialized
[    6.051864] Bluetooth: RFCOMM socket layer initialized
[    6.051867] Bluetooth: RFCOMM ver 1.11
[    7.154972] rfkill: input handler disabled
[   10.196078] rfkill: input handler enabled
[   10.605557] wlp2s0: authenticate with 78:8a:20:8e:ee:6a
[   10.615591] wlp2s0: send auth to 78:8a:20:8e:ee:6a (try 1/3)
[   10.622694] wlp2s0: authenticated
[   10.623740] wlp2s0: associate with 78:8a:20:8e:ee:6a (try 1/3)
[   10.627351] wlp2s0: RX AssocResp from 78:8a:20:8e:ee:6a (capab=0x1411 status=0 aid=2)
[   10.629314] wlp2s0: associated
[   10.721374] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
[   20.531209] thunderbolt 0-1: new device found, vendor=0xed device=0xb009
[   20.531212] thunderbolt 0-1: GIGABYTE GAMING BOX
[   20.604213] pcieport 0000:04:01.0: pciehp: Slot(1): Card present
[   20.604216] pcieport 0000:04:01.0: pciehp: Slot(1): Link Up
[   20.740095] pci 0000:06:00.0: [8086:1578] type 01 class 0x060400
[   20.740207] pci 0000:06:00.0: enabling Extended Tags
[   20.740396] pci 0000:06:00.0: supports D1 D2
[   20.740397] pci 0000:06:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   20.740558] pci 0000:06:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:04:01.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
[   20.740620] pci 0000:06:00.0: Adding to iommu group 15
[   20.740685] pcieport 0000:04:01.0: ASPM: current common clock configuration is inconsistent, reconfiguring
[   20.752019] pci 0000:06:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[   20.752171] pci 0000:07:01.0: [8086:1578] type 01 class 0x060400
[   20.752321] pci 0000:07:01.0: enabling Extended Tags
[   20.752509] pci 0000:07:01.0: supports D1 D2
[   20.752511] pci 0000:07:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[   20.752704] pci 0000:07:01.0: Adding to iommu group 15
[   20.752775] pci 0000:07:04.0: [8086:1578] type 01 class 0x060400
[   20.752936] pci 0000:07:04.0: enabling Extended Tags
[   20.753116] pci 0000:07:04.0: supports D1 D2
[   20.753116] pci 0000:07:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[   20.753296] pci 0000:07:04.0: Adding to iommu group 15
[   20.753390] pci 0000:06:00.0: PCI bridge to [bus 07-38]
[   20.753400] pci 0000:06:00.0:   bridge window [io  0x0000-0x0fff]
[   20.753406] pci 0000:06:00.0:   bridge window [mem 0x00000000-0x000fffff]
[   20.753429] pci 0000:06:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[   20.753432] pci 0000:07:01.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[   20.753445] pci 0000:07:04.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[   20.753587] pci 0000:08:00.0: [1002:7300] type 00 class 0x030000
[   20.753681] pci 0000:08:00.0: reg 0x10: [mem 0x00000000-0x0fffffff 64bit pref]
[   20.753708] pci 0000:08:00.0: reg 0x18: [mem 0x00000000-0x001fffff 64bit pref]
[   20.753723] pci 0000:08:00.0: reg 0x20: [io  0x0000-0x00ff]
[   20.753739] pci 0000:08:00.0: reg 0x24: [mem 0x00000000-0x0003ffff]
[   20.753754] pci 0000:08:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[   20.753772] pci 0000:08:00.0: enabling Extended Tags
[   20.753985] pci 0000:08:00.0: supports D1 D2
[   20.753985] pci 0000:08:00.0: PME# supported from D1 D2 D3hot D3cold
[   20.754211] pci 0000:08:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:04:01.0 (capable of 126.016 Gb/s with 8.0 GT/s PCIe x16 link)
[   20.754263] pci 0000:08:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[   20.754266] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=io+mem
[   20.754284] pci 0000:08:00.0: Adding to iommu group 15
[   20.754321] pci 0000:08:00.1: [1002:aae8] type 00 class 0x040300
[   20.754405] pci 0000:08:00.1: reg 0x10: [mem 0x00000000-0x00003fff 64bit]
[   20.754507] pci 0000:08:00.1: enabling Extended Tags
[   20.754665] pci 0000:08:00.1: supports D1 D2
[   20.754819] pci 0000:08:00.1: Adding to iommu group 15
[   20.754913] pci 0000:07:01.0: PCI bridge to [bus 08-38]
[   20.754924] pci 0000:07:01.0:   bridge window [io  0x0000-0x0fff]
[   20.754930] pci 0000:07:01.0:   bridge window [mem 0x00000000-0x000fffff]
[   20.754953] pci 0000:07:01.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[   20.754954] pci_bus 0000:08: busn_res: [bus 08-38] end is updated to 08
[   20.755088] pci 0000:09:00.0: [8086:15b6] type 00 class 0x0c0330
[   20.755145] pci 0000:09:00.0: reg 0x10: [mem 0x00000000-0x0000ffff]
[   20.756542] pci 0000:09:00.0: supports D1 D2
[   20.756544] pci 0000:09:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   20.757146] pci 0000:09:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:04:01.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
[   20.757217] pci 0000:09:00.0: Adding to iommu group 15
[   20.757391] pci 0000:07:04.0: PCI bridge to [bus 09-38]
[   20.757403] pci 0000:07:04.0:   bridge window [io  0x0000-0x0fff]
[   20.757410] pci 0000:07:04.0:   bridge window [mem 0x00000000-0x000fffff]
[   20.757421] pci 0000:07:04.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[   20.757423] pci_bus 0000:09: busn_res: [bus 09-38] end is updated to 38
[   20.757431] pci_bus 0000:07: busn_res: [bus 07-38] end is updated to 38
[   20.757440] pci 0000:07:04.0: bridge window [mem 0x00100000-0x001fffff 64bit pref] to [bus 09-38] add_size ffff00000 add_align 100000
[   20.757442] pci 0000:07:04.0: bridge window [mem 0x00100000-0x001fffff] to [bus 09-38] add_size 18f00000 add_align 100000
[   20.757445] pci 0000:06:00.0: bridge window [mem 0x04000000-0x1fffffff 64bit pref] to [bus 07-38] add_size ffc000000 add_align 4000000
[   20.757446] pci 0000:06:00.0: bridge window [mem 0x00100000-0x002fffff] to [bus 07-38] add_size 18f00000 add_align 100000
[   20.757450] pcieport 0000:04:01.0: BAR 13: no space for [io  size 0x2000]
[   20.757452] pcieport 0000:04:01.0: BAR 13: failed to assign [io  size 0x2000]
[   20.757455] pci 0000:06:00.0: BAR 15: assigned [mem 0x4b0000000-0x14afffffff 64bit pref]
[   20.757457] pci 0000:06:00.0: BAR 14: assigned [mem 0x60100000-0x790fffff]
[   20.757458] pci 0000:06:00.0: BAR 13: no space for [io  size 0x2000]
[   20.757459] pci 0000:06:00.0: BAR 13: failed to assign [io  size 0x2000]
[   20.757462] pci 0000:07:01.0: BAR 15: assigned [mem 0x4b0000000-0x4c7ffffff 64bit pref]
[   20.757463] pci 0000:07:01.0: BAR 14: assigned [mem 0x60100000-0x601fffff]
[   20.757465] pci 0000:07:04.0: BAR 14: assigned [mem 0x60200000-0x790fffff]
[   20.757466] pci 0000:07:04.0: BAR 15: assigned [mem 0x4c8000000-0x14afffffff 64bit pref]
[   20.757468] pci 0000:07:01.0: BAR 13: no space for [io  size 0x1000]
[   20.757469] pci 0000:07:01.0: BAR 13: failed to assign [io  size 0x1000]
[   20.757470] pci 0000:07:04.0: BAR 13: no space for [io  size 0x1000]
[   20.757471] pci 0000:07:04.0: BAR 13: failed to assign [io  size 0x1000]
[   20.757473] pci 0000:08:00.0: BAR 0: assigned [mem 0x4b0000000-0x4bfffffff 64bit pref]
[   20.757496] pci 0000:08:00.0: BAR 2: assigned [mem 0x4c0000000-0x4c01fffff 64bit pref]
[   20.757519] pci 0000:08:00.0: BAR 5: assigned [mem 0x60100000-0x6013ffff]
[   20.757527] pci 0000:08:00.0: BAR 6: assigned [mem 0x60140000-0x6015ffff pref]
[   20.757529] pci 0000:08:00.1: BAR 0: assigned [mem 0x60160000-0x60163fff 64bit]
[   20.757551] pci 0000:08:00.0: BAR 4: no space for [io  size 0x0100]
[   20.757553] pci 0000:08:00.0: BAR 4: failed to assign [io  size 0x0100]
[   20.757554] pci 0000:07:01.0: PCI bridge to [bus 08]
[   20.757563] pci 0000:07:01.0:   bridge window [mem 0x60100000-0x601fffff]
[   20.757570] pci 0000:07:01.0:   bridge window [mem 0x4b0000000-0x4c7ffffff 64bit pref]
[   20.757582] pci 0000:09:00.0: BAR 0: assigned [mem 0x60200000-0x6020ffff]
[   20.757589] pci 0000:07:04.0: PCI bridge to [bus 09-38]
[   20.757598] pci 0000:07:04.0:   bridge window [mem 0x60200000-0x790fffff]
[   20.757605] pci 0000:07:04.0:   bridge window [mem 0x4c8000000-0x14afffffff 64bit pref]
[   20.757616] pci 0000:06:00.0: PCI bridge to [bus 07-38]
[   20.757625] pci 0000:06:00.0:   bridge window [mem 0x60100000-0x790fffff]
[   20.757632] pci 0000:06:00.0:   bridge window [mem 0x4b0000000-0x14afffffff 64bit pref]
[   20.757643] pcieport 0000:04:01.0: PCI bridge to [bus 06-38]
[   20.757648] pcieport 0000:04:01.0:   bridge window [mem 0x60100000-0x790fffff]
[   20.757652] pcieport 0000:04:01.0:   bridge window [mem 0x4b0000000-0x14afffffff 64bit pref]
[   20.757658] PCI: No. 2 try to assign unassigned res
[   20.757662] pcieport 0000:04:01.0: BAR 13: no space for [io  size 0x2000]
[   20.757663] pcieport 0000:04:01.0: BAR 13: failed to assign [io  size 0x2000]
[   20.757665] pci 0000:06:00.0: BAR 13: no space for [io  size 0x2000]
[   20.757666] pci 0000:06:00.0: BAR 13: failed to assign [io  size 0x2000]
[   20.757668] pci 0000:07:01.0: BAR 13: no space for [io  size 0x1000]
[   20.757669] pci 0000:07:01.0: BAR 13: failed to assign [io  size 0x1000]
[   20.757671] pci 0000:07:04.0: BAR 13: no space for [io  size 0x1000]
[   20.757672] pci 0000:07:04.0: BAR 13: failed to assign [io  size 0x1000]
[   20.757674] pci 0000:08:00.0: BAR 4: no space for [io  size 0x0100]
[   20.757675] pci 0000:08:00.0: BAR 4: failed to assign [io  size 0x0100]
[   20.757677] pci 0000:07:01.0: PCI bridge to [bus 08]
[   20.757686] pci 0000:07:01.0:   bridge window [mem 0x60100000-0x601fffff]
[   20.757692] pci 0000:07:01.0:   bridge window [mem 0x4b0000000-0x4c7ffffff 64bit pref]
[   20.757704] pci 0000:07:04.0: PCI bridge to [bus 09-38]
[   20.757713] pci 0000:07:04.0:   bridge window [mem 0x60200000-0x790fffff]
[   20.757719] pci 0000:07:04.0:   bridge window [mem 0x4c8000000-0x14afffffff 64bit pref]
[   20.757731] pci 0000:06:00.0: PCI bridge to [bus 07-38]
[   20.757739] pci 0000:06:00.0:   bridge window [mem 0x60100000-0x790fffff]
[   20.757745] pci 0000:06:00.0:   bridge window [mem 0x4b0000000-0x14afffffff 64bit pref]
[   20.757756] pcieport 0000:04:01.0: PCI bridge to [bus 06-38]
[   20.757761] pcieport 0000:04:01.0:   bridge window [mem 0x60100000-0x790fffff]
[   20.757765] pcieport 0000:04:01.0:   bridge window [mem 0x4b0000000-0x14afffffff 64bit pref]
[   20.757796] pcieport 0000:06:00.0: enabling device (0000 -> 0002)
[   20.758247] pcieport 0000:07:01.0: enabling device (0000 -> 0002)
[   20.758636] pcieport 0000:07:04.0: enabling device (0000 -> 0002)
[   20.758820] pcieport 0000:07:04.0: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[   20.759190] pci 0000:08:00.1: D0 power state depends on 0000:08:00.0
[   20.759218] snd_hda_intel 0000:08:00.1: enabling device (0000 -> 0002)
[   20.759301] snd_hda_intel 0000:08:00.1: Force to non-snoop mode
[   20.759349] pci 0000:09:00.0: enabling device (0000 -> 0002)
[   20.759586] xhci_hcd 0000:09:00.0: xHCI Host Controller
[   20.759591] xhci_hcd 0000:09:00.0: new USB bus registered, assigned bus number 5
[   20.760815] xhci_hcd 0000:09:00.0: hcc params 0x200077c1 hci version 0x110 quirks 0x0000000200009810
[   20.761230] usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.07
[   20.761245] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   20.761247] usb usb5: Product: xHCI Host Controller
[   20.761250] usb usb5: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[   20.761251] usb usb5: SerialNumber: 0000:09:00.0
[   20.761512] hub 5-0:1.0: USB hub found
[   20.761525] hub 5-0:1.0: 2 ports detected
[   20.761766] xhci_hcd 0000:09:00.0: xHCI Host Controller
[   20.761770] xhci_hcd 0000:09:00.0: new USB bus registered, assigned bus number 6
[   20.761773] xhci_hcd 0000:09:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[   20.761816] usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.07
[   20.761818] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   20.761820] usb usb6: Product: xHCI Host Controller
[   20.761821] usb usb6: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[   20.761822] usb usb6: SerialNumber: 0000:09:00.0
[   20.761943] hub 6-0:1.0: USB hub found
[   20.761955] hub 6-0:1.0: 2 ports detected
[   20.764337] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[   20.764339] AMD-Vi: AMD IOMMUv2 functionality not available on this system
[   20.768444] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input34
[   20.768495] input: HDA ATI HDMI HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input35
[   20.768542] input: HDA ATI HDMI HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input36
[   20.768585] input: HDA ATI HDMI HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input37
[   20.768624] input: HDA ATI HDMI HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input38
[   20.768663] input: HDA ATI HDMI HDMI/DP,pcm=11 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input39
[   20.801374] [drm] amdgpu kernel modesetting enabled.
[   20.801444] CRAT table not found
[   20.801447] Virtual CRAT table created for CPU
[   20.801447] Parsing CRAT table with 1 nodes
[   20.801449] Creating topology SYSFS entries
[   20.801458] Topology: Add CPU node
[   20.801459] Finished initializing topology
[   20.801568] amdgpu 0000:08:00.0: enabling device (0000 -> 0002)
[   20.801682] [drm] initializing kernel modesetting (FIJI 0x1002:0x7300 0x1002:0x0B36 0xCA).
[   20.802434] [drm] register mmio base: 0x60100000
[   20.802435] [drm] register mmio size: 262144
[   20.802436] [drm] PCI I/O BAR is not found.
[   20.802439] [drm] PCIE atomic ops is not supported
[   20.802458] [drm] add ip block number 0 <vi_common>
[   20.802458] [drm] add ip block number 1 <gmc_v8_0>
[   20.802459] [drm] add ip block number 2 <tonga_ih>
[   20.802459] [drm] add ip block number 3 <gfx_v8_0>
[   20.802460] [drm] add ip block number 4 <sdma_v3_0>
[   20.802460] [drm] add ip block number 5 <powerplay>
[   20.802461] [drm] add ip block number 6 <dm>
[   20.802462] [drm] add ip block number 7 <uvd_v6_0>
[   20.802462] [drm] add ip block number 8 <vce_v3_0>
[   20.802464] kfd kfd: skipped device 1002:7300, PCI rejects atomics
[   21.097489] ATOM BIOS: 113-C8820200-107
[   21.097521] [drm] UVD is enabled in physical mode
[   21.097522] [drm] VCE enabled in physical mode
[   21.097570] [drm] GPU posting now...
[   21.104011] usb 5-2: new high-speed USB device number 2 using xhci_hcd
[   21.203742] [drm] vm size is 64 GB, 2 levels, block size is 10-bit, fragment size is 9-bit
[   21.203766] amdgpu 0000:08:00.0: VRAM: 4096M 0x000000F400000000 - 0x000000F4FFFFFFFF (4096M used)
[   21.203767] amdgpu 0000:08:00.0: GART: 1024M 0x000000FF00000000 - 0x000000FF3FFFFFFF
[   21.203782] [drm] Detected VRAM RAM=4096M, BAR=256M
[   21.203783] [drm] RAM width 512bits HBM
[   21.203924] [TTM] Zone  kernel: Available graphics memory: 8073306 KiB
[   21.203925] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[   21.203926] [TTM] Initializing pool allocator
[   21.203929] [TTM] Initializing DMA pool allocator
[   21.203957] [drm] amdgpu: 4096M of VRAM memory ready
[   21.203958] [drm] amdgpu: 4096M of GTT memory ready.
[   21.203964] [drm] GART: num cpu pages 262144, num gpu pages 262144
[   21.204053] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[   21.205426] [drm] Chained IB support enabled!
[   21.208694] amdgpu: [powerplay] hwmgr_sw_init smu backed is fiji_smu
[   21.209090] [drm] Found UVD firmware Version: 1.91 Family ID: 12
[   21.209093] [drm] UVD ENC is disabled
[   21.225159] [drm] Found VCE firmware Version: 55.2 Binary ID: 3
[   21.254285] usb 5-2: New USB device found, idVendor=05e3, idProduct=0610, bcdDevice=93.03
[   21.254287] usb 5-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   21.254288] usb 5-2: Product: USB2.1 Hub
[   21.254289] usb 5-2: Manufacturer: GenesysLogic
[   21.255543] hub 5-2:1.0: USB hub found
[   21.256359] hub 5-2:1.0: 4 ports detected
[   21.294031] [drm] dce110_link_encoder_construct: Failed to get encoder_cap_info from VBIOS with error code 4!
[   21.294065] [drm] Display Core initialized with v3.2.76!
[   21.294927] snd_hda_intel 0000:08:00.1: bound 0000:08:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
[   21.295497] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   21.341483] [drm] UVD initialized successfully.
[   21.379872] usb 6-2: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[   21.402735] usb 6-2: New USB device found, idVendor=05e3, idProduct=0620, bcdDevice=93.03
[   21.402737] usb 6-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   21.402737] usb 6-2: Product: USB3.1 Hub
[   21.402738] usb 6-2: Manufacturer: GenesysLogic
[   21.404663] hub 6-2:1.0: USB hub found
[   21.405172] hub 6-2:1.0: 4 ports detected
[   21.450500] [drm] VCE initialized successfully.
[   21.450960] amdgpu 0000:08:00.0: [drm] Cannot find any crtc or sizes
[   21.453135] [drm] Initialized amdgpu 3.36.0 20150101 for 0000:08:00.0 on minor 1
[   21.571714] usb 5-2.2: new full-speed USB device number 3 using xhci_hcd
[   21.696870] usb 5-2.2: New USB device found, idVendor=1044, idProduct=7a3e, bcdDevice= 1.00
[   21.696943] usb 5-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   21.696997] usb 5-2.2: Product: USB-HID Device
[   21.697034] usb 5-2.2: Manufacturer: HOLTEK
[   21.697068] usb 5-2.2: SerialNumber: 000000000000
[   23.074467] hid-generic 0003:1044:7A3E.0003: hiddev0,hidraw2: USB HID v1.11 Device [HOLTEK USB-HID Device] on usb-0000:09:00.0-2.2/input0
[   23.074501] usbhid 5-2.2:1.1: couldn't find an input interrupt endpoint
[   23.075161] input: HOLTEK USB-HID Device as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:04.0/0000:09:00.0/usb5/5-2/5-2.2/5-2.2:1.2/0003:1044:7A3E.0004/input/input40
[   23.075253] hid-generic 0003:1044:7A3E.0004: input,hidraw3: USB HID v1.11 Mouse [HOLTEK USB-HID Device] on usb-0000:09:00.0-2.2/input2
[   23.075286] usbcore: registered new interface driver usbhid
[   23.075287] usbhid: USB HID core driver
[   24.155840] rfkill: input handler disabled
[   26.904127] rfkill: input handler enabled
[   37.264152] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[   37.363287] [drm] UVD initialized successfully.
[   37.473340] [drm] VCE initialized successfully.
[   37.477942] amdgpu 0000:08:00.0: [drm] Cannot find any crtc or sizes
[   38.936624] [drm] fb mappable at 0x4B0696000
[   38.936626] [drm] vram apper at 0x4B0000000
[   38.936626] [drm] size 33177600
[   38.936627] [drm] fb depth is 24
[   38.936627] [drm]    pitch is 15360
[   38.936673] amdgpu 0000:08:00.0: fb1: amdgpudrmfb frame buffer device
[   40.092223] snd_hda_intel 0000:08:00.1: azx_get_response timeout, switching to polling mode: last cmd=0x00170500
[   40.092240] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last cmd=0x170500
[   40.092241] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last cmd=0x170500
[   40.092242] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last cmd=0x170500
[   40.092243] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last cmd=0x170500
[   40.092244] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last cmd=0x170500
[   40.092245] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last cmd=0x170500
[   40.092245] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last cmd=0x170500
[   40.092246] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last cmd=0x170500
[   40.092247] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last cmd=0x170500
[   40.092248] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last cmd=0x170500
[   41.113998] snd_hda_intel 0000:08:00.1: No response from codec, disabling MSI: last cmd=0x001f0500
[   42.130816] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x001f0500
[   43.174467] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00170500
[   44.185148] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x001f0500
[   45.227095] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00170500
[   46.240052] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x001f0500
[   47.284563] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00170500
[   48.296375] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x001f0500
[   49.331535] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00170500
[   50.338640] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x001f0500
[   51.377239] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00170500
[   52.383350] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x001f0500
[   53.421473] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00170500
[   54.427058] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x001f0500
[   55.468642] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00170500
[   56.473784] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x001f0500
[   57.510979] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00170500
[   58.519930] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x001f0500
[   59.560825] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00170500
[   60.565603] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x001f0500
[   61.601954] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00370740
[   62.610774] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00570740
[   63.623294] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00770740
[   64.627702] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00970740
[   65.632119] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00b70740
[   66.636464] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00d70740
[   67.640653] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00377200
[   68.648922] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00378901
[   69.653158] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00577200
[   70.657248] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00578901
[   71.669533] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00777200
[   72.673626] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00778901
[   73.677763] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00977200
[   74.685991] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00978901
[   75.689823] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00b77200
[   76.698121] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00b78901
[   77.702327] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00d77200
[   78.714432] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00d78901
[   79.722537] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00270d01
[   79.722541] snd_hda_codec_hdmi hdaudioC1D0: Unable to sync register 0x2f0d00. -11
[   80.730666] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x003f0900
[   81.738856] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x005f0900
[   82.742853] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x007f0900
[   83.750958] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x009f0900
[   84.762818] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00bf0900
[   85.775096] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00df0900
[   86.787058] snd_hda_intel 0000:08:00.1: No response from codec, resetting bus: last cmd=0x00570100
[   87.791276] snd_hda_intel 0000:08:00.1: azx_get_response timeout, switching to single_cmd mode: last cmd=0x00570100
[   92.885231] azx_single_wait_for_response: 2 callbacks suppressed

--zYM0uCDKw75PZbzx--
