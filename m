Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB19676776A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 23:06:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5050207;
	Fri, 28 Jul 2023 23:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5050207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690578370;
	bh=fM81EFU44QhwGDq58u7wvc20lqw8qPOrKhxpm5B8mTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yn5jXoEd5juzZV2KeAKyJKdzSr1IaHgln2FXCm6oRIle0l0Hev75q2rgrJM5m53Ag
	 Z7d8w1xbkCLVq8YSCwmXdgDmx4ZTZnKKdfM7Kswlo3S1Ibi8jLdPqx3vl2ublTIZHA
	 tvuZ8s4t2gwdxdqsg99Do8mWV2ow7OV/zzxPAfek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DAA8F800D2; Fri, 28 Jul 2023 23:05:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AFCBF80163;
	Fri, 28 Jul 2023 23:05:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63844F8019B; Fri, 28 Jul 2023 23:05:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0593AF80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 23:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0593AF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=DUzSJHWX
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2680eee423aso1468653a91.2
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jul 2023 14:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690578304; x=1691183104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mzLjWb2IvKpNxetuxpIL5OUHvXbEPP7sO5JHMTXgoFM=;
        b=DUzSJHWXkFm+UzMm4dk0GxmM2lh2CU0cXH7uio1EOVxzROxMN7PSytZUTv1i3Fc6C/
         QYKcvelkqpaycnCFRoG9PCzQj62E5541Mh6NnAQ2Y+sSq+1L2mIq4t2+1j081dAuDtvH
         Bx/QPVhFvOADdzXk9Rl9p0j13NdbQZKN2REAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690578304; x=1691183104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzLjWb2IvKpNxetuxpIL5OUHvXbEPP7sO5JHMTXgoFM=;
        b=d9EOqOeVErTlHKF77hPzS/dO+rxZaj9bPGEE6lHla8N+abumwJP/4qHz/xFbxg5ziT
         BQkgOk0VOPb+R/KCwzcRu04QBdPedKqr54+NAZPcCLDezSOzU5xLrJxqOcrC6wWA+x+G
         VGlAvgvtrIKjgrNk+8DQnTMNL96G/xzVM+G2g9K8mIIuPEBQCv11mlxDseyQ9TZs7O3c
         V9csrw2f9Z3W3t5KkucfHEOkiLkR+bae5aakONmBM8H7jgTNoRHWhUu9nm0umyQl6I72
         kW+JCzqHtJbQJkz8Cc7XndLarT72owU5dFdKZpsSVnN+WBJuOQ/yj/GShP3iQgBgC94q
         bTDw==
X-Gm-Message-State: ABy/qLbKNFIpk32o06LjN4Y1GWf71+2GGWdC0Ld26uKpBoyp0f4hNflf
	T9yYuw8veGR6VM2ymeZe5OJupmydd8nWwx3pp/o=
X-Google-Smtp-Source: 
 APBJJlE/Bj0YDv8/cqAifhSQW91oOrA1CcZeDO76w2S84U8EV7YhttyyW5XGorEq/S0odyjPHkgqcg==
X-Received: by 2002:a17:90b:4c0f:b0:268:553f:1938 with SMTP id
 na15-20020a17090b4c0f00b00268553f1938mr2398856pjb.4.1690578304059;
        Fri, 28 Jul 2023 14:05:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 9-20020a17090a19c900b00267f7405a3csm3176140pjj.32.2023.07.28.14.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 14:05:03 -0700 (PDT)
Date: Fri, 28 Jul 2023 14:05:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: 88pm860x: refactor deprecated strncpy
Message-ID: <202307281205.175FD2FC@keescook>
References: <20230727-sound-soc-codecs-v1-1-562fa2836bf4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727-sound-soc-codecs-v1-1-562fa2836bf4@google.com>
Message-ID-Hash: M457JADH5JE2D5DO4MNSIMIFSKPK4KNO
X-Message-ID-Hash: M457JADH5JE2D5DO4MNSIMIFSKPK4KNO
X-MailFrom: keescook@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M457JADH5JE2D5DO4MNSIMIFSKPK4KNO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 27, 2023 at 10:46:13PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ always the case for `strncpy`!
> 
> In this case, though, there was care taken to ensure that the
> destination buffer would be NUL-terminated. The destination buffer is
> zero-initialized and each `pm860x->name[i]` has a size of
> `MAX_NAME_LENGTH + 1`. This means that there is unlikely to be a bug
> here.
> 
> However, in an attempt to eliminate the usage of the `strncpy` API as
> well as disambiguate implementations, replacements such as: `strscpy`,
> `strscpy_pad`, `strtomem` and `strtomem_pad` should be preferred.
> 
> We are able to eliminate the need for `len + 1` since `strscpy`
> guarantees NUL-termination for its destination buffer as per its
> implementation [3]:
> 
> |       /* Hit buffer length without finding a NUL; force NUL-termination. */
> |       if (res)
> | 	        dest[res-1] = '\0';
> 
> [1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
> [2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
> [3]: https://elixir.bootlin.com/linux/v6.3/source/lib/string.c#L183
> 
> Link: https://github.com/KSPP/linux/issues/90
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  sound/soc/codecs/88pm860x-codec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
> index 3574c68e0dda..d99b674d574b 100644
> --- a/sound/soc/codecs/88pm860x-codec.c
> +++ b/sound/soc/codecs/88pm860x-codec.c
> @@ -143,7 +143,7 @@ struct pm860x_priv {
>  	struct pm860x_det	det;
>  
>  	int			irq[4];
> -	unsigned char		name[4][MAX_NAME_LEN+1];
> +	unsigned char		name[4][MAX_NAME_LEN];
>  };
>  
>  /* -9450dB to 0dB in 150dB steps ( mute instead of -9450dB) */
> @@ -1373,7 +1373,7 @@ static int pm860x_codec_probe(struct platform_device *pdev)
>  			return -EINVAL;
>  		}
>  		pm860x->irq[i] = res->start + chip->irq_base;
> -		strncpy(pm860x->name[i], res->name, MAX_NAME_LEN);
> +		strscpy(pm860x->name[i], res->name, MAX_NAME_LEN);

res->name is (perhaps) unbounded in length:

struct resource {
	...
        const char *name;
	...
};

So reducing struct pm860x_priv::name's size _might_ have a user-visible
effect, but probably not.

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
