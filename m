Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB5A79B7C
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 23:50:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 980D31801;
	Mon, 29 Jul 2019 23:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 980D31801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564437025;
	bh=KWfwdgzZjcINvoGLhERD2UhvNsR4Ho/APmlZnwujLZ4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZcKZJLGu/3yvqqOBZAYfZbF0mnQ41UuaGRQbbhOKYbDVXgtHMFFZxDNpKmFl3MeFr
	 kbqsxhftm9/Y7pVI+6k/nzZcjiHEiPXVNfsYUDopHEqu4G8f6XBvwuch/HdV8NsST9
	 GDdY0SFhEigRmes1bFjZOfIG+fPswlNpq+mdvqjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3137F8048D;
	Mon, 29 Jul 2019 23:48:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66AD9F8048D; Mon, 29 Jul 2019 23:48:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33117F800E4
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 23:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33117F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="aLXoYLOL"
Received: by mail-pl1-x643.google.com with SMTP id b7so28057364pls.6
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 14:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mHb7K/quzh/o9A0rhyew79DzGwVBiK/JKWkURFhBbPg=;
 b=aLXoYLOL9bhkDKwRtYhOygieMGKXSKL7OIukbB5IHhN9BIlS95bKQZUqFFb32huu4N
 noBkyP1aNp6N+UNxp0EvxGURLyduEawdLwt7dMSZ3fye87lVjcqTeBgcdWeTWO0nGRyp
 8AlwzN7d0PZSga4djNARnHts+njcY0DCqcd14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mHb7K/quzh/o9A0rhyew79DzGwVBiK/JKWkURFhBbPg=;
 b=HbpGLcId/azPsFSukTJlRojCx3fXxDmFvCbhxELTndIpEU0zD3aesDGuX+94+FB1D8
 JchIzqnuHG5d2qFDfCPxcxkMYAzqFxO2XRfnVoV6CDJb0ZaQnl+bsoFgNjKwBCxINJPT
 D0PUPlckvDbYa6koOytmnZbiwvXkSGtMxdcGkQEirJGBVvh8cWDKaO6QRAhS6HL0ggMd
 QDAQ1VAdz58xcF0/H2Uio3PRBxEZPGmXgctOhuJXWqcNJPk9VsqZtKUoGdYOGBpXbdVw
 XBkM3NNW5tNnuAaVGdpnTwesbYgEEaMxofGop+OPFm3cJsTOejWlS0Sk3qhduoYGKgUg
 mJdg==
X-Gm-Message-State: APjAAAX9HZC6Yfs1JHd9Q7InjZdXjJvAAE8gGPEC8Hjab0b159FnFwWI
 ImXz925uEZlQDXCE2POcZSAnKN1LL4M=
X-Google-Smtp-Source: APXvYqyX4/6lzKkOPc8+bZ/Wr8naVik9Xqd0hoI58Yfve8v7GAHab9WzvrM4B0ZwL294T52ZxlWhnA==
X-Received: by 2002:a17:902:2ac7:: with SMTP id
 j65mr113085915plb.242.1564436913282; 
 Mon, 29 Jul 2019 14:48:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a3sm65759270pfi.63.2019.07.29.14.48.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Jul 2019 14:48:32 -0700 (PDT)
Date: Mon, 29 Jul 2019 14:48:31 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <201907291448.E375AA59F@keescook>
References: <20190729205454.GA5084@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729205454.GA5084@embeddedor>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH v2] sound: dmasound_atari: Mark expected
 switch fall-through
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

On Mon, Jul 29, 2019 at 03:54:54PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warning (Building: m68k):
> 
> sound/oss/dmasound/dmasound_atari.c: warning: this statement may fall
> through [-Wimplicit-fallthrough=]:  => 1449:24
> 
> Notice that, in this particular case, the code comment is
> modified in accordance with what GCC is expecting to find.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
> Changes in v2:
>  - Update code so switch and case statements are at the same indent.
> 
>  sound/oss/dmasound/dmasound_atari.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/oss/dmasound/dmasound_atari.c b/sound/oss/dmasound/dmasound_atari.c
> index 83653683fd68..823ccfa089b2 100644
> --- a/sound/oss/dmasound/dmasound_atari.c
> +++ b/sound/oss/dmasound/dmasound_atari.c
> @@ -1432,25 +1432,25 @@ static int FalconMixerIoctl(u_int cmd, u_long arg)
>  {
>  	int data;
>  	switch (cmd) {
> -	    case SOUND_MIXER_READ_RECMASK:
> +	case SOUND_MIXER_READ_RECMASK:
>  		return IOCTL_OUT(arg, SOUND_MASK_MIC);
> -	    case SOUND_MIXER_READ_DEVMASK:
> +	case SOUND_MIXER_READ_DEVMASK:
>  		return IOCTL_OUT(arg, SOUND_MASK_VOLUME | SOUND_MASK_MIC | SOUND_MASK_SPEAKER);
> -	    case SOUND_MIXER_READ_STEREODEVS:
> +	case SOUND_MIXER_READ_STEREODEVS:
>  		return IOCTL_OUT(arg, SOUND_MASK_VOLUME | SOUND_MASK_MIC);
> -	    case SOUND_MIXER_READ_VOLUME:
> +	case SOUND_MIXER_READ_VOLUME:
>  		return IOCTL_OUT(arg,
>  			VOLUME_ATT_TO_VOXWARE(dmasound.volume_left) |
>  			VOLUME_ATT_TO_VOXWARE(dmasound.volume_right) << 8);
> -	    case SOUND_MIXER_READ_CAPS:
> +	case SOUND_MIXER_READ_CAPS:
>  		return IOCTL_OUT(arg, SOUND_CAP_EXCL_INPUT);
> -	    case SOUND_MIXER_WRITE_MIC:
> +	case SOUND_MIXER_WRITE_MIC:
>  		IOCTL_IN(arg, data);
>  		tt_dmasnd.input_gain =
>  			RECLEVEL_VOXWARE_TO_GAIN(data & 0xff) << 4 |
>  			RECLEVEL_VOXWARE_TO_GAIN(data >> 8 & 0xff);
> -		/* fall thru, return set value */
> -	    case SOUND_MIXER_READ_MIC:
> +		/* fall through - return set value */
> +	case SOUND_MIXER_READ_MIC:
>  		return IOCTL_OUT(arg,
>  			RECLEVEL_GAIN_TO_VOXWARE(tt_dmasnd.input_gain >> 4 & 0xf) |
>  			RECLEVEL_GAIN_TO_VOXWARE(tt_dmasnd.input_gain & 0xf) << 8);
> -- 
> 2.22.0
> 

-- 
Kees Cook
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
