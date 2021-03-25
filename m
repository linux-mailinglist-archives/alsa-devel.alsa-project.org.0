Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E56B8349C8A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 23:51:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A5201663;
	Thu, 25 Mar 2021 23:50:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A5201663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616712672;
	bh=W49vg0RjcG/+X9f4Km/WhjiT9rOa23hmQGZwaQpspRM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KWNDT0uLlj9d46lfWs11tMi/K03g+ok66HclvXuSmlnYYi9fPP4+LM9SLzHaBke6d
	 hnqK+whJo418EGgjtPMcP0bgRHvr+vgUztFtqLUyfUheMUUUngnl6+0q8GkppwFDX9
	 +8NrkMwXVMWd6WR962IFF2/qCsmuogsEuSHpAfmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E71C1F80257;
	Thu, 25 Mar 2021 23:49:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0366F8025F; Thu, 25 Mar 2021 23:49:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32E3AF80103
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 23:49:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32E3AF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="J33hXiBQ"
Received: by mail-qt1-x82a.google.com with SMTP id g24so2995074qts.6
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 15:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=3pOzhkUw//+9IaXkTcXgd6heKm+rRl28GGfJ8+j7NNs=;
 b=J33hXiBQfQ01z1R2zldblTiyXslV00XZ7y4E8rm2K1kOrigIHoykk2ENeAPbXCL1ov
 AZuL/i6eV5DbmysQcOXJ+L7V63njbLA3KXH9dx7e1Mx2cSKTRhpeps4Bgu3+AqNZ3AmP
 TIDBUg1wxFlKcnXUxvo2LdSF7sIrQz1qBsa+J9SjYI0wAJ651dN2IneV37rTAREFZAzK
 nEhWEgG7GBeLTGvj08JuuiM2owBCNSMTDU0LTWL4EZyuLv4TD3HEkOCCEA/17RlssUHO
 q34V77djwu+r/wy6i72i/J+3cnDTE6CJMZvd7UVT34DqKUfLTpqhtgQdTgLU239/2Vte
 0ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=3pOzhkUw//+9IaXkTcXgd6heKm+rRl28GGfJ8+j7NNs=;
 b=WPrE0uxdHHJCf5uYYNvwrQksZD9eTAavT4+KGdywY+D40+d5nXs2Db/QX0FJ2gnCLp
 AIv10q2OB1QT4yM9xCHlzFwbaq0p6ot/8xOjA4ZGjwl4mrGFvJgVZh9mwUUxFSxczmkW
 EK/VDUFERZhAUI/f5HvHMUfD2cAdJ0JJeLwnRjFids8pADBy1QiUf7OS9qiIi2zSd7gd
 2FzPLmeWze1dAwuPl9ioVMccqUhFKh7XBzuVUrtvpvmXHVO7qPcyz9De3jZEf3eFG6+n
 UMH3cZZnivZWrH8k39dWNkv6S4xywMPAZ8JbRQGahGMTmgysS18R7gxVDlbhc9hfS1AW
 57gg==
X-Gm-Message-State: AOAM53266uO9UugsXCw17eCzk4lQD6tg0Cyjk1oULu/6o5SxWZzmc1Zv
 B4lYBcZadR19iDoWUvDF4TtLRkRmp6eH1fiRp+HhZsTO
X-Google-Smtp-Source: ABdhPJzdkbF8FD4hqSdw93N2LE4pnVc3CHYdCaUM76c6cTMDWfgBiRKY7lDQLt+iWAGFBUUGs0VtEAE2Ed4CLkHQL54=
X-Received: by 2002:ac8:502:: with SMTP id u2mr9851991qtg.218.1616712571342;
 Thu, 25 Mar 2021 15:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvcsXKRzCfDcid7nBnfvg6Vx1xQiBuK-EQmv4iGkDvZ0b3Q@mail.gmail.com>
In-Reply-To: <CAEsQvcsXKRzCfDcid7nBnfvg6Vx1xQiBuK-EQmv4iGkDvZ0b3Q@mail.gmail.com>
From: Geraldo <geraldogabriel@gmail.com>
Date: Thu, 25 Mar 2021 19:45:53 -0300
Message-ID: <CAEsQvctoyhh6-iz4SnxtiGuugcZ+9g6g7CQeub6-mxD5Fix9rA@mail.gmail.com>
Subject: Re: [PATCH] Behringer UFX1604: get rid of pops and clicks while on
 96000hz
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Oh, forgot to mention. Both IN and OUT audio endpoints on the UFX1604 are
Synchronous. Somehow someone thought it was a good idea to add an implicit
feedback quirk for it.

I consider this unneeded and pointless. In fact I disengaged the implicit
feedback quirk on my 5.12-rc4 tree and it runs fine without it.

On Thu, Mar 25, 2021 at 7:39 PM Geraldo <geraldogabriel@gmail.com> wrote:

> Hello everyone!
>
> This one has been bugging me for quite a while. I went deep hard in the
> guts of ALSA to try to solve it, and it turned out to be a minor thing
> apparently. The problem is old, and every UFX1604 Linux user can attest
> that it's impossible to use 96000hz in DUPLEX mode without annoying pops
> and clicks on the capture stream.
>
> The fix is simple: after we alter the CLOCK_SOURCE to match our sample
> rate, let's tell the CLOCK_SELECTOR we want CLOCK_SOURCE 212 (synced to USB
> SOF) on pin 1. Solves the problem for me, no more pops and clicks while on
> 96000hz.
>
> If you own an UFX1604 please give this patch a good testing. Let me know
> if it solves the pops and clicks on the input stream for you while on
> DUPLEX 96000hz.
>
> --- clock.c.git 2021-03-22 04:19:55.543485748 -0300
> +++ clock.c     2021-03-25 19:23:38.597197159 -0300
> @@ -610,6 +610,13 @@ int snd_usb_set_sample_rate_v2v3(struct
>         if (err < 0)
>                 return err;
>
> +        if (chip->usb_id == USB_ID(0x1397, 0x0001)) { /* Behringer
> UFX1604 */
> +                printk(KERN_WARNING "Setting clock selector for UFX1604");
> +                err = uac_clock_selector_set_val(chip, 211, 1);
> +                if (err < 0)
> +                    return err;
> +       }
> +
>         return get_sample_rate_v2v3(chip, fmt->iface, fmt->altsetting,
> clock);
>  }
>
>
