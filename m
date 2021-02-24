Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1459B3244F6
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 21:11:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D1F8167A;
	Wed, 24 Feb 2021 21:10:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D1F8167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614197486;
	bh=mdw11UrD477wIKdXu+jktogajQ1YRNNycQ83f3y6A38=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ihSmVrnZQXR7JzkEKb1nT8pVgqRkL346RfNH5ixKjkGFRqSJbTkyOxDF1wKTcfMa5
	 19VLIKCeCK4as+V8SZK0Wab1G4DY1AngAa+hEcl6Fz0usAYOArsaZFofGw0asAyNzu
	 ZgF9DF0kwvUKvQmw/oqFEetXaoY7wM2KI07yi7jI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1B87F800F2;
	Wed, 24 Feb 2021 21:09:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02335F8016C; Wed, 24 Feb 2021 21:09:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DFD0F800F2
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 21:09:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DFD0F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="aX21wNJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614197381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QCgOb5vVsWN+uLuXOoKcEMfr4xJ/nSyPycE8f32C5qc=;
 b=aX21wNJF3kTDJA+6OWRjWdj2562oXJuFW+f7GMuFizn1u4k2UybZirLsQKaSFHwlaDgVd4
 yxANWQAhCJw51VlG3AUa9gpY1nut1ftIvH0/S0rKCg+8WsVwBLTaiZ2MtXjxveze4hciFk
 Y//G5xl4jki01iYXp+9YWKj1dru5nJA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-SgUZbLuhPHC_fppm9SbGfA-1; Wed, 24 Feb 2021 15:09:39 -0500
X-MC-Unique: SgUZbLuhPHC_fppm9SbGfA-1
Received: by mail-ed1-f72.google.com with SMTP id h1so1511943edq.1
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 12:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QCgOb5vVsWN+uLuXOoKcEMfr4xJ/nSyPycE8f32C5qc=;
 b=br4F1OfiO9h2RitEYPW5xxjlps5QmZRPC8Gz5eDWCnCbLQ+4PPAgqehFk6nKGnb4HZ
 umLsepodnrOYGJ1hH2DQ7tXTFi0F7d4/Ri9uj4VceXT9hp3d38IPQzXOJnzMlNCvqZb4
 ig/0XOjb+OzFsZYQf8mOGfL6B+B42NxWTq18QD3MT36XOnXgolyrqCyljRHVdD1WsXgm
 WSQnggb6crrwRCIgA5YG7CNBm8pQR28PRBL0Q7U0w1S5Tw0qZ5tpJyncidlQQPk1FGf2
 h0iC3j94lPNJgPbEQOT02k6Ig4eFBjkv6P1hYFfN0CJbHeSGTGZeChyy6uLE+IprVR78
 V7fw==
X-Gm-Message-State: AOAM530na8WkywosLaPHbGI47tyCNNPLlYpYX0zjK8HEVMEiq24Zs3vB
 6snnkb/9We2h9/wDo+DjKsj3lC94w2zWHSm3KQL8R+JBh65HlOk+xQTfRKk2MRoroMCEYQwUVu2
 m1gkzhK0kXJ/MCqKZlAxAbPsryNMqRFv7V6iUAph9IbYyhSSf2sy2OfVuj3Nvu5zABZOZA/lrQI
 U=
X-Received: by 2002:a17:906:7c57:: with SMTP id
 g23mr3291448ejp.195.1614197377802; 
 Wed, 24 Feb 2021 12:09:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4nzeoHTYgk/QtIHpf5jTkyTRezs0UyQZNGDI6fQx4DFSUpSEWm4BYdLf/WV/i1tFDazBguQ==
X-Received: by 2002:a17:906:7c57:: with SMTP id
 g23mr3291418ejp.195.1614197377582; 
 Wed, 24 Feb 2021 12:09:37 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id r23sm2206703eds.76.2021.02.24.12.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 12:09:37 -0800 (PST)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Mark Brown <broonie@kernel.org>
References: <20210215142419.308651-3-hdegoede@redhat.com>
 <20210223134506.GF5116@sirena.org.uk>
 <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
 <20210223140930.GH5116@sirena.org.uk> <s5h8s7evp8p.wl-tiwai@suse.de>
 <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
 <20210223172055.GI5116@sirena.org.uk>
 <fe2941de-02ce-9ed0-70ff-d7967aeecc44@redhat.com>
 <20210224125927.GB4504@sirena.org.uk>
 <e47c7fa5-cb1a-f8a3-bfe4-1f6bca6a7d80@redhat.com>
 <20210224193626.GF4504@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <56ea1110-c129-5f3a-264b-fb389f615dbe@redhat.com>
Date: Wed, 24 Feb 2021 21:09:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224193626.GF4504@sirena.org.uk>
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

On 2/24/21 8:36 PM, Mark Brown wrote:
> On Wed, Feb 24, 2021 at 08:14:12PM +0100, Hans de Goede wrote:
>> On 2/24/21 1:59 PM, Mark Brown wrote:
> 
>>> The problem I was thinking of is the situation where there are multiple
>>> options for the mute control in the hardware and it's a configuration
>>> decision which one to use.
> 
>> ATM we have no device where this situation happens, so I would prefer
>> to cross that bridge when we come to it.
> 
> You just added wm5012 machine drivers, that device is going to present
> issues with this approach.

I've no intention to add led-trigger support to the bytcr-wm5102 driver,
since to the best of my knowledge there are no mute LEDs on any designs
using the bytcr + wm5102 combination.

I'm aware of there actually being a mute LED on only 3 2-in-1 models
with detachable keyboards (with the mute LEDs sitting inside the
media-keys to toggle the mute, like how it is done on thinkpads):

1. The Thinkpad10 bytcr+rt5670 tablet with its USB ultrabook keyboard dock
2. The HP x2 10" clamshell designs with detachable keyboards in
   2 variants, bytcr + rt5640 and cht + rt5640.

Thats it, and in both cases the codecs have main ADC / DAC volume
controls which are the only ones suited for using as the control
to drive the led-trigger. Which is why this RFC just hardcoded
the trigger to that control.

As I said I'll happily respin this RFC series (and the not yet
posted similar rt5640 series) to tie the led-trigger to specific
controls based on DMI quirks.

Given that the use of mute LEDs itself is actually rare and especially
the use of mute LEDs in combination with ASoC coming up with some
generic configuration mechanism to allow userspace to tie the
led-trigger to any random 'Switch' type control is way overkill /
overengineering and I've no desire to spend a huge amount of time
on implementing this.

Not to mention that this would just be punting the actual problem
of figuring out which control to use to userspace, while the kernel
is actually in a better place to make this decision since the kernel
already uses DMI based quirks to deal with model specific configuration.

Regards,

Hans

