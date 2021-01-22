Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 780AA300E58
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 21:57:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE0BC1F0F;
	Fri, 22 Jan 2021 21:56:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE0BC1F0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611349031;
	bh=CtjdhR4ol01/HO9oIcdq2P+xfltLGX7SxSZ6zPj2Wa0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iP1hfqNNnojmBniJcr8rSj+Yi5ZoaoQTs5i348s8fHxqh1xs3WJ5tt3HLdY9V6u6M
	 sCsJamRMBxgffAxVJHACA7HxKrUfJpSTt51/by5LK/ZEEuKtZDKJCg0FeObNA2XWhB
	 gUOXV9X0MFcQZNUI5ukhR6Xnj8TV9/yLqdd8WaeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56CEAF80166;
	Fri, 22 Jan 2021 21:55:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7A84F8016E; Fri, 22 Jan 2021 21:55:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B265F8015B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 21:55:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B265F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Nri5eoAT"
Received: by mail-pl1-x635.google.com with SMTP id 31so3964613plb.10
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 12:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UGuXgzHMRCNvdzQSVYVqEK+DngVryvb3NdDIdnd4v54=;
 b=Nri5eoATvjJNwAyG8UjhgOoqcWybOvwpVkxZIDxYxbLm19l6/A45ZvZBCeAmfRMRe5
 Q3wurcY3Q7gVpRo7zmX82ZGUWZ7N8ubR03O+JRquWGBvaYnQwn8l/Zw1Y0aVxFi9bTZz
 Ra7aA/A6tBLrfibbMfnc8rTfZianzXGXnbroXjsGkHTtkig4uO5rMYvhQ1AEtZ43oCP3
 rc3vPK7wPC0sRYR0YExu721bhQ+nKbpQnJQ4nnrULWf9h+Jdm1r8rkF2ZxqtUNy2flVP
 xJ1y+1bk2lBL0GRsma6VEGpk/itLZZ4+oUzOGiCcFxdTjpqyA0r9vsc752lx9k69zsfO
 Hycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UGuXgzHMRCNvdzQSVYVqEK+DngVryvb3NdDIdnd4v54=;
 b=Lq9HYkYbJHzBDGMqPiM/F5GQnzUmiBBr6kr/GmKiIc0rrCSrSROT9qJVcUwkQ7GChD
 ECFYBgYiHD6knit5CYtE5HWsjmBuQ2C63ry1Xqv5DCkCl4vaWGPpppjqt/7N5+V00eRp
 YUL/EJiOKyWhDgYRcWLAGalkWnrSVdyP+ZwIv8EZfJ28+nvFl/Anteb6JaRRXTtDcfcp
 9ghwf22CFxBUX1lrIye+Gn2lDGjy1rHu1NbNgk7179Vaws9NZjbmI8EeYU8n20nbyl8O
 A2KVuY8SwyVrnZh8x5ryttGRWcjB1N6EhqcAviFjfe9GoEegaZ5zH1v+1KSohrcye9al
 bVag==
X-Gm-Message-State: AOAM53068b5G12MjWqvfx/H8c8QvBEcpAkKp0BnPKL8THSUIfWxkRsEr
 KxMkIZqUqiudT8q0jrvB95xTjcWJkIw0ne1T4Ws=
X-Google-Smtp-Source: ABdhPJxinfDMfQfRg4whIGFJPRTRbEfyBEJF9BZDQRn0e5jWUpYKT3Rs1OxK7uERw0pWJjgj+wkI3TYPXVUAol/zlio=
X-Received: by 2002:a17:902:7b96:b029:de:7ae6:b8db with SMTP id
 w22-20020a1709027b96b02900de7ae6b8dbmr6814890pll.0.1611348929283; Fri, 22 Jan
 2021 12:55:29 -0800 (PST)
MIME-Version: 1.0
References: <20210122164107.361939-1-hdegoede@redhat.com>
 <20210122164107.361939-12-hdegoede@redhat.com>
In-Reply-To: <20210122164107.361939-12-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Jan 2021 22:56:18 +0200
Message-ID: <CAHp75VcP6NXn8gAze3B=b1m2sRZnrV=dL456D0QAGzON21etFQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] ASoC: arizona-jack: Cleanup logging
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
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

On Fri, Jan 22, 2021 at 6:41 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Cleanup the use of dev_foo functions used for logging:
>
> 1. Many of these are unnecessarily split over multiple lines
> 2. Use dev_err_probe() in cases where we might get a -EPROBE_DEFERRED

s/RED$//

>    return value

...

> +               if (ret != 0)

Since you are touching it if (ret) would work already. Ditto for the
similar cases below.

...

>         if (IS_ERR(info->micvdd)) {
>                 ret = PTR_ERR(info->micvdd);
> -               dev_err(arizona->dev, "Failed to get MICVDD: %d\n", ret);
> +               dev_err_probe(arizona->dev, ret, "getting MICVDD\n");
>                 return ret;
>         }

Seems like your first dev_err_probe use :-)
Can be even more optimized, i.e.

  if (IS_ERR(info->micvdd))
    return dev_err_probe(arizona->dev, PTR_ERR(info->micvdd), "getting
MICVDD\n");

...

>                 if (IS_ERR(info->micd_pol_gpio)) {
>                         ret = PTR_ERR(info->micd_pol_gpio);
> -                       dev_err(arizona->dev,
> -                               "Failed to get microphone polarity GPIO: %d\n",
> -                               ret);
> +                       dev_err_probe(arizona->dev, ret, "getting microphone polarity GPIO\n");
>                         return ret;
>                 }

Ditto.

-- 
With Best Regards,
Andy Shevchenko
