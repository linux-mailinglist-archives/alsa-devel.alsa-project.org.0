Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D567A17913
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2025 09:13:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B733603A4;
	Tue, 21 Jan 2025 09:13:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B733603A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737447218;
	bh=7KIvSIu5XPPm9lTFj8UjdCcMTW3CkOGWN34+1V85Zzg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ASw9S7KSWBnyAyEzXtnOl9xzEll0S0OQqv2DaTiCMsYhVIGD+EizEsyls4XITo1tX
	 CH+yTc1DCiPPAlJqDQBa4Avzs+JkhRxE/a6IINto4PRbFvPX8UsObV9cBWTSywGsyI
	 ITVkLS3jHFAlLsaUSUlV7N3sEQIglK9SPV9+j9Yk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B0DCF805B2; Tue, 21 Jan 2025 09:13:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF2F9F805BA;
	Tue, 21 Jan 2025 09:13:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6926FF80510; Tue, 14 Jan 2025 10:05:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8F23F80169
	for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2025 10:04:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8F23F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YRT/d/dt
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d9b6b034easo5479868a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 14 Jan 2025 01:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736845496; x=1737450296;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wKly9npKXBUSdy5qiIv5yFK78A+KB2EVLPMob+WSOS4=;
        b=YRT/d/dtXcsiSo2dKmuZczkGHDI+5JcfjjTYsuRXgHXyjGkC2aKBJKTxE1GP5LB/ry
         MfaQjBWBauG38YqBhHCxfZ/og5NPqzOoGbtIUKTKAbrXw45IqUS+GNI/pwCb/vx/v96D
         TMUrFotziz+z44TLitOjXDkV302kljncTWvOvxDHctxf4AAycYzEihIlGFDwuFNAD4CL
         tGf8ONu4brvkcp4ZjSlFq5ksxj0lXM/TW2IlL3wwCK75PZdVw9zJBVGHk/iZMe0JdjSm
         i4zyBel/Rofwe42Gu3rbW0Py75WZdtSbUp4rDTWmx9/i67qxxEdoY9wfFDuofreor9F7
         umHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736845496; x=1737450296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wKly9npKXBUSdy5qiIv5yFK78A+KB2EVLPMob+WSOS4=;
        b=NIQAqhzJLIxOKqTPIM4L9RlmCqzAbdk1ZNecmrpOZIn5Tgi2BWEjAZWav81KVzX2jb
         uKny4JQftEQW4b/4ti9qQ74RfhzBJlf/OaFDlARvjRpj5TvthuKILRS+wtmSGSr17Q9H
         D66mKosXwZQNDekJFQVaKE0Xu+z92G6psqtp/BC6uv1eorLlKepHpOhnBP59zu9gocdV
         +RSFMM/ex9lAdB3RpXMZ5hC3gU9+lbehb5Hko3MJrzA7eiuiEyHgmpG3vQmLGXcgNtVS
         lNPcoom5tcaXAc6ypp+xkn20J4DjqL1SyaAqNuPeaWlHveAqSIXF4jLWREbxyEJ6Wthj
         fKvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+rWKm+IrTisP7XLue08CPq7A3UCdm5WqstZXIL1QJxT7a8vQttHoQGPd9cCgYPwbhO+AtO5Ic2chM@alsa-project.org
X-Gm-Message-State: AOJu0YxroSQXOL2R8u+CVIdhOmgALFbJH5A0+UllG9MEk1uU7RzB6yNo
	gK6erjDRKAcfAi8OS6hcaM0zUrDizu2X5Wv3u80Cv47gQF0to1IY
X-Gm-Gg: ASbGncvK2r1WIXQuL7JLzn6mHvkuzHIoEk1GBjq0sk2kNy+i6XUql7iEu+4RfYb9151
	93lc0nb3QFbkoR9GwH6JhHE6WoPpPXgJUqNhfgAqooJCxgZX5E5rwbcFHsmWV+n/LuusDsmJdx8
	T15EbODpSRs7l9aH/kiNlesqxB2ZL12JN533YTbw5oaZYvq72KDgLKzmGXM49GhN+FaPTGLR85J
	TbO/q9Sz6k2f3QZ2q1SdzrMBmZ/5BfRIEUB4W8pko9u0xFX5u7vtdm/6RdQPhYXvMHTqQ==
X-Google-Smtp-Source: 
 AGHT+IGsoy18wLlENnC1ImY9x1dKRjyISuUw2UI30yDUuaba5fLugh7Il8pnp4l0QaSrrcFcL68orA==
X-Received: by 2002:a17:907:3e9b:b0:aae:d199:6eae with SMTP id
 a640c23a62f3a-ab2ab6a38bbmr2049046366b.14.1736845496046;
        Tue, 14 Jan 2025 01:04:56 -0800 (PST)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-ab2c95b09b2sm607721766b.146.2025.01.14.01.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 01:04:55 -0800 (PST)
Message-ID: <98a19395-7056-48d1-ad89-fb057025f46c@gmail.com>
Date: Tue, 14 Jan 2025 11:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] soc: audio-graph-card2: use correct endpoint when
 getting link parameters
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 tony@atomide.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20241220071126.1066691-1-ivo.g.dimitrov.75@gmail.com>
 <87y0zdsxme.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <87y0zdsxme.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: ivo.g.dimitrov.75@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5IZE5ZITHER2WKEWMSUXTSVEAYBUSWME
X-Message-ID-Hash: 5IZE5ZITHER2WKEWMSUXTSVEAYBUSWME
X-Mailman-Approved-At: Tue, 21 Jan 2025 08:12:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5IZE5ZITHER2WKEWMSUXTSVEAYBUSWME/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Morimoto-san

On 14.01.25 г. 8:44 ч., Kuninori Morimoto wrote:
> 
> Hi Ivaylo
> 
> Sorry for the late review.
> 

And sorry for the noise on my side.

>> We may have multiple links between ports, with each link
>> having different parameters. Currently, no matter the topology,
>> it is always port endpoint 0 that is used when setting parameters.
>>
>> On a complex sound system, like the one found on Motorola droid4,
>> hifi and voice DAIs require differents formats (i2s vs dsp_a)
>> and curently it is impossible to use DT to set that.
>>   
>> Implementing the change leads to partially dropping of at least
>> 0dedbde5062d (ASoC: cpcap: Implement set_tdm_slot for voice call
>> support), as core does most of what is needed to configure voice DAI.
>>
>> We (on Maemo Leste ) use the patch (along with few others) to have
>> voice calls working properly on d4 through UCM.
>>
>> The patch is for linux 6.6, I want to know whether the
>> approach would be accepted before sending a proper patch for
>> current master.
>>
>> the original commit message follows:
>>
>> When link parameters are parsed, it is always endpoint@0 that is used and
>> parameters set to other endpoints are ignored.
>>
>> Fix that by using endpoint that is set in DT when parsing link parameters.
>>
>> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
>> ---
> (snip)
>> @@ -684,7 +683,6 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
>>   {
>>   	struct device_node *ep = port_to_endpoint(lnk);
>>   	struct device_node *rep = of_graph_get_remote_endpoint(ep);
>> -	struct device_node *rport = of_graph_get_remote_port(ep);
>>   	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
>>   	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
>>   	int is_cpu = asoc_graph_is_ports0(lnk);
>> @@ -718,7 +716,7 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
>>   		dai_link->dynamic		= 1;
>>   		dai_link->dpcm_merged_format	= 1;
>>   
>> -		ret = graph_parse_node(priv, GRAPH_DPCM, rport, li, 1);
>> +		ret = graph_parse_node(priv, GRAPH_DPCM, rep, li, 1);
> 
> Please correct me if I was misunderstanding
> Is the main issue "remote" side endpoint ?
> 
> You want to parse "remote" endpoint (= rep) directly, but the function
> requests "port" (= rport), and it will use endpoint0 ( != rep).
> Is this the main issue you want to fix ?
> 

Yes, it is the 'remote' side endpoint, currently it is always remote 
endpoint0 that is used, because when you get 'port', it is endpoint0 of 
that port that core uses.

See:
https://github.com/maemo-leste/droid4-linux/blob/maemo-6.6.y/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi#L91

https://github.com/maemo-leste/droid4-linux/blob/maemo-6.6.y/arch/arm/boot/dts/ti/omap/motorola-mapphone-handset.dtsi#L65

and

https://github.com/maemo-leste/droid4-linux/blob/maemo-6.6.y/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi#L476

as an example DTS that is using multiple endpoints per port and also

https://lkml.org/lkml/2018/3/27/1225

for what audio wiring looks like.

For voice calls the device does not use CPU, but we have C2C link 
between modem and cpcap instead. However, we must correctly set DAI 
format on cpcap side for for that link to work properly.

General speaking, we might have multiple endpoints connected for a 
single port and when getting "link properties" I think we should use 
remote endpoint that is linked to local endpoint, not always remote 
endpoint0.

If it is still not clear what $subject patch tries to achieve, please 
LMK and I'll try to elaborate even more, if possible.

Also, if you think core allows such 'routing' to be implemented without 
the $subject functionality, please elaborate. I spent a good amount of 
time back then with no luck.

Thanks and regards,
Ivo
