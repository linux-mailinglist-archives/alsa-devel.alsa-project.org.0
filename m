Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C773B3255C7
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 19:47:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ECB21665;
	Thu, 25 Feb 2021 19:46:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ECB21665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614278827;
	bh=2cg586bGZnAM/ugk4GsMSRp6R+3C8tGdnej4WlgkxdE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HvMxZYW63n26jlswr8fA7vIZDL1WEpgjQtYg7YFPj9r6icoFaLgyscLEoSZrBuJMK
	 MBlK3KKyjXOTgn4cQNkoiaUOnvCce6SzCl1t3uAR+wTqUaiBJPoju47GuKJKE8B5KC
	 elgppDcpYU/DOe0/BjtafdiDXvHOQj/rDhluFpbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE5C5F80159;
	Thu, 25 Feb 2021 19:45:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1A4DF8016A; Thu, 25 Feb 2021 19:45:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECDA5F80159
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 19:45:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECDA5F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="bJxu3shD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614278723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1IcWCcwzqwdFC58eTKWBU/hfWaPqoM4B2ay9i9dzjs=;
 b=bJxu3shDhmeg5oQ8V0b5+UJekY0q6UKeKB6FDdId4qL69+Xho1CpWtUO0jkLnsIe+y2Jai
 4bl4VcAhWFoWlRYN7lqmB6/kIjmLaJ6MTVmAPwSAJ1C3lYza7EYotvLrTyCATuJDWGZGuh
 8PgwUGL6E1VIKxc6HOQjvyE07zumSEA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-S-FxUzTYNL23lRa-2AjtYA-1; Thu, 25 Feb 2021 13:45:18 -0500
X-MC-Unique: S-FxUzTYNL23lRa-2AjtYA-1
Received: by mail-ed1-f70.google.com with SMTP id f11so3293407edk.13
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 10:45:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V1IcWCcwzqwdFC58eTKWBU/hfWaPqoM4B2ay9i9dzjs=;
 b=Gd/Dutr7+nqIVQAM0vKhCm6BGE5JjcZa/ubFGp14rHTHZlEXmDu0dUvvLGHhjqfE0e
 eqUAQ0JFchg0z7jaAkIy/YlaJE1bdx9xRv5p7lxfN+dTBHNeM5Nin7MnsM7Dr8Ilh2KC
 iKKEzd7OzMAKn5s2otk8+qRwI6eXV0VsqLROqwqdY1pd8unQzboGg2yBCNC55LhqsYgo
 T+iJAH705GKYWd4BAU2QSJTtj8mJ4zoHC1yj2RfkIM414Ehp6t92W36AMlTuY0pe3jns
 sCFmUWl6dDE04abmfvED6icoGtGq1bPR/q6wLdNDVXl0yE4eqbSTAupMIuH7Pd3tvVVg
 JeSg==
X-Gm-Message-State: AOAM531LHppvv9MP7LWsm6turRg0xmH2VVCH/GMgJ3D25jf+B5sk/vkI
 CFVesJ8JDy94v7A9xQvOLBUKaPNIbLtIFMW8n4JXhBlbvkLH//JuZNnmRsuRUoNBvdr/Vov/Ohj
 0rErTDNsRrIcs67JHehJhNrs6pYoGXX00+rv5WrWEMUZt+w0KCwj3wZ6nL2oAiViFT7hufZYQ1v
 Y=
X-Received: by 2002:a17:906:fc5:: with SMTP id
 c5mr3858692ejk.538.1614278717043; 
 Thu, 25 Feb 2021 10:45:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw73Vsgd1/KIqgyaraWbHXHHDNEZFzwtiRAlNpiDPBiJ/p/bOwQ72H2anEnIEytsBg8EpGZag==
X-Received: by 2002:a17:906:fc5:: with SMTP id
 c5mr3858667ejk.538.1614278716741; 
 Thu, 25 Feb 2021 10:45:16 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id i17sm3906360ejo.25.2021.02.25.10.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 10:45:16 -0800 (PST)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Mark Brown <broonie@kernel.org>
References: <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
 <20210223140930.GH5116@sirena.org.uk> <s5h8s7evp8p.wl-tiwai@suse.de>
 <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
 <20210223172055.GI5116@sirena.org.uk>
 <fe2941de-02ce-9ed0-70ff-d7967aeecc44@redhat.com>
 <20210224125927.GB4504@sirena.org.uk>
 <e47c7fa5-cb1a-f8a3-bfe4-1f6bca6a7d80@redhat.com>
 <20210224193626.GF4504@sirena.org.uk>
 <56ea1110-c129-5f3a-264b-fb389f615dbe@redhat.com>
 <20210225145901.GB5332@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c785af21-8170-62ca-6f08-0a9a1a9071bb@redhat.com>
Date: Thu, 25 Feb 2021 19:45:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225145901.GB5332@sirena.org.uk>
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

On 2/25/21 3:59 PM, Mark Brown wrote:
> On Wed, Feb 24, 2021 at 09:09:36PM +0100, Hans de Goede wrote:
> 
>> Given that the use of mute LEDs itself is actually rare and especially
>> the use of mute LEDs in combination with ASoC coming up with some
>> generic configuration mechanism to allow userspace to tie the
> 
> This seems like an optimistic set of assumptions - it may reflect
> current laptops but it sounds like the sort of thing people might
> deploy on future devices, never mind all the non-laptops that could end
> up wanting to use this mechanism.
> 
>> Not to mention that this would just be punting the actual problem
>> of figuring out which control to use to userspace, while the kernel
>> is actually in a better place to make this decision since the kernel
>> already uses DMI based quirks to deal with model specific configuration.
> 
> Again, this only works in cases where there's only one option for the
> control that could be used.

Which is the case in all the current models which I'm trying to get
the mute LED supported on.  In its current form this is all purely
handled inside the kernel, so we can easily change / extend the mechanism
later without any problems.

OTOH adding an interface where userspace can runtime set which control
to use for this, would require adding some userspace API for this.

To me it seems like a really bad idea to add userspace API for this now,
when we don't actually have hardware which needs this. Introducing
userspace API for this now introduces a significant risk that we get the
API wrong, since we don't actuall have a use-case where we actually need
the suggested flexibility. And then if such a use-case does eventually
pop-up we might very well have gotten the userspace API for this wrong.

I'm not saying that we will never need such flexibility, but we do not
need it *now*, so as I said before lets cross that bridge when we reach it. 

Regards,

Hans

