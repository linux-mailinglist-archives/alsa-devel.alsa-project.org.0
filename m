Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 968AB2E28CE
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Dec 2020 21:42:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 193DE17FD;
	Thu, 24 Dec 2020 21:41:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 193DE17FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608842540;
	bh=JAQyv4W4kH+EO8z09e8KSQcx+oGV2eTvt+OFDQsoOz0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qoWb6xnTd2wi7PYHEx50bU8+tTe7BAH5hEW5aP6oZgXQl1uwhYaHiK+4BPZN916QQ
	 aUiuba3uQQqV+ZP42qc/vXnntuncS6OQvG0uJv+LbrKSPw2yJxIQiPn/3ZuT79jcKl
	 vfq2GpjsfeCmy6iXCEqeylKrnVDj/6QRaafyZZ5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73DC0F80224;
	Thu, 24 Dec 2020 21:40:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AA7FF800CE; Thu, 24 Dec 2020 21:40:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B374F800CE
 for <alsa-devel@alsa-project.org>; Thu, 24 Dec 2020 21:40:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B374F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bertschiettecatte-com.20150623.gappssmtp.com
 header.i=@bertschiettecatte-com.20150623.gappssmtp.com header.b="LPW+oUdw"
Received: by mail-yb1-xb32.google.com with SMTP id k78so2980506ybf.12
 for <alsa-devel@alsa-project.org>; Thu, 24 Dec 2020 12:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bertschiettecatte-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tSyr6qkcvYbpyiBSBM+TXRGBi6HOleNiV7+FejsS8wI=;
 b=LPW+oUdwlGbmpo6DwzY6iCkUFl9YXCCR8TD9tdKHmHZovSHhBnezrdJPVzLPxky4TR
 TFwF06nf7/msdZLBTQRyTaV8E53TBxpAh5TdRj6Gti1x3QorQPjuz20pocOdvDlEruAC
 YrYjR88Mr4ntJeaD8oUscfHD2sdKN4wvsxJZcj4oDRblzIrtCz3kNrWcBLqNDrzd19eU
 PMpRwKTNPx1ZTO0pwDR628fhXJASbzY3Yk8Fnpa6PPvzEVik5/ziPKF4p0OABScoIx6F
 +DdwHfoBON9QXqzsSMtkLUk/Rb2yyyBaXbPo7grxEUrRcX8o+RX4a+/7MQKJa0hwBQge
 q7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tSyr6qkcvYbpyiBSBM+TXRGBi6HOleNiV7+FejsS8wI=;
 b=Rs8PiEIzRKwGrjWSJxqo7JOsQo7vl7o6yeGbC/MI5GcT+io3J+Vuhdj5cDx1hBuEbx
 j1y6WLyuTq/zvBo9KqcAU0WsGbD9ZO0VWQMjHMx7nDES0iPDYmKBA8r86sOCcYRITcst
 H+CKMvtSp/vp472UawlTrwAFjWny/Nq4NPmtZ6KzYmc2HDDd1nH9Rtj56Lz0QbrGOm0j
 xW03mYL0Lz9I0N7jKXK1lGq0JiAQxp1YBVnEehYWJmC656ZCQVxQIvt8RKOYNFXjRS6t
 CUrk5Q5/xM5k4YE49OZF0AUojeqMZJ7KvXjIBcY7FhNmNYvIccdKKE5OZkR+ZZlYwZHl
 kl0g==
X-Gm-Message-State: AOAM5307F5wS0V0kPSHAmHNzZumSJUUuxs7n4gn+3eaLywuOy5KY2iHZ
 O0HJVGh3kv7uq6WyuuKSjXx/RbXkM470WbU33WsU3w==
X-Google-Smtp-Source: ABdhPJwjosD4zdcoib2n/dWn5Sg6L9cHMqcGcGm2bxjGOBsHOkNjxZe0n/oVS1f+xqIbkQ1fclSXmE31YB9QT2fma1E=
X-Received: by 2002:a25:8608:: with SMTP id y8mr45176529ybk.324.1608842430818; 
 Thu, 24 Dec 2020 12:40:30 -0800 (PST)
MIME-Version: 1.0
References: <CALd3UbSrAqYFe5Z-S6NMKGaVMvOZx7C4zV5O7CwtTKPmV+UeVQ@mail.gmail.com>
 <CALd3UbS6MtKQEdhXQXH2GmU1EvZgS52XcTPihZ5wjb=4FaiYXA@mail.gmail.com>
 <CALd3UbQuDU6asvTkQTP48ct4hT9euUGUoenD5TW2ZD7gbuHPag@mail.gmail.com>
 <8fc2a9ae-c87a-03cd-4349-81d0ea3380d3@metafoo.de>
In-Reply-To: <8fc2a9ae-c87a-03cd-4349-81d0ea3380d3@metafoo.de>
From: Bert Schiettecatte <bert@bertschiettecatte.com>
Date: Thu, 24 Dec 2020 12:40:19 -0800
Message-ID: <CALd3UbQEJBqUqwx2ua9Sx1P3xr3uf221AVJUV7erp6MF0JegRg@mail.gmail.com>
Subject: Re: question about alsa tracepoints and alsa debugging
To: Lars-Peter Clausen <lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org
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

Hi Lars-Peter

> > occurs. The moment I start arecord, the console output from
> > speaker-test stops, so it's locked up by starting arecord.
> Are these implemented as two separate sound cards? If so I don't see how
> they could interfere with each other. There should not be any shared
> resources or locks between them at least on the ALSA side.

here are the definitions I've used in my driver - I had to translate
my old code from kernel 4.11 to using the new macros so not sure if
something got broken while doing that. I want my DAC and ADCs to be
one sound card device.

SND_SOC_DAILINK_DEFS(ak4458,
                     DAILINK_COMP_ARRAY(COMP_CPU("ff890000.i2s")),
                     DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "ak4458")),
                     DAILINK_COMP_ARRAY(COMP_PLATFORM("ff890000.i2s")));

SND_SOC_DAILINK_DEFS(ak5558,
                     DAILINK_COMP_ARRAY(COMP_CPU("audio-cpld")),
                     DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "ak5558")),
                     DAILINK_COMP_ARRAY(COMP_PLATFORM("audio-cpld")));

enum {
        DAILINK_AK4458,
        DAILINK_AK5558,
};

static struct snd_soc_dai_link rockchip_ak4458_ak5558_dai[] = {
        [DAILINK_AK4458] = {
                        .name = "Audio out",
                        .ops = &rockchip_ak4458_dai_ops,
                        SND_SOC_DAILINK_REG(ak4458),
        },
        [DAILINK_AK5558] = {
                        .name = "Audio in",
                        .ops = &rockchip_ak5558_dai_ops,
                        SND_SOC_DAILINK_REG(ak5558),
        },
};

static struct snd_soc_card rockchip_ak4458_ak5558 = {
        .name           = "ak4458-ak5558-audio",
        .dai_link       = rockchip_ak4458_ak5558_dai,
        .num_links      = ARRAY_SIZE(rockchip_ak4458_ak5558_dai),
};

> If possible try to narrow this down a bit more, this will help to track
> this down. If this is a more general issue it is quite likely that this
> is a more recently introduced problem, otherwise others would have
> already run into it. Maybe try one of the stable kernels like v5.4.

I will play around with a few different versions to see what happens.

> To check if there is a locking issue somewhere compile your kernel with
> CONFIG_PROVE_LOCKING=y

do I need PROVE_RAW_LOCK_NESTING as well? what about PROVE_RCU and
PROVE_RCU_LIST ?

> Do both devices I2S and MMC use the same DMA? If so I could see things
> going wrong there since that would be shared resources in the DMA
> driver. If possible try to run the MMC driver without DMA and see what
> happens.

I think they both use DMA but I don't think the resources are shared,
from what I can tell. My version of dw_mmc.c is 99% the same code but
I just directly call my own callbacks in dw_mci_interrupt
instead of dealing with the tasklet or work stuff.

Thanks for helping!
Bert
