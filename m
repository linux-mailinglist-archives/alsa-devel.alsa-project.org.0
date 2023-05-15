Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E177021AB
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 04:24:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7868826;
	Mon, 15 May 2023 04:23:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7868826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684117488;
	bh=a4soNIYWgFnKfERJ/uYWYnU52jk9RNUDXNl2P9yUtgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pwi7x8cGu0ODfXwgZFbZvIQ3+r0PxjNgLMBYEOkb7POAURpB+gq+n4s/9YskS6VFD
	 ZBn12f87JkNfgacAbDGpjWQLARO0uRm+IklfAhBm0nbtCe/On5E0g7qp+J4+tCwMov
	 dHOpWawBhsAiZStWi7nUPPsiHBfCM+s1lxrIE8JE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CDC1F80272; Mon, 15 May 2023 04:23:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7E9DF8025A;
	Mon, 15 May 2023 04:23:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68CB2F80272; Mon, 15 May 2023 04:23:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B3C0F8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 04:23:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B3C0F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=H2xQGD+7
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-52c30fa5271so6391354a12.0
        for <alsa-devel@alsa-project.org>;
 Sun, 14 May 2023 19:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684117406; x=1686709406;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ctYwXC1YUjZKdl7Y3ohGsN195nvG7PVKrDsBWnokCY=;
        b=H2xQGD+7Co6le0T+fph6QY+YeN41Te9s5u165/AvZCYpWNSOwzR0DFuw7f9atOrKgi
         afTa1Bf/ObGuLr/DQhPsDomx0IYfoYVTcOgH+ptyQyOvCbTo046DLNJ7hdKdW92IK4Qm
         s4BfRPdepY3XNBIUaEqo2Y1YRJg3ZT1aTBxiKRKxNBLPXIAeAjHSK3pfZN739o1Uoye0
         dzcGWcvYt7LzTMYeZ0VwTgkWycGVNKu7yaA/8LxyPswQMStUSgMkV2SM8lweyNPXvno8
         k5qbxgqAqpYP0pnoMGuKB/49ceuM29CdJpMphEbnRybiEGsC0PfyxwG7sqALrRkK3P9c
         b0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684117406; x=1686709406;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ctYwXC1YUjZKdl7Y3ohGsN195nvG7PVKrDsBWnokCY=;
        b=iGVn204u1baNp8SC66eTnJAe9nlhzKSr0AGOGC1xoez4Nekw/RghpvDDCjvsNXcgw7
         IfZWEMD9gJvGMgIf4DDnl7cTb8C5iKrj2j6HYHxtQpIr3xA2AZAUX+ze8ANrnKcNmCmt
         ndYUjXg+v0/DWqVRz+1MBmSnz51ahFqPQavjJ9vXhGFPv900BttQOTQ9IzI2hovTxKxX
         9tGPL4AA8st6WR03KSoYCyioHLrjQhDVJqgperSUOn00F55DTed/ATwASv2w5KXMlyun
         3NfqPQhz9/oVyXBjCFRlo0WJwV9YzsGzDwIHgcofst7rxayQYv9DJlEy/fo4wRW0ufOa
         MT+Q==
X-Gm-Message-State: AC+VfDx3brAEtB7i6TkH/Ti+nqWKLJzCxuP1jSQ1EoshAMeYU6v4mcSP
	kvrAyHFt/sJ/HlrCaKicsaY=
X-Google-Smtp-Source: 
 ACHHUZ5hvE1oOW0HR2n8p5NBw+2baxIFG6toJU18YluCfOM1aVCojT707But9JVCCZSdGUewI8ZuWQ==
X-Received: by 2002:a17:90a:9f44:b0:250:7273:cc3e with SMTP id
 q4-20020a17090a9f4400b002507273cc3emr27398431pjv.8.1684117405592;
        Sun, 14 May 2023 19:23:25 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-25.three.co.id.
 [180.214.233.25])
        by smtp.gmail.com with ESMTPSA id
 j11-20020a170902da8b00b001aafde15ff3sm8316005plx.293.2023.05.14.19.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 19:23:25 -0700 (PDT)
Message-ID: <626d677d-ead7-7ec8-b91a-162c914fe1d5@gmail.com>
Date: Mon, 15 May 2023 09:23:20 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
Content-Language: en-US
To: "Joseph C. Sible" <josephcsible@gmail.com>, Takashi Iwai <tiwai@suse.de>
Cc: regressions@lists.linux.dev, kailang@realtek.com, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org
References: <bug-217440-225600@https.bugzilla.kernel.org/>
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
 <ZGB0cVVI7OgaJU6t@debian.me>
 <CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
 <87cz338ix4.wl-tiwai@suse.de>
 <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: 
 <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: THY2IR7PXASKBGAUIOTS5BXBTDXDIGD7
X-Message-ID-Hash: THY2IR7PXASKBGAUIOTS5BXBTDXDIGD7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/THY2IR7PXASKBGAUIOTS5BXBTDXDIGD7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/15/23 04:48, Joseph C. Sible wrote:
> On 5/14/23, Takashi Iwai wrote:
>> The patch changes two places (the change in alc_shutup_pins() and
>> alc256_shutup()), and I guess the latter is the culprit.  Could you
>> verify that only reverting the latter fixes the problem?
> 
> Yes, only reverting the latter fixes the problem. I just tried a
> kernel consisting of 6.3.2 plus the below change, and it works fine:
> 
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -3638,8 +3638,7 @@ static void alc256_shutup(struct hda_codec *codec)
>         /* If disable 3k pulldown control for alc257, the Mic
> detection will not work correctly
>          * when booting with headset plugged. So skip setting it for
> the codec alc257
>          */
> -       if (codec->core.vendor_id != 0x10ec0236 &&
> -           codec->core.vendor_id != 0x10ec0257)
> +       if (codec->core.vendor_id != 0x10ec0257)
>                 alc_update_coef_idx(codec, 0x46, 0, 3 << 12);
> 
>         if (!spec->no_shutup_pins)
> 

Thanks for the fixup. Can you send it as proper patch for review?
See Documentation/process/submitting-patches.rst for instructions.

-- 
An old man doll... just what I always wanted! - Clara

