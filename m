Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1627BD30E
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 08:10:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A6F0823;
	Mon,  9 Oct 2023 08:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A6F0823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696831827;
	bh=49exM8wZjR1IVkQ3SPIlqxNpnJcle5AOLCs6ADDuI1I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hgpUpUiQpbIBVRko5tvCuICmHTtkCQsJmUiMLhOMxdJTd9anvpEoikC15DexHYOKg
	 WLVEcNY9PDwQBmeA4MnreCr+QX+hBsmDH+PwNQvxEufYhG3O7CqL/Irppq+OqT3tOJ
	 Vn+HG3ixLkEMjEBYTScq+4u10IYo8mhMDPQ7TXug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66503F802BE; Mon,  9 Oct 2023 08:09:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85115F8027B;
	Mon,  9 Oct 2023 08:09:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67EB3F802BE; Mon,  9 Oct 2023 08:04:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD5C9F80166
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 08:04:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD5C9F80166
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so6719134a12.0
        for <alsa-devel@alsa-project.org>;
 Sun, 08 Oct 2023 23:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696831466; x=1697436266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjyP5ly4fChYbO5Uv1fH9fegTCA2/Y0YEsSpnTgbmAg=;
        b=mGuBOBKfsLlxKRD07M2fk0eZYek2j2txiGQdEnxDmC+1q6w64TSYtskRGp75ETcqY9
         I9mi/Ch3Xaz/7JEZLfDpqhDedJ8NEiJRRa+XjBx1smaEYMbYuTjVJYk8nps4eKQ4yYYE
         04VectGBNvGUH43ovV0posT20p/+dTSj1fKgJqwJHFXKOqbEr5Wt+PwuSTy46gYDcYhG
         JnaPxnMze+Wr14oDpdlyJAAgiqufgSdDcKeHQwsrMoPULiqDQLDLGHf/jNoyimxSli4e
         qxvrkHP1e+LBTIHb4l2vEivXoypjGlRc+UfXkWH8V4+F8bPeBedYva9YeIDsVs0C9BON
         58cQ==
X-Gm-Message-State: AOJu0YxebASGlNcNRPpTfRraEoQ78UZUEQk9W+TNg6vcEDzDUSoO5pWr
	e6m8dXukla9bJhetyNkVCwI=
X-Google-Smtp-Source: 
 AGHT+IHUeU06ag68AvB66FzyntI5pWSfwy7ed1C0kPq7vdaNPjjPAP59DAFs0XD4yK+onUJa+Vwm/w==
X-Received: by 2002:a17:906:2215:b0:9ae:4536:728e with SMTP id
 s21-20020a170906221500b009ae4536728emr14258688ejs.72.1696831466080;
        Sun, 08 Oct 2023 23:04:26 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id
 jp20-20020a170906f75400b0099bcb44493fsm6359252ejb.147.2023.10.08.23.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Oct 2023 23:04:25 -0700 (PDT)
Message-ID: <9e2bd57b-60f6-428e-89f8-064a0b4268b1@kernel.org>
Date: Mon, 9 Oct 2023 08:04:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: ti: ams-delta: Fix cx81801_receive() argument types
Content-Language: en-US
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20231007213820.376360-1-jmkrzyszt@gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20231007213820.376360-1-jmkrzyszt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZCDX3GLIZOBXIPOSYGSLG4S7LS3Y375O
X-Message-ID-Hash: ZCDX3GLIZOBXIPOSYGSLG4S7LS3Y375O
X-MailFrom: jirislaby@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZCDX3GLIZOBXIPOSYGSLG4S7LS3Y375O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07. 10. 23, 23:38, Janusz Krzysztofik wrote:
> Since types of arguments accepted by tty_ldis_ops::receive_buf() have
> changed, the driver no longer builds.
> 
> .../linux/sound/soc/ti/ams-delta.c:403:24: error: initialization of 'void (*)(struct tty_struct *, const u8 *, const u8 *, size_t)' {aka 'void (*)(struct tty_struct *, const unsigned char *, const unsigned char *, unsigned int)'} from incompatible pointer type 'void (*)(struct tty_struct *, const u8 *, const char *, int)' {aka 'void (*)(struct tty_struct *, const unsigned char *, const char *, int)'} [-Werror=incompatible-pointer-types]
>    403 |         .receive_buf = cx81801_receive,
> 
> Fix it.
> 
> Fixes: e8161447bb0c ("tty: make tty_ldisc_ops::*buf*() hooks operate on size_t")
> Fixes: 892bc209f250 ("tty: use u8 for flags")
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> ---
>   sound/soc/ti/ams-delta.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
> index 371943350fdf..666057d50ea0 100644
> --- a/sound/soc/ti/ams-delta.c
> +++ b/sound/soc/ti/ams-delta.c
> @@ -336,8 +336,8 @@ static void cx81801_hangup(struct tty_struct *tty)
>   }
>   
>   /* Line discipline .receive_buf() */
> -static void cx81801_receive(struct tty_struct *tty, const u8 *cp,
> -		const char *fp, int count)
> +static void cx81801_receive(struct tty_struct *tty, const u8 *cp, const u8 *fp,
> +			    size_t count)

Thanks for fixing this. Funny enough that I managed to switch cp, but 
not the others. Yeah, there was a lot to overlook in those big changes.

regards,
-- 
js
suse labs

