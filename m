Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFFC36759F
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 01:14:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEAB274C;
	Thu, 22 Apr 2021 01:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEAB274C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619046864;
	bh=tdNHTXtFqD3SmlEYOZ44SPgtDZGtsGb61Wk+VhTwoPo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DO/U/D3rKlgNGAQj1V9iYI+rx4UbUEbXduVm22LMHy36s7yaPitvP906DUkltWCZe
	 dwrQOf2ywRqsiZsb8yJyo/94J2evMwfvomEZ2D5ANdPS3F8fbXXkbiCf0Phpx4n9lE
	 QRrGKad7a2e8C1ekgWs3zVaNzB7fe1gYecVKDIX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16DE5F80227;
	Thu, 22 Apr 2021 01:12:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B3A5F80227; Thu, 22 Apr 2021 01:12:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C335F800E8
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 01:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C335F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="grk9mpKC"
Received: by mail-lf1-x12a.google.com with SMTP id r128so42234020lff.4
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 16:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T7eHNIfHcU7QtcVVbnaCiYXMcfZmZGOpkKzfQHUQy5g=;
 b=grk9mpKC8n8Dl77wltDy3n2lpygqgROQ3Mfnf88x9+Sa8TqR3b5ZNHeiAz1CjAJ3fP
 XzHOf2+7s4RuzjlwjvGEgYufA8CVegzBB8517t0TS3DSqhAZLpi8BNkccULsh8nQetJs
 J9HgfKzcVgG4iZgJOlnAe3fsTvlz6TXBuOJR1VSCkq2sSB24IVeZzFmijlH5cLvjPl5/
 orezBpfRF0Y2RfnaJQ64eK5ROK1LunlreSLPMP7FuB/aQBTOs54Ca0EK9/qEzxL9Gsfe
 ZN0J1SSUyLL0loKgpaUOjU5cyiyDv6jkG87zZ/klg/rS/lhdxK+JMD0wekExZJv4xcte
 fapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T7eHNIfHcU7QtcVVbnaCiYXMcfZmZGOpkKzfQHUQy5g=;
 b=pr0QkCzrhn7y3CMONeCszGSw08PcPjngvMAF9/IVewoSwbvHBMTbHJI1JengK9Q6+o
 WtFBhm/OhRENejAgUjEAivE15AfdHifxHN36pTMKjLBtWOUP/DKg/9LK+v+JkOUwxlu+
 QHW8A4N7IZimi7YkXaKwjUswUnzTeEM42pZnwN3CJ09wl5d0leHueVDLs4qi5ZjiClmJ
 aSqspbSBKQuuU7lUgOwZY684BysrN3gPqLnmWtpDpSvxyHaSykLj0YqAfAKnMLXCGLN8
 oKAbOWvS5S9xEUeftuQO/bQGm+BnSO+gOFtFthtaSjD8YDM3NpubbVeKTE5k6sju6ulL
 8g7g==
X-Gm-Message-State: AOAM532VaX8MOxSFDIeF1DWSX/i+HaIegjhaLyfEK9CLlYanBu1Tabzf
 YvbqRT3HOi6I6VLk1PhjBaxkrvLXFwVNUBiwDhhBTg==
X-Google-Smtp-Source: ABdhPJydFVuqJYzV7C5StXPaUPnHeDYzd1nUo4VCkoodIL0HJhtA7Mjd3Cre/972KXMc6uNGUvXpB82qHb9d8pPRf90=
X-Received: by 2002:a19:ec13:: with SMTP id b19mr359877lfa.649.1619046766609; 
 Wed, 21 Apr 2021 16:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210406144540.3467756-1-tzungbi@google.com>
In-Reply-To: <20210406144540.3467756-1-tzungbi@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Apr 2021 01:12:35 +0200
Message-ID: <CACRpkdb6KM-smFQ9BdVQgWCNOu-4_t=g8k3_NUZ8HH0Pjr=LGg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: use spin lock in mtk_rmw
To: Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Sean Wang <sean.wang@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On Tue, Apr 6, 2021 at 4:46 PM Tzung-Bi Shih <tzungbi@google.com> wrote:

> Commit 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.") uses
> mutex lock in mtk_rmw.  However the function is possible called from
> atomic context.
>
> For example call trace:
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
>
> Fixes: 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Patch applied.

Yours,
Linus Walleij
