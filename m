Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27204427BA
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 15:36:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA0021764;
	Wed, 12 Jun 2019 15:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA0021764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560346611;
	bh=xznzUEQbLi6fmld5KlC8y1GJKzBP1M23rMC9dFZl2oM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TcAKOwQQxhXbLOh/DIcUNNGr2rhYXhHQfIshfN3OJ+eg6DeI31u74MumuZEE8sxcu
	 nyNo1T/qoYVC/nZahvNDiLgQ6IlkkEHQokjh4TWDMD0jXKfJZt8HqxJBobOgVhejh3
	 ZtzxLWx9udmehg+XxPC1gFXLic8iKHYI7CTSDzQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1671FF806F5;
	Wed, 12 Jun 2019 15:35:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6DE7F896E0; Wed, 12 Jun 2019 15:35:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81089F806F5
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 15:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81089F806F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rANjlLeB"
Received: by mail-wr1-x443.google.com with SMTP id n4so16987075wrs.3
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 06:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=K1asMLMgpwm0KmdnNJVHTjnHVTW3sPCE2YBtlwFX0po=;
 b=rANjlLeBYnF/w/NOOZZXgV/kH55AmhqO4m2Y7ykHZBUUEo8ZdBbaDs+KbyFVF+PMOs
 XUKfZJz3eXr48cr0AmOJORbovuLCiOaAVBg33356HU51aAnrSfA7OCDKFOEevors5RIu
 sFD5d9jkBB4hpKW0UyQThn0JqV03zYVBpsxx8y5yLiIr8ZBcXzOrQBH0fixhfY5HeBPm
 /ATJTVqWRrtc9ekB3x9r24kU+Bh2P0hXp5yCebwIbOMm6sBKN5um58VLUCXtJIBY/jnC
 SsutU1bBkNpubngexEOyO7muN6O+o5OKX8hAcgnh2Q6EYY10YVGRMzaPb/rQVLtKoRUj
 eKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K1asMLMgpwm0KmdnNJVHTjnHVTW3sPCE2YBtlwFX0po=;
 b=l8yqTDHZ/iLVJNvI8Zb2wsWJdyH2H1DEUXJdA9qUhDvxN3kHjQcbk3OelrdpH5I7hv
 67zdBxQfZIW2LxG6prDSyAeBUMYhvf5sUULX6IB/ulGwy+WrOXxcAbmtTp9lDz5E0LPJ
 8xFXwzN3qgtWdHoYugK8dzLZvmEPQyVff1JEjB4AXcATaNyuB5g+NAIv9b0L7HUQp7rS
 67vswNAcaqQlFNxgVAkQ57yxYgUCuWmDVp7OW9RUM/XIEW6S72jm0V4slt6Wc3gAgHFD
 33ABM/sn2Ico/9ohlHwi5Zi2FIAk9kL3EfW6d5tMKWvNzzbPYlsyLJfe8/nOQHYtXJjC
 iQBw==
X-Gm-Message-State: APjAAAVDHgoU+iWckC4AVhbnt0Kn4czzfTxx9nd4vTIGFV42U/Rddt2T
 wLlI5ayfMjh4SkTrco6I3hM=
X-Google-Smtp-Source: APXvYqwmejOnkAtOrz1gsd7LfAmKifz8noLX9Wq7y7zU4DgzxBR1iKbeKr9moGUzoTjbf9vvykFwLQ==
X-Received: by 2002:a5d:6b12:: with SMTP id v18mr55671927wrw.306.1560346500397; 
 Wed, 12 Jun 2019 06:35:00 -0700 (PDT)
Received: from zhanggen-UX430UQ ([108.61.173.19])
 by smtp.gmail.com with ESMTPSA id f13sm17576834wrt.27.2019.06.12.06.34.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 06:34:59 -0700 (PDT)
Date: Wed, 12 Jun 2019 21:34:53 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: Ben Hutchings <ben.hutchings@codethink.co.uk>
Message-ID: <20190612133453.GA3922@zhanggen-UX430UQ>
References: <20190612133040.5kgtio7gidxx64gh@xylophone.i.decadent.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612133040.5kgtio7gidxx64gh@xylophone.i.decadent.org.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [PATCH] Revert "wcd9335: fix a incorrect use of
	kstrndup()"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jun 12, 2019 at 02:30:40PM +0100, Ben Hutchings wrote:
> This reverts commit a54988113985ca22e414e132054f234fc8a92604.
> The strings being duplicated are not fixed-length, so kstrndup()
> is the correct function to use.
> 
> Signed-off-by: Ben Hutchings <ben.hutchings@codethink.co.uk>
> ---
>  sound/soc/codecs/wcd9335.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
> index 85737fe54474..a04a7cedd99d 100644
> --- a/sound/soc/codecs/wcd9335.c
> +++ b/sound/soc/codecs/wcd9335.c
> @@ -2734,7 +2734,7 @@ static int wcd9335_codec_enable_dec(struct snd_soc_dapm_widget *w,
>  	char *dec;
>  	u8 hpf_coff_freq;
>  
> -	widget_name = kmemdup_nul(w->name, 15, GFP_KERNEL);
> +	widget_name = kstrndup(w->name, 15, GFP_KERNEL);
>  	if (!widget_name)
>  		return -ENOMEM;
>  
> -- 
> Ben Hutchings, Software Developer                         Codethink Ltd
> https://www.codethink.co.uk/                 Dale House, 35 Dale Street
>                                      Manchester, M1 2HF, United Kingdom
> 
OMG! There is someone following what I was doing these days...
Kind of peculiar
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
