Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0B369272D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 20:45:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85B5583B;
	Fri, 10 Feb 2023 20:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85B5583B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676058300;
	bh=iDdDZCiai58duMDsA3epVP9prdI6s/llw7X+35rBg9o=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vkInbsJIu/ADY0FbvG5u22T032JIh3BNzJkUxwEVtRKcJFlHK+ebCQQyF7LIev4WS
	 twsYCeY5LlTPABRoVBP9/fyHHta/+5dY237CflpusoeBbcSHIuTqKDcE6WalSJj+eL
	 gqPtgV1ml3Kl11L0/vj6j65j6FO7uG2w2kqMJOZ8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FDDAF800B8;
	Fri, 10 Feb 2023 20:44:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCB82F800E4; Fri, 10 Feb 2023 20:44:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EDDEF800B8
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 20:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EDDEF800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Yi8jga6v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676058242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LqEMVOprqbRcgnb26iJyeC9PYlAfqxHL1qiXDXu+U9A=;
	b=Yi8jga6vVTeH8KDmFU3fYyjh38a0kQ16NQnJiNLT6u6UkYkge8x1VqfWzI4sALclmqNuEF
	DhEVy/EQSnfTFedqfEp/vQBO5n397RwGSD+xepMSCXCcNeJ4btI/RCex3dsgIJd5N2Q2BW
	poUfP99khFTPQ9hrwme6+uRzbvq2JEk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-qFcq07QzNuOO4AYvg-skTQ-1; Fri, 10 Feb 2023 14:44:00 -0500
X-MC-Unique: qFcq07QzNuOO4AYvg-skTQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 qk8-20020a1709077f8800b008af3fb43869so3558177ejc.4
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 11:44:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LqEMVOprqbRcgnb26iJyeC9PYlAfqxHL1qiXDXu+U9A=;
        b=i7xXLFk7bm1tO+HUXumiGvROmnW1hr6iqxvXnATMU7O02+FRBhtHPHb4HN+VsizYvF
         Z4ZvSSj/BF4geXbJouWyvANa5R5YqLwrMvR3e6shoMIxIzvPzVbtoC3lHCRWgdrS372A
         P73RGBjltXQL50+Aazv34O4EzEilCfMVQjoGDPyJGp6e3KL2jo6Wt0kHrB2weSNzV4/Q
         DU/9vsGCN7ClGIMaB7DwenMtZckuDu+8YaS7mDZgc2X/GCo8FUyIXYXgXdFv1BOo58uL
         A0eJOmvw/rH1ESOda30k2uZj3CP55Kl70rQ5nrxVDLgCgLdOiHG7TCdbIVD8aZ0UjWHa
         v1bA==
X-Gm-Message-State: AO0yUKXWxEBdtLtH7eda0GxPEFhUGlJzaWM0eGc0murdZ4tsamy2ckpB
	tO3T6wgOpiDCD6p6Cx3X4AVzzDIooaukz6PKrn4Nj6TP91uu5u6Y9jA7Lyn+wlvGXQkU1f3EWID
	9v2XEkjVB41sI4yDcQvB6Hwc=
X-Received: by 2002:a17:906:a1d3:b0:878:7cf3:a9e7 with SMTP id
 bx19-20020a170906a1d300b008787cf3a9e7mr14861817ejb.65.1676058239625;
        Fri, 10 Feb 2023 11:43:59 -0800 (PST)
X-Google-Smtp-Source: 
 AK7set9tc5ya+xq3T9ohLhPWkzaq1RTuRLg/Wi00GiP7Oc96aPjNzatgLBaKs4/WUVNxcjQaldtHxA==
X-Received: by 2002:a17:906:a1d3:b0:878:7cf3:a9e7 with SMTP id
 bx19-20020a170906a1d300b008787cf3a9e7mr14861809ejb.65.1676058239467;
        Fri, 10 Feb 2023 11:43:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id
 f20-20020a170906c09400b00872c0bccab2sm2786828ejz.35.2023.02.10.11.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 11:43:58 -0800 (PST)
Message-ID: <ee952253-9ee4-aa81-fefa-609cbf6e1e2b@redhat.com>
Date: Fri, 10 Feb 2023 20:43:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 5/9] apple-gmux: Use GMSP acpi method for interrupt
 clear
To: Orlando Chamberlain <orlandoch.dev@gmail.com>,
 platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
 <20230210044826.9834-6-orlandoch.dev@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230210044826.9834-6-orlandoch.dev@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WZLO3Y5F5QCDFEB6EHQZMKR3FANIJE73
X-Message-ID-Hash: WZLO3Y5F5QCDFEB6EHQZMKR3FANIJE73
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Gross <markgross@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Kerem Karabay <kekrby@gmail.com>,
 Aditya Garg <gargaditya08@live.com>, Aun-Ali Zaidi <admin@kodeit.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZLO3Y5F5QCDFEB6EHQZMKR3FANIJE73/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 2/10/23 05:48, Orlando Chamberlain wrote:
> This is needed for interrupts to be cleared correctly on MMIO based
> gmux's. It is untested if this helps/hinders other gmux types, but I
> have seen the GMSP method in the acpi tables of a MacBook with an
> indexed gmux.
> 
> If this turns out to break support for older gmux's, this can instead
> be only done on MMIO gmux's.
> 
> There is also a "GMLV" acpi method, and the "GMSP" method can be called
> with 1 as its argument, but the purposes of these aren't known and they
> don't seem to be needed.
> 
> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
> ---
>  drivers/platform/x86/apple-gmux.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 760434a527c1..c605f036ea0b 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -494,8 +494,29 @@ static const struct apple_gmux_config apple_gmux_index = {
>   * MCP79, on all following generations it's GPIO pin 6 of the Intel PCH.
>   * The GPE merely signals that an interrupt occurred, the actual type of event
>   * is identified by reading a gmux register.
> + *
> + * On MMIO gmux's, we also need to call the acpi method GMSP to properly clear
> + * interrupts. TODO: Do other types need this? Does this break other types?
>   */
>  
> +static int gmux_call_acpi_gmsp(struct apple_gmux_data *gmux_data, int arg)
> +{
> +	acpi_status status = AE_OK;
> +	union acpi_object arg0 = { ACPI_TYPE_INTEGER };
> +	struct acpi_object_list arg_list = { 1, &arg0 };
> +
> +	arg0.integer.value = arg;
> +
> +	status = acpi_evaluate_object(gmux_data->dhandle, "GMSP", &arg_list, NULL);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("GMSP call failed: %s\n",
> +		       acpi_format_exception(status));
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
>  static inline void gmux_disable_interrupts(struct apple_gmux_data *gmux_data)
>  {
>  	gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_ENABLE,
> @@ -519,7 +540,10 @@ static void gmux_clear_interrupts(struct apple_gmux_data *gmux_data)
>  
>  	/* to clear interrupts write back current status */
>  	status = gmux_interrupt_get_status(gmux_data);
> -	gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_STATUS, status);
> +	if (status) {
> +		gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_STATUS, status);
> +		gmux_call_acpi_gmsp(gmux_data, 0);

Ugh no, please don't go around calling random ACPI methods from untested
firmware revisions / device models.

ACPI code (even Apple's I have learned) tends to be full of bugs. If we
did not need to call GMSP before then please lets keep not calling it
on the older models. Just because it is there does not mean that calling
it is useful, it might even be harmful.

Regards,

Hans






> +	}
>  }
>  
>  static void gmux_notify_handler(acpi_handle device, u32 value, void *context)

