Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EC16922F5
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 17:08:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44F1283D;
	Fri, 10 Feb 2023 17:07:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44F1283D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676045307;
	bh=CLBhoJSNaa0Zm/fPdg6N6VPm+3Y4vxQEfNXwtcjN6a4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FKWLUngL/b9W8NarxIlR0YOM23brzZZB6fDe8fAcanX3vjMXxpMg+VnhkZUx5BVXe
	 rS9B/09KJ2h+jC5GS5VEIwZIHIMuVO4V4dJuBJSAIuuRap7GLYKAp0ntW5+vn9PlvL
	 WKvNdVaiqFty2TyfT+V94szGvPG8Pbo4fP3DtlY0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5211F8001E;
	Fri, 10 Feb 2023 17:07:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95C4FF800E4; Fri, 10 Feb 2023 17:07:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D086F80094
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 17:07:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D086F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=GsjYxCZV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676045245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BlezyZ0ctjzjBsdQv4yB2m2kychWterO+IryIxlv3FU=;
	b=GsjYxCZVYmTgD0YcEjdbVQJlVaCHoavJ67eMFazpdsu1ldPoiK1YW4NR20/YqP/zsAjX3u
	It4wORIcoxNr0a+13ebg1l2kVZl8ZMlApj6s5+xPDTZJXFlVelWfDlxWW6/8ME8BZgWH5j
	9gEhw6Iuu3zEfVgENDlrYjcO13BjStE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-hr4-EArvMMWEsGKnwnSjpg-1; Fri, 10 Feb 2023 11:07:16 -0500
X-MC-Unique: hr4-EArvMMWEsGKnwnSjpg-1
Received: by mail-ed1-f72.google.com with SMTP id
 p36-20020a056402502400b004aab6614de9so3805183eda.6
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 08:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BlezyZ0ctjzjBsdQv4yB2m2kychWterO+IryIxlv3FU=;
        b=kQj7/YRWiRIfbSu5wa70Kqlg8xyn/7tmczo3LJEDSDNHi/49AF/kaZQmwQs3bzfG4I
         NG6RL7Z6EjGFDEViiK//URTqhtkKVL6HGPccztxafSal/anJRaRobx3tTGRI8wD6nAmU
         R+y7/s1SXYwF5l/7aQOdhvfKeK7p/mPbDAmU0qXdnFP7hXEoIG6SM4qKHEVQEHM7PxCh
         /EMJdK7T5TqaFu1Xl9eedep0R0JnwGzXxFsOtwEmQ0/p08Frs34ik93tHq3dL6x12KZ/
         HIWrfGKNCiXrwsQmDI58rbSqUZ0nDsLpBS03sJFqZQW5reWq5jyHupzURD6RQxQMBE6S
         2mjA==
X-Gm-Message-State: AO0yUKXdy6mQyXO/mB5UNfGYqiOmfUMmLcaI4svpheVwG72LYtqUyPa6
	D9NOm8prxn3mG83n2PZmtGnXLTappTag6FFutkNk5VrIAnmi2S4KMxvUxSoJXM5G/4+ShTqz7aX
	2ybXfJZ3pQ2hDwgUli1kjbIo=
X-Received: by 2002:a17:906:6a20:b0:8af:33f8:dcb3 with SMTP id
 qw32-20020a1709066a2000b008af33f8dcb3mr8867478ejc.57.1676045235443;
        Fri, 10 Feb 2023 08:07:15 -0800 (PST)
X-Google-Smtp-Source: 
 AK7set8xLB5+EcBlsR4FtkzhXIqY7I7EBw8qioq1VaRXVB+Bc7ZWbenCJq8C4WMCGwJXM+0m0vfbkw==
X-Received: by 2002:a17:906:6a20:b0:8af:33f8:dcb3 with SMTP id
 qw32-20020a1709066a2000b008af33f8dcb3mr8867452ejc.57.1676045235208;
        Fri, 10 Feb 2023 08:07:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id
 v7-20020a170906858700b00883ec4c63ddsm2586397ejx.146.2023.02.10.08.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 08:07:14 -0800 (PST)
Message-ID: <b3a2d525-b30c-164c-705c-97fcb0016540@redhat.com>
Date: Fri, 10 Feb 2023 17:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 9/9] drm/amdgpu: register a vga_switcheroo client for
 all GPUs that are not thunderbolt attached
To: Alex Deucher <alexdeucher@gmail.com>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
 <20230210044826.9834-10-orlandoch.dev@gmail.com>
 <CADnq5_PVsrk4+K45kVgU=r98B9GgC2CxbC8AvGUXRtv2sZAHPg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: 
 <CADnq5_PVsrk4+K45kVgU=r98B9GgC2CxbC8AvGUXRtv2sZAHPg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MHU4YWDYVZ5V4M6CADWKWTLNZQSKSGK2
X-Message-ID-Hash: MHU4YWDYVZ5V4M6CADWKWTLNZQSKSGK2
X-MailFrom: hdegoede@redhat.com
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
 Kerem Karabay <kekrby@gmail.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Takashi Iwai <tiwai@suse.com>, Aditya Garg <gargaditya08@live.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MHU4YWDYVZ5V4M6CADWKWTLNZQSKSGK2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 2/10/23 16:53, Alex Deucher wrote:
> On Fri, Feb 10, 2023 at 3:04 AM Orlando Chamberlain
> <orlandoch.dev@gmail.com> wrote:
>>
>> From: Kerem Karabay <kekrby@gmail.com>
>>
>> Commit 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and
>> vga_switcheroo") made amdgpu only register a vga_switcheroo client for
>> GPU's with PX, however AMD GPUs in dual gpu Apple Macbooks do need to
>> register, but don't have PX. Instead of AMD's PX, they use apple-gmux.
> 
> Is there a way to detect apple-gmux instead?  Otherwise, we register
> vga_switcheroo on any system with multiple GPUs which is not what we
> want.

Yes since 6.1.y (either stable series or just take 6.2.0) the apple-gmux
detect code has been factored out into a stand-alone
apple_gmux_detect() helper inside:

include/linux/apple-gmux.h

For usage outside of the actual apple-gmux driver you can simply
pass NULL for both arguments.

This was necessary to reliably check if the apple-gmux should be
used for backlight control.

Note there also is the older apple_gmux_present() helper, which is
already used in some drm code. That function is not reliable though
it detects if the ACPI tables contain an ACPI device describing
the presence of a gmux, but it turns out even Apple has buggy ACPI
tables and the mere presence of that ACPI device is not a reliable
indicator the gmux is actually there.

I have not changed over any of the existing apple_gmux_present()
users for fear of unwanted side effects...

Regards,

Hans




>> Revert to the old logic of registering for all non-thunderbolt gpus,
>> like radeon and nouveau.
>>
>> Fixes: 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and vga_switcheroo")
>> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
>> [Orlando Chamberlain <orlandoch.dev@gmail.com>: add commit description]
>> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 +++++++++++-------
>>  1 file changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 2f28a8c02f64..0bb553a61552 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3919,12 +3919,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>         if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>>                 vga_client_register(adev->pdev, amdgpu_device_vga_set_decode);
>>
>> -       if (amdgpu_device_supports_px(ddev)) {
>> -               px = true;
>> -               vga_switcheroo_register_client(adev->pdev,
>> -                                              &amdgpu_switcheroo_ops, px);
>> +       px = amdgpu_device_supports_px(ddev);
>> +
>> +       if (!pci_is_thunderbolt_attached(adev->pdev))
>> +               vga_switcheroo_register_client(adev->pdev, &amdgpu_switcheroo_ops, px);
>> +
>> +       if (px)
>>                 vga_switcheroo_init_domain_pm_ops(adev->dev, &adev->vga_pm_domain);
>> -       }
>>
>>         if (adev->gmc.xgmi.pending_reset)
>>                 queue_delayed_work(system_wq, &mgpu_info.delayed_reset_work,
>> @@ -4048,10 +4049,13 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>>
>>         kfree(adev->bios);
>>         adev->bios = NULL;
>> -       if (amdgpu_device_supports_px(adev_to_drm(adev))) {
>> +
>> +       if (!pci_is_thunderbolt_attached(adev->pdev))
>>                 vga_switcheroo_unregister_client(adev->pdev);
>> +
>> +       if (amdgpu_device_supports_px(adev_to_drm(adev)))
>>                 vga_switcheroo_fini_domain_pm_ops(adev->dev);
>> -       }
>> +
>>         if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>>                 vga_client_unregister(adev->pdev);
>>
>> --
>> 2.39.1
>>
> 

