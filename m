Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B8E83074
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 13:17:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2929C165E;
	Tue,  6 Aug 2019 13:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2929C165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565090224;
	bh=isifz8W+FMmh0dWomKcDhoyR4pN37oBrLA/gIPfz+NA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MWL4QZ0qr37SQ2Edm9WCyC+obTkkurnNXHO/t4HukaGdy2Bu1ISle2XHEjRgqSLQQ
	 jZVU41SbKXMkZnm/eVQ+o7+yGIwVp76Z/Tg2Ka5dGd37QRcsZJPTbnnmnFqyNdQ7n3
	 EKQqVcwCmgD55q/v4F6gK16egypEHldJ9Cngytlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79087F80483;
	Tue,  6 Aug 2019 13:15:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9844CF80483; Tue,  6 Aug 2019 13:15:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D26BF800F4
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 13:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D26BF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FQnUfgvd"
Received: by mail-wm1-x342.google.com with SMTP id f17so76029314wme.2
 for <alsa-devel@alsa-project.org>; Tue, 06 Aug 2019 04:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=amZcTjeg2x25Ly20jxoyFkWiF2cVUUckbhD3XaV8CIk=;
 b=FQnUfgvdPoIaacu03nWzCLZh7LUWsPG7bapZSLjOOzwKSYC6AdHtxqvXBOkPjMUZIj
 H7zyVRoz52ffJ1x+zVECR6Rm0EKZ8RYbezzws79i3hKpc0isQl+v373gQ40VYVxgk1P2
 m+MLWeapgBAsYTXHixu7lT+fVh9rMxG9fb+4oraUtrJqoJsjvSmnvL0OPEvZifmOi2bf
 JJF+Jj/WvDX2Hln4YZFG64XJN+ZVPrja+1ag266P5CVWEXXAiJnqQifJ3jit7fidrYPS
 K/miwVXjovaevzTpriHzeAeZ9FM9CRPciNwdtc61Y554FGEcRnJTJjrqmZWiEJfv4AA5
 CZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=amZcTjeg2x25Ly20jxoyFkWiF2cVUUckbhD3XaV8CIk=;
 b=fZeO5s89IAW/AKwYhu+me86AN7gTr9lZlPwVl71iDfkbto0AjDYXvSn8tYe/OaHDZa
 B7QBCGke44zy/9u1T5m9GIuUGuJYVpYFRdB2rmyRuRnTTlb7vPvZYZiIbn15EIF1M5z+
 uzDj3ILvYUHG2h3OgJcCUaHJUXrGDQ20U7wViWWdmfBGRwJFOuwii+xazZlONqV2NDnD
 xkhwaVaLLpZ3Fo2eAN1TqHyt6+DUSTvEUgB4tcrEGFqLAG/HgAm5M19yKhB5faQGKrD2
 4XRD3fz1VgPKDE/KjrA4eIFwFU98sXylkeRv/oLBpAP0A+HWdbCYO+WFDn0BHBIlr9iA
 mVKg==
X-Gm-Message-State: APjAAAWf9Lbk7nWrJ+vXYzD7rxF4PS5oyN++EONXFfyN9y3avO66FG8X
 oiGBrSpzh7BEQ7LeIJASTA1zB9AgiQUYY4QbvNU=
X-Google-Smtp-Source: APXvYqxDUUjK9kCtDTeW4zcHyR9oQz/tY0Uj9nlsukUlv9LRJgi2lCZaSGGROaqAgAkZK2BHu73O8MUaJvhH449DU7o=
X-Received: by 2002:a1c:18d:: with SMTP id 135mr4246358wmb.171.1565090114880; 
 Tue, 06 Aug 2019 04:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-2-daniel.baluta@nxp.com>
 <20190729194214.GA20594@Asurada-Nvidia.nvidia.com>
 <CAEnQRZDmnAmgUkRGv3V5S7b5EnYTd2BO5NFuME2CfGb1=nAHzQ@mail.gmail.com>
 <20190729202001.GC4787@sirena.org.uk> <20190730075934.GA5892@Asurada>
In-Reply-To: <20190730075934.GA5892@Asurada>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 6 Aug 2019 14:15:03 +0300
Message-ID: <CAEnQRZBpQPoi5OH--c=ubKYc6B3rspmVnb846UTFW7P5SE62ww@mail.gmail.com>
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

On Tue, Jul 30, 2019 at 10:59 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Jul 29, 2019 at 09:20:01PM +0100, Mark Brown wrote:
> > On Mon, Jul 29, 2019 at 10:57:43PM +0300, Daniel Baluta wrote:
> > > On Mon, Jul 29, 2019 at 10:42 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > > On Sun, Jul 28, 2019 at 10:24:23PM +0300, Daniel Baluta wrote:
> >
> > > > > @@ -704,7 +711,14 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
> > > > >       case FSL_SAI_TCR3:
> > > > >       case FSL_SAI_TCR4:
> > > > >       case FSL_SAI_TCR5:
> > > > > -     case FSL_SAI_TFR:
> > > > > +     case FSL_SAI_TFR0:
> >
> > > > A tricky thing here is that those SAI instances on older SoC don't
> > > > support multi data lines physically, while seemly having registers
> > > > pre-defined. So your change doesn't sound doing anything wrong to
> > > > them at all, I am still wondering if it is necessary to apply them
> > > > to newer compatible only though, as for older compatibles of SAI,
> > > > these registers would be useless and confusing if being exposed.
> >
> > > > What do you think?
> >
> > > Yes, I thought about this too. But, I tried to keep the code as short
> > > as possible and technically it is not wrong. When 1 data line is supported
> > > for example application will only care about TDR0, TFR0, etc.
> >
> > So long as it's safe to read the registers (you don't get a bus error or
> > anything) I'd say it's more trouble than it's worth to have separate
> > regmap configuations just for this.  The main reasons for restricting
> > readability are where there's physical problems with doing the reads or
> > to keep the size of the debugfs files under control for usability and
> > performance reasons.
>
> Thanks for the input, Mark.
>
> Daniel, did you get a chance to test it on older SoCs? At least
> nothing breaks like bus errors?

Tested on imx6sx-sdb, everything looks good. No bus errors.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
