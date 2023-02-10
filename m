Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 754DF699821
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:57:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D77CFEC5;
	Thu, 16 Feb 2023 15:56:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D77CFEC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559448;
	bh=bNsGGAEnNyiWI7qNd2tNa0E1k6F7mRMXMAd7l3gnpJw=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SbY8VSMEUKBVruS4pMeRzNgBiQ6rd8nRZM2f9QcE9zCb3odo7HTQuzudbx18DLRjK
	 iXdV7u77DQAxBoMvwW3wNH/7at7qmr4vNeNXkjcrij316dOKFsBsXEUPQULxwEetFb
	 V4yqAcEPbin+oiMFBSwGLZoYZ9h5g5AkjlRuTUsw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FCA6F80580;
	Thu, 16 Feb 2023 15:55:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B1D3F800E4; Sat, 11 Feb 2023 00:44:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95117F80086
	for <alsa-devel@alsa-project.org>; Sat, 11 Feb 2023 00:44:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95117F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KRnLdCGK
Received: by mail-pj1-x1036.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso11794616pjj.1
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 15:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fkgsxRENqDGY4Cx9OetnsnXOp7kcAjPGOLFEpEWjd0=;
        b=KRnLdCGKanNL32fQh/xTC6YfrzvHoVrAuvdlqUn8gz9KtQ6kEIikF9agEYTH/nkD9I
         +f1Z3ClUcIEMEAHfPBRhDTJSo3uPBKbl3f7/jFLw2bY4TxW7Bm6UWqw33nGLENs1iwTU
         pTsi3mzYraAaSaLs1V32CNl4eowASkrb9uZUN/d0hfu1gb3M4FUeKI9uBUGt3Gop8wUY
         heys1xn5s1uHSh5hUM2uYGy8MBe9cF+rjcpj3nN+keMRu1PV2lhgbrsqaQf2HvUOB25I
         nCnQekfFR/zPKtoFAqjOE/cf3CZHZTSnTSqA0aHoWWLeMBVplj1T5HOd3KEFZXfb6LsZ
         ICuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fkgsxRENqDGY4Cx9OetnsnXOp7kcAjPGOLFEpEWjd0=;
        b=KfyQJP2hDLY8Cwb32e0Mdjy5y4xZTCE/E0N8ceu+7j1+/R6JGkUnTuW2KLalCyunLj
         iqKnL+C1bt7Z3S2Uhgm/D50cJfJYvQSYj8kxDRTRXCQF6J3s8PIikp7uSEzTSdYedywP
         zlKN1+IOVenMIPMKF+BO7m8A4XTC8Ta6gTFPuyNV+K6BBhDVmHAMHQa/dKyDdetf1Jb1
         FIV3ne+feXC7VztYKrMvTEtbx60O6zHUXttXLrn+TFAsP0GiNZLpDJS02yA3eB9+74uX
         CGLUliqmsVmxrliyZ9xx43UaRueEyUNZ2mXqOj2NS+J+TqxhFZ5xyyq3QKjDMutF4o1X
         +YCA==
X-Gm-Message-State: AO0yUKWLzXi8jIJGV4cQu9MOOXUQzEOE1IET7g8AOJaG78FgEU5jFNuf
	/D0vDJDNZ8G9GfEcMMeSA1Q=
X-Google-Smtp-Source: 
 AK7set/G6ky42GLQnLyHdqv5qMLFqaHFxufO7S4Mi7zI8257Or5oq220KUSdFMmRb1folKNGA9afxw==
X-Received: by 2002:a17:90b:3852:b0:230:1acb:191f with SMTP id
 nl18-20020a17090b385200b002301acb191fmr19593287pjb.32.1676072657179;
        Fri, 10 Feb 2023 15:44:17 -0800 (PST)
Received: from redecorated-mbp ([202.53.32.211])
        by smtp.gmail.com with ESMTPSA id
 h3-20020a17090a604300b00230b091288bsm3519570pjm.7.2023.02.10.15.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 15:44:17 -0800 (PST)
Date: Sat, 11 Feb 2023 10:44:03 +1100
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC PATCH 7/9] apple-gmux: add sysfs interface
Message-ID: <20230211104403.53017f26@redecorated-mbp>
In-Reply-To: <86054431-8d45-adea-121d-ff39d04d95cc@redhat.com>
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
	<20230210044826.9834-8-orlandoch.dev@gmail.com>
	<3e6c6cba-ad53-d380-a028-840fb19dbfcb@redhat.com>
	<86054431-8d45-adea-121d-ff39d04d95cc@redhat.com>
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
Message-ID-Hash: 6TZJMIZ4ZIOXG7T6AUO3TAJHRZV5VR5V
X-Message-ID-Hash: 6TZJMIZ4ZIOXG7T6AUO3TAJHRZV5VR5V
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:54:48 +0000
CC: platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Gross <markgross@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Evan Quan <evan.quan@amd.com>,
 Kerem Karabay <kekrby@gmail.com>, Aditya Garg <gargaditya08@live.com>,
 Aun-Ali Zaidi <admin@kodeit.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6TZJMIZ4ZIOXG7T6AUO3TAJHRZV5VR5V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 10 Feb 2023 21:23:15 +0100
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
> 
> On 2/10/23 21:15, Hans de Goede wrote:
> > Hi,
> > 
> > On 2/10/23 05:48, Orlando Chamberlain wrote:  
> >> Allow reading gmux ports from userspace. When the unsafe module
> >> parameter allow_user_writes is true, writing 1 byte
> >> values is also allowed.
> >>
> >> For example:
> >>
> >> cd /sys/bus/acpi/devices/APP000B:00/physical_node/
> >> echo 4 > gmux_selected_port
> >> cat gmux_selected_port_data | xxd -p
> >>
> >> Will show the gmux version information (00000005 in this case)  
> > 
> > Please use debugfs for this and as part of the conversion
> > drop the #ifdef-s (debugfs has stubs for when not enabled)
> > and drop all the error checking of creating the files, debugfs
> > is deliberately designed to not have any error checking in
> > the setup / teardown code.
> > 
> > This also removes the need for the allow_user_writes parameter
> > replacing it with the new kernel lockdown mechanism. debugfs
> > will automatically block access to writable files when
> > the kernel is in lockdown mode.

I'll change it to use debugfs instead of sysfs in v2.

> > 
> > Regards,
> > 
> > Hans  
> 
> p.s.
> 
> I just realized I forgot my usual thank you for contributing
> to the kernel reply to the cover letter before diving into
> the review (oops).
> 
> So let me correct that: thank you very much for your work on this!

thank you for maintaining and reviewing!
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
> >> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
> >> ---
> >>  drivers/platform/x86/apple-gmux.c | 129
> >> ++++++++++++++++++++++++++++++ 1 file changed, 129 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/apple-gmux.c
> >> b/drivers/platform/x86/apple-gmux.c index
> >> c38d6ef0c15a..756059d48393 100644 ---
> >> a/drivers/platform/x86/apple-gmux.c +++
> >> b/drivers/platform/x86/apple-gmux.c @@ -66,6 +66,11 @@ struct
> >> apple_gmux_data { enum vga_switcheroo_client_id
> >> switch_state_external; enum vga_switcheroo_state power_state;
> >>  	struct completion powerchange_done;
> >> +
> >> +#ifdef CONFIG_SYSFS
> >> +	/* sysfs data */
> >> +	int selected_port;
> >> +#endif /* CONFIG_SYSFS */
> >>  };
> >>  
> >>  static struct apple_gmux_data *apple_gmux_data;
> >> @@ -651,6 +656,121 @@ static void gmux_notify_handler(acpi_handle
> >> device, u32 value, void *context)
> >> complete(&gmux_data->powerchange_done); }
> >>  
> >> +/**
> >> + * DOC: Sysfs Interface
> >> + *
> >> + * gmux ports can be read from userspace as a sysfs interface.
> >> For example:
> >> + *
> >> + * # echo 4 >
> >> /sys/bus/acpi/devices/APP000B:00/physical_node/gmux_selected_port
> >> + * # cat
> >> /sys/bus/acpi/devices/APP000B:00/physical_node/gmux_selected_port_data
> >> | xxd -p
> >> + * 00000005
> >> + *
> >> + * Reads 4 bytes from port 4 (GMUX_PORT_VERSION_MAJOR).
> >> + *
> >> + * Single byte writes are also supported, however this must be
> >> enabled with the
> >> + * unsafe allow_user_writes module parameter.
> >> + *
> >> + */
> >> +
> >> +#ifdef CONFIG_SYSFS
> >> +
> >> +static bool allow_user_writes;
> >> +module_param_unsafe(allow_user_writes, bool, 0);
> >> +MODULE_PARM_DESC(allow_user_writes, "Allow userspace to write to
> >> gmux ports (default: false) (bool)"); +
> >> +static ssize_t gmux_selected_port_store(struct device *dev,
> >> +		struct device_attribute *attr, const char
> >> *sysfsbuf, size_t count) +{
> >> +	struct apple_gmux_data *gmux_data = dev_get_drvdata(dev);
> >> +	u8 port;
> >> +
> >> +	if (kstrtou8(sysfsbuf, 10, &port) < 0)
> >> +		return -EINVAL;
> >> +
> >> +	/* On pio gmux's, make sure the user doesn't access too
> >> high of a port. */
> >> +	if ((gmux_data->config == &apple_gmux_pio) &&
> >> +		port > (gmux_data->iolen - 4))
> >> +		return -EINVAL;
> >> +
> >> +	gmux_data->selected_port = port;
> >> +	return count;
> >> +}
> >> +
> >> +static ssize_t gmux_selected_port_show(struct device *dev,
> >> +		struct device_attribute *attr, char *sysfsbuf)
> >> +{
> >> +	struct apple_gmux_data *gmux_data = dev_get_drvdata(dev);
> >> +
> >> +	return sysfs_emit(sysfsbuf, "%d\n",
> >> gmux_data->selected_port); +}
> >> +
> >> +DEVICE_ATTR_RW(gmux_selected_port);
> >> +
> >> +static ssize_t gmux_selected_port_data_store(struct device *dev,
> >> +		struct device_attribute *attr, const char
> >> *sysfsbuf, size_t count) +{
> >> +	struct apple_gmux_data *gmux_data = dev_get_drvdata(dev);
> >> +
> >> +	if (count == 1)
> >> +		gmux_write8(gmux_data, gmux_data->selected_port,
> >> *sysfsbuf);
> >> +	else
> >> +		return -EINVAL;
> >> +
> >> +	return count;
> >> +}
> >> +
> >> +static ssize_t gmux_selected_port_data_show(struct device *dev,
> >> +		struct device_attribute *attr, char *sysfsbuf)
> >> +{
> >> +	struct apple_gmux_data *gmux_data = dev_get_drvdata(dev);
> >> +	u32 data;
> >> +
> >> +	data = gmux_read32(gmux_data, gmux_data->selected_port);
> >> +	memcpy(sysfsbuf, &data, sizeof(data));
> >> +
> >> +	return sizeof(data);
> >> +}
> >> +
> >> +struct device_attribute dev_attr_gmux_selected_port_data_rw =
> >> __ATTR_RW(gmux_selected_port_data); +struct device_attribute
> >> dev_attr_gmux_selected_port_data_ro =
> >> __ATTR_RO(gmux_selected_port_data); + +static int
> >> gmux_init_sysfs(struct pnp_dev *pnp) +{
> >> +	int ret;
> >> +
> >> +	ret = device_create_file(&pnp->dev,
> >> &dev_attr_gmux_selected_port);
> >> +	if (ret)
> >> +		return ret;
> >> +	if (allow_user_writes)
> >> +		ret = device_create_file(&pnp->dev,
> >> &dev_attr_gmux_selected_port_data_rw);
> >> +	else
> >> +		ret = device_create_file(&pnp->dev,
> >> &dev_attr_gmux_selected_port_data_ro);
> >> +	if (ret)
> >> +		device_remove_file(&pnp->dev,
> >> &dev_attr_gmux_selected_port);
> >> +	return ret;
> >> +}
> >> +
> >> +static void gmux_fini_sysfs(struct pnp_dev *pnp)
> >> +{
> >> +	device_remove_file(&pnp->dev,
> >> &dev_attr_gmux_selected_port);
> >> +	if (allow_user_writes)
> >> +		device_remove_file(&pnp->dev,
> >> &dev_attr_gmux_selected_port_data_rw);
> >> +	else
> >> +		device_remove_file(&pnp->dev,
> >> &dev_attr_gmux_selected_port_data_ro); +}
> >> +
> >> +#else
> >> +
> >> +static int gmux_init_sysfs(struct pnp_dev *pnp)
> >> +{
> >> +	return 0;
> >> +}
> >> +static void gmux_fini_sysfs(struct pnp_dev *pnp)
> >> +{
> >> +}
> >> +
> >> +#endif /* CONFIG_SYSFS */
> >> +
> >>  static int gmux_suspend(struct device *dev)
> >>  {
> >>  	struct pnp_dev *pnp = to_pnp_dev(dev);
> >> @@ -846,8 +966,16 @@ static int gmux_probe(struct pnp_dev *pnp,
> >> const struct pnp_device_id *id) goto err_register_handler;
> >>  	}
> >>  
> >> +	ret = gmux_init_sysfs(pnp);
> >> +	if (ret) {
> >> +		pr_err("Failed to register gmux sysfs entries\n");
> >> +		goto err_sysfs;
> >> +	}
> >> +
> >>  	return 0;
> >>  
> >> +err_sysfs:
> >> +	vga_switcheroo_unregister_handler();
> >>  err_register_handler:
> >>  	gmux_disable_interrupts(gmux_data);
> >>  	apple_gmux_data = NULL;
> >> @@ -877,6 +1005,7 @@ static void gmux_remove(struct pnp_dev *pnp)
> >>  {
> >>  	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
> >>  
> >> +	gmux_fini_sysfs(pnp);
> >>  	vga_switcheroo_unregister_handler();
> >>  	gmux_disable_interrupts(gmux_data);
> >>  	if (gmux_data->gpe >= 0) {  
> >   
> 

