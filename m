Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8067975D
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 22:00:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9B9317AB;
	Mon, 29 Jul 2019 21:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9B9317AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564430434;
	bh=fOw6MVh1vyLOOKSkR+LkMiGN6y2mbel7retXx6lzTxA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bQ1zXNKReXsRNHDY7H3STKxgbqyOU5g6/lA5ROtoxgShX76vl1A9GszxyhIddPnhJ
	 3giflaOLPs291dFZD05yWZhq0JAxeKOoSlglWCBb6tsOiNZu5OcnnyE+zRMeeE8S6Q
	 xrtodEhnyZals3ugFaXJeTicMsNfTnhH+K0VaIV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B681F8048E;
	Mon, 29 Jul 2019 21:58:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DE4BF8048E; Mon, 29 Jul 2019 21:57:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10705F803D5
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 21:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10705F803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TD+gjh4H"
Received: by mail-wm1-x341.google.com with SMTP id p74so54922914wme.4
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 12:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EfwOpTwqZt49gcWcX/gOxX/yJSmjfwNU2FDs49FnjdU=;
 b=TD+gjh4HFlm0ryoYWHp2SaDQah1BRcGLs588Xg5onWMF/bFCKo3gCcdRjrR7eJMGGm
 VmcPlqWbkKDwrNUh8zlIIYwZuaqfpnpqWXjC8N6f75TNoXUh/j8p0eVt74oBk9ZkZzex
 V1n1HFIE5C4nzA0H7fSPUkflCg8AXut9D8Lsz7PQtKKWqAGP/SYjsEEYFVKlB4P3b48l
 JzQBi3aOTso7ySB63JP0g6QRApO4sA8wRcRzVJ+dusjlz0zUXgelfZtRDojl6kV4tQq5
 RW4HpdbdEqTyFkh6/NLcZF5YWo+AKMq41dRNm/3LgVvXde/R9xBeyIFdwVd7yeAVr1kn
 cTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EfwOpTwqZt49gcWcX/gOxX/yJSmjfwNU2FDs49FnjdU=;
 b=j22Z/ubvwtIYgs5LLME1H3/7dS+9wQq68ibbAb4izVDK92tapCan2/+xSZe5v8wVLL
 pfC488AysRTMsq0UZdEHj3Zm2UbKBzD68R3Knb+lkvAvc+2GnnI54L6sIpKV3VO8s9Ux
 SaWyUeBMaF80MdvAsf49BM7uou+SMBI7Au/7BT1M6xS6OwcJE52Sz9xa+e7s6cGjAbi4
 BgskoRhhrIKUgYXrL+dseytt4p0PPAvTkUKa6szYWgQS7XOAN50+45iA8V4ZkB+JWnPS
 Tf8dbycJWrlAjrfim5MvPeg1ptq3IXlLjbeFv0AzwRR+SeXBRnadeYpwWn2txsLsPZUn
 Bh0Q==
X-Gm-Message-State: APjAAAUnA0eVzHMw6xCCNc2H787iH7bvLFoX4NVEm8ZvS4+Am216P4x9
 dnKPZ5F2eIHSTJdMZBegQjS9/hxcnRU66TUCNsI=
X-Google-Smtp-Source: APXvYqyUnyRnpAsu1OzTd7PhLaMC/PpuGRUfvRCL/EifxjOUfhsRaKfdERpgUk7nBbCW+1wTl53GQRoL34cSuARJCfQ=
X-Received: by 2002:a1c:96c7:: with SMTP id y190mr93249558wmd.87.1564430274987; 
 Mon, 29 Jul 2019 12:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-2-daniel.baluta@nxp.com>
 <20190729194214.GA20594@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190729194214.GA20594@Asurada-Nvidia.nvidia.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 29 Jul 2019 22:57:43 +0300
Message-ID: <CAEnQRZDmnAmgUkRGv3V5S7b5EnYTd2BO5NFuME2CfGb1=nAHzQ@mail.gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Viorel Suman <viorel.suman@nxp.com>,
 Timur Tabi <timur@kernel.org>, Rob Herring <robh@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mihai Serban <mihai.serban@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH v2 1/7] ASoC: fsl_sai: Add registers
 definition for multiple datalines
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

On Mon, Jul 29, 2019 at 10:42 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Sun, Jul 28, 2019 at 10:24:23PM +0300, Daniel Baluta wrote:
> > SAI IP supports up to 8 data lines. The configuration of
> > supported number of data lines is decided at SoC integration
> > time.
> >
> > This patch adds definitions for all related data TX/RX registers:
> >       * TDR0..7, Transmit data register
> >       * TFR0..7, Transmit FIFO register
> >       * RDR0..7, Receive data register
> >       * RFR0..7, Receive FIFO register
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_sai.c | 76 +++++++++++++++++++++++++++++++++++------
> >  sound/soc/fsl/fsl_sai.h | 36 ++++++++++++++++---
> >  2 files changed, 98 insertions(+), 14 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> > index 6d3c6c8d50ce..17b0aff4ee8b 100644
> > --- a/sound/soc/fsl/fsl_sai.c
> > +++ b/sound/soc/fsl/fsl_sai.c
>
> > @@ -704,7 +711,14 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
> >       case FSL_SAI_TCR3:
> >       case FSL_SAI_TCR4:
> >       case FSL_SAI_TCR5:
> > -     case FSL_SAI_TFR:
> > +     case FSL_SAI_TFR0:
> > +     case FSL_SAI_TFR1:
> > +     case FSL_SAI_TFR2:
> > +     case FSL_SAI_TFR3:
> > +     case FSL_SAI_TFR4:
> > +     case FSL_SAI_TFR5:
> > +     case FSL_SAI_TFR6:
> > +     case FSL_SAI_TFR7:
> >       case FSL_SAI_TMR:
> >       case FSL_SAI_RCSR:
> >       case FSL_SAI_RCR1:
>
> A tricky thing here is that those SAI instances on older SoC don't
> support multi data lines physically, while seemly having registers
> pre-defined. So your change doesn't sound doing anything wrong to
> them at all, I am still wondering if it is necessary to apply them
> to newer compatible only though, as for older compatibles of SAI,
> these registers would be useless and confusing if being exposed.
>
> What do you think?

Yes, I thought about this too. But, I tried to keep the code as short
as possible and technically it is not wrong. When 1 data line is supported
for example application will only care about TDR0, TFR0, etc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
