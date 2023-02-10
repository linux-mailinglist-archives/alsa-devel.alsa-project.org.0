Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C28C6927B9
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 21:17:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5D0982B;
	Fri, 10 Feb 2023 21:16:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5D0982B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676060219;
	bh=J1wH2f7WIAO9Rd4m1r4bs/kkoG67+OH5bqe9kXHqzV0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aYJeVzRUYTvxPeBIbLtvra6z0EC7wDSFIy/KmX0mn5hIUqcIGA8PBoV0whNwL26QZ
	 wLtEn2V6ou1J2Wutm+5//OlzjqcuZLTY/MWvo/+MVne8UFlDG6O+y4g0TP9bvi+nOy
	 pX652grlDlUTOUFEBa/BsFZ29Eb4WkrcspIXVIQw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B54AF800B8;
	Fri, 10 Feb 2023 21:16:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1363BF800E4; Fri, 10 Feb 2023 21:16:05 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 773E7F8001E
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 21:15:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 773E7F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=FhcMoLq1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676060156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNFnqY613h9bvaBLnYI52rKBZZmmgHMm3e/efaUU+qs=;
	b=FhcMoLq17ZeEI2aUJUAYh3R20+Oev/MEyqZzsm7Uh9NnZLuxSOMXxC0Na3YSvHYfkzH1qB
	y9Fha1pHbBkzp5kjQWtciduz3PY9Tm762PjM1MFsve6Y5nbQKblRyi9y2azwDw0QsUXVQX
	8Yjh8zj9OgS4+4ow+OVj7WAYUh1lw8w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-hHtOfH_hN3y8anRzwyXXVA-1; Fri, 10 Feb 2023 15:15:53 -0500
X-MC-Unique: hHtOfH_hN3y8anRzwyXXVA-1
Received: by mail-ej1-f71.google.com with SMTP id
 qn8-20020a170907210800b0088eda544bd6so4216860ejb.11
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 12:15:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNFnqY613h9bvaBLnYI52rKBZZmmgHMm3e/efaUU+qs=;
        b=xcCWVAy00dcOEw6nH0uEg+dU0NkZFR9m5LdUFfIn/13gIpZ1dka8dM+L3zfWNUqfva
         zPRflkPcF3GmvF/qTHocDyD+JTmyw+N85xdNmDg4WbykIn6R7RtpQkcedIEA6UynoxWW
         sBCtxR4t7InmqbOy4nQ/nI4plcDA38O1pj8qkw4CpVMZZed9D3iaHklJxhdC/8uzzBYx
         TLLLZjxZ9AdDPhyZLmbNeiJf1w/C2KTQVesRmrS9pAKTlx/FNcf0h2MHrm3SDazIFlSY
         hc11VUxv2kgx8YC/EBZGvvgxlcCupyUXuae8lTvm6nbBmwlc0wPVar8x5VoA3rB+vAmh
         1Qow==
X-Gm-Message-State: AO0yUKWA2K/v4RS9RwKiyfOCWgxtQhbhaHO91H6Z438/UtCvOQdZIHw5
	SEvuSCgTrRAun2kQjZHe00RcaZ9MkvGq4KpjTI91ss2Y/v1c3PNnm+0QwufUPIwtFWZwUcOI01F
	OS3h1EWiP3Ji6JJ4GZHiYAPE=
X-Received: by 2002:a17:906:a102:b0:878:5e84:e1da with SMTP id
 t2-20020a170906a10200b008785e84e1damr19986657ejy.27.1676060152362;
        Fri, 10 Feb 2023 12:15:52 -0800 (PST)
X-Google-Smtp-Source: 
 AK7set83CY0lAZ6vzuP/e62ituWkImwtPZspb5CjMytMYB/Xmhp1TOSi84e/LdQpynGJdXlN84G9Aw==
X-Received: by 2002:a17:906:a102:b0:878:5e84:e1da with SMTP id
 t2-20020a170906a10200b008785e84e1damr19986636ejy.27.1676060152166;
        Fri, 10 Feb 2023 12:15:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a170906580a00b0086f4b8f9e42sm2813890ejq.65.2023.02.10.12.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 12:15:51 -0800 (PST)
Message-ID: <3e6c6cba-ad53-d380-a028-840fb19dbfcb@redhat.com>
Date: Fri, 10 Feb 2023 21:15:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 7/9] apple-gmux: add sysfs interface
To: Orlando Chamberlain <orlandoch.dev@gmail.com>,
 platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
 <20230210044826.9834-8-orlandoch.dev@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230210044826.9834-8-orlandoch.dev@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4KVC4OKWOPHPKXIKFLAF2VVX24FRLF2F
X-Message-ID-Hash: 4KVC4OKWOPHPKXIKFLAF2VVX24FRLF2F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KVC4OKWOPHPKXIKFLAF2VVX24FRLF2F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 2/10/23 05:48, Orlando Chamberlain wrote:
> Allow reading gmux ports from userspace. When the unsafe module
> parameter allow_user_writes is true, writing 1 byte
> values is also allowed.
> 
> For example:
> 
> cd /sys/bus/acpi/devices/APP000B:00/physical_node/
> echo 4 > gmux_selected_port
> cat gmux_selected_port_data | xxd -p
> 
> Will show the gmux version information (00000005 in this case)

Please use debugfs for this and as part of the conversion
drop the #ifdef-s (debugfs has stubs for when not enabled)
and drop all the error checking of creating the files, debugfs
is deliberately designed to not have any error checking in
the setup / teardown code.

This also removes the need for the allow_user_writes parameter
replacing it with the new kernel lockdown mechanism. debugfs
will automatically block access to writable files when
the kernel is in lockdown mode.

Regards,

Hans




> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
> ---
>  drivers/platform/x86/apple-gmux.c | 129 ++++++++++++++++++++++++++++++
>  1 file changed, 129 insertions(+)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index c38d6ef0c15a..756059d48393 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -66,6 +66,11 @@ struct apple_gmux_data {
>  	enum vga_switcheroo_client_id switch_state_external;
>  	enum vga_switcheroo_state power_state;
>  	struct completion powerchange_done;
> +
> +#ifdef CONFIG_SYSFS
> +	/* sysfs data */
> +	int selected_port;
> +#endif /* CONFIG_SYSFS */
>  };
>  
>  static struct apple_gmux_data *apple_gmux_data;
> @@ -651,6 +656,121 @@ static void gmux_notify_handler(acpi_handle device, u32 value, void *context)
>  		complete(&gmux_data->powerchange_done);
>  }
>  
> +/**
> + * DOC: Sysfs Interface
> + *
> + * gmux ports can be read from userspace as a sysfs interface. For example:
> + *
> + * # echo 4 > /sys/bus/acpi/devices/APP000B:00/physical_node/gmux_selected_port
> + * # cat /sys/bus/acpi/devices/APP000B:00/physical_node/gmux_selected_port_data | xxd -p
> + * 00000005
> + *
> + * Reads 4 bytes from port 4 (GMUX_PORT_VERSION_MAJOR).
> + *
> + * Single byte writes are also supported, however this must be enabled with the
> + * unsafe allow_user_writes module parameter.
> + *
> + */
> +
> +#ifdef CONFIG_SYSFS
> +
> +static bool allow_user_writes;
> +module_param_unsafe(allow_user_writes, bool, 0);
> +MODULE_PARM_DESC(allow_user_writes, "Allow userspace to write to gmux ports (default: false) (bool)");
> +
> +static ssize_t gmux_selected_port_store(struct device *dev,
> +		struct device_attribute *attr, const char *sysfsbuf, size_t count)
> +{
> +	struct apple_gmux_data *gmux_data = dev_get_drvdata(dev);
> +	u8 port;
> +
> +	if (kstrtou8(sysfsbuf, 10, &port) < 0)
> +		return -EINVAL;
> +
> +	/* On pio gmux's, make sure the user doesn't access too high of a port. */
> +	if ((gmux_data->config == &apple_gmux_pio) &&
> +		port > (gmux_data->iolen - 4))
> +		return -EINVAL;
> +
> +	gmux_data->selected_port = port;
> +	return count;
> +}
> +
> +static ssize_t gmux_selected_port_show(struct device *dev,
> +		struct device_attribute *attr, char *sysfsbuf)
> +{
> +	struct apple_gmux_data *gmux_data = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(sysfsbuf, "%d\n", gmux_data->selected_port);
> +}
> +
> +DEVICE_ATTR_RW(gmux_selected_port);
> +
> +static ssize_t gmux_selected_port_data_store(struct device *dev,
> +		struct device_attribute *attr, const char *sysfsbuf, size_t count)
> +{
> +	struct apple_gmux_data *gmux_data = dev_get_drvdata(dev);
> +
> +	if (count == 1)
> +		gmux_write8(gmux_data, gmux_data->selected_port, *sysfsbuf);
> +	else
> +		return -EINVAL;
> +
> +	return count;
> +}
> +
> +static ssize_t gmux_selected_port_data_show(struct device *dev,
> +		struct device_attribute *attr, char *sysfsbuf)
> +{
> +	struct apple_gmux_data *gmux_data = dev_get_drvdata(dev);
> +	u32 data;
> +
> +	data = gmux_read32(gmux_data, gmux_data->selected_port);
> +	memcpy(sysfsbuf, &data, sizeof(data));
> +
> +	return sizeof(data);
> +}
> +
> +struct device_attribute dev_attr_gmux_selected_port_data_rw = __ATTR_RW(gmux_selected_port_data);
> +struct device_attribute dev_attr_gmux_selected_port_data_ro = __ATTR_RO(gmux_selected_port_data);
> +
> +static int gmux_init_sysfs(struct pnp_dev *pnp)
> +{
> +	int ret;
> +
> +	ret = device_create_file(&pnp->dev, &dev_attr_gmux_selected_port);
> +	if (ret)
> +		return ret;
> +	if (allow_user_writes)
> +		ret = device_create_file(&pnp->dev, &dev_attr_gmux_selected_port_data_rw);
> +	else
> +		ret = device_create_file(&pnp->dev, &dev_attr_gmux_selected_port_data_ro);
> +	if (ret)
> +		device_remove_file(&pnp->dev, &dev_attr_gmux_selected_port);
> +	return ret;
> +}
> +
> +static void gmux_fini_sysfs(struct pnp_dev *pnp)
> +{
> +	device_remove_file(&pnp->dev, &dev_attr_gmux_selected_port);
> +	if (allow_user_writes)
> +		device_remove_file(&pnp->dev, &dev_attr_gmux_selected_port_data_rw);
> +	else
> +		device_remove_file(&pnp->dev, &dev_attr_gmux_selected_port_data_ro);
> +}
> +
> +#else
> +
> +static int gmux_init_sysfs(struct pnp_dev *pnp)
> +{
> +	return 0;
> +}
> +static void gmux_fini_sysfs(struct pnp_dev *pnp)
> +{
> +}
> +
> +#endif /* CONFIG_SYSFS */
> +
>  static int gmux_suspend(struct device *dev)
>  {
>  	struct pnp_dev *pnp = to_pnp_dev(dev);
> @@ -846,8 +966,16 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
>  		goto err_register_handler;
>  	}
>  
> +	ret = gmux_init_sysfs(pnp);
> +	if (ret) {
> +		pr_err("Failed to register gmux sysfs entries\n");
> +		goto err_sysfs;
> +	}
> +
>  	return 0;
>  
> +err_sysfs:
> +	vga_switcheroo_unregister_handler();
>  err_register_handler:
>  	gmux_disable_interrupts(gmux_data);
>  	apple_gmux_data = NULL;
> @@ -877,6 +1005,7 @@ static void gmux_remove(struct pnp_dev *pnp)
>  {
>  	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
>  
> +	gmux_fini_sysfs(pnp);
>  	vga_switcheroo_unregister_handler();
>  	gmux_disable_interrupts(gmux_data);
>  	if (gmux_data->gpe >= 0) {

