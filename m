Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCAA3BF70D
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 10:43:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB02D1614;
	Thu,  8 Jul 2021 10:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB02D1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625733818;
	bh=sLZQJmmszgN5osCJAAakV0oWG3lDL3aiL5wdnWsmWVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RYWBDGkAROsQaLtqvn/t9+P8He0nZvay9i1D5PCMqoCFbwIBjhyVS0CAafk+oeYnz
	 P3T/QPBLh1KzfW0YI9QMbJAmkE9sgWqbP8w8NMVSQ3NxCNW2fT7MDd7k0nm6yECTfF
	 5hybcYBcamOYBhZSgY/pM9zu64DGVxTw60JnKDJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C348F8012A;
	Thu,  8 Jul 2021 10:42:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E219F80249; Thu,  8 Jul 2021 10:42:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,HK_RANDOM_ENVFROM,
 HK_RANDOM_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2756BF80143
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 10:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2756BF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d1gplhl6"
Received: by mail-ed1-x52d.google.com with SMTP id t10so1281021eds.2
 for <alsa-devel@alsa-project.org>; Thu, 08 Jul 2021 01:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=os/T813PZdDCU5XBX3OMjqspJfYpz1AMtwUEcpldmCU=;
 b=d1gplhl6eBDBBtCFbhQ87Fu5JJvAdcL0ZtOA/xnA/P44IGqhqYrHr1miuolseUIeKp
 +nXMZmw/jcyqylbOHuZYz69yGM73v98UgtBqFLdx9Z+vn1BuZcmPzygE0Y6oSKT3aYhC
 d8H9ODr61uI52Fq0RVqmLCyGbgj++7SYf3kUJmjySftyXAt5VyLvzrT/uNuHYXb/X4RR
 j+0NZCKmNnX6ANd9xMH4YkB8H0fvszFuqtT6CVCJsTbW2cHWqw9icRr1X8olGfaBtT7o
 aPZf3/Pd9CQfrP+T01RN5PPHoFhlJkWTKE8LCPTz8/wQc14J1Ygx7YzehJsREx9HFjBn
 GYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=os/T813PZdDCU5XBX3OMjqspJfYpz1AMtwUEcpldmCU=;
 b=WUOPktSXqzBEaLur1OSxugcL9iLkM4nsIqLgbpD/LplnBwWd4u/Ru4/aYM+MGmp9Zm
 eDvEpttpr1GovplhTC/pCcgi07uQ2L9KtVYJAanE9Z41x3TzOG3CB16Ymbqj2mfhEkpL
 0bbnk/aJh2rKcAKzrUnrx4+dsH6xbVFKv0goVlbOmvISJDcO4gjmBCysrUcB/jXQan2F
 BUDoFDHJVWMlulbNKfsnNLmWhUkUAmxYrxMBjj7kxaHviz5UI5MgsfvYoUZ+vv9k8i8N
 f3ukIH8wVmgTBLU1ZYexYNIVTZgU1mIcsBH+uAiw+d//VOcpclxW4c9kGhEqS9VUVUt3
 ARsA==
X-Gm-Message-State: AOAM532iH1Ly6c1jTgfEbvkrtdYuH4CbNJRc1ILIMY0r++lv1HXBK1BY
 jMXDAhY9rMcum/usaj8I26T9yu0Xeoh7R7oC6HE=
X-Google-Smtp-Source: ABdhPJx83Wr9R9gdGNSGocTRyRtkWBZAGSCWqjaompP2jLu6wFyiWdSCGUG3FLeBDgXgrd8lyLyM5pBRHsvsxEJrN3U=
X-Received: by 2002:a05:6402:100e:: with SMTP id
 c14mr35744812edu.51.1625733722153; 
 Thu, 08 Jul 2021 01:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <YJ4yBmIV6RJCo42U@google.com> <s5hk0o18tio.wl-tiwai@suse.de>
 <YJ5cHdv6MVmAKD3b@google.com> <YKDYQfDf7GiMfGCN@google.com>
 <YKDYbaprE3K2QpCe@google.com> <s5hbl9b6mah.wl-tiwai@suse.de>
 <CAMo8BfKKMQkcsbOQaeEjq_FsJhdK=fn598dvh7YOcZshUSOH=g@mail.gmail.com>
 <s5ho8be8v3z.wl-tiwai@suse.de>
 <CAMo8Bf+FF8Ofq=FwoZZXp9vKiMaUZNAm+W=OJmu2j2XN6kLb-Q@mail.gmail.com>
 <s5hk0m26lfu.wl-tiwai@suse.de>
 <CAMo8BfLj+VLUbfUmHUSHOfc3PwbWd2w_xnaTZa9HyrcmvJCAkQ@mail.gmail.com>
 <s5hfswp6zx8.wl-tiwai@suse.de>
In-Reply-To: <s5hfswp6zx8.wl-tiwai@suse.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 8 Jul 2021 01:41:50 -0700
Message-ID: <CAMo8Bf+bGujLN7H5yBqy-AkPCN7LgfmGSiWEGdjW6ZWeFoXs9A@mail.gmail.com>
Subject: Re: ALSA: intel8x0: div by zero in snd_intel8x0_update()
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
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

On Thu, Jul 8, 2021 at 12:13 AM Takashi Iwai <tiwai@suse.de> wrote:
> On Wed, 07 Jul 2021 22:33:22 +0200,
> Max Filippov wrote:
> >
> > On Wed, Jul 7, 2021 at 11:14 AM Takashi Iwai <tiwai@suse.de> wrote:
> > > On Wed, 07 Jul 2021 19:50:07 +0200, Max Filippov wrote:
> > > > It didn't change anything in my case. My further observation is that
> > > > the snd_intel8x0_update is called before the ichdev->prepared
> > > > is set to one and as a result IRQ is apparently never cleared.
> > >
> > > So it's broken in anyway no matter whether
> > > intel8x0_measure_ac97_clock() is called or not, right?
> >
> > The change that you suggested didn't eliminate the call to
> > intel8x0_measure_ac97_clock, it's still called and an interrupt
> > flood happens at the same place.
>
> Ah I see the point.  Then the fix would be a oneliner like below.
>
>
> Takashi
>
> --- a/sound/pci/intel8x0.c
> +++ b/sound/pci/intel8x0.c
> @@ -694,7 +694,7 @@ static inline void snd_intel8x0_update(struct intel8x0 *chip, struct ichdev *ich
>         int status, civ, i, step;
>         int ack = 0;
>
> -       if (!ichdev->prepared || ichdev->suspended)
> +       if (!(ichdev->prepared || ichdev->in_measurement) || ichdev->suspended)

There's no ichdev::in_measurement, but if replaced with
chip->in_measurement it indeed fixes my issue.
So with this change:
Tested-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
