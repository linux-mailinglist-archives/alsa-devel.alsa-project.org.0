Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 918CC7EFF58
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Nov 2023 12:52:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CCC6A4A;
	Sat, 18 Nov 2023 12:51:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CCC6A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700308327;
	bh=2DTrnmhWo1zqxU38FYSdkICDqk4tdIGGX/N7OCG/F+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nB0pbQ6ZZga6EAT7frMMb+M4ef7JxDP6pGDCJiBlENru02TvMeE4PvxNoCnqsN+WV
	 oUpYT0F82YLqWsdu9ZFL5OuDBFL3Oiahuu++u2mBkpjTuAZ2Oha/zy3plHJqXhTnDM
	 SF0HhCc1wNRgg0p/cpdfy0RWakfQH1iY6ej+v+w0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 704B5F8016E; Sat, 18 Nov 2023 12:50:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35DE9F8016E;
	Sat, 18 Nov 2023 12:50:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6F3CF801D5; Sat, 18 Nov 2023 12:48:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25BEBF80093
	for <alsa-devel@alsa-project.org>; Sat, 18 Nov 2023 12:48:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25BEBF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=IN0m5uYN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700308126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+sjH02oddW8EUHSBQYpBMoyIqmMuXMCyUeuGsQCKx7A=;
	b=IN0m5uYN92KVOm+9hbMkcTEV/IAFy8YMRGFDOgnl36bE39whsfAalbVtpoFHNpPs3j+A13
	E3UPPC6BQVfPbBH/NkelfCR9mqnB80+V6iWjHgMRQajHyazMU/m6dse9qpaD4fpUK3Kmxp
	Cv/rw+Iv7360Z6WvLXX9vkpKfAfiI6g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-Cx1HrvUqOZ6UjmdyUpG0Lg-1; Sat, 18 Nov 2023 06:48:44 -0500
X-MC-Unique: Cx1HrvUqOZ6UjmdyUpG0Lg-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-54366567af4so3695742a12.1
        for <alsa-devel@alsa-project.org>;
 Sat, 18 Nov 2023 03:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700308123; x=1700912923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+sjH02oddW8EUHSBQYpBMoyIqmMuXMCyUeuGsQCKx7A=;
        b=PApRaDxCKQ7msym04TbmkxFfMv+31arLNw2sz47BrnGB9EqxW3gqiQZ4wUJ6PT0KjS
         vaYftPNLTtE0guTAc+MbKZ/DzFvwZjIs89OU9lHaVfgqtLXKYePxp2hrD6k1b2gtCCyA
         ANGaUhP/DNbKO0FYujNXvqZiWQlKM/7xU3jBwpcODnt7tyEdbuZTVMVxg7HpAoQzUSvg
         UyyJ6Ux/BcbJK7d6SM6TMBhmv4vJhhfauAMsUpyiQ1V8szZoTOPZy7iFTyD5ufxgUNP6
         4iwfRPMTiHzdVqAYRKBrJroo2KWN5myB97o57x76DffXjuo+8HvpWvP6fAnb6XKhOPP8
         k4Bg==
X-Gm-Message-State: AOJu0YxtczB+jcFBrzTILYJYh+C/LxB/qjKi7SqESQwZW5YSw9Va5GOp
	PpUQ9lvcrbMVIcQyvJyD8kYVUP0k3sPblyFxDpy9i30JNe9ffUY6zPV5HtN7fYeYi7DTUyfWYFm
	bCj7mI4RlbU6Xi/nvUM9vHwM=
X-Received: by 2002:a05:6402:1815:b0:540:911b:72b1 with SMTP id
 g21-20020a056402181500b00540911b72b1mr1831934edy.7.1700308123299;
        Sat, 18 Nov 2023 03:48:43 -0800 (PST)
X-Google-Smtp-Source: 
 AGHT+IFjIk0ryMYANEnB8fOUn3rwpbhJ7feNhqwhgbVoGivuioePSWMLT/mAnRxkuZEP926JpuTHaQ==
X-Received: by 2002:a05:6402:1815:b0:540:911b:72b1 with SMTP id
 g21-20020a056402181500b00540911b72b1mr1831912edy.7.1700308123018;
        Sat, 18 Nov 2023 03:48:43 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id
 r5-20020a056402018500b0053dec545c8fsm1636365edv.3.2023.11.18.03.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Nov 2023 03:48:42 -0800 (PST)
Message-ID: <94c2e3af-20fc-4898-bb09-f59d677bde1a@redhat.com>
Date: Sat, 18 Nov 2023 12:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ASoC: Intel: bytcht_es8316: Determine quirks/routing
 through ACPI DSM
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Yang <yangxiaohua@everest-semi.com>, alsa-devel@alsa-project.org
References: <20231104142439.21983-1-hdegoede@redhat.com>
 <8f3ba9d6-6530-48d7-85d7-88579406c57a@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8f3ba9d6-6530-48d7-85d7-88579406c57a@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EHPMM5ZFZZAP3XTWRIZTJDG43OUEHL4J
X-Message-ID-Hash: EHPMM5ZFZZAP3XTWRIZTJDG43OUEHL4J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EHPMM5ZFZZAP3XTWRIZTJDG43OUEHL4J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre-Louis,

On 11/6/23 15:51, Pierre-Louis Bossart wrote:
> 
>> This takes some of the work done to auto-configure quirks/routing for
>> ESS83xx codecs by getting the info from ACPI from:
>> https://github.com/thesofproject/linux/pull/4112
>>
>> And then builds on top of this to add auto-configuration to
>> the bytcht_es8316 board driver.
> 
> Sounds good, thanks for doing this Hans! I only have two minor
> questions, see below.
>>
>> Note compared to the pull-request, which deals with the ES8336, this
>> series deals with the ES8316 (for which I have several devices to test
>> on) and this moves all handling from the codec driver to the board
>> driver where this IMHO belongs.
> 
> The ACPI stuff is in theory not Intel-specific, so not sure why it would
> belong in sound/soc/intel/boards? I initially put the code in
> sound/soc/codecs since the _DSM method is in the scope of the codec
> device HID.

So my thinking was that the _DSM method is something which
the Windows drivers use and since Windows on ARM is all kinda special,
that means that this basically is a ACPI-x86 platforms thing.

The mistake which I made is that in my mind I replaced x86 with intel,
so then it made sense to put this under sound/soc/intel. But
of course there also is AMD (my main workstation actually uses an AMD
CPU) and there also is sound/soc/amd .

So thinking about this again I agree that the best place for
the _DSM helpers is under sound/soc/codecs, so I'll move them back
for v2.

I do believe that at least for the ES8316 case the board driver
is the right place to call the helpers though, since there
the board driver sets up the MIC and speaker routes.

>> After this series audio now works properly on a CHT Chuwi Hi12 tablet
>> without needing to add an extra quirk for that model.
>>
>> This has also been tested on the following devices, where things
>> are unchanged from before (the ACPI autoconfiguration gives the
>> same results as the old defaults) :
>>
>> Onda V80 plus (CHT)
>> GP-electronic T701 (BYT)
>>
>> I also tested this on a Nanote UMPC-01, here the _DSM result
>> for PLATFORM_SPK_TYPE_ARG wrongly returns 1 (mono) while
>> the device actually has 2 speakers, so this model needs to keep
>> its DMI quirk.
> 
> What about the two others?
> 
> /* Irbis NB41 */
> /* Teclast X98 Plus II */
> 
> Are they part of your set of devices

No I don't have these 2 devices in my collection.

> and could the quirks be removed?

Maybe, but since I cannot test I have decided
to play it safe and leave the quirks in place.

I'll prepare a v2 series moving the generic _DSM helpers
back to sound/soc/codecs.

Regards,

Hans


