Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E683675F0
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 01:55:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32B54166B;
	Thu, 22 Apr 2021 01:55:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32B54166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619049353;
	bh=GY20QbXJQNbYk5zSxwXAF85ny2oPHv+cskRMlZYq73U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KyRKRusMPBW5vVkmznZhJEOoASuAazQdTmUWeRtw9ZAjV7pqSO4IOky0yqaolVSyE
	 XJ/P+bfB3R4C0FN4Cpj78KBu4DsVKb0Awi2ljKatu4rAi23vJqpTm/xbYYW0Xf/4oe
	 AXiXDntPDnR1RuowCDHx7AjWhm3z5yAAWWtnUlrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38EF5F800FE;
	Thu, 22 Apr 2021 01:54:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3CDEF80227; Thu, 22 Apr 2021 01:54:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59F64F800FE
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 01:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59F64F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="M50X8kcp"
Received: by mail-lj1-x22a.google.com with SMTP id l22so42356175ljc.9
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 16:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ha9Jxb8RRWJm9u6+BE/jlSRSSfMQmc0ncpQ85OvWeew=;
 b=M50X8kcpN0JZxJee2WEC7hWKQL0fYBwjBzseQ1GefKJtd3isMQEL5rIyivhKodzsOE
 +jbXIkBkGJmO0NYoUS/5Ts4KaIZXB6BQsnP7QKmFwHTHedhE8iBorxq8C5MX3i8iD8fW
 sUSEWlmlyZMEQFYsijMDfiLsCDxtlpUxCzKZKOzNZUDzxelFut7iGeyfvTNqaXkdIP2/
 bNN/fRjFYVPRoxPMG79suGFZ+R54dzIHJccxLrZFSCe5rlaQ21rotV83aJvjMS8a/ad4
 Ugm4PUZJaM8cIEVW2TEPWZaFAWn0Wi2rxQlEvrQ3lHyP9ecDdFc6haxupHcWi0ypD+1p
 8WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ha9Jxb8RRWJm9u6+BE/jlSRSSfMQmc0ncpQ85OvWeew=;
 b=EFa3D0DYeZfV6gcXdi1Lbc8wTTgtphjyphO6I/b3Nskcs79j+3aXrkdQHuFQt6vf1m
 rdcLOPHoCGTUexgjWLjXDyxqH4q6UgCNBqXj7/5xYStOIMU0Dn74bYiMWvH/RJ6UA9E2
 5gyaKH3MV/htRg69frD2/EEY/9/L7ag3EMnSKqHSuSBlymmWRl7EbqGYusE3gyFzMAZk
 eod9ew5UiJEzLqugrNC5QBSLXMxbRepc8CR4rx4S8oBjmWkE7WPMfpaTZRB000fviDBx
 gbfOIa3ykT6uNQ+Al2R4ysRCXIxT0TYykYT6oshLwffCCN/sUkm0pvRr4zxlg9Cxr95V
 GGeQ==
X-Gm-Message-State: AOAM532248gHOUeNbNPu0l3aWL9lqDF5t2ZQzFnqu+63G7TZcegGThKv
 Rn/GSGn8C9qdjFvjp73vQp36Nhn93NApK/7L8Y4m2g==
X-Google-Smtp-Source: ABdhPJxXbb75aL5nQVGTClsRSQ0xMrdu07CRAlP8Af8vi1m/elQpncbyJdz0Xi1ZLRYaId/J1dJqb2gXdIhWm1JwzMw=
X-Received: by 2002:a2e:8992:: with SMTP id c18mr557921lji.74.1619049253829;
 Wed, 21 Apr 2021 16:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210419093449.3125704-1-tzungbi@google.com>
In-Reply-To: <20210419093449.3125704-1-tzungbi@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Apr 2021 01:54:03 +0200
Message-ID: <CACRpkdbhTbskkxkVo4Jw2=KDapytqw=QJ4kmRtqk=bHhgKUpGg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: use spin lock in mtk_rmw
To: Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Sean Wang <sean.wang@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
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

On Mon, Apr 19, 2021 at 11:35 AM Tzung-Bi Shih <tzungbi@google.com> wrote:

> Commit 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.") uses
> mutex lock in mtk_rmw.  However the function is possible called from
> atomic context.
>
> For example call trace:
>   mutex_lock+0x28/0x64
>   mtk_rmw+0x38/0x80
>   [snip]
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

Pulled out v1 and applied this v2 instead, thanks!

Yours,
Linus Walleij
