Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC207A2B2
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 10:01:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08B1417E2;
	Tue, 30 Jul 2019 10:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08B1417E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564473699;
	bh=sOLRr/RVUVEcGgEyEMeviixyhwr+fJsG40eoMnQbhDY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cb/SznBkkivk3wmGUhyv7dnjfKBrHHbrkRb38N5WC39llw9U/qQ1Q45Ft2ApUHEGC
	 AQ1S7eWCLqo2A30Me0EjyRIkd+NFk+/AEJMWEFmJoAhMFOvXgDOrYe2HOdaXO8bCE2
	 855AR1fN0btKBkk/N3CMOIjc4DLbQB4ilpu55bPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32C06F804CA;
	Tue, 30 Jul 2019 09:59:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EF07F804CA; Tue, 30 Jul 2019 09:59:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4B7EF800AB
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 09:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4B7EF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iQH8RxmO"
Received: by mail-pg1-x542.google.com with SMTP id l21so29626406pgm.3
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 00:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uFAlrmOoAl8QPQdLLMxuBk418ZCFdTVKi3BcwvDs0DE=;
 b=iQH8RxmOMF5875eeVO3Da2rdPhB9lA11lpzfN+ZfJVN6bm6r3rR50pnI5vhkCm7k+g
 SUMsV8rxeWoqmqKfla+d0wSLqBH9tkHZw8vYjdrAlyn92qrZDyQS0SMIymzafGxM+aJY
 P/NqNF9VN0J2K5ZXFK9p3H7ihv69ui83yfoKZmK2tvmkyDVcZzCTXGvmHYjBZDwDhv+B
 pspDjFP0Wcqd+CTawX04gl/d4KuzyPfRUZoOsvFWOF5/chtuOm/0ngK0rJrd7bSwrxJO
 jyiETiHeMJA+L81L9x6Qx272zjSzcoU2tjxj8SZfGBBVk78EjwO3ldCfct6uJJ38Sb5P
 9tZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uFAlrmOoAl8QPQdLLMxuBk418ZCFdTVKi3BcwvDs0DE=;
 b=a83Lwt8PdbWKnLDgPW+vSXmM8uRE/9fzpfDrRmZ+GZEAcAxnh9Qp8jGcJoKXhfx+Ae
 9AvBkSL744P6J1TrbBIBTW55Bl4tInI81nZKRnEU20FKDiWili9G+r3p0tHwLyVBmOP2
 lBQc7uqRyc/YSS0NradQaOlDd/7avoWsg94eHxdDCHtTOQb9+1NNIMflAHysbfqHvh6C
 OLOiT3cJs9jmyDVtj6GmUlkmMyXmCljvk4Wy6htdfYRWfpanzA3yZh6Ls5FCj3+BC9N4
 RLEnORPamNOa3EYA8FJuX+ePQFVhA5nr9yt3xumfa7uUwYIb0cPulj1e+v0CQEtxlwB6
 Br+Q==
X-Gm-Message-State: APjAAAW2kEeGSt8uo9NyS0AluXqIZRx92wkmSe5sOIjltf5o01uwxByx
 AfjSXZ+GbfiViqstHXs16vs=
X-Google-Smtp-Source: APXvYqwzj4cH6/cG01FQ79ISBwq4FGUEBV1C6SsIzTEU3Ib99EXqnyks6RgcY8HCH6FCulwOfpSo5A==
X-Received: by 2002:a63:e213:: with SMTP id
 q19mr106419831pgh.180.1564473584219; 
 Tue, 30 Jul 2019 00:59:44 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 33sm74160050pgy.22.2019.07.30.00.59.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 00:59:43 -0700 (PDT)
Date: Tue, 30 Jul 2019 00:59:35 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190730075934.GA5892@Asurada>
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-2-daniel.baluta@nxp.com>
 <20190729194214.GA20594@Asurada-Nvidia.nvidia.com>
 <CAEnQRZDmnAmgUkRGv3V5S7b5EnYTd2BO5NFuME2CfGb1=nAHzQ@mail.gmail.com>
 <20190729202001.GC4787@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729202001.GC4787@sirena.org.uk>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Daniel Baluta <daniel.baluta@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Viorel Suman <viorel.suman@nxp.com>, Timur Tabi <timur@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 dl-linux-imx <linux-imx@nxp.com>,
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

On Mon, Jul 29, 2019 at 09:20:01PM +0100, Mark Brown wrote:
> On Mon, Jul 29, 2019 at 10:57:43PM +0300, Daniel Baluta wrote:
> > On Mon, Jul 29, 2019 at 10:42 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > On Sun, Jul 28, 2019 at 10:24:23PM +0300, Daniel Baluta wrote:
> 
> > > > @@ -704,7 +711,14 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
> > > >       case FSL_SAI_TCR3:
> > > >       case FSL_SAI_TCR4:
> > > >       case FSL_SAI_TCR5:
> > > > -     case FSL_SAI_TFR:
> > > > +     case FSL_SAI_TFR0:
> 
> > > A tricky thing here is that those SAI instances on older SoC don't
> > > support multi data lines physically, while seemly having registers
> > > pre-defined. So your change doesn't sound doing anything wrong to
> > > them at all, I am still wondering if it is necessary to apply them
> > > to newer compatible only though, as for older compatibles of SAI,
> > > these registers would be useless and confusing if being exposed.
> 
> > > What do you think?
> 
> > Yes, I thought about this too. But, I tried to keep the code as short
> > as possible and technically it is not wrong. When 1 data line is supported
> > for example application will only care about TDR0, TFR0, etc.
> 
> So long as it's safe to read the registers (you don't get a bus error or
> anything) I'd say it's more trouble than it's worth to have separate
> regmap configuations just for this.  The main reasons for restricting
> readability are where there's physical problems with doing the reads or
> to keep the size of the debugfs files under control for usability and
> performance reasons.

Thanks for the input, Mark.

Daniel, did you get a chance to test it on older SoCs? At least
nothing breaks like bus errors?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
