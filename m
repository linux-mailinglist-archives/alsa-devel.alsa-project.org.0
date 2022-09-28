Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FDA5EE1F5
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 18:35:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A637D84D;
	Wed, 28 Sep 2022 18:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A637D84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664382901;
	bh=+6qPnwVQ5MY5VaL8SZerTDSbSKDbC5VNl3S1+FkD8wE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qisYYdNBUZDMf7N67SICvScabSK2h/vXYAc0FxlgTxvr8aDTRmlPIqNLn/FpThRmU
	 ajDOLa6npEM77lK6SW+/NJnAWxOhw2HhOsf/WJaewcr2IacIOmUvgiRoumbrUa5F3a
	 mjO8U1V3V2NTFT+QqakCxMEOTkD54NUQKqs6As5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09F92F804B3;
	Wed, 28 Sep 2022 18:34:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DD0FF80310; Wed, 28 Sep 2022 18:34:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5590F8011C
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 18:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5590F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Cih++1kr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664382840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hKPH2Z5bYYG1DWyY26KN4QeMaQO8Mn+5Sh0e2FINxws=;
 b=Cih++1krsBFHZkY/JQOE0F1dpNpxuU2R9TD6xrxz5y/wP8mI2HAQkP7VoFyvT2YdCW5ZRb
 NGNGK+/oAW4WS+Q921jpeB/SbXoCq6ZOEYOr0Zn9Tc86rBpB2IngS5omKKO7Z8B2Maaph9
 d968qkNGSNIzvXzUj9WCvPyedDoU7uQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-568-MBNscywLNnGvPtcId78ylQ-1; Wed, 28 Sep 2022 12:33:58 -0400
X-MC-Unique: MBNscywLNnGvPtcId78ylQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 hs31-20020a1709073e9f00b00782b009c505so5729991ejc.13
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 09:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=hKPH2Z5bYYG1DWyY26KN4QeMaQO8Mn+5Sh0e2FINxws=;
 b=jiaf+jI6L8suZKMqdLIQzJAiqGp6pSaPsWwN8PaYBWP2Ewz3WWfM8Gd34wfwc9P4cc
 RduWGq5jQ4LEJqrDn7RFDCyH5pMjZNvfiYeCYgE2ufp9cYTHr95Rr9OAaZd1ZL4gt9vJ
 PG9dhBcc5rlRyhj5Wz8BCnzhJ5jrGmLqlyMdFT43w2k1G/TJUFpos7PziqA5p96ENF0k
 cJSgYx255s1eR9ZVpBY2MBSnCgwU5NV8P6qQzbKKiF2cU6zEcGZjMY3WL2HHnI7LNh5j
 vju8z3Kr8/WkQ20y9O25czuOuu0gGSjZiaXh2p8MXkXSmMOoC9cDc9lp5L8sV/FnL1ob
 by9w==
X-Gm-Message-State: ACrzQf2TBQUbFdKhP2jLtKPS6EY0xZLVHamM7r9Z1rPDUgA+vPS5Vb5I
 t2A6Vt1G/OmshtWi5HFG4QAwiX4RJKnRm4hXvKTDX4Fvh2RfwsvUhqtCwmXVFQlWfxGYQW40zIy
 GMYHnwWD++lEuQxsHzaJLoTc=
X-Received: by 2002:a50:c8c3:0:b0:44c:5cb6:5484 with SMTP id
 k3-20020a50c8c3000000b0044c5cb65484mr33994910edh.285.1664382837266; 
 Wed, 28 Sep 2022 09:33:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6iZaOi299u47Vd1Z7SqFInd/ZooA+IjMw0PYvLivzTc7095FxWkDTXVydwtaLkJAH7wj7CHA==
X-Received: by 2002:a50:c8c3:0:b0:44c:5cb6:5484 with SMTP id
 k3-20020a50c8c3000000b0044c5cb65484mr33994892edh.285.1664382837099; 
 Wed, 28 Sep 2022 09:33:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a17090618b100b0077ce503bd77sm2591135ejf.129.2022.09.28.09.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 09:33:55 -0700 (PDT)
Message-ID: <61bd7097-afac-5a2d-46a2-aada444a890c@redhat.com>
Date: Wed, 28 Sep 2022 18:33:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Sound broken (first couple of seconds play looping) on Sony Vaio
 VPX11S1E (HDA, ALC262)
To: Takashi Iwai <tiwai@suse.de>
References: <3e8697e1-87c6-7a7b-d2e8-b21f1d2f181b@redhat.com>
 <87y1uqbfmo.wl-tiwai@suse.de> <87tu5ebdc8.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87tu5ebdc8.wl-tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 9/11/22 09:05, Takashi Iwai wrote:
> On Sun, 11 Sep 2022 08:15:59 +0200,
> Takashi Iwai wrote:
>>
>> On Sat, 10 Sep 2022 19:52:36 +0200,
>> Hans de Goede wrote:
>>>
>>> Hi All,
>>>
>>> To test some kernel work (backlight refactor) which I have been doing
>>> I have booted Debian Testing with a 6.0 kernel on a Sony Vaio VPX11S1E
>>> (which is ancient).
>>>
>>> I noticed that when tab-completing something in a terminal the
>>> terminal bell sound would keep repeating and playing another longer
>>> sound sample gets stuck with the first couple of seconds of that
>>> sample looping.
>>>
>>> This is under GNOME3 with pulseaudio as sound server.
>>>
>>> I accidentally found an interesting workaround if I run:
>>>
>>> aplay -Dplughw:CARD=MID,DEV=0 /usr/share/sounds/alsa/Front_Left.wav
>>>
>>> once, then that works properly and after that the problem is gone...
>>>
>>> Note that this laptop does have only 1 speaker AFAICT.
>>>
>>> alsa-info output below.
>>>
>>> I would be happy to test any patches / module-options which might
>>> fix this.
>>
>> Could you check the very latest Linus tree (6.0-rc5)?
>> There has been a regression fix for HD-audio, and possibly this might
>> be your case.
> 
> And if this doesn't change the behavior, try snoop=0 option for
> snd-hda-intel module.

Thanks, I've just tried with 6.0-rc6 both with and without snoop=0
and neither helps I'm afraid.

Regards,

Hans

