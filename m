Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 459803F9C94
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 18:35:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2DAA1717;
	Fri, 27 Aug 2021 18:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2DAA1717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630082152;
	bh=b/+xCv0An+n/L9QlIoIVEpk2njpGRiA0NXhUY9Sk9HE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sIaKjOdS/MpLv1J4ExQsJb5IclPFmKR3qGNIiIi0sGt7MMjB/BtwCJj8n3ZQhnbLX
	 rbDt6HNsmcEW7k9giFk6zKQk/VDbLqYLrDUizNKzzivxasLrIZF+96nf8FaHKmM223
	 hXTPFq4oFKJOAVorpjUCuJyTXQllXxJNq7pJqtKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FED0F801D5;
	Fri, 27 Aug 2021 18:34:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CCE5F80129; Fri, 27 Aug 2021 18:34:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19C5EF800FD
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 18:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19C5EF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="MIu6uCFa"
Received: by mail-ed1-x52c.google.com with SMTP id z19so10679670edi.9
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 09:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yGmm2N20SvhlWLEGMhjc1LWz5xlmWEUFwjKkpga+l7E=;
 b=MIu6uCFaoyiearT/6E633+UZzIGCb9r+P6QMUqiWQ1uV0ztDFxoMdiR7bC2ybgeiPh
 SpZH5l7EvZvDCaZRm/4xSFlmliWUU7wW61FpIIL+anjx7rKZb5K06YwM+Cwk6umT4Hie
 Sk8rvpF7mOq0yPr1e8E1vgbBg40aV0nNb/4gypWPXpIbSNwoLLNdJLxbHRPCKJKf354n
 tE2owpPGfRO1Azbxwwyk3u2WpQkMC+7EuLHLbxdQoRM89u/e2BSGEbRGXJnXybBs1djl
 vUOgQfMc1/DNw7lQz7RhpwHfgDD9Kmg/HYnyOtClUD58Cvk0wSlMtPGvyhHBj46zBiGz
 xPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yGmm2N20SvhlWLEGMhjc1LWz5xlmWEUFwjKkpga+l7E=;
 b=nfhEN9c/PZonXT6QgSzyllwNXKt9hCoyKSHgAcQpI1+36b62pO8Nwzd6Y3UN03Cprz
 PKB6fwqJo4TctQ/E/bb1VRW4VZuLOS7FtlPCBtU/+UH5sgoKNlI9Vvt9fLr1SvOgOX+c
 aTjAd2F2uGiexAthqDvGjTAuaz7TnO6e5YkKZZmdKS00Cthn2pFmVSQnuaGh7N9Y2TfD
 LXESy8QwPb/5S0QRYGRsMwAhACU7LZbo+92CgEGvNqGL0j9aRxhlv1zg+romsUsWXqQh
 N+lPFx/6HYooxxioC0UKPEWYwHyNRZ/YI4XFZy+n3VH+rTRAcKcBvoX7QPvoDYYiPhAN
 J2IQ==
X-Gm-Message-State: AOAM532FEPAGZiASpGl9Cn9Tqt8IafJl4fAholi/LZWqshC5bB2zsafH
 gXRP5GA489IQ3zbEAtudMRWEGppwMEREUmfm9+eOWUTGebuA6w==
X-Google-Smtp-Source: ABdhPJxFNfbu3GbfNxv4NKSV/XWGjf9a2le29BHv82sCEUQxGDFllkHa2ilGTwZYssza8A+v1TggXwzXsSYn0WxCRJ4=
X-Received: by 2002:a05:6402:4382:: with SMTP id
 o2mr10798735edc.104.1630082060994; 
 Fri, 27 Aug 2021 09:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210827153735.789452-1-zsm@chromium.org>
In-Reply-To: <20210827153735.789452-1-zsm@chromium.org>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 27 Aug 2021 09:34:09 -0700
Message-ID: <CABXOdTcJoayGaHqEf1=jb_2UBLqGfiCPiU_wUPFyXoYLi64hhA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: pcm: fix divide error in snd_pcm_lib_ioctl
To: Zubin Mithra <zsm@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Guenter Roeck <groeck@chromium.org>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Aug 27, 2021 at 8:37 AM Zubin Mithra <zsm@chromium.org> wrote:
>
> Syzkaller reported a divide error in snd_pcm_lib_ioctl. fifo_size
> is of type snd_pcm_uframes_t(unsigned long). If frame_size
> is 0x100000000, the error occurs.
>
> Fixes: a9960e6a293e ("ALSA: pcm: fix fifo_size frame calculation")

Reviewed-by: Guenter Roeck <groeck@chromium.org>


> Signed-off-by: Zubin Mithra <zsm@chromium.org>
> ---
>  sound/core/pcm_lib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> index 7d5883432085..a144a3f68e9e 100644
> --- a/sound/core/pcm_lib.c
> +++ b/sound/core/pcm_lib.c
> @@ -1746,7 +1746,7 @@ static int snd_pcm_lib_ioctl_fifo_size(struct snd_pcm_substream *substream,
>                 channels = params_channels(params);
>                 frame_size = snd_pcm_format_size(format, channels);
>                 if (frame_size > 0)
> -                       params->fifo_size /= (unsigned)frame_size;
> +                       params->fifo_size /= frame_size;
>         }
>         return 0;
>  }
> --
> 2.33.0.259.gc128427fd7-goog
>
