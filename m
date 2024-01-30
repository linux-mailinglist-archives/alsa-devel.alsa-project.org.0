Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DB8842C8D
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 20:23:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 435C8EC0;
	Tue, 30 Jan 2024 20:23:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 435C8EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706642613;
	bh=hjF91dW6JExC/JTkaEo2l7lPoOTvxOpsD8xOx1MMj0E=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sI1ZCiIgP2UVo7hiiTo0Fx/Ry53Qek3jURSMipsKG4I2j7isiWbutgC4Fz/tokjHm
	 rBEGRsvduyPJ+incBKwnTZu8QF1LtnxChNlB+aSnUiwb60xNx2fNCFZgdqDHGSjPHq
	 wf2arVasETazHZMkFfkmi1X0MwXcBdp9/G254R9g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86133F80578; Tue, 30 Jan 2024 20:23:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A389BF805AA;
	Tue, 30 Jan 2024 20:23:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5338DF8055C; Tue, 30 Jan 2024 20:22:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94968F8020D
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 20:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94968F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=JoPcuj4A;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=JoPcuj4A
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 8C9F8103D3;
	Tue, 30 Jan 2024 20:22:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1706642567; bh=hjF91dW6JExC/JTkaEo2l7lPoOTvxOpsD8xOx1MMj0E=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=JoPcuj4Akv11wyKvhl0p3vq4pGubbpZxQb8u0MEilQJKwJv1B/9AszSxFNq3fWf8b
	 7scViq9LgwPnuZb1PGr8En/NQa9nke9FpTD1k0ZhX/ptKWrQRMKeRuIPiT3oyhe0sN
	 sv1hTdX2a2VFZ2kG6KdKgDiIphgugv7ENTyOi3VM=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1eOP56gk1PsX; Tue, 30 Jan 2024 20:22:47 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id E20AF11815;
	Tue, 30 Jan 2024 20:22:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1706642567; bh=hjF91dW6JExC/JTkaEo2l7lPoOTvxOpsD8xOx1MMj0E=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=JoPcuj4Akv11wyKvhl0p3vq4pGubbpZxQb8u0MEilQJKwJv1B/9AszSxFNq3fWf8b
	 7scViq9LgwPnuZb1PGr8En/NQa9nke9FpTD1k0ZhX/ptKWrQRMKeRuIPiT3oyhe0sN
	 sv1hTdX2a2VFZ2kG6KdKgDiIphgugv7ENTyOi3VM=
Message-ID: <1a852449-cd3e-acc0-57ec-f6163e82c620@ivitera.com>
Date: Tue, 30 Jan 2024 20:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: ALSA-LIB: Support for format IEC958_SUBFRAME_LE in the plug
 plugin?
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <81b0be0a-5ab7-db91-21cb-0c59a55291e9@ivitera.com>
 <14018498-75e9-28c4-cfe3-a958ede64d0e@ivitera.com>
 <79934c5e-25b2-4d71-a426-c05f9a4e6b40@perex.cz>
 <3a16fc87-6b65-048a-b9cd-1fb0f308e4fb@ivitera.com>
 <8567ca1f-9985-4370-b821-9fa70cd812e6@perex.cz>
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <8567ca1f-9985-4370-b821-9fa70cd812e6@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OMV6FYVEULZLJDNMCF3WC3UQR7D3PBPN
X-Message-ID-Hash: OMV6FYVEULZLJDNMCF3WC3UQR7D3PBPN
X-MailFrom: pavel.hofman@ivitera.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OMV6FYVEULZLJDNMCF3WC3UQR7D3PBPN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Dne 30. 01. 24 v 13:30 Jaroslav Kysela napsal(a):
> On 29. 01. 24 18:55, Pavel Hofman wrote:
>>
>> Dne 29. 01. 24 v 18:27 Jaroslav Kysela napsal(a):
>>> On 29. 01. 24 18:06, Pavel Hofman wrote:
>>
>>>>>
>>>>> I was wondering if it made sense to add support for the IEC958 formats
>>>>> (using the iec958 plugin methods) to the plug plugin.
>>>>>
>>>>> It may be complicated with the hdmi_mode hint though, I do not know if
>>>>> there is any API to recognize HDMI vs. SPDIF. Maybe a different format
>>>>> specifically for HDMI could have been perhaps useful but it may be too
>>>>> late for that.
>>>>>
>>>>> Thank you very much for consideration.
>>>>>
>>>>
>>>>
>>>> Perhaps something trivial like this could do (header file changes not
>>>> included):
>>>>
>>>> ===================================================================
>>>> diff --git a/src/pcm/pcm_plug.c b/src/pcm/pcm_plug.c
>>>> --- a/src/pcm/pcm_plug.c    (revision
>>>> ffed4f342678c31bf0b9edfe184be5f3de41603a)
>>>> +++ b/src/pcm/pcm_plug.c    (date 1706546414549)
>>>> @@ -490,6 +490,14 @@
>>>>     }
>>>>     #endif
>>>>
>>>> +int snd_pcm_plug_generic_iec958_open(snd_pcm_t **pcmp, const char
>>>> *name, snd_pcm_format_t sformat, snd_pcm_t *slave, int close_slave) {
>>>> +    unsigned char preamble_vals[3] = {
>>>> +            0x08, 0x02, 0x04 /* Z, X, Y */
>>>> +        };
>>>> +    int hdmi_mode; // ????
>>>> +    return snd_pcm_iec958_open(pcmp, name, sformat, slave, 
>>>> close_slave,
>>>> NULL, preamble_vals, hdmi_mode);
>>>> +}
>>>> +
>>>>     static int snd_pcm_plug_change_format(snd_pcm_t *pcm, snd_pcm_t 
>>>> **new,
>>>> snd_pcm_plug_params_t *clt, snd_pcm_plug_params_t *slv)
>>>>     {
>>>>         snd_pcm_plug_t *plug = pcm->private_data;
>>>> @@ -567,6 +575,10 @@
>>>>                 f = snd_pcm_adpcm_open;
>>>>                 break;
>>>>     #endif
>>>> +        case SND_PCM_FORMAT_IEC958_SUBFRAME_LE:
>>>> +        case SND_PCM_FORMAT_IEC958_SUBFRAME_BE:
>>>> +            f = pcm_snd_general_iec958_open;
>>>> +            break;
>>>>             default:
>>>>                 return -EINVAL;
>>>>             }
>>>>
>>>> ===================================================================
>>>>
>>>>
>>>> IMO preamble_vals could be left at the same default as defined in
>>>> pcm_iec958.c:_snd_pcm_iec958_open().
>>>>
>>>> But the correct hdmi_mode parameter is necessary. Alsa configs specify
>>>> it explicitly (like vc4-hdmi.conf). But the plug plugin has no such
>>>> information. Adding a parameter like that to the plug plugin would
>>>> cancel the effect of this change (to support hardcoded plughw devices
>>>> e.g. in java, with no support for custom PCM devices).
>>>>
>>>> Maybe an environment variable could be defined for the whole 
>>>> application
>>>> which could be used for the hdmi_mode, an ugly hack though...
>>>>
>>>> Thanks a lot for any hints and suggestions.
>>>
>>> It looks like a way to go. The hdmi_mode can be set using ALSA
>>> configuration use snd_config_search (with global config - snd_config
>>> pointer) and snd_config_get_bool functions for that. The variable may be
>>> named like 'defaults.pcm.plug.iec958.hdmi_mode' or so (see alsa.conf).
>>
>> That's interesting. IIUC such parameter would globally switch all plugs
>> instances to the hdmi_mode. Would a user-based ~/.asoundrc with such
>> variable be applied for the hard-coded plughw:XX device? Maybe it would
>> be enough for most use cases, eliminating the need for an app-specific
>> environment variable.
>>
>> Or maybe a prioritized sequence getenv('ALSA_PCM_PLUG_IEC958_HDMI_MODE')
>> -> snd_config_search('defaults.pcm.plug.iec958.hdmi_mode') could be used.
> We usually don't use getenv hacks for alsa-lib features. The global 
> configuration path can be redirected using ALSA_CONFIG_DIR and per user 
> (~/.asoundrc or $XDG_CONFIG_HOME/alsa/asoundrc) and per card 
> configurations (/var/lib/alsa/card#.conf.d) are also loaded from the 
> global alsa.conf file.
> 
> Perphaps, the iec958 plug code may include card number / card driver 
> name to the configuration tree lookup - like 
> 'defaults.pcm.plug.iec958.0.hdmi_mode' or 
> 'defaults.pcm.plug.iec958.vc4-hdmi.hdmi_mode' . With this extension, 
> this value can be set in global src/conf/cards/vc4-hdmi.conf for this hw.
> 
Actually, looking at pcm_iec958.c and the commit which introduced the 
hdmi_mode param I am not sure the the hdmi_mode is of any value for the 
plug plugin.

IIUC the hdmi_mode value gets used only if the status is 
IEC958_AES0_NONAUDIO:

int single_stream = iec->hdmi_mode &&
			    (iec->status[0] & IEC958_AES0_NONAUDIO) &&
			    (channels == 8);

But the plug plugin would pass NULL as status_bits which in 
snd_pcm_iec958_open will be replaced with default_status_bits:

static const unsigned char default_status_bits[] = {
		IEC958_AES0_CON_EMPHASIS_NONE,
		IEC958_AES1_CON_ORIGINAL | IEC958_AES1_CON_PCM_CODER,
		0,
		IEC958_AES3_CON_FS_NOTID, /* will be set in hwparams */
		IEC958_AES4_CON_WORDLEN_NOTID /* will be set in hwparams */
	};

Logically no IEC958_AES0_NONAUDIO bit is set in the default status bits.

IMO we can safely pass hdmi_mode=false to snd_pcm_iec958_open because 
using plug for non-audio stream would not make sense anyway.
