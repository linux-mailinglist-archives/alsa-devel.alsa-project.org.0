Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB3D848E3A
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Feb 2024 15:00:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2330814DD;
	Sun,  4 Feb 2024 14:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2330814DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707055209;
	bh=ZJby2nolU0ik7f3aXxYcEEigqdayGRiUNbtpnIv1eo4=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=DyxnQOR8fix8pJlkJaBeakVriNIzabXYXTY4lzUjxjenEkNuYhGw4rJqh9V6I7UtQ
	 ELAWocrglVaNxeuF6nrgMG1hbhSGiPWmXRgKR5dP5QwLBZfZRGIu0XpW94DFJRgSdo
	 7T5Gprmdvql8M5EaaHCng474vLJM/5OzQJRAIQ1k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FE3BF80567; Sun,  4 Feb 2024 14:59:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8C6FF805A0;
	Sun,  4 Feb 2024 14:59:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24BA8F801EB; Sun,  4 Feb 2024 14:59:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB529F80153
	for <alsa-devel@alsa-project.org>; Sun,  4 Feb 2024 14:59:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB529F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=UD1j7iXP;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=UD1j7iXP
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 97764156A3C;
	Sun,  4 Feb 2024 14:59:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1707055159; bh=ZJby2nolU0ik7f3aXxYcEEigqdayGRiUNbtpnIv1eo4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=UD1j7iXPq5hOKsluS0V4J6YEVjw0KhD+8evbdsclWyUBjgETLiuYbOYJuPSfFk80U
	 Kkr8y74uNGFsRkLLK7cIdGRPXlS7hvKW+5pn83QbkMPhRv6iB3TvLQ9WRQoevd0vah
	 mHOPWOxTMGvuzc9lEBXpCsybSfy9M8sAVag6ofWo=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fG4j1802Fb7X; Sun,  4 Feb 2024 14:59:19 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 01508156F90;
	Sun,  4 Feb 2024 14:59:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1707055159; bh=ZJby2nolU0ik7f3aXxYcEEigqdayGRiUNbtpnIv1eo4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=UD1j7iXPq5hOKsluS0V4J6YEVjw0KhD+8evbdsclWyUBjgETLiuYbOYJuPSfFk80U
	 Kkr8y74uNGFsRkLLK7cIdGRPXlS7hvKW+5pn83QbkMPhRv6iB3TvLQ9WRQoevd0vah
	 mHOPWOxTMGvuzc9lEBXpCsybSfy9M8sAVag6ofWo=
Message-ID: <25d7fac4-a7c6-4bbd-ef8a-7eefbcf03784@ivitera.com>
Date: Sun, 4 Feb 2024 14:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: ALSA-LIB: Support for format IEC958_SUBFRAME_LE in the plug
 plugin?
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: Jaroslav Kysela <perex@perex.cz>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <81b0be0a-5ab7-db91-21cb-0c59a55291e9@ivitera.com>
 <14018498-75e9-28c4-cfe3-a958ede64d0e@ivitera.com>
 <79934c5e-25b2-4d71-a426-c05f9a4e6b40@perex.cz>
 <3a16fc87-6b65-048a-b9cd-1fb0f308e4fb@ivitera.com>
 <8567ca1f-9985-4370-b821-9fa70cd812e6@perex.cz>
 <1a852449-cd3e-acc0-57ec-f6163e82c620@ivitera.com>
 <5b4afa93-5ab9-2ff1-c440-d05c66a4cef5@ivitera.com>
Content-Language: en-US
In-Reply-To: <5b4afa93-5ab9-2ff1-c440-d05c66a4cef5@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OAXDEI73VXAQ3VNBGTFTSK3LUSP2T3A6
X-Message-ID-Hash: OAXDEI73VXAQ3VNBGTFTSK3LUSP2T3A6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OAXDEI73VXAQ3VNBGTFTSK3LUSP2T3A6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



Dne 02. 02. 24 v 9:00 Pavel Hofman napsal(a):
> 
> Dne 30. 01. 24 v 20:22 Pavel Hofman napsal(a):
>>
>> Dne 30. 01. 24 v 13:30 Jaroslav Kysela napsal(a):
>>>>>
>>>>> It looks like a way to go. The hdmi_mode can be set using ALSA
>>>>> configuration use snd_config_search (with global config - snd_config
>>>>> pointer) and snd_config_get_bool functions for that. The variable 
>>>>> may be
>>>>> named like 'defaults.pcm.plug.iec958.hdmi_mode' or so (see alsa.conf).
>>>>
>>>> That's interesting. IIUC such parameter would globally switch all plugs
>>>> instances to the hdmi_mode. Would a user-based ~/.asoundrc with such
>>>> variable be applied for the hard-coded plughw:XX device? Maybe it would
>>>> be enough for most use cases, eliminating the need for an app-specific
>>>> environment variable.
>>>>
>>>> Or maybe a prioritized sequence 
>>>> getenv('ALSA_PCM_PLUG_IEC958_HDMI_MODE')
>>>> -> snd_config_search('defaults.pcm.plug.iec958.hdmi_mode') could be 
>>>> used.
>>> We usually don't use getenv hacks for alsa-lib features. The global 
>>> configuration path can be redirected using ALSA_CONFIG_DIR and per 
>>> user (~/.asoundrc or $XDG_CONFIG_HOME/alsa/asoundrc) and per card 
>>> configurations (/var/lib/alsa/card#.conf.d) are also loaded from the 
>>> global alsa.conf file.
>>>
>>> Perphaps, the iec958 plug code may include card number / card driver 
>>> name to the configuration tree lookup - like 
>>> 'defaults.pcm.plug.iec958.0.hdmi_mode' or 
>>> 'defaults.pcm.plug.iec958.vc4-hdmi.hdmi_mode' . With this extension, 
>>> this value can be set in global src/conf/cards/vc4-hdmi.conf for this 
>>> hw.
>>>
>> Actually, looking at pcm_iec958.c and the commit which introduced the 
>> hdmi_mode param I am not sure the the hdmi_mode is of any value for 
>> the plug plugin.
>>
>> IIUC the hdmi_mode value gets used only if the status is 
>> IEC958_AES0_NONAUDIO:
>>
>> int single_stream = iec->hdmi_mode &&
>>                  (iec->status[0] & IEC958_AES0_NONAUDIO) &&
>>                  (channels == 8);
>>
>> But the plug plugin would pass NULL as status_bits which in 
>> snd_pcm_iec958_open will be replaced with default_status_bits:
>>
>> static const unsigned char default_status_bits[] = {
>>          IEC958_AES0_CON_EMPHASIS_NONE,
>>          IEC958_AES1_CON_ORIGINAL | IEC958_AES1_CON_PCM_CODER,
>>          0,
>>          IEC958_AES3_CON_FS_NOTID, /* will be set in hwparams */
>>          IEC958_AES4_CON_WORDLEN_NOTID /* will be set in hwparams */
>>      };
>>
>> Logically no IEC958_AES0_NONAUDIO bit is set in the default status bits.
>>
>> IMO we can safely pass hdmi_mode=false to snd_pcm_iec958_open because 
>> using plug for non-audio stream would not make sense anyway.
> 
> 
> A patch related to the conversion could look like this, IMO.
> 
> ===================================================================
> diff --git a/src/pcm/pcm_plug.c b/src/pcm/pcm_plug.c
> --- a/src/pcm/pcm_plug.c    (revision 
> ffed4f342678c31bf0b9edfe184be5f3de41603a)
> +++ b/src/pcm/pcm_plug.c    (date 1706857992580)
> @@ -490,6 +490,20 @@
>   }
>   #endif
> 
> +#ifdef BUILD_PCM_PLUGIN_IEC958
> +static int snd_pcm_plug_iec958_open(snd_pcm_t **pcmp, const char *name, 
> snd_pcm_format_t sformat, snd_pcm_t *slave, int close_slave)
> +{
> +    return snd_pcm_iec958_open(pcmp, name, sformat, slave, close_slave,
> +        /* using default status bits defined in the iec958 plugin*/
> +        NULL,
> +        /* default preamble values as used in the iec958 plugin */
> +        {0x08, 0x02, 0x04 /* Z, X, Y */},
> +        /* hdmi_mode=0 because it is applied only for 
> IEC958_AES0_NONAUDIO which is not in the default status bits */
> +        0
> +    );
> +}
> +#endif
> +
>   static int snd_pcm_plug_change_format(snd_pcm_t *pcm, snd_pcm_t **new, 
> snd_pcm_plug_params_t *clt, snd_pcm_plug_params_t *slv)
>   {
>       snd_pcm_plug_t *plug = pcm->private_data;
> @@ -565,6 +579,12 @@
>   #ifdef BUILD_PCM_PLUGIN_ADPCM
>           case SND_PCM_FORMAT_IMA_ADPCM:
>               f = snd_pcm_adpcm_open;
> +            break;
> +#endif
> +#ifdef BUILD_PCM_PLUGIN_IEC958
> +        case SND_PCM_FORMAT_IEC958_SUBFRAME_LE:
> +        case SND_PCM_FORMAT_IEC958_SUBFRAME_BE:
> +            f = snd_pcm_plug_iec958_open;
>               break;
>   #endif
>           default:
> 
> ===================================================================
> 
> 
> Unfortunately I am afraid I do not understand fully the code in 
> snd_pcm_plug_hw_refine_schange which calls method 
> snd_pcm_plug_slave_format where the IEC958 formats should also be checked.
> 

I am trying to understand the code logic in 
snd_pcm_plug_hw_refine_cchange and snd_pcm_plug_hw_refine_schange as 
there are no comments at all, to no avail.

Please what is the meaning of local variable f in this snippet of 
snd_pcm_plug_hw_refine_cchange 
https://github.com/alsa-project/alsa-lib/blob/2a736a0d2543f206fd2653aaae8a08a4c42eb917/src/pcm/pcm_plug.c#L909-L921 
?

for (format = 0; format <= SND_PCM_FORMAT_LAST; format++) {
	snd_pcm_format_t f;
	if (!snd_pcm_format_mask_test(format_mask, format))
		continue;
	if (snd_pcm_format_mask_test(sformat_mask, format))
		f = format;
	else {
		f = snd_pcm_plug_slave_format(format, sformat_mask);
		if (f == SND_PCM_FORMAT_UNKNOWN)
			continue;
	}
	snd_pcm_format_mask_set(&fmt_mask, format);
}

The snd_pcm_plug_hw_refine_schange method sets the f to the fmt_mask in 
https://github.com/alsa-project/alsa-lib/blob/2a736a0d2543f206fd2653aaae8a08a4c42eb917/src/pcm/pcm_plug.c#L831 
, but not in 
https://github.com/alsa-project/alsa-lib/blob/2a736a0d2543f206fd2653aaae8a08a4c42eb917/src/pcm/pcm_plug.c#L920

Please what is the meaning/contract of the method 
snd_pcm_plug_slave_format 
https://github.com/alsa-project/alsa-lib/blob/2a736a0d2543f206fd2653aaae8a08a4c42eb917/src/pcm/pcm_plug.c#L252 
? What is the relation between input format and output format?

Thanks a lot in advance.

