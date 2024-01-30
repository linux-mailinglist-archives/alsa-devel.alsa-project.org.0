Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 218F38424F4
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 13:31:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CC29E76;
	Tue, 30 Jan 2024 13:31:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CC29E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706617906;
	bh=l826wPUAILi9YgufJFNa+J4Z/0585jDJ/lTW4dijRRQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=YIt/65Yh/A5Z+yDj7f9a8Bd0mvVNbh882R1dwE12Ip1FmkHbjQRRnktUOzuf9eMW4
	 xPXkzLTBPKqFkemmLEr/uMS3S3S4Mbwkv//4MAfSvZjH2yv8mEtSpX8sfNVVX/Q5PX
	 SyBP8b0U5Qyodu8DK/QqW2fhNr5odKOg/xJuZqpk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89610F8059F; Tue, 30 Jan 2024 13:31:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ED90F8057F;
	Tue, 30 Jan 2024 13:31:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB30EF8055C; Tue, 30 Jan 2024 13:31:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8503F8020D
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 13:30:55 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D6B2FD0A;
	Tue, 30 Jan 2024 13:30:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D6B2FD0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1706617854; bh=0WUznSaQojnzXAhrh105tzm2EGdLAb467aatsjdB2io=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=HxlyVw2kXcc0d5iuX+4Xfa2uXnpEYdzNPbHrhzJVxP/M7OKIcUFX7kj17tQJK2+kU
	 ZMuVAMaqLv7zDBCt2fsLS0s5vxk7+VP1hdehrpK8wsb848fQT4EPiX8OKmyDVrRz54
	 i93zypTEcflWtc7MiKG9C2sa4BraTjJPeaRr/8DM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 30 Jan 2024 13:30:52 +0100 (CET)
Message-ID: <8567ca1f-9985-4370-b821-9fa70cd812e6@perex.cz>
Date: Tue, 30 Jan 2024 13:30:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ALSA-LIB: Support for format IEC958_SUBFRAME_LE in the plug
 plugin?
Content-Language: en-US
To: Pavel Hofman <pavel.hofman@ivitera.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <81b0be0a-5ab7-db91-21cb-0c59a55291e9@ivitera.com>
 <14018498-75e9-28c4-cfe3-a958ede64d0e@ivitera.com>
 <79934c5e-25b2-4d71-a426-c05f9a4e6b40@perex.cz>
 <3a16fc87-6b65-048a-b9cd-1fb0f308e4fb@ivitera.com>
From: Jaroslav Kysela <perex@perex.cz>
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <3a16fc87-6b65-048a-b9cd-1fb0f308e4fb@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B6SXWWOYMZRK235ROBQQCHWAYDUJMRDM
X-Message-ID-Hash: B6SXWWOYMZRK235ROBQQCHWAYDUJMRDM
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6SXWWOYMZRK235ROBQQCHWAYDUJMRDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29. 01. 24 18:55, Pavel Hofman wrote:
> 
> Dne 29. 01. 24 v 18:27 Jaroslav Kysela napsal(a):
>> On 29. 01. 24 18:06, Pavel Hofman wrote:
> 
>>>>
>>>> I was wondering if it made sense to add support for the IEC958 formats
>>>> (using the iec958 plugin methods) to the plug plugin.
>>>>
>>>> It may be complicated with the hdmi_mode hint though, I do not know if
>>>> there is any API to recognize HDMI vs. SPDIF. Maybe a different format
>>>> specifically for HDMI could have been perhaps useful but it may be too
>>>> late for that.
>>>>
>>>> Thank you very much for consideration.
>>>>
>>>
>>>
>>> Perhaps something trivial like this could do (header file changes not
>>> included):
>>>
>>> ===================================================================
>>> diff --git a/src/pcm/pcm_plug.c b/src/pcm/pcm_plug.c
>>> --- a/src/pcm/pcm_plug.c    (revision
>>> ffed4f342678c31bf0b9edfe184be5f3de41603a)
>>> +++ b/src/pcm/pcm_plug.c    (date 1706546414549)
>>> @@ -490,6 +490,14 @@
>>>     }
>>>     #endif
>>>
>>> +int snd_pcm_plug_generic_iec958_open(snd_pcm_t **pcmp, const char
>>> *name, snd_pcm_format_t sformat, snd_pcm_t *slave, int close_slave) {
>>> +    unsigned char preamble_vals[3] = {
>>> +            0x08, 0x02, 0x04 /* Z, X, Y */
>>> +        };
>>> +    int hdmi_mode; // ????
>>> +    return snd_pcm_iec958_open(pcmp, name, sformat, slave, close_slave,
>>> NULL, preamble_vals, hdmi_mode);
>>> +}
>>> +
>>>     static int snd_pcm_plug_change_format(snd_pcm_t *pcm, snd_pcm_t **new,
>>> snd_pcm_plug_params_t *clt, snd_pcm_plug_params_t *slv)
>>>     {
>>>         snd_pcm_plug_t *plug = pcm->private_data;
>>> @@ -567,6 +575,10 @@
>>>                 f = snd_pcm_adpcm_open;
>>>                 break;
>>>     #endif
>>> +        case SND_PCM_FORMAT_IEC958_SUBFRAME_LE:
>>> +        case SND_PCM_FORMAT_IEC958_SUBFRAME_BE:
>>> +            f = pcm_snd_general_iec958_open;
>>> +            break;
>>>             default:
>>>                 return -EINVAL;
>>>             }
>>>
>>> ===================================================================
>>>
>>>
>>> IMO preamble_vals could be left at the same default as defined in
>>> pcm_iec958.c:_snd_pcm_iec958_open().
>>>
>>> But the correct hdmi_mode parameter is necessary. Alsa configs specify
>>> it explicitly (like vc4-hdmi.conf). But the plug plugin has no such
>>> information. Adding a parameter like that to the plug plugin would
>>> cancel the effect of this change (to support hardcoded plughw devices
>>> e.g. in java, with no support for custom PCM devices).
>>>
>>> Maybe an environment variable could be defined for the whole application
>>> which could be used for the hdmi_mode, an ugly hack though...
>>>
>>> Thanks a lot for any hints and suggestions.
>>
>> It looks like a way to go. The hdmi_mode can be set using ALSA
>> configuration use snd_config_search (with global config - snd_config
>> pointer) and snd_config_get_bool functions for that. The variable may be
>> named like 'defaults.pcm.plug.iec958.hdmi_mode' or so (see alsa.conf).
> 
> That's interesting. IIUC such parameter would globally switch all plugs
> instances to the hdmi_mode. Would a user-based ~/.asoundrc with such
> variable be applied for the hard-coded plughw:XX device? Maybe it would
> be enough for most use cases, eliminating the need for an app-specific
> environment variable.
> 
> Or maybe a prioritized sequence getenv('ALSA_PCM_PLUG_IEC958_HDMI_MODE')
> -> snd_config_search('defaults.pcm.plug.iec958.hdmi_mode') could be used.
We usually don't use getenv hacks for alsa-lib features. The global 
configuration path can be redirected using ALSA_CONFIG_DIR and per user 
(~/.asoundrc or $XDG_CONFIG_HOME/alsa/asoundrc) and per card configurations 
(/var/lib/alsa/card#.conf.d) are also loaded from the global alsa.conf file.

Perphaps, the iec958 plug code may include card number / card driver name to 
the configuration tree lookup - like 'defaults.pcm.plug.iec958.0.hdmi_mode' or 
'defaults.pcm.plug.iec958.vc4-hdmi.hdmi_mode' . With this extension, this 
value can be set in global src/conf/cards/vc4-hdmi.conf for this hw.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

