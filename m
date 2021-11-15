Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 004674560B7
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:39:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 794E518B1;
	Thu, 18 Nov 2021 17:38:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 794E518B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253577;
	bh=pGaWHVU6GKAL/hxwHEMRHknzyUA7ZRlZ6fRUKgNJh6I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ajo2LtXRZtniRhsvYzGOLN0jttjkmpkdbQcrDzGvzIuYYxBFWlJ1rEXuGH19Nh70S
	 tB/NjSEYnDtniv14TtSXwQKHkOPWUUlj3Iko+jUGPwvkmV0IxY5Lf1SzNpG0XQuN/8
	 V8uAak+zs8zBoARo20DUHSY7POJWSLobTm50kGsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FF60F80551;
	Thu, 18 Nov 2021 17:33:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC0C0F8027D; Mon, 15 Nov 2021 15:46:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2408DF800FA
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 15:46:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2408DF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MKv4lJzo"
Received: by mail-lj1-x231.google.com with SMTP id k23so7954619lje.1
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 06:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f9990VLRY1mM2sii4oucAgZqtJr4f6UTn2nlUsBeiyA=;
 b=MKv4lJzovSleVVtb8Uez4QS8nWVoyslVc4dAhZ3Ja9hcfOWhdQeyMWw6FHhrLjYpMe
 nYJhoHPJHieO78N1tejBSn1JjrO7HehrBzOD6p80ebHQ/GkZbHzj+oDCc5U4EAGGyBKV
 xbJLawSqjqY4fBNx9jKlTQhw4P401MYqth7VhZkzSxvdhwOw2g0BxwUpHsNeyVoCEXwg
 AneGSb38fLLRS0lfd/WXUhHjDQTfopD289+UYtNAyG6eoU7lhx2ZHI9h8rOgSDINeyOy
 BSHVlS4ECWcjRF5ej1E2mdUBpiNe11q16/40ayNE4SINNFWYIMy3ZhzwXNTN4fPHDK38
 wMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f9990VLRY1mM2sii4oucAgZqtJr4f6UTn2nlUsBeiyA=;
 b=rB4v1WadEO6vspqRr/lt0Me2xkE+23U0WRi2LYTDaC/KaNKdZGfZHBm7Ek4C3cWRcs
 tVP7K7w+DL+rHP8anQ6DcJo86dAncJNm4/Edj99VllynaLHZuVwDdaU4OAcQ8LQU4MKS
 JScvdBi2pWYUfOGXDYhQDMXU4q95xESxJ11ehZmLZlps97t4vBBcEfYn1S8hblVM3BV6
 T6AHg41X82P4UG8szGEm3t8xNvcP05csP/cSjc82swOVuAU//PCeHJuDCv1HvXNQ4uMD
 OvW7VzLdMuhSPhtFCrdmLAzwCNN8k5A4hVKRNL513K0KXZCO6zR+u4iWXZ7yZv33+lpD
 3qJg==
X-Gm-Message-State: AOAM532uFRv07MLu1vvyzHUSZ3QPE3Q1sXmfyZmDsvdZjnxim9mugZEu
 WoDyoZm8qwXvoGylLAT1d6g=
X-Google-Smtp-Source: ABdhPJyGzX+uJoClUoX59O9YRdwTgWzR3XA1e/9PtaHs0iyNVaYjGst0rpo/clkWJ4amyTD6J2hiFA==
X-Received: by 2002:a2e:b711:: with SMTP id j17mr29887114ljo.39.1636987584324; 
 Mon, 15 Nov 2021 06:46:24 -0800 (PST)
Received: from [192.168.2.145] (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.googlemail.com with ESMTPSA id j2sm1445777lfr.109.2021.11.15.06.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 06:46:24 -0800 (PST)
Subject: Re: [PATCH 01/11] ASoC: dai_dma: remove slave_id field
To: Lars-Peter Clausen <lars@metafoo.de>, Arnd Bergmann <arnd@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-2-arnd@kernel.org>
 <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de>
 <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
 <d2dd42fc-e58a-0c06-7f7e-a6a2161c368d@metafoo.de>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5737810c-420a-2f8d-99bf-24a2558d5855@gmail.com>
Date: Mon, 15 Nov 2021 17:46:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d2dd42fc-e58a-0c06-7f7e-a6a2161c368d@metafoo.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 18 Nov 2021 17:33:04 +0100
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi <linux-spi@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-staging@lists.linux.dev,
 Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, dmaengine@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Baolin Wang <baolin.wang7@gmail.com>
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

15.11.2021 14:53, Lars-Peter Clausen пишет:
> On 11/15/21 11:42 AM, Arnd Bergmann wrote:
>> On Mon, Nov 15, 2021 at 11:14 AM Lars-Peter Clausen <lars@metafoo.de>
>> wrote:
>>> On 11/15/21 9:53 AM, Arnd Bergmann wrote:
>>>> From: Arnd Bergmann <arnd@arndb.de>
>>>>
>>>> This field is never set, and serves no purpose, so remove it.
>>> I agree that we should remove it. Its been legacy support code for a
>>> while, but the description that there is no user is not right.
>>>
>>> The tegra20_spdif driver obviously uses it and that user is removed in
>>> this patch. I think it makes sense to split that out into a separate
>>> patch with a description why the driver will still work even with
>>> slave_id removed. Maybe the best is to remove the whole tegra20_spdif
>>> driver.
>> Ok, I'll split out the tegra patch and try to come up with a better
>> description for it. What I saw in that driver is it just passes down the
>> slave_id number from a 'struct resource', but there is nothing in
>> the kernel that sets up this resource.
>>
>> Do you or someone else have more information on the state of this
>> driver? I can see that it does not contain any of_device_id based
>> probing, so it seems that this is either dead code, the platform_device
>> gets created by some other code that is no longer compatible with
>> this driver.
> 
> I've looked into this a while back, when I tried to remove slave_id. And
> as far as I can tell there were never any in-tree users of this driver,
> even back when we used platform board files. Maybe somebody from Nvidia
> knows if there are out-of-tree users.

That Tegra SPDIF driver was never used. Still there is a growing
interest nowadays in making it alive by implementing HDMI audio support
for Tegra20 SoC. It was on my todo list for a long time, I'll try to
prioritize that work 5.17, it shouldn't take much effort.

The slave_id should be removed anyways, it won't be needed.
