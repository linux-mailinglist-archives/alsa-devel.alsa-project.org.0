Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 108A6313E9E
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 20:14:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E56816A2;
	Mon,  8 Feb 2021 20:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E56816A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612811652;
	bh=zHsp4P3+0Bq8f7kOYy7DcW6ZzNbTYs8KLNrTUc88KA8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sKnlNfaM44kutYHyg3viQK/R78d3gyVV1pJoq0dkYMP0Gm+WLCpoB5gNQNXVKsMkE
	 4VxyAdU21DUQ4uRYOe8yEL+/GWIme4yoUE4C6YnPbox0Qv7DYKuENPBWVx5L3QR1o7
	 8KadWV047p2ojvepIqjkHUK+ke8sf68FMSSAA9cg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0CDFF8026B;
	Mon,  8 Feb 2021 20:12:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C4AEF80264; Mon,  8 Feb 2021 20:12:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 890B6F80169
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 20:12:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 890B6F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="UrpIYTmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612811557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ga/01DJtnt1YQ1TickbSUnZPUyWpDjUziTg4Oj+MDw=;
 b=UrpIYTmPb1BqGcad/3pcSdQ0I9nO7OprhPIptygf9ahU0ND0Ir8D6WbhacrA6AEiumS7fW
 6KL1X3T/8HuGcjgLFfNY8oTDY3iqg0TymsjWUgS969OLow0k5LBwx6xcyYH4zxfx+qayc9
 um44Hb0w7n30XCkv1oNDuWJiseWldX4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-uja1zC_5MMq4VvMewpLTzA-1; Mon, 08 Feb 2021 14:12:36 -0500
X-MC-Unique: uja1zC_5MMq4VvMewpLTzA-1
Received: by mail-ej1-f70.google.com with SMTP id yc4so12963420ejb.2
 for <alsa-devel@alsa-project.org>; Mon, 08 Feb 2021 11:12:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ga/01DJtnt1YQ1TickbSUnZPUyWpDjUziTg4Oj+MDw=;
 b=FxYIfaacwLxhShBVpl/LiQn5FA8ZpA9t37j/Glqbex1OO7+mmDP2Qv0OSuBcxt2lDd
 pIOndJ3RJHOzZ8zC7gf/6GXyUd9oFvqKYTm+sT6h2CvL/5FpLV6342Ps6ycrS36Gu+DO
 A2PMqjnPLEkIZgvR+LH90JGUfiPzypXkc7rX4sO4qoY/8IMjfzvzyq6ZPdcd1P13Jnfa
 ID/z3KlaqAbOXoUW/eA6l7JTBF9HSK2vuSH6UyRkG+P+44pPYAk3oTvlk5kGI4fIDZJu
 dvxkCLEF9m5Qr+JUcqwD2+yFQzBurhS62ZvLLLuLVq5eOo8JNLtJUm2O5jM2GlMHzhla
 sZbw==
X-Gm-Message-State: AOAM531IR9cA+YcIwtgfN4FDCUzeVD/4NIkA2J14iee8RsCbrGefg0D4
 dL8N/xfuzBAkpjptU5Z1GPXDw+H9NllLF9g6ba2KJJ6vKe8KZ3i9B8gbZ+1fZUSmZdHlbwIp+F1
 LDdML6uhAMHWnNvRNiYayvHztGk1aLoHiMspZJgJGOqV0MZzpchfwr5s++k6LqZ5k5tgv4j9QmI
 g=
X-Received: by 2002:a05:6402:22f6:: with SMTP id
 dn22mr11621072edb.277.1612811554570; 
 Mon, 08 Feb 2021 11:12:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzItzCsMyLoaRlWPHUWtyEGWvLqhTsVHre+EcZmnPs1dPt8yhgvLufn3Kr2SsDE8JIgKx8kQ==
X-Received: by 2002:a05:6402:22f6:: with SMTP id
 dn22mr11621045edb.277.1612811554354; 
 Mon, 08 Feb 2021 11:12:34 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id x17sm10032753edd.76.2021.02.08.11.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 11:12:33 -0800 (PST)
Subject: Re: [PATCH v4 resend 00/13] MFD/extcon/ASoC: Rework arizona codec
 jack-detect support
To: Lee Jones <lee.jones@linaro.org>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20210204112502.88362-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <ba9c1add-8ac0-766b-4577-1c2769c0e5e6@redhat.com>
Date: Mon, 8 Feb 2021 20:12:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204112502.88362-1-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
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

Hi Mark, Lee,

On 2/4/21 12:24 PM, Hans de Goede wrote:
> Hi all,
> 
> Here is v4 of my series to rework the arizona codec jack-detect support
> to use the snd_soc_jack helpers instead of direct extcon reporting.
> 
> This is a resend with some extra *-by tags collected and with the extcon
> folks added to the "To:" list, which I somehow missed with the original
> v4 posting, sorry.
> 
> This is done by reworking the extcon driver into an arizona-jackdet
> library and then modifying the codec drivers to use that directly,
> replacing the old separate extcon child-devices and extcon-driver.
> 
> This brings the arizona-codec jack-detect handling inline with how
> all other ASoC codec driver do this. This was developed and tested on
> a Lenovo Yoga Tablet 1051L with a WM5102 codec.
> 
> This was also tested by Charles Keepax, one of the Cirrus Codec folks.
> 
> This depends on the previously posted "[PATCH v4 0/5] MFD/ASoC: Add
> support for Intel Bay Trail boards with WM5102 codec" series and there
> are various interdependencies between the patches in this series.
> 
> Lee Jones, the MFD maintainer has agreed to take this series upstream
> through the MFD tree and to provide an immutable branch for the ASoC
> and extcon subsystems to merge.
> 
> Mark and extcon-maintainers may we have your ack for merging these
> through the MFD tree ?

Now that the pre-cursor (1) series to this has been merged, I guess it
is time to decide how to merge this series. 

Chanwoo Choi has given his ack to merge the extcon bits through the MFD
tree and since Mark has expressed a preference for merging ASOC patches
directly I guess that it would be best to merge 1-6 through the MFD
tree and then Lee can send Mark a pull-req and Mark can apply the others? :

1/13  mfd: arizona: Drop arizona-extcon cells
2/13  extcon: arizona: Fix some issues when HPDET IRQ fires after the jack has been unplugged
3/13  extcon: arizona: Fix various races on driver unbind
4/13  extcon: arizona: Fix flags parameter to the gpiod_get("wlf,micd-pol") call
5/13  extcon: arizona: Always use pm_runtime_get_sync() when we need the device to be awake
6/14  ASoC/extcon: arizona: Move arizona jack code to sound/soc/codecs/arizona-jack.c

1 is:    Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
2-6 are: Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Note patch 6 renames drivers/extcon/extcon-arizona.c to sound/soc/codecs/arizona-jack.c
but it does not touch any other files under sound/soc (including NOT touching
sound/soc/codecs/Makefile that is done in a later patch). So it cannot cause any
conflicts.

Mark, would merging 1-6 through the MFD tree, and you applying the rest
(which are all ASoC patches) work for you ?

Regards,

Hans


1) "[PATCH v4 0/5] MFD/ASoC: Add support for Intel Bay Trail boards with WM5102 codec"

