Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B74527F3A
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:07:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDFD516B3;
	Mon, 16 May 2022 10:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDFD516B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652688450;
	bh=LssdCE7LJSFADOUGbjQe78eFcgE2V4SoDb9KcZwR3nQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W4Kq9H9Gs5cwiEOd9JfkqxEmNs5kezysyw8vO2LJ69FDej6ca/b3+EPjR7LhMmFB/
	 FzqJjNc7LN+alwrruAx9RPs34RdHu/KRQv5uBo15m+ISXki3FDty/etxsY1JDZnI88
	 gWY0X2yOK/48dce47NrQY4MLX9Tbfne8GXbSdgjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B19EDF80544;
	Mon, 16 May 2022 10:03:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB61EF80245; Thu, 12 May 2022 13:27:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1874EF8010B
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 13:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1874EF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.b="HMG6PGAp"
Received: by mail-ed1-x52c.google.com with SMTP id d6so5848448ede.8
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 04:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PVKTAkZWOtF0qyn8I/Rv8b8BKYr5D3k07Vp2fZXHBUc=;
 b=HMG6PGAp0NzUlJPHCXVXfIEnrpOttXDH9X4ElC+zoiZ+0nP9EmFwWsTpqbhRqPUxYZ
 KXX8uoqzjq2h4OWz0CfDGmIm/nbmlkIYRJh9bZmspHOmzjVrAyopQUf/WPJx9jtub6Us
 rdFJn3ON5iPU6Pu+2fdB49Us+LbFaFvLjE+Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PVKTAkZWOtF0qyn8I/Rv8b8BKYr5D3k07Vp2fZXHBUc=;
 b=jdu9by/dJW+0G3HAwVR2UqIgFxnZFEhD2HQ2y5WJmluqsEcUI7t7ITCo1S2lFVRyBm
 yLn4yWl1EdYRLBcyMWQcokhscsef+LcUU9lWK25bqyeSo91+1XisvHT245hE5mT+5wTm
 a5cxwq9sXdHKaaoZAvaqqeT3iRKe+prwh50ufgfxaLvdkHzlb1r6FvWEC16m3IlJqX3i
 BGebBT1HX/aBlfkasK01JLEtRot149xER7J9IeiQcVlVV7ys1Wb2lR5ZroCyhys25Mmx
 G45AxyxGy7TLeRbCDQ5iB1q/5IR0iPmIEF2txNkiMU8OkPjPx3/YcFEazZvMVxGKjr9J
 XMHQ==
X-Gm-Message-State: AOAM530I31SWqZ5FdcrUwgwJucxyoxeIvGyFe7hZsle8KLnYFG5i7G3y
 oUL349x8EDR587uvARqt5tHI8Q==
X-Google-Smtp-Source: ABdhPJyQwH8SIP40Z+z+9H2+IPjpKXwvRygEJl+xzFDJ3pxWTcbvUzocP29MaOKd97cMpgZ417k0yg==
X-Received: by 2002:a05:6402:354f:b0:418:849a:c66a with SMTP id
 f15-20020a056402354f00b00418849ac66amr35108033edd.234.1652354854313; 
 Thu, 12 May 2022 04:27:34 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i
 (net-188-217-59-245.cust.vodafonedsl.it. [188.217.59.245])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a1709067e4a00b006f3ef214dfdsm2046661ejr.99.2022.05.12.04.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 04:27:34 -0700 (PDT)
Date: Thu, 12 May 2022 13:27:31 +0200
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: max98088: add support for reg_4a_cfg_bypass reg
Message-ID: <20220512112731.GH649073@tom-ThinkPad-T14s-Gen-2i>
References: <20220512074359.446999-1-tommaso.merciai@amarulasolutions.com>
 <YnzdcubW7m+CwnvN@sirena.org.uk>
 <20220512104642.GD649073@tom-ThinkPad-T14s-Gen-2i>
 <YnznExLDOvRpXNVh@sirena.org.uk>
 <20220512110959.GF649073@tom-ThinkPad-T14s-Gen-2i>
 <YnztJxdSFau6SYC5@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnztJxdSFau6SYC5@sirena.org.uk>
X-Mailman-Approved-At: Mon, 16 May 2022 10:03:51 +0200
Cc: alsa-devel@alsa-project.org, linux-amarula@amarulasolutions.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linuxfancy@googlegroups.com, linux-kernel@vger.kernel.org
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

On Thu, May 12, 2022 at 12:19:03PM +0100, Mark Brown wrote:
> On Thu, May 12, 2022 at 01:09:59PM +0200, Tommaso Merciai wrote:
> > On Thu, May 12, 2022 at 11:53:07AM +0100, Mark Brown wrote:
> > > On Thu, May 12, 2022 at 12:46:42PM +0200, Tommaso Merciai wrote:
> > > > On Thu, May 12, 2022 at 11:12:02AM +0100, Mark Brown wrote:
> 
> > > > > These look like they should be DAPM controls since they're controlling
> > > > > audio routing but they're being added as regular controls.
> 
> > > > Sorry again. You suggest to create a new structure for these entries,
> > > > for example:
> 
> > > If that's how they fit into the routing for the device, yes - you'd need
> > > to define the bypass mixer as well and set up appropraite routes.
> 
> > I added this reg as regular controls because this reg is pretty generic
> > as you can see this controll bypass of some output, not all. 
> > What do you think about?
> 
> That sounds exactly like a DAPM control, please make them DAPM controls.

Hi Mark,
Perfect, thanks for your suggestion.
I'll do it in V2.

Tommaso

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
