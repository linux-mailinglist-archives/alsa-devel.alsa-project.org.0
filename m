Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8F66CAFA
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 10:37:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7572167A;
	Thu, 18 Jul 2019 10:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7572167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563439059;
	bh=JvopeBkO+adZD628kWU6/JlRQ9tWV7XqEun8rqZm4a8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DjYdYxl4hEgrF9QPgNEVOcCYQ6MdIEzTjQjV2QZr/H67f25OUnRM4SnZeHkbTDe7p
	 FJVjACiipQ84ehun0LFpdrexbK5XwX8qoh9AAsAFFdjJJG+Xb3J41ZK0OtzU2VIZYp
	 JOUduZ06ear70ysbq787S2oxTOUx/uuRQtYHjrQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0502EF802BC;
	Thu, 18 Jul 2019 10:35:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D902EF80362; Thu, 18 Jul 2019 10:35:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 092E4F800C0
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 10:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 092E4F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Yk/uovki"
Received: by mail-wr1-x444.google.com with SMTP id x1so12690598wrr.9
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 01:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4tRTGAuUbKnYzNxYuq2Du5ronNWl7Xcaht571D6i0hY=;
 b=Yk/uovkiiuYpyAmB8oiSBV0jELpmLH1kyvLGRLfsLFJYdj2OAMzCfh7fR72bLMdQW+
 bnmbj5C3UF9cn2T7qfWp1JyVcqnFTCX+6Jjlk4u8AvTzz+zTCUm89CpT20pOwUMw4gmY
 pMgg8QTnEyk5C2b/K2nqGo0iQ5BA+e+wcEqv8Enn1/q1m2uqRT0R16OaPA48oCmfcRXm
 9FAZlJt0RjikAVQA9Q6UySv+NqOKDAYYfyt9H05Lt/nENr1HVybsJ6WCCY2jVKhuhfd8
 BuA0Px6kL2wReSaUd+KPBZJftMSfMXxdtHATucDLnApob6RKMNIRIgypRSK5bt9GpaLe
 /D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4tRTGAuUbKnYzNxYuq2Du5ronNWl7Xcaht571D6i0hY=;
 b=gaptoQij1aLMpNAQIEhzkBPHz5S9HsiIIOjo/FJnH3VAqR2NBXjJztPzpl44tHsZv0
 fvw6TzJoO5jxAkKjgrVwopo0VbSYMjTpWuPWP+tI/CSBkNtjB1HKtZJk+2TBwxyygY6h
 Zp4dDJv/7zfmYNagsYV+Vrpa/0kMpgCjHDRsezmiti3hjLbZBh2c79vqfQSnDC+bz39q
 YmxvyYW3bEhWjmK0wZrWdF4hSC+g/AiMX8urT2ysxPitzbNg2w2QR1oJoMGnK4+FGA2j
 rruYK60R6a4BJKWwH88lEQ2M2tHZbE6MJTJNDODIMHNOl+N6VE5ih0eZ+gtkK/UL8Wo3
 SDaA==
X-Gm-Message-State: APjAAAXHf4lxzkIhbuficjYYO62eGKUwJJ6M4Isdl1gpDP5PM2H35/mD
 UxKPEtajyici0uw/17f1p1J8UZzr3UxVJ5k1TLQ=
X-Google-Smtp-Source: APXvYqwDJjblBBNKQj+hICJRJ5h3XJLHEHd0DsyFF2wwV9l4FIdzeZpPi0M6j2s/x4LexEB7M6tBBH9BurvS7jepV3w=
X-Received: by 2002:adf:db46:: with SMTP id f6mr48298430wrj.212.1563438948940; 
 Thu, 18 Jul 2019 01:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190717105635.18514-1-l.stach@pengutronix.de>
 <20190717105635.18514-4-l.stach@pengutronix.de>
 <CAEnQRZCCTwMJKQnvP2mSQPcKNwtoAaMdXmQt_H+CGro=zVLsNA@mail.gmail.com>
 <1563374027.2676.18.camel@pengutronix.de>
 <CAEnQRZB96Q4stM4JsJskMhdH-7ktbc-QxPeibNOLHEXghtS-1w@mail.gmail.com>
 <ee809845f1a5fd5af3f73b35eaa79314@akkea.ca>
In-Reply-To: <ee809845f1a5fd5af3f73b35eaa79314@akkea.ca>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Jul 2019 11:35:37 +0300
Message-ID: <CAEnQRZDZ11LSK62qCYq9VuDRBtWrbgbooDFa6A7DV=Z2ftTq-g@mail.gmail.com>
To: Angus Ainslie <angus@akkea.ca>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 patchwork-lst@pengutronix.de, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: fsl_sai: add i.MX8M support
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

On Wed, Jul 17, 2019 at 6:15 PM Angus Ainslie <angus@akkea.ca> wrote:
>
> On 2019-07-17 09:06, Daniel Baluta wrote:
> > On Wed, Jul 17, 2019 at 5:33 PM Lucas Stach <l.stach@pengutronix.de>
> > wrote:
> >>
> >> Hi Daniel,
> >>
> >> Am Mittwoch, den 17.07.2019, 17:16 +0300 schrieb Daniel Baluta:
> >> > > On Wed, Jul 17, 2019 at 1:59 PM Lucas Stach <l.stach@pengutronix.de> wrote:
> >> > >
> >> > > The SAI block on the i.MX8M moved the register layout, as 2 version
> >> > > registers were added at the start of the register map. We deal with
> >> > > this by moving the start of the regmap, so both register layouts
> >> > > look the same to accesses going through the regmap.
> >> > >
> >> > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> >> >
> >> > This is a little bit tricky. We need the verid register in order
> >> > to differentiate IPs which can support 1:1 ratio for bclk:mclk
> >>
> >> And this patch doesn't prevent this usage. If needed we can just read
> >> the verid via a plain readl on the base mapping in the probe function
> >> and cache it in struct fsl_sai. This seems way less intrusive than
> >> carrying a register offset through all of the regmap accessors and
> >> validation functions. I simply haven't implemented it in this patch,
> >> as
> >> I had no need for it right now.
> >
> > I must admit this is a very clever idea! Anyhow, I'm having some
> > concerns
> > because unfortunately not all registers were shifted by 8 bytes.
> >
> > See: imx6sx [1] (page 3575)  and imx8X [2] (page 5512) RMs.
> >
> > We have something like this:
> >
> > i.mx6 SX:
> >
> > 00: TCSR
> > 04: TCR1
> > 08: TCR2
> > 0C: TCR3
> > ....
> > 60: TMR
> > 80: RCSR
> >
> > i.mx 8X
> >
> > 00: VERID
> > 04: PARAM
> > 08: TCSR
> > 0C: TCR1
> > ...
> > 60: TMR
> > 88: RCSR
> >
>
> We could split it into an upper and a lower regmap. Only the lower would
> need the version register offset.

That would work but will be unnecessary complicated. Let me send the
imx8M support
as we implemented in our tree by Friday.

It has the disadvantage that we've wrapped all shifted register with a
macro but I don't
see other solution.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
