Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F69337585
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 15:24:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B77F81852;
	Thu, 11 Mar 2021 15:23:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B77F81852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615472667;
	bh=aOjbUeSeL/OlGwpVikHgYIvGjmXhesnSnJ+649xcFFc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=miciQD2fJkr/e2kp+8wTvkmykIT1HpWFmhty6ufQ8V7sA9nlhdjpTvkXTob01Qmlv
	 Yn9kobocKImDVJZQ3WHK2gq7myR2E5TU45++VkrF1UvhuIvKcvy2U1WRwPmB5y9gsH
	 mMDxzQhHcQXRJ7E9/hdF6AHp8wFtxii9OEdE+O/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE115F800BF;
	Thu, 11 Mar 2021 15:22:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BD17F80227; Thu, 11 Mar 2021 15:22:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 817D6F800BF
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 15:22:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 817D6F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mxhVOKT2"
Received: by mail-pg1-x535.google.com with SMTP id x29so13766853pgk.6
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NLqQcnDH1akf38GK334hmF8byJw++p7ERD3Z2/VDPnQ=;
 b=mxhVOKT2VWzkxmCpBe2dT8rUTOb88Ej7btjUrt5PmPVqlqtYbqOvLjaspRQrNOa/ck
 4SxjrGrh9eAJH24KIUDF/72R1gcHMpTWuiSUbvswBWLjhWfSsGlmMqU9eICuy8JUXeSo
 2XMsVvOSEGuAFpY6i62Mwwq/R43xdFBo+H1HDHFzT66HCUshtQXoVlz0X/3H52W0IM9V
 tZPBBeHiM/Oof9KU+ThIXzhajgNkFA/F15nI/jQfV7b8Q05B3Rk1Huzo3jSX1gk/KjMb
 x6xQgzSIiSmFxPB/CL7tLopItwIMsOQLT2GvCkuN8pC8CghVJ4s5bsGBZE6QauZhb+H8
 Ugmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NLqQcnDH1akf38GK334hmF8byJw++p7ERD3Z2/VDPnQ=;
 b=XnhiozaUbOs+B4NIuijLl+h65QsAZRf59HraMmdjUgegedTHmNStVjT5lh3LkwkhYx
 +X5+za4CvcCDLpKe5kyQKzfc3wYZe4IIXq7oKVEjc7GxkSrlPVxE/ZLJIVQMJl43u/yo
 plWdENa1KR3XTa9Snx+TLPaHJHWzwVkX+VqmcweHHJjvRTYBz9Bq5nngNQSkhFCs203c
 PLilpUjoD0o97XERrFozTNSnq3jNN0ujwQx6hd6gR3k81wki9umOaf81yoGVEUwTe/Ux
 +GzsaRRU7jHfyqvaLQL7o9YI//QdU+FTF13SMEnHGUxaS/Daqyd0GQttggDjfnwxpmHo
 lA3g==
X-Gm-Message-State: AOAM532QdmkC+4TgdogP6ZxYeWlmAHWek0QyRBfyeV9hGMecr581ILpf
 pXY4JD5wAL+lnLvm3ZMOaDFSehVea0WZR2CO/Sw=
X-Google-Smtp-Source: ABdhPJycnJHvxkB6UZq2S7x+dELiZlYITg3gO5H8Q2Lg3iKscF1jDafh5JFqalIX0bVHWFTFghBPHE37jvyYjqPTGww=
X-Received: by 2002:a62:528e:0:b029:1f5:c5ee:a487 with SMTP id
 g136-20020a62528e0000b02901f5c5eea487mr7804061pfb.7.1615472558336; Thu, 11
 Mar 2021 06:22:38 -0800 (PST)
MIME-Version: 1.0
References: <20210311132741.80989-1-andriy.shevchenko@linux.intel.com>
 <s5hpn05vmhm.wl-tiwai@suse.de>
In-Reply-To: <s5hpn05vmhm.wl-tiwai@suse.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 11 Mar 2021 16:22:22 +0200
Message-ID: <CAHp75VfdsOMpskK0xq7tAo1DJ21MPMxmFb1st--0vHJ6C+Nb6Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ALSA: hda/realtek: Sort alphanumerically the
 SND_PCI_QUIRK() entries.
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Thu, Mar 11, 2021 at 3:40 PM Takashi Iwai <tiwai@suse.de> wrote:
> On Thu, 11 Mar 2021 14:27:41 +0100,
> Andy Shevchenko wrote:
> >
> > Sort alphanumerically the SND_PCI_QUIRK() entries for better maintenance.
> > No functional change implied.
>
> I'd love to apply this kind of cleanups (and I do sometimes
> partially), but practically seen, this may make the stable backporting
> significantly harder because many quirk patches are backported to the
> very old LTS kernels.  So, unless any specific reason (e.g. some
> entries doubled or wrongly applied) is given, I'd avoid this full
> plastic surgery.

Btw, can we apply the hunks that are against the lines under #if 0?
At least it will reduce the chaos rate in the file w/o worrying that
people will add entries there to backport.

-- 
With Best Regards,
Andy Shevchenko
