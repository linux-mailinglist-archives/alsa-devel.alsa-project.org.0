Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3EA83E98
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 03:13:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48DC3165D;
	Wed,  7 Aug 2019 03:12:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48DC3165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565140400;
	bh=IOw6KBLtrBEcWE1xa1C1hTpfshI3OKcma15HZS4nZQQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TzpcG9xE7ijH1TyzYogCtGULhT8+NoVKaekpp7LeewLodOPQNec38GRN8yifdCVBW
	 yqtnkWNjcQYGnlQLiZj+J4v3hwb/f2YcbLKIvI27m2gX/tKVm/LGNsQTP/kOWbGguG
	 PlFyoaIBGGPYwhZWftBc2xEi/HxHvFmU3wVJhqLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76587F80483;
	Wed,  7 Aug 2019 03:11:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60FE8F80483; Wed,  7 Aug 2019 03:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C65D9F800F3
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 03:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C65D9F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="W0Q2zH5E"
Received: by mail-pl1-x641.google.com with SMTP id 4so31568920pld.10
 for <alsa-devel@alsa-project.org>; Tue, 06 Aug 2019 18:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Dp8mvh65KHuF+NgUue69yu5lshqxJ1qu1kFOwYukDzQ=;
 b=W0Q2zH5Eprm6HfAF1fdlZeg3FTPVQ9TRhGBsVbp+mOBva0lMNGOLCHaBDt6AKQ3p37
 0jD4YFEALVWroS5uWoipALMLbTG54RhU+pCS83a0cGwPdKV8rTtyvVCzTX0kVTQRnawX
 +kg4Uie4N5pipPiCFLuw5Clt90kaPo5kLbZfixFvoK04bOcBzJtlbXd1lhnhVlXAbgBI
 mo2EUXbnLragIb/ILMFUJSCU9ap2Pbb/M5AdWAElCHh2vy+Sm6L6AvAT9w8V6OZhn3ab
 rVusdBK/uJ6qUcSxcaWMyXTaAEqq256lDIpDBCbCedJlwUx0Ka911OCJnyO+uL5t/Yxz
 an8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Dp8mvh65KHuF+NgUue69yu5lshqxJ1qu1kFOwYukDzQ=;
 b=irvw3qZ/uzD3xoNwfYkeYOL2+Gd9sbEvRNmvglvxqy+pYAbG6CQ7KjitzGZSqzOxrs
 3p/v4azw5lZ4ztxm0iO/v/KbgVbjBmBSk9JyHlo/Z+VHD6nfguzKDZo0g8/vjbtwg2X/
 gYnOoR7J9xA6NRwO3CgJI6bKbp3wZfOf2CkSsmBVX+eSmU4VDn967Nvz7D7hKpd+6lfD
 gcZK2O4ulM4euYQDszsQYqO52JXgrKjMRkaS99NbvxadfRNZX7UFypjVv2vg7ww91EfB
 EuQs6ugsmrYpMtKAZWyC6W1cBG4LPEblojHboHRE0Gjik1i4ATHyduIzGx0hTX8zanWM
 E09g==
X-Gm-Message-State: APjAAAVvLba7ZJ7tVhPmlLHKTgv6znc+1gw6rVoy6O2ksWT3E0plYjqC
 OtJDciyoHBg7+2Vt4yz2TwA=
X-Google-Smtp-Source: APXvYqyRZhIFjUquoFklw1N6uzzmYgLKw2zn7k7U5o1DoBKZiOMqffr7P9u+UWpRR1/gHtBZTFkxPA==
X-Received: by 2002:a17:902:8d97:: with SMTP id
 v23mr5649791plo.157.1565140288366; 
 Tue, 06 Aug 2019 18:11:28 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id w2sm78210147pgc.32.2019.08.06.18.11.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 18:11:28 -0700 (PDT)
Date: Tue, 6 Aug 2019 18:12:23 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Message-ID: <20190807011222.GB8938@Asurada-Nvidia.nvidia.com>
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-2-daniel.baluta@nxp.com>
 <20190729194214.GA20594@Asurada-Nvidia.nvidia.com>
 <CAEnQRZDmnAmgUkRGv3V5S7b5EnYTd2BO5NFuME2CfGb1=nAHzQ@mail.gmail.com>
 <20190729202001.GC4787@sirena.org.uk>
 <20190730075934.GA5892@Asurada>
 <CAEnQRZBpQPoi5OH--c=ubKYc6B3rspmVnb846UTFW7P5SE62ww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEnQRZBpQPoi5OH--c=ubKYc6B3rspmVnb846UTFW7P5SE62ww@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Tue, Aug 06, 2019 at 02:15:03PM +0300, Daniel Baluta wrote:
> On Tue, Jul 30, 2019 at 10:59 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Mon, Jul 29, 2019 at 09:20:01PM +0100, Mark Brown wrote:
> > > On Mon, Jul 29, 2019 at 10:57:43PM +0300, Daniel Baluta wrote:
> > > > On Mon, Jul 29, 2019 at 10:42 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > > > On Sun, Jul 28, 2019 at 10:24:23PM +0300, Daniel Baluta wrote:
> > >
> > > > > > @@ -704,7 +711,14 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
> > > > > >       case FSL_SAI_TCR3:
> > > > > >       case FSL_SAI_TCR4:
> > > > > >       case FSL_SAI_TCR5:
> > > > > > -     case FSL_SAI_TFR:
> > > > > > +     case FSL_SAI_TFR0:
> > >
> > > > > A tricky thing here is that those SAI instances on older SoC don't
> > > > > support multi data lines physically, while seemly having registers
> > > > > pre-defined. So your change doesn't sound doing anything wrong to
> > > > > them at all, I am still wondering if it is necessary to apply them
> > > > > to newer compatible only though, as for older compatibles of SAI,
> > > > > these registers would be useless and confusing if being exposed.
> > >
> > > > > What do you think?
> > >
> > > > Yes, I thought about this too. But, I tried to keep the code as short
> > > > as possible and technically it is not wrong. When 1 data line is supported
> > > > for example application will only care about TDR0, TFR0, etc.
> > >
> > > So long as it's safe to read the registers (you don't get a bus error or
> > > anything) I'd say it's more trouble than it's worth to have separate
> > > regmap configuations just for this.  The main reasons for restricting
> > > readability are where there's physical problems with doing the reads or
> > > to keep the size of the debugfs files under control for usability and
> > > performance reasons.
> >
> > Thanks for the input, Mark.
> >
> > Daniel, did you get a chance to test it on older SoCs? At least
> > nothing breaks like bus errors?
> 
> Tested on imx6sx-sdb, everything looks good. No bus errors.

Okay. Let's just stick to it then. Thanks for the reply.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
