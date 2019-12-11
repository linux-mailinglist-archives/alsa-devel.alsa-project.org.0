Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D9D11A4AB
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 07:45:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 754761657;
	Wed, 11 Dec 2019 07:44:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 754761657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576046704;
	bh=7+e0Jqg2Aq8FDq4RZApaS7xdRzNa5h1a+v9GhYOth5A=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TLj2DZBWGjLJf9ArZbH8ZK8HmnV7cxpdBU1C36edWjyb3KENZ3j0uFCxOcbPg7A9H
	 kHYB90bxhh/tOTggCDQDuMqLqzOAhSjqFjZwWXeWzqqUZquR6VwvvLfKSXPcbXcJfa
	 A0SV/MGexep5/VkSC3ZfjIs+m4JPDhlNGsPdcAQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBD52F80290;
	Wed, 11 Dec 2019 07:38:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0C40F8020C; Wed, 11 Dec 2019 02:39:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, 
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E20DF800B4
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 02:39:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E20DF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PmYjvIQX"
Received: by mail-qv1-xf41.google.com with SMTP id c2so5046314qvp.12
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 17:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oo8iSl+PbW7oxKRku63cLB38Us675nnQXIUnSFmiZm0=;
 b=PmYjvIQXm2ujizamgxSRKk3AjWwdW/VleXxlg7hWa8OZeVAXJpdUDjc8/pRwW8buGG
 +ABs8eyulGtqTz4d2hJ2SnKsMa8gTmMUrJFpPwKM1FpQH9ylD/eDO1Wk/W5xjvIAhaPv
 U7EIOu1GwB5xHYJpZJv/1ix3ljD1S4R5DdfpjzQr9HhEy368woRgg5mUBBHy34ONkreP
 M4IcSHIHkmvWtZ0Y2ffwZKanMvO3Tk+ilrEgTel55EwcH0hYD9fSuRIjsT/p+fr1sP41
 JJp7odXgfVaWDs/WmyW17vpdhPWOeGzQdOIMXCxGTSgOPNPu7O2Fvtyaxv18gYAfW1z3
 p5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oo8iSl+PbW7oxKRku63cLB38Us675nnQXIUnSFmiZm0=;
 b=X86RyRFgd/oVdpd0hVJYV/By74/wo/bXYKlLcDD9ZpIwwdjXzOtsWvugBi29288vnk
 a3jUTIiitfZ3A9IRZ1IucInBYzqrJJOr4c6uy/HYMZ/yfvfS02ikHsqm2lYVSja22k3B
 QWu5cEOo/zYD7m2WnEgOFvFvLjCw+xiiCzCU45IdFs+qg5f1+Uan8m/YA6dQpXx73Ykl
 WnT2LrQqyqSCYeNDEE2UDCSwh33lihm5apJfgVjZ6gLx1quBZP92SzuQ+d0+Xnap8OUi
 tl+pmC7eP39bsn+QLwDoAPX+V/MhYQcsEQV/11nPi6kgYJz8Z7H8xHEonM8bGxAKpHLY
 x/Ow==
X-Gm-Message-State: APjAAAUoM7aypbfdqUXKQ7ePFBV/5c7cmvm2rk6y1s6IxhanrMx58qRE
 4fiPEnA0R7Uva79azvNZz23BZMLTEiDUCodMZzQ=
X-Google-Smtp-Source: APXvYqyfIDiXdlPybf2xoyjGCzaKw4xhe+VY3XWs1QzStQBlAaf2I42VFuPx15yzeGnvT+OWCikEcwg0S2Bd7NsAObI=
X-Received: by 2002:a0c:eb8c:: with SMTP id x12mr785173qvo.65.1576028341156;
 Tue, 10 Dec 2019 17:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20191210145406.21419-1-tiwai@suse.de>
 <20191210145406.21419-18-tiwai@suse.de>
In-Reply-To: <20191210145406.21419-18-tiwai@suse.de>
From: Baolin Wang <baolin.wang7@gmail.com>
Date: Wed, 11 Dec 2019 09:38:49 +0800
Message-ID: <CADBw62p9tQcpi2TFjg-Eb+6HXpE-jAmx4r9y-yDcbiui=ubdyQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Mailman-Approved-At: Wed, 11 Dec 2019 07:38:39 +0100
Cc: Orson Zhai <orsonzhai@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [alsa-devel] [PATCH for-5.6 17/23] ASoC: sprd: Drop superfluous
	ioctl PCM ops
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

On Tue, Dec 10, 2019 at 10:54 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> ASoC PCM core deals the empty ioctl field now as default.
> Let's kill the redundant lines.
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang7@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/soc/sprd/sprd-pcm-dma.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
> index da4b8f5f192b..2284558684bc 100644
> --- a/sound/soc/sprd/sprd-pcm-dma.c
> +++ b/sound/soc/sprd/sprd-pcm-dma.c
> @@ -508,7 +508,6 @@ static const struct snd_soc_component_driver sprd_soc_component = {
>         .name           = DRV_NAME,
>         .open           = sprd_pcm_open,
>         .close          = sprd_pcm_close,
> -       .ioctl          = snd_soc_pcm_lib_ioctl,
>         .hw_params      = sprd_pcm_hw_params,
>         .hw_free        = sprd_pcm_hw_free,
>         .trigger        = sprd_pcm_trigger,
> --

Thanks for your cleaning up.
Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
