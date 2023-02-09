Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C0C68FD7A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 03:57:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0005083B;
	Thu,  9 Feb 2023 03:56:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0005083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675911460;
	bh=OZK2kkdKH8Ls1LW/GjPAk5L06H//RE5XuIBlP7p91fI=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WQlYsXSlDr7dEynHDpkaGMfKuNC/A5f3B8jHZnI10EcpwLw5AM6KcEeXygmCgbpi3
	 ws6+jCm8aD00g59l1tGoROJ+pKy/9DUCrQz5bIMgWztLYZJrtmUO+fGnmPL1VpYiB/
	 kQ9xOT3qGa+D9krCvLKmNXjYrKZNfioAm3Mr0rGE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55F74F800B8;
	Thu,  9 Feb 2023 03:56:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 349EEF800E4; Thu,  9 Feb 2023 03:56:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FF94F80027
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 03:56:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FF94F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=landley-net.20210112.gappssmtp.com
 header.i=@landley-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=cpXzCzr+
Received: by mail-oo1-xc29.google.com with SMTP id
 y13-20020a4ae7cd000000b0051a750e2ebdso97037oov.5
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 18:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MeuDR87mT5oZz0xYPlgMzWTRgnSVFdT+RIi9fTOHK48=;
        b=cpXzCzr+cz0YwMg8OioZbOdFT6x6Xm6HxQuCqdoPsmS9hedulw1eO6Kk/3hEebcpma
         XmVmNXfmMApG2N79Si3uHiYwQf3pkrY8yoF8TXhNqwM63RW+rXEAr2c9GvCwLnpdMizZ
         /i8XL5yNmB4lLP5zpVm7le3plURiLI5xI0pF39yvS1te1cCGkPno0+9YUYvh8/jIQets
         PkfeCX7kq7oaaZINx71/ntTci+5+uSn1VJ3kfEYljJIBKf1cp8PDE/LSANc9+WdWamP2
         UdiemMHM1/q9NSBnjYTg3Wlj/GIvYnBRMQxV2QKkM2GCOhCzUuRGyTbkMr557hPEVKAp
         8+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MeuDR87mT5oZz0xYPlgMzWTRgnSVFdT+RIi9fTOHK48=;
        b=AAiFFSg+uuSy/1pruUUCeH8Nw+LLIHUkbK9fXmCNfwCfMogszn6XD0HsFDn5iAywt3
         M9a8cKwmGkaICb3NKuvwhBHL9KGmI+ar8uI3/lm2ZUEmP70RRioCU+S+aWSi70T2N+Nl
         LTTot/I/lkcfFwnuM71hcG7eNtiQxEa6UxzveQeFarutlmJDdT4L4pcLPCLgMmWo7kj4
         3iYA7GkcIpRMKsgGuijPJmiUKzYgfaIDCypdmAx4pWGYvK0kv6+EMJQ3nN5zMi997G0n
         UHcDuhv3dRWXFK99lRp4BzeASvFkD9mWl6XV8/EGDvInkC9eENhGALaM3ibcKb3BNmet
         9ciw==
X-Gm-Message-State: AO0yUKUdPYc7wHftMv76QYe0IFjQ7c5rckePbciSWGv4rQO3B3aw1A3P
	TFj4E7F0sJ+5SvfLCbFk1i0dHA==
X-Google-Smtp-Source: 
 AK7set/z8RwoK5zLi99e0gYyO0saoOIvr4Qi+M0w1VEg8sxij2tCPL/DbU7DENRObgoCAx8yBLGhmQ==
X-Received: by 2002:a4a:9b8e:0:b0:51a:48f4:75de with SMTP id
 x14-20020a4a9b8e000000b0051a48f475demr241022ooj.0.1675911397288;
        Wed, 08 Feb 2023 18:56:37 -0800 (PST)
Received: from [192.168.86.224] ([136.62.38.22])
        by smtp.gmail.com with ESMTPSA id
 bm9-20020a056820188900b004f8cf5f45e9sm133765oob.22.2023.02.08.18.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 18:56:37 -0800 (PST)
Message-ID: <1c6e7a19-a650-1852-6f74-ca5547db44c4@landley.net>
Date: Wed, 8 Feb 2023 21:09:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: remove arch/sh
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig <hch@lst.de>
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <60ed320c8f5286e8dbbf71be29b760339fd25069.camel@physik.fu-berlin.de>
 <0e26bf17-864e-eb22-0d07-5b91af4fde92@infradead.org>
 <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
From: Rob Landley <rob@landley.net>
In-Reply-To: 
 <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LJ4E7KAHLJFXDE3I6T66Z4SAK7W2XDSO
X-Message-ID-Hash: LJ4E7KAHLJFXDE3I6T66Z4SAK7W2XDSO
X-MailFrom: rob@landley.net
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arch@vger.kernel.org, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sh@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LJ4E7KAHLJFXDE3I6T66Z4SAK7W2XDSO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/8/23 06:13, John Paul Adrian Glaubitz wrote:
> Hi Randy!
> 
> On Tue, 2023-02-07 at 17:31 -0800, Randy Dunlap wrote:
>> 
>> On 2/7/23 01:06, John Paul Adrian Glaubitz wrote:
>> > Hello Christoph!
>> > 
>> > On Fri, 2023-02-03 at 08:14 +0100, Christoph Hellwig wrote:
>> > > On Mon, Jan 16, 2023 at 09:52:10AM +0100, John Paul Adrian Glaubitz wrote:
>> > > > We have had a discussion between multiple people invested in the SuperH port and
>> > > > I have decided to volunteer as a co-maintainer of the port to support Rich Felker
>> > > > when he isn't available.
>> > > 
>> > > So, this still isn't reflected in MAINTAINERS in linux-next.  When
>> > > do you plan to take over?  What platforms will remain supported and
>> > > what can we start dropping due to being unused and unmaintained?
>> > 
>> > I'm getting everything ready now with Geert's help and I have a probably dumb
>> > question regarding the MAINTAINERS file change: Shall I just add myself as an
>> > additional maintainer first or shall I also drop Yoshinori Sato?
>> > 
>> > Also, is it desirable to add a "T:" entry for the kernel tree?
>> 
>> Yes, definitely.
> 
> Geert has suggested to wait with adding a tree source to the entry until I get my
> own kernel.org account. I have enough GPG signatures from multiple kernel developers
> on my GPG key, so I think it shouldn't be too difficult to qualify for an account.

So you're not planning to use https://lk.j-core.org/J-Core-Developers/sh-linux
but push to kernel.org and ask Linus to pull from there?

> Adrian

Rob
