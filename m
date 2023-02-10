Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7285F692704
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 20:42:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8879B82E;
	Fri, 10 Feb 2023 20:41:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8879B82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676058145;
	bh=BWmKTRoqIvx6MDFQoL9FzNISFV6vvsQ4sJS+8Txln/Y=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jvql/Eepv7FSK7US+NIHw3izMzP/hwCV6iSRnArWH357mD0FRTWlslgL3nI/+AVGW
	 H1s/vc36lYCBn/TNiA890VX5WIjeaWVUn7OopM3omJ7pWfVEKbScxfXMOyZwDBdFiY
	 Ll+KdPYA8u01EoXHdvd5G5yMqvCkzLiX/vsLhrJs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0692F800B8;
	Fri, 10 Feb 2023 20:41:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 945ECF80269; Fri, 10 Feb 2023 20:41:31 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 67914F800B8
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 20:41:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67914F800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=FWJvDZwu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676058085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrfOu3qaR69ccH7DuaoAFvxzQf97CmjDnDorDQCgmI4=;
	b=FWJvDZwuFqFXgJypApKMEai6lzQuVxlc+MLRGqK/WA6HP97LlofS58KqaWGdbApy7UH7i7
	w5IWPwU9ClKbSOi/OiMwfHtZA9dq9xQcpX+Oe2YYm90jzGleQEDDTWlPxcBsugovnodt3L
	QE2LqCJIXfVcUreZ2bI5TtLkvHPy1zo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-365-uFLUt4urP6-vTMvMo150cQ-1; Fri, 10 Feb 2023 14:41:22 -0500
X-MC-Unique: uFLUt4urP6-vTMvMo150cQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 p36-20020a056402502400b004aab6614de9so4141199eda.6
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 11:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lrfOu3qaR69ccH7DuaoAFvxzQf97CmjDnDorDQCgmI4=;
        b=yqBrOKNzgD1SS7VmDb0/mPrZv0RmGa1pO6MtMJRqwNzOybnzJXQlUdwG7l6zBOhaoI
         php3OhY7ihDykkhjPHcp9FfAYQRLwmdPLEQmgQSvfknngt0kBPNOVSvMl8dRaCu3x08G
         xg0O/mbIUW7T+RLOpVsp2ndyfO3ugwFTOTXQ3bgpiJE4F2RCscLDtBVBJ+l35My8X5tw
         yOkDTE2u1LCG/HYUTt4ztUXBo4y7VoyGY/QzdxRtzUbyhfIKQAAnsMWr8GCVb32DAcei
         zk/gBJX3oF8DzStrWaXFMiJNnl3TYWkl/svtCuARK/hnX2Z/UxIDtJwwcweLhp9acKO9
         MoiA==
X-Gm-Message-State: AO0yUKUnz55Kie8klJl466f3SUWLE3lYSRxOachh7JDcLzcx2hP7nlq3
	6N4uoa2Hou3NHfxqNV07R/8gz8AjumgtNuTQZBeVjFAVe58Sq1beZeSDeOemcs4jTV5FnG2w54P
	iT/zYSWMEDFA1oNWSyeTXsUc=
X-Received: by 2002:a17:907:9484:b0:878:509f:798c with SMTP id
 dm4-20020a170907948400b00878509f798cmr20702871ejc.4.1676058081363;
        Fri, 10 Feb 2023 11:41:21 -0800 (PST)
X-Google-Smtp-Source: 
 AK7set8TTPRmaKf4d7r24Su7XzcDrt+64y6chZ0ujIOQt9F+tOX9hkZWuSzrrt1tNe/19CqcVroqsA==
X-Received: by 2002:a17:907:9484:b0:878:509f:798c with SMTP id
 dm4-20020a170907948400b00878509f798cmr20702858ejc.4.1676058081200;
        Fri, 10 Feb 2023 11:41:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id
 b12-20020a170906150c00b00888d593ce76sm2789667ejd.72.2023.02.10.11.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 11:41:20 -0800 (PST)
Message-ID: <f4992ffa-68db-7f8c-b92d-a0e1348a7839@redhat.com>
Date: Fri, 10 Feb 2023 20:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 2/9] apple-gmux: consolidate version reading
To: Orlando Chamberlain <orlandoch.dev@gmail.com>,
 platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
 <20230210044826.9834-3-orlandoch.dev@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230210044826.9834-3-orlandoch.dev@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CAMLZ3JFB3YW52MGYPFJMTHVFPS3L2UC
X-Message-ID-Hash: CAMLZ3JFB3YW52MGYPFJMTHVFPS3L2UC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CAMLZ3JFB3YW52MGYPFJMTHVFPS3L2UC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 2/10/23 05:48, Orlando Chamberlain wrote:
> Read gmux version in one go as 32 bits on both indexed and classic
> gmux's.
> 
> Classic gmux's used to read the version as
> 
> major = inb(base + 0x4);
> minor = inb(base + 0x5);
> release = inb(base + 0x6);
> 
> but this can instead be done the same way as indexed gmux's with
> gmux_read32(), so the same version reading code is used for classic
> and indexed gmux's (as well as mmio gmux's that will be added to this
> driver).
> 
> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
> ---
>  drivers/platform/x86/apple-gmux.c | 14 ++++++--------
>  include/linux/apple-gmux.h        |  6 +-----
>  2 files changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index e8cb084cb81f..67628104f31a 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -580,15 +580,13 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
>  	if (indexed) {
>  		mutex_init(&gmux_data->index_lock);
>  		gmux_data->indexed = true;
> -		version = gmux_read32(gmux_data, GMUX_PORT_VERSION_MAJOR);
> -		ver_major = (version >> 24) & 0xff;
> -		ver_minor = (version >> 16) & 0xff;
> -		ver_release = (version >> 8) & 0xff;
> -	} else {
> -		ver_major = gmux_read8(gmux_data, GMUX_PORT_VERSION_MAJOR);
> -		ver_minor = gmux_read8(gmux_data, GMUX_PORT_VERSION_MINOR);
> -		ver_release = gmux_read8(gmux_data, GMUX_PORT_VERSION_RELEASE);
>  	}
> +
> +	version = gmux_read32(gmux_data, GMUX_PORT_VERSION_MAJOR);
> +	ver_major = (version >> 24) & 0xff;
> +	ver_minor = (version >> 16) & 0xff;
> +	ver_release = (version >> 8) & 0xff;
> +
>  	pr_info("Found gmux version %d.%d.%d [%s]\n", ver_major, ver_minor,
>  		ver_release, (gmux_data->indexed ? "indexed" : "classic"));
>  

The problem with this is that there is nothing (no known register)
at address base + 7 and now you are reading from address base + 7
here where before the code was not, we have no idea how the hw
will respond to this.  This should be pretty innocent but still ...

> diff --git a/include/linux/apple-gmux.h b/include/linux/apple-gmux.h
> index 1f68b49bcd68..eb2caee04abd 100644
> --- a/include/linux/apple-gmux.h
> +++ b/include/linux/apple-gmux.h
> @@ -67,7 +67,6 @@ static inline bool apple_gmux_is_indexed(unsigned long iostart)
>   */
>  static inline bool apple_gmux_detect(struct pnp_dev *pnp_dev, bool *indexed_ret)
>  {
> -	u8 ver_major, ver_minor, ver_release;
>  	struct device *dev = NULL;
>  	struct acpi_device *adev;
>  	struct resource *res;
> @@ -95,10 +94,7 @@ static inline bool apple_gmux_detect(struct pnp_dev *pnp_dev, bool *indexed_ret)
>  	 * Invalid version information may indicate either that the gmux
>  	 * device isn't present or that it's a new one that uses indexed io.
>  	 */
> -	ver_major = inb(res->start + GMUX_PORT_VERSION_MAJOR);
> -	ver_minor = inb(res->start + GMUX_PORT_VERSION_MINOR);
> -	ver_release = inb(res->start + GMUX_PORT_VERSION_RELEASE);
> -	if (ver_major == 0xff && ver_minor == 0xff && ver_release == 0xff) {
> +	if (!(~inl(res->start + GMUX_PORT_VERSION_MAJOR))) {

Assuming we can get this tested well enough that I'm ok with the change in general
please write this as:

	if (inl(res->start + GMUX_PORT_VERSION_MAJOR) == 0xffffffff) {

Which I believe is what you are trying to achieve here ?

Regards,

Hans



>  		indexed = apple_gmux_is_indexed(res->start);
>  		if (!indexed)
>  			goto out;

