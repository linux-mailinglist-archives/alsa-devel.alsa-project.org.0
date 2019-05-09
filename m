Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A428194B8
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:37:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB2F01AF1;
	Thu,  9 May 2019 23:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB2F01AF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557437839;
	bh=1Hm1CWhq4kxGLiE/49NHpar1zl9HOj4HQwl5l3Fepw4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qgw6IfQ/+JU15a1qdvMJjP19shyEz52L1Ubrtec9r475PLc182fJMwfpbjTeztlHE
	 i8zEO02yNEuJCkf7lfIo9L4aHc+eZX1mHU2cEz2HulUhgnn//VqOxNIwi7/NRwVKzs
	 tXUr6SZ9424gLz0+g0PU0N4UMtOViR+iAQpx8bTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02CDAF89701;
	Thu,  9 May 2019 23:25:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD38FF896F9; Thu,  9 May 2019 23:25:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_PASS,T_DKIMWL_WL_MED,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 489A1F896DA
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 489A1F896DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="vmSxVeMD"
Received: by mail-lf1-x144.google.com with SMTP id w23so2599375lfc.9
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JDkpNkYEKJnQvxxR/KDE9gY/J6U8QTbtyo6Tf3JQ1/A=;
 b=vmSxVeMDxhbFsFE0g9BwLw7dF0n9aV5z5cnkpQaamY4U6WbE2vZhv4nl7Ke3QL7XQp
 pw6tar6yAdCbVkfT+jABkc20bSx8Jly0hOeXool+2dXQ7C04yUq9A78dnD1LdBC7lEeh
 WgfS4S51kLPTH6wnEGmM8wZqEI28GhCr53xEZe6s5tsoPwfWkvwjNlaYKwoav0oB/hdE
 gb4XQrIVJ8C2BVJDTEfkHrOkqmlYmxkKKOAnM2u8JtSuuP5IfukTPBVdYfg1vskrd5+z
 2Kaz5GbRLDaj6iNqmLQsxkxeqI5N4Br2avKAKZGHGkonsFWN5l8y3n+/80jA4gv4bR2L
 lLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JDkpNkYEKJnQvxxR/KDE9gY/J6U8QTbtyo6Tf3JQ1/A=;
 b=BB1BskLOlWt4ryR0fNOxU6Wm1UcyqGiqgroqlcv7Qqlyfi6w+pPu3njhRAymsx0EXP
 jkyGkPjp/x/oL5SuenSDMUsLOFPsprUiGau4VtR7KRyAusj5d5+/+H3u+2/CkY3El4YX
 pa2sU+J/vN+LcxZEe+foJOGYzBxqYkP+6aOI6NWcgC5ytehyLL+pysMwnGymh8lCRvga
 a+xZRFT16lM0ygQAjoaus3VkcgEW5s1gG+sds8MXRGtmug9DfZpEnAR56tYk5ESqkZQI
 BFhSQRdehTzqTbuO8VfBnZU6JsN+8JusDGjeKhiuKRDG8bQcInpLmAE4P9Mu+UTCNw9X
 PxJw==
X-Gm-Message-State: APjAAAUJbpZPFihbJrf29Td1pJNTTzXD65JSjftR8QFKWFG+/xkiZZkq
 pK+oH6uIAy2PwocxgmrripHa18EXir8LzZwyinxOqg==
X-Google-Smtp-Source: APXvYqyPbGD+CvhlvWPicwOkkw+gfZYoweonGaoYEwFeD5dHSCaIBotvS5UxBf0l7aLPtf/Iv2skLSJyFrV9eP/2kAU=
X-Received: by 2002:a19:550d:: with SMTP id n13mr3708154lfe.127.1557437121545; 
 Thu, 09 May 2019 14:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190507220115.90395-1-fletcherw@chromium.org>
 <20190507220115.90395-2-fletcherw@chromium.org>
 <20190508073623.GT14916@sirena.org.uk>
 <CAOReqxgYV3SdXot84Xa4X7=MCZdzWmb2N+jaWzjxgmdoMRx5Mw@mail.gmail.com>
 <20190509023247.GT14916@sirena.org.uk>
In-Reply-To: <20190509023247.GT14916@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 9 May 2019 14:25:10 -0700
Message-ID: <CAOReqxjg=w_ZSzUoryQYE9Poz8vF3=j6-_gNu-SMpH1oEsn2bw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ben Zhang <benzh@chromium.org>, Fletcher Woodruff <fletcherw@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [PATCH v5 1/3] ASoC: rt5677: allow multiple
	interrupt sources
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

From: Mark Brown <broonie@kernel.org>
Date: Wed, May 8, 2019 at 7:33 PM
To: Curtis Malainey
Cc: Fletcher Woodruff, Linux Kernel Mailing List, Ben Zhang, Jaroslav
Kysela, Liam Girdwood, Oder Chiou, Takashi Iwai, Curtis Malainey,
<alsa-devel@alsa-project.org>

> On Wed, May 08, 2019 at 02:39:32PM -0700, Curtis Malainey wrote:
>
> > Pixelbooks (Samus Chromebook) are the only devices that use this part.
> > Realtek has confirmed this. Therefore we only have to worry about
> > breaking ourselves. That being said I agree there is likely a better
>
> And there are no other parts that are software compatible enough to
> share the same driver?
>
the rt5676 can use this driver, but from my discussions with Realtek,
Samus is the only active consumer of this driver.

> > way to handle general abstraction here. We will need the explicit irq
> > handling since I will be following these patches up with patches that
> > enable hotwording on the codec (we will be sending the firmware to
> > linux-firmware as well that is needed for the process.)
>
> OK.  Like I said it might also be clearer split into multiple patches,
> it was just really difficult to tell what was going on with the diff
> there.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
