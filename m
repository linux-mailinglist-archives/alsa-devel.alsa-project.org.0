Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2C4605C84
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 12:37:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E740CA3FD;
	Thu, 20 Oct 2022 12:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E740CA3FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666262234;
	bh=683v4hUy0SmafI83To+Isl3SKfGOBhxnh8RoSe2BfVE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g4H192e5FZhmfGo1BgdorKdjvQXOWptTkX6JfXZJZdCJptclcBmDeH7SC60UIW5Wn
	 TnTkq01cMm+fv/k3nH1QLFdHpCl9b7QD0dWj+KO7lZeAnx9pVzSy+ZpF8hdKunOzkg
	 /WgYF6Y6wChgvemGpV4iuAnPAUpCpflkCZmK0wFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C46C7F8058C;
	Thu, 20 Oct 2022 12:33:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46AF8F8025E; Mon, 17 Oct 2022 11:00:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0C40F800E5
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 11:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0C40F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dm/Nt6xe"
Received: by mail-ed1-x533.google.com with SMTP id l22so15035667edj.5
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 02:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=683v4hUy0SmafI83To+Isl3SKfGOBhxnh8RoSe2BfVE=;
 b=dm/Nt6xeLy51NB8MVo7obwM+852oRrh6kv29Cep7deqc4s/4HdJl7FiZqfN9XWyFmq
 PEiSQEJYH+PXHavxy/4td4Ss60zPdOW66Nm4OVHjJWGyeBDSTXFjenfxFIoUTymQ3Rmi
 zS+6OYEcwrRB3dfWX2vjNRs25pwNYTvrfqJ3SUm+ySkbhzDW7NutV590fGsZMyVxBUW5
 i7AvrrD/hPrDzjoDPE8R+2+YT6cSrnsXVMKDprnpXnZsn9nFCDUOIHKlu2F3zBs4hgdZ
 5yNLaYhcJzRTDN/zpX4CqQC0HSH+aLSZLfgYA7gKNawTaAaj2kSOlyn/aoGzC+9McidO
 9f4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=683v4hUy0SmafI83To+Isl3SKfGOBhxnh8RoSe2BfVE=;
 b=8D+fvTOZNEPDzXoM5c2gLnxIjfg6MGQY6YaDocjRu+Lq7n3PDklxS3fgIxBtyhKN1i
 PqehkEBvEBN/7C6lSs30C/nmQS3Rb6IPEkiVPOdsRQe2MQSs6F1ZVZiB/Q4kUZOkqHbS
 P3X/H3HOmLN+8BmYv5VUSfNPcL+6V3t9IHIQizKUb+Teb8gIZ5w/rJ9iJWbgvxFHds4s
 MD+mEpfAVTvGsmjuNpX4Wt/+1OUaNxLdhVOBYHr/A1wBLoh7bajskL36/lrOKVWGZqS3
 792mQNORhLWanqAQllptMoIA6kTSEIivHiHK2WO0cZdEQUoQV7IVjW1C4l93xfDoiICl
 JnRQ==
X-Gm-Message-State: ACrzQf1WAty0xgPG4pI0gDb0mXz0+UL0etR1DoRbkWqlqbpem8XR2cXl
 Nh4E9kpbmyhN4MmrKrzEhbtPQWb5FFQdZuExDxIhjA==
X-Google-Smtp-Source: AMsMyM75VJRNXRWuH3xUBu8rTGOtseWXKYSI7NNSW4bcXZ4SIlOn8hiiyIMM/AoI9crYmm+7lTOfrLhKDqXw522JVF8=
X-Received: by 2002:a05:6402:4029:b0:45b:d50c:b9b0 with SMTP id
 d41-20020a056402402900b0045bd50cb9b0mr9161790eda.126.1665997206064; Mon, 17
 Oct 2022 02:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-11-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221010201453.77401-11-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Oct 2022 10:59:54 +0200
Message-ID: <CACRpkdZ=0Uj7PxS-+AcQ+Z1xsV0n24xsSA0+upucZzbXVa2KHw@mail.gmail.com>
Subject: Re: [PATCH v2 10/36] pinctrl: imx: Add missed header(s)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 20 Oct 2022 12:33:17 +0200
Cc: Andrew Lunn <andrew@lunn.ch>, Kent Gibson <warthog618@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomasz Figa <tomasz.figa@gmail.com>,
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
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, Nancy Yuen <yuenn@google.com>,
 Chen-Yu Tsai <wens@csie.org>,
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

On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
>
> While at it, sort headers alphabetically.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
