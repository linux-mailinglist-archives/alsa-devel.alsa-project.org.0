Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08196D10D4
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 16:07:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 829F7165D;
	Wed,  9 Oct 2019 16:06:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 829F7165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570630026;
	bh=y19Re3ZHYWK7TgI9oWVLDz76u8xSW7ivo2qCCTxsRHQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AasB8WCWUPQqDFub0l55TB8F1AF9o7berXaXjIryItPtV4aI/G1eIibdrrhBzakQd
	 9Wm0vTJM3JxQej/CKtK86mYUA9Oii8iddH69DM/bekBwqtwzA61uLRbRR6uQcgc3gb
	 29YQz7sV0uKnDItBA14/elCWMMkVRWU79k3og4Ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38210F802BD;
	Wed,  9 Oct 2019 16:05:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51891F802BE; Wed,  9 Oct 2019 16:05:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C59E6F800BF
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 16:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C59E6F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="r0N9yf2b"
Received: by mail-wm1-x341.google.com with SMTP id 7so2781707wme.1
 for <alsa-devel@alsa-project.org>; Wed, 09 Oct 2019 07:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Uj3uK+PXxvqbeopMnt61nNLWeJ5KhO8l4CJVLwumEdU=;
 b=r0N9yf2b+byu4vuI8y0JeeHavanBpTMDQpn/KaBT8Gm4fGqhrZiXJi0RqeKptEsRWn
 Br9sL6Yil/FWaiOqUwPcODWe94yJNRyZzu/B8LEWYVr9gHUdwbSDbtiDcmi2byyJImGC
 YXqINhsTJVv9QKm5SIub8rUPhTw6lqrIfQDn6bO+Fhi9lPH2JT8Tz16ne+srPsgphekB
 7HBBcyqyGGKSqEmo58Ndwm8VYH6Q/cg0zXvAVuOMeGHts28iFJiR2szzJePhV1zYuapJ
 ORG/XU7r4bwCNqLU+5GO4AscWIvAVeOsZPxTu36s4L+htHTizyP8MCAdOnMgeKp0V12x
 8nKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uj3uK+PXxvqbeopMnt61nNLWeJ5KhO8l4CJVLwumEdU=;
 b=WrRNn554IDHtp/dxDss5/KWMIGLHJ+XatqcC8XPPAZsPizy6nNJixQFKnxytX+X9KP
 EFq40eNZnLgSbegOxlb3vtEfZTx6ngOUV4vO3qZ1HNeiEV7J5tGUacU8Z2un6t4oHjAf
 FsT2OEKO40r0XpnOgsu5coRGW5UJK4+zN+97qW4PzDLwmzTIMUsk35jM2ENfFAZDGZyO
 viJQmziZH1RVMtyM9JiLR9xu7t5G9KvKYRDN70V0BHjV45md9bLynjdciFdftEhFj7aa
 9qOXICsI/Z/k7mpvL3jZKugRR9B1dtpUhFI/x1MN0NIDRwAusnk1dWj/1NEl674eT/n6
 GCvw==
X-Gm-Message-State: APjAAAU6Zm9dgtK1CdETXeBi0U3oFLdIBrTU5/IMx8eSH+APEv618/wx
 La/TQLpUqtc15ze3YZKm0UJ8/g==
X-Google-Smtp-Source: APXvYqwTU1rnlyXZsfzUTaF2tYxe+uafBqiZSZYxBNpBuDzM8Nr7Tt4r2+AOyoXwV4lcRyYbLYeo8Q==
X-Received: by 2002:a7b:ce12:: with SMTP id m18mr2759228wmc.108.1570629914590; 
 Wed, 09 Oct 2019 07:05:14 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id s12sm2897774wra.82.2019.10.09.07.05.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 07:05:13 -0700 (PDT)
To: Stephen Boyd <swboyd@chromium.org>, Cheng-yi Chiang <cychiang@chromium.org>
References: <20191007071610.65714-1-cychiang@chromium.org>
 <CA+Px+wWkr1xmSpgEkSaGS7UZu8TKUYvSnbjimBRH29=kDtcHKA@mail.gmail.com>
 <ebf9bc3f-a531-6c5b-a146-d80fe6c5d772@roeck-us.net>
 <CAFv8NwLuYKHJoG9YR3WvofwiMnXCgYv-Sk7t5jCvTZbST+Ctjw@mail.gmail.com>
 <5d9b5b3e.1c69fb81.7203c.1215@mx.google.com>
 <CAFv8Nw+x6V-995ijyws1Q36W1MpaP=kNJeiVtNakH-uC3Vgg9Q@mail.gmail.com>
 <5d9ca7e4.1c69fb81.7f8fa.3f7d@mx.google.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e968e478-bb48-5b05-b6c4-ae1bf77f714f@linaro.org>
Date: Wed, 9 Oct 2019 15:05:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5d9ca7e4.1c69fb81.7f8fa.3f7d@mx.google.com>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hung-Te Lin <hungte@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Dylan Reid <dgreid@chromium.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [alsa-devel] [PATCH] firmware: vpd: Add an interface to read
	VPD value
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 08/10/2019 16:14, Stephen Boyd wrote:
>> 3) As my use case does not use device tree, it is hard for ASoC
>> machine to access nvmem device. I am wondering if I can use
>> nvm_cell_lookup so machine driver can find the nvmem device using a
>> con_id. But currently the cell lookup API requires a matched device,
>> which does not fit my usage because there will be different machine
>> drivers requesting the value.
>> I think I can still workaround this by adding the lookup table in
>> machine driver. This would seem to be a bit weird because I found that
>> most lookup table is added in provider side, not consumer side. Not
>> sure if this is logically correct.
> Maybe Srini has some input here. It looks like your main concern is
> consumer to provider mapping?
> 

In non-DT setup, there are various ways to lookup nvmem provider.

1> nvmem_device_get()/put() using provider devid/name. I think you 
should be able to use this in your case.
2> nvmem_register_notifier() which notifies when nvmem provider is added 
to system.
3> nvmem_device_find() with own match function this will be merged in 
next window (https://lkml.org/lkml/2019/10/3/215)


If none of these are of any help, could explain what exactly are you 
looking for w.r.t nvmem to be able to move to what Stephen Boyd suggested?

--srini

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
