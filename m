Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3902FA1D3
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 14:40:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 991121830;
	Mon, 18 Jan 2021 14:39:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 991121830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610977231;
	bh=sJuxReEOnD40f5KlRcCpImbmJVHJTqpDeA4+g5o582U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nB3LQo1RlPSotOSFWCk69C9brKUvcy9/J+9MaU8phXK1wl4ZQ77oYhHiNIES7M4RJ
	 zV94RUfQGlZQX2H7mv2X+fIyqruk06pCamyEr1JBOOGMCIKpI+pVmg8uq1iVX1qLQe
	 kuLwwF+MRn0BZqtktFLLSE0nyyM3RVFG0VfYsTVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1807FF80137;
	Mon, 18 Jan 2021 14:38:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A8E5F8016E; Mon, 18 Jan 2021 14:38:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E4F1F800C0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 14:38:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E4F1F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="N0lXgeVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610977131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AYQO73uwXR/ZL0KjvgARb0aP86zDIIQGfBxMVvC8Sn4=;
 b=N0lXgeVps9CwauWJT3GtC8jEm/NhWljmL0uIJa/fpFB6FPmXwl2WdH3hwFGUNXM8d1GCug
 h4irreTdhTenLRf3jVw/h0fxa34HO6t4KkYqIiyUYurGgZbm1SCYoN5g3eToo7BDl5e1yk
 v+f3SKi77Lwu2gpmjxEXL2Dje9LXxGc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-vwPHQPsfMre12NgT1K8jJQ-1; Mon, 18 Jan 2021 08:38:49 -0500
X-MC-Unique: vwPHQPsfMre12NgT1K8jJQ-1
Received: by mail-ej1-f72.google.com with SMTP id md20so681258ejb.7
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 05:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AYQO73uwXR/ZL0KjvgARb0aP86zDIIQGfBxMVvC8Sn4=;
 b=rRxF1f7LZ675Y5sNiJpjt1cPEPLZEKAp6aEpeVk6KX4iEJQvZ2msAJ12eIfb9VlGT+
 /VbH5uUFIG4lFhzu4uTv/WIiUwRpfxoTmzBC/A5RWHArswMl3MMxMcl7SXKzyvdDGUFE
 2cgE7JaGQL/teRFTXRmf27KlzK2IRvLYHWpKV3wumA5IUyo491rdFHp0kUit3MLw8HjZ
 9brftuBpsHv5vhej/EveDh37zYSzJHBqsrizG/yyhVyCmee9O/T7UST4xMHF4bmIoefc
 hcRmKEhOXrK+4ItOonCwqfRy31hMzZAEIxlDj8jwqOtEjDTh4ReU7OhzwEXfuRxgKBiI
 IIHg==
X-Gm-Message-State: AOAM5306a3a5LbNJHo7ubls5rfX/4+vTVAs3oX51wv1n3MbU3GOPjlwl
 zJRLcxprv3fV57YZcRcbqbW6V0xqAqc9YD0mQe+JQwPy/NobmxQ+lkS8PEgZYxyBy/3w+GcOM5c
 97ZJ5fj0bjWoMz9VMmQepOxw=
X-Received: by 2002:a17:906:1701:: with SMTP id
 c1mr17201947eje.395.1610977128398; 
 Mon, 18 Jan 2021 05:38:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzs9Mb0hyp3+/u1P/YLkrfyR15h8tNHy4A8YnxJgQj8rrfaGCKzEE7napeuqoudh9UX1EuRhw==
X-Received: by 2002:a17:906:1701:: with SMTP id
 c1mr17201937eje.395.1610977128246; 
 Mon, 18 Jan 2021 05:38:48 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id n6sm2542455ejg.102.2021.01.18.05.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 05:38:47 -0800 (PST)
Subject: Re: [PATCH v3 3/5] mfd: arizona: Add support for ACPI enumeration of
 WM5102 connected over SPI
To: Mark Brown <broonie@kernel.org>
References: <20210117212252.206115-1-hdegoede@redhat.com>
 <20210117212252.206115-4-hdegoede@redhat.com>
 <20210118130227.GI4455@sirena.org.uk>
 <5ccf48f4-45dc-3a30-3d6a-cce066f01270@redhat.com>
 <20210118133449.GL4455@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <45a5de45-d7d9-8505-9009-3774a444f70f@redhat.com>
Date: Mon, 18 Jan 2021 14:38:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210118133449.GL4455@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Christian Hartmann <cornogle@googlemail.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Lee Jones <lee.jones@linaro.org>
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

On 1/18/21 2:34 PM, Mark Brown wrote:
> On Mon, Jan 18, 2021 at 02:13:50PM +0100, Hans de Goede wrote:
> 
>> More in general I'm not aware of any (recent-ish) x86 GPIO controllers
>> not being able to do active low interrupts. In theory we could hit this
>> code path on ARM devices using ACPI enumeration, but I don't think it
>> is likely we will see a combination of ARM + ACPI enumeration +
>> WM5102 + GPIO controller not capable of active-low interrupts.
> 
> I've not seen this issue on any ARM based systems.
> 
>> This overriding of the flags definitely is necessary on the Lenovo
>> devices in question. I could add a
>> "if (dmi_name_in_vendors("LENOVO"))" guard around it, but that
>> seems unnecessary.
> 
> Possibly just an update to the comment to make it clear that some
> firmwares might legitimately set the flag
That seems sensible, I will wait a bit to so if you (or someone)
has any more review remarks to this series and then send out
a v4 with the comment updated.

Regards,

Hans

