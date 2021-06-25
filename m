Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA633B4394
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Jun 2021 14:47:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96845167D;
	Fri, 25 Jun 2021 14:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96845167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624625247;
	bh=2hfzUK+kxWrH/YZFbAhs7rYQwTZmQDywu9kbsBt//Oo=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sg+YFYurIFAS6d4nCgGbaZv+T813iLAvmfyJdGoQd1rKWTZRT5zDwlXMh3zr76Zzm
	 +eosq3H8ETx5A2PS4xT8VYw/h/W31slT8hZVhp05QwGvCRKVhXpiOVw8gNcZMnxTZm
	 DFY7t8IX4fevOLez9pzJBkC2whrfyEdKHne2dDmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 005D8F801DB;
	Fri, 25 Jun 2021 14:45:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A138F801D5; Fri, 25 Jun 2021 14:45:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28B93F80137
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 14:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28B93F80137
Date: Fri, 25 Jun 2021 13:45:35 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2] ALSA: hda: Continue to probe when codec probe fails
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Message-Id: <ZRC9VQ.M548GASAC18G2@crapouillou.net>
In-Reply-To: <20201216124726.2842197-1-kai.heng.feng@canonical.com>
References: <20201214060621.1102931-1-kai.heng.feng@canonical.com>
 <20201216124726.2842197-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: SOUND <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
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

Hi Kai-Heng,

I am facing the same bug. Unfortunately your patch does not seem to fix=20
the bug for me, the nvidia GPU stays constantly active. Only if I=20
unbind the snd-hda-intel module for this PCI device that the nvidia GPU=20
will eventually go to sleep.

My dmesg (with your patch applied):

[ 1.821358] MXM: GUID detected in BIOS
[ 1.821396] ACPI BIOS Error (bug): AE_AML_PACKAGE_LIMIT, Index=20
(0x000000003) is beyond end of object (length 0x0)=20
(20200925/exoparg2-393)
[ 1.821406] ACPI Error: Aborting method \_SB.PCI0.GFX0._DSM due to=20
previous error (AE_AML_PACKAGE_LIMIT) (20200925/psparse-529)
[ 1.821415] ACPI: \_SB_.PCI0.GFX0: failed to evaluate _DSM (0x300b)
[ 1.821419] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type=20
mismatch - Found [Buffer], ACPI requires [Package]=20
(20200925/nsarguments-61)
[ 1.821528] i915 0000:00:02.0: optimus capabilities: enabled, status=20
dynamic power,
[ 1.821554] ACPI BIOS Error (bug): AE_AML_PACKAGE_LIMIT, Index=20
(0x000000003) is beyond end of object (length 0x0)=20
(20200925/exoparg2-393)
[ 1.821560] ACPI Error: Aborting method \_SB.PCI0.GFX0._DSM due to=20
previous error (AE_AML_PACKAGE_LIMIT) (20200925/psparse-529)
[ 1.821565] ACPI Error: Aborting method \_SB.PCI0.PEG0.PEGP._DSM due to=20
previous error (AE_AML_PACKAGE_LIMIT) (20200925/psparse-529)
[ 1.821572] ACPI: \_SB_.PCI0.PEG0.PEGP: failed to evaluate _DSM (0x300b)
[ 1.821574] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type=20
mismatch - Found [Buffer], ACPI requires [Package]=20
(20200925/nsarguments-61)
[ 1.821683] pci 0000:01:00.0: optimus capabilities: enabled, status=20
dynamic power,
[ 1.821685] VGA switcheroo: detected Optimus DSM method=20
\_SB_.PCI0.PEG0.PEGP handle
[ 1.821920] nouveau 0000:01:00.0: NVIDIA GK107 (0e71f0a2)
[ 1.830781] nouveau 0000:01:00.0: bios: version 80.07.95.00.07
[ 1.894392] nouveau 0000:01:00.0: fb: 2048 MiB DDR3
[ 1.896669] [drm] Initialized i915 1.6.0 20200917 for 0000:00:02.0 on=20
minor 0
[ 1.896862] ACPI: Video Device [PEGP] (multi-head: yes rom: yes post:=20
no)
[ 1.897361] input: Video Bus as=20
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:02/LNXVIDEO:00/input/inp=
ut12
[ 1.897974] ACPI: Video Device [GFX0] (multi-head: yes rom: no post: no)
[ 1.898219] nouveau 0000:01:00.0: bus: MMIO write of 0000001f FAULT at=20
6013d4 [ IBUS ]
[ 1.900114] input: Video Bus as=20
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:01/input/input13
[ 1.969353] vga_switcheroo: enabled
[ 1.969407] [TTM] Zone kernel: Available graphics memory: 3791596 KiB
[ 1.969408] [TTM] Zone dma32: Available graphics memory: 2097152 KiB
[ 1.969409] [TTM] Initializing pool allocator
[ 1.969416] [TTM] Initializing DMA pool allocator
[ 1.969431] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[ 1.969432] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[ 1.969436] nouveau 0000:01:00.0: DRM: Pointer to TMDS table not found
[ 1.969438] nouveau 0000:01:00.0: DRM: DCB version 4.0
[ 1.971139] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[ 1.971485] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0=20
on minor 1

[ ... ]

[ 4.594245] snd_hda_intel 0000:00:1b.0: bound 0000:00:02.0 (ops=20
i915_audio_component_bind_ops [i915])
[ 4.594380] snd_hda_intel 0000:01:00.1: can't change power state from=20
D3cold to D0 (config space inaccessible)
[ 4.594410] snd_hda_intel 0000:01:00.1: can't change power state from=20
D3cold to D0 (config space inaccessible)
[ 4.594486] snd_hda_intel 0000:01:00.1: Disabling MSI
[ 4.594494] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio=20
client
[ 4.594526] snd_hda_intel 0000:01:00.1: number of I/O streams is 30,=20
forcing separate stream tags

[ ... ]

[ 4.696732] hdaudio hdaudioC1D0: no AFG or MFG node found
[ 4.696745] hdaudio hdaudioC1D1: no AFG or MFG node found
[ 4.696752] hdaudio hdaudioC1D2: no AFG or MFG node found
[ 4.696759] hdaudio hdaudioC1D3: no AFG or MFG node found
[ 4.696765] hdaudio hdaudioC1D4: no AFG or MFG node found
[ 4.696771] hdaudio hdaudioC1D5: no AFG or MFG node found
[ 4.696778] hdaudio hdaudioC1D6: no AFG or MFG node found
[ 4.696785] hdaudio hdaudioC1D7: no AFG or MFG node found
[ 4.696787] snd_hda_intel 0000:01:00.1: no codecs initialized

Cheers,
-Paul


Le mer., d=E9c. 16 2020 at 20:47:24 +0800, Kai-Heng Feng=20
<kai.heng.feng@canonical.com> a =E9crit :
> Similar to commit 9479e75fca37 ("ALSA: hda: Keep the controller
> initialization even if no codecs found"), when codec probe fails, it
> doesn't enable runtime suspend, and can prevent graphics card from
> getting powered down:
> [    4.280991] snd_hda_intel 0000:01:00.1: no codecs initialized
>=20
> $ cat /sys/bus/pci/devices/0000:01:00.1/power/runtime_status
> active
>=20
> So mark there's no codec and continue probing to let runtime PM to=20
> work.
>=20
> BugLink: https://bugs.launchpad.net/bugs/1907212
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  sound/pci/hda/hda_intel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 6852668f1bcb..872a703dee43 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2328,7 +2328,7 @@ static int azx_probe_continue(struct azx *chip)
>  	if (bus->codec_mask) {
>  		err =3D azx_probe_codecs(chip, azx_max_codecs[chip->driver_type]);
>  		if (err < 0)
> -			goto out_free;
> +			bus->codec_mask =3D 0;
>  	}
>=20
>  #ifdef CONFIG_SND_HDA_PATCH_LOADER


