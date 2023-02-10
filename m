Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1356922B3
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 16:54:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5E91207;
	Fri, 10 Feb 2023 16:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5E91207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676044491;
	bh=scD/LjFXLEXAlU3e2+7tqnUgMZRT1MlTvXAjBIyuDlw=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c1mlBHOPZ/CaKGOEZRqzKJd2XuAnfgP9LxKdIdd5vZzdok5dXgLcsppDhzdPQziIr
	 bOzkjz65h687Onh9lubVBjHvqyT+021vqR7MnDBZXi1b42oWjQNBLWxa7oEFvbe3Ne
	 YrO9AQS0hBaBZ9SQPEQQ9VpIrWkGkPTPdJlE20uw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2608AF800B8;
	Fri, 10 Feb 2023 16:54:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 532C3F800E4; Fri, 10 Feb 2023 16:53:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85D3CF80094
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 16:53:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85D3CF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OcT4ZGtq
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-16cc1e43244so2905825fac.12
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 07:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zSFRNBGbg5RyVjgWiI+7ths83CFO6oNClYx+2xqQNtI=;
        b=OcT4ZGtq/U5q/qWwcF2XlCd9Zdq0FB1Dxiqi/hbC43HgQS0TKqov6/Kfc2E0Qwo8WM
         flozifGrCLGtQcoEWhlje3bH5qUg9ARuzchUATFH3nA8ou0cYru3xPm1jaQPT5iuE/Xg
         MDk5QrF5f4c6NCttHF6q6bikO9CC+tg69Nx0sitFZVjMzKhYEzLjTUgYAOmuoNqwvh20
         Mofgm+6ZPOjHRS9S/gFOvPUYoyWlMBetMJakeypEOSV6qAprF87U58HhpLM8zH1+ThjD
         RDBWaAjaui98pVRdTFldn/yJK2PtZTreBfgG+DBeoAEA+MuQ4q+gjw/WiluXvgdG7SO4
         wm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSFRNBGbg5RyVjgWiI+7ths83CFO6oNClYx+2xqQNtI=;
        b=V5s9/1kVI6Kglys+jrRgjt5PrU+tNmAAZntavYc/CtEO0c+vvClkDrAfgC8Uh4nFAe
         HPSyqY1kK0jCcCLp4mLgPVTOp+DNSy74Gt5yfTkUet8GSXUMBDHWDXVOAoenggsMsM6F
         qTuOY9i/0hH5T8K+hrIGDr39qOSGdcdmAQrZqTGrElsvrE16N6mMoym4cbPE49hVprvV
         zdVYtkmapj79xvgCSyMHxogN+CDTY5p4yF0RvlejuwkLK5/T4Q32ROYZM+sDgnZdPy2B
         VrJ/TXTB8rKjdAlMgd1nM0qcNQ4Z/nTVaP3qO6G8bYWAW3NqdPm30StzIfu0T7J8gJG9
         TEwg==
X-Gm-Message-State: AO0yUKViKrv6uvDfQhUxIoLrnFfKmFnsWXU1kiKvvu754TSDbLfyzKHK
	1/LrGRzDmt24w2yHtsPd8JJdzuzlDXD6VK+pL7A=
X-Google-Smtp-Source: 
 AK7set+qcoWEy9BYLGru9/034H+UQQd/562uEsdB2l51urNRCUIVKIl8Rlv7cIg64dgBI4M0+lgIJ0rB927Y0qI3KvQ=
X-Received: by 2002:a05:6870:13d1:b0:163:a303:fe2f with SMTP id
 17-20020a05687013d100b00163a303fe2fmr1456936oat.96.1676044421471; Fri, 10 Feb
 2023 07:53:41 -0800 (PST)
MIME-Version: 1.0
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
 <20230210044826.9834-10-orlandoch.dev@gmail.com>
In-Reply-To: <20230210044826.9834-10-orlandoch.dev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Feb 2023 10:53:28 -0500
Message-ID: 
 <CADnq5_PVsrk4+K45kVgU=r98B9GgC2CxbC8AvGUXRtv2sZAHPg@mail.gmail.com>
Subject: Re: [RFC PATCH 9/9] drm/amdgpu: register a vga_switcheroo client for
 all GPUs that are not thunderbolt attached
To: Orlando Chamberlain <orlandoch.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: LCJ6MPYFKZW5LCWLKQXCWDOCE3VGY5OK
X-Message-ID-Hash: LCJ6MPYFKZW5LCWLKQXCWDOCE3VGY5OK
X-MailFrom: alexdeucher@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
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
 Hans de Goede <hdegoede@redhat.com>, Kerem Karabay <kekrby@gmail.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LCJ6MPYFKZW5LCWLKQXCWDOCE3VGY5OK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 10, 2023 at 3:04 AM Orlando Chamberlain
<orlandoch.dev@gmail.com> wrote:
>
> From: Kerem Karabay <kekrby@gmail.com>
>
> Commit 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and
> vga_switcheroo") made amdgpu only register a vga_switcheroo client for
> GPU's with PX, however AMD GPUs in dual gpu Apple Macbooks do need to
> register, but don't have PX. Instead of AMD's PX, they use apple-gmux.

Is there a way to detect apple-gmux instead?  Otherwise, we register
vga_switcheroo on any system with multiple GPUs which is not what we
want.

Alex

>
> Revert to the old logic of registering for all non-thunderbolt gpus,
> like radeon and nouveau.
>
> Fixes: 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and vga_switcheroo")
> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> [Orlando Chamberlain <orlandoch.dev@gmail.com>: add commit description]
> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 2f28a8c02f64..0bb553a61552 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3919,12 +3919,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>         if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>                 vga_client_register(adev->pdev, amdgpu_device_vga_set_decode);
>
> -       if (amdgpu_device_supports_px(ddev)) {
> -               px = true;
> -               vga_switcheroo_register_client(adev->pdev,
> -                                              &amdgpu_switcheroo_ops, px);
> +       px = amdgpu_device_supports_px(ddev);
> +
> +       if (!pci_is_thunderbolt_attached(adev->pdev))
> +               vga_switcheroo_register_client(adev->pdev, &amdgpu_switcheroo_ops, px);
> +
> +       if (px)
>                 vga_switcheroo_init_domain_pm_ops(adev->dev, &adev->vga_pm_domain);
> -       }
>
>         if (adev->gmc.xgmi.pending_reset)
>                 queue_delayed_work(system_wq, &mgpu_info.delayed_reset_work,
> @@ -4048,10 +4049,13 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>
>         kfree(adev->bios);
>         adev->bios = NULL;
> -       if (amdgpu_device_supports_px(adev_to_drm(adev))) {
> +
> +       if (!pci_is_thunderbolt_attached(adev->pdev))
>                 vga_switcheroo_unregister_client(adev->pdev);
> +
> +       if (amdgpu_device_supports_px(adev_to_drm(adev)))
>                 vga_switcheroo_fini_domain_pm_ops(adev->dev);
> -       }
> +
>         if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>                 vga_client_unregister(adev->pdev);
>
> --
> 2.39.1
>
