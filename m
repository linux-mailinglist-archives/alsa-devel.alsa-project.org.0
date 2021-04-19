Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 073AD363EAD
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 11:37:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5896B1683;
	Mon, 19 Apr 2021 11:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5896B1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618825078;
	bh=lSRozMe7UplCtykbvkjypgMm8dbYi0BdRdUwDllVmPs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V25WL/+qjRcQcj8OSnBJEYNVSxuHQvg6Oe9c+nca/X/0eka0z+xi1qgGTHD32ovH2
	 lv4oiTFsYADUrBBCAE2Mg/b+YHwBDsdbWSVVHuRS5hvxDHDjze7eiciJynx/+dRcBI
	 qCNhsb4KwDhnkR3Rgrv7Xqc+/BtwsxjIwZx/hTAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 726DAF8025A;
	Mon, 19 Apr 2021 11:37:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5857FF80256; Mon, 19 Apr 2021 11:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8400BF800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 11:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8400BF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="eWDXuqod"
Received: by mail-il1-x12e.google.com with SMTP id c4so1997827ilq.9
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 02:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jOtGaGVljDRroMtL9uxjdZ3UmcQuSpT3iJxdsMEEa7I=;
 b=eWDXuqodg1bQmske9tHrOI8NsHDlHTEgOmye/Fh7/PyboTl0nFIePRWBJXVaLBLdYL
 BBjNk8q9vyDZezKgDRUmCn1awNKpBYlI0OSF6DUqF9YSVN7EBwQT4ClpVDPrVPjhsq7L
 /cxBzjOn4DB0/2dGz6Ke0Z7XsHYqtyhTb9aFcfzn+qEf3Otcf7rUrNozVwlT9uaX6SPn
 Z9WvX60f2TB21uehcch+M5JUSGJsw4MrAm0Kad+xf46C9sHo3ZJNUNQ9HcxIF1INfPhA
 WoIxZrisApTVtJLVkzVviMmSosJJo7uZgZ9C3LPBtqz63qdUc9AssEsj8K8bF9P3DQVF
 Xi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jOtGaGVljDRroMtL9uxjdZ3UmcQuSpT3iJxdsMEEa7I=;
 b=jvbL21nHQN07ttqHNqQGgPDAideMYf/yaqeWPF89vWU6QmfWeqzfm3csJBeWlfWCqe
 Cn5qnmA7/YBJ9HreRh5MSBL9A18+bWMNMJf1QaoD4UxWNvCf70FKCaO2xMhTVpQ8zuD2
 jvBr/Xp294mDxstC5iCzFRMY4PGKQuBcGCEu2yXh1tna46QZotYNKcSmWGVfgBiVRL0g
 oNzWZQYZdBF7iQujeOGkBDnNJazuqNRSbUPpWf8/hyzyD3DizWityjUZbVmcnb99ZHFj
 M8wVQSDgZ8Veje6SW2t1BSyWnnncroE8YzYzWngN5J4lzdvOJ/GdkIX8Kzm2vgtNs3tA
 WGag==
X-Gm-Message-State: AOAM532olyIgL/spw+hDomnuOk5hE9au4oxSjJm9qN4QGbAXWe/EyF+I
 U9Z7rHc4f34ESBmOCGcyhzu6SB4ZJi1ZC9+i4qwiPg==
X-Google-Smtp-Source: ABdhPJwwakYC15Jfwn61s38W3QBtR83s86sP27Ota3crJt0MVZZtVZ7G2Iwa4wN1Yir0Xa9WkfeUDQ1R15jnMDZu1vg=
X-Received: by 2002:a05:6e02:10cf:: with SMTP id
 s15mr17546452ilj.302.1618825013674; 
 Mon, 19 Apr 2021 02:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210419052136.2475373-1-tzungbi@google.com>
 <CAHp75VfgSaRmqg96KSabmwnf6xQRMM6GQi3XAv-cJb+Lhg91cQ@mail.gmail.com>
In-Reply-To: <CAHp75VfgSaRmqg96KSabmwnf6xQRMM6GQi3XAv-cJb+Lhg91cQ@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 19 Apr 2021 17:36:42 +0800
Message-ID: <CA+Px+wUvrNT1p-pLDKd=2RyzBOiy_AuBfnyyapmbRuZWDdOErg@mail.gmail.com>
Subject: Re: [RESEND PATCH] pinctrl: mediatek: use spin lock in mtk_rmw
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Mon, Apr 19, 2021 at 4:31 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Apr 19, 2021 at 8:32 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
> > For example call trace:
>
> Please, shrink it to the necessary minimum.

I'll snip the stack a bit in the next version.

> > Uses spin lock in mtk_rmw instead.
>
> It's nice, but now the question is, can you have this function be
> called in a non-IRQ context concurrently with IRQ accessing registers?

Fixed in v2.  See
https://patchwork.ozlabs.org/project/linux-gpio/list/?series=239787 .
