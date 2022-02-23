Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC884C194E
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 18:05:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14C351A16;
	Wed, 23 Feb 2022 18:04:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14C351A16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645635939;
	bh=KFQqkJ+NY64IFC9MX4r8PHfoK8FmtKowVc1HI7SEFmQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yg260fHIALQTQjM+NOpVTWcuPSrU4i2KSbko5CIIvmdE7XDVnn3kkWXEC/G6syQf7
	 I/yXqoMb8mobYNogLcyec5YaKrtuZWjj2CT8k46xrZEIcyzGGDVxnNV3XqMkeGva77
	 RjVfkz435Au9o/sC6FF1XKkteYv5pYQ1XdXPPC8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72F71F800B6;
	Wed, 23 Feb 2022 18:04:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B9C5F80237; Wed, 23 Feb 2022 18:04:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 158BFF8019D
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 18:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 158BFF8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="t5lclKDl"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4C0BB4001E
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 17:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645635860;
 bh=RoNX8EzuGJlB3iCJ6r1tFSNiwtZPxPTTbVDAWTvRXkY=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=t5lclKDlzHrV61E3xQ7fimMgjmM2n5rDd0btVK9I03TPKpnyFIIm7x4t9qhP4eMcQ
 Pag/ncTK9Vi3NuWdd1turQqeqE47fC1MhwFwYRArN1cfOpgkyi266UZLHv3GQDD9bv
 L21QYatk7gs4XC151kHhISS6MyqlStmBqnvevhqhpa6Rd0J9+rsAyU5EIUkF2INYMX
 0qd/vRYuFKtkGPf1nAf8Vq4TNGg0e0merwJ0fflacQBN0+JNq+HMQK0Q+NSqyyP+TU
 BtILrZKNYYZ9AxY2xiYBwxcRnQNMkxTzFhhVScfQX9hD+BxvcHaq3OrUP5yY4kWXXD
 1feqbyIF1d0yA==
Received: by mail-ej1-f69.google.com with SMTP id
 nb1-20020a1709071c8100b006d03c250b6fso7254663ejc.11
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 09:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RoNX8EzuGJlB3iCJ6r1tFSNiwtZPxPTTbVDAWTvRXkY=;
 b=I48wSTP2m2kZ7HVhwF3+7batSkNbyM4qe9VsY6F1t9qmtnV60vRC+MaP40MWRM3OH2
 GapFyBekkZ91mjypLXlO2qbqpgTvYf7LR9ai7zW3IaO8Gtnkp6QEGE3e2RZfbJ2T9W2n
 qR+5HpZPo0oJa5Yul3jdeWR2CvEJwtZEx4ewvxsAIeLJB1+VUQb0RS9u5SKfZCylVPwQ
 OGwmwz9TquG17Z6dADwqG6iHF+KdZRetJ2aXwnW92Wjqb2PHcU6aqKqQXo/0HHR3THg2
 AQ1Vr93y3+stKcjKWsGjNbdvWh9mkFvsV3yRZGf/x3EqU5GoNRbsgLm4qDUJcA2gXlA6
 tcBw==
X-Gm-Message-State: AOAM5300BSRhJOJbumA4uc2MQAQnfFvWakrcEngSb6H2tCh6S16jpTy1
 0ZTEPPInqI2bkenqtcPor/MoSRCWsQa5w90cTLFNUIEgiwsCwR006GQ18onAXTbiIisuiUJ0qAc
 uZvntqEqSzB45DXDkWkw0ToBtvOFnp3sxx8z57dJ0
X-Received: by 2002:a05:6402:5209:b0:412:7cd8:a8fc with SMTP id
 s9-20020a056402520900b004127cd8a8fcmr343345edd.51.1645635859401; 
 Wed, 23 Feb 2022 09:04:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKr+v6ocNLmVN3Di+yw0uJzDvkvv4Lb5lc33wOhtzJOFkvu7xL2E/jifTka6zh9g0DFLs/uA==
X-Received: by 2002:a05:6402:5209:b0:412:7cd8:a8fc with SMTP id
 s9-20020a056402520900b004127cd8a8fcmr343312edd.51.1645635859189; 
 Wed, 23 Feb 2022 09:04:19 -0800 (PST)
Received: from [192.168.0.126] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id fy37sm73162ejc.219.2022.02.23.09.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 09:04:17 -0800 (PST)
Message-ID: <7fcd5ed9-4577-950a-0cdc-22917e8e26af@canonical.com>
Date: Wed, 23 Feb 2022 18:04:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFT PATCH 0/3] Fix kfree() of const memory on setting
 driver_override
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Abel Vesa <abel.vesa@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
References: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
 <708eabb1-7b35-d525-d4c3-451d4a3de84f@rasmusvillemoes.dk>
 <afa7001d-901e-55bf-b8dc-77051b1e7f78@canonical.com>
 <0442526f-b6d9-8868-ac1c-dd11a2d3b2ab@arm.com>
 <636e5b92-8ed8-35a1-d6e9-516d5b35be91@canonical.com>
 <e0bc8dd2-bea9-354b-3b48-3123e0bbf717@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <e0bc8dd2-bea9-354b-3b48-3123e0bbf717@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 23/02/2022 16:08, Robin Murphy wrote:
> On 2022-02-23 14:22, Krzysztof Kozlowski wrote:
>> On 23/02/2022 15:04, Robin Murphy wrote:
>>> On 2022-02-22 14:06, Krzysztof Kozlowski wrote:
>>>> On 22/02/2022 14:51, Rasmus Villemoes wrote:
>>>>> On 22/02/2022 14.27, Krzysztof Kozlowski wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Drivers still seem to use driver_override incorrectly. Perhaps my old
>>>>>> patch makes sense now?
>>>>>> https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/
>>>>>>
>>>>>> Not tested - please review and test (e.g. by writing to dirver_override
>>>>>> sysfs entry with KASAN enabled).
>>>>>
>>>>> Perhaps it would make sense to update the core code to release using
>>>>> kfree_const(), allowing drivers to set the initial value with
>>>>> kstrdup_const(). Drivers that currently use kstrdup() or kasprintf()
>>>>> will continue to work [but if they kstrdup() a string literal they could
>>>>> be changed to use kstrdup_const].
>>>>
>>>> The core here means several buses, so the change would not be that
>>>> small. However I don't see the reason why "driver_override" is special
>>>> and should be freed with kfree_const() while most of other places don't
>>>> use it.
>>>>
>>>> The driver_override field definition is here obvious: "char *", so any
>>>> assignments of "const char *" are logically wrong (although GCC does not
>>>> warn of this literal string const discarding). Adding kfree_const() is
>>>> hiding the problem - someone did not read the definition of assigned field.
>>>
>>> That's not the issue, though, is it? If I take the struct
>>> platform_device definition at face value, this should be perfectly valid:
>>>
>>> 	static char foo[] = "foo";
>>> 	pdev->driver_override = &foo;
>>
>>
>> Yes, that's not the issue. It's rather about the interface. By
>> convention we do not modify string literals but "char *driver_override"
>> indicates that this is modifiable memory. I would argue that it even
>> means that ownership is passed. Therefore passing string literal to
>> "char *driver_override" is wrong from logical point of view.
>>
>> Plus, as you mentioned later, can lead to undefined behavior.
> 
> But does anything actually need to modify a driver_override string? I 
> wouldn't have thought so. I see at least two buses that *do* define 
> theirs as const char *, but still assume to kfree() them.

I think the drivers/clk/imx/clk-scu.c (fixed here) does not actually
need it. It uses the feature to create multiple platform devices for
each clock, with unique names matching the clock (e.g. pwm0_clk,
pwm1_clk) and then bind all them via common clock driver.

It looks therefore like something for convenience of debugging or going
through sysfs devices.

Removal of driver_override from such drivers is a bit too much here,
because I would not be able to test it.

> 
>>> And in fact that's effectively how the direct assignment form works
>>> anyway - string literals are static arrays of type char (or wchar_t),
>>> *not* const char, however trying to modify them is undefined behaviour.
>>>
>>> There's a big difference between "non-const" and "kfree()able", and
>>> AFAICS there's no obvious clue that the latter is actually a requirement.
>>
>> Then maybe kfreeable should be made a requirement? Or at least clearly
>> documented?
> 
> Indeed, there's clearly some room for improvement still. And I'm not 
> suggesting that these changes aren't already sensible as they are, just 
> that the given justification seems a little unfair :)

Yeah, maybe also my "const" in the title and commit is not accurate. I
think that literal strings are part of .rodata (and objdump confirm)
thus are considered const.

> Even kfree_const() can't help if someone has put their string in the 
> middle of some larger block of kmalloc()ed memory, so perhaps 
> encouraging a dedicated setter function rather than just exposing a raw 
> string pointer is the ideal solution in the long term.


Best regards,
Krzysztof
