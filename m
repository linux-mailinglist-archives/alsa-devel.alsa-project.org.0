Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED92F68C65A
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 20:01:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37F7EFA;
	Mon,  6 Feb 2023 20:00:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37F7EFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675710095;
	bh=03edbvDdC2QBUGtwnwhQyYr5GpAvD69Jbfaw1fvrxW8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oWlkcEd+btSEHjwFkTVf55S0/vGfrysy1koePkMJ9OGQ7WGQ1ESPJkV9+uGPD1kkn
	 QZqJ/Bi5mbkgOVVEKA7FZeTRC3Jkl48Yx84DYNf/hO79PQ92db0OQOUEbWJe9VM+O5
	 /3CUzDiWIYlPWWuoeLYMDizujllziGRhIrmvGp0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90811F800E3;
	Mon,  6 Feb 2023 20:00:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F7D0F804F1; Mon,  6 Feb 2023 20:00:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84291F800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 20:00:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84291F800E3
Received: by mail-ed1-f47.google.com with SMTP id eq11so12681348edb.6
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 11:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uLWxQl0qTtmQEp5+OeXCEZYEFKKOPxU/HC0IrH2S2y8=;
 b=vsLrHXz9QeGyFEvnxzpHAaEesEdrhgUNTzGZGZHMt+xdm7Ni3Dh1VFCy4Oj6bN6n3L
 PnvbPiGvpAHuYvey6wlgFE9JXv8PFzoBBjGhaeu36okynczvJX2DxUw/s0+KRB/oNdzf
 h/e3YvcX5Cmb1C9L1p1s+47TgNSuRzxZ0K0SjDsssV88aZE5UrPqk/2LyRUSIAYiceZp
 G/4ovql0ESdnoLgwQ0RzEpnvesfkl36LToB7O3d6YmtIOFrL82P3JQq4VFIs5A8MK4ky
 SHPZN5oVjon7QHrG5JpPFxhvMHwlaiWbD+B1DhCkyF/6V5ThCZeLwTYPYj0b2DqLq2RK
 QG4Q==
X-Gm-Message-State: AO0yUKVJcu/DDftxmftVDFvzX4BXTYU2p2WP7EAD6zHQSodigrIY92c6
 0DZV/1pqJtf1LlL8OnVPVeA=
X-Google-Smtp-Source: AK7set9tvE47tkeBRyyzCWiDdjjfpkWRtpTy/dVdsX2XcPLuuM0JHcWKtBQg1m7WPn4yihL/YyeDfQ==
X-Received: by 2002:a50:9516:0:b0:45c:835b:ac64 with SMTP id
 u22-20020a509516000000b0045c835bac64mr654482eda.31.1675710028368; 
 Mon, 06 Feb 2023 11:00:28 -0800 (PST)
Received: from [192.168.3.157] ([81.56.10.57])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a50aa96000000b004aab66483ddsm1157931edc.70.2023.02.06.11.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 11:00:27 -0800 (PST)
Message-ID: <f8edc17d-5f15-b157-e9a7-a240db4713aa@kde.org>
Date: Mon, 6 Feb 2023 20:00:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] ALSA: hda/realtek: Enable mute/micmute LEDs on HP
 Elitebook, 645 G9
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <4055cb48-e228-8a13-524d-afbb7aaafebe@kde.org>
 <875ycfkzml.wl-tiwai@suse.de>
From: Elvis Angelaccio <elvis.angelaccio@kde.org>
Organization: KDE
In-Reply-To: <875ycfkzml.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thanks!

Cheers,
Elvis

On 06/02/23 08:43, Takashi Iwai wrote:
> On Sun, 05 Feb 2023 19:56:18 +0100,
> Elvis Angelaccio wrote:
>>
>> The HP Elitebook 645 G9 laptop (with motherboard model 89D2) uses the
>> ALC236 codec and requires the alc236_fixup_hp_mute_led_micmute_vref
>> fixup in order to enable mute/micmute LEDs.
>>
>> Note: the alc236_fixup_hp_gpio_led fixup, which is used by the Elitebook
>> 640 G9, does not work with the 645 G9.
>>
>> Signed-off-by: Elvis Angelaccio <elvis.angelaccio@kde.org>
> 
> Thanks, applied.
> 
> But the table is sorted in SSID, so I rearranged the entry at
> applying.
> 
> 
> Takashi
