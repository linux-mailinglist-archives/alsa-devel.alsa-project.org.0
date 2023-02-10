Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FCA699822
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:57:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56D19EE7;
	Thu, 16 Feb 2023 15:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56D19EE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559463;
	bh=tZ8hIGi9k4RUDNQ4lr7TpGDC3hsA2IQMZaiISm7O/GM=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gEgoT/isd8CRA6gsj80s7xGyud6XHEB2O/XoP0S4XvyrmnyEE/VceRXVXrnOAtZyo
	 81lB3Lk47ry4gqaLQ5Mzac3phcP4PMDksiFJ+aGTTfkVdaVovQPuzQoVx/g570FFho
	 IBJpCtAUURdJzngj3aBtOmrb6MSUTrHzll6+fA/c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09A5FF8058C;
	Thu, 16 Feb 2023 15:55:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED433F8018A; Sat, 11 Feb 2023 00:55:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D641F80086
	for <alsa-devel@alsa-project.org>; Sat, 11 Feb 2023 00:55:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D641F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Oh6mXmII
Received: by mail-pf1-x42f.google.com with SMTP id n2so4598077pfo.3
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 15:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sac/fX0wt9v0DHBtkfOe72qxgSq2ZxL7sJ1RWk0mQzQ=;
        b=Oh6mXmII+Z7iHd6314WW1IkZYatL53ousxgQOW7+m/EyoqbBUNzdiADjeTgbLBh4MM
         r6WJWYin1EetsFpHoW2v/rrFOwVTFqYi97k7uzhc4gSRvCjsxPbOKxKPpNQkuplwxMYj
         iJwCrNrYgb7Q4kVc9EykNh6RO4shGUuPYn7oB59kkng+UMxT94IJ2E+7NoB6UI0oVts0
         FCPkDXToksMdz/CKXYy7M2Daa6U4j7HT90WhTUHMbghRVOdfyqFpkjfMKOor2poztRAF
         qszAjfqrMzBPVc4sCRbSolXncQ4LD4B3G2ruzxF0kEglUfAL/afRdWpGGqLPYj16bMnc
         NvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sac/fX0wt9v0DHBtkfOe72qxgSq2ZxL7sJ1RWk0mQzQ=;
        b=Cy22pmcXOSQktCEqQdSjTMjjeTu/+NCdJQZyKkl3CQABZGv2ozIv90yD0MQ3jsmMUI
         3BdLCGhMEmsEVA7v7sLif4E/LEad0yOD6Xu+v7I1yhokRelw9pZsa8BacvdBz0WedY6X
         sNEpVpkA4x23GPxZIdpjBX4VAEl42DcrNKxgPInd5YU06DfCNQwz8g/OQMIiZXs6GzJZ
         PYfkESzcbdlKmPWhWx/NvZnxK6bxgixO63h6kWpbKolbeti57Dfp06z0cbBkLet44vwc
         5DxQNYiOgm4lVXHM4x1hsW1vodjQjZBF28S9+0k1ABLWJCkqx+DTpZxFlyPVdG9U7SKD
         47Mg==
X-Gm-Message-State: AO0yUKWWO3aF4+wmihDsWUUgbR0TSLHZPqz/DPr1ufIOyZUnWeDq+bw+
	QQQqASXJPVDWng1Zob7QlHw=
X-Google-Smtp-Source: 
 AK7set9nPEtV76VsB+ysNcWvcdA/XjTiAQwDc+XnZPZ2oGeO6JBsSezTX4grz36H63ofrjyYlHusKg==
X-Received: by 2002:a62:1b8a:0:b0:592:fc9f:8ae5 with SMTP id
 b132-20020a621b8a000000b00592fc9f8ae5mr14453938pfb.23.1676073301644;
        Fri, 10 Feb 2023 15:55:01 -0800 (PST)
Received: from redecorated-mbp ([202.53.32.211])
        by smtp.gmail.com with ESMTPSA id
 g8-20020aa78188000000b0056be1581126sm3888031pfi.143.2023.02.10.15.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 15:55:01 -0800 (PST)
Date: Sat, 11 Feb 2023 10:54:47 +1100
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [RFC PATCH 9/9] drm/amdgpu: register a vga_switcheroo client
 for all GPUs that are not thunderbolt attached
Message-ID: <20230211105447.0d8dda6b@redecorated-mbp>
In-Reply-To: 
 <CADnq5_PXa=d8ie8jj7sGxvxfn+ZNwed-eSyNg89PfWCvpo8LCw@mail.gmail.com>
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
	<20230210044826.9834-10-orlandoch.dev@gmail.com>
	<CADnq5_PVsrk4+K45kVgU=r98B9GgC2CxbC8AvGUXRtv2sZAHPg@mail.gmail.com>
	<b3a2d525-b30c-164c-705c-97fcb0016540@redhat.com>
	<CADnq5_PXa=d8ie8jj7sGxvxfn+ZNwed-eSyNg89PfWCvpo8LCw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.35; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MailFrom: orlandoch.dev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TMLNKFOEQ6ZVAOAIHTD2FVABNIAF6LJF
X-Message-ID-Hash: TMLNKFOEQ6ZVAOAIHTD2FVABNIAF6LJF
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:54:48 +0000
CC: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Rander Wang <rander.wang@intel.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 David Airlie <airlied@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Evan Quan <evan.quan@amd.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Mark Gross <markgross@kernel.org>,
 Kerem Karabay <kekrby@gmail.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Takashi Iwai <tiwai@suse.com>, Aditya Garg <gargaditya08@live.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TMLNKFOEQ6ZVAOAIHTD2FVABNIAF6LJF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 10 Feb 2023 11:37:08 -0500
Alex Deucher <alexdeucher@gmail.com> wrote:

> On Fri, Feb 10, 2023 at 11:07 AM Hans de Goede <hdegoede@redhat.com>
> wrote:
> >
> > Hi,
> >
> > On 2/10/23 16:53, Alex Deucher wrote:  
> > > On Fri, Feb 10, 2023 at 3:04 AM Orlando Chamberlain
> > > <orlandoch.dev@gmail.com> wrote:  
> > >>
> > >> From: Kerem Karabay <kekrby@gmail.com>
> > >>
> > >> Commit 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and
> > >> vga_switcheroo") made amdgpu only register a vga_switcheroo
> > >> client for GPU's with PX, however AMD GPUs in dual gpu Apple
> > >> Macbooks do need to register, but don't have PX. Instead of
> > >> AMD's PX, they use apple-gmux.  
> > >
> > > Is there a way to detect apple-gmux instead?  Otherwise, we
> > > register vga_switcheroo on any system with multiple GPUs which is
> > > not what we want.  
> >
> > Yes since 6.1.y (either stable series or just take 6.2.0) the
> > apple-gmux detect code has been factored out into a stand-alone
> > apple_gmux_detect() helper inside:
> >
> > include/linux/apple-gmux.h
> >
> > For usage outside of the actual apple-gmux driver you can simply
> > pass NULL for both arguments.
> >
> > This was necessary to reliably check if the apple-gmux should be
> > used for backlight control.
> >
> > Note there also is the older apple_gmux_present() helper, which is
> > already used in some drm code. That function is not reliable though
> > it detects if the ACPI tables contain an ACPI device describing
> > the presence of a gmux, but it turns out even Apple has buggy ACPI
> > tables and the mere presence of that ACPI device is not a reliable
> > indicator the gmux is actually there.
> >
> > I have not changed over any of the existing apple_gmux_present()
> > users for fear of unwanted side effects...  
> 
> Looks like we could maybe use the PWRD ACPI check like patch 8 does
> as well.

I wasn't using apple_gmux_detect as I mistakenly thought
pnp_get_resource would fail if apple-gmux had bound to the resource but
it looks like I was wrong about that so we can use that to determine if
the system has a gmux. I think I'll do that in v2.

As far as I know there's only one internal (non
thunderbolt) amd gpu inside all Macbooks with gmux so we probably
wouldn't need to check for PWRD to ensure it's  the right gpu.

With PWRD, I don't know if its present on all Dual GPU Macbooks, I've
only found the acpi tables for Macbookpro14,x to Macbookpro16,x, so I
don't know if it will work on older Macs (I'm also not sure if those
macs are using radeon or amdgpu).

> Alex
> 
> >
> > Regards,
> >
> > Hans
> >
> >
> >
> >  
> > >> Revert to the old logic of registering for all non-thunderbolt
> > >> gpus, like radeon and nouveau.
> > >>
> > >> Fixes: 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and
> > >> vga_switcheroo") Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> > >> [Orlando Chamberlain <orlandoch.dev@gmail.com>: add commit
> > >> description] Signed-off-by: Orlando Chamberlain
> > >> <orlandoch.dev@gmail.com> ---
> > >>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18
> > >> +++++++++++------- 1 file changed, 11 insertions(+), 7
> > >> deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > >> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c index
> > >> 2f28a8c02f64..0bb553a61552 100644 ---
> > >> a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c +++
> > >> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c @@ -3919,12
> > >> +3919,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
> > >> if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
> > >> vga_client_register(adev->pdev, amdgpu_device_vga_set_decode);
> > >>
> > >> -       if (amdgpu_device_supports_px(ddev)) {
> > >> -               px = true;
> > >> -               vga_switcheroo_register_client(adev->pdev,
> > >> -
> > >> &amdgpu_switcheroo_ops, px);
> > >> +       px = amdgpu_device_supports_px(ddev);
> > >> +
> > >> +       if (!pci_is_thunderbolt_attached(adev->pdev))
> > >> +               vga_switcheroo_register_client(adev->pdev,
> > >> &amdgpu_switcheroo_ops, px); +
> > >> +       if (px)
> > >>                 vga_switcheroo_init_domain_pm_ops(adev->dev,
> > >> &adev->vga_pm_domain);
> > >> -       }
> > >>
> > >>         if (adev->gmc.xgmi.pending_reset)
> > >>                 queue_delayed_work(system_wq,
> > >> &mgpu_info.delayed_reset_work, @@ -4048,10 +4049,13 @@ void
> > >> amdgpu_device_fini_sw(struct amdgpu_device *adev)
> > >>
> > >>         kfree(adev->bios);
> > >>         adev->bios = NULL;
> > >> -       if (amdgpu_device_supports_px(adev_to_drm(adev))) {
> > >> +
> > >> +       if (!pci_is_thunderbolt_attached(adev->pdev))
> > >>                 vga_switcheroo_unregister_client(adev->pdev);
> > >> +
> > >> +       if (amdgpu_device_supports_px(adev_to_drm(adev)))
> > >>                 vga_switcheroo_fini_domain_pm_ops(adev->dev);
> > >> -       }
> > >> +
> > >>         if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
> > >>                 vga_client_unregister(adev->pdev);
> > >>
> > >> --
> > >> 2.39.1
> > >>  
> > >  
> >  

