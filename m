Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8283C7D391F
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 16:18:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43ED484B;
	Mon, 23 Oct 2023 16:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43ED484B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698070720;
	bh=iggpApgGsToQ4YR3wPdRWzOVb2iKiuUZb0vyKynL7j0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tYEREpcxN3HkdiFVFhKY+danRCcqRs7nmT4YjDu4CNjVUNDWXkUYOcyOtaajtbwf9
	 ua+RJXpdpSCwM3+cDZt843Sd3tjRbqq340CWcKTB+Kc48CUkHXc80zieH7DcLu5imd
	 IMZFNfqzriUgPjiIYlzKp45U3ffuN9/bckRydaCQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CD13F80027; Mon, 23 Oct 2023 16:17:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71FD0F8032D;
	Mon, 23 Oct 2023 16:17:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0073FF8025F; Fri, 20 Oct 2023 15:27:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99973F800C9
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 15:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99973F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YSc3KoYw
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40651b22977so743455e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 20 Oct 2023 06:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697808473; x=1698413273;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RDHQk1JAZLzAt62G0k2kkc3FwV2Z/Ulx/Vw7EH0xItM=;
        b=YSc3KoYw4vRh1uT7dnKyEL2Tslh+jrMPbTz+1YdEZBp2fdDoLay0QhxIbHqe/NV1dU
         RX3+5TGg7O8oh2lpToXW7SZxGiOD6WWbY2SMWQQPckTiEgdSwVrcZzTEWv5kf9ihjCRo
         2bSZVk7kk5C6az2MBllPOjfYz8Z/LG9FK8FCxcerz4rCupCV2CdC4ldkOJnWWkemWyMT
         RqNTej5iuPeZ307xYaFA3FHjPaoapnAT0pgigMSv1bTDkfvc3YK9lvv98ECCEfHTSMIN
         GLbdbkXtg0hyifDna+aIMFrSdYk7iYm5vW97xatfXryz2bKoXWIkHOBaUf7l9FabR1Dz
         NYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697808473; x=1698413273;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RDHQk1JAZLzAt62G0k2kkc3FwV2Z/Ulx/Vw7EH0xItM=;
        b=T9VgdJXPwViXSOmrQwuC4t68ItzbENmc0MbriPeuf5S/buHwrc2ilg50u9LOTFV5DT
         1kWLVnH6G8v41exq6ixZsSzr3r+49q9G3eBeIaaBaTGt74WiQ3Wn2Ycv9mjbALjlN0MD
         2ki6emKs5vrAvmd0IBCCs05uMS9NpntlS9m+t8IoiD/4accQaLCKpNFH32aIOnl3EzAG
         24OxZ5+MSltyKJC0qdZcCz/fQ+xdxqo7ddZg2S3HWLkbdnJqfPIx9vMkX7cUUl3bW412
         WnS2nachwJZ3jj8xYzIrSyOpklC/B2wm041z/8g3532UpylgCksvUiEnW+trYwlvngDW
         jc3w==
X-Gm-Message-State: AOJu0YwWTR/2yH9V7xgDyNroasxCiDtCztZhj/sLopRFIXXnbzxdPHQa
	KLAkfCka72TTyFJoW9qxbbs=
X-Google-Smtp-Source: 
 AGHT+IEhFPJ8RG/8+Ojsgk1n1nu2ZYq4mwHZ9rXoovhBAmjontjL2GdrxuJhW6pdRdAsyUX9QA4RzA==
X-Received: by 2002:adf:a1cf:0:b0:32d:d1f4:da82 with SMTP id
 v15-20020adfa1cf000000b0032dd1f4da82mr1277486wrv.4.1697808472706;
        Fri, 20 Oct 2023 06:27:52 -0700 (PDT)
Received: from [172.16.102.34] ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id
 k17-20020a5d6291000000b003217cbab88bsm1720017wru.16.2023.10.20.06.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 06:27:52 -0700 (PDT)
Message-ID: <08b3c3bd-41e9-4cd1-82b1-47a34650a70e@gmail.com>
Date: Fri, 20 Oct 2023 14:27:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: ALSA: change mailing list to linux-sound on
 vger
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
Cc: Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20231020071247.973909-1-perex@perex.cz>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <20231020071247.973909-1-perex@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: H5KJBY6TPXZB32JTJL76H3ZAMJKVQJ25
X-Message-ID-Hash: H5KJBY6TPXZB32JTJL76H3ZAMJKVQJ25
X-Mailman-Approved-At: Mon, 23 Oct 2023 14:17:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H5KJBY6TPXZB32JTJL76H3ZAMJKVQJ25/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/20/23 08:12, Jaroslav Kysela wrote:
> As discussed on alsa-devel mailing list [1], it is useful to have an open
> mailing list to avoid moderation delays for the kernel patch work. Use
> linux-sound mailing list for kernel driver related threads.
> 
> In the first stage, change the list for the ALSA core, ASoC and tests.
> 
> [1] https://lore.kernel.org/alsa-devel/20231019-posture-cache-fe060b@meerkat/
> 
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Ivan Orlov <ivan.orlov0322@gmail.com>
> Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> ---
>   MAINTAINERS | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a7bd8bd80e9..007c0b204df7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20061,7 +20061,7 @@ F:	include/linux/sony-laptop.h
>   SOUND
>   M:	Jaroslav Kysela <perex@perex.cz>
>   M:	Takashi Iwai <tiwai@suse.com>
> -L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> +L:	linux-sound@vger.kernel.org
>   S:	Maintained
>   W:	http://www.alsa-project.org/
>   Q:	http://patchwork.kernel.org/project/alsa-devel/list/
> @@ -20074,7 +20074,7 @@ F:	tools/testing/selftests/alsa
>   
>   SOUND - ALSA SELFTESTS
>   M:	Mark Brown <broonie@kernel.org>
> -L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> +L:	linux-sound@vger.kernel.org
>   L:	linux-kselftest@vger.kernel.org
>   S:	Supported
>   F:	tools/testing/selftests/alsa
> @@ -20100,7 +20100,7 @@ F:	sound/soc/soc-generic-dmaengine-pcm.c
>   SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEMENT (ASoC)
>   M:	Liam Girdwood <lgirdwood@gmail.com>
>   M:	Mark Brown <broonie@kernel.org>
> -L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> +L:	linux-sound@vger.kernel.org
>   S:	Supported
>   W:	http://alsa-project.org/main/index.php/ASoC
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
> @@ -22931,7 +22931,7 @@ F:	fs/vboxsf/*
>   
>   VIRTUAL PCM TEST DRIVER
>   M:	Ivan Orlov <ivan.orlov0322@gmail.com>
> -L:	alsa-devel@alsa-project.org
> +L:	linux-sound@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/sound/cards/pcmtest.rst
>   F:	sound/drivers/pcmtest.c

Acked-by: Ivan Orlov <ivan.orlov0322@gmail.com>
