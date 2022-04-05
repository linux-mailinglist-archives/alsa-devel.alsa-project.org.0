Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E074F363D
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 15:57:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 867D71811;
	Tue,  5 Apr 2022 15:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 867D71811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649167050;
	bh=Bmw8bIGkFmxE694w529D56oHaxOXPcfJ0O16D8LuIHI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bA3lVCugdg9SN1jp1XBQL38gCi3thTt5M6tKsxoaLMn/+jN1bbUkFKOoG5/iHbvQL
	 n1SrK4/2J+gQJfNzjIFL7t7Yx2ZSZqHL0OSmlWAflrsuW6o6TyST1lRBOvNEw+3znD
	 MkL2394cZnuazey0V08jTN+p4QRdOKgJwLH4EMPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 296E5F800D2;
	Tue,  5 Apr 2022 15:56:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C725F8014B; Tue,  5 Apr 2022 15:56:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8709F8014B
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 15:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8709F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="H6BGGi4l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649166985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cfhShkJ9GGB5NMk/Kf+P1wbpLhxJJWK4mdwN+7tkv6Q=;
 b=H6BGGi4l9NvhIIIPEwHX0u3PRm8XnbVZjkkcmQw3GFW8leN3E16KTVZkN9fX5k218J0Cbi
 Y6c4MW732GDgfaqohtJTLiHdaGvGC25XM3Hm+oZi8r6nE1o7+5Lf5b4LQxvqf1sS3rYo0q
 BYPZinlX629DmGFnHX4kY26yqkn2Kgc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-Gq2mh5oaOE-r2pZe31seJg-1; Tue, 05 Apr 2022 09:56:23 -0400
X-MC-Unique: Gq2mh5oaOE-r2pZe31seJg-1
Received: by mail-ed1-f72.google.com with SMTP id
 bc9-20020a056402204900b0041cc2b0bff3so4048851edb.2
 for <alsa-devel@alsa-project.org>; Tue, 05 Apr 2022 06:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cfhShkJ9GGB5NMk/Kf+P1wbpLhxJJWK4mdwN+7tkv6Q=;
 b=SDG+/OHxXcoOzbehaZJU/JgXRSGPLcYLaZgHqsMMfB8j+n2nY9/Y55o8dZt//ptvnf
 VMnhHDsWCczioxGLjtOdhQg07b0zkdTx71pi2+F53P0K/v/WFCzwDH1xVpYXpVsAeVQd
 pUTMtSBlMatt5YILJkR/osdbjXyqcu1axkdU3kqzgGQ1fWggJQYYOKtwGf3T/Qypjldp
 RnKB12LeQn7X/pbpIIr2qT8AnuvOsQxgUDqjF5JiUwtwsrySEs2nulluQt0Ue+GwCy1P
 mmFyhxjo/sJfwLA1tmjbGFGuhxA/tNcbhNjUJENoxefFkBd84DrEIv0e/sv65jPBWcQb
 RNaA==
X-Gm-Message-State: AOAM5333ITiJ2/J1lFekzzF03s9DcjDvWV7fYaox+fIrf2W26gSCfZBB
 3GG8DhOyO3hisS5AEr/fEcZDLjdEU/MpLG41I7fYAzH8/jhTPDRZErIonr5rahdpge3mILmDZnA
 bAz0io/pYJlbbcT0hUO4jK7s=
X-Received: by 2002:a17:907:3f92:b0:6e7:2ad3:a92b with SMTP id
 hr18-20020a1709073f9200b006e72ad3a92bmr3830785ejc.239.1649166982498; 
 Tue, 05 Apr 2022 06:56:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx69MGrYFiX2diEdHGCV1GaeBoAESL3VkLvFfkO+94ucsSVEn/t7bVB93+D7yDW19qjYnxehg==
X-Received: by 2002:a17:907:3f92:b0:6e7:2ad3:a92b with SMTP id
 hr18-20020a1709073f9200b006e72ad3a92bmr3830772ejc.239.1649166982285; 
 Tue, 05 Apr 2022 06:56:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a170906a18400b006db0a78bde8sm5576897ejy.87.2022.04.05.06.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 06:56:21 -0700 (PDT)
Message-ID: <6b61410d-ce1e-e84c-4a4e-aa3b22f3dc89@redhat.com>
Date: Tue, 5 Apr 2022 15:56:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/2] Make headphone work on Huawei Matebook D15
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1649147890.git.mchehab@kernel.org>
 <168fe6c3-6a7d-4019-16e3-066caf394b8a@redhat.com>
 <20220405154816.5cfdc49c@coco.lan>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220405154816.5cfdc49c@coco.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

On 4/5/22 15:48, Mauro Carvalho Chehab wrote:
> Em Tue, 5 Apr 2022 11:00:44 +0200
> Hans de Goede <hdegoede@redhat.com> escreveu:
> 
>> Hi,
>>
>> On 4/5/22 10:44, Mauro Carvalho Chehab wrote:
>>> At Huawei Matebook D15 two different GPIOs are used to control the output:
>>> 	- gpio0 controls the speaker output;
>>> 	- gpio1 controls the headphone output.
>>>
>>> Changing both at the same time cause spurious events that are mis-interpreted
>>> as input events, causing troubles on apps. So, a delay is needed before turning
>>> on such gpios.
>>>
>>> With this patch, plugging a headphone causes a jack event to trigger the speaker
>>> supply, powering down the speaker and powering up the headphone output.
>>> Removing the headphone also triggers the power supply, powering up the speaker
>>> and powering down the headphone.
>>>
>>> Mauro Carvalho Chehab (2):
>>>   ASoC: Intel: sof_es8336: support a separate gpio to control headphone
>>>   ASoC: Intel: sof_es8336: Huawei Matebook D15 uses a headphone gpio  
>>
>> There is something weird with the patches here, at least for me in Thunderbird
>> both patches show up as nameless attachments to emails with empty bodies.
> 
> Weird... I tested here on Thunderbird (Fedora 35), reading it from the ML
> and they opened ok here.

Yes I checked lore.kernel.org and they look fine there, so as you
said: weird.

> There *is* an issue on such patches though: they ended using my past
> e-mail :-) 
> 
> I'll re-send those with your ack using the right SoB/From
> mchehab@kernel.org.

And in the resend they look fine in my Thunderbird too.

Regards,

Hans

