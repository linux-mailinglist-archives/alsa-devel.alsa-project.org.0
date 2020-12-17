Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A748C2DCD57
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 09:05:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C56EC17BC;
	Thu, 17 Dec 2020 09:04:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C56EC17BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608192343;
	bh=hXbceoeIA0DE31bEba8o9mV0lkDWvtQslRt1hCtIYLg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hCAZsz64JeSjdTTUvrdwMta5P3RqhrhVesMgVcBGkYrMtYkJ/pBSxVm0KqHuzVD5l
	 a1Xe8aao78ICNB6VO//Gq4PZe6f9iTMOeWFaz393msA9ajj5XDIXIPa5+fkmqT+Mb9
	 4J10nYZ328JIvOSPnUPoFkvIeFsX2KldVG6OiAwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 405E3F80259;
	Thu, 17 Dec 2020 09:04:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23E3EF8027B; Thu, 17 Dec 2020 09:04:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B936F8014B
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 09:04:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B936F8014B
Received: by mail-ot1-f54.google.com with SMTP id b24so8949008otj.0
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 00:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uQgt+FVYH797z5Vlckt2i1dwoXEIhRpQsbLd/ECrc7U=;
 b=lmunInM3f4hfzQm68ER9NczXRjEJFEVOnWdBNqDYMsqDbKiVt0ogeJxQxk7TtGWQ1L
 XD8GbhI1K6APDsnnYx8rBRIFdEW+N7eKbpeakdPrpm3PFnrJbdspvnU724JOL8pfaCTb
 iNNuXEiuBDIPM8HgVDyLcwSP0a73aXCVOX9U/ahBO6KfJh8eL9WFJzFLi9AIInu0frwd
 +3Bk8NL3UZZl36IM+qzA4cnZT47XEHDNWXnb5aGZglrW54L/Buy/gJXnsRrKoWPHai29
 OKsY4ZdMY1I6XXmvEFS3ZNVAUZMKoaXa5/pka1+6ofpwqR2atW1YN7LWLYxGKsbeLc5Y
 ry6w==
X-Gm-Message-State: AOAM5316wgLZs66ashPh4v+MI7FXK1L94VYp44yA0Ay5UxSgiOSowpWO
 XXy5vVS8JjIjsKj+KIftPMgKlTWOK7qKHQ9P8vI=
X-Google-Smtp-Source: ABdhPJybyTswJRY3O1hPUoU7EZFi+05wN2HWZc2/dmsfbk8XjS4PApghceDJ9LNEHuUUEwberUte1Nmfqp89KBHhjqA=
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr28599288otc.145.1608192281995; 
 Thu, 17 Dec 2020 00:04:41 -0800 (PST)
MIME-Version: 1.0
References: <87eejpgoi9.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eejpgoi9.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Dec 2020 09:04:28 +0100
Message-ID: <CAMuHMdWVqyjX2A2AgSo=CuZ+bG=6JgXAht4VcvuXM1x0Xe0eyQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: rsnd: don't call clk_disable_unprepare() if
 can't use
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On Thu, Dec 17, 2020 at 3:28 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> We need to care clock accessibility,
> because we might can't use clock for some reasons.
>
> It sets clk_rate for each clocks when enabled.
> This means it doesn't have clk_rate if we can't use.
> We can avoid to call clk_disable_unprepare() in such case.
>
> Link: https://lore.kernel.org/r/CAMuHMdWvB+p=2JqTsO7bR8uJqKqO5A2XgXFXsVAjHk3hcxgcTw@mail.gmail.com
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
