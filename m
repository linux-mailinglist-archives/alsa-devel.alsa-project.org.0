Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5201C19FAE4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 19:00:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF0F51674;
	Mon,  6 Apr 2020 18:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF0F51674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586192448;
	bh=oOQBfoZD+wFYTnq9SZOesQfJ7hirKXlpezxv7ZI5YT8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FM0BKzKAapoGHuY6FpPfDtEHMT+9h4YOgu6phbGoP2Ye19zh8TlmkCMGaldjk6Yg8
	 38awi/+u52253bmDogVNdBxeLvaqgsX2u1y7hevfkdsKVDB9WzM06KpanQjwoEOuwa
	 fRmYq4wO5Oey8Q2pipY4IXSwUxjVWfdbX4p1LyyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB6B5F80150;
	Mon,  6 Apr 2020 18:59:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2045CF80143; Mon,  6 Apr 2020 18:59:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A406F80140
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 18:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A406F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="F3gpoQnN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586192335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rNyIsJhdwL6WKpcQohBVVjAO9kV7zmTl7+3IPSVuM8=;
 b=F3gpoQnNtJ55pe59nmp+JxeDzFAGuyE8jXSyOevxZA3dzKyJ7dZlDcNtr/tRyfDUbsKFVw
 ur6/gFEjf+OelqjHTDiXvPqCkBeTL70G+0W6y+drgh5XNISpFOselduhoOlVT5e3z6CMh4
 i3dabfrd32b4jR9H3FPMaS2uo7CNh3o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-rggyftOqP4qQMv0lOCNwAg-1; Mon, 06 Apr 2020 12:58:53 -0400
X-MC-Unique: rggyftOqP4qQMv0lOCNwAg-1
Received: by mail-wm1-f72.google.com with SMTP id f9so14180wme.7
 for <alsa-devel@alsa-project.org>; Mon, 06 Apr 2020 09:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2rNyIsJhdwL6WKpcQohBVVjAO9kV7zmTl7+3IPSVuM8=;
 b=E1DXRW4qWbNFh40yaos5xbeTzviSBQCnD5CkU3/kAt413iqfgE8OT2aHPZsYY2Ow8a
 1IUr4Vcfd694aiUIS/b9kARU73oZxtZ4F315jRjSGmNNh5oAJCr/P2t040ot6v6gDZJW
 YtOOZiBwN+mEij64jMNC3FOpfTcbwQRMnpOi6KdxoQ7N8+nI9L4Fvnkht9zqJ2joRMqf
 JrrmNVWJoly0Xwt5byfOP6C6WBjPNSBjm4srxgTuW1y51DU5qYlq93WVHwWomqQvRanp
 xVsQz9U9541Dp1vEBXYyqnTiim8UkaovcOp4m+HIzDQdl1N/VA2AGrkjOus92nku5gol
 DK5Q==
X-Gm-Message-State: AGi0PubdVLMl1OoXxa1LdpThO2ObWdMjHlYAS/qyZqRqUsNJlvjLag/i
 pjlo5igjlHRS/VsYZjFj6ART7wZRun6VCsB5d0aP+B9vJgfq92pOeChcrL0d6GKzcn7GK7J2ZnQ
 pJW39pzEflPW4zH+knn6vNOU=
X-Received: by 2002:a1c:6745:: with SMTP id b66mr23082wmc.30.1586192332116;
 Mon, 06 Apr 2020 09:58:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypK9kJygKDdPFsE41TmBrpIJOH4OJdS/NWwY3LN5KmsafPe+QimoNgBCE2e3y21+8AwSKqrMyg==
X-Received: by 2002:a1c:6745:: with SMTP id b66mr23065wmc.30.1586192331789;
 Mon, 06 Apr 2020 09:58:51 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id d13sm28020361wrq.11.2020.04.06.09.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 09:58:51 -0700 (PDT)
Subject: Re: [PATCH 4/5] chtrt5645: Remove bogus JackHWMute settings
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>
References: <20200405183454.34515-1-hdegoede@redhat.com>
 <20200405183454.34515-4-hdegoede@redhat.com>
 <d06f3894-6cd7-fd4e-2261-94505fc0db4a@linux.intel.com>
 <c19aadd5-80b4-91de-4e0a-344e21125883@redhat.com>
 <3198cbfb-f498-2c82-88cd-c8b7d0b53574@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <2ba90327-6a23-7c5f-5b4e-f01e51b59ace@redhat.com>
Date: Mon, 6 Apr 2020 18:58:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3198cbfb-f498-2c82-88cd-c8b7d0b53574@linux.intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

On 4/6/20 5:17 PM, Pierre-Louis Bossart wrote:
> 
>>> So overall it seems rather unlikely that we can support dmic + headset mic in parallel?
>>
>> Right that is what the ConflictingDevices sections are for.
>>
>> Removing the JackHWMute does not allow using both add the same time,
>> it merely allows overriding which of the 2 to use (if the headset mic
>> is detected by the jack, the JackControl setting is kept).
>>
>> So lets say the internal mic is crappy, but the user prefers to
>> have their ears free, then they can use a headset around there neck,
>> using just the headset-mic and select speakers as output even though
>> a jack is inserted.
>>
>> Note pulseaudio will still automatically switch to the headphones /
>> headsetmic when plugged in, this merely allows overriding that
>> choice manually.
>>
>> Jacks which actually physically disable (or re-route) signals are
>> quite rare now a days so having a JackHWMute in the UCM conf is
>> often wrong. After this patch only a few cases are left:
>>
>> [hans@x1 alsa-ucm-conf]$ ack -l JackHWMute ucm2
>> ucm2/HDA-Intel/HiFi-dual.conf
>> ucm2/chtrt5650/HiFi.conf
>> ucm2/hda-dsp/HiFi.conf
>> ucm2/codecs/es8316/HeadPhones.conf
>> ucm2/sof-bdw-rt5677/HiFi.conf
>> ucm2/broxton-rt298/HiFi.conf
>> ucm2/skylake-rt286/HiFi.conf
>>
>> The es8316 case is actually correct, the es8316 has only 1
>> output (which is amplified for e.g. a speaker) and at
>> least the reference design suggests routing the speaker signal
>> through the jack and using a jack which will interrupt the
>> signal when headphones are plugged in.
>>
>> Note most actual designs implement this with an analog
>> switch and a GPIO to control that switch, since 3.5 mm
>> jacks which actually can disconnect a signal are rare
>> (if they exist at all, but I guess they do). For the
>> designs using the GPIO controlled analog switch, the
>> JackHWMute technically also is wrong, but I put it
>> there (IIRC it was me) because it matches the reference
>> design.
>>
>> I'm not familiar enough with any of the others to say anything
>> about them, but most of them are for HDA setups, where this
>> is somewhat more normal I guess.
> 
> If I follow the logic, I guess we should also remove the JackHWMute for sof-bdw-rt5677, hda-dsp and HDA-Intel. I can't think of a hardware limitation preventing the headset mic from being used while the speakers are used for playback. Likewise the rt5650 is a cheaper version of rt5645 so the same applies.

Right AFAIK:

JackHWMute "foo"

Means that the JackControl listed in the same section does
something at the hardware level which makes it impossible
for the "foo" input / output to function until the jack
is removed. Typically this would be something like actually
disconnecting the speakers at the electrical level.

So almost always using it is wrong.

Regards,

Hans


