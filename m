Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B32941C0349
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 18:58:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDFD31690;
	Thu, 30 Apr 2020 18:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDFD31690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588265907;
	bh=rRRyYA2zQFSPNvWHDHrQsUxr9xOt5FGIfH7KlBJgxIQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ge7LHNVp4pcUUG5hEjripHdPYOEKgM9zRwhSF1ukyHTisZUauO2xIILv4/Nbxqjxp
	 FmL6Dwt/QogUVHmtCbK9KeIE8t5cwHXAGtY9q4XwOyeZMcZGiYA5F0Mb8d6PWb1YjR
	 XnBBvyfq5tqx0Bq6WOlFXudXBLQ3AyLyx4fm+3+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71137F802BD;
	Thu, 30 Apr 2020 18:53:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BA2DF8022B; Wed, 29 Apr 2020 17:27:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MSGID_FROM_MTA_HEADER,
 PRX_BODY_13,PRX_BODY_30,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254065.outbound.protection.outlook.com [40.92.254.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A8EDF800D2
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 17:27:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A8EDF800D2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZFaz5MeldVZ8JWTb0cMI0Daoe5znG6q+2RU6ZpN1UaW6DBHw8sFfGC4EspGQvb6jh80U57u2QUCLCKcIBUt0AoBBkDQXthSaK7ZoGSekm+a+mYJkE12wvL4H78b3fKF1gsWChhqvrtf6hfd815QeP7sWFZcho4Fkx90lDuOt6rzcF03C6kJPv44PgwdOLr9Jrfy31wyVdiG/LCeqt365C4LUtQlCA67F851n5K8xJLuMh8HrCu24cyPEPz0SP+FsvkzL0tpsVGe/MRZyIuVX0+DTrqMJHjL5HcLqw91vs0JYTF0H/dJpvvlBSi/V/Rkb2ZHIhmo4uSd1+6nQ2ckmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbp7sMIOukGeCrN7L4ls7PkxM20p6alMmGzi3e1yE6I=;
 b=JrC3cVByoIgrucNvul/HI49haoGr5awjjamBBDW+YVtI+V+F3y1fRJ25phspeI35Xk+l0WYuc7iDgmaU4x7WifrwXPzc0gqKYwNuZDtF3Vn0Pl3hkTd+mLZaOyvkGKDX9fuO2CqPDnfvGJHHqRfokmef5oPg3njchicGCw+Bn3FltKmAF/ph4bOyGjPbO0OPUJvl+ghvhEv2ZX9DA1W5QP+3dAPa+vVuzLvQjvp3C3Wic1619z/xFpunPaRV9f7RftxH6KLehXryBFF46x1/b+PJRHBrLWU74lq+hWewBBstp4ZVVVAH+GKpK/8/Xll2ItevcUqPnNGBaHmU8BBYXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com.au; dmarc=pass action=none
 header.from=outlook.com.au; dkim=pass header.d=outlook.com.au; arc=none
Received: from HK2APC01FT026.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::52) by
 HK2APC01HT215.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::331)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Wed, 29 Apr
 2020 15:27:28 +0000
Received: from PSXP216MB0438.KORP216.PROD.OUTLOOK.COM (10.152.248.53) by
 HK2APC01FT026.mail.protection.outlook.com (10.152.248.174) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.19 via Frontend Transport; Wed, 29 Apr 2020 15:27:28 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:77437AE5AD8947952F100961BC12AACD1BF111BCC0B98E7F92E24E9B32A1A42A;
 UpperCasedChecksum:BEED46F3D9FC5B1EB2DC5B858164E79F3A8B413101332CA939F66B39C7975519;
 SizeAsReceived:8660; Count:48
Received: from PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 ([fe80::21f1:20fb:d1f:8e25]) by PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 ([fe80::21f1:20fb:d1f:8e25%7]) with mapi id 15.20.2958.019; Wed, 29 Apr 2020
 15:27:28 +0000
Date: Wed, 29 Apr 2020 23:27:17 +0800
From: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/1] Fiji GPU audio register timeout when in BACO state
Message-ID: <PSXP216MB043822350CDE9E7EEA37730880AD0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
References: <PSXP216MB0438D2AF96CE0D4F83F48C4D80AE0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <MN2PR12MB4488E4909C1488FB507E0BF5F7AF0@MN2PR12MB4488.namprd12.prod.outlook.com>
 <s5ho8rdnems.wl-tiwai@suse.de>
 <PSXP216MB04387BF6B5F8DA84749E5D6F80AF0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <CADnq5_M=QEqxuCKjb_qZvFSvwM5eLEFfsepxYYXoouFoe5bn7A@mail.gmail.com>
 <s5h4kt4ojrf.wl-tiwai@suse.de>
 <CADnq5_MMQ5_MjEg=bkJJGMJP53RjB3yxvOW0nUDeWxzg3Q0pVQ@mail.gmail.com>
 <s5hv9lkm49n.wl-tiwai@suse.de>
 <PSXP216MB043899DC52E6C6BF728D77CD80AC0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <s5ha72ulp2y.wl-tiwai@suse.de>
Content-Type: multipart/mixed; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
In-Reply-To: <s5ha72ulp2y.wl-tiwai@suse.de>
X-ClientProxiedBy: ME2P282CA0008.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:4d::20) To PSXP216MB0438.KORP216.PROD.OUTLOOK.COM
 (2603:1096:300:d::20)
X-Microsoft-Original-Message-ID: <20200429152717.GA1743@nicholas-dell-linux>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nicholas-dell-linux (2001:44b8:605f:11:45ec:d37e:a989:bf24) by
 ME2P282CA0008.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:4d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.19 via Frontend Transport; Wed, 29 Apr 2020 15:27:24 +0000
X-Microsoft-Original-Message-ID: <20200429152717.GA1743@nicholas-dell-linux>
X-TMN: [qXyCUBcBxKrB1PBwQEu8A287XRfH44VkxpEXVegB1xy5kgjWrgIi/Nbudl3Kb2tI]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 1c11c05e-2840-400d-46eb-08d7ec51d273
X-MS-TrafficTypeDiagnostic: HK2APC01HT215:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5z0tGgAJtEvo0HJ5nlGt7NSwDwr72eaKjhL7UUiomOFmVJmVhH+VKKZGQJNDOWn9APMbh1FarOCPFug5namLF7mW2cUcUOr6N2IYOxDh1IItd0TJiFbBQEVpJCXkXtAWGv6J3MJDsELCYam0ak+DGeI2ZChowOJWiGdxHm2/ukT6dQzlA5LQo3smQI0hsLnre6E6RbtEkxVlw7icQt1wjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:PSXP216MB0438.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: RcxAYiXOGKDjrC9wLjFssUsGIjYUufl0BF2VK1wrOZkJq76gzzzM4Tl1P3K2bUtk+6ImAQeIW45bFJRkE6wnBYOvj0fvjK+Xy2EAV0850pJpzMkI+WIiYZnZfWbMw3c1uocqsHlXAGIxwKRtJt2TMjlVGMGyfRCyBtS0iMAEvrDUXQ7gMOOumCMQc4lTm3EpRIUIPP6pgM3CURRPXVJm1g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c11c05e-2840-400d-46eb-08d7ec51d273
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2020 15:27:27.9033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT215
X-Mailman-Approved-At: Thu, 30 Apr 2020 18:53:43 +0200
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

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2020 at 09:37:41AM +0200, Takashi Iwai wrote:
> On Tue, 28 Apr 2020 16:48:45 +0200,
> Nicholas Johnson wrote:
> > 
> > > > > >
> > > > > > FWIW, I have a fiji board in a desktop system and it worked fine when
> > > > > > this code was enabled.
> > > > >
> > > > > Is the new DC code used for Fiji boards?  IIRC, the audio component
> > > > > binding from amdgpu is enabled only for DC, and without the audio
> > > > > component binding the runtime PM won't be linked up, hence you can't
> > > > > power up GPU from the audio side access automatically.
> > > > >
> > > > 
> > > > Yes, DC is enabled by default for all cards with runtime pm enabled.
> > > 
> > > OK, thanks, I found that amdgpu got bound via component in the dmesg
> > > output, too:
> > > 
> > > [   21.294927] snd_hda_intel 0000:08:00.1: bound 0000:08:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> > > 
> > > This is the place soon after amdgpu driver gets initialized.
> > > Then we see later another initialization phase:
> > > 
> > > [   26.904127] rfkill: input handler enabled
> > > [   37.264152] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
> > > 
> > > here shows 10 seconds between them.  Then, it complained something:
> > > 
> > > 
> > > [   37.363287] [drm] UVD initialized successfully.
> > > [   37.473340] [drm] VCE initialized successfully.
> > > [   37.477942] amdgpu 0000:08:00.0: [drm] Cannot find any crtc or sizes
> > 
> > The above would be me hitting WindowsKey+P to change screens, but with 
> > no DisplayPort attached to Fiji, hence it unable to find crtc.
> > 
> > > 
> > > ... and go further, and hitting HD-audio error:
> > > 
> > That would be me having attached the DisplayPort and done WindowsKey+P 
> > again.
> > 
> > > [   38.936624] [drm] fb mappable at 0x4B0696000
> > > [   38.936626] [drm] vram apper at 0x4B0000000
> > > [   38.936626] [drm] size 33177600
> > > [   38.936627] [drm] fb depth is 24
> > > [   38.936627] [drm]    pitch is 15360
> > > [   38.936673] amdgpu 0000:08:00.0: fb1: amdgpudrmfb frame buffer device
> > > [   40.092223] snd_hda_intel 0000:08:00.1: azx_get_response timeout, switching to polling mode: last cmd=0x00170500
> > > 
> > > After this point, HD-audio communication was screwed up.
> > > 
> > > This lastcmd in the above message is AC_SET_POWER_STATE verb for the
> > > root node to D0, so the very first command to power up the codec. 
> > > The rest commands are also about the power up of each node, so the
> > > whole error indicate that the power up at runtime resume failed.
> > > 
> > > So, this looks to me as if the device gets runtime-resumed at the bad
> > > moment?
> > It does. However, this is not going to be easy to pin down.
> > 
> > I moved from Arch to Ubuntu, and it behaves differently. I cannot 
> > trigger the bug in Ubuntu. Plus, it puts the GPUs asleep, even if 
> > attached at boot, unlike Arch. I will continue to try to trigger it. But 
> > even if this is a problem with the Linux distribution, it should not be 
> > able to trigger a kernel mode bug, so we should persist with finding it.
> 
> Sure, that's a bug to be fixed.
> 
> This made me thinking what happens if we load the HD-audio driver very
> late.  Could you try to blacklist snd-hda-intel module, then load it
> manually after plugging the DP monitor and activating it?
Attached dmesg-blacklist-*

It is interesting. If I enable the monitor with the module unloaded, and 
then load the module, I cannot trigger the bug, even if disabling the 
monitor, waiting for GPU to sleep, and then waking again.

Even if I wake monitor up, put to sleep again, and then insmod when 
sleeping, it does not cause bug when waking again.

Is there anything special about the first time the monitor is used?

> 
> Also, could you track who called the problematic power-up sequence,
> e.g. by adding WARN_ON_ONCE()?
Attached dmesg-warning

> 
> Last but not least, please check /proc/asound/card1/eld#* files (there
> are both card0 and card1 or such that contain eld#* files, and one is
> for i915 and another for amdgpu) before and after plugging.  This
> shows whether the audio connection was recognized or not.
Before plugging: card not yet attached, so the sysfs for that card not 
yet created

After plugging (and insmod snd-hda-intel.ko):
codec#0  codec#2  eld#2.0  eld#2.1  eld#2.2  eld#2.3  eld#2.4  eld#2.5  eld#2.6  eld#2.7  eld#2.8  id  pcm0c  pcm0p  pcm10p  pcm3p  pcm7p  pcm8p  pcm9p

Regards,
Nicholas

> 
> 
> thanks,
> 
> Takashi
> 
> --- a/sound/hda/hdac_controller.c
> +++ b/sound/hda/hdac_controller.c
> @@ -224,6 +224,7 @@ void snd_hdac_bus_update_rirb(struct hdac_bus *bus)
>  			dev_err_ratelimited(bus->dev,
>  				"spurious response %#x:%#x, last cmd=%#08x\n",
>  				res, res_ex, bus->last_cmd[addr]);
> +			WARN_ON_ONCE(1);
>  		}
>  	}
>  }

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=dmesg-warning
Content-Transfer-Encoding: quoted-printable

[    0.000000] microcode: microcode updated early to revision 0xca, date =
=3D 2019-10-03
[    0.000000] Linux version 5.7.0-rc3+ (nicholas@nicholas-dell-linux) (gcc=
 version 9.3.0 (Arch Linux 9.3.0-1), GNU ld (GNU Binutils) 2.34) #7 SMP Tue=
 Apr 28 09:55:03 AWST 2020
[    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-5.7-rc3 root=3DUUID=
=3De9880a1b-a4f2-4779-8a98-6c1bee968ebe rw sysrq_always_enabled audit=3D0 p=
cie_ports=3Dnative pci=3Dassign-busses,hpbussize=3D0x33,hpmemsize=3D16K,hpi=
osize=3D0,hpmmiosize=3D400M,hpmmioprefsize=3D64G,nocrs,realloc intel_iommu=
=3Don iommu=3Don video=3Dvesafb:off
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Hygon HygonGenuine
[    0.000000]   Centaur CentaurHauls
[    0.000000]   zhaoxin   Shanghai =20
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registe=
rs'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960 b=
ytes, using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000057fff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x0000000000058000-0x0000000000058fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000059000-0x000000000009dfff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000000009e000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000002bd32fff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000002bd33000-0x000000002bd33fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x000000002bd34000-0x000000002bd34fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000002bd35000-0x000000003d383fff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000003d384000-0x000000003d743fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000003d744000-0x000000003d7b4fff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x000000003d7b5000-0x000000003de6cfff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x000000003de6d000-0x000000003ff25fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000003ff26000-0x000000003fffefff] type =
20
[    0.000000] BIOS-e820: [mem 0x000000003ffff000-0x000000003fffffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x0000000040000000-0x0000000047ffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000048000000-0x0000000048dfffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x0000000048e00000-0x000000004f7fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000004ae7fffff] usabl=
e
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] efi: EFI v2.40 by American Megatrends
[    0.000000] efi:  ACPI=3D0x3d778000  ACPI 2.0=3D0x3d778000  SMBIOS=3D0xf=
0000  SMBIOS 3.0=3D0xf0020  TPMFinalLog=3D0x3de0e000  ESRT=3D0x3fdb5018  ME=
MATTR=3D0x3a848018=20
[    0.000000] SMBIOS 3.0.0 present.
[    0.000000] DMI: Dell Inc. XPS 13 9370/09DKKT, BIOS 1.11.1 07/11/2019
[    0.000000] tsc: Detected 2100.000 MHz processor
[    0.001024] tsc: Detected 2099.944 MHz TSC
[    0.001024] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.001025] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.001030] last_pfn =3D 0x4ae800 max_arch_pfn =3D 0x400000000
[    0.001034] MTRR default type: write-back
[    0.001035] MTRR fixed ranges enabled:
[    0.001035]   00000-9FFFF write-back
[    0.001036]   A0000-BFFFF uncachable
[    0.001037]   C0000-FFFFF write-protect
[    0.001037] MTRR variable ranges enabled:
[    0.001038]   0 base 0080000000 mask 7F80000000 uncachable
[    0.001039]   1 base 0060000000 mask 7FE0000000 uncachable
[    0.001039]   2 base 0050000000 mask 7FF0000000 uncachable
[    0.001040]   3 base 004C000000 mask 7FFC000000 uncachable
[    0.001040]   4 base 004B000000 mask 7FFF000000 uncachable
[    0.001040]   5 disabled
[    0.001041]   6 disabled
[    0.001041]   7 disabled
[    0.001041]   8 disabled
[    0.001041]   9 disabled
[    0.001354] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.001748] last_pfn =3D 0x48e00 max_arch_pfn =3D 0x400000000
[    0.007152] esrt: Reserving ESRT space from 0x000000003fdb5018 to 0x0000=
00003fdb5050.
[    0.007156] check: Scanning 1 areas for low memory corruption
[    0.007161] Using GB pages for direct mapping
[    0.007162] BRK [0x322401000, 0x322401fff] PGTABLE
[    0.007163] BRK [0x322402000, 0x322402fff] PGTABLE
[    0.007164] BRK [0x322403000, 0x322403fff] PGTABLE
[    0.007189] BRK [0x322404000, 0x322404fff] PGTABLE
[    0.007190] BRK [0x322405000, 0x322405fff] PGTABLE
[    0.007279] BRK [0x322406000, 0x322406fff] PGTABLE
[    0.007320] BRK [0x322407000, 0x322407fff] PGTABLE
[    0.007340] BRK [0x322408000, 0x322408fff] PGTABLE
[    0.007350] BRK [0x322409000, 0x322409fff] PGTABLE
[    0.007393] Secure boot could not be determined
[    0.007394] RAMDISK: [mem 0x26fbe000-0x27b18fff]
[    0.007399] ACPI: Early table checksum verification disabled
[    0.007403] ACPI: RSDP 0x000000003D778000 000024 (v02 DELL  )
[    0.007405] ACPI: XSDT 0x000000003D7780C8 00010C (v01 DELL   CBX3     01=
072009 AMI  00010013)
[    0.007409] ACPI: FACP 0x000000003D79E9D8 00010C (v05 DELL   CBX3     01=
072009 AMI  00010013)
[    0.007413] ACPI: DSDT 0x000000003D778260 026773 (v02 DELL   CBX3     01=
072009 INTL 20160422)
[    0.007415] ACPI: FACS 0x000000003DE6A180 000040
[    0.007417] ACPI: APIC 0x000000003D79EAE8 0000BC (v03 DELL   CBX3     01=
072009 AMI  00010013)
[    0.007419] ACPI: FPDT 0x000000003D79EBA8 000044 (v01 DELL   CBX3     01=
072009 AMI  00010013)
[    0.007420] ACPI: FIDT 0x000000003D79EBF0 0000AC (v01 DELL   CBX3     01=
072009 AMI  00010013)
[    0.007422] ACPI: MCFG 0x000000003D79ECA0 00003C (v01 DELL   CBX3     01=
072009 MSFT 00000097)
[    0.007424] ACPI: HPET 0x000000003D79ECE0 000038 (v01 DELL   CBX3     01=
072009 AMI. 0005000B)
[    0.007426] ACPI: SSDT 0x000000003D79ED18 000359 (v01 SataRe SataTabl 00=
001000 INTL 20160422)
[    0.007428] ACPI: BOOT 0x000000003D79F078 000028 (v01 DELL   CBX3     01=
072009 AMI  00010013)
[    0.007429] ACPI: SSDT 0x000000003D79F0A0 0012DE (v02 SaSsdt SaSsdt   00=
003000 INTL 20160422)
[    0.007431] ACPI: HPET 0x000000003D7A0380 000038 (v01 INTEL  KBL-ULT  00=
000001 MSFT 0000005F)
[    0.007433] ACPI: SSDT 0x000000003D7A03B8 000CEF (v02 INTEL  xh_rvp07 00=
000000 INTL 20160422)
[    0.007435] ACPI: UEFI 0x000000003D7A10A8 000042 (v01                 00=
000000      00000000)
[    0.007437] ACPI: SSDT 0x000000003D7A10F0 0017AE (v02 CpuRef CpuSsdt  00=
003000 INTL 20160422)
[    0.007439] ACPI: LPIT 0x000000003D7A28A0 000094 (v01 INTEL  KBL-ULT  00=
000000 MSFT 0000005F)
[    0.007441] ACPI: SSDT 0x000000003D7A2938 000161 (v02 INTEL  HdaDsp   00=
000000 INTL 20160422)
[    0.007443] ACPI: SSDT 0x000000003D7A2AA0 00029F (v02 INTEL  sensrhub 00=
000000 INTL 20160422)
[    0.007444] ACPI: SSDT 0x000000003D7A2D40 003002 (v02 INTEL  PtidDevc 00=
001000 INTL 20160422)
[    0.007446] ACPI: SSDT 0x000000003D7A5D48 000517 (v02 INTEL  TbtTypeC 00=
000000 INTL 20160422)
[    0.007448] ACPI: DBGP 0x000000003D7A6260 000034 (v01 INTEL           00=
000002 MSFT 0000005F)
[    0.007450] ACPI: DBG2 0x000000003D7A6298 000054 (v00 INTEL           00=
000002 MSFT 0000005F)
[    0.007452] ACPI: SSDT 0x000000003D7A62F0 000801 (v02 INTEL  UsbCTabl 00=
001000 INTL 20160422)
[    0.007454] ACPI: SSDT 0x000000003D7A6AF8 00CFC3 (v02 DptfTa DptfTabl 00=
001000 INTL 20160422)
[    0.007455] ACPI: MSDM 0x000000003D7B3AC0 000055 (v03 DELL   CBX3     06=
222004 AMI  00010013)
[    0.007457] ACPI: SLIC 0x000000003D7B3B18 000176 (v03 DELL   CBX3     01=
072009 MSFT 00010013)
[    0.007459] ACPI: NHLT 0x000000003D7B3C90 00002D (v00 INTEL  EDK2     00=
000002      01000013)
[    0.007461] ACPI: TPM2 0x000000003D7B3CC0 000034 (v03 DELL   CBX3     00=
000001 AMI  00000000)
[    0.007463] ACPI: ASF! 0x000000003D7B3CF8 0000A0 (v32 INTEL   HCG     00=
000001 TFSM 000F4240)
[    0.007464] ACPI: DMAR 0x000000003D7B3D98 0000F0 (v01 INTEL  KBL      00=
000001 INTL 00000001)
[    0.007466] ACPI: BGRT 0x000000003D7B3E88 000038 (v00                 01=
072009 AMI  00010013)
[    0.007472] ACPI: Local APIC address 0xfee00000
[    0.007624] No NUMA configuration found
[    0.007625] Faking a node at [mem 0x0000000000000000-0x00000004ae7fffff]
[    0.007632] NODE_DATA(0) allocated [mem 0x4ae7d6000-0x4ae7fffff]
[    0.007827] Zone ranges:
[    0.007828]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.007829]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.007829]   Normal   [mem 0x0000000100000000-0x00000004ae7fffff]
[    0.007830]   Device   empty
[    0.007831] Movable zone start for each node
[    0.007833] Early memory node ranges
[    0.007834]   node   0: [mem 0x0000000000001000-0x0000000000057fff]
[    0.007835]   node   0: [mem 0x0000000000059000-0x000000000009dfff]
[    0.007835]   node   0: [mem 0x0000000000100000-0x000000002bd32fff]
[    0.007836]   node   0: [mem 0x000000002bd35000-0x000000003d383fff]
[    0.007836]   node   0: [mem 0x000000003ffff000-0x000000003fffffff]
[    0.007837]   node   0: [mem 0x0000000048000000-0x0000000048dfffff]
[    0.007837]   node   0: [mem 0x0000000100000000-0x00000004ae7fffff]
[    0.008118] Zeroed struct page in unavailable ranges: 46817 pages
[    0.008119] Initmem setup node 0 [mem 0x0000000000001000-0x00000004ae7ff=
fff]
[    0.008120] On node 0 totalpages: 4114719
[    0.008121]   DMA zone: 64 pages used for memmap
[    0.008121]   DMA zone: 22 pages reserved
[    0.008122]   DMA zone: 3996 pages, LIFO batch:0
[    0.008158]   DMA32 zone: 3911 pages used for memmap
[    0.008158]   DMA32 zone: 250243 pages, LIFO batch:63
[    0.011048]   Normal zone: 60320 pages used for memmap
[    0.011048]   Normal zone: 3860480 pages, LIFO batch:63
[    0.048165] Reserving Intel graphics memory at [mem 0x4b800000-0x4f7ffff=
f]
[    0.048740] ACPI: PM-Timer IO Port: 0x1808
[    0.048741] ACPI: Local APIC address 0xfee00000
[    0.048746] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.048747] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.048747] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.048748] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.048748] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.048749] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.048750] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.048750] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.048777] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-=
119
[    0.048778] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.048780] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.048781] ACPI: IRQ0 used by override.
[    0.048781] ACPI: IRQ9 used by override.
[    0.048783] Using ACPI (MADT) for SMP configuration information
[    0.048784] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.048789] e820: update [mem 0x39d4d000-0x39dc0fff] usable =3D=3D> rese=
rved
[    0.048795] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.048811] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.048812] PM: hibernation: Registered nosave memory: [mem 0x00058000-0=
x00058fff]
[    0.048813] PM: hibernation: Registered nosave memory: [mem 0x0009e000-0=
x000fffff]
[    0.048814] PM: hibernation: Registered nosave memory: [mem 0x2bd33000-0=
x2bd33fff]
[    0.048815] PM: hibernation: Registered nosave memory: [mem 0x2bd34000-0=
x2bd34fff]
[    0.048816] PM: hibernation: Registered nosave memory: [mem 0x39d4d000-0=
x39dc0fff]
[    0.048817] PM: hibernation: Registered nosave memory: [mem 0x3d384000-0=
x3d743fff]
[    0.048818] PM: hibernation: Registered nosave memory: [mem 0x3d744000-0=
x3d7b4fff]
[    0.048818] PM: hibernation: Registered nosave memory: [mem 0x3d7b5000-0=
x3de6cfff]
[    0.048819] PM: hibernation: Registered nosave memory: [mem 0x3de6d000-0=
x3ff25fff]
[    0.048820] PM: hibernation: Registered nosave memory: [mem 0x3ff26000-0=
x3fffefff]
[    0.048821] PM: hibernation: Registered nosave memory: [mem 0x40000000-0=
x47ffffff]
[    0.048822] PM: hibernation: Registered nosave memory: [mem 0x48e00000-0=
x4f7fffff]
[    0.048823] PM: hibernation: Registered nosave memory: [mem 0x4f800000-0=
xdfffffff]
[    0.048823] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0=
xefffffff]
[    0.048824] PM: hibernation: Registered nosave memory: [mem 0xf0000000-0=
xfdffffff]
[    0.048824] PM: hibernation: Registered nosave memory: [mem 0xfe000000-0=
xfe010fff]
[    0.048825] PM: hibernation: Registered nosave memory: [mem 0xfe011000-0=
xfebfffff]
[    0.048825] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0=
xfec00fff]
[    0.048826] PM: hibernation: Registered nosave memory: [mem 0xfec01000-0=
xfedfffff]
[    0.048826] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0=
xfee00fff]
[    0.048827] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0=
xfeffffff]
[    0.048827] PM: hibernation: Registered nosave memory: [mem 0xff000000-0=
xffffffff]
[    0.048829] [mem 0x4f800000-0xdfffffff] available for PCI devices
[    0.048829] Booting paravirtualized kernel on bare hardware
[    0.048832] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 7645519600211568 ns
[    0.048837] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr=
_node_ids:1
[    0.049035] percpu: Embedded 57 pages/cpu s196608 r8192 d28672 u262144
[    0.049040] pcpu-alloc: s196608 r8192 d28672 u262144 alloc=3D1*2097152
[    0.049040] pcpu-alloc: [0] 0 1 2 3 4 5 6 7=20
[    0.049060] Built 1 zonelists, mobility grouping on.  Total pages: 40504=
02
[    0.049061] Policy zone: Normal
[    0.049062] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-5.7-rc3 root=
=3DUUID=3De9880a1b-a4f2-4779-8a98-6c1bee968ebe rw sysrq_always_enabled audi=
t=3D0 pcie_ports=3Dnative pci=3Dassign-busses,hpbussize=3D0x33,hpmemsize=3D=
16K,hpiosize=3D0,hpmmiosize=3D400M,hpmmioprefsize=3D64G,nocrs,realloc intel=
_iommu=3Don iommu=3Don video=3Dvesafb:off
[    0.049108] sysrq: sysrq always enabled.
[    0.049117] audit: disabled (until reboot)
[    0.049167] DMAR: IOMMU enabled
[    0.050259] Dentry cache hash table entries: 2097152 (order: 12, 1677721=
6 bytes, linear)
[    0.050809] Inode-cache hash table entries: 1048576 (order: 11, 8388608 =
bytes, linear)
[    0.050867] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.097683] Memory: 16014372K/16458876K available (14339K kernel code, 2=
527K rwdata, 4992K rodata, 2588K init, 4988K bss, 444504K reserved, 0K cma-=
reserved)
[    0.097692] random: get_random_u64 called from __kmem_cache_create+0x42/=
0x540 with crng_init=3D0
[    0.097782] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, N=
odes=3D1
[    0.097793] Kernel/User page tables isolation: enabled
[    0.097809] ftrace: allocating 44939 entries in 176 pages
[    0.110376] ftrace: allocated 176 pages with 3 groups
[    0.110473] rcu: Hierarchical RCU implementation.
[    0.110474] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_ids=
=3D8.
[    0.110475] 	Tasks RCU enabled.
[    0.110475] rcu: RCU calculated value of scheduler-enlistment delay is 2=
5 jiffies.
[    0.110476] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D8
[    0.112848] NR_IRQS: 524544, nr_irqs: 2048, preallocated irqs: 16
[    0.113111] random: crng done (trusting CPU's manufacturer)
[    0.113143] spurious 8259A interrupt: IRQ7.
[    0.113167] Console: colour dummy device 80x25
[    0.113324] printk: console [tty0] enabled
[    0.113338] ACPI: Core revision 20200326
[    0.113584] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 79635855245 ns
[    0.113687] APIC: Switch to symmetric I/O mode setup
[    0.113689] DMAR: Host address width 39
[    0.113691] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.113696] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660=
462 ecap 19e2ff0505e
[    0.113698] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.113701] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c406604=
62 ecap f050da
[    0.113703] DMAR: RMRR base: 0x0000003d45f000 end: 0x0000003d47efff
[    0.113705] DMAR: RMRR base: 0x0000004b000000 end: 0x0000004f7fffff
[    0.113707] DMAR: ANDD device: 1 name: \_SB.PCI0.I2C0
[    0.113708] DMAR: ANDD device: 2 name: \_SB.PCI0.I2C1
[    0.113710] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.113711] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.113712] DMAR-IR: Queued invalidation will be enabled to support x2ap=
ic and Intr-remapping.
[    0.115511] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.115513] x2apic enabled
[    0.115525] Switched APIC routing to cluster x2apic.
[    0.119661] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.137762] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x1e44fb6c2ab, max_idle_ns: 440795206594 ns
[    0.137767] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 4199.88 BogoMIPS (lpj=3D8399776)
[    0.137770] pid_max: default: 32768 minimum: 301
[    0.139499] LSM: Security Framework initializing
[    0.139506] Yama: becoming mindful.
[    0.139527] AppArmor: AppArmor initialized
[    0.139580] Mount-cache hash table entries: 32768 (order: 6, 262144 byte=
s, linear)
[    0.139612] Mountpoint-cache hash table entries: 32768 (order: 6, 262144=
 bytes, linear)
[    0.139816] mce: CPU0: Thermal monitoring enabled (TM1)
[    0.139833] process: using mwait in idle threads
[    0.139836] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.139837] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.139840] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.139842] Spectre V2 : Mitigation: Full generic retpoline
[    0.139843] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.139844] Spectre V2 : Enabling Restricted Speculation for firmware ca=
lls
[    0.139846] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.139848] Spectre V2 : User space: Mitigation: STIBP via seccomp and p=
rctl
[    0.139849] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl and seccomp
[    0.139853] TAA: Mitigation: Clear CPU buffers
[    0.139854] MDS: Mitigation: Clear CPU buffers
[    0.140043] Freeing SMP alternatives memory: 40K
[    0.141828] TSC deadline timer enabled
[    0.141833] smpboot: CPU0: Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz (fam=
ily: 0x6, model: 0x8e, stepping: 0xa)
[    0.141908] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR,=
 full-width counters, Intel PMU driver.
[    0.141915] ... version:                4
[    0.141915] ... bit width:              48
[    0.141916] ... generic registers:      4
[    0.141917] ... value mask:             0000ffffffffffff
[    0.141918] ... max period:             00007fffffffffff
[    0.141919] ... fixed-purpose events:   3
[    0.141920] ... event mask:             000000070000000f
[    0.141949] rcu: Hierarchical SRCU implementation.
[    0.142722] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.142778] smp: Bringing up secondary CPUs ...
[    0.142836] x86: Booting SMP configuration:
[    0.142838] .... node  #0, CPUs:      #1 #2 #3 #4
[    0.146473] MDS CPU bug present and SMT on, data leak possible. See http=
s://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more de=
tails.
[    0.146473] TAA CPU bug present and SMT on, data leak possible. See http=
s://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/tsx_async_abort.html=
 for more details.
[    0.146473]  #5 #6 #7
[    0.146687] smp: Brought up 1 node, 8 CPUs
[    0.146687] smpboot: Max logical packages: 1
[    0.146687] smpboot: Total of 8 processors activated (33599.10 BogoMIPS)
[    0.150180] devtmpfs: initialized
[    0.150180] x86/mm: Memory block size: 128MB
[    0.150812] PM: Registering ACPI NVS region [mem 0x2bd33000-0x2bd33fff] =
(4096 bytes)
[    0.150812] PM: Registering ACPI NVS region [mem 0x3d7b5000-0x3de6cfff] =
(7045120 bytes)
[    0.150812] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.150812] futex hash table entries: 2048 (order: 5, 131072 bytes, line=
ar)
[    0.150812] pinctrl core: initialized pinctrl subsystem
[    0.150812] PM: RTC time: 09:47:02, date: 2020-04-29
[    0.150812] thermal_sys: Registered thermal governor 'fair_share'
[    0.150812] thermal_sys: Registered thermal governor 'bang_bang'
[    0.150812] thermal_sys: Registered thermal governor 'step_wise'
[    0.150812] thermal_sys: Registered thermal governor 'user_space'
[    0.150812] NET: Registered protocol family 16
[    0.150812] EISA bus registered
[    0.150812] cpuidle: using governor ladder
[    0.150812] cpuidle: using governor menu
[    0.150812] Simple Boot Flag at 0x47 set to 0x80
[    0.150812] ACPI FADT declares the system doesn't support PCIe ASPM, so =
disable it
[    0.150812] ACPI: bus type PCI registered
[    0.150812] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.150812] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000=
-0xefffffff] (base 0xe0000000)
[    0.150812] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E82=
0
[    0.150812] PCI: Using configuration type 1 for base access
[    0.150812] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.153790] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.153790] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.153819] ACPI: Added _OSI(Module Device)
[    0.153820] ACPI: Added _OSI(Processor Device)
[    0.153822] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.153823] ACPI: Added _OSI(Processor Aggregator Device)
[    0.153824] ACPI: Added _OSI(Linux-Dell-Video)
[    0.153825] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.153827] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.188806] ACPI: 11 ACPI AML tables successfully acquired and loaded
[    0.193719] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.199556] ACPI: Dynamic OEM Table Load:
[    0.199562] ACPI: SSDT 0xFFFF9FDB9B8F1800 0005EE (v02 PmRef  Cpu0Ist  00=
003000 INTL 20160422)
[    0.200697] ACPI: \_PR_.PR00: _OSC native thermal LVT Acked
[    0.201542] ACPI: Dynamic OEM Table Load:
[    0.201546] ACPI: SSDT 0xFFFF9FDB9B882000 0003FF (v02 PmRef  Cpu0Cst  00=
003001 INTL 20160422)
[    0.202640] ACPI: Dynamic OEM Table Load:
[    0.202644] ACPI: SSDT 0xFFFF9FDB9BB53240 0000BA (v02 PmRef  Cpu0Hwp  00=
003000 INTL 20160422)
[    0.203672] ACPI: Dynamic OEM Table Load:
[    0.203676] ACPI: SSDT 0xFFFF9FDB9B8F1000 000628 (v02 PmRef  HwpLvt   00=
003000 INTL 20160422)
[    0.205016] ACPI: Dynamic OEM Table Load:
[    0.205022] ACPI: SSDT 0xFFFF9FDB9BC29000 000D14 (v02 PmRef  ApIst    00=
003000 INTL 20160422)
[    0.206691] ACPI: Dynamic OEM Table Load:
[    0.206695] ACPI: SSDT 0xFFFF9FDB9B880400 000317 (v02 PmRef  ApHwp    00=
003000 INTL 20160422)
[    0.207829] ACPI: Dynamic OEM Table Load:
[    0.207833] ACPI: SSDT 0xFFFF9FDB9B884000 00030A (v02 PmRef  ApCst    00=
003000 INTL 20160422)
[    0.211074] ACPI: EC: EC started
[    0.211076] ACPI: EC: interrupt blocked
[    0.221834] ACPI: EC: EC_CMD/EC_SC=3D0x934, EC_DATA=3D0x930
[    0.221837] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC used to handle tran=
sactions
[    0.221838] ACPI: Interpreter enabled
[    0.221872] ACPI: (supports S0 S3 S4 S5)
[    0.221873] ACPI: Using IOAPIC for interrupt routing
[    0.221904] PCI: Ignoring host bridge windows from ACPI; if necessary, u=
se "pci=3Duse_crs" and report a bug
[    0.222439] ACPI: Enabled 8 GPEs in block 00 to 7F
[    0.228708] ACPI: Power Resource [WRST] (on)
[    0.246771] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.246777] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI HPX-Type3]
[    0.247085] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplu=
g SHPCHotplug PME AER]
[    0.247378] acpi PNP0A08:00: _OSC: OS now controls [PCIeCapability LTR]
[    0.247379] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using B=
IOS configuration
[    0.247632] acpi PNP0A08:00: host bridge window [io  0x0000-0x0cf7 windo=
w] (ignored)
[    0.247632] acpi PNP0A08:00: host bridge window [io  0x0cf8-0x0cff] (ign=
ored)
[    0.247633] acpi PNP0A08:00: host bridge window [io  0x0d00-0xffff windo=
w] (ignored)
[    0.247634] acpi PNP0A08:00: host bridge window [mem 0x000a0000-0x000bff=
ff window] (ignored)
[    0.247634] acpi PNP0A08:00: host bridge window [mem 0x000c0000-0x000c3f=
ff window] (ignored)
[    0.247635] acpi PNP0A08:00: host bridge window [mem 0x000c4000-0x000c7f=
ff window] (ignored)
[    0.247635] acpi PNP0A08:00: host bridge window [mem 0x000c8000-0x000cbf=
ff window] (ignored)
[    0.247636] acpi PNP0A08:00: host bridge window [mem 0x000cc000-0x000cff=
ff window] (ignored)
[    0.247636] acpi PNP0A08:00: host bridge window [mem 0x000d0000-0x000d3f=
ff window] (ignored)
[    0.247637] acpi PNP0A08:00: host bridge window [mem 0x000d4000-0x000d7f=
ff window] (ignored)
[    0.247638] acpi PNP0A08:00: host bridge window [mem 0x000d8000-0x000dbf=
ff window] (ignored)
[    0.247638] acpi PNP0A08:00: host bridge window [mem 0x000dc000-0x000dff=
ff window] (ignored)
[    0.247639] acpi PNP0A08:00: host bridge window [mem 0x4f800000-0xdfffff=
ff window] (ignored)
[    0.247639] acpi PNP0A08:00: host bridge window [mem 0xfd000000-0xfe7fff=
ff window] (ignored)
[    0.247640] PCI: root bus 00: using default resources
[    0.247969] PCI host bridge to bus 0000:00
[    0.247971] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    0.247972] pci_bus 0000:00: root bus resource [mem 0x00000000-0x7ffffff=
fff]
[    0.247974] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.247982] pci 0000:00:00.0: [8086:5914] type 00 class 0x060000
[    0.248086] pci 0000:00:02.0: [8086:5917] type 00 class 0x030000
[    0.248096] pci 0000:00:02.0: reg 0x10: [mem 0xdb000000-0xdbffffff 64bit=
]
[    0.248102] pci 0000:00:02.0: reg 0x18: [mem 0x50000000-0x5fffffff 64bit=
 pref]
[    0.248106] pci 0000:00:02.0: reg 0x20: [io  0xf000-0xf03f]
[    0.248118] pci 0000:00:02.0: BAR 2: assigned to efifb
[    0.248232] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000
[    0.248243] pci 0000:00:04.0: reg 0x10: [mem 0xdc320000-0xdc327fff 64bit=
]
[    0.248432] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
[    0.248453] pci 0000:00:14.0: reg 0x10: [mem 0xdc310000-0xdc31ffff 64bit=
]
[    0.248509] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.248686] pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
[    0.248706] pci 0000:00:14.2: reg 0x10: [mem 0xdc335000-0xdc335fff 64bit=
]
[    0.248913] pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000
[    0.248986] pci 0000:00:15.0: reg 0x10: [mem 0xdc334000-0xdc334fff 64bit=
]
[    0.249225] pci 0000:00:15.1: [8086:9d61] type 00 class 0x118000
[    0.249270] pci 0000:00:15.1: reg 0x10: [mem 0xdc333000-0xdc333fff 64bit=
]
[    0.249501] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
[    0.249517] pci 0000:00:16.0: reg 0x10: [mem 0xdc332000-0xdc332fff 64bit=
]
[    0.249561] pci 0000:00:16.0: PME# supported from D3hot
[    0.249689] pci 0000:00:16.3: [8086:9d3d] type 00 class 0x070002
[    0.249702] pci 0000:00:16.3: reg 0x10: [io  0xf060-0xf067]
[    0.249707] pci 0000:00:16.3: reg 0x14: [mem 0xdc331000-0xdc331fff]
[    0.249849] pci 0000:00:1c.0: [8086:9d10] type 01 class 0x060400
[    0.249920] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.249940] pci 0000:00:1c.0: Intel SPT PCH root port ACS workaround ena=
bled
[    0.250096] pci 0000:00:1c.2: [8086:9d12] type 01 class 0x060400
[    0.250171] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.250190] pci 0000:00:1c.2: Intel SPT PCH root port ACS workaround ena=
bled
[    0.250341] pci 0000:00:1c.4: [8086:9d14] type 01 class 0x060400
[    0.250463] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.250482] pci 0000:00:1c.4: Intel SPT PCH root port ACS workaround ena=
bled
[    0.250635] pci 0000:00:1d.0: [8086:9d18] type 01 class 0x060400
[    0.250702] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.250719] pci 0000:00:1d.0: Intel SPT PCH root port ACS workaround ena=
bled
[    0.250890] pci 0000:00:1f.0: [8086:9d4e] type 00 class 0x060100
[    0.251068] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
[    0.251081] pci 0000:00:1f.2: reg 0x10: [mem 0xdc32c000-0xdc32ffff]
[    0.251225] pci 0000:00:1f.3: [8086:9d71] type 00 class 0x040380
[    0.251248] pci 0000:00:1f.3: reg 0x10: [mem 0xdc328000-0xdc32bfff 64bit=
]
[    0.251272] pci 0000:00:1f.3: reg 0x20: [mem 0xdc300000-0xdc30ffff 64bit=
]
[    0.251313] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.251506] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500
[    0.251568] pci 0000:00:1f.4: reg 0x10: [mem 0xdc330000-0xdc3300ff 64bit=
]
[    0.251639] pci 0000:00:1f.4: reg 0x20: [io  0xf040-0xf05f]
[    0.252219] pci 0000:01:00.0: [10ec:525a] type 00 class 0xff0000
[    0.252249] pci 0000:01:00.0: reg 0x14: [mem 0xdc200000-0xdc200fff]
[    0.252346] pci 0000:01:00.0: supports D1 D2
[    0.252347] pci 0000:01:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.252661] pci 0000:00:1c.0: PCI bridge to [bus 01-fe]
[    0.252665] pci 0000:00:1c.0:   bridge window [mem 0xdc200000-0xdc2fffff=
]
[    0.252670] pci_bus 0000:01: busn_res: [bus 01-fe] end is updated to 01
[    0.253052] pci 0000:02:00.0: [8086:24fd] type 00 class 0x028000
[    0.253146] pci 0000:02:00.0: reg 0x10: [mem 0xdc100000-0xdc101fff 64bit=
]
[    0.253407] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.253915] pci 0000:00:1c.2: PCI bridge to [bus 02-fe]
[    0.253919] pci 0000:00:1c.2:   bridge window [mem 0xdc100000-0xdc1fffff=
]
[    0.253924] pci_bus 0000:02: busn_res: [bus 02-fe] end is updated to 02
[    0.254013] pci 0000:00:1c.4: PCI bridge to [bus 03-fe]
[    0.254018] pci 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0fffff=
]
[    0.254022] pci 0000:00:1c.4:   bridge window [mem 0x60000000-0xa9ffffff=
 64bit pref]
[    0.254024] pci_bus 0000:03: busn_res: [bus 03-fe] end is updated to 35
[    0.254107] pci 0000:36:00.0: [1179:0116] type 00 class 0x010802
[    0.254132] pci 0000:36:00.0: reg 0x10: [mem 0xdc000000-0xdc003fff 64bit=
]
[    0.254338] pci 0000:00:1d.0: PCI bridge to [bus 36-fe]
[    0.254342] pci 0000:00:1d.0:   bridge window [mem 0xdc000000-0xdc0fffff=
]
[    0.254346] pci_bus 0000:36: busn_res: [bus 36-fe] end is updated to 36
[    0.255828] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 1=
5)
[    0.255878] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 1=
5)
[    0.255926] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 1=
5)
[    0.255974] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 1=
5)
[    0.256022] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 1=
5)
[    0.256069] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 1=
5)
[    0.256117] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 1=
5)
[    0.256165] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 1=
5)
[    0.268527] ACPI: EC: interrupt unblocked
[    0.268528] ACPI: EC: event unblocked
[    0.268536] ACPI: EC: EC_CMD/EC_SC=3D0x934, EC_DATA=3D0x930
[    0.268537] ACPI: EC: GPE=3D0x6e
[    0.268538] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC initialization comp=
lete
[    0.268540] ACPI: \_SB_.PCI0.LPCB.ECDV: EC: Used to handle transactions =
and events
[    0.268598] iommu: Default domain type: Translated=20
[    0.268598] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.268598] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    0.268598] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.268598] vgaarb: loaded
[    0.270070] SCSI subsystem initialized
[    0.270083] libata version 3.00 loaded.
[    0.270083] ACPI: bus type USB registered
[    0.270083] usbcore: registered new interface driver usbfs
[    0.270083] usbcore: registered new interface driver hub
[    0.270083] usbcore: registered new device driver usb
[    0.270083] pps_core: LinuxPPS API ver. 1 registered
[    0.270083] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.270083] PTP clock support registered
[    0.270083] EDAC MC: Ver: 3.0.0
[    0.270481] Registered efivars operations
[    0.270481] PCI: Using ACPI for IRQ routing
[    0.296179] PCI: pci_cache_line_size set to 64 bytes
[    0.297376] e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]
[    0.297377] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
[    0.297378] e820: reserve RAM buffer [mem 0x2bd33000-0x2bffffff]
[    0.297378] e820: reserve RAM buffer [mem 0x39d4d000-0x3bffffff]
[    0.297379] e820: reserve RAM buffer [mem 0x3d384000-0x3fffffff]
[    0.297379] e820: reserve RAM buffer [mem 0x48e00000-0x4bffffff]
[    0.297380] e820: reserve RAM buffer [mem 0x4ae800000-0x4afffffff]
[    0.297453] NetLabel: Initializing
[    0.297455] NetLabel:  domain hash size =3D 128
[    0.297456] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.297467] NetLabel:  unlabeled traffic allowed by default
[    0.298117] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.298120] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    0.300173] clocksource: Switched to clocksource tsc-early
[    0.306669] VFS: Disk quotas dquot_6.6.0
[    0.306686] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.306765] AppArmor: AppArmor Filesystem Enabled
[    0.306794] pnp: PnP ACPI init
[    0.307076] system 00:00: [io  0x0680-0x069f] has been reserved
[    0.307078] system 00:00: [io  0xffff] has been reserved
[    0.307080] system 00:00: [io  0xffff] has been reserved
[    0.307081] system 00:00: [io  0xffff] has been reserved
[    0.307083] system 00:00: [io  0x1800-0x18fe] has been reserved
[    0.307084] system 00:00: [io  0x164e-0x164f] has been reserved
[    0.307089] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active=
)
[    0.307167] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.307196] system 00:02: [io  0x1854-0x1857] has been reserved
[    0.307199] system 00:02: Plug and Play ACPI device, IDs INT3f0d PNP0c02=
 (active)
[    0.307306] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.307316] pnp 00:04: Plug and Play ACPI device, IDs DLL07e6 PNP0f13 (a=
ctive)
[    0.307523] system 00:05: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.307525] system 00:05: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.307527] system 00:05: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.307528] system 00:05: [mem 0xe0000000-0xefffffff] has been reserved
[    0.307530] system 00:05: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.307532] system 00:05: [mem 0xfed90000-0xfed93fff] could not be reser=
ved
[    0.307533] system 00:05: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.307535] system 00:05: [mem 0xff000000-0xffffffff] has been reserved
[    0.307537] system 00:05: [mem 0xfee00000-0xfeefffff] could not be reser=
ved
[    0.307538] system 00:05: [mem 0xdffe0000-0xdfffffff] has been reserved
[    0.307541] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active=
)
[    0.307572] system 00:06: [mem 0xfd000000-0xfdabffff] has been reserved
[    0.307574] system 00:06: [mem 0xfdad0000-0xfdadffff] has been reserved
[    0.307575] system 00:06: [mem 0xfdb00000-0xfdffffff] has been reserved
[    0.307577] system 00:06: [mem 0xfe000000-0xfe01ffff] could not be reser=
ved
[    0.307579] system 00:06: [mem 0xfe036000-0xfe03bfff] has been reserved
[    0.307580] system 00:06: [mem 0xfe03d000-0xfe3fffff] has been reserved
[    0.307582] system 00:06: [mem 0xfe410000-0xfe7fffff] has been reserved
[    0.307584] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active=
)
[    0.307819] system 00:07: [io  0xff00-0xfffe] has been reserved
[    0.307822] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active=
)
[    0.308748] system 00:08: [mem 0xfe029000-0xfe029fff] has been reserved
[    0.308750] system 00:08: [mem 0xfe028000-0xfe028fff] has been reserved
[    0.308753] system 00:08: Plug and Play ACPI device, IDs PNP0c02 (active=
)
[    0.312374] pnp: PnP ACPI: found 9 devices
[    0.317580] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.317601] pci_bus 0000:00: max bus depth: 1 pci_try_num: 2
[    0.317607] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.317613] pci 0000:00:1c.0:   bridge window [mem 0xdc200000-0xdc2fffff=
]
[    0.317619] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    0.317623] pci 0000:00:1c.2:   bridge window [mem 0xdc100000-0xdc1fffff=
]
[    0.317628] pci 0000:00:1c.4: PCI bridge to [bus 03-35]
[    0.317633] pci 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0fffff=
]
[    0.317636] pci 0000:00:1c.4:   bridge window [mem 0x60000000-0xa9ffffff=
 64bit pref]
[    0.317640] pci 0000:00:1d.0: PCI bridge to [bus 36]
[    0.317643] pci 0000:00:1d.0:   bridge window [mem 0xdc000000-0xdc0fffff=
]
[    0.317648] pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
[    0.317650] pci_bus 0000:00: resource 5 [mem 0x00000000-0x7fffffffff]
[    0.317651] pci_bus 0000:01: resource 1 [mem 0xdc200000-0xdc2fffff]
[    0.317653] pci_bus 0000:02: resource 1 [mem 0xdc100000-0xdc1fffff]
[    0.317654] pci_bus 0000:03: resource 1 [mem 0xac000000-0xda0fffff]
[    0.317656] pci_bus 0000:03: resource 2 [mem 0x60000000-0xa9ffffff 64bit=
 pref]
[    0.317658] pci_bus 0000:36: resource 1 [mem 0xdc000000-0xdc0fffff]
[    0.317779] NET: Registered protocol family 2
[    0.317891] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5,=
 131072 bytes, linear)
[    0.317984] TCP established hash table entries: 131072 (order: 8, 104857=
6 bytes, linear)
[    0.318119] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes,=
 linear)
[    0.318165] TCP: Hash tables configured (established 131072 bind 65536)
[    0.318262] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear=
)
[    0.318297] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, l=
inear)
[    0.318341] NET: Registered protocol family 1
[    0.318345] NET: Registered protocol family 44
[    0.318352] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    0.319148] PCI: CLS 0 bytes, default 64
[    0.319174] Trying to unpack rootfs image as initramfs...
[    0.403094] Freeing initrd memory: 11628K
[    0.403140] DMAR: ACPI device "device:75" under DMAR at fed91000 as 00:1=
5.0
[    0.403144] DMAR: ACPI device "device:76" under DMAR at fed91000 as 00:1=
5.1
[    0.403155] DMAR: No ATSR found
[    0.403191] DMAR: dmar0: Using Queued invalidation
[    0.403195] DMAR: dmar1: Using Queued invalidation
[    0.403561] pci 0000:00:00.0: Adding to iommu group 0
[    0.408841] pci 0000:00:02.0: Adding to iommu group 1
[    0.408889] pci 0000:00:04.0: Adding to iommu group 2
[    0.408953] pci 0000:00:14.0: Adding to iommu group 3
[    0.408960] pci 0000:00:14.2: Adding to iommu group 3
[    0.409000] pci 0000:00:15.0: Adding to iommu group 4
[    0.409007] pci 0000:00:15.1: Adding to iommu group 4
[    0.409061] pci 0000:00:16.0: Adding to iommu group 5
[    0.409068] pci 0000:00:16.3: Adding to iommu group 5
[    0.409108] pci 0000:00:1c.0: Adding to iommu group 6
[    0.409176] pci 0000:00:1c.2: Adding to iommu group 7
[    0.409219] pci 0000:00:1c.4: Adding to iommu group 8
[    0.409271] pci 0000:00:1d.0: Adding to iommu group 9
[    0.410497] pci 0000:00:1f.0: Adding to iommu group 10
[    0.410506] pci 0000:00:1f.2: Adding to iommu group 10
[    0.410514] pci 0000:00:1f.3: Adding to iommu group 10
[    0.410522] pci 0000:00:1f.4: Adding to iommu group 10
[    0.410577] pci 0000:01:00.0: Adding to iommu group 11
[    0.410622] pci 0000:02:00.0: Adding to iommu group 12
[    0.410673] pci 0000:36:00.0: Adding to iommu group 13
[    0.410899] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.412044] check: Scanning for low memory corruption every 60 seconds
[    0.413346] Initialise system trusted keyrings
[    0.413354] Key type blacklist registered
[    0.413374] workingset: timestamp_bits=3D36 max_order=3D22 bucket_order=
=3D0
[    0.414153] zbud: loaded
[    0.414322] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.414411] fuse: init (API version 7.31)
[    0.414508] integrity: Platform Keyring initialized
[    0.417374] Key type asymmetric registered
[    0.417375] Asymmetric key parser 'x509' registered
[    0.417381] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 244)
[    0.417412] io scheduler mq-deadline registered
[    0.417724] pcieport 0000:00:1c.0: PME: Signaling with IRQ 122
[    0.417771] pcieport 0000:00:1c.0: AER: enabled with IRQ 122
[    0.417950] pcieport 0000:00:1c.2: PME: Signaling with IRQ 123
[    0.417983] pcieport 0000:00:1c.2: AER: enabled with IRQ 123
[    0.418151] pcieport 0000:00:1c.4: PME: Signaling with IRQ 124
[    0.418182] pcieport 0000:00:1c.4: AER: enabled with IRQ 124
[    0.418201] pcieport 0000:00:1c.4: pciehp: Slot #8 AttnBtn- PwrCtrl- MRL=
- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActR=
ep+
[    0.418375] pcieport 0000:00:1d.0: PME: Signaling with IRQ 125
[    0.418404] pcieport 0000:00:1d.0: AER: enabled with IRQ 125
[    0.418464] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.418505] efifb: probing for efifb
[    0.418514] efifb: framebuffer at 0x50000000, using 3072k, total 3072k
[    0.418515] efifb: mode is 1024x768x32, linelength=3D4096, pages=3D1
[    0.418516] efifb: scrolling: redraw
[    0.418517] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    0.418541] fb0: EFI VGA frame buffer device
[    0.418546] intel_idle: MWAIT substates: 0x11142120
[    0.418546] intel_idle: v0.5.1 model 0x8E
[    0.418824] intel_idle: Local APIC timer is reliable in all C-states
[    0.419749] ACPI: AC Adapter [AC] (on-line)
[    0.419800] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0=
D:00/input/input0
[    0.419823] ACPI: Lid Switch [LID0]
[    0.419842] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input1
[    0.419856] ACPI: Power Button [PBTN]
[    0.419871] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0E:00/input/input2
[    0.419879] ACPI: Sleep Button [SBTN]
[    0.419897] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input3
[    0.419909] ACPI: Power Button [PWRF]
[    0.422831] thermal LNXTHERM:00: registered as thermal_zone0
[    0.422833] ACPI: Thermal Zone [THM] (25 C)
[    0.423027] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.424025] serial 0000:00:16.3: enabling device (0000 -> 0003)
[    0.445076] 0000:00:16.3: ttyS4 at I/O 0xf060 (irq =3D 19, base_baud =3D=
 115200) is a 16550A
[    0.445959] Linux agpgart interface v0.103
[    0.452012] battery: ACPI: Battery Slot [BAT0] (battery present)
[    0.474194] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0xFC, rev-id 1)
[    0.525884] loop: module loaded
[    0.526338] libphy: Fixed MDIO Bus: probed
[    0.526342] tun: Universal TUN/TAP device driver, 1.6
[    0.526423] PPP generic driver version 2.4.2
[    0.526580] VFIO - User Level meta-driver version: 0.3
[    0.526776] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.526790] ehci-pci: EHCI PCI platform driver
[    0.526807] ehci-platform: EHCI generic platform driver
[    0.526824] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.526828] ohci-pci: OHCI PCI platform driver
[    0.526839] ohci-platform: OHCI generic platform driver
[    0.526849] uhci_hcd: USB Universal Host Controller Interface driver
[    0.527126] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.527135] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 1
[    0.528249] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x1=
00 quirks 0x0000000081109810
[    0.528517] xhci_hcd 0000:00:14.0: cache line size of 64 is not supporte=
d
[    0.528718] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.07
[    0.528723] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.528726] usb usb1: Product: xHCI Host Controller
[    0.528729] usb usb1: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[    0.528732] usb usb1: SerialNumber: 0000:00:14.0
[    0.528911] hub 1-0:1.0: USB hub found
[    0.528931] hub 1-0:1.0: 12 ports detected
[    0.530652] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.530659] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 2
[    0.530664] xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
[    0.530704] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.07
[    0.530708] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.530711] usb usb2: Product: xHCI Host Controller
[    0.530713] usb usb2: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[    0.530716] usb usb2: SerialNumber: 0000:00:14.0
[    0.530908] hub 2-0:1.0: USB hub found
[    0.530922] hub 2-0:1.0: 6 ports detected
[    0.531364] usb: port power management may be unreliable
[    0.531866] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0=
x60,0x64 irq 1,12
[    0.532292] i8042: Warning: Keylock active
[    0.533637] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.533640] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.533729] mousedev: PS/2 mouse device common for all mice
[    0.533969] rtc_cmos 00:01: RTC can wake from S4
[    0.534545] rtc_cmos 00:01: registered as rtc0
[    0.534700] rtc_cmos 00:01: setting system clock to 2020-04-29T09:47:02 =
UTC (1588153622)
[    0.534725] rtc_cmos 00:01: alarms up to one month, y3k, 242 bytes nvram
[    0.534729] i2c /dev entries driver
[    0.534775] device-mapper: uevent: version 1.0.3
[    0.534824] device-mapper: ioctl: 4.42.0-ioctl (2020-02-27) initialised:=
 dm-devel@redhat.com
[    0.534835] platform eisa.0: Probing EISA bus 0
[    0.534844] platform eisa.0: Cannot allocate resource for EISA slot 1
[    0.534882] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input4
[    0.536170] platform eisa.0: EISA: Detected 0 cards
[    0.536173] intel_pstate: Intel P-state driver initializing
[    0.536782] intel_pstate: HWP enabled
[    0.536891] ledtrig-cpu: registered to indicate activity on CPUs
[    0.536895] EFI Variables Facility v0.08 2004-May-17
[    0.767877] intel_pmc_core INT33A1:00:  initialized
[    0.767959] drop_monitor: Initializing network drop monitor service
[    0.768074] NET: Registered protocol family 10
[    0.773512] Segment Routing with IPv6
[    0.773531] NET: Registered protocol family 17
[    0.773559] Key type dns_resolver registered
[    0.773918] RAS: Correctable Errors collector initialized.
[    0.773982] microcode: sig=3D0x806ea, pf=3D0x80, revision=3D0xca
[    0.774135] microcode: Microcode Update Driver: v2.2.
[    0.774140] IPI shorthand broadcast: enabled
[    0.774146] sched_clock: Marking stable (773441279, 691530)->(781078640,=
 -6945831)
[    0.774271] registered taskstats version 1
[    0.774280] Loading compiled-in X.509 certificates
[    0.775668] Loaded X.509 cert 'Build time autogenerated kernel key: d54c=
e72edc400484e647ca51da6a4a87c88de3d3'
[    0.775695] zswap: loaded using pool lzo/zbud
[    0.775897] Key type ._fscrypt registered
[    0.775898] Key type .fscrypt registered
[    0.775899] Key type fscrypt-provisioning registered
[    0.780404] Key type big_key registered
[    0.780409] Key type trusted registered
[    0.783079] Key type encrypted registered
[    0.783083] AppArmor: AppArmor sha1 policy hashing enabled
[    0.784633] integrity: Loading X.509 certificate: UEFI:db
[    0.784652] integrity: Loaded X.509 cert 'Dell Inc. UEFI DB: 5ddb772dc88=
0660055ba0bc131886bb630a639e7'
[    0.784653] integrity: Loading X.509 certificate: UEFI:db
[    0.784668] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA =
2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    0.784669] integrity: Loading X.509 certificate: UEFI:db
[    0.784682] integrity: Loaded X.509 cert 'Microsoft Windows Production P=
CA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    0.786179] ima: Allocated hash algorithm: sha1
[    0.866092] usb 1-1: new low-speed USB device number 2 using xhci_hcd
[    0.874172] ima: No architecture policies found
[    0.874198] evm: Initialising EVM extended attributes:
[    0.874199] evm: security.selinux
[    0.874200] evm: security.SMACK64
[    0.874201] evm: security.SMACK64EXEC
[    0.874202] evm: security.SMACK64TRANSMUTE
[    0.874203] evm: security.SMACK64MMAP
[    0.874204] evm: security.apparmor
[    0.874204] evm: security.ima
[    0.874205] evm: security.capability
[    0.874206] evm: HMAC attrs: 0x1
[    0.875136] PM:   Magic number: 0:357:779
[    0.876457] Freeing unused decrypted memory: 2040K
[    0.876812] Freeing unused kernel image (initmem) memory: 2588K
[    0.876873] Write protecting the kernel read-only data: 22528k
[    0.877166] Freeing unused kernel image (text/rodata gap) memory: 2044K
[    0.877296] Freeing unused kernel image (rodata/data gap) memory: 1152K
[    0.903810] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    0.903812] x86/mm: Checking user space page tables
[    0.929901] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    0.929904] Run /init as init process
[    0.929905]   with arguments:
[    0.929906]     /init
[    0.929906]   with environment:
[    0.929906]     HOME=3D/
[    0.929907]     TERM=3Dlinux
[    0.929907]     BOOT_IMAGE=3D/boot/vmlinuz-5.7-rc3
[    0.929907]     intel_iommu=3Don
[    0.998028] usb 1-1: device descriptor read/64, error -71
[    1.234081] usb 1-1: device descriptor read/64, error -71
[    1.429826] tsc: Refined TSC clocksource calibration: 2111.991 MHz
[    1.429832] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x1e7=
16fff2bd, max_idle_ns: 440795203249 ns
[    1.429914] clocksource: Switched to clocksource tsc
[    1.473798] usb 1-1: new low-speed USB device number 3 using xhci_hcd
[    1.488151] rtsx_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    1.492044] nvme nvme0: pci function 0000:36:00.0
[    1.500773] nvme nvme0: 8/0/0 default/read/poll queues
[    1.502681]  nvme0n1: p1 p2 p3 p4 p5 p6 p7
[    1.602115] usb 1-1: device descriptor read/64, error -71
[    1.838213] usb 1-1: device descriptor read/64, error -71
[    1.946244] usb usb1-port1: attempt power cycle
[    2.598191] usb 1-1: new low-speed USB device number 4 using xhci_hcd
[    2.598918] usb 1-1: Device not responding to setup address.
[    2.806910] usb 1-1: Device not responding to setup address.
[    3.014195] usb 1-1: device not accepting address 4, error -71
[    3.142204] usb 1-1: new low-speed USB device number 5 using xhci_hcd
[    3.142941] usb 1-1: Device not responding to setup address.
[    3.350908] usb 1-1: Device not responding to setup address.
[    3.558195] usb 1-1: device not accepting address 5, error -71
[    3.558248] usb usb1-port1: unable to enumerate USB device
[    3.686198] usb 1-5: new high-speed USB device number 6 using xhci_hcd
[    3.882696] usb 1-5: New USB device found, idVendor=3D0bda, idProduct=3D=
58f4, bcdDevice=3D76.05
[    3.882701] usb 1-5: New USB device strings: Mfr=3D3, Product=3D1, Seria=
lNumber=3D2
[    3.882702] usb 1-5: Product: Integrated_Webcam_HD
[    3.882704] usb 1-5: Manufacturer: CN0FFMHCLOG0081JB3LKA00
[    3.882705] usb 1-5: SerialNumber: 200901010001
[    4.014200] usb 1-7: new full-speed USB device number 7 using xhci_hcd
[    4.164798] usb 1-7: New USB device found, idVendor=3D8087, idProduct=3D=
0a2b, bcdDevice=3D 0.10
[    4.164802] usb 1-7: New USB device strings: Mfr=3D0, Product=3D0, Seria=
lNumber=3D0
[    4.294191] usb 1-10: new full-speed USB device number 8 using xhci_hcd
[    4.445465] usb 1-10: New USB device found, idVendor=3D27c6, idProduct=
=3D5385, bcdDevice=3D 1.00
[    4.445470] usb 1-10: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D3
[    4.445471] usb 1-10: Product: Goodix Fingerprint Device=20
[    4.445473] usb 1-10: Manufacturer: HTMicroelectronics
[    4.445474] usb 1-10: SerialNumber: HTK32
[    4.485312] EXT4-fs (nvme0n1p6): mounted filesystem with ordered data mo=
de. Opts: (null)
[    4.571839] systemd[1]: Inserted module 'autofs4'
[    4.590988] systemd[1]: systemd 245.5-2-arch running in system mode. (+P=
AM +AUDIT -SELINUX -IMA -APPARMOR +SMACK -SYSVINIT +UTMP +LIBCRYPTSETUP +GC=
RYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE=
2 default-hierarchy=3Dhybrid)
[    4.610212] systemd[1]: Detected architecture x86-64.
[    4.631099] systemd[1]: Set hostname to <nicholas-dell-linux>.
[    4.768034] systemd[1]: Created slice system-getty.slice.
[    4.768198] systemd[1]: Created slice system-modprobe.slice.
[    4.768328] systemd[1]: Created slice system-ppp.slice.
[    4.768495] systemd[1]: Created slice User and Session Slice.
[    4.768549] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[    4.768601] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[    4.768717] systemd[1]: Set up automount Arbitrary Executable File Forma=
ts File System Automount Point.
[    4.768747] systemd[1]: Reached target Local Encrypted Volumes.
[    4.768769] systemd[1]: Reached target Login Prompts.
[    4.768797] systemd[1]: Reached target Paths.
[    4.768819] systemd[1]: Reached target Remote File Systems.
[    4.768840] systemd[1]: Reached target Slices.
[    4.768864] systemd[1]: Reached target Swap.
[    4.768920] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    4.769132] systemd[1]: Listening on LVM2 metadata daemon socket.
[    4.769301] systemd[1]: Listening on LVM2 poll daemon socket.
[    4.770255] systemd[1]: Listening on Process Core Dump Socket.
[    4.770308] systemd[1]: Listening on initctl Compatibility Named Pipe.
[    4.772594] systemd[1]: Condition check resulted in Journal Audit Socket=
 being skipped.
[    4.772660] systemd[1]: Listening on Journal Socket (/dev/log).
[    4.772740] systemd[1]: Listening on Journal Socket.
[    4.772808] systemd[1]: Listening on udev Control Socket.
[    4.772862] systemd[1]: Listening on udev Kernel Socket.
[    4.773344] systemd[1]: Mounting Huge Pages File System...
[    4.773919] systemd[1]: Mounting POSIX Message Queue File System...
[    4.774541] systemd[1]: Mounting Kernel Debug File System...
[    4.775088] systemd[1]: Mounting Kernel Trace File System...
[    4.776139] systemd[1]: Mounting Temporary Directory (/tmp)...
[    4.776843] systemd[1]: Starting Create list of static device nodes for =
the current kernel...
[    4.777384] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots e=
tc. using dmeventd or progress polling...
[    4.777964] systemd[1]: Starting Load Kernel Module drm...
[    4.781279] systemd[1]: Condition check resulted in Set Up Additional Bi=
nary Formats being skipped.
[    4.781308] systemd[1]: Condition check resulted in File System Check on=
 Root Device being skipped.
[    4.782338] systemd[1]: Starting Journal Service...
[    4.783480] systemd[1]: Starting Load Kernel Modules...
[    4.784188] systemd[1]: Starting Remount Root and Kernel File Systems...
[    4.784744] systemd[1]: Starting udev Coldplug all Devices...
[    4.785910] systemd[1]: Mounted Huge Pages File System.
[    4.786036] systemd[1]: Mounted POSIX Message Queue File System.
[    4.786154] systemd[1]: Mounted Kernel Debug File System.
[    4.786251] systemd[1]: Mounted Kernel Trace File System.
[    4.786354] systemd[1]: Mounted Temporary Directory (/tmp).
[    4.786702] systemd[1]: Finished Create list of static device nodes for =
the current kernel.
[    4.787880] systemd[1]: modprobe@drm.service: Succeeded.
[    4.788087] systemd[1]: Finished Load Kernel Module drm.
[    4.792942] systemd[1]: Started LVM2 metadata daemon.
[    4.794498] EXT4-fs (nvme0n1p6): re-mounted. Opts: data=3Dordered
[    4.796805] systemd[1]: Finished Remount Root and Kernel File Systems.
[    4.796966] systemd[1]: Condition check resulted in First Boot Wizard be=
ing skipped.
[    4.798563] systemd[1]: Condition check resulted in Rebuild Hardware Dat=
abase being skipped.
[    4.799367] systemd[1]: Starting Load/Save Random Seed...
[    4.799433] systemd[1]: Condition check resulted in Create System Users =
being skipped.
[    4.800198] systemd[1]: Starting Create Static Device Nodes in /dev...
[    4.801010] systemd[1]: Finished Load Kernel Modules.
[    4.801970] systemd[1]: Mounting FUSE Control File System...
[    4.802870] systemd[1]: Mounting Kernel Configuration File System...
[    4.805285] systemd[1]: Starting Apply Kernel Variables...
[    4.807414] systemd[1]: Mounted FUSE Control File System.
[    4.807988] systemd[1]: Mounted Kernel Configuration File System.
[    4.811836] systemd[1]: Finished Load/Save Random Seed.
[    4.820609] systemd[1]: Finished Apply Kernel Variables.
[    4.821416] systemd[1]: Finished Create Static Device Nodes in /dev.
[    4.822081] systemd[1]: Starting udev Kernel Device Manager...
[    4.867268] systemd[1]: Finished udev Coldplug all Devices.
[    5.045324] systemd[1]: Started Journal Service.
[    5.057427] systemd-journald[296]: Received client request to flush runt=
ime journal.
[    5.177624] input: Intel HID events as /devices/platform/INT33D5:00/inpu=
t/input6
[    5.183084] intel-hid INT33D5:00: platform supports 5 button array
[    5.183151] input: Intel HID 5 button array as /devices/platform/INT33D5=
:00/input/input7
[    5.213276] hid: raw HID events driver (C) Jiri Kosina
[    5.213617] wmi_bus wmi_bus-PNP0C14:01: WQBC data block query control me=
thod not found
[    5.214762] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
[    5.216832] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[    5.217660] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[    5.218036] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    5.221721] intel_rapl_common: Found RAPL domain package
[    5.221727] intel_rapl_common: Found RAPL domain dram
[    5.222321] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    5.222357] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    5.222401] proc_thermal 0000:00:04.0: Creating sysfs group for PROC_THE=
RMAL_PCI
[    5.230399] pstore: Using crash dump compression: deflate
[    5.230734] input: PC Speaker as /devices/platform/pcspkr/input/input8
[    5.357542] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    5.362396] Error: Driver 'pcspkr' is already registered, aborting...
[    5.371810] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360=
 ms ovfl timer
[    5.371815] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    5.371817] RAPL PMU: hw unit of domain package 2^-14 Joules
[    5.371819] RAPL PMU: hw unit of domain dram 2^-14 Joules
[    5.371821] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    5.371823] RAPL PMU: hw unit of domain psys 2^-14 Joules
[    5.389108] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    5.391454] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2
[    5.391459] cfg80211: failed to load regulatory.db
[    5.414510] i915 0000:00:02.0: VT-d active for gfx access
[    5.414828] checking generic (50000000 300000) vs hw (db000000 1000000)
[    5.414830] checking generic (50000000 300000) vs hw (50000000 10000000)
[    5.414832] fb0: switching to inteldrmfb from EFI VGA
[    5.419251] cryptd: max_cpu_qlen set to 1000
[    5.468535] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    5.468909] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=
=3Dio+mem,decodes=3Dio+mem:owns=3Dio+mem
[    5.474239] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/=
kbl_dmc_ver1_04.bin (v1.4)
[    5.484686] pstore: Registered efi as persistent store backend
[    5.488203] i915 0000:00:02.0: [drm:intel_dp_aux_init_backlight_funcs [i=
915]] Panel advertises DPCD backlight support, but VBT disagrees. If your b=
acklight controls don't work try booting with i915.enable_dpcd_backlight=3D=
1. If your machine needs this, please file a _new_ bug report on drm/i915, =
see https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs =
for details.
[    5.493111] Intel(R) Wireless WiFi driver for Linux
[    5.493115] Copyright(c) 2003- 2015 Intel Corporation
[    5.493506] iwlwifi 0000:02:00.0: enabling device (0000 -> 0002)
[    5.496425] AVX2 version of gcm_enc/dec engaged.
[    5.496427] AES CTR mode by8 optimization enabled
[    5.500590] iwlwifi 0000:02:00.0: Found debug destination: EXTERNAL_DRAM
[    5.500597] iwlwifi 0000:02:00.0: Found debug configuration: 0
[    5.500686] [drm] Initialized i915 1.6.0 20200313 for 0000:00:02.0 on mi=
nor 0
[    5.501083] iwlwifi 0000:02:00.0: loaded firmware version 36.77d01142.0 =
8265-36.ucode op_mode iwlmvm
[    5.501109] iwlwifi 0000:02:00.0: Direct firmware load for iwl-debug-yoy=
o.bin failed with error -2
[    5.503725] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/subc=
lass/prog-if info 0x040380
[    5.503742] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[    5.558841] intel_rapl_common: Found RAPL domain package
[    5.558849] intel_rapl_common: Found RAPL domain core
[    5.558852] intel_rapl_common: Found RAPL domain uncore
[    5.558854] intel_rapl_common: Found RAPL domain dram
[    5.578445] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: =
bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[    5.578562] iwlwifi 0000:02:00.0: Detected Intel(R) Dual Band Wireless A=
C 8265, REV=3D0x230
[    5.579646] dcdbas dcdbas: Dell Systems Management Base Driver (version =
5.6.0-3.3)
[    5.590341] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DR=
AM
[    5.590660] iwlwifi 0000:02:00.0: Allocated 0x00400000 bytes for firmwar=
e monitor.
[    5.804579] input: Dell WMI hotkeys as /devices/platform/PNP0C14:01/wmi_=
bus/wmi_bus-PNP0C14:01/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input10
[    5.817303] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: n=
o)
[    5.856170] iwlwifi 0000:02:00.0: base HW address: b4:d5:bd:9e:43:f5
[    5.932134] ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-rs'
[    5.932447] thermal thermal_zone11: failed to read out thermal zone (-61=
)
[    5.936101] iwlwifi 0000:02:00.0 wlp2s0: renamed from wlan0
[    5.937826] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/LNXVIDEO:00/input/input11
[    5.938054] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_aud=
io_component_bind_ops [i915])
[    5.948579] i915 0000:00:02.0: fb0: i915drmfb frame buffer device
[    5.992386] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC3271: l=
ine_outs=3D1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    5.992391] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[    5.992393] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=3D1 (0x21/0x0/=
0x0/0x0/0x0)
[    5.992395] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=3D0x0
[    5.992397] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[    5.992398] snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=3D0x19
[    5.992400] snd_hda_codec_realtek hdaudioC0D0:      Headphone Mic=3D0x1b
[    5.992402] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=3D0x12
[    6.057288] input: HDA Intel PCH Headphone Mic as /devices/pci0000:00/00=
00:00:1f.3/sound/card0/input12
[    6.057343] input: HDA Intel PCH HDMI/DP,pcm=3D3 as /devices/pci0000:00/=
0000:00:1f.3/sound/card0/input13
[    6.057399] input: HDA Intel PCH HDMI/DP,pcm=3D7 as /devices/pci0000:00/=
0000:00:1f.3/sound/card0/input14
[    6.057446] input: HDA Intel PCH HDMI/DP,pcm=3D8 as /devices/pci0000:00/=
0000:00:1f.3/sound/card0/input15
[    6.057494] input: HDA Intel PCH HDMI/DP,pcm=3D9 as /devices/pci0000:00/=
0000:00:1f.3/sound/card0/input16
[    6.057758] input: HDA Intel PCH HDMI/DP,pcm=3D10 as /devices/pci0000:00=
/0000:00:1f.3/sound/card0/input17
[    6.083744] psmouse serio1: synaptics: queried max coordinates: x [..566=
6], y [..4734]
[    6.113070] psmouse serio1: synaptics: queried min coordinates: x [1276.=
.], y [1118..]
[    6.113079] psmouse serio1: synaptics: Your touchpad (PNP: DLL07e6 PNP0f=
13) says it can support a different bus. If i2c-hid and hid-rmi are not use=
d, you might want to try setting psmouse.synaptics_intertouch to 1 and repo=
rt this to linux-input@vger.kernel.org.
[    6.173059] psmouse serio1: synaptics: Touchpad model: 1, fw: 8.2, id: 0=
x1e2a1, caps: 0xf00323/0x840300/0x12e800/0x0, board id: 3038, fw id: 237500=
7
[    6.211381] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042=
/serio1/input/input9
[    6.219268] i2c_hid i2c-ELAN24F0:00: supply vdd not found, using dummy r=
egulator
[    6.219285] i2c_hid i2c-ELAN24F0:00: supply vddl not found, using dummy =
regulator
[    6.287718] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
[    6.288043] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    6.377780] i2c_hid i2c-DELL07E6:00: supply vdd not found, using dummy r=
egulator
[    6.377793] i2c_hid i2c-DELL07E6:00: supply vddl not found, using dummy =
regulator
[    6.411034] input: ELAN24F0:00 04F3:24F0 Touchscreen as /devices/pci0000=
:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001=
/input/input18
[    6.411104] input: ELAN24F0:00 04F3:24F0 as /devices/pci0000:00/0000:00:=
15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input=
19
[    6.411133] input: ELAN24F0:00 04F3:24F0 as /devices/pci0000:00/0000:00:=
15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input=
20
[    6.411277] hid-generic 0018:04F3:24F0.0001: input,hidraw0: I2C HID v1.0=
0 Device [ELAN24F0:00 04F3:24F0] on i2c-ELAN24F0:00
[    6.411544] input: DELL07E6:00 06CB:76AF Mouse as /devices/pci0000:00/00=
00:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input=
/input22
[    6.411657] input: DELL07E6:00 06CB:76AF Touchpad as /devices/pci0000:00=
/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/in=
put/input23
[    6.411725] hid-generic 0018:06CB:76AF.0002: input,hidraw1: I2C HID v1.0=
0 Mouse [DELL07E6:00 06CB:76AF] on i2c-DELL07E6:00
[    6.471078] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DR=
AM
[    6.522574] input: ELAN24F0:00 04F3:24F0 as /devices/pci0000:00/0000:00:=
15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input=
25
[    6.522651] input: ELAN24F0:00 04F3:24F0 UNKNOWN as /devices/pci0000:00/=
0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/inp=
ut/input26
[    6.522682] input: ELAN24F0:00 04F3:24F0 UNKNOWN as /devices/pci0000:00/=
0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/inp=
ut/input27
[    6.522723] hid-multitouch 0018:04F3:24F0.0001: input,hidraw0: I2C HID v=
1.00 Device [ELAN24F0:00 04F3:24F0] on i2c-ELAN24F0:00
[    6.544830] mc: Linux media interface: v0.10
[    6.545387] Bluetooth: Core ver 2.22
[    6.545403] NET: Registered protocol family 31
[    6.545405] Bluetooth: HCI device and connection manager initialized
[    6.545410] Bluetooth: HCI socket layer initialized
[    6.545413] Bluetooth: L2CAP socket layer initialized
[    6.545417] Bluetooth: SCO socket layer initialized
[    6.551706] videodev: Linux video capture interface: v2.00
[    6.605548] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DR=
AM
[    6.659063] input: DELL07E6:00 06CB:76AF Mouse as /devices/pci0000:00/00=
00:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input=
/input29
[    6.659278] input: DELL07E6:00 06CB:76AF Touchpad as /devices/pci0000:00=
/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/in=
put/input30
[    6.659429] hid-multitouch 0018:06CB:76AF.0002: input,hidraw1: I2C HID v=
1.00 Mouse [DELL07E6:00 06CB:76AF] on i2c-DELL07E6:00
[    6.674607] iwlwifi 0000:02:00.0: FW already configured (0) - re-configu=
ring
[    6.686168] cdc_acm 1-10:1.0: ttyACM0: USB ACM device
[    6.686474] usbcore: registered new interface driver cdc_acm
[    6.686494] cdc_acm: USB Abstract Control Model driver for USB modems an=
d ISDN adapters
[    6.694353] usbcore: registered new interface driver btusb
[    6.695821] Bluetooth: hci0: Firmware revision 0.1 build 65 week 42 2019
[    6.698759] uvcvideo: Found UVC 1.00 device Integrated_Webcam_HD (0bda:5=
8f4)
[    6.706280] uvcvideo 1-5:1.0: Entity type for entity Extension 4 was not=
 initialized!
[    6.706284] uvcvideo 1-5:1.0: Entity type for entity Extension 7 was not=
 initialized!
[    6.706286] uvcvideo 1-5:1.0: Entity type for entity Processing 2 was no=
t initialized!
[    6.706288] uvcvideo 1-5:1.0: Entity type for entity Camera 1 was not in=
itialized!
[    6.706333] input: Integrated_Webcam_HD: Integrate as /devices/pci0000:0=
0/0000:00:14.0/usb1/1-5/1-5:1.0/input/input32
[    6.706886] uvcvideo: Found UVC 1.00 device Integrated_Webcam_HD (0bda:5=
8f4)
[    6.708882] uvcvideo 1-5:1.2: Entity type for entity Extension 10 was no=
t initialized!
[    6.708885] uvcvideo 1-5:1.2: Entity type for entity Extension 12 was no=
t initialized!
[    6.708887] uvcvideo 1-5:1.2: Entity type for entity Processing 9 was no=
t initialized!
[    6.708888] uvcvideo 1-5:1.2: Entity type for entity Camera 11 was not i=
nitialized!
[    6.708934] input: Integrated_Webcam_HD: Integrate as /devices/pci0000:0=
0/0000:00:14.0/usb1/1-5/1-5:1.2/input/input33
[    6.708982] usbcore: registered new interface driver uvcvideo
[    6.708983] USB Video Class driver (1.1.1)
[    6.717512] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    6.717517] Bluetooth: BNEP filters: protocol multicast
[    6.717521] Bluetooth: BNEP socket layer initialized
[    6.720372] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DR=
AM
[    6.750305] NET: Registered protocol family 38
[    6.853681] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DR=
AM
[    6.920730] iwlwifi 0000:02:00.0: FW already configured (0) - re-configu=
ring
[    7.873437] Bluetooth: RFCOMM TTY layer initialized
[    7.873444] Bluetooth: RFCOMM socket layer initialized
[    7.873448] Bluetooth: RFCOMM ver 1.11
[    9.022429] rfkill: input handler disabled
[   12.449921] rfkill: input handler enabled
[   13.057062] wlp2s0: authenticate with 78:8a:20:8e:ee:6a
[   13.066842] wlp2s0: send auth to 78:8a:20:8e:ee:6a (try 1/3)
[   13.073947] wlp2s0: authenticated
[   13.077792] wlp2s0: associate with 78:8a:20:8e:ee:6a (try 1/3)
[   13.183584] wlp2s0: associate with 78:8a:20:8e:ee:6a (try 2/3)
[   13.185624] wlp2s0: RX AssocResp from 78:8a:20:8e:ee:6a (capab=3D0x1411 =
status=3D0 aid=3D4)
[   13.187867] wlp2s0: associated
[   14.099920] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
[   14.113789] usb 1-1: new low-speed USB device number 9 using xhci_hcd
[   14.241824] usb 1-1: device descriptor read/64, error -71
[   14.477814] usb 1-1: device descriptor read/64, error -71
[   14.713785] usb 1-1: new low-speed USB device number 10 using xhci_hcd
[   14.841795] usb 1-1: device descriptor read/64, error -71
[   15.081969] usb 1-1: device descriptor read/64, error -71
[   15.189893] usb usb1-port1: attempt power cycle
[   15.841805] usb 1-1: new low-speed USB device number 11 using xhci_hcd
[   15.842369] usb 1-1: Device not responding to setup address.
[   16.050378] usb 1-1: Device not responding to setup address.
[   16.257792] usb 1-1: device not accepting address 11, error -71
[   16.385832] usb 1-1: new low-speed USB device number 12 using xhci_hcd
[   16.386331] usb 1-1: Device not responding to setup address.
[   16.594367] usb 1-1: Device not responding to setup address.
[   16.805825] usb 1-1: device not accepting address 12, error -71
[   16.805877] usb usb1-port1: unable to enumerate USB device
[   74.090013] pcieport 0000:00:1c.4: pciehp: Slot(8): Card present
[   74.221965] pci 0000:03:00.0: [8086:15d3] type 01 class 0x060400
[   74.222030] pci 0000:03:00.0: enabling Extended Tags
[   74.222126] pci 0000:03:00.0: supports D1 D2
[   74.222127] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   74.222394] pci 0000:03:00.0: Adding to iommu group 14
[   74.222433] pci 0000:03:00.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[   74.222527] pci 0000:04:00.0: [8086:15d3] type 01 class 0x060400
[   74.222582] pci 0000:04:00.0: enabling Extended Tags
[   74.222673] pci 0000:04:00.0: supports D1 D2
[   74.222674] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   74.222913] pci 0000:04:00.0: Adding to iommu group 15
[   74.222952] pci 0000:04:01.0: [8086:15d3] type 01 class 0x060400
[   74.223010] pci 0000:04:01.0: enabling Extended Tags
[   74.223112] pci 0000:04:01.0: supports D1 D2
[   74.223113] pci 0000:04:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[   74.223329] pci 0000:04:01.0: Adding to iommu group 16
[   74.223354] pci 0000:04:02.0: [8086:15d3] type 01 class 0x060400
[   74.223412] pci 0000:04:02.0: enabling Extended Tags
[   74.223497] pci 0000:04:02.0: supports D1 D2
[   74.223498] pci 0000:04:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[   74.223669] pci 0000:04:02.0: Adding to iommu group 17
[   74.223694] pci 0000:04:04.0: [8086:15d3] type 01 class 0x060400
[   74.223751] pci 0000:04:04.0: enabling Extended Tags
[   74.223838] pci 0000:04:04.0: supports D1 D2
[   74.223839] pci 0000:04:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[   74.224024] pci 0000:04:04.0: Adding to iommu group 18
[   74.224067] pci 0000:03:00.0: PCI bridge to [bus 04-35]
[   74.224073] pci 0000:03:00.0:   bridge window [io  0x0000-0x0fff]
[   74.224077] pci 0000:03:00.0:   bridge window [mem 0x00000000-0x000fffff=
]
[   74.224083] pci 0000:03:00.0:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[   74.224086] pci 0000:04:00.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[   74.224093] pci 0000:04:01.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[   74.224100] pci 0000:04:02.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[   74.224107] pci 0000:04:04.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[   74.224179] pci 0000:04:00.0: PCI bridge to [bus 05-35]
[   74.224184] pci 0000:04:00.0:   bridge window [io  0x0000-0x0fff]
[   74.224187] pci 0000:04:00.0:   bridge window [mem 0x00000000-0x000fffff=
]
[   74.224193] pci 0000:04:00.0:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[   74.224195] pci_bus 0000:05: busn_res: [bus 05-35] end is updated to 05
[   74.224264] pci 0000:04:01.0: PCI bridge to [bus 06-35]
[   74.224270] pci 0000:04:01.0:   bridge window [io  0x0000-0x0fff]
[   74.224273] pci 0000:04:01.0:   bridge window [mem 0x00000000-0x000fffff=
]
[   74.224279] pci 0000:04:01.0:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[   74.224280] pci_bus 0000:06: busn_res: [bus 06-35] end is updated to 35
[   74.224298] pci_bus 0000:36: busn_res: [bus 36] end is updated to 36
[   74.224300] pci 0000:04:02.0: devices behind bridge are unusable because=
 [bus 36] cannot be assigned for them
[   74.224348] pci_bus 0000:37: busn_res: can not insert [bus 37-35] under =
[bus 04-35] (conflicts with (null) [bus 04-35])
[   74.224353] pci 0000:04:04.0: PCI bridge to [bus 37-35]
[   74.224359] pci 0000:04:04.0:   bridge window [io  0x0000-0x0fff]
[   74.224362] pci 0000:04:04.0:   bridge window [mem 0x00000000-0x000fffff=
]
[   74.224368] pci 0000:04:04.0:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[   74.224370] pci 0000:04:04.0: devices behind bridge are unusable because=
 [bus 37-35] cannot be assigned for them
[   74.224373] pci_bus 0000:04: busn_res: [bus 04-35] end is updated to 35
[   74.224379] pci 0000:04:01.0: bridge window [mem 0x00100000-0x001fffff 6=
4bit pref] to [bus 06-35] add_size ffff00000 add_align 100000
[   74.224380] pci 0000:04:01.0: bridge window [mem 0x00100000-0x001fffff] =
to [bus 06-35] add_size 18f00000 add_align 100000
[   74.224382] pci 0000:04:04.0: bridge window [mem 0x00100000-0x001fffff 6=
4bit pref] to [bus 37-35] add_size ffff00000 add_align 100000
[   74.224383] pci 0000:04:04.0: bridge window [mem 0x00100000-0x001fffff] =
to [bus 37-35] add_size 18f00000 add_align 100000
[   74.224386] pci 0000:03:00.0: bridge window [mem 0x00100000-0x003fffff 6=
4bit pref] to [bus 04-35] add_size 1fffe00000 add_align 100000
[   74.224387] pci 0000:03:00.0: bridge window [mem 0x00100000-0x003fffff] =
to [bus 04-35] add_size 31e00000 add_align 100000
[   74.224395] pcieport 0000:00:1c.4: BAR 13: assigned [io  0x2000-0x4fff]
[   74.224397] pci 0000:03:00.0: BAR 14: assigned [mem 0xac000000-0xda0ffff=
f]
[   74.224399] pci 0000:03:00.0: BAR 15: assigned [mem 0x60000000-0xa9fffff=
f 64bit pref]
[   74.224400] pci 0000:03:00.0: BAR 13: assigned [io  0x2000-0x4fff]
[   74.224403] pci 0000:04:00.0: BAR 14: assigned [mem 0xac000000-0xac0ffff=
f]
[   74.224404] pci 0000:04:00.0: BAR 15: assigned [mem 0x60000000-0x600ffff=
f 64bit pref]
[   74.224406] pci 0000:04:01.0: BAR 14: assigned [mem 0xac100000-0xc2fffff=
f]
[   74.224407] pci 0000:04:01.0: BAR 15: assigned [mem 0x60100000-0x84f7fff=
f 64bit pref]
[   74.224408] pci 0000:04:04.0: BAR 14: assigned [mem 0xc3000000-0xd9fffff=
e]
[   74.224410] pci 0000:04:04.0: BAR 15: assigned [mem 0x85000000-0xa9effff=
e 64bit pref]
[   74.224411] pci 0000:04:00.0: BAR 13: assigned [io  0x2000-0x2fff]
[   74.224412] pci 0000:04:01.0: BAR 13: assigned [io  0x3000-0x3fff]
[   74.224413] pci 0000:04:04.0: BAR 13: assigned [io  0x4000-0x4ffe]
[   74.224415] pci 0000:04:00.0: PCI bridge to [bus 05]
[   74.224417] pci 0000:04:00.0:   bridge window [io  0x2000-0x2fff]
[   74.224422] pci 0000:04:00.0:   bridge window [mem 0xac000000-0xac0fffff=
]
[   74.224425] pci 0000:04:00.0:   bridge window [mem 0x60000000-0x600fffff=
 64bit pref]
[   74.224431] pci 0000:04:01.0: PCI bridge to [bus 06-35]
[   74.224433] pci 0000:04:01.0:   bridge window [io  0x3000-0x3fff]
[   74.224438] pci 0000:04:01.0:   bridge window [mem 0xac100000-0xc2ffffff=
]
[   74.224441] pci 0000:04:01.0:   bridge window [mem 0x60100000-0x84f7ffff=
 64bit pref]
[   74.224447] pci 0000:04:04.0: PCI bridge to [bus 37-35]
[   74.224449] pci 0000:04:04.0:   bridge window [io  0x4000-0x4ffe]
[   74.224454] pci 0000:04:04.0:   bridge window [mem 0xc3000000-0xd9fffffe=
]
[   74.224457] pci 0000:04:04.0:   bridge window [mem 0x85000000-0xa9effffe=
 64bit pref]
[   74.224463] pci 0000:03:00.0: PCI bridge to [bus 04-35]
[   74.224465] pci 0000:03:00.0:   bridge window [io  0x2000-0x4fff]
[   74.224469] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xda0fffff=
]
[   74.224473] pci 0000:03:00.0:   bridge window [mem 0x60000000-0xa9ffffff=
 64bit pref]
[   74.224478] pcieport 0000:00:1c.4: PCI bridge to [bus 03-35]
[   74.224480] pcieport 0000:00:1c.4:   bridge window [io  0x2000-0x4fff]
[   74.224483] pcieport 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0=
fffff]
[   74.224486] pcieport 0000:00:1c.4:   bridge window [mem 0x60000000-0xa9f=
fffff 64bit pref]
[   74.224517] pcieport 0000:03:00.0: enabling device (0000 -> 0003)
[   74.224775] pcieport 0000:04:00.0: enabling device (0000 -> 0003)
[   74.224978] pcieport 0000:04:01.0: enabling device (0000 -> 0003)
[   74.225128] pcieport 0000:04:01.0: pciehp: Slot #1 AttnBtn- PwrCtrl- MRL=
- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActR=
ep+
[   74.225697] pcieport 0000:04:04.0: enabling device (0000 -> 0003)
[   74.225870] pcieport 0000:04:04.0: pciehp: Slot #4 AttnBtn- PwrCtrl- MRL=
- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActR=
ep+
[   76.618186] pcieport 0000:04:02.0: Primary bus is hard wired to 0
[   76.618271] pci 0000:05:00.0: [8086:15d2] type 00 class 0x088000
[   76.618338] pci 0000:05:00.0: reg 0x10: [mem 0x00000000-0x0003ffff]
[   76.618353] pci 0000:05:00.0: reg 0x14: [mem 0x00000000-0x00000fff]
[   76.618413] pci 0000:05:00.0: enabling Extended Tags
[   76.618787] pci 0000:05:00.0: supports D1 D2
[   76.618789] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   76.619058] pci 0000:05:00.0: Adding to iommu group 15
[   76.619165] pci_bus 0000:05: busn_res: [bus 05] end is updated to 05
[   76.619169] pci_bus 0000:05: Allocating resources
[   76.619176] pci 0000:05:00.0: BAR 0: assigned [mem 0xac000000-0xac03ffff=
]
[   76.619180] pci 0000:05:00.0: BAR 1: assigned [mem 0xac040000-0xac040fff=
]
[   76.619201] pci_bus 0000:06: busn_res: [bus 06-35] end is updated to 35
[   76.624617] thunderbolt 0000:05:00.0: enabling device (0000 -> 0002)
[   77.640079] thunderbolt 0-1: new device found, vendor=3D0xed device=3D0x=
b009
[   77.640083] thunderbolt 0-1: GIGABYTE GAMING BOX
[   77.710384] pcieport 0000:04:01.0: pciehp: Slot(1): Card present
[   77.710386] pcieport 0000:04:01.0: pciehp: Slot(1): Link Up
[   77.846469] pci 0000:06:00.0: [8086:1578] type 01 class 0x060400
[   77.846584] pci 0000:06:00.0: enabling Extended Tags
[   77.846781] pci 0000:06:00.0: supports D1 D2
[   77.846782] pci 0000:06:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   77.846950] pci 0000:06:00.0: 8.000 Gb/s available PCIe bandwidth, limit=
ed by 2.5 GT/s PCIe x4 link at 0000:04:01.0 (capable of 31.504 Gb/s with 8.=
0 GT/s PCIe x4 link)
[   77.847024] pci 0000:06:00.0: Adding to iommu group 16
[   77.858326] pci 0000:06:00.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[   77.858460] pci 0000:07:01.0: [8086:1578] type 01 class 0x060400
[   77.858579] pci 0000:07:01.0: enabling Extended Tags
[   77.858761] pci 0000:07:01.0: supports D1 D2
[   77.858762] pci 0000:07:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[   77.858949] pci 0000:07:01.0: Adding to iommu group 16
[   77.858994] pci 0000:07:04.0: [8086:1578] type 01 class 0x060400
[   77.859113] pci 0000:07:04.0: enabling Extended Tags
[   77.859289] pci 0000:07:04.0: supports D1 D2
[   77.859289] pci 0000:07:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[   77.859472] pci 0000:07:04.0: Adding to iommu group 16
[   77.859564] pci 0000:06:00.0: PCI bridge to [bus 07-35]
[   77.859575] pci 0000:06:00.0:   bridge window [io  0x0000-0x0fff]
[   77.859580] pci 0000:06:00.0:   bridge window [mem 0x00000000-0x000fffff=
]
[   77.859591] pci 0000:06:00.0:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[   77.859594] pci 0000:07:01.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[   77.859607] pci 0000:07:04.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[   77.859763] pci 0000:08:00.0: [1002:7300] type 00 class 0x030000
[   77.859846] pci 0000:08:00.0: reg 0x10: [mem 0x00000000-0x0fffffff 64bit=
 pref]
[   77.859873] pci 0000:08:00.0: reg 0x18: [mem 0x00000000-0x001fffff 64bit=
 pref]
[   77.859888] pci 0000:08:00.0: reg 0x20: [io  0x0000-0x00ff]
[   77.859904] pci 0000:08:00.0: reg 0x24: [mem 0x00000000-0x0003ffff]
[   77.859920] pci 0000:08:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[   77.859937] pci 0000:08:00.0: enabling Extended Tags
[   77.860155] pci 0000:08:00.0: supports D1 D2
[   77.860156] pci 0000:08:00.0: PME# supported from D1 D2 D3hot D3cold
[   77.860383] pci 0000:08:00.0: 8.000 Gb/s available PCIe bandwidth, limit=
ed by 2.5 GT/s PCIe x4 link at 0000:04:01.0 (capable of 126.016 Gb/s with 8=
.0 GT/s PCIe x16 link)
[   77.860423] pci 0000:08:00.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dnone,locks=3Dnone
[   77.860426] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=
=3Dio+mem,decodes=3Dnone:owns=3Dio+mem
[   77.860444] pci 0000:08:00.0: Adding to iommu group 16
[   77.860482] pci 0000:08:00.1: [1002:aae8] type 00 class 0x040300
[   77.860549] pci 0000:08:00.1: reg 0x10: [mem 0x00000000-0x00003fff 64bit=
]
[   77.860658] pci 0000:08:00.1: enabling Extended Tags
[   77.860819] pci 0000:08:00.1: supports D1 D2
[   77.860977] pci 0000:08:00.1: Adding to iommu group 16
[   77.861054] pci 0000:07:01.0: PCI bridge to [bus 08-35]
[   77.861065] pci 0000:07:01.0:   bridge window [io  0x0000-0x0fff]
[   77.861070] pci 0000:07:01.0:   bridge window [mem 0x00000000-0x000fffff=
]
[   77.861081] pci 0000:07:01.0:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[   77.861083] pci_bus 0000:08: busn_res: [bus 08-35] end is updated to 08
[   77.861206] pci 0000:09:00.0: [8086:15b6] type 00 class 0x0c0330
[   77.861267] pci 0000:09:00.0: reg 0x10: [mem 0x00000000-0x0000ffff]
[   77.862352] pci 0000:09:00.0: supports D1 D2
[   77.862354] pci 0000:09:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   77.863234] pci 0000:09:00.0: 8.000 Gb/s available PCIe bandwidth, limit=
ed by 2.5 GT/s PCIe x4 link at 0000:04:01.0 (capable of 31.504 Gb/s with 8.=
0 GT/s PCIe x4 link)
[   77.863305] pci 0000:09:00.0: Adding to iommu group 16
[   77.863454] pci 0000:07:04.0: PCI bridge to [bus 09-35]
[   77.863466] pci 0000:07:04.0:   bridge window [io  0x0000-0x0fff]
[   77.863473] pci 0000:07:04.0:   bridge window [mem 0x00000000-0x000fffff=
]
[   77.863485] pci 0000:07:04.0:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[   77.863487] pci_bus 0000:09: busn_res: [bus 09-35] end is updated to 35
[   77.863495] pci_bus 0000:07: busn_res: [bus 07-35] end is updated to 35
[   77.863505] pci 0000:07:04.0: bridge window [mem 0x00100000-0x001fffff 6=
4bit pref] to [bus 09-35] add_size ffff00000 add_align 100000
[   77.863507] pci 0000:07:04.0: bridge window [mem 0x00100000-0x001fffff] =
to [bus 09-35] add_size 18f00000 add_align 100000
[   77.863510] pci 0000:06:00.0: bridge window [mem 0x04000000-0x1fffffff 6=
4bit pref] to [bus 07-35] add_size ffc000000 add_align 4000000
[   77.863512] pci 0000:06:00.0: bridge window [mem 0x00100000-0x002fffff] =
to [bus 07-35] add_size 18f00000 add_align 100000
[   77.863517] pci 0000:06:00.0: BAR 15: assigned [mem 0x64000000-0x84f7fff=
f 64bit pref]
[   77.863519] pci 0000:06:00.0: BAR 14: assigned [mem 0xac100000-0xc2fffff=
f]
[   77.863521] pci 0000:06:00.0: BAR 13: assigned [io  0x3000-0x3fff]
[   77.863524] pci 0000:07:01.0: BAR 15: assigned [mem 0x68000000-0x7ffffff=
f 64bit pref]
[   77.863526] pci 0000:07:01.0: BAR 14: assigned [mem 0xac100000-0xac1ffff=
f]
[   77.863528] pci 0000:07:04.0: BAR 14: assigned [mem 0xac200000-0xc2fffff=
f]
[   77.863530] pci 0000:07:04.0: BAR 15: assigned [mem 0x80000000-0x84f7fff=
f 64bit pref]
[   77.863532] pci 0000:07:01.0: BAR 13: assigned [io  0x3000-0x3fff]
[   77.863534] pci 0000:07:04.0: BAR 13: no space for [io  size 0x1000]
[   77.863536] pci 0000:07:04.0: BAR 13: failed to assign [io  size 0x1000]
[   77.863539] pci 0000:08:00.0: BAR 0: assigned [mem 0x70000000-0x7fffffff=
 64bit pref]
[   77.863563] pci 0000:08:00.0: BAR 2: assigned [mem 0x68000000-0x681fffff=
 64bit pref]
[   77.863586] pci 0000:08:00.0: BAR 5: assigned [mem 0xac100000-0xac13ffff=
]
[   77.863594] pci 0000:08:00.0: BAR 6: assigned [mem 0xac140000-0xac15ffff=
 pref]
[   77.863596] pci 0000:08:00.1: BAR 0: assigned [mem 0xac160000-0xac163fff=
 64bit]
[   77.863619] pci 0000:08:00.0: BAR 4: assigned [io  0x3000-0x30ff]
[   77.863628] pci 0000:07:01.0: PCI bridge to [bus 08]
[   77.863632] pci 0000:07:01.0:   bridge window [io  0x3000-0x3fff]
[   77.863640] pci 0000:07:01.0:   bridge window [mem 0xac100000-0xac1fffff=
]
[   77.863647] pci 0000:07:01.0:   bridge window [mem 0x68000000-0x7fffffff=
 64bit pref]
[   77.863659] pci 0000:09:00.0: BAR 0: assigned [mem 0xac200000-0xac20ffff=
]
[   77.863666] pci 0000:07:04.0: PCI bridge to [bus 09-35]
[   77.863675] pci 0000:07:04.0:   bridge window [mem 0xac200000-0xc2ffffff=
]
[   77.863681] pci 0000:07:04.0:   bridge window [mem 0x80000000-0x84f7ffff=
 64bit pref]
[   77.863693] pci 0000:06:00.0: PCI bridge to [bus 07-35]
[   77.863697] pci 0000:06:00.0:   bridge window [io  0x3000-0x3fff]
[   77.863705] pci 0000:06:00.0:   bridge window [mem 0xac100000-0xc2ffffff=
]
[   77.863711] pci 0000:06:00.0:   bridge window [mem 0x64000000-0x84f7ffff=
 64bit pref]
[   77.863722] pcieport 0000:04:01.0: PCI bridge to [bus 06-35]
[   77.863724] pcieport 0000:04:01.0:   bridge window [io  0x3000-0x3fff]
[   77.863728] pcieport 0000:04:01.0:   bridge window [mem 0xac100000-0xc2f=
fffff]
[   77.863731] pcieport 0000:04:01.0:   bridge window [mem 0x60100000-0x84f=
7ffff 64bit pref]
[   77.863736] PCI: No. 2 try to assign unassigned res
[   77.863737] release child resource [io  0x3000-0x30ff]
[   77.863738] pci 0000:07:01.0: resource 13 [io  0x3000-0x3fff] released
[   77.863739] pci 0000:07:01.0: PCI bridge to [bus 08]
[   77.863749] pci 0000:06:00.0: resource 13 [io  0x3000-0x3fff] released
[   77.863750] pci 0000:06:00.0: PCI bridge to [bus 07-35]
[   77.863776] pci 0000:06:00.0: BAR 13: assigned [io  0x3000-0x3fff]
[   77.863778] pci 0000:07:01.0: BAR 13: assigned [io  0x3000-0x3fff]
[   77.863779] pci 0000:07:04.0: BAR 13: no space for [io  size 0x1000]
[   77.863779] pci 0000:07:04.0: BAR 13: failed to assign [io  size 0x1000]
[   77.863781] pci 0000:08:00.0: BAR 4: assigned [io  0x3000-0x30ff]
[   77.863788] pci 0000:07:01.0: PCI bridge to [bus 08]
[   77.863791] pci 0000:07:01.0:   bridge window [io  0x3000-0x3fff]
[   77.863799] pci 0000:07:01.0:   bridge window [mem 0xac100000-0xac1fffff=
]
[   77.863805] pci 0000:07:01.0:   bridge window [mem 0x68000000-0x7fffffff=
 64bit pref]
[   77.863816] pci 0000:07:04.0: PCI bridge to [bus 09-35]
[   77.863824] pci 0000:07:04.0:   bridge window [mem 0xac200000-0xc2ffffff=
]
[   77.863843] pci 0000:07:04.0:   bridge window [mem 0x80000000-0x84f7ffff=
 64bit pref]
[   77.863854] pci 0000:06:00.0: PCI bridge to [bus 07-35]
[   77.863857] pci 0000:06:00.0:   bridge window [io  0x3000-0x3fff]
[   77.863865] pci 0000:06:00.0:   bridge window [mem 0xac100000-0xc2ffffff=
]
[   77.863871] pci 0000:06:00.0:   bridge window [mem 0x64000000-0x84f7ffff=
 64bit pref]
[   77.863881] pcieport 0000:04:01.0: PCI bridge to [bus 06-35]
[   77.863883] pcieport 0000:04:01.0:   bridge window [io  0x3000-0x3fff]
[   77.863887] pcieport 0000:04:01.0:   bridge window [mem 0xac100000-0xc2f=
fffff]
[   77.863890] pcieport 0000:04:01.0:   bridge window [mem 0x60100000-0x84f=
7ffff 64bit pref]
[   77.863921] pcieport 0000:06:00.0: enabling device (0000 -> 0003)
[   77.864335] pcieport 0000:07:01.0: enabling device (0000 -> 0003)
[   77.864763] pcieport 0000:07:04.0: enabling device (0000 -> 0002)
[   77.864987] pcieport 0000:07:04.0: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL=
- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActR=
ep+
[   77.865388] pci 0000:08:00.1: D0 power state depends on 0000:08:00.0
[   77.865450] snd_hda_intel 0000:08:00.1: enabling device (0000 -> 0002)
[   77.865632] snd_hda_intel 0000:08:00.1: Force to non-snoop mode
[   77.865665] pci 0000:09:00.0: enabling device (0000 -> 0002)
[   77.866377] xhci_hcd 0000:09:00.0: xHCI Host Controller
[   77.866402] xhci_hcd 0000:09:00.0: new USB bus registered, assigned bus =
number 3
[   77.867739] xhci_hcd 0000:09:00.0: hcc params 0x200077c1 hci version 0x1=
10 quirks 0x0000000200009810
[   77.868175] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.07
[   77.868178] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[   77.868180] usb usb3: Product: xHCI Host Controller
[   77.868181] usb usb3: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[   77.868183] usb usb3: SerialNumber: 0000:09:00.0
[   77.868383] hub 3-0:1.0: USB hub found
[   77.868410] hub 3-0:1.0: 2 ports detected
[   77.868674] xhci_hcd 0000:09:00.0: xHCI Host Controller
[   77.868680] xhci_hcd 0000:09:00.0: new USB bus registered, assigned bus =
number 4
[   77.868683] xhci_hcd 0000:09:00.0: Host supports USB 3.1 Enhanced SuperS=
peed
[   77.868722] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.07
[   77.868723] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[   77.868724] usb usb4: Product: xHCI Host Controller
[   77.868725] usb usb4: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[   77.868726] usb usb4: SerialNumber: 0000:09:00.0
[   77.868831] hub 4-0:1.0: USB hub found
[   77.868843] hub 4-0:1.0: 2 ports detected
[   77.875674] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[   77.875677] AMD-Vi: AMD IOMMUv2 functionality not available on this syst=
em
[   77.876007] input: HDA ATI HDMI HDMI/DP,pcm=3D3 as /devices/pci0000:00/0=
000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.=
1/sound/card1/input34
[   77.876082] input: HDA ATI HDMI HDMI/DP,pcm=3D7 as /devices/pci0000:00/0=
000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.=
1/sound/card1/input35
[   77.876119] input: HDA ATI HDMI HDMI/DP,pcm=3D8 as /devices/pci0000:00/0=
000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.=
1/sound/card1/input36
[   77.876166] input: HDA ATI HDMI HDMI/DP,pcm=3D9 as /devices/pci0000:00/0=
000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.=
1/sound/card1/input37
[   77.876199] input: HDA ATI HDMI HDMI/DP,pcm=3D10 as /devices/pci0000:00/=
0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00=
.1/sound/card1/input38
[   77.876230] input: HDA ATI HDMI HDMI/DP,pcm=3D11 as /devices/pci0000:00/=
0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00=
.1/sound/card1/input39
[   77.937235] [drm] amdgpu kernel modesetting enabled.
[   77.937355] CRAT table not found
[   77.937357] Virtual CRAT table created for CPU
[   77.937359] Parsing CRAT table with 1 nodes
[   77.937360] Creating topology SYSFS entries
[   77.937370] Topology: Add CPU node
[   77.937371] Finished initializing topology
[   77.937562] amdgpu 0000:08:00.0: enabling device (0000 -> 0003)
[   77.937719] [drm] initializing kernel modesetting (FIJI 0x1002:0x7300 0x=
1002:0x0B36 0xCA).
[   77.938727] [drm] register mmio base: 0xAC100000
[   77.938728] [drm] register mmio size: 262144
[   77.938732] [drm] PCIE atomic ops is not supported
[   77.938752] [drm] add ip block number 0 <vi_common>
[   77.938753] [drm] add ip block number 1 <gmc_v8_0>
[   77.938754] [drm] add ip block number 2 <tonga_ih>
[   77.938755] [drm] add ip block number 3 <gfx_v8_0>
[   77.938755] [drm] add ip block number 4 <sdma_v3_0>
[   77.938756] [drm] add ip block number 5 <powerplay>
[   77.938757] [drm] add ip block number 6 <dm>
[   77.938757] [drm] add ip block number 7 <uvd_v6_0>
[   77.938758] [drm] add ip block number 8 <vce_v3_0>
[   77.938760] kfd kfd: skipped device 1002:7300, PCI rejects atomics
[   78.202121] usb 3-2: new high-speed USB device number 2 using xhci_hcd
[   78.236306] ATOM BIOS: 113-C8820200-107
[   78.236441] [drm] UVD is enabled in physical mode
[   78.236445] [drm] VCE enabled in physical mode
[   78.236524] [drm] GPU posting now...
[   78.346206] [drm] vm size is 64 GB, 2 levels, block size is 10-bit, frag=
ment size is 9-bit
[   78.346235] amdgpu 0000:08:00.0: VRAM: 4096M 0x000000F400000000 - 0x0000=
00F4FFFFFFFF (4096M used)
[   78.346237] amdgpu 0000:08:00.0: GART: 1024M 0x000000FF00000000 - 0x0000=
00FF3FFFFFFF
[   78.346260] [drm] Detected VRAM RAM=3D4096M, BAR=3D256M
[   78.346262] [drm] RAM width 512bits HBM
[   78.346523] [TTM] Zone  kernel: Available graphics memory: 8073318 KiB
[   78.346525] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[   78.346526] [TTM] Initializing pool allocator
[   78.346531] [TTM] Initializing DMA pool allocator
[   78.346607] [drm] amdgpu: 4096M of VRAM memory ready
[   78.346611] [drm] amdgpu: 4096M of GTT memory ready.
[   78.346622] [drm] GART: num cpu pages 262144, num gpu pages 262144
[   78.346718] [drm] PCIE GART of 1024M enabled (table at 0x000000F40000000=
0).
[   78.349257] [drm] Chained IB support enabled!
[   78.353480] amdgpu: [powerplay] hwmgr_sw_init smu backed is fiji_smu
[   78.354078] [drm] Found UVD firmware Version: 1.91 Family ID: 12
[   78.354298] [drm] UVD ENC is disabled
[   78.360024] usb 3-2: New USB device found, idVendor=3D05e3, idProduct=3D=
0610, bcdDevice=3D93.03
[   78.360060] usb 3-2: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[   78.360063] usb 3-2: Product: USB2.1 Hub
[   78.360065] usb 3-2: Manufacturer: GenesysLogic
[   78.370443] [drm] Found VCE firmware Version: 55.2 Binary ID: 3
[   78.372807] hub 3-2:1.0: USB hub found
[   78.373107] hub 3-2:1.0: 4 ports detected
[   78.443139] [drm] dce110_link_encoder_construct: Failed to get encoder_c=
ap_info from VBIOS with error code 4!
[   78.443173] [drm] Display Core initialized with v3.2.76!
[   78.444040] snd_hda_intel 0000:08:00.1: bound 0000:08:00.0 (ops amdgpu_d=
m_audio_component_bind_ops [amdgpu])
[   78.444736] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   78.481584] [drm] UVD initialized successfully.
[   78.482265] usb 4-2: new SuperSpeed Gen 1 USB device number 2 using xhci=
_hcd
[   78.505130] usb 4-2: New USB device found, idVendor=3D05e3, idProduct=3D=
0620, bcdDevice=3D93.03
[   78.505135] usb 4-2: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[   78.505136] usb 4-2: Product: USB3.1 Hub
[   78.505137] usb 4-2: Manufacturer: GenesysLogic
[   78.507400] hub 4-2:1.0: USB hub found
[   78.507946] hub 4-2:1.0: 4 ports detected
[   78.580613] [drm] VCE initialized successfully.
[   78.581013] amdgpu 0000:08:00.0: [drm] Cannot find any crtc or sizes
[   78.583566] [drm] Initialized amdgpu 3.36.0 20150101 for 0000:08:00.0 on=
 minor 1
[   78.686375] usb 3-2.2: new full-speed USB device number 3 using xhci_hcd
[   78.790282] usb 3-2.2: device descriptor read/64, error -32
[   79.002213] usb 3-2.2: device descriptor read/64, error -32
[   79.214229] usb 3-2.2: new full-speed USB device number 4 using xhci_hcd
[   79.318280] usb 3-2.2: device descriptor read/64, error -32
[   79.530340] usb 3-2.2: device descriptor read/64, error -32
[   79.638730] usb 3-2-port2: attempt power cycle
[   80.294485] usb 3-2.2: new full-speed USB device number 5 using xhci_hcd
[   80.294627] usb 3-2.2: Device not responding to setup address.
[   80.506423] usb 3-2.2: Device not responding to setup address.
[   80.714335] usb 3-2.2: device not accepting address 5, error -71
[   80.818350] usb 3-2.2: new full-speed USB device number 6 using xhci_hcd
[   80.818505] usb 3-2.2: Device not responding to setup address.
[   81.026518] usb 3-2.2: Device not responding to setup address.
[   81.238360] usb 3-2.2: device not accepting address 6, error -71
[   81.238553] usb 3-2-port2: unable to enumerate USB device
[   81.493849] rfkill: input handler disabled
[   85.613832] rfkill: input handler enabled
[   96.243176] [drm] PCIE GART of 1024M enabled (table at 0x000000F40000000=
0).
[   96.343340] [drm] UVD initialized successfully.
[   96.443392] [drm] VCE initialized successfully.
[   96.447969] amdgpu 0000:08:00.0: [drm] Cannot find any crtc or sizes
[  136.021541] [drm] PCIE GART of 1024M enabled (table at 0x000000F40000000=
0).
[  136.130699] [drm] UVD initialized successfully.
[  136.230751] [drm] VCE initialized successfully.
[  136.234600] amdgpu 0000:08:00.0: [drm] Cannot find any crtc or sizes
[  158.438449] [drm] PCIE GART of 1024M enabled (table at 0x000000F40000000=
0).
[  158.557611] [drm] UVD initialized successfully.
[  158.657664] [drm] VCE initialized successfully.
[  158.662322] amdgpu 0000:08:00.0: [drm] Cannot find any crtc or sizes
[  163.289287] [drm] fb mappable at 0x70696000
[  163.289290] [drm] vram apper at 0x70000000
[  163.289291] [drm] size 33177600
[  163.289292] [drm] fb depth is 24
[  163.289293] [drm]    pitch is 15360
[  163.289351] amdgpu 0000:08:00.0: fb1: amdgpudrmfb frame buffer device
[  163.325967] [drm] Reducing the compressed framebuffer size. This may lea=
d to less power savings than a non-reduced-size. Try to increase stolen mem=
ory size if available in BIOS.
[  164.444201] snd_hda_intel 0000:08:00.1: azx_get_response timeout, switch=
ing to polling mode: last cmd=3D0x00170500
[  164.444218] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last =
cmd=3D0x170500
[  164.444260] ------------[ cut here ]------------
[  164.444280] WARNING: CPU: 6 PID: 1972 at sound/hda/hdac_controller.c:227=
 snd_hdac_bus_update_rirb+0x14d/0x160 [snd_hda_core]
[  164.444281] Modules linked in: amdgpu amd_iommu_v2 gpu_sched ttm thunder=
bolt ccm rfcomm cmac algif_hash algif_skcipher af_alg bnep uvcvideo videobu=
f2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common btusb btrtl vid=
eodev btbcm btintel mc bluetooth cdc_acm ecdh_generic ecc hid_multitouch hi=
d_generic joydev msr snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec=
_generic x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel dell_lapt=
op ledtrig_audio dell_wmi dell_smbios kvm dcdbas mei_hdcp wmi_bmof dell_wmi=
_descriptor intel_wmi_thunderbolt intel_rapl_msr iwlmvm crct10dif_pclmul cr=
c32_pclmul mac80211 ghash_clmulni_intel libarc4 snd_hda_intel snd_intel_dsp=
cfg snd_hda_codec iwlwifi aesni_intel snd_hda_core crypto_simd cryptd glue_=
helper snd_hwdep intel_cstate i915 intel_rapl_perf snd_pcm cfg80211 psmouse=
 input_leds snd_timer drm_kms_helper pcspkr efi_pstore snd cec soundcore rc=
_core i2c_i801 i2c_algo_bit ucsi_acpi mei_me typec_ucsi intel_lpss_pci i2c_=
hid fb_sys_fops
[  164.444298]  processor_thermal_device intel_lpss syscopyarea intel_rapl_=
common idma64 intel_xhci_usb_role_switch sysfillrect sysimgblt mei roles in=
tel_soc_dts_iosf virt_dma intel_pch_thermal typec wmi hid intel_hid sparse_=
keymap pinctrl_sunrisepoint int3400_thermal mac_hid pinctrl_intel video int=
3403_thermal acpi_thermal_rel int340x_thermal_zone acpi_pad sch_fq_codel cr=
ypto_user drm ip_tables x_tables autofs4 rtsx_pci_sdmmc nvme serio_raw nvme=
_core rtsx_pci
[  164.444309] CPU: 6 PID: 1972 Comm: pulseaudio Not tainted 5.7.0-rc3+ #7
[  164.444309] Hardware name: Dell Inc. XPS 13 9370/09DKKT, BIOS 1.11.1 07/=
11/2019
[  164.444312] RIP: 0010:snd_hdac_bus_update_rirb+0x14d/0x160 [snd_hda_core=
]
[  164.444313] Code: 48 83 c4 10 5b 41 5c 41 5d 41 5e 41 5f 5d c3 48 c7 c6 =
e0 98 67 c0 48 c7 c7 00 d5 67 c0 e8 fb d7 93 c3 85 c0 0f 85 b0 3f 00 00 <0f=
> 0b 0f b7 83 90 03 00 00 e9 68 ff ff ff 0f 1f 44 00 00 0f 1f 44
[  164.444314] RSP: 0018:ffffc2c480bdb710 EFLAGS: 00010046
[  164.444315] RAX: 0000000000000000 RBX: ffff9fdb81a37018 RCX: 00000000000=
00000
[  164.444316] RDX: 0000000000000007 RSI: 0000000000000096 RDI: ffff9fdb9e7=
99c80
[  164.444316] RBP: ffffc2c480bdb748 R08: 0000000000000574 R09: ffffffff855=
bee54
[  164.444317] R10: ffffffff8559f948 R11: ffffc2c480bdb458 R12: ffff9fdb81a=
37018
[  164.444318] R13: 0000000000000000 R14: 00000000ffff0000 R15: 00000000000=
00000
[  164.444318] FS:  00007fbfc6795440(0000) GS:ffff9fdb9e780000(0000) knlGS:=
0000000000000000
[  164.444319] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  164.444320] CR2: 00007f6f58022758 CR3: 000000045e16a002 CR4: 00000000003=
606e0
[  164.444320] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[  164.444321] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[  164.444321] Call Trace:
[  164.444326]  snd_hdac_bus_get_response+0x67/0x250 [snd_hda_core]
[  164.444329]  ? wait_woken+0x80/0x80
[  164.444336]  azx_rirb_get_response+0x29/0x80 [snd_hda_codec]
[  164.444339]  azx_get_response+0x34/0x40 [snd_hda_codec]
[  164.444341]  snd_hdac_bus_exec_verb_unlocked+0xa1/0x180 [snd_hda_core]
[  164.444344]  codec_exec_verb+0x70/0x110 [snd_hda_codec]
[  164.444346]  snd_hdac_exec_verb+0x1a/0x40 [snd_hda_core]
[  164.444349]  codec_read+0x44/0x70 [snd_hda_core]
[  164.444351]  snd_hdac_codec_read+0x11/0x20 [snd_hda_core]
[  164.444353]  hda_set_power_state+0xcf/0x110 [snd_hda_codec]
[  164.444356]  hda_call_codec_resume+0x3f/0x130 [snd_hda_codec]
[  164.444359]  hda_codec_runtime_resume+0x34/0x60 [snd_hda_codec]
[  164.444362]  ? snd_hda_codec_new+0x130/0x130 [snd_hda_codec]
[  164.444364]  __rpm_callback+0x8c/0x150
[  164.444367]  ? snd_hda_codec_new+0x130/0x130 [snd_hda_codec]
[  164.444368]  rpm_callback+0x24/0x80
[  164.444371]  ? snd_hda_codec_new+0x130/0x130 [snd_hda_codec]
[  164.444372]  rpm_resume+0x568/0x780
[  164.444373]  __pm_runtime_resume+0x52/0x80
[  164.444376]  snd_hdac_power_up+0x13/0x20 [snd_hda_core]
[  164.444379]  azx_pcm_open+0x20e/0x3f0 [snd_hda_codec]
[  164.444383]  snd_pcm_open_substream+0x53d/0x870 [snd_pcm]
[  164.444385]  snd_pcm_open+0xee/0x230 [snd_pcm]
[  164.444388]  ? wake_up_q+0xa0/0xa0
[  164.444390]  snd_pcm_playback_open+0x42/0x70 [snd_pcm]
[  164.444394]  snd_open+0xb4/0x1a0 [snd]
[  164.444396]  chrdev_open+0xd3/0x1c0
[  164.444397]  ? cdev_default_release+0x20/0x20
[  164.444399]  do_dentry_open+0x143/0x3a0
[  164.444400]  vfs_open+0x2d/0x30
[  164.444401]  path_openat+0xb1c/0x10f0
[  164.444404]  ? inotify_handle_event+0x145/0x210
[  164.444405]  ? fsnotify+0x2ab/0x3d0
[  164.444406]  do_filp_open+0x91/0x100
[  164.444408]  ? __alloc_fd+0x46/0x150
[  164.444409]  do_sys_openat2+0x210/0x2d0
[  164.444411]  do_sys_open+0x46/0x80
[  164.444412]  __x64_sys_openat+0x20/0x30
[  164.444414]  do_syscall_64+0x57/0x1b0
[  164.444416]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  164.444417] RIP: 0033:0x7fbfc78c22a4
[  164.444418] Code: 24 20 eb 8f 66 90 44 89 54 24 0c e8 26 57 f9 ff 44 8b =
54 24 0c 44 89 e2 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 32 44 89 c7 89 44 24 0c e8 58 57 f9 ff 8b 44
[  164.444419] RSP: 002b:00007fffa90b30d0 EFLAGS: 00000293 ORIG_RAX: 000000=
0000000101
[  164.444420] RAX: ffffffffffffffda RBX: 0000000000080802 RCX: 00007fbfc78=
c22a4
[  164.444421] RDX: 0000000000080802 RSI: 00007fffa90b3290 RDI: 00000000fff=
fff9c
[  164.444421] RBP: 00007fffa90b3290 R08: 0000000000000000 R09: 00000000000=
00011
[  164.444422] R10: 0000000000000000 R11: 0000000000000293 R12: 00000000000=
80802
[  164.444422] R13: 0000000000000004 R14: 000056299bb49d30 R15: 00007fffa90=
b3290
[  164.444423] ---[ end trace 672d911d04f19c62 ]---
[  164.444425] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last =
cmd=3D0x170500
[  164.444441] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last =
cmd=3D0x170500
[  164.444452] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last =
cmd=3D0x170500
[  164.444463] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last =
cmd=3D0x170500
[  164.444474] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last =
cmd=3D0x170500
[  164.444484] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last =
cmd=3D0x170500
[  164.444495] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last =
cmd=3D0x170500
[  164.444505] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last =
cmd=3D0x170500
[  164.444516] snd_hda_intel 0000:08:00.1: spurious response 0x0:0x0, last =
cmd=3D0x170500
[  165.456121] snd_hda_intel 0000:08:00.1: No response from codec, disablin=
g MSI: last cmd=3D0x001f0500
[  166.467616] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x001f0500
[  167.499474] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00170500
[  168.503140] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x001f0500
[  169.538760] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00170500
[  170.550249] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x001f0500
[  171.589899] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00170500
[  172.597536] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x001f0500
[  173.633235] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00170500
[  174.637003] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x001f0500
[  175.672762] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00170500
[  176.680406] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x001f0500
[  177.716075] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00170500
[  178.723795] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x001f0500
[  179.755429] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00170500
[  180.759238] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x001f0500
[  181.799141] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00170500
[  182.806895] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x001f0500
[  183.846556] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00170500
[  184.850348] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x001f0500
[  185.886088] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00370740
[  186.889818] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00570740
[  187.893482] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00770740
[  188.897272] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00970740
[  189.900993] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00b70740
[  190.904844] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00d70740
[  191.908665] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00377200
[  192.912265] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00378901
[  193.915999] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00577200
[  194.919832] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00578901
[  195.931572] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00777200
[  196.935332] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00778901
[  197.939002] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00977200
[  198.942648] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00978901
[  199.946595] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00b77200
[  200.950252] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00b78901
[  201.958249] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00d77200
[  202.961906] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00d78901
[  203.965758] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00270d01
[  203.965763] snd_hda_codec_hdmi hdaudioC1D0: Unable to sync register 0x2f=
0d00. -11
[  204.969507] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x003f0900
[  205.973343] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x005f0900
[  206.985058] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x007f0900
[  207.988851] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x009f0900
[  208.992554] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00bf0900
[  209.996439] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00df0900
[  211.000227] snd_hda_intel 0000:08:00.1: No response from codec, resettin=
g bus: last cmd=3D0x00570100
[  212.007916] snd_hda_intel 0000:08:00.1: azx_get_response timeout, switch=
ing to single_cmd mode: last cmd=3D0x00570100
[  217.099693] azx_single_wait_for_response: 2 callbacks suppressed

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=dmesg-blacklist-0

[    0.000000] microcode: microcode updated early to revision 0xca, date = 2019-10-03
[    0.000000] Linux version 5.7.0-rc3+ (nicholas@nicholas-dell-linux) (gcc version 9.3.0 (Arch Linux 9.3.0-1), GNU ld (GNU Binutils) 2.34) #7 SMP Tue Apr 28 09:55:03 AWST 2020
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-5.7-rc3 root=UUID=e9880a1b-a4f2-4779-8a98-6c1bee968ebe rw sysrq_always_enabled audit=0 pcie_ports=native pci=assign-busses,hpbussize=0x33,hpmemsize=16K,hpiosize=0,hpmmiosize=400M,hpmmioprefsize=64G,nocrs,realloc intel_iommu=on iommu=on video=vesafb:off
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
[    0.000000] efi:  ACPI=0x3d778000  ACPI 2.0=0x3d778000  SMBIOS=0xf0000  SMBIOS 3.0=0xf0020  TPMFinalLog=0x3de0e000  ESRT=0x3fdb5018  MEMATTR=0x3a84a018 
[    0.000000] SMBIOS 3.0.0 present.
[    0.000000] DMI: Dell Inc. XPS 13 9370/09DKKT, BIOS 1.11.1 07/11/2019
[    0.000000] tsc: Detected 2100.000 MHz processor
[    0.001375] tsc: Detected 2099.944 MHz TSC
[    0.001375] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.001377] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.001382] last_pfn = 0x4ae800 max_arch_pfn = 0x400000000
[    0.001385] MTRR default type: write-back
[    0.001386] MTRR fixed ranges enabled:
[    0.001387]   00000-9FFFF write-back
[    0.001388]   A0000-BFFFF uncachable
[    0.001388]   C0000-FFFFF write-protect
[    0.001389] MTRR variable ranges enabled:
[    0.001390]   0 base 0080000000 mask 7F80000000 uncachable
[    0.001390]   1 base 0060000000 mask 7FE0000000 uncachable
[    0.001391]   2 base 0050000000 mask 7FF0000000 uncachable
[    0.001391]   3 base 004C000000 mask 7FFC000000 uncachable
[    0.001392]   4 base 004B000000 mask 7FFF000000 uncachable
[    0.001392]   5 disabled
[    0.001393]   6 disabled
[    0.001393]   7 disabled
[    0.001393]   8 disabled
[    0.001394]   9 disabled
[    0.001717] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.002155] last_pfn = 0x48e00 max_arch_pfn = 0x400000000
[    0.008186] esrt: Reserving ESRT space from 0x000000003fdb5018 to 0x000000003fdb5050.
[    0.008191] check: Scanning 1 areas for low memory corruption
[    0.008196] Using GB pages for direct mapping
[    0.008197] BRK [0x433401000, 0x433401fff] PGTABLE
[    0.008199] BRK [0x433402000, 0x433402fff] PGTABLE
[    0.008199] BRK [0x433403000, 0x433403fff] PGTABLE
[    0.008220] BRK [0x433404000, 0x433404fff] PGTABLE
[    0.008222] BRK [0x433405000, 0x433405fff] PGTABLE
[    0.008293] BRK [0x433406000, 0x433406fff] PGTABLE
[    0.008320] BRK [0x433407000, 0x433407fff] PGTABLE
[    0.008337] BRK [0x433408000, 0x433408fff] PGTABLE
[    0.008343] BRK [0x433409000, 0x433409fff] PGTABLE
[    0.008379] Secure boot could not be determined
[    0.008380] RAMDISK: [mem 0x26fbe000-0x27b18fff]
[    0.008392] ACPI: Early table checksum verification disabled
[    0.008396] ACPI: RSDP 0x000000003D778000 000024 (v02 DELL  )
[    0.008398] ACPI: XSDT 0x000000003D7780C8 00010C (v01 DELL   CBX3     01072009 AMI  00010013)
[    0.008403] ACPI: FACP 0x000000003D79E9D8 00010C (v05 DELL   CBX3     01072009 AMI  00010013)
[    0.008407] ACPI: DSDT 0x000000003D778260 026773 (v02 DELL   CBX3     01072009 INTL 20160422)
[    0.008409] ACPI: FACS 0x000000003DE6A180 000040
[    0.008411] ACPI: APIC 0x000000003D79EAE8 0000BC (v03 DELL   CBX3     01072009 AMI  00010013)
[    0.008413] ACPI: FPDT 0x000000003D79EBA8 000044 (v01 DELL   CBX3     01072009 AMI  00010013)
[    0.008415] ACPI: FIDT 0x000000003D79EBF0 0000AC (v01 DELL   CBX3     01072009 AMI  00010013)
[    0.008417] ACPI: MCFG 0x000000003D79ECA0 00003C (v01 DELL   CBX3     01072009 MSFT 00000097)
[    0.008419] ACPI: HPET 0x000000003D79ECE0 000038 (v01 DELL   CBX3     01072009 AMI. 0005000B)
[    0.008421] ACPI: SSDT 0x000000003D79ED18 000359 (v01 SataRe SataTabl 00001000 INTL 20160422)
[    0.008423] ACPI: BOOT 0x000000003D79F078 000028 (v01 DELL   CBX3     01072009 AMI  00010013)
[    0.008425] ACPI: SSDT 0x000000003D79F0A0 0012DE (v02 SaSsdt SaSsdt   00003000 INTL 20160422)
[    0.008427] ACPI: HPET 0x000000003D7A0380 000038 (v01 INTEL  KBL-ULT  00000001 MSFT 0000005F)
[    0.008429] ACPI: SSDT 0x000000003D7A03B8 000CEF (v02 INTEL  xh_rvp07 00000000 INTL 20160422)
[    0.008431] ACPI: UEFI 0x000000003D7A10A8 000042 (v01                 00000000      00000000)
[    0.008433] ACPI: SSDT 0x000000003D7A10F0 0017AE (v02 CpuRef CpuSsdt  00003000 INTL 20160422)
[    0.008435] ACPI: LPIT 0x000000003D7A28A0 000094 (v01 INTEL  KBL-ULT  00000000 MSFT 0000005F)
[    0.008437] ACPI: SSDT 0x000000003D7A2938 000161 (v02 INTEL  HdaDsp   00000000 INTL 20160422)
[    0.008439] ACPI: SSDT 0x000000003D7A2AA0 00029F (v02 INTEL  sensrhub 00000000 INTL 20160422)
[    0.008441] ACPI: SSDT 0x000000003D7A2D40 003002 (v02 INTEL  PtidDevc 00001000 INTL 20160422)
[    0.008443] ACPI: SSDT 0x000000003D7A5D48 000517 (v02 INTEL  TbtTypeC 00000000 INTL 20160422)
[    0.008445] ACPI: DBGP 0x000000003D7A6260 000034 (v01 INTEL           00000002 MSFT 0000005F)
[    0.008447] ACPI: DBG2 0x000000003D7A6298 000054 (v00 INTEL           00000002 MSFT 0000005F)
[    0.008449] ACPI: SSDT 0x000000003D7A62F0 000801 (v02 INTEL  UsbCTabl 00001000 INTL 20160422)
[    0.008451] ACPI: SSDT 0x000000003D7A6AF8 00CFC3 (v02 DptfTa DptfTabl 00001000 INTL 20160422)
[    0.008453] ACPI: MSDM 0x000000003D7B3AC0 000055 (v03 DELL   CBX3     06222004 AMI  00010013)
[    0.008455] ACPI: SLIC 0x000000003D7B3B18 000176 (v03 DELL   CBX3     01072009 MSFT 00010013)
[    0.008457] ACPI: NHLT 0x000000003D7B3C90 00002D (v00 INTEL  EDK2     00000002      01000013)
[    0.008459] ACPI: TPM2 0x000000003D7B3CC0 000034 (v03 DELL   CBX3     00000001 AMI  00000000)
[    0.008461] ACPI: ASF! 0x000000003D7B3CF8 0000A0 (v32 INTEL   HCG     00000001 TFSM 000F4240)
[    0.008464] ACPI: DMAR 0x000000003D7B3D98 0000F0 (v01 INTEL  KBL      00000001 INTL 00000001)
[    0.008466] ACPI: BGRT 0x000000003D7B3E88 000038 (v00                 01072009 AMI  00010013)
[    0.008472] ACPI: Local APIC address 0xfee00000
[    0.008633] No NUMA configuration found
[    0.008634] Faking a node at [mem 0x0000000000000000-0x00000004ae7fffff]
[    0.008643] NODE_DATA(0) allocated [mem 0x4ae7d6000-0x4ae7fffff]
[    0.008859] Zone ranges:
[    0.008860]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.008861]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.008861]   Normal   [mem 0x0000000100000000-0x00000004ae7fffff]
[    0.008862]   Device   empty
[    0.008863] Movable zone start for each node
[    0.008866] Early memory node ranges
[    0.008866]   node   0: [mem 0x0000000000001000-0x0000000000057fff]
[    0.008867]   node   0: [mem 0x0000000000059000-0x000000000009dfff]
[    0.008868]   node   0: [mem 0x0000000000100000-0x000000002bd32fff]
[    0.008869]   node   0: [mem 0x000000002bd35000-0x000000003d383fff]
[    0.008869]   node   0: [mem 0x000000003ffff000-0x000000003fffffff]
[    0.008870]   node   0: [mem 0x0000000048000000-0x0000000048dfffff]
[    0.008871]   node   0: [mem 0x0000000100000000-0x00000004ae7fffff]
[    0.009184] Zeroed struct page in unavailable ranges: 46817 pages
[    0.009185] Initmem setup node 0 [mem 0x0000000000001000-0x00000004ae7fffff]
[    0.009187] On node 0 totalpages: 4114719
[    0.009188]   DMA zone: 64 pages used for memmap
[    0.009188]   DMA zone: 22 pages reserved
[    0.009189]   DMA zone: 3996 pages, LIFO batch:0
[    0.009226]   DMA32 zone: 3911 pages used for memmap
[    0.009227]   DMA32 zone: 250243 pages, LIFO batch:63
[    0.012252]   Normal zone: 60320 pages used for memmap
[    0.012252]   Normal zone: 3860480 pages, LIFO batch:63
[    0.049640] Reserving Intel graphics memory at [mem 0x4b800000-0x4f7fffff]
[    0.050239] ACPI: PM-Timer IO Port: 0x1808
[    0.050240] ACPI: Local APIC address 0xfee00000
[    0.050246] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.050247] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.050247] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.050248] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.050249] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.050249] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.050250] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.050251] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.050281] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.050283] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.050286] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.050287] ACPI: IRQ0 used by override.
[    0.050288] ACPI: IRQ9 used by override.
[    0.050289] Using ACPI (MADT) for SMP configuration information
[    0.050291] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.050295] e820: update [mem 0x39d44000-0x39db7fff] usable ==> reserved
[    0.050302] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.050318] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.050320] PM: hibernation: Registered nosave memory: [mem 0x00058000-0x00058fff]
[    0.050321] PM: hibernation: Registered nosave memory: [mem 0x0009e000-0x000fffff]
[    0.050322] PM: hibernation: Registered nosave memory: [mem 0x2bd33000-0x2bd33fff]
[    0.050323] PM: hibernation: Registered nosave memory: [mem 0x2bd34000-0x2bd34fff]
[    0.050324] PM: hibernation: Registered nosave memory: [mem 0x39d44000-0x39db7fff]
[    0.050325] PM: hibernation: Registered nosave memory: [mem 0x3d384000-0x3d743fff]
[    0.050326] PM: hibernation: Registered nosave memory: [mem 0x3d744000-0x3d7b4fff]
[    0.050326] PM: hibernation: Registered nosave memory: [mem 0x3d7b5000-0x3de6cfff]
[    0.050327] PM: hibernation: Registered nosave memory: [mem 0x3de6d000-0x3ff25fff]
[    0.050327] PM: hibernation: Registered nosave memory: [mem 0x3ff26000-0x3fffefff]
[    0.050329] PM: hibernation: Registered nosave memory: [mem 0x40000000-0x47ffffff]
[    0.050330] PM: hibernation: Registered nosave memory: [mem 0x48e00000-0x4f7fffff]
[    0.050331] PM: hibernation: Registered nosave memory: [mem 0x4f800000-0xdfffffff]
[    0.050331] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0xefffffff]
[    0.050332] PM: hibernation: Registered nosave memory: [mem 0xf0000000-0xfdffffff]
[    0.050332] PM: hibernation: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
[    0.050333] PM: hibernation: Registered nosave memory: [mem 0xfe011000-0xfebfffff]
[    0.050333] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.050334] PM: hibernation: Registered nosave memory: [mem 0xfec01000-0xfedfffff]
[    0.050335] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.050335] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0xfeffffff]
[    0.050336] PM: hibernation: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.050337] [mem 0x4f800000-0xdfffffff] available for PCI devices
[    0.050338] Booting paravirtualized kernel on bare hardware
[    0.050341] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.050347] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
[    0.050706] percpu: Embedded 57 pages/cpu s196608 r8192 d28672 u262144
[    0.050712] pcpu-alloc: s196608 r8192 d28672 u262144 alloc=1*2097152
[    0.050712] pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
[    0.050733] Built 1 zonelists, mobility grouping on.  Total pages: 4050402
[    0.050734] Policy zone: Normal
[    0.050735] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-5.7-rc3 root=UUID=e9880a1b-a4f2-4779-8a98-6c1bee968ebe rw sysrq_always_enabled audit=0 pcie_ports=native pci=assign-busses,hpbussize=0x33,hpmemsize=16K,hpiosize=0,hpmmiosize=400M,hpmmioprefsize=64G,nocrs,realloc intel_iommu=on iommu=on video=vesafb:off
[    0.050779] sysrq: sysrq always enabled.
[    0.050789] audit: disabled (until reboot)
[    0.050828] DMAR: IOMMU enabled
[    0.051909] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.052458] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.052523] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.100424] Memory: 16014372K/16458876K available (14339K kernel code, 2527K rwdata, 4992K rodata, 2588K init, 4988K bss, 444504K reserved, 0K cma-reserved)
[    0.100433] random: get_random_u64 called from __kmem_cache_create+0x42/0x540 with crng_init=0
[    0.100533] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.100544] Kernel/User page tables isolation: enabled
[    0.100561] ftrace: allocating 44939 entries in 176 pages
[    0.114776] ftrace: allocated 176 pages with 3 groups
[    0.114878] rcu: Hierarchical RCU implementation.
[    0.114879] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=8.
[    0.114880] 	Tasks RCU enabled.
[    0.114881] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.114881] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.117643] NR_IRQS: 524544, nr_irqs: 2048, preallocated irqs: 16
[    0.117917] random: crng done (trusting CPU's manufacturer)
[    0.117950] spurious 8259A interrupt: IRQ7.
[    0.117974] Console: colour dummy device 80x25
[    0.118149] printk: console [tty0] enabled
[    0.118164] ACPI: Core revision 20200326
[    0.118425] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
[    0.118529] APIC: Switch to symmetric I/O mode setup
[    0.118532] DMAR: Host address width 39
[    0.118534] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.118539] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 19e2ff0505e
[    0.118541] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.118545] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
[    0.118547] DMAR: RMRR base: 0x0000003d45f000 end: 0x0000003d47efff
[    0.118549] DMAR: RMRR base: 0x0000004b000000 end: 0x0000004f7fffff
[    0.118551] DMAR: ANDD device: 1 name: \_SB.PCI0.I2C0
[    0.118552] DMAR: ANDD device: 2 name: \_SB.PCI0.I2C1
[    0.118554] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.118556] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.118557] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    0.120197] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.120200] x2apic enabled
[    0.120225] Switched APIC routing to cluster x2apic.
[    0.124362] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.142604] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x1e44fb6c2ab, max_idle_ns: 440795206594 ns
[    0.142609] Calibrating delay loop (skipped), value calculated using timer frequency.. 4199.88 BogoMIPS (lpj=8399776)
[    0.142613] pid_max: default: 32768 minimum: 301
[    0.144464] LSM: Security Framework initializing
[    0.144473] Yama: becoming mindful.
[    0.144494] AppArmor: AppArmor initialized
[    0.144550] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.144581] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.144800] mce: CPU0: Thermal monitoring enabled (TM1)
[    0.144819] process: using mwait in idle threads
[    0.144822] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.144823] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.144826] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.144828] Spectre V2 : Mitigation: Full generic retpoline
[    0.144829] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.144831] Spectre V2 : Enabling Restricted Speculation for firmware calls
[    0.144833] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.144835] Spectre V2 : User space: Mitigation: STIBP via seccomp and prctl
[    0.144837] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[    0.144841] TAA: Mitigation: Clear CPU buffers
[    0.144842] MDS: Mitigation: Clear CPU buffers
[    0.145046] Freeing SMP alternatives memory: 40K
[    0.147355] TSC deadline timer enabled
[    0.147360] smpboot: CPU0: Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz (family: 0x6, model: 0x8e, stepping: 0xa)
[    0.147442] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.147449] ... version:                4
[    0.147450] ... bit width:              48
[    0.147451] ... generic registers:      4
[    0.147452] ... value mask:             0000ffffffffffff
[    0.147453] ... max period:             00007fffffffffff
[    0.147454] ... fixed-purpose events:   3
[    0.147456] ... event mask:             000000070000000f
[    0.147487] rcu: Hierarchical SRCU implementation.
[    0.148329] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.148389] smp: Bringing up secondary CPUs ...
[    0.148453] x86: Booting SMP configuration:
[    0.148455] .... node  #0, CPUs:      #1 #2 #3 #4
[    0.151730] MDS CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more details.
[    0.151730] TAA CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/tsx_async_abort.html for more details.
[    0.151730]  #5 #6 #7
[    0.154963] smp: Brought up 1 node, 8 CPUs
[    0.154963] smpboot: Max logical packages: 1
[    0.154963] smpboot: Total of 8 processors activated (33599.10 BogoMIPS)
[    0.157628] devtmpfs: initialized
[    0.157628] x86/mm: Memory block size: 128MB
[    0.159696] PM: Registering ACPI NVS region [mem 0x2bd33000-0x2bd33fff] (4096 bytes)
[    0.159696] PM: Registering ACPI NVS region [mem 0x3d7b5000-0x3de6cfff] (7045120 bytes)
[    0.159696] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.159696] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.159696] pinctrl core: initialized pinctrl subsystem
[    0.159696] PM: RTC time: 09:58:37, date: 2020-04-29
[    0.159696] thermal_sys: Registered thermal governor 'fair_share'
[    0.159696] thermal_sys: Registered thermal governor 'bang_bang'
[    0.159696] thermal_sys: Registered thermal governor 'step_wise'
[    0.159696] thermal_sys: Registered thermal governor 'user_space'
[    0.159696] NET: Registered protocol family 16
[    0.159696] EISA bus registered
[    0.159696] cpuidle: using governor ladder
[    0.159696] cpuidle: using governor menu
[    0.159696] Simple Boot Flag at 0x47 set to 0x80
[    0.159696] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.159696] ACPI: bus type PCI registered
[    0.159696] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.159696] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.159696] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.159696] PCI: Using configuration type 1 for base access
[    0.159696] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.159696] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.159696] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.162661] ACPI: Added _OSI(Module Device)
[    0.162663] ACPI: Added _OSI(Processor Device)
[    0.162664] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.162665] ACPI: Added _OSI(Processor Aggregator Device)
[    0.162667] ACPI: Added _OSI(Linux-Dell-Video)
[    0.162668] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.162670] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.202045] ACPI: 11 ACPI AML tables successfully acquired and loaded
[    0.206908] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.213292] ACPI: Dynamic OEM Table Load:
[    0.213299] ACPI: SSDT 0xFFFFA0F61C3D1000 0005EE (v02 PmRef  Cpu0Ist  00003000 INTL 20160422)
[    0.214572] ACPI: \_PR_.PR00: _OSC native thermal LVT Acked
[    0.215515] ACPI: Dynamic OEM Table Load:
[    0.215520] ACPI: SSDT 0xFFFFA0F61BF7A400 0003FF (v02 PmRef  Cpu0Cst  00003001 INTL 20160422)
[    0.216740] ACPI: Dynamic OEM Table Load:
[    0.216744] ACPI: SSDT 0xFFFFA0F61BE59180 0000BA (v02 PmRef  Cpu0Hwp  00003000 INTL 20160422)
[    0.217903] ACPI: Dynamic OEM Table Load:
[    0.217907] ACPI: SSDT 0xFFFFA0F61C3D4000 000628 (v02 PmRef  HwpLvt   00003000 INTL 20160422)
[    0.219413] ACPI: Dynamic OEM Table Load:
[    0.219419] ACPI: SSDT 0xFFFFA0F61BC3D000 000D14 (v02 PmRef  ApIst    00003000 INTL 20160422)
[    0.221282] ACPI: Dynamic OEM Table Load:
[    0.221286] ACPI: SSDT 0xFFFFA0F61BF7F800 000317 (v02 PmRef  ApHwp    00003000 INTL 20160422)
[    0.222548] ACPI: Dynamic OEM Table Load:
[    0.222552] ACPI: SSDT 0xFFFFA0F61BF78800 00030A (v02 PmRef  ApCst    00003000 INTL 20160422)
[    0.226194] ACPI: EC: EC started
[    0.226196] ACPI: EC: interrupt blocked
[    0.234006] ACPI: EC: EC_CMD/EC_SC=0x934, EC_DATA=0x930
[    0.234009] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC used to handle transactions
[    0.234010] ACPI: Interpreter enabled
[    0.234048] ACPI: (supports S0 S3 S4 S5)
[    0.234050] ACPI: Using IOAPIC for interrupt routing
[    0.234082] PCI: Ignoring host bridge windows from ACPI; if necessary, use "pci=use_crs" and report a bug
[    0.234685] ACPI: Enabled 8 GPEs in block 00 to 7F
[    0.242660] ACPI: Power Resource [WRST] (on)
[    0.262984] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.262990] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.263331] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug SHPCHotplug PME AER]
[    0.263654] acpi PNP0A08:00: _OSC: OS now controls [PCIeCapability LTR]
[    0.263657] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.263940] acpi PNP0A08:00: host bridge window [io  0x0000-0x0cf7 window] (ignored)
[    0.263941] acpi PNP0A08:00: host bridge window [io  0x0cf8-0x0cff] (ignored)
[    0.263942] acpi PNP0A08:00: host bridge window [io  0x0d00-0xffff window] (ignored)
[    0.263942] acpi PNP0A08:00: host bridge window [mem 0x000a0000-0x000bffff window] (ignored)
[    0.263943] acpi PNP0A08:00: host bridge window [mem 0x000c0000-0x000c3fff window] (ignored)
[    0.263944] acpi PNP0A08:00: host bridge window [mem 0x000c4000-0x000c7fff window] (ignored)
[    0.263944] acpi PNP0A08:00: host bridge window [mem 0x000c8000-0x000cbfff window] (ignored)
[    0.263945] acpi PNP0A08:00: host bridge window [mem 0x000cc000-0x000cffff window] (ignored)
[    0.263945] acpi PNP0A08:00: host bridge window [mem 0x000d0000-0x000d3fff window] (ignored)
[    0.263946] acpi PNP0A08:00: host bridge window [mem 0x000d4000-0x000d7fff window] (ignored)
[    0.263947] acpi PNP0A08:00: host bridge window [mem 0x000d8000-0x000dbfff window] (ignored)
[    0.263947] acpi PNP0A08:00: host bridge window [mem 0x000dc000-0x000dffff window] (ignored)
[    0.263948] acpi PNP0A08:00: host bridge window [mem 0x4f800000-0xdfffffff window] (ignored)
[    0.263949] acpi PNP0A08:00: host bridge window [mem 0xfd000000-0xfe7fffff window] (ignored)
[    0.263949] PCI: root bus 00: using default resources
[    0.264304] PCI host bridge to bus 0000:00
[    0.264306] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    0.264308] pci_bus 0000:00: root bus resource [mem 0x00000000-0x7fffffffff]
[    0.264310] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.264319] pci 0000:00:00.0: [8086:5914] type 00 class 0x060000
[    0.264436] pci 0000:00:02.0: [8086:5917] type 00 class 0x030000
[    0.264447] pci 0000:00:02.0: reg 0x10: [mem 0xdb000000-0xdbffffff 64bit]
[    0.264452] pci 0000:00:02.0: reg 0x18: [mem 0x50000000-0x5fffffff 64bit pref]
[    0.264457] pci 0000:00:02.0: reg 0x20: [io  0xf000-0xf03f]
[    0.264470] pci 0000:00:02.0: BAR 2: assigned to efifb
[    0.264615] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000
[    0.264628] pci 0000:00:04.0: reg 0x10: [mem 0xdc320000-0xdc327fff 64bit]
[    0.264837] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
[    0.264859] pci 0000:00:14.0: reg 0x10: [mem 0xdc310000-0xdc31ffff 64bit]
[    0.264922] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.265125] pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
[    0.265146] pci 0000:00:14.2: reg 0x10: [mem 0xdc335000-0xdc335fff 64bit]
[    0.265338] pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000
[    0.265385] pci 0000:00:15.0: reg 0x10: [mem 0xdc334000-0xdc334fff 64bit]
[    0.265664] pci 0000:00:15.1: [8086:9d61] type 00 class 0x118000
[    0.265726] pci 0000:00:15.1: reg 0x10: [mem 0xdc333000-0xdc333fff 64bit]
[    0.266032] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
[    0.266050] pci 0000:00:16.0: reg 0x10: [mem 0xdc332000-0xdc332fff 64bit]
[    0.266096] pci 0000:00:16.0: PME# supported from D3hot
[    0.266236] pci 0000:00:16.3: [8086:9d3d] type 00 class 0x070002
[    0.266250] pci 0000:00:16.3: reg 0x10: [io  0xf060-0xf067]
[    0.266255] pci 0000:00:16.3: reg 0x14: [mem 0xdc331000-0xdc331fff]
[    0.266411] pci 0000:00:1c.0: [8086:9d10] type 01 class 0x060400
[    0.266492] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.266512] pci 0000:00:1c.0: Intel SPT PCH root port ACS workaround enabled
[    0.266684] pci 0000:00:1c.2: [8086:9d12] type 01 class 0x060400
[    0.266761] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.266781] pci 0000:00:1c.2: Intel SPT PCH root port ACS workaround enabled
[    0.266947] pci 0000:00:1c.4: [8086:9d14] type 01 class 0x060400
[    0.267078] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.267097] pci 0000:00:1c.4: Intel SPT PCH root port ACS workaround enabled
[    0.267264] pci 0000:00:1d.0: [8086:9d18] type 01 class 0x060400
[    0.267332] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.267348] pci 0000:00:1d.0: Intel SPT PCH root port ACS workaround enabled
[    0.267535] pci 0000:00:1f.0: [8086:9d4e] type 00 class 0x060100
[    0.267721] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
[    0.267734] pci 0000:00:1f.2: reg 0x10: [mem 0xdc32c000-0xdc32ffff]
[    0.267891] pci 0000:00:1f.3: [8086:9d71] type 00 class 0x040380
[    0.267915] pci 0000:00:1f.3: reg 0x10: [mem 0xdc328000-0xdc32bfff 64bit]
[    0.267939] pci 0000:00:1f.3: reg 0x20: [mem 0xdc300000-0xdc30ffff 64bit]
[    0.267983] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.268198] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500
[    0.268260] pci 0000:00:1f.4: reg 0x10: [mem 0xdc330000-0xdc3300ff 64bit]
[    0.268332] pci 0000:00:1f.4: reg 0x20: [io  0xf040-0xf05f]
[    0.268919] pci 0000:01:00.0: [10ec:525a] type 00 class 0xff0000
[    0.268948] pci 0000:01:00.0: reg 0x14: [mem 0xdc200000-0xdc200fff]
[    0.269049] pci 0000:01:00.0: supports D1 D2
[    0.269051] pci 0000:01:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.269509] pci 0000:00:1c.0: PCI bridge to [bus 01-fe]
[    0.269513] pci 0000:00:1c.0:   bridge window [mem 0xdc200000-0xdc2fffff]
[    0.269518] pci_bus 0000:01: busn_res: [bus 01-fe] end is updated to 01
[    0.270188] pci 0000:02:00.0: [8086:24fd] type 00 class 0x028000
[    0.270286] pci 0000:02:00.0: reg 0x10: [mem 0xdc100000-0xdc101fff 64bit]
[    0.270505] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.271201] pci 0000:00:1c.2: PCI bridge to [bus 02-fe]
[    0.271205] pci 0000:00:1c.2:   bridge window [mem 0xdc100000-0xdc1fffff]
[    0.271210] pci_bus 0000:02: busn_res: [bus 02-fe] end is updated to 02
[    0.271292] pci 0000:00:1c.4: PCI bridge to [bus 03-fe]
[    0.271296] pci 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0fffff]
[    0.271301] pci 0000:00:1c.4:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[    0.271303] pci_bus 0000:03: busn_res: [bus 03-fe] end is updated to 35
[    0.271377] pci 0000:36:00.0: [1179:0116] type 00 class 0x010802
[    0.271403] pci 0000:36:00.0: reg 0x10: [mem 0xdc000000-0xdc003fff 64bit]
[    0.271611] pci 0000:00:1d.0: PCI bridge to [bus 36-fe]
[    0.271615] pci 0000:00:1d.0:   bridge window [mem 0xdc000000-0xdc0fffff]
[    0.271620] pci_bus 0000:36: busn_res: [bus 36-fe] end is updated to 36
[    0.273281] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.273336] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 15)
[    0.273389] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.273441] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.273494] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.273547] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.273599] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.273651] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.287106] ACPI: EC: interrupt unblocked
[    0.287106] ACPI: EC: event unblocked
[    0.287108] ACPI: EC: EC_CMD/EC_SC=0x934, EC_DATA=0x930
[    0.287108] ACPI: EC: GPE=0x6e
[    0.287108] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC initialization complete
[    0.287108] ACPI: \_SB_.PCI0.LPCB.ECDV: EC: Used to handle transactions and events
[    0.287108] iommu: Default domain type: Translated 
[    0.287108] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.287108] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.287108] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.287108] vgaarb: loaded
[    0.287195] SCSI subsystem initialized
[    0.287208] libata version 3.00 loaded.
[    0.287208] ACPI: bus type USB registered
[    0.287208] usbcore: registered new interface driver usbfs
[    0.287208] usbcore: registered new interface driver hub
[    0.287208] usbcore: registered new device driver usb
[    0.287208] pps_core: LinuxPPS API ver. 1 registered
[    0.287208] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.287208] PTP clock support registered
[    0.287208] EDAC MC: Ver: 3.0.0
[    0.287775] Registered efivars operations
[    0.287775] PCI: Using ACPI for IRQ routing
[    0.312454] PCI: pci_cache_line_size set to 64 bytes
[    0.313664] e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]
[    0.313665] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
[    0.313665] e820: reserve RAM buffer [mem 0x2bd33000-0x2bffffff]
[    0.313666] e820: reserve RAM buffer [mem 0x39d44000-0x3bffffff]
[    0.313666] e820: reserve RAM buffer [mem 0x3d384000-0x3fffffff]
[    0.313667] e820: reserve RAM buffer [mem 0x48e00000-0x4bffffff]
[    0.313668] e820: reserve RAM buffer [mem 0x4ae800000-0x4afffffff]
[    0.313741] NetLabel: Initializing
[    0.313742] NetLabel:  domain hash size = 128
[    0.313743] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.313754] NetLabel:  unlabeled traffic allowed by default
[    0.315258] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.315261] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    0.318608] clocksource: Switched to clocksource tsc-early
[    0.328293] VFS: Disk quotas dquot_6.6.0
[    0.328309] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.328388] AppArmor: AppArmor Filesystem Enabled
[    0.328417] pnp: PnP ACPI init
[    0.328715] system 00:00: [io  0x0680-0x069f] has been reserved
[    0.328718] system 00:00: [io  0xffff] has been reserved
[    0.328719] system 00:00: [io  0xffff] has been reserved
[    0.328722] system 00:00: [io  0xffff] has been reserved
[    0.328723] system 00:00: [io  0x1800-0x18fe] has been reserved
[    0.328725] system 00:00: [io  0x164e-0x164f] has been reserved
[    0.328730] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.328818] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.328851] system 00:02: [io  0x1854-0x1857] has been reserved
[    0.328855] system 00:02: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
[    0.328973] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.328984] pnp 00:04: Plug and Play ACPI device, IDs DLL07e6 PNP0f13 (active)
[    0.329212] system 00:05: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.329215] system 00:05: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.329217] system 00:05: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.329218] system 00:05: [mem 0xe0000000-0xefffffff] has been reserved
[    0.329220] system 00:05: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.329222] system 00:05: [mem 0xfed90000-0xfed93fff] could not be reserved
[    0.329224] system 00:05: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.329226] system 00:05: [mem 0xff000000-0xffffffff] has been reserved
[    0.329227] system 00:05: [mem 0xfee00000-0xfeefffff] could not be reserved
[    0.329229] system 00:05: [mem 0xdffe0000-0xdfffffff] has been reserved
[    0.329232] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.329269] system 00:06: [mem 0xfd000000-0xfdabffff] has been reserved
[    0.329271] system 00:06: [mem 0xfdad0000-0xfdadffff] has been reserved
[    0.329272] system 00:06: [mem 0xfdb00000-0xfdffffff] has been reserved
[    0.329274] system 00:06: [mem 0xfe000000-0xfe01ffff] could not be reserved
[    0.329276] system 00:06: [mem 0xfe036000-0xfe03bfff] has been reserved
[    0.329278] system 00:06: [mem 0xfe03d000-0xfe3fffff] has been reserved
[    0.329280] system 00:06: [mem 0xfe410000-0xfe7fffff] has been reserved
[    0.329282] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.329549] system 00:07: [io  0xff00-0xfffe] has been reserved
[    0.329552] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.330585] system 00:08: [mem 0xfe029000-0xfe029fff] has been reserved
[    0.330588] system 00:08: [mem 0xfe028000-0xfe028fff] has been reserved
[    0.330591] system 00:08: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.334786] pnp: PnP ACPI: found 9 devices
[    0.340080] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.340104] pci_bus 0000:00: max bus depth: 1 pci_try_num: 2
[    0.340111] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.340117] pci 0000:00:1c.0:   bridge window [mem 0xdc200000-0xdc2fffff]
[    0.340123] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    0.340142] pci 0000:00:1c.2:   bridge window [mem 0xdc100000-0xdc1fffff]
[    0.340148] pci 0000:00:1c.4: PCI bridge to [bus 03-35]
[    0.340153] pci 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0fffff]
[    0.340157] pci 0000:00:1c.4:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[    0.340162] pci 0000:00:1d.0: PCI bridge to [bus 36]
[    0.340165] pci 0000:00:1d.0:   bridge window [mem 0xdc000000-0xdc0fffff]
[    0.340171] pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
[    0.340173] pci_bus 0000:00: resource 5 [mem 0x00000000-0x7fffffffff]
[    0.340175] pci_bus 0000:01: resource 1 [mem 0xdc200000-0xdc2fffff]
[    0.340177] pci_bus 0000:02: resource 1 [mem 0xdc100000-0xdc1fffff]
[    0.340178] pci_bus 0000:03: resource 1 [mem 0xac000000-0xda0fffff]
[    0.340180] pci_bus 0000:03: resource 2 [mem 0x60000000-0xa9ffffff 64bit pref]
[    0.340182] pci_bus 0000:36: resource 1 [mem 0xdc000000-0xdc0fffff]
[    0.340319] NET: Registered protocol family 2
[    0.340438] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.340517] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.340665] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    0.340720] TCP: Hash tables configured (established 131072 bind 65536)
[    0.340827] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.340865] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.340914] NET: Registered protocol family 1
[    0.340920] NET: Registered protocol family 44
[    0.340928] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.341755] PCI: CLS 0 bytes, default 64
[    0.341785] Trying to unpack rootfs image as initramfs...
[    0.434089] Freeing initrd memory: 11628K
[    0.434134] DMAR: ACPI device "device:75" under DMAR at fed91000 as 00:15.0
[    0.434138] DMAR: ACPI device "device:76" under DMAR at fed91000 as 00:15.1
[    0.434150] DMAR: No ATSR found
[    0.434189] DMAR: dmar0: Using Queued invalidation
[    0.434193] DMAR: dmar1: Using Queued invalidation
[    0.434570] pci 0000:00:00.0: Adding to iommu group 0
[    0.440418] pci 0000:00:02.0: Adding to iommu group 1
[    0.440467] pci 0000:00:04.0: Adding to iommu group 2
[    0.440535] pci 0000:00:14.0: Adding to iommu group 3
[    0.440543] pci 0000:00:14.2: Adding to iommu group 3
[    0.440584] pci 0000:00:15.0: Adding to iommu group 4
[    0.440592] pci 0000:00:15.1: Adding to iommu group 4
[    0.440647] pci 0000:00:16.0: Adding to iommu group 5
[    0.440655] pci 0000:00:16.3: Adding to iommu group 5
[    0.440696] pci 0000:00:1c.0: Adding to iommu group 6
[    0.440750] pci 0000:00:1c.2: Adding to iommu group 7
[    0.440793] pci 0000:00:1c.4: Adding to iommu group 8
[    0.440846] pci 0000:00:1d.0: Adding to iommu group 9
[    0.442172] pci 0000:00:1f.0: Adding to iommu group 10
[    0.442181] pci 0000:00:1f.2: Adding to iommu group 10
[    0.442190] pci 0000:00:1f.3: Adding to iommu group 10
[    0.442200] pci 0000:00:1f.4: Adding to iommu group 10
[    0.442275] pci 0000:01:00.0: Adding to iommu group 11
[    0.442321] pci 0000:02:00.0: Adding to iommu group 12
[    0.442377] pci 0000:36:00.0: Adding to iommu group 13
[    0.442597] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.443965] check: Scanning for low memory corruption every 60 seconds
[    0.445462] Initialise system trusted keyrings
[    0.445471] Key type blacklist registered
[    0.445496] workingset: timestamp_bits=36 max_order=22 bucket_order=0
[    0.446445] zbud: loaded
[    0.446649] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.446751] fuse: init (API version 7.31)
[    0.446875] integrity: Platform Keyring initialized
[    0.450095] Key type asymmetric registered
[    0.450096] Asymmetric key parser 'x509' registered
[    0.450103] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 244)
[    0.450139] io scheduler mq-deadline registered
[    0.450496] pcieport 0000:00:1c.0: PME: Signaling with IRQ 122
[    0.450542] pcieport 0000:00:1c.0: AER: enabled with IRQ 122
[    0.450761] pcieport 0000:00:1c.2: PME: Signaling with IRQ 123
[    0.450808] pcieport 0000:00:1c.2: AER: enabled with IRQ 123
[    0.450994] pcieport 0000:00:1c.4: PME: Signaling with IRQ 124
[    0.451037] pcieport 0000:00:1c.4: AER: enabled with IRQ 124
[    0.451056] pcieport 0000:00:1c.4: pciehp: Slot #8 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.451253] pcieport 0000:00:1d.0: PME: Signaling with IRQ 125
[    0.451286] pcieport 0000:00:1d.0: AER: enabled with IRQ 125
[    0.451352] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.451398] efifb: probing for efifb
[    0.451408] efifb: framebuffer at 0x50000000, using 3072k, total 3072k
[    0.451410] efifb: mode is 1024x768x32, linelength=4096, pages=1
[    0.451411] efifb: scrolling: redraw
[    0.451413] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.451440] fb0: EFI VGA frame buffer device
[    0.451447] intel_idle: MWAIT substates: 0x11142120
[    0.451447] intel_idle: v0.5.1 model 0x8E
[    0.451784] intel_idle: Local APIC timer is reliable in all C-states
[    0.453536] ACPI: AC Adapter [AC] (off-line)
[    0.453583] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
[    0.453605] ACPI: Lid Switch [LID0]
[    0.453623] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
[    0.453636] ACPI: Power Button [PBTN]
[    0.453651] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input2
[    0.453660] ACPI: Sleep Button [SBTN]
[    0.453676] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
[    0.453689] ACPI: Power Button [PWRF]
[    0.456230] thermal LNXTHERM:00: registered as thermal_zone0
[    0.456232] ACPI: Thermal Zone [THM] (25 C)
[    0.456394] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.460545] serial 0000:00:16.3: enabling device (0000 -> 0003)
[    0.482434] 0000:00:16.3: ttyS4 at I/O 0xf060 (irq = 19, base_baud = 115200) is a 16550A
[    0.485083] Linux agpgart interface v0.103
[    0.515061] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0xFC, rev-id 1)
[    0.520131] battery: ACPI: Battery Slot [BAT0] (battery present)
[    0.570190] loop: module loaded
[    0.570502] libphy: Fixed MDIO Bus: probed
[    0.570505] tun: Universal TUN/TAP device driver, 1.6
[    0.570528] PPP generic driver version 2.4.2
[    0.570571] VFIO - User Level meta-driver version: 0.3
[    0.570688] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.570693] ehci-pci: EHCI PCI platform driver
[    0.570704] ehci-platform: EHCI generic platform driver
[    0.570718] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.570721] ohci-pci: OHCI PCI platform driver
[    0.570730] ohci-platform: OHCI generic platform driver
[    0.570738] uhci_hcd: USB Universal Host Controller Interface driver
[    0.570972] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.570979] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[    0.572081] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000081109810
[    0.572300] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[    0.572490] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.07
[    0.572494] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.572497] usb usb1: Product: xHCI Host Controller
[    0.572499] usb usb1: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[    0.572501] usb usb1: SerialNumber: 0000:00:14.0
[    0.572634] hub 1-0:1.0: USB hub found
[    0.572651] hub 1-0:1.0: 12 ports detected
[    0.574065] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.574070] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[    0.574074] xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
[    0.574108] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.07
[    0.574111] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.574114] usb usb2: Product: xHCI Host Controller
[    0.574116] usb usb2: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[    0.574118] usb usb2: SerialNumber: 0000:00:14.0
[    0.574242] hub 2-0:1.0: USB hub found
[    0.574257] hub 2-0:1.0: 6 ports detected
[    0.574586] usb: port power management may be unreliable
[    0.575009] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
[    0.575422] i8042: Warning: Keylock active
[    0.576821] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.576826] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.577024] mousedev: PS/2 mouse device common for all mice
[    0.577448] rtc_cmos 00:01: RTC can wake from S4
[    0.578078] rtc_cmos 00:01: registered as rtc0
[    0.578234] rtc_cmos 00:01: setting system clock to 2020-04-29T09:58:37 UTC (1588154317)
[    0.578272] rtc_cmos 00:01: alarms up to one month, y3k, 242 bytes nvram
[    0.578280] i2c /dev entries driver
[    0.578360] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input4
[    0.579646] device-mapper: uevent: version 1.0.3
[    0.579735] device-mapper: ioctl: 4.42.0-ioctl (2020-02-27) initialised: dm-devel@redhat.com
[    0.579754] platform eisa.0: Probing EISA bus 0
[    0.579764] platform eisa.0: Cannot allocate resource for EISA slot 1
[    0.579816] platform eisa.0: EISA: Detected 0 cards
[    0.579821] intel_pstate: Intel P-state driver initializing
[    0.580574] intel_pstate: HWP enabled
[    0.580790] ledtrig-cpu: registered to indicate activity on CPUs
[    0.580808] EFI Variables Facility v0.08 2004-May-17
[    0.835895] intel_pmc_core INT33A1:00:  initialized
[    0.835975] drop_monitor: Initializing network drop monitor service
[    0.836130] NET: Registered protocol family 10
[    0.841994] Segment Routing with IPv6
[    0.842011] NET: Registered protocol family 17
[    0.842116] Key type dns_resolver registered
[    0.842647] RAS: Correctable Errors collector initialized.
[    0.842704] microcode: sig=0x806ea, pf=0x80, revision=0xca
[    0.843031] microcode: Microcode Update Driver: v2.2.
[    0.843035] IPI shorthand broadcast: enabled
[    0.843041] sched_clock: Marking stable (842299101, 729520)->(845869033, -2840412)
[    0.843245] registered taskstats version 1
[    0.843254] Loading compiled-in X.509 certificates
[    0.844791] Loaded X.509 cert 'Build time autogenerated kernel key: d54ce72edc400484e647ca51da6a4a87c88de3d3'
[    0.844819] zswap: loaded using pool lzo/zbud
[    0.844936] Key type ._fscrypt registered
[    0.844938] Key type .fscrypt registered
[    0.844940] Key type fscrypt-provisioning registered
[    0.850162] Key type big_key registered
[    0.850168] Key type trusted registered
[    0.853067] Key type encrypted registered
[    0.853071] AppArmor: AppArmor sha1 policy hashing enabled
[    0.854787] integrity: Loading X.509 certificate: UEFI:db
[    0.854802] integrity: Loaded X.509 cert 'Dell Inc. UEFI DB: 5ddb772dc880660055ba0bc131886bb630a639e7'
[    0.854804] integrity: Loading X.509 certificate: UEFI:db
[    0.854817] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    0.854818] integrity: Loading X.509 certificate: UEFI:db
[    0.854829] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    0.856653] ima: Allocated hash algorithm: sha1
[    0.906899] usb 1-5: new high-speed USB device number 2 using xhci_hcd
[    0.946978] ima: No architecture policies found
[    0.947014] evm: Initialising EVM extended attributes:
[    0.947016] evm: security.selinux
[    0.947017] evm: security.SMACK64
[    0.947018] evm: security.SMACK64EXEC
[    0.947019] evm: security.SMACK64TRANSMUTE
[    0.947019] evm: security.SMACK64MMAP
[    0.947020] evm: security.apparmor
[    0.947021] evm: security.ima
[    0.947022] evm: security.capability
[    0.947023] evm: HMAC attrs: 0x1
[    0.947944] PM:   Magic number: 0:563:981
[    0.949412] Freeing unused decrypted memory: 2040K
[    0.949824] Freeing unused kernel image (initmem) memory: 2588K
[    0.949879] Write protecting the kernel read-only data: 22528k
[    0.950392] Freeing unused kernel image (text/rodata gap) memory: 2044K
[    0.950543] Freeing unused kernel image (rodata/data gap) memory: 1152K
[    0.977329] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    0.977332] x86/mm: Checking user space page tables
[    1.003594] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.003597] Run /init as init process
[    1.003598]   with arguments:
[    1.003599]     /init
[    1.003599]   with environment:
[    1.003600]     HOME=/
[    1.003600]     TERM=linux
[    1.003600]     BOOT_IMAGE=/boot/vmlinuz-5.7-rc3
[    1.003601]     intel_iommu=on
[    1.102927] usb 1-5: New USB device found, idVendor=0bda, idProduct=58f4, bcdDevice=76.05
[    1.102931] usb 1-5: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[    1.102933] usb 1-5: Product: Integrated_Webcam_HD
[    1.102935] usb 1-5: Manufacturer: CN0FFMHCLOG0081JB3LKA00
[    1.102937] usb 1-5: SerialNumber: 200901010001
[    1.234929] usb 1-7: new full-speed USB device number 3 using xhci_hcd
[    1.385826] usb 1-7: New USB device found, idVendor=8087, idProduct=0a2b, bcdDevice= 0.10
[    1.385829] usb 1-7: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    1.462623] tsc: Refined TSC clocksource calibration: 2111.998 MHz
[    1.462630] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x1e71768ef8b, max_idle_ns: 440795218977 ns
[    1.462733] clocksource: Switched to clocksource tsc
[    1.514906] usb 1-10: new full-speed USB device number 4 using xhci_hcd
[    1.668037] usb 1-10: New USB device found, idVendor=27c6, idProduct=5385, bcdDevice= 1.00
[    1.668043] usb 1-10: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    1.668045] usb 1-10: Product: Goodix Fingerprint Device 
[    1.668046] usb 1-10: Manufacturer: HTMicroelectronics
[    1.668047] usb 1-10: SerialNumber: HTK32
[    1.715882] rtsx_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    1.721081] nvme nvme0: pci function 0000:36:00.0
[    1.731269] nvme nvme0: 8/0/0 default/read/poll queues
[    1.733258]  nvme0n1: p1 p2 p3 p4 p5 p6 p7
[    1.785748] EXT4-fs (nvme0n1p6): mounted filesystem with ordered data mode. Opts: (null)
[    1.876588] systemd[1]: Inserted module 'autofs4'
[    1.898343] systemd[1]: systemd 245.5-2-arch running in system mode. (+PAM +AUDIT -SELINUX -IMA -APPARMOR +SMACK -SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid)
[    1.915061] systemd[1]: Detected architecture x86-64.
[    1.948186] systemd[1]: Set hostname to <nicholas-dell-linux>.
[    2.086696] systemd[1]: Created slice system-getty.slice.
[    2.086878] systemd[1]: Created slice system-modprobe.slice.
[    2.087006] systemd[1]: Created slice system-ppp.slice.
[    2.087179] systemd[1]: Created slice User and Session Slice.
[    2.087235] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[    2.087288] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[    2.087405] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[    2.087434] systemd[1]: Reached target Local Encrypted Volumes.
[    2.087457] systemd[1]: Reached target Login Prompts.
[    2.087483] systemd[1]: Reached target Paths.
[    2.087505] systemd[1]: Reached target Remote File Systems.
[    2.087526] systemd[1]: Reached target Slices.
[    2.087549] systemd[1]: Reached target Swap.
[    2.087604] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    2.087820] systemd[1]: Listening on LVM2 metadata daemon socket.
[    2.087987] systemd[1]: Listening on LVM2 poll daemon socket.
[    2.088900] systemd[1]: Listening on Process Core Dump Socket.
[    2.088952] systemd[1]: Listening on initctl Compatibility Named Pipe.
[    2.091225] systemd[1]: Condition check resulted in Journal Audit Socket being skipped.
[    2.091298] systemd[1]: Listening on Journal Socket (/dev/log).
[    2.091376] systemd[1]: Listening on Journal Socket.
[    2.091446] systemd[1]: Listening on udev Control Socket.
[    2.091500] systemd[1]: Listening on udev Kernel Socket.
[    2.092030] systemd[1]: Mounting Huge Pages File System...
[    2.092660] systemd[1]: Mounting POSIX Message Queue File System...
[    2.093445] systemd[1]: Mounting Kernel Debug File System...
[    2.094276] systemd[1]: Mounting Kernel Trace File System...
[    2.095529] systemd[1]: Mounting Temporary Directory (/tmp)...
[    2.096334] systemd[1]: Starting Create list of static device nodes for the current kernel...
[    2.097026] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
[    2.098006] systemd[1]: Starting Load Kernel Module drm...
[    2.101307] systemd[1]: Condition check resulted in Set Up Additional Binary Formats being skipped.
[    2.101359] systemd[1]: Condition check resulted in File System Check on Root Device being skipped.
[    2.102471] systemd[1]: Starting Journal Service...
[    2.104068] systemd[1]: Starting Load Kernel Modules...
[    2.105050] systemd[1]: Starting Remount Root and Kernel File Systems...
[    2.105839] systemd[1]: Starting udev Coldplug all Devices...
[    2.107373] systemd[1]: Mounted Huge Pages File System.
[    2.107529] systemd[1]: Mounted POSIX Message Queue File System.
[    2.107682] systemd[1]: Mounted Kernel Debug File System.
[    2.107814] systemd[1]: Mounted Kernel Trace File System.
[    2.107946] systemd[1]: Mounted Temporary Directory (/tmp).
[    2.108402] systemd[1]: Finished Create list of static device nodes for the current kernel.
[    2.110773] systemd[1]: Started LVM2 metadata daemon.
[    2.115687] systemd[1]: modprobe@drm.service: Succeeded.
[    2.116063] systemd[1]: Finished Load Kernel Module drm.
[    2.117868] EXT4-fs (nvme0n1p6): re-mounted. Opts: data=ordered
[    2.120384] systemd[1]: Finished Remount Root and Kernel File Systems.
[    2.120876] systemd[1]: Finished Load Kernel Modules.
[    2.121760] systemd[1]: Mounting FUSE Control File System...
[    2.122739] systemd[1]: Mounting Kernel Configuration File System...
[    2.122804] systemd[1]: Condition check resulted in First Boot Wizard being skipped.
[    2.124503] systemd[1]: Condition check resulted in Rebuild Hardware Database being skipped.
[    2.125042] systemd[1]: Starting Load/Save Random Seed...
[    2.125773] systemd[1]: Starting Apply Kernel Variables...
[    2.125883] systemd[1]: Condition check resulted in Create System Users being skipped.
[    2.126996] systemd[1]: Starting Create Static Device Nodes in /dev...
[    2.128094] systemd[1]: Mounted FUSE Control File System.
[    2.128246] systemd[1]: Mounted Kernel Configuration File System.
[    2.138644] systemd[1]: Finished Load/Save Random Seed.
[    2.142412] systemd[1]: Finished Apply Kernel Variables.
[    2.148568] systemd[1]: Finished Create Static Device Nodes in /dev.
[    2.149509] systemd[1]: Starting udev Kernel Device Manager...
[    2.200336] systemd[1]: Finished udev Coldplug all Devices.
[    2.397844] systemd[1]: Started Journal Service.
[    2.410828] systemd-journald[295]: Received client request to flush runtime journal.
[    2.549938] input: Intel HID events as /devices/platform/INT33D5:00/input/input6
[    2.550250] intel-hid INT33D5:00: platform supports 5 button array
[    2.550281] input: Intel HID 5 button array as /devices/platform/INT33D5:00/input/input7
[    2.579152] hid: raw HID events driver (C) Jiri Kosina
[    2.610094] wmi_bus wmi_bus-PNP0C14:01: WQBC data block query control method not found
[    2.614674] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    2.615171] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[    2.618380] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    2.618872] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    2.618935] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    2.619968] platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
[    2.619975] cfg80211: failed to load regulatory.db
[    2.628459] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[    2.628818] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
[    2.630103] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    2.630687] Intel(R) Wireless WiFi driver for Linux
[    2.630692] Copyright(c) 2003- 2015 Intel Corporation
[    2.631073] iwlwifi 0000:02:00.0: enabling device (0000 -> 0002)
[    2.640567] iwlwifi 0000:02:00.0: Found debug destination: EXTERNAL_DRAM
[    2.640575] iwlwifi 0000:02:00.0: Found debug configuration: 0
[    2.641305] iwlwifi 0000:02:00.0: loaded firmware version 36.77d01142.0 8265-36.ucode op_mode iwlmvm
[    2.641346] iwlwifi 0000:02:00.0: Direct firmware load for iwl-debug-yoyo.bin failed with error -2
[    2.677770] intel_rapl_common: Found RAPL domain package
[    2.677777] intel_rapl_common: Found RAPL domain dram
[    2.693933] proc_thermal 0000:00:04.0: Creating sysfs group for PROC_THERMAL_PCI
[    2.696613] pstore: Using crash dump compression: deflate
[    2.712653] input: PC Speaker as /devices/platform/pcspkr/input/input8
[    2.724701] Error: Driver 'pcspkr' is already registered, aborting...
[    2.812217] iwlwifi 0000:02:00.0: Detected Intel(R) Dual Band Wireless AC 8265, REV=0x230
[    2.814380] i915 0000:00:02.0: VT-d active for gfx access
[    2.814387] checking generic (50000000 300000) vs hw (db000000 1000000)
[    2.814388] checking generic (50000000 300000) vs hw (50000000 10000000)
[    2.814389] fb0: switching to inteldrmfb from EFI VGA
[    2.816852] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
[    2.816855] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    2.816857] RAPL PMU: hw unit of domain package 2^-14 Joules
[    2.816858] RAPL PMU: hw unit of domain dram 2^-14 Joules
[    2.816860] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    2.816861] RAPL PMU: hw unit of domain psys 2^-14 Joules
[    2.821606] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    2.822020] iwlwifi 0000:02:00.0: Allocated 0x00400000 bytes for firmware monitor.
[    2.831877] cryptd: max_cpu_qlen set to 1000
[    2.834737] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    2.871853] AVX2 version of gcm_enc/dec engaged.
[    2.871859] AES CTR mode by8 optimization enabled
[    2.881285] iwlwifi 0000:02:00.0: base HW address: b4:d5:bd:9e:43:f5
[    2.886921] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[    2.891511] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)
[    2.904485] i915 0000:00:02.0: [drm:intel_dp_aux_init_backlight_funcs [i915]] Panel advertises DPCD backlight support, but VBT disagrees. If your backlight controls don't work try booting with i915.enable_dpcd_backlight=1. If your machine needs this, please file a _new_ bug report on drm/i915, see https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs for details.
[    2.920017] pstore: Registered efi as persistent store backend
[    2.923328] [drm] Initialized i915 1.6.0 20200313 for 0000:00:02.0 on minor 0
[    2.956994] ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-rs'
[    2.957265] thermal thermal_zone9: failed to read out thermal zone (-61)
[    3.148075] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[    3.148137] intel_rapl_common: Found RAPL domain package
[    3.148142] intel_rapl_common: Found RAPL domain core
[    3.148145] intel_rapl_common: Found RAPL domain uncore
[    3.148148] intel_rapl_common: Found RAPL domain dram
[    3.148448] dcdbas dcdbas: Dell Systems Management Base Driver (version 5.6.0-3.3)
[    3.282309] input: Dell WMI hotkeys as /devices/platform/PNP0C14:01/wmi_bus/wmi_bus-PNP0C14:01/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input10
[    3.300005] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    3.300767] iwlwifi 0000:02:00.0 wlp2s0: renamed from wlan0
[    3.418598] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input11
[    3.425848] i915 0000:00:02.0: fb0: i915drmfb frame buffer device
[    3.564089] psmouse serio1: synaptics: queried max coordinates: x [..5666], y [..4734]
[    3.592383] psmouse serio1: synaptics: queried min coordinates: x [1276..], y [1118..]
[    3.592396] psmouse serio1: synaptics: Your touchpad (PNP: DLL07e6 PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.
[    3.651184] psmouse serio1: synaptics: Touchpad model: 1, fw: 8.2, id: 0x1e2a1, caps: 0xf00323/0x840300/0x12e800/0x0, board id: 3038, fw id: 2375007
[    3.660217] i2c_hid i2c-ELAN24F0:00: supply vdd not found, using dummy regulator
[    3.660229] i2c_hid i2c-ELAN24F0:00: supply vddl not found, using dummy regulator
[    3.691929] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input9
[    3.726415] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
[    3.726781] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    3.832999] i2c_hid i2c-DELL07E6:00: supply vdd not found, using dummy regulator
[    3.833038] i2c_hid i2c-DELL07E6:00: supply vddl not found, using dummy regulator
[    3.868922] mc: Linux media interface: v0.10
[    3.875381] Bluetooth: Core ver 2.22
[    3.875405] NET: Registered protocol family 31
[    3.875408] Bluetooth: HCI device and connection manager initialized
[    3.875414] Bluetooth: HCI socket layer initialized
[    3.875418] Bluetooth: L2CAP socket layer initialized
[    3.875422] Bluetooth: SCO socket layer initialized
[    3.879109] videodev: Linux video capture interface: v2.00
[    3.906853] input: ELAN24F0:00 04F3:24F0 Touchscreen as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input12
[    3.907136] input: ELAN24F0:00 04F3:24F0 as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input13
[    3.907271] input: ELAN24F0:00 04F3:24F0 as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input14
[    3.907412] hid-generic 0018:04F3:24F0.0001: input,hidraw0: I2C HID v1.00 Device [ELAN24F0:00 04F3:24F0] on i2c-ELAN24F0:00
[    3.907737] input: DELL07E6:00 06CB:76AF Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input16
[    3.907819] input: DELL07E6:00 06CB:76AF Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input17
[    3.907878] hid-generic 0018:06CB:76AF.0002: input,hidraw1: I2C HID v1.00 Mouse [DELL07E6:00 06CB:76AF] on i2c-DELL07E6:00
[    3.996827] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    4.007035] usbcore: registered new interface driver btusb
[    4.009033] Bluetooth: hci0: Firmware revision 0.1 build 65 week 42 2019
[    4.017916] input: ELAN24F0:00 04F3:24F0 as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input19
[    4.018160] input: ELAN24F0:00 04F3:24F0 UNKNOWN as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input20
[    4.018324] input: ELAN24F0:00 04F3:24F0 UNKNOWN as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input21
[    4.018403] hid-multitouch 0018:04F3:24F0.0001: input,hidraw0: I2C HID v1.00 Device [ELAN24F0:00 04F3:24F0] on i2c-ELAN24F0:00
[    4.019279] cdc_acm 1-10:1.0: ttyACM0: USB ACM device
[    4.019621] usbcore: registered new interface driver cdc_acm
[    4.019624] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
[    4.023448] uvcvideo: Found UVC 1.00 device Integrated_Webcam_HD (0bda:58f4)
[    4.030410] uvcvideo 1-5:1.0: Entity type for entity Extension 4 was not initialized!
[    4.030417] uvcvideo 1-5:1.0: Entity type for entity Extension 7 was not initialized!
[    4.030423] uvcvideo 1-5:1.0: Entity type for entity Processing 2 was not initialized!
[    4.030427] uvcvideo 1-5:1.0: Entity type for entity Camera 1 was not initialized!
[    4.030483] input: Integrated_Webcam_HD: Integrate as /devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.0/input/input23
[    4.044452] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    4.044457] Bluetooth: BNEP filters: protocol multicast
[    4.044463] Bluetooth: BNEP socket layer initialized
[    4.065293] NET: Registered protocol family 38
[    4.075520] uvcvideo: Found UVC 1.00 device Integrated_Webcam_HD (0bda:58f4)
[    4.077517] uvcvideo 1-5:1.2: Entity type for entity Extension 10 was not initialized!
[    4.077523] uvcvideo 1-5:1.2: Entity type for entity Extension 12 was not initialized!
[    4.077527] uvcvideo 1-5:1.2: Entity type for entity Processing 9 was not initialized!
[    4.077532] uvcvideo 1-5:1.2: Entity type for entity Camera 11 was not initialized!
[    4.077622] input: Integrated_Webcam_HD: Integrate as /devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.2/input/input24
[    4.114887] usbcore: registered new interface driver uvcvideo
[    4.114893] USB Video Class driver (1.1.1)
[    4.122871] input: DELL07E6:00 06CB:76AF Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input25
[    4.123545] input: DELL07E6:00 06CB:76AF Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input26
[    4.123654] hid-multitouch 0018:06CB:76AF.0002: input,hidraw1: I2C HID v1.00 Mouse [DELL07E6:00 06CB:76AF] on i2c-DELL07E6:00
[    4.132568] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    4.201553] iwlwifi 0000:02:00.0: FW already configured (0) - re-configuring
[    4.255875] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    4.393701] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    4.461096] iwlwifi 0000:02:00.0: FW already configured (0) - re-configuring
[    4.921688] Bluetooth: RFCOMM TTY layer initialized
[    4.921696] Bluetooth: RFCOMM socket layer initialized
[    4.921700] Bluetooth: RFCOMM ver 1.11
[    6.258794] rfkill: input handler disabled
[    9.817944] rfkill: input handler enabled
[   10.292426] wlp2s0: authenticate with 78:8a:20:8e:ee:6a
[   10.302281] wlp2s0: send auth to 78:8a:20:8e:ee:6a (try 1/3)
[   10.316813] wlp2s0: authenticated
[   10.318905] wlp2s0: associate with 78:8a:20:8e:ee:6a (try 1/3)
[   10.324022] wlp2s0: RX AssocResp from 78:8a:20:8e:ee:6a (capab=0x1411 status=0 aid=4)
[   10.326356] wlp2s0: associated
[   10.375059] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
[   26.200153] pcieport 0000:00:1c.4: pciehp: Slot(8): Card present
[   26.355030] pci 0000:03:00.0: [8086:15d3] type 01 class 0x060400
[   26.355103] pci 0000:03:00.0: enabling Extended Tags
[   26.355197] pci 0000:03:00.0: supports D1 D2
[   26.355198] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   26.355433] pci 0000:03:00.0: Adding to iommu group 14
[   26.355553] pci 0000:04:00.0: [8086:15d3] type 01 class 0x060400
[   26.355613] pci 0000:04:00.0: enabling Extended Tags
[   26.355694] pci 0000:04:00.0: supports D1 D2
[   26.355695] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   26.355844] pci 0000:04:00.0: Adding to iommu group 15
[   26.355866] pci 0000:04:01.0: [8086:15d3] type 01 class 0x060400
[   26.355925] pci 0000:04:01.0: enabling Extended Tags
[   26.356007] pci 0000:04:01.0: supports D1 D2
[   26.356007] pci 0000:04:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[   26.356145] pci 0000:04:01.0: Adding to iommu group 16
[   26.356164] pci 0000:04:02.0: [8086:15d3] type 01 class 0x060400
[   26.356223] pci 0000:04:02.0: enabling Extended Tags
[   26.356299] pci 0000:04:02.0: supports D1 D2
[   26.356299] pci 0000:04:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[   26.356439] pci 0000:04:02.0: Adding to iommu group 17
[   26.356460] pci 0000:04:04.0: [8086:15d3] type 01 class 0x060400
[   26.356518] pci 0000:04:04.0: enabling Extended Tags
[   26.356597] pci 0000:04:04.0: supports D1 D2
[   26.356598] pci 0000:04:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[   26.356719] pci 0000:04:04.0: Adding to iommu group 18
[   26.356756] pci 0000:03:00.0: PCI bridge to [bus 04-35]
[   26.356763] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xda0fffff]
[   26.356768] pci 0000:03:00.0:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[   26.356834] pci 0000:04:00.0: PCI bridge to [bus 05-35]
[   26.356841] pci 0000:04:00.0:   bridge window [mem 0xda000000-0xda0fffff]
[   26.356847] pci_bus 0000:05: busn_res: [bus 05-35] end is updated to 05
[   26.356892] pci 0000:04:01.0: PCI bridge to [bus 06-35]
[   26.356899] pci 0000:04:01.0:   bridge window [mem 0xac000000-0xc3efffff]
[   26.356904] pci 0000:04:01.0:   bridge window [mem 0x60000000-0x7fffffff 64bit pref]
[   26.356905] pci_bus 0000:06: busn_res: [bus 06-35] end is updated to 35
[   26.356920] pci_bus 0000:36: busn_res: [bus 36] end is updated to 36
[   26.356922] pci 0000:04:02.0: devices behind bridge are unusable because [bus 36] cannot be assigned for them
[   26.356965] pci_bus 0000:37: busn_res: can not insert [bus 37-35] under [bus 04-35] (conflicts with (null) [bus 04-35])
[   26.356969] pci 0000:04:04.0: PCI bridge to [bus 37-35]
[   26.356976] pci 0000:04:04.0:   bridge window [mem 0xc4000000-0xd9ffffff]
[   26.356981] pci 0000:04:04.0:   bridge window [mem 0x80000000-0xa9ffffff 64bit pref]
[   26.356983] pci 0000:04:04.0: devices behind bridge are unusable because [bus 37-35] cannot be assigned for them
[   26.356985] pci_bus 0000:04: busn_res: [bus 04-35] end is updated to 35
[   26.356990] pci 0000:04:01.0: bridge window [mem 0x00100000-0x200fffff 64bit pref] to [bus 06-35] add_size fe0000000 add_align 100000
[   26.356991] pci 0000:04:01.0: bridge window [mem 0x00100000-0x17ffffff] to [bus 06-35] add_size 1100000 add_align 100000
[   26.356992] pci 0000:04:04.0: bridge window [mem 0x00100000-0x2a0fffff 64bit pref] to [bus 37-35] add_size fd6000000 add_align 100000
[   26.356993] pci 0000:04:04.0: bridge window [mem 0x00100000-0x160fffff] to [bus 37-35] add_size 3000000 add_align 100000
[   26.356994] pci 0000:03:00.0: bridge window [mem 0x00100000-0x4a0fffff 64bit pref] to [bus 04-35] add_size 1fb6000000 add_align 100000
[   26.356996] pci 0000:03:00.0: bridge window [mem 0x00100000-0x2e1fffff] to [bus 04-35] add_size 4100000 add_align 100000
[   26.357000] pci 0000:03:00.0: BAR 14: assigned [mem 0xac000000-0xda0fffff]
[   26.357001] pci 0000:03:00.0: BAR 15: assigned [mem 0x60000000-0xa9ffffff 64bit pref]
[   26.357002] pci 0000:04:00.0: BAR 14: assigned [mem 0xac000000-0xac0fffff]
[   26.357003] pci 0000:04:01.0: BAR 14: assigned [mem 0xac100000-0xc2ffffff]
[   26.357004] pci 0000:04:01.0: BAR 15: assigned [mem 0x60000000-0x84f00000 64bit pref]
[   26.357005] pci 0000:04:04.0: BAR 14: assigned [mem 0xc3000000-0xd9fffffe]
[   26.357006] pci 0000:04:04.0: BAR 15: assigned [mem 0x85000000-0xa9efffff 64bit pref]
[   26.357007] pci 0000:04:00.0: PCI bridge to [bus 05]
[   26.357011] pci 0000:04:00.0:   bridge window [mem 0xac000000-0xac0fffff]
[   26.357019] pci 0000:04:01.0: PCI bridge to [bus 06-35]
[   26.357023] pci 0000:04:01.0:   bridge window [mem 0xac100000-0xc2ffffff]
[   26.357025] pci 0000:04:01.0:   bridge window [mem 0x60000000-0x84f00000 64bit pref]
[   26.357030] pci 0000:04:04.0: PCI bridge to [bus 37-35]
[   26.357034] pci 0000:04:04.0:   bridge window [mem 0xc3000000-0xd9fffffe]
[   26.357037] pci 0000:04:04.0:   bridge window [mem 0x85000000-0xa9efffff 64bit pref]
[   26.357042] pci 0000:03:00.0: PCI bridge to [bus 04-35]
[   26.357046] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xda0fffff]
[   26.357049] pci 0000:03:00.0:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[   26.357053] pcieport 0000:00:1c.4: PCI bridge to [bus 03-35]
[   26.357056] pcieport 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0fffff]
[   26.357058] pcieport 0000:00:1c.4:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[   26.357534] pcieport 0000:04:01.0: pciehp: Slot #1 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[   26.358054] pcieport 0000:04:04.0: pciehp: Slot #4 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[   28.070867] pcieport 0000:04:02.0: Primary bus is hard wired to 0
[   28.070939] pci 0000:05:00.0: [8086:15d2] type 00 class 0x088000
[   28.070969] pci 0000:05:00.0: reg 0x10: [mem 0x00000000-0x0003ffff]
[   28.070977] pci 0000:05:00.0: reg 0x14: [mem 0x00000000-0x00000fff]
[   28.071020] pci 0000:05:00.0: enabling Extended Tags
[   28.071141] pci 0000:05:00.0: supports D1 D2
[   28.071142] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   28.071315] pci 0000:05:00.0: Adding to iommu group 15
[   28.071416] pci_bus 0000:05: busn_res: [bus 05] end is updated to 05
[   28.071420] pci_bus 0000:05: Allocating resources
[   28.071427] pci 0000:05:00.0: BAR 0: assigned [mem 0xac000000-0xac03ffff]
[   28.071431] pci 0000:05:00.0: BAR 1: assigned [mem 0xac040000-0xac040fff]
[   28.071451] pci_bus 0000:06: busn_res: [bus 06-35] end is updated to 35
[   28.076390] thunderbolt 0000:05:00.0: enabling device (0000 -> 0002)
[   29.096568] thunderbolt 0-1: new device found, vendor=0xed device=0xb009
[   29.096571] thunderbolt 0-1: GIGABYTE GAMING BOX
[   29.183014] pcieport 0000:04:01.0: pciehp: Slot(1): Card present
[   29.183017] pcieport 0000:04:01.0: pciehp: Slot(1): Link Up
[   29.318980] pci 0000:06:00.0: [8086:1578] type 01 class 0x060400
[   29.319095] pci 0000:06:00.0: enabling Extended Tags
[   29.319292] pci 0000:06:00.0: supports D1 D2
[   29.319293] pci 0000:06:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.319461] pci 0000:06:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:04:01.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
[   29.319534] pci 0000:06:00.0: Adding to iommu group 16
[   29.331017] pci 0000:06:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[   29.331178] pci 0000:07:01.0: [8086:1578] type 01 class 0x060400
[   29.331316] pci 0000:07:01.0: enabling Extended Tags
[   29.331527] pci 0000:07:01.0: supports D1 D2
[   29.331528] pci 0000:07:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.331734] pci 0000:07:01.0: Adding to iommu group 16
[   29.331809] pci 0000:07:04.0: [8086:1578] type 01 class 0x060400
[   29.331945] pci 0000:07:04.0: enabling Extended Tags
[   29.332133] pci 0000:07:04.0: supports D1 D2
[   29.332134] pci 0000:07:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.332321] pci 0000:07:04.0: Adding to iommu group 16
[   29.332418] pci 0000:06:00.0: PCI bridge to [bus 07-35]
[   29.332428] pci 0000:06:00.0:   bridge window [io  0x0000-0x0fff]
[   29.332434] pci 0000:06:00.0:   bridge window [mem 0x00000000-0x000fffff]
[   29.332445] pci 0000:06:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[   29.332448] pci 0000:07:01.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[   29.332461] pci 0000:07:04.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[   29.332621] pci 0000:08:00.0: [1002:7300] type 00 class 0x030000
[   29.332704] pci 0000:08:00.0: reg 0x10: [mem 0x00000000-0x0fffffff 64bit pref]
[   29.332731] pci 0000:08:00.0: reg 0x18: [mem 0x00000000-0x001fffff 64bit pref]
[   29.332747] pci 0000:08:00.0: reg 0x20: [io  0x0000-0x00ff]
[   29.332762] pci 0000:08:00.0: reg 0x24: [mem 0x00000000-0x0003ffff]
[   29.332778] pci 0000:08:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[   29.332796] pci 0000:08:00.0: enabling Extended Tags
[   29.333014] pci 0000:08:00.0: supports D1 D2
[   29.333015] pci 0000:08:00.0: PME# supported from D1 D2 D3hot D3cold
[   29.333242] pci 0000:08:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:04:01.0 (capable of 126.016 Gb/s with 8.0 GT/s PCIe x16 link)
[   29.333283] pci 0000:08:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[   29.333285] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=io+mem
[   29.333304] pci 0000:08:00.0: Adding to iommu group 16
[   29.333342] pci 0000:08:00.1: [1002:aae8] type 00 class 0x040300
[   29.333427] pci 0000:08:00.1: reg 0x10: [mem 0x00000000-0x00003fff 64bit]
[   29.333531] pci 0000:08:00.1: enabling Extended Tags
[   29.333691] pci 0000:08:00.1: supports D1 D2
[   29.333848] pci 0000:08:00.1: Adding to iommu group 16
[   29.333938] pci 0000:07:01.0: PCI bridge to [bus 08-35]
[   29.333949] pci 0000:07:01.0:   bridge window [io  0x0000-0x0fff]
[   29.333955] pci 0000:07:01.0:   bridge window [mem 0x00000000-0x000fffff]
[   29.333967] pci 0000:07:01.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[   29.333968] pci_bus 0000:08: busn_res: [bus 08-35] end is updated to 08
[   29.334089] pci 0000:09:00.0: [8086:15b6] type 00 class 0x0c0330
[   29.334146] pci 0000:09:00.0: reg 0x10: [mem 0x00000000-0x0000ffff]
[   29.335605] pci 0000:09:00.0: supports D1 D2
[   29.335607] pci 0000:09:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   29.336171] pci 0000:09:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:04:01.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
[   29.336249] pci 0000:09:00.0: Adding to iommu group 16
[   29.336399] pci 0000:07:04.0: PCI bridge to [bus 09-35]
[   29.336411] pci 0000:07:04.0:   bridge window [io  0x0000-0x0fff]
[   29.336418] pci 0000:07:04.0:   bridge window [mem 0x00000000-0x000fffff]
[   29.336430] pci 0000:07:04.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[   29.336432] pci_bus 0000:09: busn_res: [bus 09-35] end is updated to 35
[   29.336438] pci_bus 0000:07: busn_res: [bus 07-35] end is updated to 35
[   29.336449] pci 0000:07:04.0: bridge window [mem 0x00100000-0x001fffff 64bit pref] to [bus 09-35] add_size ffff00000 add_align 100000
[   29.336451] pci 0000:07:04.0: bridge window [mem 0x00100000-0x001fffff] to [bus 09-35] add_size 18f00000 add_align 100000
[   29.336454] pci 0000:06:00.0: bridge window [mem 0x04000000-0x1fffffff 64bit pref] to [bus 07-35] add_size ffc000000 add_align 4000000
[   29.336456] pci 0000:06:00.0: bridge window [mem 0x00100000-0x002fffff] to [bus 07-35] add_size 18f00000 add_align 100000
[   29.336460] pcieport 0000:04:01.0: BAR 13: no space for [io  size 0x2000]
[   29.336462] pcieport 0000:04:01.0: BAR 13: failed to assign [io  size 0x2000]
[   29.336465] pci 0000:06:00.0: BAR 15: assigned [mem 0x60000000-0x84f00000 64bit pref]
[   29.336467] pci 0000:06:00.0: BAR 14: assigned [mem 0xac100000-0xc2ffffff]
[   29.336468] pci 0000:06:00.0: BAR 13: no space for [io  size 0x2000]
[   29.336470] pci 0000:06:00.0: BAR 13: failed to assign [io  size 0x2000]
[   29.336472] pci 0000:07:01.0: BAR 15: assigned [mem 0x60000000-0x77ffffff 64bit pref]
[   29.336474] pci 0000:07:01.0: BAR 14: assigned [mem 0xac100000-0xac1fffff]
[   29.336475] pci 0000:07:04.0: BAR 14: assigned [mem 0xac200000-0xc2ffffff]
[   29.336477] pci 0000:07:04.0: BAR 15: assigned [mem 0x78000000-0x84f00000 64bit pref]
[   29.336478] pci 0000:07:01.0: BAR 13: no space for [io  size 0x1000]
[   29.336479] pci 0000:07:01.0: BAR 13: failed to assign [io  size 0x1000]
[   29.336481] pci 0000:07:04.0: BAR 13: no space for [io  size 0x1000]
[   29.336482] pci 0000:07:04.0: BAR 13: failed to assign [io  size 0x1000]
[   29.336484] pci 0000:08:00.0: BAR 0: assigned [mem 0x60000000-0x6fffffff 64bit pref]
[   29.336508] pci 0000:08:00.0: BAR 2: assigned [mem 0x70000000-0x701fffff 64bit pref]
[   29.336531] pci 0000:08:00.0: BAR 5: assigned [mem 0xac100000-0xac13ffff]
[   29.336539] pci 0000:08:00.0: BAR 6: assigned [mem 0xac140000-0xac15ffff pref]
[   29.336541] pci 0000:08:00.1: BAR 0: assigned [mem 0xac160000-0xac163fff 64bit]
[   29.336565] pci 0000:08:00.0: BAR 4: no space for [io  size 0x0100]
[   29.336566] pci 0000:08:00.0: BAR 4: failed to assign [io  size 0x0100]
[   29.336568] pci 0000:07:01.0: PCI bridge to [bus 08]
[   29.336578] pci 0000:07:01.0:   bridge window [mem 0xac100000-0xac1fffff]
[   29.336585] pci 0000:07:01.0:   bridge window [mem 0x60000000-0x77ffffff 64bit pref]
[   29.336598] pci 0000:09:00.0: BAR 0: assigned [mem 0xac200000-0xac20ffff]
[   29.336605] pci 0000:07:04.0: PCI bridge to [bus 09-35]
[   29.336615] pci 0000:07:04.0:   bridge window [mem 0xac200000-0xc2ffffff]
[   29.336621] pci 0000:07:04.0:   bridge window [mem 0x78000000-0x84f00000 64bit pref]
[   29.336633] pci 0000:06:00.0: PCI bridge to [bus 07-35]
[   29.336642] pci 0000:06:00.0:   bridge window [mem 0xac100000-0xc2ffffff]
[   29.336649] pci 0000:06:00.0:   bridge window [mem 0x60000000-0x84f00000 64bit pref]
[   29.336661] pcieport 0000:04:01.0: PCI bridge to [bus 06-35]
[   29.336666] pcieport 0000:04:01.0:   bridge window [mem 0xac100000-0xc2ffffff]
[   29.336670] pcieport 0000:04:01.0:   bridge window [mem 0x60000000-0x84f00000 64bit pref]
[   29.336676] PCI: No. 2 try to assign unassigned res
[   29.336681] pcieport 0000:04:01.0: BAR 13: no space for [io  size 0x2000]
[   29.336682] pcieport 0000:04:01.0: BAR 13: failed to assign [io  size 0x2000]
[   29.336684] pci 0000:06:00.0: BAR 13: no space for [io  size 0x2000]
[   29.336685] pci 0000:06:00.0: BAR 13: failed to assign [io  size 0x2000]
[   29.336687] pci 0000:07:01.0: BAR 13: no space for [io  size 0x1000]
[   29.336688] pci 0000:07:01.0: BAR 13: failed to assign [io  size 0x1000]
[   29.336690] pci 0000:07:04.0: BAR 13: no space for [io  size 0x1000]
[   29.336691] pci 0000:07:04.0: BAR 13: failed to assign [io  size 0x1000]
[   29.336693] pci 0000:08:00.0: BAR 4: no space for [io  size 0x0100]
[   29.336694] pci 0000:08:00.0: BAR 4: failed to assign [io  size 0x0100]
[   29.336696] pci 0000:07:01.0: PCI bridge to [bus 08]
[   29.336705] pci 0000:07:01.0:   bridge window [mem 0xac100000-0xac1fffff]
[   29.336711] pci 0000:07:01.0:   bridge window [mem 0x60000000-0x77ffffff 64bit pref]
[   29.336723] pci 0000:07:04.0: PCI bridge to [bus 09-35]
[   29.336733] pci 0000:07:04.0:   bridge window [mem 0xac200000-0xc2ffffff]
[   29.336739] pci 0000:07:04.0:   bridge window [mem 0x78000000-0x84f00000 64bit pref]
[   29.336750] pci 0000:06:00.0: PCI bridge to [bus 07-35]
[   29.336759] pci 0000:06:00.0:   bridge window [mem 0xac100000-0xc2ffffff]
[   29.336766] pci 0000:06:00.0:   bridge window [mem 0x60000000-0x84f00000 64bit pref]
[   29.336777] pcieport 0000:04:01.0: PCI bridge to [bus 06-35]
[   29.336782] pcieport 0000:04:01.0:   bridge window [mem 0xac100000-0xc2ffffff]
[   29.336786] pcieport 0000:04:01.0:   bridge window [mem 0x60000000-0x84f00000 64bit pref]
[   29.336825] pcieport 0000:06:00.0: enabling device (0000 -> 0002)
[   29.337261] pcieport 0000:07:01.0: enabling device (0000 -> 0002)
[   29.337629] pcieport 0000:07:04.0: enabling device (0000 -> 0002)
[   29.337817] pcieport 0000:07:04.0: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[   29.338140] pci 0000:08:00.1: D0 power state depends on 0000:08:00.0
[   29.338161] pci 0000:09:00.0: enabling device (0000 -> 0002)
[   29.338402] xhci_hcd 0000:09:00.0: xHCI Host Controller
[   29.338408] xhci_hcd 0000:09:00.0: new USB bus registered, assigned bus number 3
[   29.339647] xhci_hcd 0000:09:00.0: hcc params 0x200077c1 hci version 0x110 quirks 0x0000000200009810
[   29.339998] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.07
[   29.340000] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   29.340001] usb usb3: Product: xHCI Host Controller
[   29.340002] usb usb3: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[   29.340024] usb usb3: SerialNumber: 0000:09:00.0
[   29.340252] hub 3-0:1.0: USB hub found
[   29.340264] hub 3-0:1.0: 2 ports detected
[   29.340509] xhci_hcd 0000:09:00.0: xHCI Host Controller
[   29.340513] xhci_hcd 0000:09:00.0: new USB bus registered, assigned bus number 4
[   29.340516] xhci_hcd 0000:09:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[   29.340555] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.07
[   29.340557] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   29.340558] usb usb4: Product: xHCI Host Controller
[   29.340559] usb usb4: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[   29.340560] usb usb4: SerialNumber: 0000:09:00.0
[   29.340643] hub 4-0:1.0: USB hub found
[   29.340655] hub 4-0:1.0: 2 ports detected
[   29.342757] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[   29.342758] AMD-Vi: AMD IOMMUv2 functionality not available on this system
[   29.380748] [drm] amdgpu kernel modesetting enabled.
[   29.380907] CRAT table not found
[   29.380910] Virtual CRAT table created for CPU
[   29.380911] Parsing CRAT table with 1 nodes
[   29.380912] Creating topology SYSFS entries
[   29.380920] Topology: Add CPU node
[   29.380920] Finished initializing topology
[   29.381041] amdgpu 0000:08:00.0: enabling device (0000 -> 0002)
[   29.381176] [drm] initializing kernel modesetting (FIJI 0x1002:0x7300 0x1002:0x0B36 0xCA).
[   29.382079] [drm] register mmio base: 0xAC100000
[   29.382080] [drm] register mmio size: 262144
[   29.382080] [drm] PCI I/O BAR is not found.
[   29.382084] [drm] PCIE atomic ops is not supported
[   29.382103] [drm] add ip block number 0 <vi_common>
[   29.382104] [drm] add ip block number 1 <gmc_v8_0>
[   29.382104] [drm] add ip block number 2 <tonga_ih>
[   29.382105] [drm] add ip block number 3 <gfx_v8_0>
[   29.382105] [drm] add ip block number 4 <sdma_v3_0>
[   29.382106] [drm] add ip block number 5 <powerplay>
[   29.382107] [drm] add ip block number 6 <dm>
[   29.382107] [drm] add ip block number 7 <uvd_v6_0>
[   29.382108] [drm] add ip block number 8 <vce_v3_0>
[   29.382109] kfd kfd: skipped device 1002:7300, PCI rejects atomics
[   29.674668] usb 3-2: new high-speed USB device number 2 using xhci_hcd
[   29.677985] ATOM BIOS: 113-C8820200-107
[   29.678014] [drm] UVD is enabled in physical mode
[   29.678015] [drm] VCE enabled in physical mode
[   29.678032] [drm] GPU posting now...
[   29.786987] [drm] vm size is 64 GB, 2 levels, block size is 10-bit, fragment size is 9-bit
[   29.787013] amdgpu 0000:08:00.0: VRAM: 4096M 0x000000F400000000 - 0x000000F4FFFFFFFF (4096M used)
[   29.787014] amdgpu 0000:08:00.0: GART: 1024M 0x000000FF00000000 - 0x000000FF3FFFFFFF
[   29.787031] [drm] Detected VRAM RAM=4096M, BAR=256M
[   29.787032] [drm] RAM width 512bits HBM
[   29.787174] [TTM] Zone  kernel: Available graphics memory: 8073318 KiB
[   29.787175] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[   29.787176] [TTM] Initializing pool allocator
[   29.787179] [TTM] Initializing DMA pool allocator
[   29.787216] [drm] amdgpu: 4096M of VRAM memory ready
[   29.787219] [drm] amdgpu: 4096M of GTT memory ready.
[   29.787226] [drm] GART: num cpu pages 262144, num gpu pages 262144
[   29.787318] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[   29.789469] [drm] Chained IB support enabled!
[   29.792708] amdgpu: [powerplay] hwmgr_sw_init smu backed is fiji_smu
[   29.793077] [drm] Found UVD firmware Version: 1.91 Family ID: 12
[   29.793080] [drm] UVD ENC is disabled
[   29.809120] [drm] Found VCE firmware Version: 55.2 Binary ID: 3
[   29.825727] usb 3-2: New USB device found, idVendor=05e3, idProduct=0610, bcdDevice=93.03
[   29.825730] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   29.825731] usb 3-2: Product: USB2.1 Hub
[   29.825732] usb 3-2: Manufacturer: GenesysLogic
[   29.827169] hub 3-2:1.0: USB hub found
[   29.827453] hub 3-2:1.0: 4 ports detected
[   29.879186] [drm] dce110_link_encoder_construct: Failed to get encoder_cap_info from VBIOS with error code 4!
[   29.879220] [drm] Display Core initialized with v3.2.76!
[   29.950890] usb 4-2: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[   29.962886] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   29.974111] usb 4-2: New USB device found, idVendor=05e3, idProduct=0620, bcdDevice=93.03
[   29.974113] usb 4-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   29.974114] usb 4-2: Product: USB3.1 Hub
[   29.974115] usb 4-2: Manufacturer: GenesysLogic
[   29.976698] hub 4-2:1.0: USB hub found
[   29.977291] hub 4-2:1.0: 4 ports detected
[   29.989600] [drm] UVD initialized successfully.
[   30.098618] [drm] VCE initialized successfully.
[   30.102966] [drm] fb mappable at 0x60696000
[   30.102968] [drm] vram apper at 0x60000000
[   30.102969] [drm] size 33177600
[   30.102969] [drm] fb depth is 24
[   30.102970] [drm]    pitch is 15360
[   30.103175] amdgpu 0000:08:00.0: fb1: amdgpudrmfb frame buffer device
[   30.105685] [drm] Initialized amdgpu 3.36.0 20150101 for 0000:08:00.0 on minor 1
[   30.142668] usb 3-2.2: new full-speed USB device number 3 using xhci_hcd
[   30.246639] usb 3-2.2: device descriptor read/64, error -32
[   30.462686] usb 3-2.2: device descriptor read/64, error -32
[   30.674626] usb 3-2.2: new full-speed USB device number 4 using xhci_hcd
[   30.778692] usb 3-2.2: device descriptor read/64, error -32
[   30.990783] usb 3-2.2: device descriptor read/64, error -32
[   31.098972] usb 3-2-port2: attempt power cycle
[   31.762669] usb 3-2.2: new full-speed USB device number 5 using xhci_hcd
[   31.762816] usb 3-2.2: Device not responding to setup address.
[   31.970765] usb 3-2.2: Device not responding to setup address.
[   32.178671] usb 3-2.2: device not accepting address 5, error -71
[   32.282628] usb 3-2.2: new full-speed USB device number 6 using xhci_hcd
[   32.282759] usb 3-2.2: Device not responding to setup address.
[   32.490823] usb 3-2.2: Device not responding to setup address.
[   32.698912] usb 3-2.2: device not accepting address 6, error -71
[   32.699105] usb 3-2-port2: unable to enumerate USB device
[   32.700852] rfkill: input handler disabled
[   37.428979] rfkill: input handler enabled
[   38.146863] [drm] Reducing the compressed framebuffer size. This may lead to less power savings than a non-reduced-size. Try to increase stolen memory size if available in BIOS.
[  128.155676] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040380
[  128.155688] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[  128.155888] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[  128.156734] snd_hda_intel 0000:08:00.1: enabling device (0000 -> 0002)
[  128.157158] snd_hda_intel 0000:08:00.1: Force to non-snoop mode
[  128.174235] snd_hda_intel 0000:08:00.1: bound 0000:08:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
[  128.180426] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input28
[  128.180476] input: HDA ATI HDMI HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input29
[  128.180523] input: HDA ATI HDMI HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input30
[  128.180567] input: HDA ATI HDMI HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input31
[  128.180611] input: HDA ATI HDMI HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input32
[  128.180651] input: HDA ATI HDMI HDMI/DP,pcm=11 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input33
[  128.183312] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC3271: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[  128.183314] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[  128.183315] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[  128.183316] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[  128.183317] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[  128.183318] snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=0x19
[  128.183319] snd_hda_codec_realtek hdaudioC0D0:      Headphone Mic=0x1b
[  128.183320] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=0x12
[  128.235816] input: HDA Intel PCH Headphone Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input34
[  128.235879] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input35
[  128.235930] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input36
[  128.235974] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input37
[  128.236019] input: HDA Intel PCH HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input38
[  128.237006] input: HDA Intel PCH HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input39
[  212.647457] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[  212.829677] [drm] UVD initialized successfully.
[  212.929709] [drm] VCE initialized successfully.
[  263.721039] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[  263.903201] [drm] UVD initialized successfully.
[  264.003253] [drm] VCE initialized successfully.

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=dmesg-blacklist-1

[    0.000000] microcode: microcode updated early to revision 0xca, date = 2019-10-03
[    0.000000] Linux version 5.7.0-rc3+ (nicholas@nicholas-dell-linux) (gcc version 9.3.0 (Arch Linux 9.3.0-1), GNU ld (GNU Binutils) 2.34) #7 SMP Tue Apr 28 09:55:03 AWST 2020
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-5.7-rc3 root=UUID=e9880a1b-a4f2-4779-8a98-6c1bee968ebe rw sysrq_always_enabled audit=0 pcie_ports=native pci=assign-busses,hpbussize=0x33,hpmemsize=16K,hpiosize=0,hpmmiosize=400M,hpmmioprefsize=64G,nocrs,realloc intel_iommu=on iommu=on video=vesafb:off
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
[    0.000000] efi:  ACPI=0x3d778000  ACPI 2.0=0x3d778000  SMBIOS=0xf0000  SMBIOS 3.0=0xf0020  TPMFinalLog=0x3de0e000  ESRT=0x3fdb5018  MEMATTR=0x3a84a018 
[    0.000000] SMBIOS 3.0.0 present.
[    0.000000] DMI: Dell Inc. XPS 13 9370/09DKKT, BIOS 1.11.1 07/11/2019
[    0.000000] tsc: Detected 2100.000 MHz processor
[    0.000845] tsc: Detected 2099.944 MHz TSC
[    0.000845] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000846] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000851] last_pfn = 0x4ae800 max_arch_pfn = 0x400000000
[    0.000855] MTRR default type: write-back
[    0.000856] MTRR fixed ranges enabled:
[    0.000857]   00000-9FFFF write-back
[    0.000857]   A0000-BFFFF uncachable
[    0.000858]   C0000-FFFFF write-protect
[    0.000858] MTRR variable ranges enabled:
[    0.000859]   0 base 0080000000 mask 7F80000000 uncachable
[    0.000860]   1 base 0060000000 mask 7FE0000000 uncachable
[    0.000861]   2 base 0050000000 mask 7FF0000000 uncachable
[    0.000861]   3 base 004C000000 mask 7FFC000000 uncachable
[    0.000862]   4 base 004B000000 mask 7FFF000000 uncachable
[    0.000862]   5 disabled
[    0.000862]   6 disabled
[    0.000863]   7 disabled
[    0.000863]   8 disabled
[    0.000863]   9 disabled
[    0.001183] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.001603] last_pfn = 0x48e00 max_arch_pfn = 0x400000000
[    0.007622] esrt: Reserving ESRT space from 0x000000003fdb5018 to 0x000000003fdb5050.
[    0.007627] check: Scanning 1 areas for low memory corruption
[    0.007631] Using GB pages for direct mapping
[    0.007633] BRK [0x3acc01000, 0x3acc01fff] PGTABLE
[    0.007634] BRK [0x3acc02000, 0x3acc02fff] PGTABLE
[    0.007635] BRK [0x3acc03000, 0x3acc03fff] PGTABLE
[    0.007666] BRK [0x3acc04000, 0x3acc04fff] PGTABLE
[    0.007667] BRK [0x3acc05000, 0x3acc05fff] PGTABLE
[    0.007788] BRK [0x3acc06000, 0x3acc06fff] PGTABLE
[    0.007845] BRK [0x3acc07000, 0x3acc07fff] PGTABLE
[    0.007871] BRK [0x3acc08000, 0x3acc08fff] PGTABLE
[    0.007887] BRK [0x3acc09000, 0x3acc09fff] PGTABLE
[    0.007943] Secure boot could not be determined
[    0.007944] RAMDISK: [mem 0x26cb7000-0x27811fff]
[    0.007951] ACPI: Early table checksum verification disabled
[    0.007954] ACPI: RSDP 0x000000003D778000 000024 (v02 DELL  )
[    0.007957] ACPI: XSDT 0x000000003D7780C8 00010C (v01 DELL   CBX3     01072009 AMI  00010013)
[    0.007961] ACPI: FACP 0x000000003D79E9D8 00010C (v05 DELL   CBX3     01072009 AMI  00010013)
[    0.007965] ACPI: DSDT 0x000000003D778260 026773 (v02 DELL   CBX3     01072009 INTL 20160422)
[    0.007968] ACPI: FACS 0x000000003DE6A180 000040
[    0.007970] ACPI: APIC 0x000000003D79EAE8 0000BC (v03 DELL   CBX3     01072009 AMI  00010013)
[    0.007972] ACPI: FPDT 0x000000003D79EBA8 000044 (v01 DELL   CBX3     01072009 AMI  00010013)
[    0.007974] ACPI: FIDT 0x000000003D79EBF0 0000AC (v01 DELL   CBX3     01072009 AMI  00010013)
[    0.007976] ACPI: MCFG 0x000000003D79ECA0 00003C (v01 DELL   CBX3     01072009 MSFT 00000097)
[    0.007978] ACPI: HPET 0x000000003D79ECE0 000038 (v01 DELL   CBX3     01072009 AMI. 0005000B)
[    0.007980] ACPI: SSDT 0x000000003D79ED18 000359 (v01 SataRe SataTabl 00001000 INTL 20160422)
[    0.007982] ACPI: BOOT 0x000000003D79F078 000028 (v01 DELL   CBX3     01072009 AMI  00010013)
[    0.007984] ACPI: SSDT 0x000000003D79F0A0 0012DE (v02 SaSsdt SaSsdt   00003000 INTL 20160422)
[    0.007986] ACPI: HPET 0x000000003D7A0380 000038 (v01 INTEL  KBL-ULT  00000001 MSFT 0000005F)
[    0.007988] ACPI: SSDT 0x000000003D7A03B8 000CEF (v02 INTEL  xh_rvp07 00000000 INTL 20160422)
[    0.007990] ACPI: UEFI 0x000000003D7A10A8 000042 (v01                 00000000      00000000)
[    0.007992] ACPI: SSDT 0x000000003D7A10F0 0017AE (v02 CpuRef CpuSsdt  00003000 INTL 20160422)
[    0.007994] ACPI: LPIT 0x000000003D7A28A0 000094 (v01 INTEL  KBL-ULT  00000000 MSFT 0000005F)
[    0.007996] ACPI: SSDT 0x000000003D7A2938 000161 (v02 INTEL  HdaDsp   00000000 INTL 20160422)
[    0.007998] ACPI: SSDT 0x000000003D7A2AA0 00029F (v02 INTEL  sensrhub 00000000 INTL 20160422)
[    0.008000] ACPI: SSDT 0x000000003D7A2D40 003002 (v02 INTEL  PtidDevc 00001000 INTL 20160422)
[    0.008003] ACPI: SSDT 0x000000003D7A5D48 000517 (v02 INTEL  TbtTypeC 00000000 INTL 20160422)
[    0.008005] ACPI: DBGP 0x000000003D7A6260 000034 (v01 INTEL           00000002 MSFT 0000005F)
[    0.008006] ACPI: DBG2 0x000000003D7A6298 000054 (v00 INTEL           00000002 MSFT 0000005F)
[    0.008008] ACPI: SSDT 0x000000003D7A62F0 000801 (v02 INTEL  UsbCTabl 00001000 INTL 20160422)
[    0.008010] ACPI: SSDT 0x000000003D7A6AF8 00CFC3 (v02 DptfTa DptfTabl 00001000 INTL 20160422)
[    0.008013] ACPI: MSDM 0x000000003D7B3AC0 000055 (v03 DELL   CBX3     06222004 AMI  00010013)
[    0.008014] ACPI: SLIC 0x000000003D7B3B18 000176 (v03 DELL   CBX3     01072009 MSFT 00010013)
[    0.008017] ACPI: NHLT 0x000000003D7B3C90 00002D (v00 INTEL  EDK2     00000002      01000013)
[    0.008019] ACPI: TPM2 0x000000003D7B3CC0 000034 (v03 DELL   CBX3     00000001 AMI  00000000)
[    0.008020] ACPI: ASF! 0x000000003D7B3CF8 0000A0 (v32 INTEL   HCG     00000001 TFSM 000F4240)
[    0.008023] ACPI: DMAR 0x000000003D7B3D98 0000F0 (v01 INTEL  KBL      00000001 INTL 00000001)
[    0.008025] ACPI: BGRT 0x000000003D7B3E88 000038 (v00                 01072009 AMI  00010013)
[    0.008031] ACPI: Local APIC address 0xfee00000
[    0.008191] No NUMA configuration found
[    0.008191] Faking a node at [mem 0x0000000000000000-0x00000004ae7fffff]
[    0.008200] NODE_DATA(0) allocated [mem 0x4ae7d6000-0x4ae7fffff]
[    0.008416] Zone ranges:
[    0.008416]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.008418]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.008418]   Normal   [mem 0x0000000100000000-0x00000004ae7fffff]
[    0.008419]   Device   empty
[    0.008420] Movable zone start for each node
[    0.008422] Early memory node ranges
[    0.008423]   node   0: [mem 0x0000000000001000-0x0000000000057fff]
[    0.008424]   node   0: [mem 0x0000000000059000-0x000000000009dfff]
[    0.008425]   node   0: [mem 0x0000000000100000-0x000000002bd32fff]
[    0.008426]   node   0: [mem 0x000000002bd35000-0x000000003d383fff]
[    0.008426]   node   0: [mem 0x000000003ffff000-0x000000003fffffff]
[    0.008427]   node   0: [mem 0x0000000048000000-0x0000000048dfffff]
[    0.008427]   node   0: [mem 0x0000000100000000-0x00000004ae7fffff]
[    0.008720] Zeroed struct page in unavailable ranges: 46817 pages
[    0.008721] Initmem setup node 0 [mem 0x0000000000001000-0x00000004ae7fffff]
[    0.008722] On node 0 totalpages: 4114719
[    0.008723]   DMA zone: 64 pages used for memmap
[    0.008723]   DMA zone: 22 pages reserved
[    0.008724]   DMA zone: 3996 pages, LIFO batch:0
[    0.008762]   DMA32 zone: 3911 pages used for memmap
[    0.008763]   DMA32 zone: 250243 pages, LIFO batch:63
[    0.011772]   Normal zone: 60320 pages used for memmap
[    0.011773]   Normal zone: 3860480 pages, LIFO batch:63
[    0.048997] Reserving Intel graphics memory at [mem 0x4b800000-0x4f7fffff]
[    0.049553] ACPI: PM-Timer IO Port: 0x1808
[    0.049554] ACPI: Local APIC address 0xfee00000
[    0.049559] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.049560] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.049561] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.049561] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.049562] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.049563] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.049563] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.049564] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.049591] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.049592] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.049594] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.049595] ACPI: IRQ0 used by override.
[    0.049595] ACPI: IRQ9 used by override.
[    0.049597] Using ACPI (MADT) for SMP configuration information
[    0.049598] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.049603] e820: update [mem 0x39d44000-0x39db7fff] usable ==> reserved
[    0.049610] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.049625] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.049627] PM: hibernation: Registered nosave memory: [mem 0x00058000-0x00058fff]
[    0.049628] PM: hibernation: Registered nosave memory: [mem 0x0009e000-0x000fffff]
[    0.049629] PM: hibernation: Registered nosave memory: [mem 0x2bd33000-0x2bd33fff]
[    0.049630] PM: hibernation: Registered nosave memory: [mem 0x2bd34000-0x2bd34fff]
[    0.049631] PM: hibernation: Registered nosave memory: [mem 0x39d44000-0x39db7fff]
[    0.049632] PM: hibernation: Registered nosave memory: [mem 0x3d384000-0x3d743fff]
[    0.049633] PM: hibernation: Registered nosave memory: [mem 0x3d744000-0x3d7b4fff]
[    0.049633] PM: hibernation: Registered nosave memory: [mem 0x3d7b5000-0x3de6cfff]
[    0.049634] PM: hibernation: Registered nosave memory: [mem 0x3de6d000-0x3ff25fff]
[    0.049634] PM: hibernation: Registered nosave memory: [mem 0x3ff26000-0x3fffefff]
[    0.049636] PM: hibernation: Registered nosave memory: [mem 0x40000000-0x47ffffff]
[    0.049637] PM: hibernation: Registered nosave memory: [mem 0x48e00000-0x4f7fffff]
[    0.049638] PM: hibernation: Registered nosave memory: [mem 0x4f800000-0xdfffffff]
[    0.049638] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0xefffffff]
[    0.049639] PM: hibernation: Registered nosave memory: [mem 0xf0000000-0xfdffffff]
[    0.049639] PM: hibernation: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
[    0.049640] PM: hibernation: Registered nosave memory: [mem 0xfe011000-0xfebfffff]
[    0.049640] PM: hibernation: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.049641] PM: hibernation: Registered nosave memory: [mem 0xfec01000-0xfedfffff]
[    0.049641] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.049642] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0xfeffffff]
[    0.049642] PM: hibernation: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.049644] [mem 0x4f800000-0xdfffffff] available for PCI devices
[    0.049645] Booting paravirtualized kernel on bare hardware
[    0.049648] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.049654] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
[    0.049854] percpu: Embedded 57 pages/cpu s196608 r8192 d28672 u262144
[    0.049859] pcpu-alloc: s196608 r8192 d28672 u262144 alloc=1*2097152
[    0.049859] pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
[    0.049879] Built 1 zonelists, mobility grouping on.  Total pages: 4050402
[    0.049880] Policy zone: Normal
[    0.049881] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-5.7-rc3 root=UUID=e9880a1b-a4f2-4779-8a98-6c1bee968ebe rw sysrq_always_enabled audit=0 pcie_ports=native pci=assign-busses,hpbussize=0x33,hpmemsize=16K,hpiosize=0,hpmmiosize=400M,hpmmioprefsize=64G,nocrs,realloc intel_iommu=on iommu=on video=vesafb:off
[    0.049925] sysrq: sysrq always enabled.
[    0.049935] audit: disabled (until reboot)
[    0.049974] DMAR: IOMMU enabled
[    0.051050] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.051583] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    0.051646] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.099413] Memory: 16014372K/16458876K available (14339K kernel code, 2527K rwdata, 4992K rodata, 2588K init, 4988K bss, 444504K reserved, 0K cma-reserved)
[    0.099422] random: get_random_u64 called from __kmem_cache_create+0x42/0x540 with crng_init=0
[    0.099543] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.099555] Kernel/User page tables isolation: enabled
[    0.099571] ftrace: allocating 44939 entries in 176 pages
[    0.113386] ftrace: allocated 176 pages with 3 groups
[    0.113487] rcu: Hierarchical RCU implementation.
[    0.113488] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=8.
[    0.113489] 	Tasks RCU enabled.
[    0.113490] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.113491] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.116266] NR_IRQS: 524544, nr_irqs: 2048, preallocated irqs: 16
[    0.116540] random: crng done (trusting CPU's manufacturer)
[    0.116573] spurious 8259A interrupt: IRQ7.
[    0.116597] Console: colour dummy device 80x25
[    0.116773] printk: console [tty0] enabled
[    0.116787] ACPI: Core revision 20200326
[    0.117049] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
[    0.117153] APIC: Switch to symmetric I/O mode setup
[    0.117156] DMAR: Host address width 39
[    0.117158] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.117163] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 19e2ff0505e
[    0.117166] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.117169] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
[    0.117171] DMAR: RMRR base: 0x0000003d45f000 end: 0x0000003d47efff
[    0.117173] DMAR: RMRR base: 0x0000004b000000 end: 0x0000004f7fffff
[    0.117175] DMAR: ANDD device: 1 name: \_SB.PCI0.I2C0
[    0.117176] DMAR: ANDD device: 2 name: \_SB.PCI0.I2C1
[    0.117178] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.117180] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.117181] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    0.118829] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.118831] x2apic enabled
[    0.118844] Switched APIC routing to cluster x2apic.
[    0.122990] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.141228] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x1e44fb6c2ab, max_idle_ns: 440795206594 ns
[    0.141234] Calibrating delay loop (skipped), value calculated using timer frequency.. 4199.88 BogoMIPS (lpj=8399776)
[    0.141237] pid_max: default: 32768 minimum: 301
[    0.143084] LSM: Security Framework initializing
[    0.143093] Yama: becoming mindful.
[    0.143114] AppArmor: AppArmor initialized
[    0.143170] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.143202] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.143418] mce: CPU0: Thermal monitoring enabled (TM1)
[    0.143436] process: using mwait in idle threads
[    0.143439] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.143440] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.143443] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.143445] Spectre V2 : Mitigation: Full generic retpoline
[    0.143447] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.143448] Spectre V2 : Enabling Restricted Speculation for firmware calls
[    0.143450] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.143452] Spectre V2 : User space: Mitigation: STIBP via seccomp and prctl
[    0.143454] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[    0.143458] TAA: Mitigation: Clear CPU buffers
[    0.143459] MDS: Mitigation: Clear CPU buffers
[    0.143663] Freeing SMP alternatives memory: 40K
[    0.147158] TSC deadline timer enabled
[    0.147166] smpboot: CPU0: Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz (family: 0x6, model: 0x8e, stepping: 0xa)
[    0.147262] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.147269] ... version:                4
[    0.147270] ... bit width:              48
[    0.147271] ... generic registers:      4
[    0.147272] ... value mask:             0000ffffffffffff
[    0.147274] ... max period:             00007fffffffffff
[    0.147275] ... fixed-purpose events:   3
[    0.147276] ... event mask:             000000070000000f
[    0.147308] rcu: Hierarchical SRCU implementation.
[    0.148132] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.148192] smp: Bringing up secondary CPUs ...
[    0.148257] x86: Booting SMP configuration:
[    0.148258] .... node  #0, CPUs:      #1 #2 #3 #4
[    0.150353] MDS CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more details.
[    0.150353] TAA CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/tsx_async_abort.html for more details.
[    0.150353]  #5 #6 #7
[    0.153647] smp: Brought up 1 node, 8 CPUs
[    0.153647] smpboot: Max logical packages: 1
[    0.153647] smpboot: Total of 8 processors activated (33599.10 BogoMIPS)
[    0.156231] devtmpfs: initialized
[    0.157249] x86/mm: Memory block size: 128MB
[    0.158375] PM: Registering ACPI NVS region [mem 0x2bd33000-0x2bd33fff] (4096 bytes)
[    0.158375] PM: Registering ACPI NVS region [mem 0x3d7b5000-0x3de6cfff] (7045120 bytes)
[    0.158375] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.158375] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.158375] pinctrl core: initialized pinctrl subsystem
[    0.158375] PM: RTC time: 11:36:30, date: 2020-04-29
[    0.158375] thermal_sys: Registered thermal governor 'fair_share'
[    0.158375] thermal_sys: Registered thermal governor 'bang_bang'
[    0.158375] thermal_sys: Registered thermal governor 'step_wise'
[    0.158375] thermal_sys: Registered thermal governor 'user_space'
[    0.158375] NET: Registered protocol family 16
[    0.158375] EISA bus registered
[    0.158375] cpuidle: using governor ladder
[    0.158375] cpuidle: using governor menu
[    0.158375] Simple Boot Flag at 0x47 set to 0x80
[    0.158375] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.158375] ACPI: bus type PCI registered
[    0.158375] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.158375] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.158375] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.158375] PCI: Using configuration type 1 for base access
[    0.158375] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.158375] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.158375] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.161286] ACPI: Added _OSI(Module Device)
[    0.161288] ACPI: Added _OSI(Processor Device)
[    0.161290] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.161291] ACPI: Added _OSI(Processor Aggregator Device)
[    0.161292] ACPI: Added _OSI(Linux-Dell-Video)
[    0.161294] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.161295] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.200739] ACPI: 11 ACPI AML tables successfully acquired and loaded
[    0.265794] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.276154] ACPI: Dynamic OEM Table Load:
[    0.276163] ACPI: SSDT 0xFFFF99489C3D3000 0005EE (v02 PmRef  Cpu0Ist  00003000 INTL 20160422)
[    0.278098] ACPI: \_PR_.PR00: _OSC native thermal LVT Acked
[    0.279532] ACPI: Dynamic OEM Table Load:
[    0.279539] ACPI: SSDT 0xFFFF99489BF7C400 0003FF (v02 PmRef  Cpu0Cst  00003001 INTL 20160422)
[    0.281359] ACPI: Dynamic OEM Table Load:
[    0.281364] ACPI: SSDT 0xFFFF99489BE59480 0000BA (v02 PmRef  Cpu0Hwp  00003000 INTL 20160422)
[    0.282849] ACPI: Dynamic OEM Table Load:
[    0.282855] ACPI: SSDT 0xFFFF99489C3D7800 000628 (v02 PmRef  HwpLvt   00003000 INTL 20160422)
[    0.284799] ACPI: Dynamic OEM Table Load:
[    0.284807] ACPI: SSDT 0xFFFF99489BC3C000 000D14 (v02 PmRef  ApIst    00003000 INTL 20160422)
[    0.287086] ACPI: Dynamic OEM Table Load:
[    0.287091] ACPI: SSDT 0xFFFF99489BF79000 000317 (v02 PmRef  ApHwp    00003000 INTL 20160422)
[    0.288508] ACPI: Dynamic OEM Table Load:
[    0.288514] ACPI: SSDT 0xFFFF99489BF7BC00 00030A (v02 PmRef  ApCst    00003000 INTL 20160422)
[    0.292446] ACPI: EC: EC started
[    0.292448] ACPI: EC: interrupt blocked
[    0.300602] ACPI: EC: EC_CMD/EC_SC=0x934, EC_DATA=0x930
[    0.300605] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC used to handle transactions
[    0.300606] ACPI: Interpreter enabled
[    0.300645] ACPI: (supports S0 S3 S4 S5)
[    0.300647] ACPI: Using IOAPIC for interrupt routing
[    0.300680] PCI: Ignoring host bridge windows from ACPI; if necessary, use "pci=use_crs" and report a bug
[    0.301287] ACPI: Enabled 8 GPEs in block 00 to 7F
[    0.308414] ACPI: Power Resource [WRST] (on)
[    0.328926] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.328932] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.329277] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug SHPCHotplug PME AER]
[    0.329601] acpi PNP0A08:00: _OSC: OS now controls [PCIeCapability LTR]
[    0.329603] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.329886] acpi PNP0A08:00: host bridge window [io  0x0000-0x0cf7 window] (ignored)
[    0.329887] acpi PNP0A08:00: host bridge window [io  0x0cf8-0x0cff] (ignored)
[    0.329888] acpi PNP0A08:00: host bridge window [io  0x0d00-0xffff window] (ignored)
[    0.329888] acpi PNP0A08:00: host bridge window [mem 0x000a0000-0x000bffff window] (ignored)
[    0.329889] acpi PNP0A08:00: host bridge window [mem 0x000c0000-0x000c3fff window] (ignored)
[    0.329890] acpi PNP0A08:00: host bridge window [mem 0x000c4000-0x000c7fff window] (ignored)
[    0.329890] acpi PNP0A08:00: host bridge window [mem 0x000c8000-0x000cbfff window] (ignored)
[    0.329891] acpi PNP0A08:00: host bridge window [mem 0x000cc000-0x000cffff window] (ignored)
[    0.329891] acpi PNP0A08:00: host bridge window [mem 0x000d0000-0x000d3fff window] (ignored)
[    0.329892] acpi PNP0A08:00: host bridge window [mem 0x000d4000-0x000d7fff window] (ignored)
[    0.329893] acpi PNP0A08:00: host bridge window [mem 0x000d8000-0x000dbfff window] (ignored)
[    0.329893] acpi PNP0A08:00: host bridge window [mem 0x000dc000-0x000dffff window] (ignored)
[    0.329894] acpi PNP0A08:00: host bridge window [mem 0x4f800000-0xdfffffff window] (ignored)
[    0.329895] acpi PNP0A08:00: host bridge window [mem 0xfd000000-0xfe7fffff window] (ignored)
[    0.329895] PCI: root bus 00: using default resources
[    0.330249] PCI host bridge to bus 0000:00
[    0.330251] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    0.330253] pci_bus 0000:00: root bus resource [mem 0x00000000-0x7fffffffff]
[    0.330255] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.330264] pci 0000:00:00.0: [8086:5914] type 00 class 0x060000
[    0.330380] pci 0000:00:02.0: [8086:5917] type 00 class 0x030000
[    0.330391] pci 0000:00:02.0: reg 0x10: [mem 0xdb000000-0xdbffffff 64bit]
[    0.330397] pci 0000:00:02.0: reg 0x18: [mem 0x50000000-0x5fffffff 64bit pref]
[    0.330401] pci 0000:00:02.0: reg 0x20: [io  0xf000-0xf03f]
[    0.330414] pci 0000:00:02.0: BAR 2: assigned to efifb
[    0.330540] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000
[    0.330553] pci 0000:00:04.0: reg 0x10: [mem 0xdc320000-0xdc327fff 64bit]
[    0.330756] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
[    0.330775] pci 0000:00:14.0: reg 0x10: [mem 0xdc310000-0xdc31ffff 64bit]
[    0.330836] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.331030] pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
[    0.331051] pci 0000:00:14.2: reg 0x10: [mem 0xdc335000-0xdc335fff 64bit]
[    0.331266] pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000
[    0.331312] pci 0000:00:15.0: reg 0x10: [mem 0xdc334000-0xdc334fff 64bit]
[    0.331579] pci 0000:00:15.1: [8086:9d61] type 00 class 0x118000
[    0.331627] pci 0000:00:15.1: reg 0x10: [mem 0xdc333000-0xdc333fff 64bit]
[    0.331873] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
[    0.331890] pci 0000:00:16.0: reg 0x10: [mem 0xdc332000-0xdc332fff 64bit]
[    0.331935] pci 0000:00:16.0: PME# supported from D3hot
[    0.332076] pci 0000:00:16.3: [8086:9d3d] type 00 class 0x070002
[    0.332090] pci 0000:00:16.3: reg 0x10: [io  0xf060-0xf067]
[    0.332095] pci 0000:00:16.3: reg 0x14: [mem 0xdc331000-0xdc331fff]
[    0.332251] pci 0000:00:1c.0: [8086:9d10] type 01 class 0x060400
[    0.332330] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.332350] pci 0000:00:1c.0: Intel SPT PCH root port ACS workaround enabled
[    0.332523] pci 0000:00:1c.2: [8086:9d12] type 01 class 0x060400
[    0.332601] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.332619] pci 0000:00:1c.2: Intel SPT PCH root port ACS workaround enabled
[    0.332785] pci 0000:00:1c.4: [8086:9d14] type 01 class 0x060400
[    0.332904] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.332919] pci 0000:00:1c.4: Intel SPT PCH root port ACS workaround enabled
[    0.333083] pci 0000:00:1d.0: [8086:9d18] type 01 class 0x060400
[    0.333151] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.333166] pci 0000:00:1d.0: Intel SPT PCH root port ACS workaround enabled
[    0.333357] pci 0000:00:1f.0: [8086:9d4e] type 00 class 0x060100
[    0.333545] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
[    0.333559] pci 0000:00:1f.2: reg 0x10: [mem 0xdc32c000-0xdc32ffff]
[    0.333715] pci 0000:00:1f.3: [8086:9d71] type 00 class 0x040380
[    0.333738] pci 0000:00:1f.3: reg 0x10: [mem 0xdc328000-0xdc32bfff 64bit]
[    0.333763] pci 0000:00:1f.3: reg 0x20: [mem 0xdc300000-0xdc30ffff 64bit]
[    0.333807] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.334020] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500
[    0.334082] pci 0000:00:1f.4: reg 0x10: [mem 0xdc330000-0xdc3300ff 64bit]
[    0.334154] pci 0000:00:1f.4: reg 0x20: [io  0xf040-0xf05f]
[    0.334751] pci 0000:01:00.0: [10ec:525a] type 00 class 0xff0000
[    0.334782] pci 0000:01:00.0: reg 0x14: [mem 0xdc200000-0xdc200fff]
[    0.334881] pci 0000:01:00.0: supports D1 D2
[    0.334883] pci 0000:01:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.335206] pci 0000:00:1c.0: PCI bridge to [bus 01-fe]
[    0.335210] pci 0000:00:1c.0:   bridge window [mem 0xdc200000-0xdc2fffff]
[    0.335215] pci_bus 0000:01: busn_res: [bus 01-fe] end is updated to 01
[    0.335610] pci 0000:02:00.0: [8086:24fd] type 00 class 0x028000
[    0.335707] pci 0000:02:00.0: reg 0x10: [mem 0xdc100000-0xdc101fff 64bit]
[    0.335970] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.336664] pci 0000:00:1c.2: PCI bridge to [bus 02-fe]
[    0.336669] pci 0000:00:1c.2:   bridge window [mem 0xdc100000-0xdc1fffff]
[    0.336674] pci_bus 0000:02: busn_res: [bus 02-fe] end is updated to 02
[    0.336773] pci 0000:03:00.0: [8086:15d3] type 01 class 0x060400
[    0.336829] pci 0000:03:00.0: enabling Extended Tags
[    0.336904] pci 0000:03:00.0: supports D1 D2
[    0.336905] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.337034] pci 0000:00:1c.4: PCI bridge to [bus 03-fe]
[    0.337038] pci 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0fffff]
[    0.337056] pci 0000:00:1c.4:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[    0.337133] pci 0000:04:00.0: [8086:15d3] type 01 class 0x060400
[    0.337205] pci 0000:04:00.0: enabling Extended Tags
[    0.337283] pci 0000:04:00.0: supports D1 D2
[    0.337284] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.337395] pci 0000:04:01.0: [8086:15d3] type 01 class 0x060400
[    0.337454] pci 0000:04:01.0: enabling Extended Tags
[    0.337534] pci 0000:04:01.0: supports D1 D2
[    0.337535] pci 0000:04:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.337642] pci 0000:04:02.0: [8086:15d3] type 01 class 0x060400
[    0.337700] pci 0000:04:02.0: enabling Extended Tags
[    0.337776] pci 0000:04:02.0: supports D1 D2
[    0.337778] pci 0000:04:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.337901] pci 0000:04:04.0: [8086:15d3] type 01 class 0x060400
[    0.337963] pci 0000:04:04.0: enabling Extended Tags
[    0.338043] pci 0000:04:04.0: supports D1 D2
[    0.338044] pci 0000:04:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.338162] pci 0000:03:00.0: PCI bridge to [bus 04-fe]
[    0.338170] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xac1fffff]
[    0.338254] pci 0000:05:00.0: [8086:15d2] type 00 class 0x088000
[    0.338282] pci 0000:05:00.0: reg 0x10: [mem 0xac100000-0xac13ffff]
[    0.338291] pci 0000:05:00.0: reg 0x14: [mem 0xac140000-0xac140fff]
[    0.338335] pci 0000:05:00.0: enabling Extended Tags
[    0.338433] pci 0000:05:00.0: supports D1 D2
[    0.338434] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.338598] pci 0000:04:00.0: PCI bridge to [bus 05-fe]
[    0.338606] pci 0000:04:00.0:   bridge window [mem 0xac100000-0xac1fffff]
[    0.338613] pci_bus 0000:05: busn_res: [bus 05-fe] end is updated to 05
[    0.338658] pci 0000:04:01.0: PCI bridge to [bus 06-fe]
[    0.338671] pci_bus 0000:06: busn_res: [bus 06-fe] end is updated to 38
[    0.338737] pci 0000:39:00.0: [8086:15d4] type 00 class 0x0c0330
[    0.338770] pci 0000:39:00.0: reg 0x10: [mem 0xac000000-0xac00ffff]
[    0.338843] pci 0000:39:00.0: enabling Extended Tags
[    0.338942] pci 0000:39:00.0: supports D1 D2
[    0.338943] pci 0000:39:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.339045] pci 0000:39:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:04:02.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
[    0.339132] pci 0000:04:02.0: PCI bridge to [bus 39-fe]
[    0.339140] pci 0000:04:02.0:   bridge window [mem 0xac000000-0xac0fffff]
[    0.339146] pci_bus 0000:39: busn_res: [bus 39-fe] end is updated to 39
[    0.339193] pci 0000:04:04.0: PCI bridge to [bus 3a-fe]
[    0.339206] pci_bus 0000:3a: busn_res: [bus 3a-fe] end is updated to 6c
[    0.339210] pci_bus 0000:04: busn_res: [bus 04-fe] end is updated to 6c
[    0.339214] pci_bus 0000:03: busn_res: [bus 03-fe] end is updated to 6c
[    0.339306] pci 0000:6d:00.0: [1179:0116] type 00 class 0x010802
[    0.339333] pci 0000:6d:00.0: reg 0x10: [mem 0xdc000000-0xdc003fff 64bit]
[    0.339545] pci 0000:00:1d.0: PCI bridge to [bus 6d-fe]
[    0.339549] pci 0000:00:1d.0:   bridge window [mem 0xdc000000-0xdc0fffff]
[    0.339553] pci_bus 0000:6d: busn_res: [bus 6d-fe] end is updated to 6d
[    0.341226] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.341283] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 15)
[    0.341336] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.341388] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.341440] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.341493] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.341545] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.341597] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.356735] ACPI: EC: interrupt unblocked
[    0.356737] ACPI: EC: event unblocked
[    0.356744] ACPI: EC: EC_CMD/EC_SC=0x934, EC_DATA=0x930
[    0.356746] ACPI: EC: GPE=0x6e
[    0.356748] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC initialization complete
[    0.356749] ACPI: \_SB_.PCI0.LPCB.ECDV: EC: Used to handle transactions and events
[    0.356818] iommu: Default domain type: Translated 
[    0.356818] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.356818] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.356818] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.356818] vgaarb: loaded
[    0.356818] SCSI subsystem initialized
[    0.356818] libata version 3.00 loaded.
[    0.356818] ACPI: bus type USB registered
[    0.356818] usbcore: registered new interface driver usbfs
[    0.356818] usbcore: registered new interface driver hub
[    0.356818] usbcore: registered new device driver usb
[    0.356818] pps_core: LinuxPPS API ver. 1 registered
[    0.356818] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.356818] PTP clock support registered
[    0.356818] EDAC MC: Ver: 3.0.0
[    0.357527] Registered efivars operations
[    0.358185] PCI: Using ACPI for IRQ routing
[    0.376049] PCI: pci_cache_line_size set to 64 bytes
[    0.381253] e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]
[    0.381253] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
[    0.381254] e820: reserve RAM buffer [mem 0x2bd33000-0x2bffffff]
[    0.381254] e820: reserve RAM buffer [mem 0x39d44000-0x3bffffff]
[    0.381255] e820: reserve RAM buffer [mem 0x3d384000-0x3fffffff]
[    0.381256] e820: reserve RAM buffer [mem 0x48e00000-0x4bffffff]
[    0.381256] e820: reserve RAM buffer [mem 0x4ae800000-0x4afffffff]
[    0.381336] NetLabel: Initializing
[    0.381338] NetLabel:  domain hash size = 128
[    0.381339] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.381350] NetLabel:  unlabeled traffic allowed by default
[    0.381876] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.381880] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    0.383935] clocksource: Switched to clocksource tsc-early
[    0.390912] VFS: Disk quotas dquot_6.6.0
[    0.390926] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.391008] AppArmor: AppArmor Filesystem Enabled
[    0.391037] pnp: PnP ACPI init
[    0.391361] system 00:00: [io  0x0680-0x069f] has been reserved
[    0.391364] system 00:00: [io  0xffff] has been reserved
[    0.391365] system 00:00: [io  0xffff] has been reserved
[    0.391367] system 00:00: [io  0xffff] has been reserved
[    0.391369] system 00:00: [io  0x1800-0x18fe] has been reserved
[    0.391370] system 00:00: [io  0x164e-0x164f] has been reserved
[    0.391375] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.391464] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.391498] system 00:02: [io  0x1854-0x1857] has been reserved
[    0.391501] system 00:02: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
[    0.391619] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.391631] pnp 00:04: Plug and Play ACPI device, IDs DLL07e6 PNP0f13 (active)
[    0.391859] system 00:05: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.391862] system 00:05: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.391863] system 00:05: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.391865] system 00:05: [mem 0xe0000000-0xefffffff] has been reserved
[    0.391867] system 00:05: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.391869] system 00:05: [mem 0xfed90000-0xfed93fff] could not be reserved
[    0.391871] system 00:05: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.391873] system 00:05: [mem 0xff000000-0xffffffff] has been reserved
[    0.391874] system 00:05: [mem 0xfee00000-0xfeefffff] could not be reserved
[    0.391876] system 00:05: [mem 0xdffe0000-0xdfffffff] has been reserved
[    0.391879] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.391917] system 00:06: [mem 0xfd000000-0xfdabffff] has been reserved
[    0.391919] system 00:06: [mem 0xfdad0000-0xfdadffff] has been reserved
[    0.391921] system 00:06: [mem 0xfdb00000-0xfdffffff] has been reserved
[    0.391923] system 00:06: [mem 0xfe000000-0xfe01ffff] could not be reserved
[    0.391925] system 00:06: [mem 0xfe036000-0xfe03bfff] has been reserved
[    0.391926] system 00:06: [mem 0xfe03d000-0xfe3fffff] has been reserved
[    0.391928] system 00:06: [mem 0xfe410000-0xfe7fffff] has been reserved
[    0.391931] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.392199] system 00:07: [io  0xff00-0xfffe] has been reserved
[    0.392202] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.393253] system 00:08: [mem 0xfe029000-0xfe029fff] has been reserved
[    0.393256] system 00:08: [mem 0xfe028000-0xfe028fff] has been reserved
[    0.393259] system 00:08: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.397184] pnp: PnP ACPI: found 9 devices
[    0.402487] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.402511] pci_bus 0000:00: max bus depth: 3 pci_try_num: 4
[    0.402519] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.402526] pci 0000:00:1c.0:   bridge window [mem 0xdc200000-0xdc2fffff]
[    0.402532] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    0.402535] pci 0000:00:1c.2:   bridge window [mem 0xdc100000-0xdc1fffff]
[    0.402544] pci 0000:03:00.0: BAR 15: no space for [mem size 0x2000000000 64bit pref]
[    0.402546] pci 0000:03:00.0: BAR 15: failed to assign [mem size 0x2000000000 64bit pref]
[    0.402549] pci 0000:04:01.0: BAR 14: no space for [mem size 0x19000000]
[    0.402551] pci 0000:04:01.0: BAR 14: failed to assign [mem size 0x19000000]
[    0.402552] pci 0000:04:01.0: BAR 15: no space for [mem size 0x1000000000 64bit pref]
[    0.402554] pci 0000:04:01.0: BAR 15: failed to assign [mem size 0x1000000000 64bit pref]
[    0.402556] pci 0000:04:04.0: BAR 14: no space for [mem size 0x19000000]
[    0.402558] pci 0000:04:04.0: BAR 14: failed to assign [mem size 0x19000000]
[    0.402560] pci 0000:04:04.0: BAR 15: no space for [mem size 0x1000000000 64bit pref]
[    0.402562] pci 0000:04:04.0: BAR 15: failed to assign [mem size 0x1000000000 64bit pref]
[    0.402564] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.402568] pci 0000:04:00.0:   bridge window [mem 0xac100000-0xac1fffff]
[    0.402577] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[    0.402588] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.402593] pci 0000:04:02.0:   bridge window [mem 0xac000000-0xac0fffff]
[    0.402600] pci 0000:04:04.0: PCI bridge to [bus 3a-6c]
[    0.402612] pci 0000:03:00.0: PCI bridge to [bus 04-6c]
[    0.402616] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xac1fffff]
[    0.402623] pci 0000:00:1c.4: PCI bridge to [bus 03-6c]
[    0.402626] pci 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0fffff]
[    0.402629] pci 0000:00:1c.4:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[    0.402634] pci 0000:00:1d.0: PCI bridge to [bus 6d]
[    0.402637] pci 0000:00:1d.0:   bridge window [mem 0xdc000000-0xdc0fffff]
[    0.402643] pci_bus 0000:00: No. 2 try to assign unassigned res
[    0.402647] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.402652] pci 0000:00:1c.0:   bridge window [mem 0xdc200000-0xdc2fffff]
[    0.402658] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    0.402661] pci 0000:00:1c.2:   bridge window [mem 0xdc100000-0xdc1fffff]
[    0.402668] pci 0000:03:00.0: BAR 15: no space for [mem size 0x2000000000 64bit pref]
[    0.402670] pci 0000:03:00.0: BAR 15: failed to assign [mem size 0x2000000000 64bit pref]
[    0.402672] pci 0000:04:01.0: BAR 14: no space for [mem size 0x19000000]
[    0.402674] pci 0000:04:01.0: BAR 14: failed to assign [mem size 0x19000000]
[    0.402676] pci 0000:04:01.0: BAR 15: no space for [mem size 0x1000000000 64bit pref]
[    0.402678] pci 0000:04:01.0: BAR 15: failed to assign [mem size 0x1000000000 64bit pref]
[    0.402680] pci 0000:04:04.0: BAR 14: no space for [mem size 0x19000000]
[    0.402681] pci 0000:04:04.0: BAR 14: failed to assign [mem size 0x19000000]
[    0.402683] pci 0000:04:04.0: BAR 15: no space for [mem size 0x1000000000 64bit pref]
[    0.402685] pci 0000:04:04.0: BAR 15: failed to assign [mem size 0x1000000000 64bit pref]
[    0.402687] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.402691] pci 0000:04:00.0:   bridge window [mem 0xac100000-0xac1fffff]
[    0.402699] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[    0.402710] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.402714] pci 0000:04:02.0:   bridge window [mem 0xac000000-0xac0fffff]
[    0.402722] pci 0000:04:04.0: PCI bridge to [bus 3a-6c]
[    0.402733] pci 0000:03:00.0: PCI bridge to [bus 04-6c]
[    0.402738] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xac1fffff]
[    0.402746] pci 0000:00:1c.4: PCI bridge to [bus 03-6c]
[    0.402749] pci 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0fffff]
[    0.402752] pci 0000:00:1c.4:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[    0.402756] pci 0000:00:1d.0: PCI bridge to [bus 6d]
[    0.402759] pci 0000:00:1d.0:   bridge window [mem 0xdc000000-0xdc0fffff]
[    0.402764] pci_bus 0000:00: No. 3 try to assign unassigned res
[    0.402766] release child resource [mem 0xac100000-0xac13ffff]
[    0.402766] release child resource [mem 0xac140000-0xac140fff]
[    0.402767] pci 0000:04:00.0: resource 14 [mem 0xac100000-0xac1fffff] released
[    0.402769] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.402772] release child resource [mem 0xac000000-0xac00ffff]
[    0.402773] pci 0000:04:02.0: resource 14 [mem 0xac000000-0xac0fffff] released
[    0.402774] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.402778] pci 0000:03:00.0: resource 14 [mem 0xac000000-0xac1fffff] released
[    0.402779] pci 0000:03:00.0: PCI bridge to [bus 04-6c]
[    0.402783] pci 0000:00:1c.4: resource 15 [mem 0x60000000-0xa9ffffff 64bit pref] released
[    0.402785] pci 0000:00:1c.4: PCI bridge to [bus 03-6c]
[    0.402794] pci 0000:00:1c.4: BAR 15: assigned [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.402796] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.402802] pci 0000:00:1c.0:   bridge window [mem 0xdc200000-0xdc2fffff]
[    0.402807] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    0.402811] pci 0000:00:1c.2:   bridge window [mem 0xdc100000-0xdc1fffff]
[    0.402817] pci 0000:03:00.0: BAR 14: no space for [mem size 0x32200000]
[    0.402819] pci 0000:03:00.0: BAR 14: failed to assign [mem size 0x32200000]
[    0.402821] pci 0000:03:00.0: BAR 15: assigned [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.402823] pci 0000:04:00.0: BAR 14: no space for [mem size 0x00100000]
[    0.402825] pci 0000:04:00.0: BAR 14: failed to assign [mem size 0x00100000]
[    0.402827] pci 0000:04:01.0: BAR 14: no space for [mem size 0x19000000]
[    0.402828] pci 0000:04:01.0: BAR 14: failed to assign [mem size 0x19000000]
[    0.402830] pci 0000:04:01.0: BAR 15: assigned [mem 0x4b0000000-0x14afffffff 64bit pref]
[    0.402832] pci 0000:04:02.0: BAR 14: no space for [mem size 0x00100000]
[    0.402833] pci 0000:04:02.0: BAR 14: failed to assign [mem size 0x00100000]
[    0.402835] pci 0000:04:04.0: BAR 14: no space for [mem size 0x19000000]
[    0.402836] pci 0000:04:04.0: BAR 14: failed to assign [mem size 0x19000000]
[    0.402838] pci 0000:04:04.0: BAR 15: assigned [mem 0x14b0000000-0x24afffffff 64bit pref]
[    0.402840] pci 0000:05:00.0: BAR 0: no space for [mem size 0x00040000]
[    0.402842] pci 0000:05:00.0: BAR 0: failed to assign [mem size 0x00040000]
[    0.402844] pci 0000:05:00.0: BAR 1: no space for [mem size 0x00001000]
[    0.402845] pci 0000:05:00.0: BAR 1: failed to assign [mem size 0x00001000]
[    0.402847] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.402857] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[    0.402864] pci 0000:04:01.0:   bridge window [mem 0x4b0000000-0x14afffffff 64bit pref]
[    0.402871] pci 0000:39:00.0: BAR 0: no space for [mem size 0x00010000]
[    0.402872] pci 0000:39:00.0: BAR 0: failed to assign [mem size 0x00010000]
[    0.402874] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.402886] pci 0000:04:04.0: PCI bridge to [bus 3a-6c]
[    0.402893] pci 0000:04:04.0:   bridge window [mem 0x14b0000000-0x24afffffff 64bit pref]
[    0.402899] pci 0000:03:00.0: PCI bridge to [bus 04-6c]
[    0.402906] pci 0000:03:00.0:   bridge window [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.402912] pci 0000:00:1c.4: PCI bridge to [bus 03-6c]
[    0.402915] pci 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0fffff]
[    0.402918] pci 0000:00:1c.4:   bridge window [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.402922] pci 0000:00:1d.0: PCI bridge to [bus 6d]
[    0.402926] pci 0000:00:1d.0:   bridge window [mem 0xdc000000-0xdc0fffff]
[    0.402931] pci_bus 0000:00: No. 4 try to assign unassigned res
[    0.402933] pci 0000:00:1c.4: resource 14 [mem 0xac000000-0xda0fffff] released
[    0.402935] pci 0000:00:1c.4: PCI bridge to [bus 03-6c]
[    0.402941] pci 0000:00:1c.4: BAR 14: assigned [mem 0x60000000-0x921fffff]
[    0.402943] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.402948] pci 0000:00:1c.0:   bridge window [mem 0xdc200000-0xdc2fffff]
[    0.402967] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    0.402973] pci 0000:00:1c.2:   bridge window [mem 0xdc100000-0xdc1fffff]
[    0.402979] pci 0000:03:00.0: BAR 14: assigned [mem 0x60000000-0x921fffff]
[    0.402981] pci 0000:04:00.0: BAR 14: assigned [mem 0x60000000-0x600fffff]
[    0.402983] pci 0000:04:01.0: BAR 14: assigned [mem 0x60100000-0x790fffff]
[    0.402985] pci 0000:04:02.0: BAR 14: assigned [mem 0x79100000-0x791fffff]
[    0.402986] pci 0000:04:04.0: BAR 14: assigned [mem 0x79200000-0x921fffff]
[    0.402989] pci 0000:05:00.0: BAR 0: assigned [mem 0x60000000-0x6003ffff]
[    0.402993] pci 0000:05:00.0: BAR 1: assigned [mem 0x60040000-0x60040fff]
[    0.402998] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.403002] pci 0000:04:00.0:   bridge window [mem 0x60000000-0x600fffff]
[    0.403010] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[    0.403015] pci 0000:04:01.0:   bridge window [mem 0x60100000-0x790fffff]
[    0.403019] pci 0000:04:01.0:   bridge window [mem 0x4b0000000-0x14afffffff 64bit pref]
[    0.403025] pci 0000:39:00.0: BAR 0: assigned [mem 0x79100000-0x7910ffff]
[    0.403030] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.403035] pci 0000:04:02.0:   bridge window [mem 0x79100000-0x791fffff]
[    0.403042] pci 0000:04:04.0: PCI bridge to [bus 3a-6c]
[    0.403047] pci 0000:04:04.0:   bridge window [mem 0x79200000-0x921fffff]
[    0.403051] pci 0000:04:04.0:   bridge window [mem 0x14b0000000-0x24afffffff 64bit pref]
[    0.403057] pci 0000:03:00.0: PCI bridge to [bus 04-6c]
[    0.403061] pci 0000:03:00.0:   bridge window [mem 0x60000000-0x921fffff]
[    0.403065] pci 0000:03:00.0:   bridge window [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.403071] pci 0000:00:1c.4: PCI bridge to [bus 03-6c]
[    0.403075] pci 0000:00:1c.4:   bridge window [mem 0x60000000-0x921fffff]
[    0.403077] pci 0000:00:1c.4:   bridge window [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.403081] pci 0000:00:1d.0: PCI bridge to [bus 6d]
[    0.403084] pci 0000:00:1d.0:   bridge window [mem 0xdc000000-0xdc0fffff]
[    0.403090] pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
[    0.403092] pci_bus 0000:00: resource 5 [mem 0x00000000-0x7fffffffff]
[    0.403094] pci_bus 0000:01: resource 1 [mem 0xdc200000-0xdc2fffff]
[    0.403095] pci_bus 0000:02: resource 1 [mem 0xdc100000-0xdc1fffff]
[    0.403097] pci_bus 0000:03: resource 1 [mem 0x60000000-0x921fffff]
[    0.403099] pci_bus 0000:03: resource 2 [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.403101] pci_bus 0000:04: resource 1 [mem 0x60000000-0x921fffff]
[    0.403102] pci_bus 0000:04: resource 2 [mem 0x4b0000000-0x24afffffff 64bit pref]
[    0.403104] pci_bus 0000:05: resource 1 [mem 0x60000000-0x600fffff]
[    0.403106] pci_bus 0000:06: resource 1 [mem 0x60100000-0x790fffff]
[    0.403107] pci_bus 0000:06: resource 2 [mem 0x4b0000000-0x14afffffff 64bit pref]
[    0.403109] pci_bus 0000:39: resource 1 [mem 0x79100000-0x791fffff]
[    0.403111] pci_bus 0000:3a: resource 1 [mem 0x79200000-0x921fffff]
[    0.403112] pci_bus 0000:3a: resource 2 [mem 0x14b0000000-0x24afffffff 64bit pref]
[    0.403114] pci_bus 0000:6d: resource 1 [mem 0xdc000000-0xdc0fffff]
[    0.403254] NET: Registered protocol family 2
[    0.403376] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.403454] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.403601] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    0.403667] TCP: Hash tables configured (established 131072 bind 65536)
[    0.403777] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.403815] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.403869] NET: Registered protocol family 1
[    0.403874] NET: Registered protocol family 44
[    0.403882] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.404954] PCI: CLS 0 bytes, default 64
[    0.404985] Trying to unpack rootfs image as initramfs...
[    0.497160] Freeing initrd memory: 11628K
[    0.497209] DMAR: ACPI device "device:75" under DMAR at fed91000 as 00:15.0
[    0.497213] DMAR: ACPI device "device:76" under DMAR at fed91000 as 00:15.1
[    0.497225] DMAR: No ATSR found
[    0.497283] DMAR: dmar0: Using Queued invalidation
[    0.497286] DMAR: dmar1: Using Queued invalidation
[    0.497687] pci 0000:00:00.0: Adding to iommu group 0
[    0.503436] pci 0000:00:02.0: Adding to iommu group 1
[    0.503489] pci 0000:00:04.0: Adding to iommu group 2
[    0.503559] pci 0000:00:14.0: Adding to iommu group 3
[    0.503568] pci 0000:00:14.2: Adding to iommu group 3
[    0.503614] pci 0000:00:15.0: Adding to iommu group 4
[    0.503622] pci 0000:00:15.1: Adding to iommu group 4
[    0.503681] pci 0000:00:16.0: Adding to iommu group 5
[    0.503690] pci 0000:00:16.3: Adding to iommu group 5
[    0.503734] pci 0000:00:1c.0: Adding to iommu group 6
[    0.503803] pci 0000:00:1c.2: Adding to iommu group 7
[    0.503845] pci 0000:00:1c.4: Adding to iommu group 8
[    0.503899] pci 0000:00:1d.0: Adding to iommu group 9
[    0.505204] pci 0000:00:1f.0: Adding to iommu group 10
[    0.505214] pci 0000:00:1f.2: Adding to iommu group 10
[    0.505223] pci 0000:00:1f.3: Adding to iommu group 10
[    0.505236] pci 0000:00:1f.4: Adding to iommu group 10
[    0.505299] pci 0000:01:00.0: Adding to iommu group 11
[    0.505346] pci 0000:02:00.0: Adding to iommu group 12
[    0.505403] pci 0000:03:00.0: Adding to iommu group 13
[    0.505445] pci 0000:04:00.0: Adding to iommu group 14
[    0.505500] pci 0000:04:01.0: Adding to iommu group 15
[    0.505542] pci 0000:04:02.0: Adding to iommu group 16
[    0.505597] pci 0000:04:04.0: Adding to iommu group 17
[    0.505608] pci 0000:05:00.0: Adding to iommu group 14
[    0.505620] pci 0000:39:00.0: Adding to iommu group 16
[    0.505662] pci 0000:6d:00.0: Adding to iommu group 18
[    0.505841] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.507269] check: Scanning for low memory corruption every 60 seconds
[    0.508731] Initialise system trusted keyrings
[    0.508742] Key type blacklist registered
[    0.508764] workingset: timestamp_bits=36 max_order=22 bucket_order=0
[    0.509704] zbud: loaded
[    0.509886] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.510000] fuse: init (API version 7.31)
[    0.510100] integrity: Platform Keyring initialized
[    0.513214] Key type asymmetric registered
[    0.513217] Asymmetric key parser 'x509' registered
[    0.513224] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 244)
[    0.513262] io scheduler mq-deadline registered
[    0.513586] pcieport 0000:00:1c.0: PME: Signaling with IRQ 122
[    0.513632] pcieport 0000:00:1c.0: AER: enabled with IRQ 122
[    0.513824] pcieport 0000:00:1c.2: PME: Signaling with IRQ 123
[    0.513869] pcieport 0000:00:1c.2: AER: enabled with IRQ 123
[    0.513957] pcieport 0000:00:1c.4: PME: Signaling with IRQ 124
[    0.514003] pcieport 0000:00:1c.4: AER: enabled with IRQ 124
[    0.514012] pcieport 0000:00:1c.4: AER: Corrected error received: 0000:03:00.0
[    0.514017] pci 0000:03:00.0: AER: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
[    0.514019] pcieport 0000:00:1c.4: pciehp: Slot #8 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.514022] pci 0000:03:00.0: AER:   device [8086:15d3] error status/mask=00000080/00002000
[    0.514024] pci 0000:03:00.0: AER:    [ 7] BadDLLP               
[    0.514192] pcieport 0000:00:1d.0: PME: Signaling with IRQ 125
[    0.514224] pcieport 0000:00:1d.0: AER: enabled with IRQ 125
[    0.514655] pcieport 0000:04:01.0: pciehp: Slot #1 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.514983] pcieport 0000:04:04.0: pciehp: Slot #4 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.515117] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.515168] efifb: probing for efifb
[    0.515178] efifb: framebuffer at 0x50000000, using 3072k, total 3072k
[    0.515180] efifb: mode is 1024x768x32, linelength=4096, pages=1
[    0.515181] efifb: scrolling: redraw
[    0.515183] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.515210] fb0: EFI VGA frame buffer device
[    0.515216] intel_idle: MWAIT substates: 0x11142120
[    0.515217] intel_idle: v0.5.1 model 0x8E
[    0.515545] intel_idle: Local APIC timer is reliable in all C-states
[    0.520482] ACPI: AC Adapter [AC] (off-line)
[    0.520569] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
[    0.520597] ACPI: Lid Switch [LID0]
[    0.520614] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
[    0.520629] ACPI: Power Button [PBTN]
[    0.520644] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input2
[    0.520653] ACPI: Sleep Button [SBTN]
[    0.520669] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
[    0.520682] ACPI: Power Button [PWRF]
[    0.523448] thermal LNXTHERM:00: registered as thermal_zone0
[    0.523451] ACPI: Thermal Zone [THM] (25 C)
[    0.523684] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.525015] serial 0000:00:16.3: enabling device (0000 -> 0003)
[    0.546222] 0000:00:16.3: ttyS4 at I/O 0xf060 (irq = 19, base_baud = 115200) is a 16550A
[    0.547487] Linux agpgart interface v0.103
[    0.553268] battery: ACPI: Battery Slot [BAT0] (battery present)
[    0.577611] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0xFC, rev-id 1)
[    0.633988] loop: module loaded
[    0.634437] libphy: Fixed MDIO Bus: probed
[    0.634441] tun: Universal TUN/TAP device driver, 1.6
[    0.634522] PPP generic driver version 2.4.2
[    0.634675] VFIO - User Level meta-driver version: 0.3
[    0.634808] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.634820] ehci-pci: EHCI PCI platform driver
[    0.634838] ehci-platform: EHCI generic platform driver
[    0.634855] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.634858] ohci-pci: OHCI PCI platform driver
[    0.634870] ohci-platform: OHCI generic platform driver
[    0.634881] uhci_hcd: USB Universal Host Controller Interface driver
[    0.635179] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.635187] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[    0.636317] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000081109810
[    0.636706] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[    0.636924] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.07
[    0.636928] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.636932] usb usb1: Product: xHCI Host Controller
[    0.636935] usb usb1: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[    0.636937] usb usb1: SerialNumber: 0000:00:14.0
[    0.637081] hub 1-0:1.0: USB hub found
[    0.637099] hub 1-0:1.0: 12 ports detected
[    0.638848] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.638854] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[    0.638859] xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
[    0.638899] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.07
[    0.638903] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.638906] usb usb2: Product: xHCI Host Controller
[    0.638909] usb usb2: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[    0.638911] usb usb2: SerialNumber: 0000:00:14.0
[    0.639120] hub 2-0:1.0: USB hub found
[    0.639134] hub 2-0:1.0: 6 ports detected
[    0.639552] usb: port power management may be unreliable
[    0.640127] xhci_hcd 0000:39:00.0: xHCI Host Controller
[    0.640135] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bus number 3
[    0.641305] xhci_hcd 0000:39:00.0: hcc params 0x200077c1 hci version 0x110 quirks 0x0000000200009810
[    0.641524] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.07
[    0.641528] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.641531] usb usb3: Product: xHCI Host Controller
[    0.641534] usb usb3: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[    0.641536] usb usb3: SerialNumber: 0000:39:00.0
[    0.641739] hub 3-0:1.0: USB hub found
[    0.641751] hub 3-0:1.0: 2 ports detected
[    0.642287] xhci_hcd 0000:39:00.0: xHCI Host Controller
[    0.642293] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bus number 4
[    0.642298] xhci_hcd 0000:39:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[    0.642337] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.07
[    0.642341] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.642344] usb usb4: Product: xHCI Host Controller
[    0.642347] usb usb4: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[    0.642349] usb usb4: SerialNumber: 0000:39:00.0
[    0.642555] hub 4-0:1.0: USB hub found
[    0.642567] hub 4-0:1.0: 2 ports detected
[    0.643064] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
[    0.647618] i8042: Warning: Keylock active
[    0.649030] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.649036] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.649213] mousedev: PS/2 mouse device common for all mice
[    0.649679] rtc_cmos 00:01: RTC can wake from S4
[    0.650294] rtc_cmos 00:01: registered as rtc0
[    0.650457] rtc_cmos 00:01: setting system clock to 2020-04-29T11:36:30 UTC (1588160190)
[    0.650491] rtc_cmos 00:01: alarms up to one month, y3k, 242 bytes nvram
[    0.650502] i2c /dev entries driver
[    0.650588] device-mapper: uevent: version 1.0.3
[    0.650648] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input4
[    0.651987] device-mapper: ioctl: 4.42.0-ioctl (2020-02-27) initialised: dm-devel@redhat.com
[    0.652020] platform eisa.0: Probing EISA bus 0
[    0.652032] platform eisa.0: Cannot allocate resource for EISA slot 1
[    0.652084] platform eisa.0: EISA: Detected 0 cards
[    0.652090] intel_pstate: Intel P-state driver initializing
[    0.652917] intel_pstate: HWP enabled
[    0.653064] ledtrig-cpu: registered to indicate activity on CPUs
[    0.653069] EFI Variables Facility v0.08 2004-May-17
[    0.908309] intel_pmc_core INT33A1:00:  initialized
[    0.908409] drop_monitor: Initializing network drop monitor service
[    0.908549] NET: Registered protocol family 10
[    0.914610] Segment Routing with IPv6
[    0.914626] NET: Registered protocol family 17
[    0.914743] Key type dns_resolver registered
[    0.915324] RAS: Correctable Errors collector initialized.
[    0.915351] microcode: sig=0x806ea, pf=0x80, revision=0xca
[    0.915609] microcode: Microcode Update Driver: v2.2.
[    0.915613] IPI shorthand broadcast: enabled
[    0.915619] sched_clock: Marking stable (914875770, 731105)->(920883377, -5276502)
[    0.915721] registered taskstats version 1
[    0.915732] Loading compiled-in X.509 certificates
[    0.917050] Loaded X.509 cert 'Build time autogenerated kernel key: d54ce72edc400484e647ca51da6a4a87c88de3d3'
[    0.917076] zswap: loaded using pool lzo/zbud
[    0.917186] Key type ._fscrypt registered
[    0.917188] Key type .fscrypt registered
[    0.917189] Key type fscrypt-provisioning registered
[    0.921930] Key type big_key registered
[    0.921948] Key type trusted registered
[    0.924584] Key type encrypted registered
[    0.924602] AppArmor: AppArmor sha1 policy hashing enabled
[    0.926158] integrity: Loading X.509 certificate: UEFI:db
[    0.926174] integrity: Loaded X.509 cert 'Dell Inc. UEFI DB: 5ddb772dc880660055ba0bc131886bb630a639e7'
[    0.926176] integrity: Loading X.509 certificate: UEFI:db
[    0.926190] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    0.926191] integrity: Loading X.509 certificate: UEFI:db
[    0.926203] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    0.927930] ima: Allocated hash algorithm: sha1
[    0.973516] usb 1-5: new high-speed USB device number 2 using xhci_hcd
[    1.017597] ima: No architecture policies found
[    1.017616] evm: Initialising EVM extended attributes:
[    1.017618] evm: security.selinux
[    1.017619] evm: security.SMACK64
[    1.017619] evm: security.SMACK64EXEC
[    1.017620] evm: security.SMACK64TRANSMUTE
[    1.017621] evm: security.SMACK64MMAP
[    1.017622] evm: security.apparmor
[    1.017622] evm: security.ima
[    1.017623] evm: security.capability
[    1.017624] evm: HMAC attrs: 0x1
[    1.018570] PM:   Magic number: 0:913:631
[    1.019975] Freeing unused decrypted memory: 2040K
[    1.020389] Freeing unused kernel image (initmem) memory: 2588K
[    1.020450] Write protecting the kernel read-only data: 22528k
[    1.020945] Freeing unused kernel image (text/rodata gap) memory: 2044K
[    1.021092] Freeing unused kernel image (rodata/data gap) memory: 1152K
[    1.047708] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.047710] x86/mm: Checking user space page tables
[    1.073881] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.073883] Run /init as init process
[    1.073885]   with arguments:
[    1.073885]     /init
[    1.073886]   with environment:
[    1.073886]     HOME=/
[    1.073886]     TERM=linux
[    1.073887]     BOOT_IMAGE=/boot/vmlinuz-5.7-rc3
[    1.073887]     intel_iommu=on
[    1.173475] usb 1-5: New USB device found, idVendor=0bda, idProduct=58f4, bcdDevice=76.05
[    1.173479] usb 1-5: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[    1.173482] usb 1-5: Product: Integrated_Webcam_HD
[    1.173484] usb 1-5: Manufacturer: CN0FFMHCLOG0081JB3LKA00
[    1.173485] usb 1-5: SerialNumber: 200901010001
[    1.305337] usb 1-7: new full-speed USB device number 3 using xhci_hcd
[    1.456100] usb 1-7: New USB device found, idVendor=8087, idProduct=0a2b, bcdDevice= 0.10
[    1.456104] usb 1-7: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    1.525276] tsc: Refined TSC clocksource calibration: 2111.989 MHz
[    1.525283] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x1e716e2fc7b, max_idle_ns: 440795302106 ns
[    1.525702] clocksource: Switched to clocksource tsc
[    1.585273] usb 1-10: new full-speed USB device number 4 using xhci_hcd
[    1.687734] rtsx_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    1.694365] nvme nvme0: pci function 0000:6d:00.0
[    1.703321] nvme nvme0: 8/0/0 default/read/poll queues
[    1.705658]  nvme0n1: p1 p2 p3 p4 p5 p6 p7
[    1.735039] usb 1-10: New USB device found, idVendor=27c6, idProduct=5385, bcdDevice= 1.00
[    1.735043] usb 1-10: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    1.735045] usb 1-10: Product: Goodix Fingerprint Device 
[    1.735047] usb 1-10: Manufacturer: HTMicroelectronics
[    1.735048] usb 1-10: SerialNumber: HTK32
[    1.775497] EXT4-fs (nvme0n1p6): mounted filesystem with ordered data mode. Opts: (null)
[    1.860970] systemd[1]: Inserted module 'autofs4'
[    1.881505] systemd[1]: systemd 245.5-2-arch running in system mode. (+PAM +AUDIT -SELINUX -IMA -APPARMOR +SMACK -SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid)
[    1.901664] systemd[1]: Detected architecture x86-64.
[    1.926836] systemd[1]: Set hostname to <nicholas-dell-linux>.
[    2.064394] systemd[1]: Created slice system-getty.slice.
[    2.064556] systemd[1]: Created slice system-modprobe.slice.
[    2.064688] systemd[1]: Created slice system-ppp.slice.
[    2.064866] systemd[1]: Created slice User and Session Slice.
[    2.064921] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[    2.064975] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[    2.065093] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[    2.065123] systemd[1]: Reached target Local Encrypted Volumes.
[    2.065145] systemd[1]: Reached target Login Prompts.
[    2.065172] systemd[1]: Reached target Paths.
[    2.065193] systemd[1]: Reached target Remote File Systems.
[    2.065214] systemd[1]: Reached target Slices.
[    2.065242] systemd[1]: Reached target Swap.
[    2.065342] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    2.065588] systemd[1]: Listening on LVM2 metadata daemon socket.
[    2.065757] systemd[1]: Listening on LVM2 poll daemon socket.
[    2.066669] systemd[1]: Listening on Process Core Dump Socket.
[    2.066721] systemd[1]: Listening on initctl Compatibility Named Pipe.
[    2.068858] systemd[1]: Condition check resulted in Journal Audit Socket being skipped.
[    2.068937] systemd[1]: Listening on Journal Socket (/dev/log).
[    2.069017] systemd[1]: Listening on Journal Socket.
[    2.069085] systemd[1]: Listening on udev Control Socket.
[    2.069139] systemd[1]: Listening on udev Kernel Socket.
[    2.069725] systemd[1]: Mounting Huge Pages File System...
[    2.070316] systemd[1]: Mounting POSIX Message Queue File System...
[    2.071009] systemd[1]: Mounting Kernel Debug File System...
[    2.071750] systemd[1]: Mounting Kernel Trace File System...
[    2.072970] systemd[1]: Mounting Temporary Directory (/tmp)...
[    2.073792] systemd[1]: Starting Create list of static device nodes for the current kernel...
[    2.074446] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
[    2.075151] systemd[1]: Starting Load Kernel Module drm...
[    2.078493] systemd[1]: Condition check resulted in Set Up Additional Binary Formats being skipped.
[    2.078539] systemd[1]: Condition check resulted in File System Check on Root Device being skipped.
[    2.079962] systemd[1]: Starting Journal Service...
[    2.081113] systemd[1]: Starting Load Kernel Modules...
[    2.081844] systemd[1]: Starting Remount Root and Kernel File Systems...
[    2.082823] systemd[1]: Starting udev Coldplug all Devices...
[    2.084605] systemd[1]: Mounted Huge Pages File System.
[    2.084828] systemd[1]: Mounted POSIX Message Queue File System.
[    2.085032] systemd[1]: Mounted Kernel Debug File System.
[    2.085208] systemd[1]: Mounted Kernel Trace File System.
[    2.085406] systemd[1]: Mounted Temporary Directory (/tmp).
[    2.086090] systemd[1]: Finished Create list of static device nodes for the current kernel.
[    2.089528] systemd[1]: modprobe@drm.service: Succeeded.
[    2.091595] systemd[1]: Finished Load Kernel Module drm.
[    2.095460] systemd[1]: Started LVM2 metadata daemon.
[    2.096095] EXT4-fs (nvme0n1p6): re-mounted. Opts: data=ordered
[    2.097457] systemd[1]: Finished Remount Root and Kernel File Systems.
[    2.097623] systemd[1]: Condition check resulted in First Boot Wizard being skipped.
[    2.099227] systemd[1]: Condition check resulted in Rebuild Hardware Database being skipped.
[    2.100001] systemd[1]: Starting Load/Save Random Seed...
[    2.100094] systemd[1]: Condition check resulted in Create System Users being skipped.
[    2.101037] systemd[1]: Starting Create Static Device Nodes in /dev...
[    2.101766] systemd[1]: Finished Load Kernel Modules.
[    2.103093] systemd[1]: Mounting FUSE Control File System...
[    2.104203] systemd[1]: Mounting Kernel Configuration File System...
[    2.105481] systemd[1]: Starting Apply Kernel Variables...
[    2.106516] systemd[1]: Mounted FUSE Control File System.
[    2.108605] systemd[1]: Mounted Kernel Configuration File System.
[    2.116087] systemd[1]: Finished Load/Save Random Seed.
[    2.123626] systemd[1]: Finished Apply Kernel Variables.
[    2.124615] systemd[1]: Finished Create Static Device Nodes in /dev.
[    2.125461] systemd[1]: Starting udev Kernel Device Manager...
[    2.171387] systemd[1]: Finished udev Coldplug all Devices.
[    2.405093] systemd[1]: Started Journal Service.
[    2.413118] systemd-journald[299]: Received client request to flush runtime journal.
[    2.531059] input: Intel HID events as /devices/platform/INT33D5:00/input/input6
[    2.531984] intel-hid INT33D5:00: platform supports 5 button array
[    2.532058] input: Intel HID 5 button array as /devices/platform/INT33D5:00/input/input7
[    2.547865] hid: raw HID events driver (C) Jiri Kosina
[    2.553163] wmi_bus wmi_bus-PNP0C14:01: WQBC data block query control method not found
[    2.562035] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
[    2.563572] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[    2.575051] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[    2.576152] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    2.596976] intel_rapl_common: Found RAPL domain package
[    2.596982] intel_rapl_common: Found RAPL domain dram
[    2.597915] proc_thermal 0000:00:04.0: Creating sysfs group for PROC_THERMAL_PCI
[    2.603443] thunderbolt 0000:05:00.0: enabling device (0000 -> 0002)
[    2.618219] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    2.627149] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    2.627184] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    2.655170] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    2.657487] platform regulatory.0: Direct firmware load for regulatory.db failed with error -2
[    2.657494] cfg80211: failed to load regulatory.db
[    2.668116] pstore: Using crash dump compression: deflate
[    2.668160] input: PC Speaker as /devices/platform/pcspkr/input/input8
[    2.697175] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
[    2.697183] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    2.697186] RAPL PMU: hw unit of domain package 2^-14 Joules
[    2.697188] RAPL PMU: hw unit of domain dram 2^-14 Joules
[    2.697191] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    2.697552] RAPL PMU: hw unit of domain psys 2^-14 Joules
[    2.734342] Intel(R) Wireless WiFi driver for Linux
[    2.734346] Copyright(c) 2003- 2015 Intel Corporation
[    2.734962] iwlwifi 0000:02:00.0: enabling device (0000 -> 0002)
[    2.756305] Error: Driver 'pcspkr' is already registered, aborting...
[    2.763716] cryptd: max_cpu_qlen set to 1000
[    2.767496] iwlwifi 0000:02:00.0: Found debug destination: EXTERNAL_DRAM
[    2.767503] iwlwifi 0000:02:00.0: Found debug configuration: 0
[    2.768123] iwlwifi 0000:02:00.0: loaded firmware version 36.77d01142.0 8265-36.ucode op_mode iwlmvm
[    2.768166] iwlwifi 0000:02:00.0: Direct firmware load for iwl-debug-yoyo.bin failed with error -2
[    2.779418] AVX2 version of gcm_enc/dec engaged.
[    2.779423] AES CTR mode by8 optimization enabled
[    2.888783] iwlwifi 0000:02:00.0: Detected Intel(R) Dual Band Wireless AC 8265, REV=0x230
[    2.904419] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    2.905867] iwlwifi 0000:02:00.0: Allocated 0x00400000 bytes for firmware monitor.
[    2.940353] i915 0000:00:02.0: VT-d active for gfx access
[    2.940362] checking generic (50000000 300000) vs hw (db000000 1000000)
[    2.940363] checking generic (50000000 300000) vs hw (50000000 10000000)
[    2.940364] fb0: switching to inteldrmfb from EFI VGA
[    2.963307] iwlwifi 0000:02:00.0: base HW address: b4:d5:bd:9e:43:f5
[    2.965970] dcdbas dcdbas: Dell Systems Management Base Driver (version 5.6.0-3.3)
[    2.969735] pstore: Registered efi as persistent store backend
[    2.971490] intel_rapl_common: Found RAPL domain package
[    2.971495] intel_rapl_common: Found RAPL domain core
[    2.971498] intel_rapl_common: Found RAPL domain uncore
[    2.971501] intel_rapl_common: Found RAPL domain dram
[    3.213360] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.213531] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[    3.216288] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)
[    3.221008] i915 0000:00:02.0: [drm:intel_dp_aux_init_backlight_funcs [i915]] Panel advertises DPCD backlight support, but VBT disagrees. If your backlight controls don't work try booting with i915.enable_dpcd_backlight=1. If your machine needs this, please file a _new_ bug report on drm/i915, see https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs for details.
[    3.229314] ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-rs'
[    3.229717] thermal thermal_zone10: failed to read out thermal zone (-61)
[    3.237529] [drm] Initialized i915 1.6.0 20200313 for 0000:00:02.0 on minor 0
[    3.255253] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[    3.255943] input: Dell WMI hotkeys as /devices/platform/PNP0C14:01/wmi_bus/wmi_bus-PNP0C14:01/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input10
[    3.265516] iwlwifi 0000:02:00.0 wlp2s0: renamed from wlan0
[    3.279645] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    3.408455] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input11
[    3.417190] i915 0000:00:02.0: fb0: i915drmfb frame buffer device
[    3.422858] i2c_hid i2c-ELAN24F0:00: supply vdd not found, using dummy regulator
[    3.425075] i2c_hid i2c-ELAN24F0:00: supply vddl not found, using dummy regulator
[    3.502639] psmouse serio1: synaptics: queried max coordinates: x [..5666], y [..4734]
[    3.532963] psmouse serio1: synaptics: queried min coordinates: x [1276..], y [1118..]
[    3.532971] psmouse serio1: synaptics: Your touchpad (PNP: DLL07e6 PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.
[    3.594128] psmouse serio1: synaptics: Touchpad model: 1, fw: 8.2, id: 0x1e2a1, caps: 0xf00323/0x840300/0x12e800/0x0, board id: 3038, fw id: 2375007
[    3.631549] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
[    3.631936] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    3.645492] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input9
[    3.763780] i2c_hid i2c-DELL07E6:00: supply vdd not found, using dummy regulator
[    3.763800] i2c_hid i2c-DELL07E6:00: supply vddl not found, using dummy regulator
[    3.822838] input: ELAN24F0:00 04F3:24F0 Touchscreen as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input12
[    3.822948] input: ELAN24F0:00 04F3:24F0 as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input13
[    3.823006] input: ELAN24F0:00 04F3:24F0 as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input14
[    3.823065] hid-generic 0018:04F3:24F0.0001: input,hidraw0: I2C HID v1.00 Device [ELAN24F0:00 04F3:24F0] on i2c-ELAN24F0:00
[    3.823427] input: DELL07E6:00 06CB:76AF Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input16
[    3.823517] input: DELL07E6:00 06CB:76AF Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input17
[    3.823597] hid-generic 0018:06CB:76AF.0002: input,hidraw1: I2C HID v1.00 Mouse [DELL07E6:00 06CB:76AF] on i2c-DELL07E6:00
[    3.916807] mc: Linux media interface: v0.10
[    3.916809] Bluetooth: Core ver 2.22
[    3.916837] NET: Registered protocol family 31
[    3.916840] Bluetooth: HCI device and connection manager initialized
[    3.916846] Bluetooth: HCI socket layer initialized
[    3.916850] Bluetooth: L2CAP socket layer initialized
[    3.916858] Bluetooth: SCO socket layer initialized
[    3.926046] videodev: Linux video capture interface: v2.00
[    3.931712] thunderbolt 0-1: new device found, vendor=0x2 device=0x31
[    3.931718] thunderbolt 0-1: Promise Technology, Inc. SANLink3 N1
[    3.933511] input: ELAN24F0:00 04F3:24F0 as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input19
[    3.933599] input: ELAN24F0:00 04F3:24F0 UNKNOWN as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input20
[    3.933643] input: ELAN24F0:00 04F3:24F0 UNKNOWN as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24F0:00/0018:04F3:24F0.0001/input/input21
[    3.933692] hid-multitouch 0018:04F3:24F0.0001: input,hidraw0: I2C HID v1.00 Device [ELAN24F0:00 04F3:24F0] on i2c-ELAN24F0:00
[    4.053456] cdc_acm 1-10:1.0: ttyACM0: USB ACM device
[    4.053591] usbcore: registered new interface driver btusb
[    4.054602] usbcore: registered new interface driver cdc_acm
[    4.054605] Bluetooth: hci0: Firmware revision 0.1 build 65 week 42 2019
[    4.054608] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
[    4.062594] input: DELL07E6:00 06CB:76AF Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input23
[    4.062700] input: DELL07E6:00 06CB:76AF Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input24
[    4.062822] hid-multitouch 0018:06CB:76AF.0002: input,hidraw1: I2C HID v1.00 Mouse [DELL07E6:00 06CB:76AF] on i2c-DELL07E6:00
[    4.074509] uvcvideo: Found UVC 1.00 device Integrated_Webcam_HD (0bda:58f4)
[    4.083560] uvcvideo 1-5:1.0: Entity type for entity Extension 4 was not initialized!
[    4.083567] uvcvideo 1-5:1.0: Entity type for entity Extension 7 was not initialized!
[    4.083571] uvcvideo 1-5:1.0: Entity type for entity Processing 2 was not initialized!
[    4.083575] uvcvideo 1-5:1.0: Entity type for entity Camera 1 was not initialized!
[    4.083659] input: Integrated_Webcam_HD: Integrate as /devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.0/input/input26
[    4.084258] uvcvideo: Found UVC 1.00 device Integrated_Webcam_HD (0bda:58f4)
[    4.085921] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    4.085924] Bluetooth: BNEP filters: protocol multicast
[    4.085928] Bluetooth: BNEP socket layer initialized
[    4.086282] uvcvideo 1-5:1.2: Entity type for entity Extension 10 was not initialized!
[    4.086288] uvcvideo 1-5:1.2: Entity type for entity Extension 12 was not initialized!
[    4.086291] uvcvideo 1-5:1.2: Entity type for entity Processing 9 was not initialized!
[    4.086294] uvcvideo 1-5:1.2: Entity type for entity Camera 11 was not initialized!
[    4.086359] input: Integrated_Webcam_HD: Integrate as /devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.2/input/input27
[    4.086431] usbcore: registered new interface driver uvcvideo
[    4.086433] USB Video Class driver (1.1.1)
[    4.109748] NET: Registered protocol family 38
[    4.181413] pcieport 0000:04:01.0: pciehp: Slot(1): Card present
[    4.181419] pcieport 0000:04:01.0: pciehp: Slot(1): Link Up
[    4.243164] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    4.317786] pci 0000:06:00.0: [8086:15da] type 01 class 0x060400
[    4.317931] pci 0000:06:00.0: enabling Extended Tags
[    4.318848] pci 0000:06:00.0: supports D1 D2
[    4.318851] pci 0000:06:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    4.319020] pci 0000:06:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:04:01.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
[    4.319111] pci 0000:06:00.0: Adding to iommu group 15
[    4.319204] pcieport 0000:04:01.0: ASPM: current common clock configuration is inconsistent, reconfiguring
[    4.329928] pci 0000:06:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[    4.330934] pci 0000:07:01.0: [8086:15da] type 01 class 0x060400
[    4.331415] pci 0000:07:01.0: enabling Extended Tags
[    4.332271] pci 0000:07:01.0: supports D1 D2
[    4.332276] pci 0000:07:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[    4.332519] pci 0000:07:01.0: Adding to iommu group 15
[    4.332626] pci 0000:06:00.0: PCI bridge to [bus 07-38]
[    4.332672] pci 0000:06:00.0:   bridge window [io  0x0000-0x0fff]
[    4.332681] pci 0000:06:00.0:   bridge window [mem 0x00000000-0x000fffff]
[    4.332694] pci 0000:06:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[    4.332702] pci 0000:07:01.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[    4.333085] pci 0000:08:00.0: [1d6a:87b1] type 00 class 0x020000
[    4.333418] pci 0000:08:00.0: reg 0x10: [mem 0x00000000-0x0000ffff 64bit]
[    4.333450] pci 0000:08:00.0: reg 0x18: [mem 0x00000000-0x00000fff 64bit]
[    4.333479] pci 0000:08:00.0: reg 0x20: [mem 0x00000000-0x003fffff 64bit]
[    4.333499] pci 0000:08:00.0: reg 0x30: [mem 0x00000000-0x0003ffff pref]
[    4.333519] pci 0000:08:00.0: enabling Extended Tags
[    4.334515] pci 0000:08:00.0: supports D1 D2
[    4.334520] pci 0000:08:00.0: PME# supported from D0 D1 D2 D3hot
[    4.334654] pci 0000:08:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:04:01.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
[    4.334733] pci 0000:08:00.0: Adding to iommu group 15
[    4.334869] pci 0000:07:01.0: PCI bridge to [bus 08-38]
[    4.334883] pci 0000:07:01.0:   bridge window [io  0x0000-0x0fff]
[    4.334892] pci 0000:07:01.0:   bridge window [mem 0x00000000-0x000fffff]
[    4.334906] pci 0000:07:01.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[    4.334911] pci_bus 0000:08: busn_res: [bus 08-38] end is updated to 08
[    4.334921] pci_bus 0000:07: busn_res: [bus 07-38] end is updated to 08
[    4.334937] pcieport 0000:04:01.0: BAR 13: no space for [io  size 0x1000]
[    4.334941] pcieport 0000:04:01.0: BAR 13: failed to assign [io  size 0x1000]
[    4.334947] pci 0000:06:00.0: BAR 14: assigned [mem 0x60200000-0x790fffff]
[    4.334951] pci 0000:06:00.0: BAR 15: assigned [mem 0x4b0000000-0x14afffffff 64bit pref]
[    4.334956] pci 0000:06:00.0: BAR 13: no space for [io  size 0x1000]
[    4.334959] pci 0000:06:00.0: BAR 13: failed to assign [io  size 0x1000]
[    4.334964] pci 0000:07:01.0: BAR 14: assigned [mem 0x60200000-0x790fffff]
[    4.334968] pci 0000:07:01.0: BAR 15: assigned [mem 0x4b0000000-0x14afffffff 64bit pref]
[    4.334973] pci 0000:07:01.0: BAR 13: no space for [io  size 0x1000]
[    4.334976] pci 0000:07:01.0: BAR 13: failed to assign [io  size 0x1000]
[    4.334982] pci 0000:08:00.0: BAR 4: assigned [mem 0x60400000-0x607fffff 64bit]
[    4.335008] pci 0000:08:00.0: BAR 6: assigned [mem 0x60200000-0x6023ffff pref]
[    4.335013] pci 0000:08:00.0: BAR 0: assigned [mem 0x60240000-0x6024ffff 64bit]
[    4.335039] pci 0000:08:00.0: BAR 2: assigned [mem 0x60250000-0x60250fff 64bit]
[    4.335067] pci 0000:07:01.0: PCI bridge to [bus 08]
[    4.335078] pci 0000:07:01.0:   bridge window [mem 0x60200000-0x790fffff]
[    4.335086] pci 0000:07:01.0:   bridge window [mem 0x4b0000000-0x14afffffff 64bit pref]
[    4.335099] pci 0000:06:00.0: PCI bridge to [bus 07-08]
[    4.335109] pci 0000:06:00.0:   bridge window [mem 0x60200000-0x790fffff]
[    4.335118] pci 0000:06:00.0:   bridge window [mem 0x4b0000000-0x14afffffff 64bit pref]
[    4.335131] pcieport 0000:04:01.0: PCI bridge to [bus 06-38]
[    4.335138] pcieport 0000:04:01.0:   bridge window [mem 0x60100000-0x790fffff]
[    4.335145] pcieport 0000:04:01.0:   bridge window [mem 0x4b0000000-0x14afffffff 64bit pref]
[    4.335154] PCI: No. 2 try to assign unassigned res
[    4.335160] pcieport 0000:04:01.0: BAR 13: no space for [io  size 0x1000]
[    4.335164] pcieport 0000:04:01.0: BAR 13: failed to assign [io  size 0x1000]
[    4.335169] pci 0000:06:00.0: BAR 13: no space for [io  size 0x1000]
[    4.335173] pci 0000:06:00.0: BAR 13: failed to assign [io  size 0x1000]
[    4.335177] pci 0000:07:01.0: BAR 13: no space for [io  size 0x1000]
[    4.335181] pci 0000:07:01.0: BAR 13: failed to assign [io  size 0x1000]
[    4.335184] pci 0000:07:01.0: PCI bridge to [bus 08]
[    4.335200] pci 0000:07:01.0:   bridge window [mem 0x60200000-0x790fffff]
[    4.335212] pci 0000:07:01.0:   bridge window [mem 0x4b0000000-0x14afffffff 64bit pref]
[    4.335226] pci 0000:06:00.0: PCI bridge to [bus 07-08]
[    4.335237] pci 0000:06:00.0:   bridge window [mem 0x60200000-0x790fffff]
[    4.335245] pci 0000:06:00.0:   bridge window [mem 0x4b0000000-0x14afffffff 64bit pref]
[    4.335496] pcieport 0000:04:01.0: PCI bridge to [bus 06-38]
[    4.335502] pcieport 0000:04:01.0:   bridge window [mem 0x60100000-0x790fffff]
[    4.335506] pcieport 0000:04:01.0:   bridge window [mem 0x4b0000000-0x14afffffff 64bit pref]
[    4.335791] pcieport 0000:06:00.0: enabling device (0000 -> 0002)
[    4.337136] pcieport 0000:07:01.0: enabling device (0000 -> 0002)
[    4.343656] MACsec IEEE 802.1AE
[    4.383488] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    4.451615] iwlwifi 0000:02:00.0: FW already configured (0) - re-configuring
[    4.480406] atlantic 0000:08:00.0: enabling device (0000 -> 0002)
[    4.499683] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    4.634048] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[    4.701734] iwlwifi 0000:02:00.0: FW already configured (0) - re-configuring
[    4.871970] atlantic 0000:08:00.0 ens1: renamed from eth0
[    5.351872] Bluetooth: RFCOMM TTY layer initialized
[    5.351879] Bluetooth: RFCOMM socket layer initialized
[    5.351884] Bluetooth: RFCOMM ver 1.11
[    6.611822] rfkill: input handler disabled
[   10.088837] rfkill: input handler enabled
[   11.298441] wlp2s0: authenticate with 78:8a:20:8e:ee:6a
[   11.308335] wlp2s0: send auth to 78:8a:20:8e:ee:6a (try 1/3)
[   11.315331] wlp2s0: authenticated
[   11.317251] wlp2s0: associate with 78:8a:20:8e:ee:6a (try 1/3)
[   11.320818] wlp2s0: RX AssocResp from 78:8a:20:8e:ee:6a (capab=0x1411 status=0 aid=4)
[   11.323305] wlp2s0: associated
[   11.353911] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
[  109.796314] pcieport 0000:04:01.0: pciehp: Slot(1): Link Down
[  109.796317] pcieport 0000:04:01.0: pciehp: Slot(1): Card not present
[  109.947078] pcieport 0000:07:01.0: can't change power state from D0 to D3hot (config space inaccessible)
[  109.947087] pcieport 0000:07:01.0: can't change power state from D3cold to D0 (config space inaccessible)
[  109.947265] pci 0000:08:00.0: Removing from iommu group 15
[  109.947281] pci_bus 0000:08: busn_res: [bus 08] is released
[  109.947338] pci 0000:07:01.0: Removing from iommu group 15
[  109.947347] pci_bus 0000:07: busn_res: [bus 07-08] is released
[  109.947420] pci 0000:06:00.0: Removing from iommu group 15
[  110.326717] thunderbolt 0-1: device disconnected
[  119.821273] pcieport 0000:00:1c.4: AER: Corrected error received: 0000:00:1c.4
[  119.821278] pcieport 0000:00:1c.4: AER: PCIe Bus Error: severity=Corrected, type=Physical Layer, (Receiver ID)
[  119.821279] pcieport 0000:00:1c.4: AER:   device [8086:9d14] error status/mask=00000001/00002000
[  119.821280] pcieport 0000:00:1c.4: AER:    [ 0] RxErr                 
[  119.870392] pcieport 0000:00:1c.4: pciehp: Slot(8): Link Down
[  119.870396] pcieport 0000:00:1c.4: pciehp: Slot(8): Card not present
[  119.870403] pcieport 0000:04:04.0: can't change power state from D3cold to D0 (config space inaccessible)
[  119.870816] pcieport 0000:04:02.0: can't change power state from D3cold to D0 (config space inaccessible)
[  119.870823] xhci_hcd 0000:39:00.0: can't change power state from D3cold to D0 (config space inaccessible)
[  119.870827] xhci_hcd 0000:39:00.0: can't change power state from D3hot to D0 (config space inaccessible)
[  119.870848] xhci_hcd 0000:39:00.0: Controller not ready at resume -19
[  119.870849] xhci_hcd 0000:39:00.0: PCI post-resume error -19!
[  119.870850] xhci_hcd 0000:39:00.0: HC died; cleaning up
[  119.870860] xhci_hcd 0000:39:00.0: remove, state 4
[  119.870862] usb usb4: USB disconnect, device number 1
[  119.871077] xhci_hcd 0000:39:00.0: USB bus 4 deregistered
[  119.871081] xhci_hcd 0000:39:00.0: remove, state 4
[  119.871083] usb usb3: USB disconnect, device number 1
[  119.871177] xhci_hcd 0000:39:00.0: Host halt failed, -19
[  119.871179] xhci_hcd 0000:39:00.0: Host not accessible, reset failed.
[  119.871278] xhci_hcd 0000:39:00.0: USB bus 3 deregistered
[  119.871381] pcieport 0000:04:01.0: can't change power state from D3cold to D0 (config space inaccessible)
[  120.372175] pci 0000:05:00.0: Removing from iommu group 14
[  120.372198] pci_bus 0000:05: busn_res: [bus 05] is released
[  120.372279] pci 0000:04:00.0: Removing from iommu group 14
[  120.372315] pci_bus 0000:06: busn_res: [bus 06-38] is released
[  120.372384] pci 0000:04:01.0: Removing from iommu group 15
[  120.374065] pci 0000:39:00.0: Removing from iommu group 16
[  120.374080] pci_bus 0000:39: busn_res: [bus 39] is released
[  120.374163] pci 0000:04:02.0: Removing from iommu group 16
[  120.374350] pci_bus 0000:3a: busn_res: [bus 3a-6c] is released
[  120.374404] pci 0000:04:04.0: Removing from iommu group 17
[  120.374433] pci_bus 0000:04: busn_res: [bus 04-6c] is released
[  120.389636] pci 0000:03:00.0: Removing from iommu group 13
[  137.764256] pcieport 0000:00:1c.4: pciehp: Slot(8): Card present
[  139.741914] pci 0000:03:00.0: [8086:15d3] type 01 class 0x060400
[  139.799381] pci 0000:03:00.0: enabling Extended Tags
[  139.799564] pci 0000:03:00.0: supports D1 D2
[  139.799565] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[  139.799838] pci 0000:03:00.0: Adding to iommu group 13
[  139.799873] pci 0000:03:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[  139.800036] pci 0000:04:00.0: [8086:15d3] type 01 class 0x060400
[  139.800090] pci 0000:04:00.0: enabling Extended Tags
[  139.800174] pci 0000:04:00.0: supports D1 D2
[  139.800175] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[  139.800348] pci 0000:04:00.0: Adding to iommu group 14
[  139.800372] pci 0000:04:01.0: [8086:15d3] type 01 class 0x060400
[  139.800427] pci 0000:04:01.0: enabling Extended Tags
[  139.800511] pci 0000:04:01.0: supports D1 D2
[  139.800512] pci 0000:04:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[  139.800671] pci 0000:04:01.0: Adding to iommu group 15
[  139.800698] pci 0000:04:02.0: [8086:15d3] type 01 class 0x060400
[  139.800753] pci 0000:04:02.0: enabling Extended Tags
[  139.800841] pci 0000:04:02.0: supports D1 D2
[  139.800842] pci 0000:04:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[  139.801093] pci 0000:04:02.0: Adding to iommu group 16
[  139.801128] pci 0000:04:04.0: [8086:15d3] type 01 class 0x060400
[  139.801186] pci 0000:04:04.0: enabling Extended Tags
[  139.801294] pci 0000:04:04.0: supports D1 D2
[  139.801295] pci 0000:04:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[  139.801581] pci 0000:04:04.0: Adding to iommu group 17
[  139.801638] pci 0000:03:00.0: PCI bridge to [bus 04-6c]
[  139.801645] pci 0000:03:00.0:   bridge window [io  0x0000-0x0fff]
[  139.801648] pci 0000:03:00.0:   bridge window [mem 0x00000000-0x000fffff]
[  139.801653] pci 0000:03:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[  139.801656] pci 0000:04:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[  139.801662] pci 0000:04:01.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[  139.801740] pci 0000:04:02.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[  139.801746] pci 0000:04:04.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[  139.801811] pci 0000:05:00.0: [8086:15d2] type 00 class 0x088000
[  139.801839] pci 0000:05:00.0: reg 0x10: [mem 0x00000000-0x0003ffff]
[  139.801866] pci 0000:05:00.0: reg 0x14: [mem 0x00000000-0x00000fff]
[  139.801909] pci 0000:05:00.0: enabling Extended Tags
[  139.802008] pci 0000:05:00.0: supports D1 D2
[  139.802009] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[  139.802135] pci 0000:05:00.0: Adding to iommu group 14
[  139.802196] pci 0000:04:00.0: PCI bridge to [bus 05-6c]
[  139.802201] pci 0000:04:00.0:   bridge window [io  0x0000-0x0fff]
[  139.802204] pci 0000:04:00.0:   bridge window [mem 0x00000000-0x000fffff]
[  139.802209] pci 0000:04:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[  139.802211] pci_bus 0000:05: busn_res: [bus 05-6c] end is updated to 05
[  139.802260] pci 0000:04:01.0: PCI bridge to [bus 06-6c]
[  139.802265] pci 0000:04:01.0:   bridge window [io  0x0000-0x0fff]
[  139.802268] pci 0000:04:01.0:   bridge window [mem 0x00000000-0x000fffff]
[  139.802273] pci 0000:04:01.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[  139.802274] pci_bus 0000:06: busn_res: [bus 06-6c] end is updated to 39
[  139.802344] pci 0000:3a:00.0: [8086:15d4] type 00 class 0x0c0330
[  139.802375] pci 0000:3a:00.0: reg 0x10: [mem 0x00000000-0x0000ffff]
[  139.802527] pci 0000:3a:00.0: supports D1 D2
[  139.802528] pci 0000:3a:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[  139.802627] pci 0000:3a:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:04:02.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
[  139.802705] pci 0000:3a:00.0: Adding to iommu group 16
[  139.802770] pci 0000:04:02.0: PCI bridge to [bus 3a-6c]
[  139.802775] pci 0000:04:02.0:   bridge window [io  0x0000-0x0fff]
[  139.802778] pci 0000:04:02.0:   bridge window [mem 0x00000000-0x000fffff]
[  139.802783] pci 0000:04:02.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[  139.802785] pci_bus 0000:3a: busn_res: [bus 3a-6c] end is updated to 3a
[  139.802831] pci 0000:04:04.0: PCI bridge to [bus 3b-6c]
[  139.802836] pci 0000:04:04.0:   bridge window [io  0x0000-0x0fff]
[  139.802839] pci 0000:04:04.0:   bridge window [mem 0x00000000-0x000fffff]
[  139.802844] pci 0000:04:04.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[  139.802845] pci_bus 0000:3b: busn_res: [bus 3b-6c] end is updated to 6c
[  139.802849] pci_bus 0000:04: busn_res: [bus 04-6c] end is updated to 6c
[  139.802854] pci 0000:04:01.0: bridge window [mem 0x00100000-0x001fffff 64bit pref] to [bus 06-39] add_size ffff00000 add_align 100000
[  139.802855] pci 0000:04:01.0: bridge window [mem 0x00100000-0x001fffff] to [bus 06-39] add_size 18f00000 add_align 100000
[  139.802857] pci 0000:04:04.0: bridge window [mem 0x00100000-0x001fffff 64bit pref] to [bus 3b-6c] add_size ffff00000 add_align 100000
[  139.802858] pci 0000:04:04.0: bridge window [mem 0x00100000-0x001fffff] to [bus 3b-6c] add_size 18f00000 add_align 100000
[  139.802860] pci 0000:03:00.0: bridge window [mem 0x00100000-0x004fffff 64bit pref] to [bus 04-6c] add_size 1fffe00000 add_align 100000
[  139.802861] pci 0000:03:00.0: bridge window [mem 0x00100000-0x004fffff] to [bus 04-6c] add_size 31e00000 add_align 100000
[  139.802868] pcieport 0000:00:1c.4: BAR 13: assigned [io  0x2000-0x5fff]
[  139.802870] pci 0000:03:00.0: BAR 14: assigned [mem 0x60000000-0x921fffff]
[  139.802871] pci 0000:03:00.0: BAR 15: assigned [mem 0x4b0000000-0x24afffffff 64bit pref]
[  139.802872] pci 0000:03:00.0: BAR 13: assigned [io  0x2000-0x5fff]
[  139.802874] pci 0000:04:00.0: BAR 14: assigned [mem 0x60000000-0x600fffff]
[  139.802875] pci 0000:04:00.0: BAR 15: assigned [mem 0x4b0000000-0x4b00fffff 64bit pref]
[  139.802876] pci 0000:04:01.0: BAR 14: assigned [mem 0x60100000-0x790fffff]
[  139.802877] pci 0000:04:01.0: BAR 15: assigned [mem 0x4b0100000-0x14afffffff 64bit pref]
[  139.802878] pci 0000:04:02.0: BAR 14: assigned [mem 0x79100000-0x791fffff]
[  139.802879] pci 0000:04:02.0: BAR 15: assigned [mem 0x14b0000000-0x14b00fffff 64bit pref]
[  139.802880] pci 0000:04:04.0: BAR 14: assigned [mem 0x79200000-0x921fffff]
[  139.802881] pci 0000:04:04.0: BAR 15: assigned [mem 0x14b0100000-0x24afffffff 64bit pref]
[  139.802882] pci 0000:04:00.0: BAR 13: assigned [io  0x2000-0x2fff]
[  139.802883] pci 0000:04:01.0: BAR 13: assigned [io  0x3000-0x3fff]
[  139.802884] pci 0000:04:02.0: BAR 13: assigned [io  0x4000-0x4fff]
[  139.802885] pci 0000:04:04.0: BAR 13: assigned [io  0x5000-0x5fff]
[  139.802886] pci 0000:05:00.0: BAR 0: assigned [mem 0x60000000-0x6003ffff]
[  139.802890] pci 0000:05:00.0: BAR 1: assigned [mem 0x60040000-0x60040fff]
[  139.802894] pci 0000:04:00.0: PCI bridge to [bus 05]
[  139.802896] pci 0000:04:00.0:   bridge window [io  0x2000-0x2fff]
[  139.802900] pci 0000:04:00.0:   bridge window [mem 0x60000000-0x600fffff]
[  139.802903] pci 0000:04:00.0:   bridge window [mem 0x4b0000000-0x4b00fffff 64bit pref]
[  139.802908] pci 0000:04:01.0: PCI bridge to [bus 06-39]
[  139.802910] pci 0000:04:01.0:   bridge window [io  0x3000-0x3fff]
[  139.802914] pci 0000:04:01.0:   bridge window [mem 0x60100000-0x790fffff]
[  139.802917] pci 0000:04:01.0:   bridge window [mem 0x4b0100000-0x14afffffff 64bit pref]
[  139.802922] pci 0000:3a:00.0: BAR 0: assigned [mem 0x79100000-0x7910ffff]
[  139.802926] pci 0000:04:02.0: PCI bridge to [bus 3a]
[  139.802928] pci 0000:04:02.0:   bridge window [io  0x4000-0x4fff]
[  139.802932] pci 0000:04:02.0:   bridge window [mem 0x79100000-0x791fffff]
[  139.802935] pci 0000:04:02.0:   bridge window [mem 0x14b0000000-0x14b00fffff 64bit pref]
[  139.802940] pci 0000:04:04.0: PCI bridge to [bus 3b-6c]
[  139.802942] pci 0000:04:04.0:   bridge window [io  0x5000-0x5fff]
[  139.802945] pci 0000:04:04.0:   bridge window [mem 0x79200000-0x921fffff]
[  139.802948] pci 0000:04:04.0:   bridge window [mem 0x14b0100000-0x24afffffff 64bit pref]
[  139.802953] pci 0000:03:00.0: PCI bridge to [bus 04-6c]
[  139.802955] pci 0000:03:00.0:   bridge window [io  0x2000-0x5fff]
[  139.802959] pci 0000:03:00.0:   bridge window [mem 0x60000000-0x921fffff]
[  139.802962] pci 0000:03:00.0:   bridge window [mem 0x4b0000000-0x24afffffff 64bit pref]
[  139.802967] pcieport 0000:00:1c.4: PCI bridge to [bus 03-6c]
[  139.802968] pcieport 0000:00:1c.4:   bridge window [io  0x2000-0x5fff]
[  139.802971] pcieport 0000:00:1c.4:   bridge window [mem 0x60000000-0x921fffff]
[  139.802973] pcieport 0000:00:1c.4:   bridge window [mem 0x4b0000000-0x24afffffff 64bit pref]
[  139.803000] pcieport 0000:03:00.0: enabling device (0000 -> 0003)
[  139.803250] pcieport 0000:04:00.0: enabling device (0000 -> 0003)
[  139.803438] pcieport 0000:04:01.0: enabling device (0000 -> 0003)
[  139.803535] pcieport 0000:04:01.0: pciehp: Slot #1 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[  139.803683] pcieport 0000:04:02.0: enabling device (0000 -> 0003)
[  139.803845] pcieport 0000:04:04.0: enabling device (0000 -> 0003)
[  139.803941] pcieport 0000:04:04.0: pciehp: Slot #4 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[  139.804092] thunderbolt 0000:05:00.0: enabling device (0000 -> 0002)
[  140.491883] pci 0000:3a:00.0: enabling device (0000 -> 0002)
[  140.492217] xhci_hcd 0000:3a:00.0: xHCI Host Controller
[  140.492222] xhci_hcd 0000:3a:00.0: new USB bus registered, assigned bus number 3
[  140.493381] xhci_hcd 0000:3a:00.0: hcc params 0x200077c1 hci version 0x110 quirks 0x0000000200009810
[  140.493625] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.07
[  140.493627] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[  140.493628] usb usb3: Product: xHCI Host Controller
[  140.493629] usb usb3: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[  140.493629] usb usb3: SerialNumber: 0000:3a:00.0
[  140.493753] hub 3-0:1.0: USB hub found
[  140.493759] hub 3-0:1.0: 2 ports detected
[  140.494227] xhci_hcd 0000:3a:00.0: xHCI Host Controller
[  140.494230] xhci_hcd 0000:3a:00.0: new USB bus registered, assigned bus number 4
[  140.494233] xhci_hcd 0000:3a:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[  140.494267] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.07
[  140.494268] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[  140.494269] usb usb4: Product: xHCI Host Controller
[  140.494270] usb usb4: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[  140.494270] usb usb4: SerialNumber: 0000:3a:00.0
[  140.494336] hub 4-0:1.0: USB hub found
[  140.494343] hub 4-0:1.0: 2 ports detected
[  140.538171] pci_bus 0000:05: busn_res: [bus 05] end is updated to 05
[  140.538176] pci_bus 0000:05: Allocating resources
[  140.538196] pci_bus 0000:06: busn_res: [bus 06-39] end is updated to 38
[  140.538199] pci_bus 0000:3a: Allocating resources
[  140.826973] thunderbolt 0-1: new device found, vendor=0xed device=0xb009
[  140.826976] thunderbolt 0-1: GIGABYTE GAMING BOX
[  140.898879] pcieport 0000:04:01.0: pciehp: Slot(1): Card present
[  140.898882] pcieport 0000:04:01.0: pciehp: Slot(1): Link Up
[  141.034616] pci 0000:06:00.0: [8086:1578] type 01 class 0x060400
[  141.034729] pci 0000:06:00.0: enabling Extended Tags
[  141.034916] pci 0000:06:00.0: supports D1 D2
[  141.034917] pci 0000:06:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[  141.035078] pci 0000:06:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:04:01.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
[  141.035136] pci 0000:06:00.0: Adding to iommu group 15
[  141.046942] pci 0000:06:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[  141.047100] pci 0000:07:01.0: [8086:1578] type 01 class 0x060400
[  141.047220] pci 0000:07:01.0: enabling Extended Tags
[  141.047414] pci 0000:07:01.0: supports D1 D2
[  141.047414] pci 0000:07:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[  141.047612] pci 0000:07:01.0: Adding to iommu group 15
[  141.047662] pci 0000:07:04.0: [8086:1578] type 01 class 0x060400
[  141.047781] pci 0000:07:04.0: enabling Extended Tags
[  141.047957] pci 0000:07:04.0: supports D1 D2
[  141.047957] pci 0000:07:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[  141.048136] pci 0000:07:04.0: Adding to iommu group 15
[  141.048209] pci 0000:06:00.0: PCI bridge to [bus 07-38]
[  141.048220] pci 0000:06:00.0:   bridge window [io  0x0000-0x0fff]
[  141.048225] pci 0000:06:00.0:   bridge window [mem 0x00000000-0x000fffff]
[  141.048236] pci 0000:06:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[  141.048239] pci 0000:07:01.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[  141.048253] pci 0000:07:04.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[  141.048377] pci 0000:08:00.0: [1002:7300] type 00 class 0x030000
[  141.048459] pci 0000:08:00.0: reg 0x10: [mem 0x00000000-0x0fffffff 64bit pref]
[  141.048486] pci 0000:08:00.0: reg 0x18: [mem 0x00000000-0x001fffff 64bit pref]
[  141.048502] pci 0000:08:00.0: reg 0x20: [io  0x0000-0x00ff]
[  141.048517] pci 0000:08:00.0: reg 0x24: [mem 0x00000000-0x0003ffff]
[  141.048533] pci 0000:08:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
[  141.048550] pci 0000:08:00.0: enabling Extended Tags
[  141.048767] pci 0000:08:00.0: supports D1 D2
[  141.048768] pci 0000:08:00.0: PME# supported from D1 D2 D3hot D3cold
[  141.048980] pci 0000:08:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:04:01.0 (capable of 126.016 Gb/s with 8.0 GT/s PCIe x16 link)
[  141.049021] pci 0000:08:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[  141.049023] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=io+mem
[  141.049041] pci 0000:08:00.0: Adding to iommu group 15
[  141.049077] pci 0000:08:00.1: [1002:aae8] type 00 class 0x040300
[  141.049145] pci 0000:08:00.1: reg 0x10: [mem 0x00000000-0x00003fff 64bit]
[  141.049236] pci 0000:08:00.1: enabling Extended Tags
[  141.049396] pci 0000:08:00.1: supports D1 D2
[  141.049548] pci 0000:08:00.1: Adding to iommu group 15
[  141.049623] pci 0000:07:01.0: PCI bridge to [bus 08-38]
[  141.049634] pci 0000:07:01.0:   bridge window [io  0x0000-0x0fff]
[  141.049639] pci 0000:07:01.0:   bridge window [mem 0x00000000-0x000fffff]
[  141.049650] pci 0000:07:01.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[  141.049651] pci_bus 0000:08: busn_res: [bus 08-38] end is updated to 08
[  141.049768] pci 0000:09:00.0: [8086:15b6] type 00 class 0x0c0330
[  141.049824] pci 0000:09:00.0: reg 0x10: [mem 0x00000000-0x0000ffff]
[  141.050110] pci 0000:09:00.0: supports D1 D2
[  141.050110] pci 0000:09:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[  141.050307] pci 0000:09:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:04:01.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
[  141.050358] pci 0000:09:00.0: Adding to iommu group 15
[  141.050485] pci 0000:07:04.0: PCI bridge to [bus 09-38]
[  141.050496] pci 0000:07:04.0:   bridge window [io  0x0000-0x0fff]
[  141.050501] pci 0000:07:04.0:   bridge window [mem 0x00000000-0x000fffff]
[  141.050512] pci 0000:07:04.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[  141.050513] pci_bus 0000:09: busn_res: [bus 09-38] end is updated to 38
[  141.050519] pci_bus 0000:07: busn_res: [bus 07-38] end is updated to 38
[  141.050527] pci 0000:07:04.0: bridge window [mem 0x00100000-0x001fffff 64bit pref] to [bus 09-38] add_size ffff00000 add_align 100000
[  141.050528] pci 0000:07:04.0: bridge window [mem 0x00100000-0x001fffff] to [bus 09-38] add_size 18f00000 add_align 100000
[  141.050529] pci 0000:06:00.0: bridge window [mem 0x04000000-0x1fffffff 64bit pref] to [bus 07-38] add_size ffc000000 add_align 4000000
[  141.050531] pci 0000:06:00.0: bridge window [mem 0x00100000-0x002fffff] to [bus 07-38] add_size 18f00000 add_align 100000
[  141.050534] pci 0000:06:00.0: BAR 15: assigned [mem 0x4b4000000-0x14afffffff 64bit pref]
[  141.050535] pci 0000:06:00.0: BAR 14: assigned [mem 0x60100000-0x790fffff]
[  141.050536] pci 0000:06:00.0: BAR 13: assigned [io  0x3000-0x3fff]
[  141.050538] pci 0000:07:01.0: BAR 15: assigned [mem 0x4b8000000-0x4cfffffff 64bit pref]
[  141.050539] pci 0000:07:01.0: BAR 14: assigned [mem 0x60100000-0x601fffff]
[  141.050540] pci 0000:07:04.0: BAR 14: assigned [mem 0x60200000-0x790fffff]
[  141.050541] pci 0000:07:04.0: BAR 15: assigned [mem 0x4d0000000-0x14afffffff 64bit pref]
[  141.050541] pci 0000:07:01.0: BAR 13: assigned [io  0x3000-0x3fff]
[  141.050542] pci 0000:07:04.0: BAR 13: no space for [io  size 0x1000]
[  141.050543] pci 0000:07:04.0: BAR 13: failed to assign [io  size 0x1000]
[  141.050545] pci 0000:08:00.0: BAR 0: assigned [mem 0x4c0000000-0x4cfffffff 64bit pref]
[  141.050576] pci 0000:08:00.0: BAR 2: assigned [mem 0x4b8000000-0x4b81fffff 64bit pref]
[  141.050599] pci 0000:08:00.0: BAR 5: assigned [mem 0x60100000-0x6013ffff]
[  141.050632] pci 0000:08:00.0: BAR 6: assigned [mem 0x60140000-0x6015ffff pref]
[  141.050634] pci 0000:08:00.1: BAR 0: assigned [mem 0x60160000-0x60163fff 64bit]
[  141.050656] pci 0000:08:00.0: BAR 4: assigned [io  0x3000-0x30ff]
[  141.050663] pci 0000:07:01.0: PCI bridge to [bus 08]
[  141.050667] pci 0000:07:01.0:   bridge window [io  0x3000-0x3fff]
[  141.050675] pci 0000:07:01.0:   bridge window [mem 0x60100000-0x601fffff]
[  141.050681] pci 0000:07:01.0:   bridge window [mem 0x4b8000000-0x4cfffffff 64bit pref]
[  141.050691] pci 0000:09:00.0: BAR 0: assigned [mem 0x60200000-0x6020ffff]
[  141.050698] pci 0000:07:04.0: PCI bridge to [bus 09-38]
[  141.050706] pci 0000:07:04.0:   bridge window [mem 0x60200000-0x790fffff]
[  141.050712] pci 0000:07:04.0:   bridge window [mem 0x4d0000000-0x14afffffff 64bit pref]
[  141.050722] pci 0000:06:00.0: PCI bridge to [bus 07-38]
[  141.050725] pci 0000:06:00.0:   bridge window [io  0x3000-0x3fff]
[  141.050733] pci 0000:06:00.0:   bridge window [mem 0x60100000-0x790fffff]
[  141.050739] pci 0000:06:00.0:   bridge window [mem 0x4b4000000-0x14afffffff 64bit pref]
[  141.050749] pcieport 0000:04:01.0: PCI bridge to [bus 06-38]
[  141.050751] pcieport 0000:04:01.0:   bridge window [io  0x3000-0x3fff]
[  141.050755] pcieport 0000:04:01.0:   bridge window [mem 0x60100000-0x790fffff]
[  141.050758] pcieport 0000:04:01.0:   bridge window [mem 0x4b0100000-0x14afffffff 64bit pref]
[  141.050763] PCI: No. 2 try to assign unassigned res
[  141.050764] release child resource [io  0x3000-0x30ff]
[  141.050765] pci 0000:07:01.0: resource 13 [io  0x3000-0x3fff] released
[  141.050766] pci 0000:07:01.0: PCI bridge to [bus 08]
[  141.050776] pci 0000:06:00.0: resource 13 [io  0x3000-0x3fff] released
[  141.050777] pci 0000:06:00.0: PCI bridge to [bus 07-38]
[  141.050789] pci 0000:06:00.0: BAR 13: assigned [io  0x3000-0x3fff]
[  141.050790] pci 0000:07:01.0: BAR 13: assigned [io  0x3000-0x3fff]
[  141.050791] pci 0000:07:04.0: BAR 13: no space for [io  size 0x1000]
[  141.050792] pci 0000:07:04.0: BAR 13: failed to assign [io  size 0x1000]
[  141.050793] pci 0000:08:00.0: BAR 4: assigned [io  0x3000-0x30ff]
[  141.050802] pci 0000:07:01.0: PCI bridge to [bus 08]
[  141.050806] pci 0000:07:01.0:   bridge window [io  0x3000-0x3fff]
[  141.050815] pci 0000:07:01.0:   bridge window [mem 0x60100000-0x601fffff]
[  141.050821] pci 0000:07:01.0:   bridge window [mem 0x4b8000000-0x4cfffffff 64bit pref]
[  141.050833] pci 0000:07:04.0: PCI bridge to [bus 09-38]
[  141.050841] pci 0000:07:04.0:   bridge window [mem 0x60200000-0x790fffff]
[  141.050848] pci 0000:07:04.0:   bridge window [mem 0x4d0000000-0x14afffffff 64bit pref]
[  141.050859] pci 0000:06:00.0: PCI bridge to [bus 07-38]
[  141.050863] pci 0000:06:00.0:   bridge window [io  0x3000-0x3fff]
[  141.050872] pci 0000:06:00.0:   bridge window [mem 0x60100000-0x790fffff]
[  141.050878] pci 0000:06:00.0:   bridge window [mem 0x4b4000000-0x14afffffff 64bit pref]
[  141.050889] pcieport 0000:04:01.0: PCI bridge to [bus 06-38]
[  141.050892] pcieport 0000:04:01.0:   bridge window [io  0x3000-0x3fff]
[  141.050897] pcieport 0000:04:01.0:   bridge window [mem 0x60100000-0x790fffff]
[  141.050901] pcieport 0000:04:01.0:   bridge window [mem 0x4b0100000-0x14afffffff 64bit pref]
[  141.050938] pcieport 0000:06:00.0: enabling device (0000 -> 0003)
[  141.051331] pcieport 0000:07:01.0: enabling device (0000 -> 0003)
[  141.051677] pcieport 0000:07:04.0: enabling device (0000 -> 0002)
[  141.051891] pcieport 0000:07:04.0: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[  141.052253] pci 0000:08:00.1: D0 power state depends on 0000:08:00.0
[  141.052277] pci 0000:09:00.0: enabling device (0000 -> 0002)
[  141.052526] xhci_hcd 0000:09:00.0: xHCI Host Controller
[  141.052530] xhci_hcd 0000:09:00.0: new USB bus registered, assigned bus number 5
[  141.054702] xhci_hcd 0000:09:00.0: hcc params 0x200077c1 hci version 0x110 quirks 0x0000000200009810
[  141.055121] usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.07
[  141.055122] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[  141.055123] usb usb5: Product: xHCI Host Controller
[  141.055124] usb usb5: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[  141.055125] usb usb5: SerialNumber: 0000:09:00.0
[  141.055276] hub 5-0:1.0: USB hub found
[  141.055288] hub 5-0:1.0: 2 ports detected
[  141.055521] xhci_hcd 0000:09:00.0: xHCI Host Controller
[  141.055525] xhci_hcd 0000:09:00.0: new USB bus registered, assigned bus number 6
[  141.055527] xhci_hcd 0000:09:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[  141.055557] usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.07
[  141.055558] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[  141.055559] usb usb6: Product: xHCI Host Controller
[  141.055559] usb usb6: Manufacturer: Linux 5.7.0-rc3+ xhci-hcd
[  141.055560] usb usb6: SerialNumber: 0000:09:00.0
[  141.055710] hub 6-0:1.0: USB hub found
[  141.055721] hub 6-0:1.0: 2 ports detected
[  141.061234] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[  141.061235] AMD-Vi: AMD IOMMUv2 functionality not available on this system
[  141.099325] [drm] amdgpu kernel modesetting enabled.
[  141.099403] CRAT table not found
[  141.099407] Virtual CRAT table created for CPU
[  141.099408] Parsing CRAT table with 1 nodes
[  141.099410] Creating topology SYSFS entries
[  141.099417] Topology: Add CPU node
[  141.099418] Finished initializing topology
[  141.099556] amdgpu 0000:08:00.0: enabling device (0000 -> 0003)
[  141.099705] [drm] initializing kernel modesetting (FIJI 0x1002:0x7300 0x1002:0x0B36 0xCA).
[  141.100513] [drm] register mmio base: 0x60100000
[  141.100514] [drm] register mmio size: 262144
[  141.100518] [drm] PCIE atomic ops is not supported
[  141.100537] [drm] add ip block number 0 <vi_common>
[  141.100537] [drm] add ip block number 1 <gmc_v8_0>
[  141.100538] [drm] add ip block number 2 <tonga_ih>
[  141.100538] [drm] add ip block number 3 <gfx_v8_0>
[  141.100539] [drm] add ip block number 4 <sdma_v3_0>
[  141.100539] [drm] add ip block number 5 <powerplay>
[  141.100540] [drm] add ip block number 6 <dm>
[  141.100541] [drm] add ip block number 7 <uvd_v6_0>
[  141.100541] [drm] add ip block number 8 <vce_v3_0>
[  141.100543] kfd kfd: skipped device 1002:7300, PCI rejects atomics
[  141.391063] usb 5-2: new high-speed USB device number 2 using xhci_hcd
[  141.394073] ATOM BIOS: 113-C8820200-107
[  141.394106] [drm] UVD is enabled in physical mode
[  141.394107] [drm] VCE enabled in physical mode
[  141.394126] [drm] GPU posting now...
[  141.503570] [drm] vm size is 64 GB, 2 levels, block size is 10-bit, fragment size is 9-bit
[  141.503598] amdgpu 0000:08:00.0: VRAM: 4096M 0x000000F400000000 - 0x000000F4FFFFFFFF (4096M used)
[  141.503599] amdgpu 0000:08:00.0: GART: 1024M 0x000000FF00000000 - 0x000000FF3FFFFFFF
[  141.503616] [drm] Detected VRAM RAM=4096M, BAR=256M
[  141.503617] [drm] RAM width 512bits HBM
[  141.503791] [TTM] Zone  kernel: Available graphics memory: 8073318 KiB
[  141.503792] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[  141.503793] [TTM] Initializing pool allocator
[  141.503797] [TTM] Initializing DMA pool allocator
[  141.503836] [drm] amdgpu: 4096M of VRAM memory ready
[  141.503838] [drm] amdgpu: 4096M of GTT memory ready.
[  141.503844] [drm] GART: num cpu pages 262144, num gpu pages 262144
[  141.503937] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[  141.505994] [drm] Chained IB support enabled!
[  141.509514] amdgpu: [powerplay] hwmgr_sw_init smu backed is fiji_smu
[  141.509893] [drm] Found UVD firmware Version: 1.91 Family ID: 12
[  141.509896] [drm] UVD ENC is disabled
[  141.526042] [drm] Found VCE firmware Version: 55.2 Binary ID: 3
[  141.541994] usb 5-2: New USB device found, idVendor=05e3, idProduct=0610, bcdDevice=93.03
[  141.541996] usb 5-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[  141.541997] usb 5-2: Product: USB2.1 Hub
[  141.541998] usb 5-2: Manufacturer: GenesysLogic
[  141.543388] hub 5-2:1.0: USB hub found
[  141.543674] hub 5-2:1.0: 4 ports detected
[  141.595891] [drm] dce110_link_encoder_construct: Failed to get encoder_cap_info from VBIOS with error code 4!
[  141.595927] [drm] Display Core initialized with v3.2.76!
[  141.597505] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  141.634286] [drm] UVD initialized successfully.
[  141.667516] usb 6-2: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[  141.690422] usb 6-2: New USB device found, idVendor=05e3, idProduct=0620, bcdDevice=93.03
[  141.690423] usb 6-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[  141.690424] usb 6-2: Product: USB3.1 Hub
[  141.690425] usb 6-2: Manufacturer: GenesysLogic
[  141.692600] hub 6-2:1.0: USB hub found
[  141.693138] hub 6-2:1.0: 4 ports detected
[  141.743301] [drm] VCE initialized successfully.
[  141.743523] amdgpu 0000:08:00.0: [drm] Cannot find any crtc or sizes
[  141.746294] [drm] Initialized amdgpu 3.36.0 20150101 for 0000:08:00.0 on minor 1
[  141.855640] usb 5-2.2: new full-speed USB device number 3 using xhci_hcd
[  141.959802] usb 5-2.2: device descriptor read/64, error -32
[  142.172063] usb 5-2.2: device descriptor read/64, error -32
[  142.384286] usb 5-2.2: new full-speed USB device number 4 using xhci_hcd
[  142.492412] usb 5-2.2: device descriptor read/64, error -32
[  142.704787] usb 5-2.2: device descriptor read/64, error -32
[  142.812980] usb 5-2-port2: attempt power cycle
[  143.469576] usb 5-2.2: new full-speed USB device number 5 using xhci_hcd
[  143.469758] usb 5-2.2: Device not responding to setup address.
[  143.677976] usb 5-2.2: Device not responding to setup address.
[  143.886076] usb 5-2.2: device not accepting address 5, error -71
[  143.990171] usb 5-2.2: new full-speed USB device number 6 using xhci_hcd
[  143.990268] usb 5-2.2: Device not responding to setup address.
[  144.198506] usb 5-2.2: Device not responding to setup address.
[  144.406657] usb 5-2.2: device not accepting address 6, error -71
[  144.406833] usb 5-2-port2: unable to enumerate USB device
[  144.578552] rfkill: input handler disabled
[  173.398452] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[  173.497560] [drm] UVD initialized successfully.
[  173.597613] [drm] VCE initialized successfully.
[  173.601142] amdgpu 0000:08:00.0: [drm] Cannot find any crtc or sizes
[  173.604663] rfkill: input handler enabled
[  184.300106] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[  184.399214] [drm] UVD initialized successfully.
[  184.499276] [drm] VCE initialized successfully.
[  184.503915] amdgpu 0000:08:00.0: [drm] Cannot find any crtc or sizes
[  231.079219] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[  231.300353] [drm] UVD initialized successfully.
[  231.369136] amdgpu 0000:08:00.0: [drm] Cannot find any crtc or sizes
[  231.400405] [drm] VCE initialized successfully.
[  231.405475] amdgpu 0000:08:00.0: [drm] Cannot find any crtc or sizes
[  231.851961] [drm] fb mappable at 0x4C0696000
[  231.851963] [drm] vram apper at 0x4C0000000
[  231.851964] [drm] size 33177600
[  231.851964] [drm] fb depth is 24
[  231.851965] [drm]    pitch is 15360
[  231.852016] amdgpu 0000:08:00.0: fb1: amdgpudrmfb frame buffer device
[  238.012944] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[  238.205061] [drm] UVD initialized successfully.
[  238.305119] [drm] VCE initialized successfully.
[  254.183797] [drm] Reducing the compressed framebuffer size. This may lead to less power savings than a non-reduced-size. Try to increase stolen memory size if available in BIOS.
[  386.999181] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040380
[  386.999195] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[  386.999390] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[  387.025758] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC3271: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[  387.025761] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[  387.025762] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[  387.025763] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[  387.025764] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[  387.025765] snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=0x19
[  387.025766] snd_hda_codec_realtek hdaudioC0D0:      Headphone Mic=0x1b
[  387.025767] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=0x12
[  387.079066] input: HDA Intel PCH Headphone Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input28
[  387.079098] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input29
[  387.079715] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input30
[  387.079765] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input31
[  387.079811] input: HDA Intel PCH HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input32
[  387.079864] input: HDA Intel PCH HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input33
[  387.289208] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[  387.472427] [drm] UVD initialized successfully.
[  387.572487] [drm] VCE initialized successfully.
[  387.577566] snd_hda_intel 0000:08:00.1: enabling device (0000 -> 0002)
[  387.577700] snd_hda_intel 0000:08:00.1: Force to non-snoop mode
[  387.583398] snd_hda_intel 0000:08:00.1: bound 0000:08:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
[  387.584563] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input34
[  387.584618] input: HDA ATI HDMI HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input35
[  387.584662] input: HDA ATI HDMI HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input36
[  387.584706] input: HDA ATI HDMI HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input37
[  387.584748] input: HDA ATI HDMI HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input38
[  387.584793] input: HDA ATI HDMI HDMI/DP,pcm=11 as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:01.0/0000:06:00.0/0000:07:01.0/0000:08:00.1/sound/card1/input39
[  400.445709] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[  400.677840] [drm] UVD initialized successfully.
[  400.777890] [drm] VCE initialized successfully.
[  400.830700] [drm] Reducing the compressed framebuffer size. This may lead to less power savings than a non-reduced-size. Try to increase stolen memory size if available in BIOS.
[  410.200021] [drm] Reducing the compressed framebuffer size. This may lead to less power savings than a non-reduced-size. Try to increase stolen memory size if available in BIOS.
[  499.883401] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[  500.065523] [drm] UVD initialized successfully.
[  500.165576] [drm] VCE initialized successfully.
[  500.217836] [drm] Reducing the compressed framebuffer size. This may lead to less power savings than a non-reduced-size. Try to increase stolen memory size if available in BIOS.
[ 1876.882625] device wlp2s0 entered promiscuous mode
[ 1876.924491] device wlp2s0 left promiscuous mode
[ 1879.618525] device wlp2s0 entered promiscuous mode
[ 1949.923185] device wlp2s0 left promiscuous mode
[ 1952.139442] device wlp2s0 entered promiscuous mode
[ 1952.167804] device wlp2s0 left promiscuous mode
[ 1955.111064] device wlp2s0 entered promiscuous mode
[ 1955.143380] device wlp2s0 left promiscuous mode
[ 1957.610937] device wlp2s0 entered promiscuous mode
[ 1957.635555] device wlp2s0 left promiscuous mode
[ 2010.416604] device wlp2s0 entered promiscuous mode
[ 2010.441122] device wlp2s0 left promiscuous mode
[ 2039.039236] device wlp2s0 entered promiscuous mode
[ 2039.075756] device wlp2s0 left promiscuous mode
[ 2041.423065] device wlp2s0 entered promiscuous mode
[ 2054.518009] device wlp2s0 left promiscuous mode
[ 2055.654413] device wlp2s0 entered promiscuous mode
[ 2055.679107] device wlp2s0 left promiscuous mode
[ 2061.298155] device wlp2s0 entered promiscuous mode
[ 2061.342677] device wlp2s0 left promiscuous mode
[ 2113.607484] device wlp2s0 entered promiscuous mode
[ 2149.235586] device wlp2s0 left promiscuous mode
[ 2151.525519] device wlp2s0 entered promiscuous mode
[ 2156.565621] device wlp2s0 left promiscuous mode
[ 2162.589073] device wlp2s0 entered promiscuous mode
[ 2170.060166] device wlp2s0 left promiscuous mode
[ 2171.904497] device wlp2s0 entered promiscuous mode
[ 2269.123485] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
[ 2269.315609] [drm] UVD initialized successfully.
[ 2269.425663] [drm] VCE initialized successfully.
[ 2269.466742] [drm] Reducing the compressed framebuffer size. This may lead to less power savings than a non-reduced-size. Try to increase stolen memory size if available in BIOS.

--cNdxnHkX5QqsyA0e--
