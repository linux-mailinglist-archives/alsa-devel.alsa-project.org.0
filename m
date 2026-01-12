Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DMvBwldqGmQtwAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 17:25:45 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA431204311
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 17:25:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FB2D602B7;
	Wed,  4 Mar 2026 17:25:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FB2D602B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772641544;
	bh=Az3a5g6sBrkuDHH5gEVvcMq32Bro10i1f5TI8YYZcR4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fw5k5uZlA5apgzx16EnxuntKbYstlV0lBk2TwON6nCWPZA0bsaa0EDpRsCtKexSk4
	 3460CHHIOg+bQtcqWkxbmvpbdtAcWghI44nBZ0NmmapAdfq95KoqIh28x1juXH7p3N
	 r7DYn2XQoUXrFH7DJ149AbF/T68cu780RzQTFH+k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8071EF80617; Wed,  4 Mar 2026 17:24:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 123CCF8060D;
	Wed,  4 Mar 2026 17:24:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5EF0F80152; Mon, 12 Jan 2026 15:12:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFC1AF800D0
	for <alsa-devel@alsa-project.org>; Mon, 12 Jan 2026 15:12:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFC1AF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Fi9Py0FD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02BD940515;
	Mon, 12 Jan 2026 14:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041F9C16AAE;
	Mon, 12 Jan 2026 14:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768227141;
	bh=Az3a5g6sBrkuDHH5gEVvcMq32Bro10i1f5TI8YYZcR4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fi9Py0FDbKfjkqv3JN1HrtZ2G3riC2LaEjjAry6nE3lD9vBd5oXemiQ4wFIFzQ8vX
	 mi9A/L+0s92ijbmqBPrBi0uMsMSeG4V1BRo92cuvoX+t8ReBlUjk5uEGWZ6dDW++JK
	 /el2TyFw59FaTm4EwRru+DZ21vUezKgkUAw43j4UihWFMzmXgWIaJaGKb3Pzs+Te0G
	 GVM1UQKlXj4uok7zFH4P/KTR+T4nHS94QxyLnY8KakJh3l7WpNQ3iu9fRQUld3UnOD
	 n9OQWEw/3d6dMMZxz4vUTHaQaJ3AKi0dTMaBty/9fjIQGUYaDxiCCKPjJk5aO7Tq/L
	 GXCnriTYr2L1w==
Message-ID: <cbe560b5-2cf2-4b77-b49d-1f4d4b46e5fd@kernel.org>
Date: Mon, 12 Jan 2026 08:12:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: soc-acpi: add is_device_rt712_vb() helper
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 simont@opensource.cirrus.com, Sunil-kumar.Dommati@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260110064505.1485927-1-Vijendar.Mukunda@amd.com>
 <3baa51df-5891-4fa9-be0e-4695944bb38c@amd.com>
 <d2e8c4be-76e0-4e52-aa27-ff8924e13eb3@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <d2e8c4be-76e0-4e52-aa27-ff8924e13eb3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: superm1@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: A2U7W42WYGMMBDORKL235KYQL46F5RAJ
X-Message-ID-Hash: A2U7W42WYGMMBDORKL235KYQL46F5RAJ
X-Mailman-Approved-At: Wed, 04 Mar 2026 16:24:48 +0000
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2U7W42WYGMMBDORKL235KYQL46F5RAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: BA431204311
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	DATE_IN_PAST(1.00)[1226];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[alsa-project.org,gmail.com,perex.cz,suse.com,linux.intel.com,opensource.cirrus.com,amd.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim,alsa0.perex.cz:rdns,alsa0.perex.cz:helo,amd.com:email];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[superm1@kernel.org,alsa-devel-bounces@alsa-project.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vijendar.mukunda@amd.com,m:broonie@kernel.org,m:alsa-devel@alsa-project.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:yung-chuan.liao@linux.intel.com,m:simont@opensource.cirrus.com,m:Sunil-kumar.Dommati@amd.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+,kernel.org:+];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 1/11/26 11:52 PM, Mukunda,Vijendar wrote:
> On 11/01/26 04:17, Mario Limonciello wrote:
>>
>>
>> On 1/10/2026 12:44 AM, Vijendar Mukunda wrote:
>>> Add a filter to skip the RT172 VB configuration if a SmartMic Function
>>> is not found in the SDCA descriptors.
>>>
>>> If the ACPI information is incorrect this can only be quirked further
>>> with DMI information.
>>>
>>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Thanks for the comments below, no remaining concerns by me.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

>>> ---
>>>    sound/soc/amd/acp/Kconfig                    |  6 +++
>>>    sound/soc/amd/acp/Makefile                   |  2 +
>>>    sound/soc/amd/acp/amd-acp70-acpi-match.c     | 50 ++++++++++++++++++++
>>>    sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c | 42 ++++++++++++++++
>>>    sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h | 14 ++++++
>>>    5 files changed, 114 insertions(+)
>>>    create mode 100644 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c
>>>    create mode 100644 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
>>>
>>> diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
>>> index c2a60bc80ee6..ed2fa055f7f6 100644
>>> --- a/sound/soc/amd/acp/Kconfig
>>> +++ b/sound/soc/amd/acp/Kconfig
>>> @@ -15,8 +15,14 @@ config SND_SOC_AMD_ACP_COMMON
>>>      config SND_SOC_ACPI_AMD_MATCH
>>>        tristate
>>> +    select SND_SOC_ACPI_AMD_SDCA_QUIRKS
>>>        select SND_SOC_ACPI if ACPI
>>>    +config SND_SOC_ACPI_AMD_SDCA_QUIRKS
>>> +    tristate
>>> +    depends on ACPI
>>> +    depends on SND_SOC_SDCA
>>
>> Does this need a description?
> Not required. This Config is not directly populated where user can go and select.
>>
>>> +
>>>    if SND_SOC_AMD_ACP_COMMON
>>>      config SND_SOC_AMD_ACP_PDM
>>> diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
>>> index 08220b9a3802..81d23aded348 100644
>>> --- a/sound/soc/amd/acp/Makefile
>>> +++ b/sound/soc/amd/acp/Makefile
>>> @@ -27,6 +27,7 @@ snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o
>>> amd-acp70-acpi-match.o
>>>    snd-acp-sdw-mach-y     := acp-sdw-mach-common.o
>>>    snd-acp-sdw-sof-mach-y += acp-sdw-sof-mach.o
>>>    snd-acp-sdw-legacy-mach-y += acp-sdw-legacy-mach.o
>>> +snd-soc-acpi-amd-sdca-quirks-y += soc-acpi-amd-sdca-quirks.o
>>>      obj-$(CONFIG_SND_SOC_AMD_ACP_PCM) += snd-acp-pcm.o
>>>    obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
>>> @@ -40,6 +41,7 @@ obj-$(CONFIG_SND_AMD_ASOC_REMBRANDT) += snd-acp-rembrandt.o
>>>    obj-$(CONFIG_SND_AMD_ASOC_ACP63) += snd-acp63.o
>>>    obj-$(CONFIG_SND_AMD_ASOC_ACP70) += snd-acp70.o
>>>    +obj-$(CONFIG_SND_SOC_ACPI_AMD_SDCA_QUIRKS) += snd-soc-acpi-amd-sdca-quirks.o
>>>    obj-$(CONFIG_SND_AMD_SOUNDWIRE_ACPI) += snd-amd-sdw-acpi.o
>>>    obj-$(CONFIG_SND_SOC_AMD_MACH_COMMON) += snd-acp-mach.o
>>>    obj-$(CONFIG_SND_SOC_AMD_LEGACY_MACH) += snd-acp-legacy-mach.o
>>> diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c
>>> b/sound/soc/amd/acp/amd-acp70-acpi-match.c
>>> index 871b4f054a84..fa39f18578ca 100644
>>> --- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
>>> +++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
>>> @@ -7,6 +7,7 @@
>>>     */
>>>      #include <sound/soc-acpi.h>
>>> +#include "soc-acpi-amd-sdca-quirks.h"
>>>    #include "../mach-config.h"
>>>      static const struct snd_soc_acpi_endpoint single_endpoint = {
>>> @@ -44,6 +45,39 @@ static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
>>>        .group_id = 1
>>>    };
>>>    +static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] = {
>>> +    /* Jack Endpoint */
>>> +    {
>>> +        .num = 0,
>>> +        .aggregated = 0,
>>> +        .group_position = 0,
>>> +        .group_id = 0,
>>> +    },
>>> +    /* Amp Endpoint, work as spk_l_endpoint */
>>> +    {
>>> +        .num = 1,
>>> +        .aggregated = 1,
>>> +        .group_position = 0,
>>> +        .group_id = 1,
>>> +    },
>>> +    /* DMIC Endpoint */
>>> +    {
>>> +        .num = 2,
>>> +        .aggregated = 0,
>>> +        .group_position = 0,
>>> +        .group_id = 0,
>>> +    },
>>> +};
>>> +
>>> +static const struct snd_soc_acpi_adr_device rt712_vb_1_group1_adr[] = {
>>> +    {
>>> +        .adr = 0x000130025D071201ull,
>>> +        .num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints),
>>> +        .endpoints = jack_amp_g1_dmic_endpoints,
>>> +        .name_prefix = "rt712"
>>> +    }
>>> +};
>>> +
>>>    static const struct snd_soc_acpi_adr_device rt711_rt1316_group_adr[] = {
>>>        {
>>>            .adr = 0x000030025D071101ull,
>>> @@ -254,6 +288,15 @@ static const struct snd_soc_acpi_link_adr
>>> acp70_cs35l56x4_l1[] = {
>>>        {}
>>>    };
>>>    +static const struct snd_soc_acpi_link_adr acp70_alc712_vb_l1[] = {
>>> +    {
>>> +        .mask = BIT(1),
>>> +        .num_adr = ARRAY_SIZE(rt712_vb_1_group1_adr),
>>> +        .adr_d = rt712_vb_1_group1_adr,
>>> +    },
>>> +    {}
>>> +};
>>> +
>>>    static const struct snd_soc_acpi_link_adr acp70_rt722_only[] = {
>>>        {
>>>            .mask = BIT(0),
>>> @@ -308,6 +351,12 @@ struct snd_soc_acpi_mach
>>> snd_soc_acpi_amd_acp70_sdw_machines[] = {
>>>            .links = acp70_cs35l56x4_l1,
>>>            .drv_name = "amd_sdw",
>>>        },
>>> +    {
>>> +        .link_mask = BIT(1),
>>> +        .links = acp70_alc712_vb_l1,
>>> +        .machine_check = snd_soc_acpi_amd_sdca_is_device_rt712_vb,
>>> +        .drv_name = "amd_sdw",
>>> +    },
>>>        {},
>>>    };
>>>    EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sdw_machines);
>>> @@ -327,3 +376,4 @@ EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sof_sdw_machines);
>>>    MODULE_DESCRIPTION("AMD ACP7.0 & ACP7.1 tables and support for ACPI
>>> enumeration");
>>>    MODULE_LICENSE("GPL");
>>>    MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
>>> +MODULE_IMPORT_NS("SND_SOC_ACPI_AMD_SDCA_QUIRKS");
>>> diff --git a/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c
>>> b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c
>>> new file mode 100644
>>> index 000000000000..63bf9e3c0ae1
>>> --- /dev/null
>>> +++ b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c
>>> @@ -0,0 +1,42 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * soc-acpi-amd-sdca-quirks.c - tables and support for SDCA quirks
>>> + *
>>> + * Copyright(c) 2025 Advanced Micro Devices, Inc. All rights reserved.
>>
>> 2026 now
>   This patch was implemented and posted as a PR in SOF GitHub last month.
> That's why the year was mentioned as 2025.
>>
>>> + *
>>> + */
>>> +
>>> +#include <linux/soundwire/sdw_amd.h>
>>> +#include <sound/sdca.h>
>>> +#include <sound/soc-acpi.h>
>>> +#include "soc-acpi-amd-sdca-quirks.h"
>>> +
>>> +/*
>>> + * Pretend machine quirk. The argument type is not the traditional
>>> + * 'struct snd_soc_acpi_mach' pointer but instead the sdw_amd_ctx
>>> + * which contains the peripheral information required for the
>>> + * SoundWire/SDCA filter on the SMART_MIC setup and interface
>>> + * revision. When the return value is false, the entry in the
>>> + * 'snd_soc_acpi_mach' table needs to be skipped.
>>> + */
>>> +bool snd_soc_acpi_amd_sdca_is_device_rt712_vb(void *arg)
>>> +{
>>> +    struct sdw_amd_ctx *ctx = arg;
>>> +    int i;
>>> +
>>> +    if (!ctx)
>>> +        return false;
>>> +
>>> +    for (i = 0; i < ctx->peripherals->num_peripherals; i++) {
>>> +        if (sdca_device_quirk_match(ctx->peripherals->array[i],
>>> +                        SDCA_QUIRKS_RT712_VB))
>>> +            return true;
>>> +    }
>>> +
>>> +    return false;
>>> +}
>>> +EXPORT_SYMBOL_NS(snd_soc_acpi_amd_sdca_is_device_rt712_vb,
>>> "SND_SOC_ACPI_AMD_SDCA_QUIRKS");
>>> +
>>> +MODULE_DESCRIPTION("ASoC ACPI AMD SDCA quirks");
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_IMPORT_NS("SND_SOC_SDCA");
>>> diff --git a/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
>>> b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
>>> new file mode 100644
>>> index 000000000000..7e345a236da1
>>> --- /dev/null
>>> +++ b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
>>> @@ -0,0 +1,14 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * soc-acpi-amd-sdca-quirks.h - tables and support for SDCA quirks
>>> + *
>>> + * Copyright(c) 2025 Advanced Micro Devices, Inc. All rights reserved.
>>
>> 2026
>>
>>
>>> + *
>>> + */
>>> +
>>> +#ifndef _SND_SOC_ACPI_AMD_SDCA_QUIRKS
>>> +#define _SND_SOC_ACPI_AMD_SDCA_QUIRKS
>>> +
>>> +bool snd_soc_acpi_amd_sdca_is_device_rt712_vb(void *arg);
>>> +
>>> +#endif
>>
> 

