Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B9A16BB7B
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Feb 2020 09:05:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84C0F1692;
	Tue, 25 Feb 2020 09:04:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84C0F1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582617948;
	bh=Z8zheNF/lBKScsp2lU2FeVnKoBKct1UF0SkPmY+Jll8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GfcXlluyhTFa3uR3VS2B/qEuCogG3bQI7re2e+lA8jbd3VjrwVAKfah7az7Gl1mS2
	 TMh5cE3M5wqqy/hZjbAVMMJSFtLTgJZkgN1znNaDYecDwWYuCiLuPqIYoX/qBU275g
	 Bq5H7inOCkTE9L5AHtrelG47QMygBzKaAyVEIT74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F221F80090;
	Tue, 25 Feb 2020 09:04:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7B2EF80142; Tue, 25 Feb 2020 09:04:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66898F800AD
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 09:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66898F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kDWNGF9v"
Received: by mail-pf1-x443.google.com with SMTP id i19so6768391pfa.2
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 00:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3UwgyNGegYf+ShQWoRWvT/NL7ARqm4MqRGArNYI3who=;
 b=kDWNGF9vw5evEFnyTn5rudlI/14OO67KtZuSmNARz8zTE4vVP7Hhc6JwfRZjCo85Z2
 tvgyuCBpwge1k7uxAL3cVdZdd0QGzOONoXlY+5TvHTzrZZoIbbnkxtUVyXYv0RR+Vity
 fOXvHDB3esTtnVmpSpmzuRqas5eMJ9vZFO4fAMfsF60iMsVd/vW2Bzs8+2d+xXASD2zh
 SUjAI5xrrtkyJAoK+q4wao8cymtP54e+xRZfxO+DeDmxIwT0qBTqrTWjbSlS9EpolcvA
 HhiiBRfm4FTS4F09uPw+SswFfyUOtYA5VfsHVt5vnwZO3TjYll5qx31WeHyUw/SVquMa
 Xd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3UwgyNGegYf+ShQWoRWvT/NL7ARqm4MqRGArNYI3who=;
 b=qkTOrVZ8TTywFm0kZ3lwvJmujBWSqk1zjyH59R6i0P4Y6vZFiU4bBuFExkltCxjAcn
 yqVu1XUUCB7+l0qi6PHyNtjLxwrhr0Hq5YR7YKtlmklTAQCoLS+Sfh+8GBtsF4A+OFr9
 ESkB9WlzxdwB8lo1r4NWSA7Hsz5DKRx7UR3Dtxd2ePuyhRn5A47kXTj7qNY7zI+jZlzv
 aNPvI4uVeV7wbheKXpNR2jMt2V0UnSNdZef1WGfQAoM7BQSJ6bT844B9sKnR1vnw0aez
 vJZnEUBoRB0ExGDEJBrZ91hpmJAYo3ul9zQwXO2s8UzqE8bVDEs621v3vS5WiKTxLjeT
 K2Xg==
X-Gm-Message-State: APjAAAWAvcuU8SqzKZFB2HY+r++sjVY8wnOH1P91bO/mLZqld/cYRmxL
 DurBtFL0AYupa//0CKv99eE=
X-Google-Smtp-Source: APXvYqwMRtQpYwUBTrb0+cvHPd0eiLB/R3rhnLG6W+uGQXS+JAd8tDieKTnw2v05Noa4gwMj4BMhpg==
X-Received: by 2002:a63:d344:: with SMTP id u4mr35777777pgi.153.1582617838655; 
 Tue, 25 Feb 2020 00:03:58 -0800 (PST)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 b18sm15964609pfd.63.2020.02.25.00.03.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 00:03:58 -0800 (PST)
Date: Tue, 25 Feb 2020 00:03:50 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 3/3] ASoC: fsl_easrc: Add EASRC ASoC CPU DAI and
 platform drivers
Message-ID: <20200225080350.GA11332@Asurada>
References: <VE1PR04MB6479BCA376502F6F1251602BE3EC0@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6479BCA376502F6F1251602BE3EC0@VE1PR04MB6479.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Mon, Feb 24, 2020 at 08:53:25AM +0000, S.j. Wang wrote:
> Hi
> 
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  sound/soc/fsl/Kconfig           |   10 +
> > >  sound/soc/fsl/Makefile          |    2 +
> > >  sound/soc/fsl/fsl_asrc_common.h |    1 +
> > >  sound/soc/fsl/fsl_easrc.c       | 2265 +++++++++++++++++++++++++++++++
> > >  sound/soc/fsl/fsl_easrc.h       |  668 +++++++++
> > >  sound/soc/fsl/fsl_easrc_dma.c   |  440 ++++++
> > 
> > I see a 90% similarity between fsl_asrc_dma and fsl_easrc_dma files.
> > Would it be possible reuse the existing code? Could share structures from
> > my point of view, just like it reuses "enum asrc_pair_index", I know
> > differentiating "pair" and "context" is a big point here though.
> > 
> > A possible quick solution for that, off the top of my head, could be:
> > 
> > 1) in fsl_asrc_common.h
> > 
> >         struct fsl_asrc {
> >                 ....
> >         };
> > 
> >         struct fsl_asrc_pair {
> >                 ....
> >         };
> > 
> > 2) in fsl_easrc.h
> > 
> >         /* Renaming shared structures */
> >         #define fsl_easrc fsl_asrc
> >         #define fsl_easrc_context fsl_asrc_pair
> > 
> > May be a good idea to see if others have some opinion too.
> > 
> 
> We need to modify the fsl_asrc and fsl_asrc_pair, let them
> To be used by both driver,  also we need to put the specific
> Definition for each module to same struct, right?

Yea. A merged structure if that doesn't look that bad. I see most
of the fields in struct fsl_asrc are being reused by in fsl_easrc.

> > 
> > > +static const struct regmap_config fsl_easrc_regmap_config = {
> > > +     .readable_reg = fsl_easrc_readable_reg,
> > > +     .volatile_reg = fsl_easrc_volatile_reg,
> > > +     .writeable_reg = fsl_easrc_writeable_reg,
> > 
> > Can we use regmap_range and regmap_access_table?
> > 
> 
> Can the regmap_range support discontinuous registers?  The
> reg_stride = 4.

I think it does. Giving an example here:
https://github.com/torvalds/linux/blob/master/drivers/mfd/da9063-i2c.c
