Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF3E148D1B
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 18:41:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAAE81678;
	Fri, 24 Jan 2020 18:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAAE81678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579887711;
	bh=ziCSHKn1MC1li1yMdx+C9wU/bH9EXw3ony90VTFz5Q0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NwxLYxqQTCOuAsQUibDNtUh6JIAbRkJE46XeZ9OgPiWrqs4QT9QocA74rR0XpZiMx
	 1sdtLVFzF3IUO3cu8HAl17gsi3+juG6QqNqelORkpu4jRzNU1jhQJ/AMun/owLVmnH
	 tX5NWSCegJh6XEi7PduenWiJCeiNetn78zVu0cWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7081CF80229;
	Fri, 24 Jan 2020 18:40:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47BDBF8020C; Fri, 24 Jan 2020 18:40:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C988F800F5
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 18:40:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C988F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Xr9b25sd"
Received: by mail-pj1-x1041.google.com with SMTP id n96so130013pjc.3
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 09:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Fl9DtoEGdJPaF6wiMaulBg+k/QaiWHWReTuVYIV7lg=;
 b=Xr9b25sdtL1HdTl6hIooGcqIRd77GjAUtxMUHXNaiCS1iSPex4xjnYaSAa7vjnBSwA
 ugXGLMsg/kU5nG0Z4WxkDnFka5Iy3pai7Wq0DuQKHFoEKsHpqsF3bEH1+L9HK1J+DIGP
 7hu0Q2s9C5Dzf3hM3lR6FOFv/007cTLHNxSogaGt8jC5u1tNAOOqn1ye8RoaQjx6hNJT
 pd1QmxvxE9zCPKaeOwUDAYXlclQbb3JRBsqU3PQdjG3zYTIHiJoMMnBr8t6PaB3AbWux
 8BNJPGoRCzK1reJUQL1aHxGkjnR728wbRC6FCyMaesHxw7p61aM0z6iXQVXJqsj6GTII
 1GPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Fl9DtoEGdJPaF6wiMaulBg+k/QaiWHWReTuVYIV7lg=;
 b=KI5ykulpOIKH6bgXemztsfRNz+i1Xs66tu6TRNhNtvSPcH7LIYV760AQUqTI7X/fji
 rOQ51WQKqjYTDM9/3MdCzohCt5Zsqlz6aH38UXRymBcF+hZmVHgeygEnpjq2GIx0KEty
 C5A09RMl9fNpx4wVw0OsOh52TEQyweGwCOmyvZB+Ym6pkOXD4ICnYKS9AAHLHGOTu+OC
 eTLZnALbnduahauLINm+tj2dEWHE5HqcLigZTVUUUu6ZCTvrqCDbkGcRfVNDCOIZ51EW
 ziKcdbIAdiQkk/rrIWUw8Qu/xE0881YEyzlEO8JHUEeeHxARbUQHQLotyLNhVdd0VhZ8
 DWRA==
X-Gm-Message-State: APjAAAWb8ofwDAoF45Lmc75pVRFtYJYRakbiPM/Qx/f2FIXhX3/8JDS7
 RBkIt2b4sUMiWVnllP/zQt/36IYLv4m15aL7twLvqA==
X-Google-Smtp-Source: APXvYqw2zvIPa/E8BPtiWkInChMYVaS/82b3KS2QfXEyshMm2NfjWPdDTnav/pt/y77redQAAMi2iysMW3m636r4Ioo=
X-Received: by 2002:a17:902:6948:: with SMTP id
 k8mr4558881plt.223.1579887599337; 
 Fri, 24 Jan 2020 09:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20200124155750.33753-1-natechancellor@gmail.com>
In-Reply-To: <20200124155750.33753-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 24 Jan 2020 09:39:48 -0800
Message-ID: <CAKwvOd=R6NrqAvQWdu3yZHFNPVqAMO=verL6gRDGprMjCDPGcQ@mail.gmail.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1015: Remove unnecessary const
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

On Fri, Jan 24, 2020 at 7:58 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> ../sound/soc/codecs/rt1015.c:392:14: warning: duplicate 'const'
> declaration specifier [-Wduplicate-decl-specifier]
> static const SOC_ENUM_SINGLE_DECL(rt1015_boost_mode_enum, 0, 0,
>              ^
> ../include/sound/soc.h:355:2: note: expanded from macro
> 'SOC_ENUM_SINGLE_DECL'
>         SOC_ENUM_DOUBLE_DECL(name, xreg, xshift, xshift, xtexts)
>         ^
> ../include/sound/soc.h:352:2: note: expanded from macro
> 'SOC_ENUM_DOUBLE_DECL'
>         const struct soc_enum name = SOC_ENUM_DOUBLE(xreg, xshift_l, xshift_r, \
>         ^
> 1 warning generated.
>
> Remove the const after static to fix it.
>
> Fixes: df31007400c3 ("ASoC: rt1015: add rt1015 amplifier driver")
> Link: https://github.com/ClangBuiltLinux/linux/issues/845
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for the patch!

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  sound/soc/codecs/rt1015.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
> index 4a9c5b54008f..6d490e2dbc25 100644
> --- a/sound/soc/codecs/rt1015.c
> +++ b/sound/soc/codecs/rt1015.c
> @@ -389,7 +389,7 @@ static const char * const rt1015_boost_mode[] = {
>         "Bypass", "Adaptive", "Fixed Adaptive"
>  };
>
> -static const SOC_ENUM_SINGLE_DECL(rt1015_boost_mode_enum, 0, 0,
> +static SOC_ENUM_SINGLE_DECL(rt1015_boost_mode_enum, 0, 0,
>         rt1015_boost_mode);
>
>  static int rt1015_boost_mode_get(struct snd_kcontrol *kcontrol,
> --

-- 
Thanks,
~Nick Desaulniers
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
