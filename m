Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E4A381D6B
	for <lists+alsa-devel@lfdr.de>; Sun, 16 May 2021 10:32:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0470916AC;
	Sun, 16 May 2021 10:32:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0470916AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621153974;
	bh=0T3Or1eX4zP1vsuQZsXnHre4xuJ4rFQuxxjHGCiuWwQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AEEGo4hpdvCzRucJe6+lMOetHhfpi/pDhu/cISxRHzRLbeXqwo3+NdkQYdU5iAwNC
	 uyt/bP9kxpAGlUfpvmiB8KZ4NIg1IvCo6TIqKuY+1R4mog6f193v7WXHKdGH78HW/f
	 +XY27/Oj884Q5YMFINB6ODuNol+w09l5j8IjBAHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FD89F8027D;
	Sun, 16 May 2021 10:31:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE8E4F80272; Sun, 16 May 2021 10:31:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DACBF8012C
 for <alsa-devel@alsa-project.org>; Sun, 16 May 2021 10:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DACBF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="mi1Ckwra"
Received: by mail-pj1-x1035.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so2115693pjv.1
 for <alsa-devel@alsa-project.org>; Sun, 16 May 2021 01:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JvPi/up8/Q2jB6nmPheLInSV8cVD1xDyiACL39QHuIM=;
 b=mi1CkwraEzqq7EM0mHtQ8oepYHvCEEXP8ciKdlDvLqraGMF4pWHpbIIs3J3iS2jTQY
 lvaXlVy7Dtd13AVtl9UjTXZfdLGzcX1xj4U6U7yl0U/9DWOwau3qNICtxn/xhXAhK5fT
 2CGr44oH7N9qjbcQmLI/tSHzFPaW975IJ553s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JvPi/up8/Q2jB6nmPheLInSV8cVD1xDyiACL39QHuIM=;
 b=Q4Eid4o8EF9cOPn3gsKYrohb4lemIwr6tWg4ElbeE72T2tJVkRqSpAnQ0sFo/b75OE
 GW0QAbAZ+0iHNQU7UvOPb4R6gF+oMqDZYl2LEku73Z19MFoAJfg1Nmz3phcX/FVdqasR
 /Gdek3qZ4jFhpVyTZlK/5V4OeWCfvll4ApGYOXOGWXGUhxjYjAP8pPbmVW9RPAi9vv0R
 aXQ91Gs9m1gauDW/o6Rhy5+vNLcn0g8dznSkJQ7SwIRrtIvz3FbXSdi21w1FLY8LpY56
 NPhhgEVIobV8NgVhF30le/KbrtNL93/ej1ZyHd34WHwOfi/NWVcgeNXfhlc52WJAkDrR
 RRSQ==
X-Gm-Message-State: AOAM530tRwggzkCoYkvRnGsWQy3pT6JdYG5+ZbhtAqsIe1D9Dix3LyhE
 uI9WMWN8hQ4and0urEIE3+OGZw==
X-Google-Smtp-Source: ABdhPJw/afxurF3CFS9XitDbZWTdJj6qhpYvwmCjSbZfQdzJa9IROBfg2+2roWy11BdpOHVzJ6KBRA==
X-Received: by 2002:a17:90a:690d:: with SMTP id
 r13mr20761076pjj.19.1621153906716; 
 Sun, 16 May 2021 01:31:46 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:4596:acad:c782:2f52])
 by smtp.gmail.com with ESMTPSA id a16sm7328843pfc.37.2021.05.16.01.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 01:31:46 -0700 (PDT)
Date: Sun, 16 May 2021 17:31:41 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: ALSA: intel8x0: div by zero in snd_intel8x0_update()
Message-ID: <YKDYbaprE3K2QpCe@google.com>
References: <YJ4yBmIV6RJCo42U@google.com> <s5hk0o18tio.wl-tiwai@suse.de>
 <YJ5cHdv6MVmAKD3b@google.com> <YKDYQfDf7GiMfGCN@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKDYQfDf7GiMfGCN@google.com>
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Takashi Iwai <tiwai@suse.com>
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

On (21/05/16 17:30), Sergey Senozhatsky wrote:
> On (21/05/14 20:16), Sergey Senozhatsky wrote:
> > > --- a/sound/pci/intel8x0.c
> > > +++ b/sound/pci/intel8x0.c
> > > @@ -691,6 +691,9 @@ static inline void snd_intel8x0_update(struct intel8x0 *chip, struct ichdev *ich
> > >  	int status, civ, i, step;
> > >  	int ack = 0;
> > >  
> > > +	if (!ichdev->substream || ichdev->suspended)
> > > +		return;
> > > +
> > >  	spin_lock_irqsave(&chip->reg_lock, flags);
> > >  	status = igetbyte(chip, port + ichdev->roff_sr);
> > >  	civ = igetbyte(chip, port + ICH_REG_OFF_CIV);
> 
> This does the problem for me.

       ^^^ does fix
