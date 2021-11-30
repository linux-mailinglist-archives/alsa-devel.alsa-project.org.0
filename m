Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B81346301B
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 10:49:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7F461F7D;
	Tue, 30 Nov 2021 10:48:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7F461F7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638265764;
	bh=pOxkINqgLIejjBvv+dNOnGRFh1ML72uuMUewN60BWIc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WU+Sgyc2xL/7TxhVDCVCU6SBneiZbyWA5s2YF/h3Wop2iVoXrz5L4GLSy3/8HT1F1
	 24tn+fN5jOAv/84wn62HFTMMSY39CbhXQktELVJlxYwZAHL1FGuCpmgdG2x/JUcRpM
	 ZleAtiUJ7U5skixzzNLqM4FZUSFoBosltMdMWmQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68A18F80113;
	Tue, 30 Nov 2021 10:48:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E0E6F80290; Tue, 30 Nov 2021 10:48:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4416EF8020D
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 10:47:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4416EF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Nv2spEEi"
Received: by mail-ed1-x530.google.com with SMTP id v1so84122025edx.2
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 01:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r5t08q6UdMIk/Z0F+ph/MHmT6H9HF75pUl30jI7VgeY=;
 b=Nv2spEEi9chh+joFjxYfwERQ9mCM/Vl5fZ5/NNN3lLUq9TAUbXFdoLKFAd0K/yz8To
 uIJdzjyPsFdcDb3k+JUW0newg8OfDGarnwbZJb+rfRQJOMiOGz7DMp2TLzA9li7u950H
 E5+WQOjhwlUlusDdqojYSB3N4hj3xnxbtvX5lgchWgtQ79ln7D9sOyd77Fwd//3X9BTn
 K3WwEF+t3h9DoKsryKHMTn11IN7llyauzVyBzxqW5ul+BbM1DxO+fijphmXwJoRJOrV/
 iCrE5zvQlrVt6OuX5cJmoCEUdQUf+RnhaPxxW91QpyUh+uWF8WsMiQtdDIdedAXu6o2I
 Mowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r5t08q6UdMIk/Z0F+ph/MHmT6H9HF75pUl30jI7VgeY=;
 b=uUaZPRSw1+JD9ctXT65pCqfgO7iz1gcRu22xUfWz0EobJr7wRJd2nPeDI0XXK8Dj0Q
 P3xD74hi2XkuR7vgFx9URO/Oo17cRjSD1av4UpofAVpPtsznS8LezL/b4bUV9/WT8vSF
 c/J8ldVYlu1+JZpPYuRNV1i5JwG+t0NyaRvDimSSpfXfR35dw6CN4L06REapv6X+KARl
 1IS7CKcOaffqpKxjFu4C1xXlMRjVTYhywLBVkQbANbjklT5dxfOKTdWmWkCXVgVs6eNW
 eqv0vZNqze/Voq0Z+GRXLydG0BFw6XiADebmn6l8T2UDZFspeer5w+nVngL6sfQKZSgX
 DIpQ==
X-Gm-Message-State: AOAM533Vz+kZk6VxrrQ6AcgZm44U9qM9uTtF12vHxW+Itj6pkYYdpuSH
 RQinIHJ77h9jDbB8+C46/+zg9gJAIMQIHHZFwzs=
X-Google-Smtp-Source: ABdhPJyE1eNIvqBZt3RCTvssXi6N4xDKblDz3pnEWAnVqCjGrMWu/UyGFfqdHSnfdzGBhKd4ZJMZ7Uh05f75MBvw2jI=
X-Received: by 2002:a05:6402:270c:: with SMTP id
 y12mr81877950edd.258.1638265676773; 
 Tue, 30 Nov 2021 01:47:56 -0800 (PST)
MIME-Version: 1.0
References: <20211125075028.8500-1-tangbin@cmss.chinamobile.com>
In-Reply-To: <20211125075028.8500-1-tangbin@cmss.chinamobile.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 Nov 2021 11:46:19 +0200
Message-ID: <CAHp75VfS+u56RDG6AhGwSuB35ERUTjw-e3h05OZmZowstWJL8g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: atom: Remove redundant check to simplify the
 code
To: Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

On Fri, Nov 26, 2021 at 2:37 PM Tang Bin <tangbin@cmss.chinamobile.com> wrote:
>
> In the function sst_platform_get_resources(), if platform_get_irq()
> failed, the return should not be zero, as the example in
> platform.c is
>   * int irq = platform_get_irq(pdev, 0)
>   * if (irq < 0)
>   * return irq;
> So remove the redundant check to simplify the code.

FWIW,
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Code is correct, I haven't checked the rest, though.

> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  sound/soc/intel/atom/sst/sst_acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/intel/atom/sst/sst_acpi.c b/sound/soc/intel/atom/sst/sst_acpi.c
> index 3be64430c..696d547c5 100644
> --- a/sound/soc/intel/atom/sst/sst_acpi.c
> +++ b/sound/soc/intel/atom/sst/sst_acpi.c
> @@ -226,8 +226,8 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
>         /* Find the IRQ */
>         ctx->irq_num = platform_get_irq(pdev,
>                                 ctx->pdata->res_info->acpi_ipc_irq_index);
> -       if (ctx->irq_num <= 0)
> -               return ctx->irq_num < 0 ? ctx->irq_num : -EIO;
> +       if (ctx->irq_num < 0)
> +               return ctx->irq_num;
>
>         return 0;
>  }
> --
> 2.20.1.windows.1
>
>
>


-- 
With Best Regards,
Andy Shevchenko
