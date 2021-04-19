Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A841363D7F
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 10:33:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFBA7167A;
	Mon, 19 Apr 2021 10:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFBA7167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618821194;
	bh=IaF1ujNlwCFBmsypmP8pKfFvKwIyMgZaDoV6wTYHND8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ajy5Jn/fkRTX+7oV7LNYjqXh9OW2a9gGs4Bu2TXbtpL4klsR1r7AWtX3rdgLjWC/Y
	 ZD/TLCeCVc68XzmJSzSs7b7KiGD8U2d3qOo3z6/IMvn50CqbazcVALEr2uZC83LdZR
	 58oBnfajTa0J3QLSKhpRtHc5Q0V/S852s9iPWzMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0625DF80256;
	Mon, 19 Apr 2021 10:31:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B69E9F80227; Mon, 19 Apr 2021 10:31:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EF48F800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 10:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EF48F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HRlxRoH3"
Received: by mail-pg1-x533.google.com with SMTP id s22so2643517pgk.6
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 01:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CofomMDhzLby6jKPOdJPCFtVEilhHYlHNh+ABC13Dc4=;
 b=HRlxRoH3IzaYwe3LI1zmqVY9HY+Vu+PCTuOgi9FZTqvGbKVNwNN95X/yMqHaXJ8Z0+
 hz2IuChL/5IpS1BReEFHh0jv5FG1Fgl9e3DWEGP1jyi+tUYFx4NWcTpNm+DMYJvGqXNb
 TztXR5Pm/Zy7gxlfvYVbGRpUWgDuurdFi0bItAkTrERdXsDMORcj8cjVFOg1oAMnGLaF
 2J4vHv6oy6z9HMNWFE3Q0ptnznybN/bgkcN1fuotd1jLBQaSSbvv0UTZbreLPUx95w1C
 uxmN/cDRkJLzba0wsPEKbaK6XLswEYqQGiWOoI2HkrRMRfPivPn0pOS2CKk0jkmMMR1t
 CMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CofomMDhzLby6jKPOdJPCFtVEilhHYlHNh+ABC13Dc4=;
 b=PUtiV2XFy6fGNgJXv+6uHI27xLziW7rJXHaRYYTJphtMt7aRyLGFtnb8jmfaNeuJR+
 HiKX3ameX6ndgGzelqnvmTqe+/hdfQSd/0hcHOIbhLjteqgcWbLYlAcrqiowfy+FleLE
 WaKtOTAtrMK1zabA5/7WX0PD+32iObOmwhbyv2BPxkuxUD73A9a8+9Us0DnxtOCcYav3
 rlg3tiAByztpQFLF4nLplXGL1t0/w2HvZMq5D9zlWFXxSfC56R/itlzcL6biQbdezaCW
 LpJTKPCUpzXTDaONwbnxzIhh1TqkQdBkynR8Qt5EWX0TAnayhziTXYpOhYaZ5Qurm7+X
 zRDQ==
X-Gm-Message-State: AOAM5330hcumXoGTcpUsMes1ttmk6HRifkVjRFBBkWlCHw+oxyWG1VX8
 fPfRw3JWuKB1r2LNs008s6/1gyKNxEWu3lEnSS4=
X-Google-Smtp-Source: ABdhPJwEl51C2UnztCvtSzBm7xf7+4nT14qMIMlvBAqjBTvaTum9itzOtu905couqLeG+9FMN+5vak02Ac6xffS2hoY=
X-Received: by 2002:a63:cb44:: with SMTP id m4mr10857045pgi.4.1618821090400;
 Mon, 19 Apr 2021 01:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210419052136.2475373-1-tzungbi@google.com>
In-Reply-To: <20210419052136.2475373-1-tzungbi@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 19 Apr 2021 11:31:14 +0300
Message-ID: <CAHp75VfgSaRmqg96KSabmwnf6xQRMM6GQi3XAv-cJb+Lhg91cQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] pinctrl: mediatek: use spin lock in mtk_rmw
To: Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, sean.wang@kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
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

On Mon, Apr 19, 2021 at 8:32 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Commit 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.") uses
> mutex lock in mtk_rmw.  However the function is possible called from
> atomic context.
>
> For example call trace:

Please, shrink it to the necessary minimum.

>   mutex_lock+0x28/0x64
>   mtk_rmw+0x38/0x80
>   mtk_hw_set_value+0x100/0x138
>   mtk_gpio_set+0x48/0x58
>   gpiod_set_raw_value_commit+0xf4/0x110
>   gpiod_set_value_nocheck+0x4c/0x80
>   gpiod_set_value+0x4c/0x6c
>   max98357a_daiops_trigger+0x8c/0x9c
>   soc_pcm_trigger+0x5c/0x10c
>
> The max98357a_daiops_trigger() could run in either atomic or non-atomic
> context.  As a result, dmesg shows some similar messages: "BUG: sleeping
> function called from invalid context at kernel/locking/mutex.c:254".
>
> Uses spin lock in mtk_rmw instead.

It's nice, but now the question is, can you have this function be
called in a non-IRQ context concurrently with IRQ accessing registers?


-- 
With Best Regards,
Andy Shevchenko
