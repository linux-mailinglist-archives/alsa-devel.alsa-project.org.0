Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDF1716087
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 14:51:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A495620C;
	Tue, 30 May 2023 14:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A495620C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685451115;
	bh=S8/dWJuux1RYTYBU7rMJYTS9dpjGvybm16LdgF8WUxI=;
	h=Date:To:Cc:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=c1lFnGXaRnxFS4qifXQ83t8Xh1jZxr/CB0CeqVj8mZEau8AkmB0ugfDyFOolcXrTE
	 NbLaLhFc2bmlaB9oP0HzuP6uOMAOuoH2/plSZHsVg4TXBmHCJP+T0PsrOfay3Sg1Qx
	 u516iUnvkkM+g4YaUJjbpvWPLOSJIEZDuDfJSLuc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1155CF800DF; Tue, 30 May 2023 14:51:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DE56F8026A;
	Tue, 30 May 2023 14:51:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A87C1F8042F; Tue, 30 May 2023 14:50:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FC39F80149
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 14:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FC39F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=OdjPG1DS
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1b011cffe7fso28571525ad.1
        for <alsa-devel@alsa-project.org>;
 Tue, 30 May 2023 05:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685451046; x=1688043046;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42TjERYpl34ezVm6gTZ6MgxR9jYfte5EhPsCPBAMTK8=;
        b=OdjPG1DSwHjTLkO4frX1ZQ9iHRRuMfJuphaUqBbNt/DbI1cEa2eOe3sXkQpEg3Lqfa
         xT3KMZQHiL4WbaJHNUMnwJOVvbANilzfSAWdJfvegrzvElBB89TRQd/Ny42kxH7lwRvW
         7XcJdBvsHZyXU80G7WTcS+HBEYsox3v68rE7/CF7YFG5SURtH4XhHC8fZLyGN1Qg1885
         AKB/Fse2eNWjS+I1vDsDjoc9B9S4+pdNjUqEp8f1AVKGZwuRrovA9PZsVHewsKJ3jGj/
         HJI9/4CTmKwVtCHxy1/NqgCWslJDcrjBZAO5zPIy6ZfdxeTlNuV90wGCyd6CMWAhVk+R
         7rAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685451046; x=1688043046;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42TjERYpl34ezVm6gTZ6MgxR9jYfte5EhPsCPBAMTK8=;
        b=bI6Etd1TAmckBx6fvHO/pECpDcW2d/OxQxzMjY9rxnsALtGNLmZo6Z25zhnDOjTt0D
         vlO5NdtLqZUJNrkBzsxPbI4UZhR0/tlkLm3gq4p5IvKdA/Z85NoW5/auwqINnl2UDJ7Q
         pcaU5qP7OfdoOMhROlBYjFoSDcHRK21PBz4t4HrprOEyK9iGO/K5LFng39c0gVtz9nND
         8lebAM9SxevRhsHIfxeNeIKBBLS5vERntBHzb/5r7uKOVhislCliKuowwLVFKZMt6+0G
         vcqgU6eNlmeqI3aEvVGik9qUx6ApFFUKed9NGmAPNd+9L2vlXNxCM3cHNJkrPEp5f6ZB
         gA4g==
X-Gm-Message-State: AC+VfDyprC1JQF/PWY2ZXYZO5rdGgZTZVAqcAzpeJCWXw/gzjDlK3yee
	08C7xb0DYa2YeHOCAa//038=
X-Google-Smtp-Source: 
 ACHHUZ48xTw2/AxpJYUFWYho6qBeQsi813yiiCGQz8Au8VSU5pflTs59kBiSuqjTi50nCTVoXF4NZw==
X-Received: by 2002:a17:902:8504:b0:1a5:dfd:d167 with SMTP id
 bj4-20020a170902850400b001a50dfdd167mr2056892plb.8.1685451046491;
        Tue, 30 May 2023 05:50:46 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-12.three.co.id.
 [180.214.232.12])
        by smtp.gmail.com with ESMTPSA id
 ik29-20020a170902ab1d00b001b0218651a6sm7093717plb.178.2023.05.30.05.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 05:50:45 -0700 (PDT)
Message-ID: <dbb825e9-f92b-6c17-c1d7-b7e6cfb9b474@gmail.com>
Date: Tue, 30 May 2023 19:50:41 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux ALSA Subsystem Development <alsa-devel@alsa-project.org>,
 Linux USB <linux-usb@vger.kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Apple USB-C 3.5mm dongle cannot output 41000hz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YPDXFQBHELHXI4TTSLKBKL52PM7RPJYH
X-Message-ID-Hash: YPDXFQBHELHXI4TTSLKBKL52PM7RPJYH
X-MailFrom: bagasdotme@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YPDXFQBHELHXI4TTSLKBKL52PM7RPJYH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Overview:
> With an A2049 Apple USB-C to 3.5mm DAC dongle, I have the same issue as outlined in this link: ALSA won't detect 44100Hz as an available sample rate:
> https://github.com/mikebrady/shairport-sync/issues/1504
> 
> 
> Steps to Reproduce:
> Play a 44.1Khz audio file.
> 
> 
> Actual Results:
> Pipewire reports that the output is locked to 48000hz, and ALSA reports that this is the only detected supported rate:
> 
> $ cat /proc/asound/card0/stream0
> Playback:
>   Status: Running
>     Interface = 1
>     Altset = 1
>     Packet Size = 288
>     Momentary freq = 48000 Hz (0x30.0000)
>   Interface 1
>     Altset 1
>     Format: S24_3LE
>     Channels: 2
>     Endpoint: 0x02 (2 OUT) (SYNC)
>     Rates: 48000 - 48000 (continuous)
>     Bits: 0
>     Channel map: FL FR
>   Interface 1
>     Altset 2
>     Format: S16_LE
>     Channels: 2
>     Endpoint: 0x02 (2 OUT) (SYNC)
>     Rates: 48000 - 48000 (continuous)
>     Bits: 0
>     Channel map: FL FR
> 
> 
> Expected Result:
> It should be switching between 44100-48000hz, the only two rates it supports.
> 
> 
> Build Date and Hardware:
> Running Arch Linux with kernel 6.3.4-arch1-1, alsa-lib 1.2.9-1.
> AMD Ryzen 3600 on a MSI B450M Mortar Max motherboard
> 
> 
> Additional Information:
> It seems like a regression between Linux 4.x and 5.x, and halfway through the above thread the user "quantonian" added the device to the ALSA quirks table and has posted a patch:
> 
> https://github.com/mikebrady/shairport-sync/issues/1504#issuecomment-1193355701
> 
> Thanks if this can be fixed in the kernel. The dongle in question is US $9:
> https://www.apple.com/shop/product/MU7E2AM/A/usb-c-to-35-mm-headphone-jack-adapter

See bugzilla for the full thread.

Unfortunately, the reporter said that he can only run kernel as
old as 5.6, as older than that, he experiences unrelated GPU crashes,
so he can't bisect this regression.

Anyway, I'm adding it to regzbot:

#regzbot introduced: v4.19..v5.10 https://bugzilla.kernel.org/show_bug.cgi?id=217501
#regzbot title: 44100hz is mistaken as 48000hz on Apple Headphone Jack Adapter
#regzbot link: https://github.com/mikebrady/shairport-sync/issues/1504
#regzbot link: https://www.audiosciencereview.com/forum/index.php?threads/review-apple-vs-google-usb-c-headphone-adapters.5541/page-32

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217501

-- 
An old man doll... just what I always wanted! - Clara
