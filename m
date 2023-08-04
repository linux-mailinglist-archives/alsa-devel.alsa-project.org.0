Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DFB770411
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 17:09:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60415208;
	Fri,  4 Aug 2023 17:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60415208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691161782;
	bh=FEv4/f8R/JcxvIPO07oJiKVXawrVOxs2teBZIg+tyn4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j3gwjdU8GTrrAx6eAgR4cDie0JmwNFnmiFn7ZsAP8nprMijKumeFtLQGnufAr3PQY
	 oEINQDJ9vLuDSvvSYeqSuSIjmD8n3Z5I6bx7cDAutqvKJ+wlWQ/4a+/EY8PKGGXgHK
	 JT/6SrTjIuj6IQkPRgVOJoEAXj/QhsBQZRjloTLQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AC67F801D5; Fri,  4 Aug 2023 17:08:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 427A0F801D5;
	Fri,  4 Aug 2023 17:08:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47B85F8025A; Fri,  4 Aug 2023 17:08:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07164F80087
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 17:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07164F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=an8n4MCg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691161704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6X/7snxgZgykq97yNNs8/jRlzgmpYOmrkzvNpCxfo2M=;
	b=an8n4MCgKij6LMHx7VX7UYRlcAo13hZdktdEMCScnctnye7bWO+rZTzXbmI5qZ9TpL2x/w
	EVj9B0ZxWlzs6FLb9CS4jONPirgBUUrGz0UYsEfDpRHecQPT2eX8nuMCfJ9cO+lAUjH3aq
	f2m3JQBaNGuX5TtSZO2bjyVzED6byZQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-VtsvaFH8MUepFaidv_IkmA-1; Fri, 04 Aug 2023 11:08:23 -0400
X-MC-Unique: VtsvaFH8MUepFaidv_IkmA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4fe3e3472bcso2076903e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 04 Aug 2023 08:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691161701; x=1691766501;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6X/7snxgZgykq97yNNs8/jRlzgmpYOmrkzvNpCxfo2M=;
        b=IrLf69JXssAS629tkcTN8gDjzn7GdPKPIU04LTQrL+4m+eZqG8jbrRX0sjArvp61OY
         v1b7DsBuDlGpr10IgITRCNDnz4k9qEUGX64P1VvQFg1EqTsiYKOZdzJwNMG6+4JhAk4b
         1mGA2PAKQjCqjQekKeM8KSSkd+bhKqjqfN389yH8GwPWuTaMcMliVlXhtjQDPXUVKo0X
         Bn9gymph4Gct+gnGfNMi4J4N4b+QenLBGxgku46uPNmdPTgo/jmn+xFOXYhMIppD3yHy
         IA7sB33XJUjscP1JojCHJma5/FwWtNWnftCtjqw9P6wxbDbjRgCTCNBiJ3gQXaarIkS4
         x/oQ==
X-Gm-Message-State: AOJu0YwH7fzXrJLrmUoxos/OPLObYTDM0owFV7kQ0PnwGwRcqtTLFBSY
	E0ae8yu1J2B23lEXsIK8a7Vpyp6QeWXeo90IOD+i5QetWy1aTszEveuCG0/lfIzzaCatc4Q728w
	UKJJl3+NdffeHTv8Y6f6vLps=
X-Received: by 2002:a19:6457:0:b0:4f9:556b:93c4 with SMTP id
 b23-20020a196457000000b004f9556b93c4mr1499374lfj.31.1691161701583;
        Fri, 04 Aug 2023 08:08:21 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IHeCRnaVGIfMMc7rnJtDSIReGAaszllYn45uCQc69UVzlLsUSmFn66MvIFmE/4YQDKCufCarw==
X-Received: by 2002:a19:6457:0:b0:4f9:556b:93c4 with SMTP id
 b23-20020a196457000000b004f9556b93c4mr1499348lfj.31.1691161701167;
        Fri, 04 Aug 2023 08:08:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id
 d2-20020a056402516200b0052275deb475sm1361705ede.23.2023.08.04.08.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 08:08:20 -0700 (PDT)
Message-ID: <9baef866-07e4-ddea-c495-bb5f924f5ab9@redhat.com>
Date: Fri, 4 Aug 2023 17:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: lower "no backend DAIs enabled for ... Port" log
 severity
To: Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
References: <20230804132628.302385-1-hdegoede@redhat.com>
 <63eec3cf-ebba-a366-a66b-34daf76bc0f2@linux.intel.com>
 <878raqq36t.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <878raqq36t.wl-tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: R2KLPE6IMJ2JX3FIYQO6DB7RMU2J4TR5
X-Message-ID-Hash: R2KLPE6IMJ2JX3FIYQO6DB7RMU2J4TR5
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2KLPE6IMJ2JX3FIYQO6DB7RMU2J4TR5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 8/4/23 16:42, Takashi Iwai wrote:
> On Fri, 04 Aug 2023 16:06:45 +0200,
> Pierre-Louis Bossart wrote:
>>
>>
>>
>> On 8/4/23 08:26, Hans de Goede wrote:
>>> If SNDRV_PCM_IOCTL_PREPARE is called when  the mixer settings linking
>>> frontend and backend have not been setup yet this results in
>>> e.g. the following errors getting logged:
>>>
>>> [   43.244549]  Baytrail Audio Port: ASoC: no backend DAIs enabled for Baytrail Audio Port
>>> [   43.244744]  Baytrail Audio Port: ASoC: error at dpcm_fe_dai_prepare on Baytrail Audio Port: -22
>>>
>>> pipewire triggers this leading to 96 repeats of this in the log
>>> after the user has logged into a GNOME session.
>>>
>>> IMHO userspace should not be able to get the kernel to spam dmesg like
>>> this. Lower the severity of the "no backend DAIs enabled" log message
>>> for dai-s with the dynamic flag set to avoid this.
>>>
>>> And also changes _soc_pcm_ret() to not log for -EINVAL errors, to fix
>>> the other error. Userspace passing wrong parameters should not lead
>>> to dmesg messages.
>>
>> Maybe, but it's a questionable flow if pipewire tries to open stuff
>> without the mixer values set-up. Is there something done about this?

I'm working with the pipewire folks to see if we can fix this on
pipewire's side too:

Link: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3407

> I think it's an oft-seen problem when user runs the system without
> installing a proper UCM profile.
> 
>> The reason why I am pushing back is that we had a similar issue with
>> HDaudio where HDMI/DP PCM devices were opened without checking if the
>> jack was connected.
>>
>> It really makes no sense for userspace to try and open devices that are
>> known to be problematic. We can push kernel error logs below the rug, it
>> doesn't make the programming flows better.
> 
> Downgrading the message also hides to show what's wrong there.
> Although the message doesn't indicate how to fix the problem, no
> message would make debug harder.
> 
> So in general I agree that it's annoying and it should be fixed, but
> hiding all as default can be bad, too.  Maybe we can introduce a
> counter and shut out after three strikes?

Right, this also happens with unsupported codecs (either unsupported in the kernel or no UCM profile available yet). So making this less "chatty" would be good.

I would prefer to just go for only log this once rather then
three strikes though, then we can simply use 'dev_err_once()'
for this.

Regards,

Hans



