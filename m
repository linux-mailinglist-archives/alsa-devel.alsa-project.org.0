Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E04C75FFDE6
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 09:31:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76C6B68C9;
	Sun, 16 Oct 2022 09:30:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76C6B68C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665905476;
	bh=2F6fKCyGV1IpuHyLH4kMkCnNmLyBDzkZkkEaXvDllGI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IG1789h7/nk8jzZX+3IOFroFoBk4UNu3GJXsAQ8x1ZT/6BYhVTBwOIhfLcwj7s3VO
	 Ph8BDerc7v/sCCfKPsDgFncXvvdRuo4JaIJWx47T3pKQcN5h5louEDtFjyEOn/a/bg
	 bEpH38Dqi58fE1y/qNk2R6kTaNH7KKIjyHiupocs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD18BF80559;
	Sun, 16 Oct 2022 09:28:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F704F80246; Wed, 12 Oct 2022 12:04:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF62AF800C0
 for <alsa-devel@alsa-project.org>; Wed, 12 Oct 2022 12:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF62AF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZuAn0riu"
Received: by mail-qt1-x830.google.com with SMTP id hh9so9837109qtb.13
 for <alsa-devel@alsa-project.org>; Wed, 12 Oct 2022 03:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R2uNoWDHy+GOry29L6DC1dXWZKJOzJDC9JxozJVSpGE=;
 b=ZuAn0riuXHel9rEBKRhDJaphdwknBUsVfuUv/T2PqZwW+uHUs0jQAoNTggSP2xYvxV
 AIPBHcfBEeKUY8XaTwBfDZ4rSHoMsN+0EmQWS+Q65k7ex3GR3DSFMtYWLj5CjjdFW5lS
 H15Im9ztaYgi/pdTI+XTH4+61vil18OUHSI0xGSAcGYNKUvzy6F36vXqiFhOKG65c2tn
 Hm9UqrwXHcz71mbsaS1jF9iuBu0ckjr5DhBRLVoVyj42mBo6ELsboWfCQHWyRGQ4tlaj
 QaFlpQ5WtgjVo1xKNFF2bpP4chzh3RulgtzO05YqhYqIONKukzB/OS4NwSuMzh0mSuvU
 pMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R2uNoWDHy+GOry29L6DC1dXWZKJOzJDC9JxozJVSpGE=;
 b=zPCzv1RPhaJbE5GHPnzFWf+lQj2fcSD7fzBUoZQFZ4lFJx4nrNacwQsw5i9sB8hM48
 yFgfeIt1+rsI07WOCS0p2T27UXSxCX/PZPR6goIh9VeaSnNfvqmhMV+U1xUWFzx8KZ6i
 4Zopmqiq30eqQqBtPGeyXciZIpWmOhEhOsBJEetrlFwUTuRPzzNh+1s8EGMjyao243LJ
 E28TFvAbJM+dG4L5pltl73VP8cD4xj/yK51RnphQzCUfp86XKi+/K8RCBwQFg1eIUIbz
 hPsh+RaKl3cta7B1rXj/SdSlymK474IlUQoRXQSeN/4nQDHz2uhgimW2jnnqSe3+tRl1
 h48Q==
X-Gm-Message-State: ACrzQf0an8o8lCtp9iVWk6gNA3zVfrd5p1ENgOGEjScQMwoWRk6kElCG
 cBQcpAcuDhxgaCXWQvDU1cnN5+EBj/GhVucUR58=
X-Google-Smtp-Source: AMsMyM5ie8LeIoK7BaYP5eKG5FZkx73UfHVDBrIIwi+8uhHlPAnlyvjeeFl/0Iy9XueA0qyfGOPRZ2XY3nQxTptpumo=
X-Received: by 2002:ac8:7c43:0:b0:35c:cd8f:3da5 with SMTP id
 o3-20020ac87c43000000b0035ccd8f3da5mr23132665qtv.61.1665569086451; Wed, 12
 Oct 2022 03:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <0684f480-2092-d520-2c8e-bd9a2dca47e3@gmail.com>
In-Reply-To: <0684f480-2092-d520-2c8e-bd9a2dca47e3@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 12 Oct 2022 13:04:10 +0300
Message-ID: <CAHp75VdDjyUAZBTaoPOe5oA3f_5xRznAooq08=Eff4F1AZyVOQ@mail.gmail.com>
Subject: Re: [rft, PATCH v2 00/36] pinctrl: Clean up and add missed headers
To: Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 16 Oct 2022 09:28:43 +0200
Cc: Andrew Lunn <andrew@lunn.ch>, Kent Gibson <warthog618@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Phil Edworthy <phil.edworthy@renesas.com>, linux-samsung-soc@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, Tali Perry <tali.perry1@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-aspeed@lists.ozlabs.org,
 Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-media@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-arm-msm@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, soc@kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>, Benjamin Fair <benjaminfair@google.com>,
 Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Chen-Yu Tsai <wenst@chromium.org>,
 Orson Zhai <orsonzhai@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Haojian Zhuang <haojian.zhuang@linaro.org>, linux-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Prathamesh Shete <pshete@nvidia.com>, Andy Gross <agross@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Billy Tsai <billy_tsai@aspeedtech.com>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 patches@opensource.cirrus.com, Sean Wang <sean.wang@kernel.org>,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
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

On Tue, Oct 11, 2022 at 11:56 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 10/10/2022 1:14 PM, Andy Shevchenko wrote:
> > Currently the header inclusion inside the pinctrl headers seems more arbitrary
> > than logical. This series is basically out of two parts:
> > - add missed headers to the pin control drivers / users
> > - clean up the headers of pin control subsystem
> >
> > The idea is to have this series to be pulled after -rc1 by the GPIO and
> > pin control subsystems, so all new drivers will utilize cleaned up headers
> > of the pin control.
> >
> > Please, review and comment.
>
> Did you really need to split this on a per-driver basis as opposed to
> just a treewide drivers/pinctrl, drivers/media and drivers/gpiolib patch
> set?
>
> 36 patches seems needlessly high when 4 patches could have achieve the
> same outcome.

I can combine them if maintainers ask for that, nevertheless for Intel
pin control and GPIO drivers, which I care more about, I would like to
leave as separate changes (easy to see in history what was done).


-- 
With Best Regards,
Andy Shevchenko
