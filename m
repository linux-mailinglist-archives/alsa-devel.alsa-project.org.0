Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B23324475
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 20:15:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4503E167E;
	Wed, 24 Feb 2021 20:15:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4503E167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614194158;
	bh=EXve8CENrg9i/XGTXxs23i1VPPoc4YbqVmlEe/NcGcQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wj6lww0DTlpDQPV1eTtsskssWBSTyjhu82zE4StSUwW4uCwDI3gT53izYqfg6u300
	 c8auaigRK7oMPv9ydbUDULWU9IYSPpWQdeH4PyOzfrGIzY6Va21Qo/GDVHEEeXfNzO
	 eFS3bJdhPUZEEn1vWHxOEpb3gzN1jX7zvxOmt6Vw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92EEDF80159;
	Wed, 24 Feb 2021 20:14:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27649F8016C; Wed, 24 Feb 2021 20:14:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23357F80159
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 20:14:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23357F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Y+JPG/x8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614194058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YcBye9CSNzE9zyqeutPbhIiCj4Zf6g6fdgnNpBndS7g=;
 b=Y+JPG/x8bpJi80E3mSSrCdl2rCNmRQvqv+Awu+rEEmEX+x5CcgKgEKt0RuKm2ZPrZRfuI0
 xGNGv+dBu/qgLvntbBvOS9/htltaJcjY9cO9IyLsBwwGHvZcMxLgSVzdEThU9FobPg1K7u
 PIDmCvefEG0Pjxt1FnhLTe+0QyNNRKI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-POF4lF8tN_WeMxjxXipTpw-1; Wed, 24 Feb 2021 14:14:16 -0500
X-MC-Unique: POF4lF8tN_WeMxjxXipTpw-1
Received: by mail-ed1-f71.google.com with SMTP id p12so1421226edw.9
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 11:14:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YcBye9CSNzE9zyqeutPbhIiCj4Zf6g6fdgnNpBndS7g=;
 b=E7aJYsMlNq+LYq0ZAEHJDq/C/mjmBXtNF4f9917LZ1mHePxD8HxOW7HzA0SM4gKKnq
 IwqrF9JH99TN0rUpihdkTEhE8QJQ+vmI/XQ+Q6fJKI4jnKcEnbUsonxZLWyMT0+HvXtw
 thsbw6lbjx9RLya+5wqgKrrpHIoruJ8HTAMXR3KuWTgm/Bf91ea1sGJtHi/1njiK0yMf
 45/p21HJs+9hJdyP4mQ2dR/YPUCqsjC1Cj5TIVFFF2XhMBD2gCA3tNgACaeeijp4JHJF
 TofkNlYiPPJkIbcq2rVbpYJxHVW9Me3jPY7yXJW9L9ya7dZ75xlZzdSM8KgMyUkNe0Ey
 fEAg==
X-Gm-Message-State: AOAM532IeXjHrkD4rfg/XjS+ydUUDokR5fVCsttLSIF15rum1so90OOq
 AHJIsS98rSqizYfspWp7jmRnCKnbk07of5o4omqRK1Up35hwPIkv/zAAIUpMhI0PWg+WH33MyHs
 OY3c0tYa2tNrHEeRvsSMjVZWf5net67U35U00e8r3pRExqTV9VMZF72Z+z+KY0ZGVRpw/SFWtS/
 4=
X-Received: by 2002:a50:fc0e:: with SMTP id i14mr21513001edr.91.1614194055356; 
 Wed, 24 Feb 2021 11:14:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOhbibpA/GkGYempuwoZ+th4a2Ev09LFvR0cq0ItUVoPCds6F5Ts9FQ8g4L8bkdaGYlYqB0Q==
X-Received: by 2002:a50:fc0e:: with SMTP id i14mr21512983edr.91.1614194055212; 
 Wed, 24 Feb 2021 11:14:15 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id hr3sm1767083ejc.41.2021.02.24.11.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 11:14:13 -0800 (PST)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Mark Brown <broonie@kernel.org>
References: <20210215142419.308651-1-hdegoede@redhat.com>
 <20210215142419.308651-3-hdegoede@redhat.com>
 <20210223134506.GF5116@sirena.org.uk>
 <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
 <20210223140930.GH5116@sirena.org.uk> <s5h8s7evp8p.wl-tiwai@suse.de>
 <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
 <20210223172055.GI5116@sirena.org.uk>
 <fe2941de-02ce-9ed0-70ff-d7967aeecc44@redhat.com>
 <20210224125927.GB4504@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <e47c7fa5-cb1a-f8a3-bfe4-1f6bca6a7d80@redhat.com>
Date: Wed, 24 Feb 2021 20:14:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224125927.GB4504@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bard.liao@intel.com>
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

On 2/24/21 1:59 PM, Mark Brown wrote:
> On Tue, Feb 23, 2021 at 08:03:58PM +0100, Hans de Goede wrote:
>> On 2/23/21 6:20 PM, Mark Brown wrote:
> 
>>> We already need ACPI and DMI quirks in the CODEC drivers anyway due to
>>> the limitations of ACPI so it wouldn't be particularly surprising to
>>> have stuff there.  OTOH this would fix things per machine while with
>>> fancier hardware things might easily be flexible enough that there's
>>> multiple choices that could be made depending on use case.
> 
>> I have a feeling from the discussion here that you would prefer this
>> per model/machine option over the current patch which unconditionally
>> sets the SNDRV_CTL_ELEM_ACCESS_SPK/MIC_LED flag on the main DAC/ADC
>> mute controls ?
> 
>> So I believe that it would be best for me to respin this patch
>> series moving to making this a per model/machine thing, correct?
> 
> Yes, we at least need to be able to do that even if we end up hard
> coding it in some CODEC drivers as the device is inflexible.  There are
> devices where the concept of "main DAC/ADC" just doesn't apply.
> 
>>> I'd be a lot more comfortable with ASoC having some runtime control for
>>> overriding which controls get mapped, even if we try to pick defaults
>>> with quirks.
> 
>> The drivers in question already allow overriding their quirks bitmap
>> via a module-parameter.  If we are going to enable the mixer-element
> 
> I'm not a big fan of module parameters TBH, it's not great for
> usability.
> 
>> And then the user can always override the settings using the quirk
>> module parameter. This is not exactly runtime control, but IMHO it
>> is close enough and anything else will just overcomplicate things.
>> I'm aware of only 3 model 2-in-1s which need this and on those
>> 3 the implementation is very straight forward.
> 
> The problem I was thinking of is the situation where there are multiple
> options for the mute control in the hardware and it's a configuration
> decision which one to use.

ATM we have no device where this situation happens, so I would prefer
to cross that bridge when we come to it.

Regards,

Hans

