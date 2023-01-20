Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8B3675729
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 15:29:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D283E31F3;
	Fri, 20 Jan 2023 15:28:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D283E31F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674224973;
	bh=EZIeRf/yGs4cLUldzvciq/BiqwmdNV4jxJ89ldTzx74=;
	h=In-Reply-To:References:Date:From:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jJjq/zwcEZWeSdVM7YPyhsb5P0kIoeBOWwAjHLDZpXSo4RMH06heQsxgkN1OHlRsK
	 tOv8KJKWvHioyDmED1t3XgzOO/80kICJIGhcYWA4cCX1ENqHjnzfWFH8rEVu4k5kHy
	 u6Cd/jQcZ++4f/8EmDD94ZsQL/fHro0MflZxsbhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75081F80482;
	Fri, 20 Jan 2023 15:28:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B816F8026D; Fri, 20 Jan 2023 15:28:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCD27F800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 15:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCD27F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de
 header.a=rsa-sha256 header.s=fm2 header.b=DnMX5JrP; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=TFMIxvre
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0CA6A320082A;
 Fri, 20 Jan 2023 09:28:17 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 20 Jan 2023 09:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1674224897; x=1674311297; bh=fkHRcSTxE3
 JEfKy3VGeRsYMxwOkBi/LzRtU9Bqmf8IU=; b=DnMX5JrPFN1zKm40RGE7n7n0AB
 mSyLcKQ/DyA3dmvNNsh0RHPeCxss3QaigCtZ44vONkuNbIrsr2ihe/4hpHMK8Hrv
 gyQEuHTCn0gvZHkD3t2R20JtIlfLK+lSnz79y32XKGF3GZ85Ew0FcswDmhDLRi9A
 OSlk7dytVJaQY+GSShfkdIgQBmfwsScIxvUFihzht9TVEQlUo1rhXc79yCj+/Fge
 +cTZBkL4i1NkCMERaD/zmSN1n7jMBWUEXeVViwcelrOonyGJNy+FS/C1LQ6Usxyc
 YfuRmQF1AoNUGKmxMwzcBJaM1aaeFTbzOPWPlebRuXFinJpUhQ9Kam5mWTgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674224897; x=1674311297; bh=fkHRcSTxE3JEfKy3VGeRsYMxwOkB
 i/LzRtU9Bqmf8IU=; b=TFMIxvredoruK1eVNeS/DDwKhh1LKnzM080FD9uHa7ny
 4dwbe4amnxKBqJlgfGXtX8fZluC3Bs6gELsoJ9QvfzvYgj3Pq6E12xfZPgfYVrnL
 t7HxgHDDmAepj7MskME4PBaX6gi8j9B2yLJ2zjhSq+79qnzbsL59KlV+thG5VC3m
 pznn2DsatnuXLCXA6ef7ssfc5yrV63ux03R0mgzb2SeSzpf32kG4bMEQuMavyl6X
 8xUoMl1ytrYLLxF1vb8t7ntzkWc+WHdtcqWx67htJES0nJMQ0mKh8EuIPeLEFW4D
 4ICd0/flM5tXjH3Das2cupziyWqV2crDKLXBEdR7Vw==
X-ME-Sender: <xms:AKXKYw71lYr8ykbXUyJjwFvm9UG3sx7pjwcSaYWvJG2yYc6Vn8vm6Q>
 <xme:AKXKYx4H4hAZxiOPy1kUHaBNNf_W6G2jMWr4BXc_DyHm7D3g6gWPtlCEPA_1w8EF6
 CDN6wvPh7p8EPI_1Eg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:AaXKY_dTqs0st2G0CDaRNr9hOvijMx4OshZ0jPrzSW9hKXSRpeWDPQ>
 <xmx:AaXKY1IWjXeTsiQcqoC8GA2bGPpv7wrWoPT4U9PAOl7yjktndHEjMA>
 <xmx:AaXKY0Lx-5SDRCnagJQOG9MP4lANM4ceVd-16mrQRRQO7_86p3abww>
 <xmx:AaXKY3Zp3R-0jn8YCe6Sa0HXv0TE207fu-ZG7sF5nvN6Dt4yfo2fEg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DE899B60086; Fri, 20 Jan 2023 09:28:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <9f0ddd93-a7b6-4b21-86ed-8604fb8a44e1@app.fastmail.com>
In-Reply-To: <Y8qio/hwsP6+EG29@google.com>
References: <20230105134622.254560-1-arnd@kernel.org>
 <20230105134622.254560-20-arnd@kernel.org> <Y8qio/hwsP6+EG29@google.com>
Date: Fri, 20 Jan 2023 15:27:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 19/27] mfd: remove ucb1400 support
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Marek Vasut <marex@denx.de>, alsa-devel@alsa-project.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Daniel Mack <daniel@zonque.org>, linux-input@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jan 20, 2023, at 15:18, Lee Jones wrote:
> On Thu, 05 Jan 2023, Arnd Bergmann wrote:
>
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The ucb1400 MFD driver and its gpio and touchscreen child
>> drivers were only used on a few PXA machines that were unused
>> for a while and are now removed.
>> 
>> Removing these leaves the AC97 support as ALSA specific,
>> no other drivers are now connected through this interface.
>> 
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Cc: Lee Jones <lee@kernel.org>
>> Cc: Jaroslav Kysela <perex@perex.cz>
>> Cc: Takashi Iwai <tiwai@suse.com>
>> Cc: Marek Vasut <marex@denx.de>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-gpio@vger.kernel.org
>> Cc: linux-input@vger.kernel.org
>> Cc: alsa-devel@alsa-project.org
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  drivers/gpio/Kconfig                   |   7 -
>>  drivers/gpio/Makefile                  |   1 -
>>  drivers/gpio/gpio-ucb1400.c            |  85 -----
>>  drivers/input/touchscreen/Kconfig      |  16 -
>>  drivers/input/touchscreen/Makefile     |   1 -
>>  drivers/input/touchscreen/ucb1400_ts.c | 458 -------------------------
>>  drivers/mfd/Kconfig                    |  11 -
>>  drivers/mfd/Makefile                   |   1 -
>>  drivers/mfd/ucb1400_core.c             | 158 ---------
>>  include/linux/ucb1400.h                | 160 ---------
>>  sound/Kconfig                          |   1 -
>>  sound/pci/ac97/ac97_codec.c            |   1 -
>>  sound/pci/ac97/ac97_patch.c            |  40 ---
>
> Happy to take this with the relevant Acks.
>
> I assume an immutable branch is necessary.

I actually have this and the other bits from the series
in my the soc tree already, aside from one bufix patch
that Mark Brown picked up in the ASoC tree. If it's ok
with you, I'd just leave it like this and submit
everything together.

     Arnd
