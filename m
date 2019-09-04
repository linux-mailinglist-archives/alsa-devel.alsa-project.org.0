Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26491A85B4
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 16:39:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94A5A16C6;
	Wed,  4 Sep 2019 16:38:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94A5A16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567607977;
	bh=z+Gvd+7IBYO8g4A5zTNbMz9EvkABAZ0rRTrjm4Aeywo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=to0oXxsl9vYp0nTvqIfO8OSmoiYUgw1R3a4R7g5Y3rbUF2OF2pP3YSUqsMwLcWV12
	 F+4THyXm6GKBBsFhoLZ7oX6NDzP5hv0ZAUMelKMgmtUFc237gCNo6TfVXXH/44Sjab
	 I3y42+c/H4sq7e+0lZzhnih4bE3cHdCXrTsSvuHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31A58F803A6;
	Wed,  4 Sep 2019 16:37:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB3DAF803A6; Wed,  4 Sep 2019 16:37:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06809F8011E
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 16:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06809F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lhRvMHhK"
Received: by mail-pg1-x543.google.com with SMTP id l21so11368327pgm.3
 for <alsa-devel@alsa-project.org>; Wed, 04 Sep 2019 07:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9CaC26YQBbs++2LlEGrT8hc5InQ6jt1lO4oP+jQbo+4=;
 b=lhRvMHhKgBm1PhW5YBzZk3QZWD0LIQg6cOaGJFKLMq8Mnd6w4KgZIiAHf50nbo9xhi
 SuoO6m+VMe3I9zG3rJp1TrqOstdiv5kf5JLs9VGrscoB/IPlo1WEdupFrLa4CI9wfp05
 tm/5Yusnpdj+eJVLa0gxHihikGCgaKT/WeZ4I27xXatqSniZQJn95Y6Cu4l/7CPN1kNw
 4mnbBQQQihbtiA2Amj5vfI+QxFxsbGZCsZpn5AXQmlwnX880YB0EIT5r/aZBGZNb6+a2
 KI8h15rroiib8t4s0NwkdF+RGHJY5AkYNCT9JzXU1sAYdGvEncmWSWBe8g2MgaN60+wF
 rFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9CaC26YQBbs++2LlEGrT8hc5InQ6jt1lO4oP+jQbo+4=;
 b=BLfcSqwoGg8+KHBVC0B56AW0MMjHKkHoo3wz2OO/2VuqKY7LN+qdC5QDMJHW/UyHrT
 GvsRYBgZw1stE4Q1RhtTVQhlqG4kq8gIm3D0NHPKahxduMZF8cfwCDgVdESa8DCDkRRH
 c1+IywsO9k1dH6ngnLkiFGglyb8lv1HCVfy2SSE8f8XDAOjR0cv6UQ+HC0HRAHs6dXrZ
 NPVf2A81urF+n7KovDkkWuWKzJbpefbyOYXNEaqk46byk/z6suRTUsRWvOVlnQ+NwWN9
 QmVKxd0chz3z+f0M66yQYo743KhGVrp4MEXwfLoNhjMHBnBmc9DM09kzvANvYjY2LqoJ
 yOPA==
X-Gm-Message-State: APjAAAWjh7tACwNmE7Vx9wybkEmkW7EQf5xS/0KXWxPrnzk5bFzcV3wD
 z1nl+OpXSTNXhja62dB4LaeKEsIXUR/O77vNUbY=
X-Google-Smtp-Source: APXvYqyZI6XJ+nXCD/369CCkMaViohyIPk8rgyHpVtu6GqeKZ94m+IIC+qjyXskEfjhPXSp3sqhdAxD2FCSLALCyNcU=
X-Received: by 2002:a17:90a:bf01:: with SMTP id
 c1mr5430039pjs.30.1567607858001; 
 Wed, 04 Sep 2019 07:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190903165322.20791-1-katsuhiro@katsuster.net>
 <20190903165322.20791-2-katsuhiro@katsuster.net>
In-Reply-To: <20190903165322.20791-2-katsuhiro@katsuster.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Sep 2019 17:37:26 +0300
Message-ID: <CAHp75Vcm0yus5GpZEttdr_C07gmQXeNJ16gb_TFLUTvGkc164w@mail.gmail.com>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Drake <drake@endlessm.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, David Yang <yangxiaohua@everest-semi.com>
Subject: Re: [alsa-devel] [PATCH v3 2/4] ASoC: es8316: add clock control of
	MCLK
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

On Tue, Sep 3, 2019 at 7:54 PM Katsuhiro Suzuki <katsuhiro@katsuster.net> wrote:
>
> This patch introduce clock property for MCLK master freq control.
> Driver will set rate of MCLK master if set_sysclk is called and
> changing sysclk by board driver.
>
> Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>


> +       if (es8316->mclk) {

You don't need this if clock has been requested as optional
(clk_get_optional() or so).

> +               ret = clk_set_rate(es8316->mclk, freq);
> +               if (ret)
> +                       return ret;
> +       }

> +       es8316->mclk = devm_clk_get(component->dev, "mclk");
> +       if (PTR_ERR(es8316->mclk) == -EPROBE_DEFER)
> +               return -EPROBE_DEFER;
> +       if (IS_ERR(es8316->mclk)) {
> +               dev_err(component->dev, "clock is invalid, ignored\n");
> +               es8316->mclk = NULL;
> +       }

devm_clk_get_optional()

> +       if (es8316->mclk) {

Ditto as above.

> +               ret = clk_prepare_enable(es8316->mclk);
> +               if (ret) {
> +                       dev_err(component->dev, "unable to enable clock\n");
> +                       return ret;
> +               }
> +       }

> +       if (es8316->mclk)

Ditto.

> +               clk_disable_unprepare(es8316->mclk);
> +}


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
