Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6253F8364E8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 14:59:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C72FC850;
	Mon, 22 Jan 2024 14:58:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C72FC850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705931941;
	bh=uRwlfQFqYgDOh0rrfCRYcCuOKUJuD0sHdMfGkSwl/F0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S4BSeXPj0wGDClm0gI3Rod3NN197c5gMu1QI75Z87JnHkhntthvgeLDZUr/mUiY3G
	 gHWWrRZ4BssF7XsMTQ1BankU5doL6MMOHFVcQ81EAdYvRmzUVdkiShSZ8TuHM4MEqx
	 VaQh/WQBjBTkXHwlDK1r/9psXQT4ji+c34YKqj8g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98AF7F80587; Mon, 22 Jan 2024 14:58:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2B31F8057A;
	Mon, 22 Jan 2024 14:58:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 151EBF8025F; Mon, 22 Jan 2024 14:58:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 466AFF8020D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 14:58:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 466AFF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jBHyrMhQ
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cd853c159eso36304261fa.2
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Jan 2024 05:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705931897; x=1706536697;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i5tXLFd22Hd9F1QeZnGUKfI6Q6wxJKZdDmdeXHZwRQ4=;
        b=jBHyrMhQ37rJcr9AutZmsxhh7nyMvh4GpbkpLzg8N2VrwWvlDzGgtQ6O6mHjG5qGQk
         ZXZVOmGU+LE3dl/bW/zNmuMtm2tAO6XT85KCqF0MDobJRrRLjkpX5960ZCpQ3z3v1yY3
         knhSaG1Wx6wHe/gCPA/k8/maMXiiobge1CLsIDWIimFqXIvAmDvZ4O0gJgvSR+ZX11Vt
         prQ51N5e4sKnmLMMcjkKJYhgnTocRnQBk+OB5iUNPnLraIeyT8bMuIg409ux+7uNgWQq
         Bb8sqEuFsVlyZwldmdw6V5Y8+m72h+w8HpLCvBP7cpXq+dA9ReSUM0gQsguWMfnh3Lz2
         bCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931897; x=1706536697;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i5tXLFd22Hd9F1QeZnGUKfI6Q6wxJKZdDmdeXHZwRQ4=;
        b=F0Gk+XsfiXGepmK9iazMUn3ptQ1Hkg+9SeMkvnyZg5w+QMK+Wy+uabF312bDP6uhxv
         +E6pxUwoIp3aeYgyyULeMMkZ0VjQbAhWuISGkZqvEnVoYCvdyaM0EdY9rfP6Szpqz9TF
         p1aBCWpXB4ipli6v6ZkHEnfmZkJq+bUmfHnEGAtnZWanqbROuxtnBPfD8Tz9d1KA7DIN
         32j9tQjI4+IGux2SnE/g1Lb+9S7XovqHK38G1/uRsn9xXXutZdd1S+On8h212B9AMjSl
         Pd5YSXbpfCaprlb5ef0g1f1m8yG/guQrBU1JEAL7e+UOgAsLAklFwl3SF5jKHtQ+9WXL
         Y5LA==
X-Gm-Message-State: AOJu0Yzw2sMWavwcTpqv6q6YTFs89ss1KZ8XWpQehCQK69zdIDgPYd7b
	Z90qiOPtHjx3amGzWOtC4qpkVFkz2xWvmS+wCAwRC5xaho4iwByFZJrcAWSR
X-Google-Smtp-Source: 
 AGHT+IFODNXkL8fnYM9GdeHhOUn64zrPhU/dv3GD+gZpzWsCurMgvq2JfXNZuR6x3Ka9ykqLLiX7SA==
X-Received: by 2002:a2e:93c1:0:b0:2cd:c811:6a24 with SMTP id
 p1-20020a2e93c1000000b002cdc8116a24mr1777848ljh.18.1705931896365;
        Mon, 22 Jan 2024 05:58:16 -0800 (PST)
Received: from ?IPV6:2a02:908:1980:b9c0::6a53? ([2a02:908:1980:b9c0::6a53])
        by smtp.gmail.com with ESMTPSA id
 i16-20020aa7c9d0000000b005582b9d551csm14260131edt.30.2024.01.22.05.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 05:58:15 -0800 (PST)
Message-ID: <0cc1ed1a-10d6-4c78-a955-ca0f2435d538@gmail.com>
Date: Mon, 22 Jan 2024 14:58:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add a quirk for Yamaha YIT-W12TX transmitter
Content-Language: en-US
From: Julian Sikorski <belegdol@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Julian Sikorski <belegdol+github@gmail.com>
References: <20231127221552.19087-1-belegdol+github@gmail.com>
In-Reply-To: <20231127221552.19087-1-belegdol+github@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZX4543DSQG7XMFITBKCVKXUTD4XHRPUC
X-Message-ID-Hash: ZX4543DSQG7XMFITBKCVKXUTD4XHRPUC
X-MailFrom: belegdol@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZX4543DSQG7XMFITBKCVKXUTD4XHRPUC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Am 27.11.23 um 23:15 schrieb Julian Sikorski:
> The device fails to initialize otherwise, giving the following error:
> [ 3676.671641] usb 2-1.1: 1:1: cannot get freq at ep 0x1
> 
> Signed-off-by: Julian Sikorski <belegdol+github@gmail.com>
> ---
>   sound/usb/quirks.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index ab2b938502eb..bf0a7cca90d0 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2031,6 +2031,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>   		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_IGNORE_CTL_ERROR),
>   	DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */
>   		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
> +	DEVICE_FLG(0x0499, 0x3108, /* Yamaha YIT-W12TX */
> +		   QUIRK_FLAG_GET_SAMPLE_RATE),
>   	DEVICE_FLG(0x04d8, 0xfeea, /* Benchmark DAC1 Pre */
>   		   QUIRK_FLAG_GET_SAMPLE_RATE),
>   	DEVICE_FLG(0x04e8, 0xa051, /* Samsung USBC Headset (AKG) */



Hi all,

is there something missing? It does not look like this got merged.

Best regards,
Julian
