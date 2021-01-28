Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 477F03075A7
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 13:15:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C95FA16C9;
	Thu, 28 Jan 2021 13:14:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C95FA16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611836117;
	bh=4QS9VyFgOdbIuvpQ/e4NOhfiy7Xwy+bSfYy4FVoPA1c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iiEsaHQnQY3LpmdBONE5MX+i7b1Yjurm3Z7uspZCRnhgKz29MJs5FX0jf9HXoeR6b
	 O03Z4HOIfVT4/EizDLKOZU/vKvVwEJxRdjPaiMS4BxwwEz6fSJJU/zLCh1OkYFQjrP
	 OKlEhnygKASxcCUXzHuHtQRhGGii17OV3wdFHuSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56967F800D1;
	Thu, 28 Jan 2021 13:13:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC693F8015B; Thu, 28 Jan 2021 13:13:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,PRX_BODY_76,
 PRX_BODY_84,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3880BF800D1
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 13:13:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3880BF800D1
Received: by mail-ot1-f47.google.com with SMTP id a109so4952358otc.1
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 04:13:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=leU8VciL8Sfk5N5n4djrK54HMGnZksKQmyftuwmWArY=;
 b=ktML+NPBm58vBG/53ZvbiIrhv7uY17ITIUjyi/zJd9SJkyADHx+UGFSvOSvvAbEP8G
 rv1OeztzBJrseOgkfgoEp/1P7Cc60jsFjOoUohCWNvE4F013xmNKn3nCwMioMFzHg72f
 o3l62sP851j+jrzirvU5VhSK/3SF8zHHVeP0If7UeoHRNHEPLLMfuA2RUKLgf6/kl1JN
 67rXKPSp4PiBYIQcIeLKm4ERWU+UIfgfy0S3Lkhze5r0J9M8ALC2/5htnSX/294yVEyx
 qoXHysGXuHyWSgMGtJ35+Jr9xOcRq0nR20yMzIMyNES0YgKlINZL2C8M2bOEQyhwxciD
 ww9Q==
X-Gm-Message-State: AOAM5336ssGbxu0rV56a6q9TnPYUjpBOT8/Vg92OcFQdwp+4Wq0ibQ7i
 +bQCkvI1xv/GGdzri1MOxuU0Xl2bzbwCr0QbPxc=
X-Google-Smtp-Source: ABdhPJx2vQ8p3H5bitImynt4e/gbgRKyCHtUWDjUBujdpIbTAh/pIdNIrc3FJVhtc5MsZGI87rzVZyc3rk0dRxog9cI=
X-Received: by 2002:a05:6830:2313:: with SMTP id
 u19mr11380809ote.321.1611836015446; 
 Thu, 28 Jan 2021 04:13:35 -0800 (PST)
MIME-Version: 1.0
References: <CA+GA0_sPC3rp5K4qwZm-u+W1C=+2Y2p-dbF4DMdHkKaTpeKKkg@mail.gmail.com>
 <CAJZ5v0iapmc8ywuySwexwTagKr89Hj7TPXkAvd_HXMhdLoyyQQ@mail.gmail.com>
 <1f0f7273-597e-cdf0-87d1-908e56c13133@linux.intel.com>
 <CA+GA0_v3JUWS3G3=R4XuQ=OW91cpwiBP1Rp=uzYOF8c9TUJ46w@mail.gmail.com>
 <CA+GA0_sCdowanpZmg==c+xVqqNxG5whLGsKHaCfSmpERBhqMzA@mail.gmail.com>
 <1dc2639a-ecbc-c554-eaf6-930256dcda96@linux.intel.com>
 <CA+GA0_sZm2pqOfA3LsNQowb930QS_g5CiCCGthzsS=vAjB9Rjg@mail.gmail.com>
In-Reply-To: <CA+GA0_sZm2pqOfA3LsNQowb930QS_g5CiCCGthzsS=vAjB9Rjg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 28 Jan 2021 13:13:24 +0100
Message-ID: <CAJZ5v0h+Kwn5u293QO+H2rfGx-ZMBr18tMCLB7jHKHWWRaovOw@mail.gmail.com>
Subject: Re: Crash in acpi_ns_validate_handle triggered by soundwire on Linux
 5.10
To: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Erik Kaneda <erik.kaneda@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Len Brown <lenb@kernel.org>
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

On Wed, Jan 27, 2021 at 8:19 PM Marcin =C5=9Alusarz <marcin.slusarz@gmail.c=
om> wrote:
>
> =C5=9Br., 27 sty 2021 o 18:28 Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
> > > Weird, I can't reproduce this problem with my self-compiled kernel :/
> > > I don't even see soundwire modules loaded in. Manually loading them o=
f course
> > > doesn't do much.
> > >
> > > Previously I could boot into the "faulty" kernel by using "recovery m=
ode", but
> > > I can't do that anymore - it crashes too.
> > >
> > > Maybe there's some kind of race and this bug depends on some specific
> > > ordering of events?
> >
> > missing Kconfig?
> > You need CONFIG_SOUNDWIRE and CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE
> > selected to enter this sdw_intel_acpi_scan() routine.
>
> It was a PEBKAC, but a slightly different one. I won't bore you with
> (embarrassing) details ;).
>
> I reproduced the problem, tested both your and Rafael's patches
> and the kernel still crashes, with the same stack trace.
> (Yes, I'm sure I booted the right kernel :)
>
> Why "recovery mode" stopped working (or worked previously) is still a mys=
tery.

So for clarity, you've tried this:

static int snd_intel_dsp_check_soundwire(struct pci_dev *pci)
{
    struct sdw_intel_acpi_info info;
    acpi_handle handle;
    int ret;

    handle =3D ACPI_HANDLE(&pci->dev);
    if (!handle)
        return -ENODEV;

and it has not made a difference?

And the relevant part of the trace is:

RIP: 0010:acpi_ns_validate_handle+0x1a/0x23
Code: 00 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f c3 0f 1f 44 00 00
48 8d 57 ff 48 89 f8 48 83 fa fd 76 08 48 8b 05 0c b8 67 01 c3 <80> 7f
08 0f 74 02 31 c0 c3 0f 1f 44 00 00 48 8b 3d f6 b7 67 01 e8
RSP: 0000:ffffc388807c7b20 EFLAGS: 00010213
RAX: 0000000000000048 RBX: ffffc388807c7b70 RCX: 0000000000000000
RDX: 0000000000000047 RSI: 0000000000000246 RDI: 0000000000000048
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: ffffffffc0f5f4d1 R11: ffffffff8f0cb268 R12: 0000000000001001
R13: ffffffff8e33b160 R14: 0000000000000048 R15: 0000000000000000
FS:  00007f24548288c0(0000) GS:ffff9f781fb80000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000050 CR3: 0000000106158004 CR4: 0000000000770ee0
PKRU: 55555554
Call Trace:
 acpi_get_data_full+0x4d/0x92
 acpi_bus_get_device+0x1f/0x40
 sdw_intel_acpi_scan+0x59/0x230 [soundwire_intel]
 ? strstr+0x22/0x60
 ? dmi_matches+0x76/0xe0
 snd_intel_dsp_driver_probe.cold+0xaf/0x163 [snd_intel_dspcfg]
 azx_probe+0x7a/0x970 [snd_hda_intel]
 local_pci_probe+0x42/0x80
 ? _cond_resched+0x16/0x40
 pci_device_probe+0xfd/0x1b0

so it looks like we got to sdw_intel_acpi_scan() with a non-NULL, but
otherwise invalid parent_handle which then was passed to
acpi_bus_get_device().  Subsequently it got to acpi_get_data_full()
and acpi_ns_validate_handle() that crashed, because it tried to
dereference it via ACPI_GET_DESCRIPTOR_TYPE().

To debug it further, can you please modify
snd_intel_dsp_check_soundwire() to read like this:

static int snd_intel_dsp_check_soundwire(struct pci_dev *pci)
{
    struct sdw_intel_acpi_info info;
    struct acpi_device *adev =3D NULL;
    acpi_handle handle;
    int ret;

    handle =3D ACPI_HANDLE(&pci->dev);
    if (!handle)
        return -ENODEV;

    if (acpi_bus_get_device(handle, &adev))
        return -ENODEV;

and see what happens then?
