Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD8B69236C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 17:38:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8698683E;
	Fri, 10 Feb 2023 17:37:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8698683E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676047099;
	bh=5gkhf5WUvkMHhUwB7vbKiBxdElOZakrw/QaVLjqWjro=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CgTjfG8wVZgmHW5hIYf5dySD9a738x0pBAoQ75EkG2kLQ4iXwMgn66eKhGvrrs/zI
	 W4hwmfBRc1lKkprM5imjLpuAbordMm0xUoxszVhuB/sSumAGmA5HmytC/+306Y2A0T
	 wQuiPrVStzn/UWapWHxIlQyEHxFPkfrbDnFLOHFs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B472CF800B8;
	Fri, 10 Feb 2023 17:37:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8D99F800E4; Fri, 10 Feb 2023 17:37:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51177F8001E
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 17:37:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51177F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=J/9YT4DM
Received: by mail-oi1-x233.google.com with SMTP id r28so4893307oiw.3
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 08:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lZGbGz1NhrfpSRG2z7TL3PYxSXZAjKUnuSOuFnqQH1M=;
        b=J/9YT4DMQEDgj8/252EPESJY9MGTEXGRBHKNumqXE2p3HtcnXwLmcYFgJjNhgnarlY
         QinCKWkt5IZgSgKNAB4OoYPrldjLis0yV5D8RdMQILUCxqTwRpQmlKbAZhGn6655G1ot
         WAj0XVX1imiwW52nLWksZqsPtxknYYR7u7OtmCEJYNlXodegV2IrMIv1Hen546qavFQr
         iwkpkQFB4BsPsFNv+dgS46s7i/QOA2way5cMVVdmyhOYtKxOTQ9gxACHd0rdJOmRL009
         sau7+jnv5FcP0odLXOjyxJjzqoMsZ7UZdeNufPhhFsA4EX4d8A98u/CItxxxvoWyFhbd
         QQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZGbGz1NhrfpSRG2z7TL3PYxSXZAjKUnuSOuFnqQH1M=;
        b=oxlz99BfJlMrR1N19jURQ/+OEs3E4XV1IN7JzxTSZmf8G6+JlHnaIDLQVVJ1hncaxO
         OjKjhpfqjlo1XeWEehgis/XFfe1w2TrMC7M7Cl9Y4hus3TlHihMMJ1TA2xgqGaQB4i5X
         Oz0rmU9F8mNJTjb53B2nKj/Q/cD9qXEgqA3U69G2euwYsQ1nLJYNtIuuwo+Dn79h1+tD
         y8/G9OT7nJsWntP2M53CnyjBDg+9/8d2o8MBLpnSEV4koGTLmxXpjUt/QhT/5Plrm653
         IDOPaSLszIXImRRCO8Q+m2+6BtXHzKWbxg20W5MvrwvESeazCwtOeqkxg6341M0JeU+p
         BrAQ==
X-Gm-Message-State: AO0yUKV2D+q/f3mNFzuPtuN4g3CElzt7AoJDv9ANX+VrLz2CFdTRtPDo
	Z4HkjA7c1Eb+YWbm757FEi+7aDdtjzRc7vSDlUA=
X-Google-Smtp-Source: 
 AK7set+2eWH+CMgS4hAF2ka24mHW+jrtFcHDoTu3x6gdp5f/5ym8/9ji5ZX8mgiO3zxiEOUWAIeoJiwqo9LUlsTOKwE=
X-Received: by 2002:aca:3dd4:0:b0:378:4edd:a89c with SMTP id
 k203-20020aca3dd4000000b003784edda89cmr1122180oia.46.1676047039514; Fri, 10
 Feb 2023 08:37:19 -0800 (PST)
MIME-Version: 1.0
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
 <20230210044826.9834-10-orlandoch.dev@gmail.com>
 <CADnq5_PVsrk4+K45kVgU=r98B9GgC2CxbC8AvGUXRtv2sZAHPg@mail.gmail.com>
 <b3a2d525-b30c-164c-705c-97fcb0016540@redhat.com>
In-Reply-To: <b3a2d525-b30c-164c-705c-97fcb0016540@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Feb 2023 11:37:08 -0500
Message-ID: 
 <CADnq5_PXa=d8ie8jj7sGxvxfn+ZNwed-eSyNg89PfWCvpo8LCw@mail.gmail.com>
Subject: Re: [RFC PATCH 9/9] drm/amdgpu: register a vga_switcheroo client for
 all GPUs that are not thunderbolt attached
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: ULND3CQRK75I77WHKBMPW4STYYYGM7F5
X-Message-ID-Hash: ULND3CQRK75I77WHKBMPW4STYYYGM7F5
X-MailFrom: alexdeucher@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>,
 platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Rander Wang <rander.wang@intel.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 David Airlie <airlied@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Evan Quan <evan.quan@amd.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Mark Gross <markgross@kernel.org>,
 Kerem Karabay <kekrby@gmail.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Takashi Iwai <tiwai@suse.com>, Aditya Garg <gargaditya08@live.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ULND3CQRK75I77WHKBMPW4STYYYGM7F5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 10, 2023 at 11:07 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 2/10/23 16:53, Alex Deucher wrote:
> > On Fri, Feb 10, 2023 at 3:04 AM Orlando Chamberlain
> > <orlandoch.dev@gmail.com> wrote:
> >>
> >> From: Kerem Karabay <kekrby@gmail.com>
> >>
> >> Commit 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and
> >> vga_switcheroo") made amdgpu only register a vga_switcheroo client for
> >> GPU's with PX, however AMD GPUs in dual gpu Apple Macbooks do need to
> >> register, but don't have PX. Instead of AMD's PX, they use apple-gmux.
> >
> > Is there a way to detect apple-gmux instead?  Otherwise, we register
> > vga_switcheroo on any system with multiple GPUs which is not what we
> > want.
>
> Yes since 6.1.y (either stable series or just take 6.2.0) the apple-gmux
> detect code has been factored out into a stand-alone
> apple_gmux_detect() helper inside:
>
> include/linux/apple-gmux.h
>
> For usage outside of the actual apple-gmux driver you can simply
> pass NULL for both arguments.
>
> This was necessary to reliably check if the apple-gmux should be
> used for backlight control.
>
> Note there also is the older apple_gmux_present() helper, which is
> already used in some drm code. That function is not reliable though
> it detects if the ACPI tables contain an ACPI device describing
> the presence of a gmux, but it turns out even Apple has buggy ACPI
> tables and the mere presence of that ACPI device is not a reliable
> indicator the gmux is actually there.
>
> I have not changed over any of the existing apple_gmux_present()
> users for fear of unwanted side effects...

Looks like we could maybe use the PWRD ACPI check like patch 8 does as well.

Alex

>
> Regards,
>
> Hans
>
>
>
>
> >> Revert to the old logic of registering for all non-thunderbolt gpus,
> >> like radeon and nouveau.
> >>
> >> Fixes: 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and vga_switcheroo")
> >> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> >> [Orlando Chamberlain <orlandoch.dev@gmail.com>: add commit description]
> >> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
> >> ---
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 +++++++++++-------
> >>  1 file changed, 11 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> index 2f28a8c02f64..0bb553a61552 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> @@ -3919,12 +3919,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
> >>         if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
> >>                 vga_client_register(adev->pdev, amdgpu_device_vga_set_decode);
> >>
> >> -       if (amdgpu_device_supports_px(ddev)) {
> >> -               px = true;
> >> -               vga_switcheroo_register_client(adev->pdev,
> >> -                                              &amdgpu_switcheroo_ops, px);
> >> +       px = amdgpu_device_supports_px(ddev);
> >> +
> >> +       if (!pci_is_thunderbolt_attached(adev->pdev))
> >> +               vga_switcheroo_register_client(adev->pdev, &amdgpu_switcheroo_ops, px);
> >> +
> >> +       if (px)
> >>                 vga_switcheroo_init_domain_pm_ops(adev->dev, &adev->vga_pm_domain);
> >> -       }
> >>
> >>         if (adev->gmc.xgmi.pending_reset)
> >>                 queue_delayed_work(system_wq, &mgpu_info.delayed_reset_work,
> >> @@ -4048,10 +4049,13 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
> >>
> >>         kfree(adev->bios);
> >>         adev->bios = NULL;
> >> -       if (amdgpu_device_supports_px(adev_to_drm(adev))) {
> >> +
> >> +       if (!pci_is_thunderbolt_attached(adev->pdev))
> >>                 vga_switcheroo_unregister_client(adev->pdev);
> >> +
> >> +       if (amdgpu_device_supports_px(adev_to_drm(adev)))
> >>                 vga_switcheroo_fini_domain_pm_ops(adev->dev);
> >> -       }
> >> +
> >>         if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
> >>                 vga_client_unregister(adev->pdev);
> >>
> >> --
> >> 2.39.1
> >>
> >
>
