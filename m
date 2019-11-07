Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA12F2D69
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 12:27:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B315A1684;
	Thu,  7 Nov 2019 12:26:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B315A1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573126059;
	bh=OP5zt1f9sgUC4mJOL3Zx/qsKCZeYiUGZSIs89eBK3+c=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vKtsYx56VnkGqPBAnOlosT8pSU8SQoM5Xr9X8qMofZbBKtnWEf4iYg+P+KCMAHNKQ
	 vvqmaEdahwmitgvN+xLX5a9SA1WjGxv6s3om3u1+2z6DjgHJXby0gVdO4JMF2wi95w
	 lyjD2iRbZ3YnWqAfLfrSoarVujDyvQK5svv8Mvec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F8B2F8060E;
	Thu,  7 Nov 2019 12:24:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E8C2F8049B; Thu,  7 Nov 2019 09:20:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEBC0F800F3
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 09:20:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEBC0F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aR0m+nKj"
Received: by mail-lj1-x241.google.com with SMTP id k15so1232499lja.3
 for <alsa-devel@alsa-project.org>; Thu, 07 Nov 2019 00:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DlF4imC2yuisAQo2SgUCy1P9SylqUN75hyqh76y3GuU=;
 b=aR0m+nKjgA8feFlTBlwL84cE9daL5eeq25n5+TiO9llQb9TsmGAwBzMrydUeOVpqcd
 G/NOnRqUmqV9FDnFABUvFStxGmc4lYiT1CO71XxvWX8QHiG+QuYeULshpCobKFsWAsYm
 tdhQ8t6991g/IUrvBhXPOW8BhPBS86zZJGQOc82tWlYl1GOQvr9MTGWvpPLFiIeR9lEr
 foMt76rS4g+F3J5BvZ1hmIknazOLP6jdC15sbiF4dtMlHzvLlDlwdEVWxYVkVYDLBy/H
 2YD/40djhB6z1791duVFLnjNJBICD/pXuSn9Wyozo1Bsi0Bqg8js/iowtRmXORd7WJzi
 n1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DlF4imC2yuisAQo2SgUCy1P9SylqUN75hyqh76y3GuU=;
 b=q/ZLOrDzWN5eZkI/329ZHFB1BkAUg7OBTlY0vlwcGH8McZgGwCvvO+7RdNs42I8C67
 fH8utaIyCcXScR86QIKgEcC0LGFXZOjql0N4yXcWbx446J4V0dHZ9kWqLiyvxcR5BY6s
 n0qLyTDk7jUJw8DUbPlrxSTo1/73xF53eHlBMtJFzgybq05bkAywreevq0aKTKuzFPXE
 oCubrQAt8nbfgx90Y6RciuhL1g0eMZErDoONoWyp+vIrDIgCAloBPHXzT6j+92rANS/D
 BeL9v2JtAGZugkO4hqiQkiXCPix/hpl2slAe/RKVqL8QojeobB5KdRhrEXd1P9KXFY7K
 d0tA==
X-Gm-Message-State: APjAAAUdXfDQZ2rOsSHpy+iz95AVeIE5A35nJkQFMZ50SOXyDhxO+iEI
 ydWTI6U7ren7XRyMQHw/rcQfb4fEKCxRdPMIYsDFhQ==
X-Google-Smtp-Source: APXvYqxJbhcWq+G1f8Jk5lv3i720/gVAo6L3L+y4Wi2RhTUP1I1SjMgB/XswEKoQSm7d2gl5jZMd4ClfaG2HxTvfJoQ=
X-Received: by 2002:a05:651c:1202:: with SMTP id
 i2mr1417186lja.218.1573114826673; 
 Thu, 07 Nov 2019 00:20:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <fcd51b067bafa571b3d9879a3afc31e8c764100d.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <fcd51b067bafa571b3d9879a3afc31e8c764100d.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2019 09:20:15 +0100
Message-ID: <CACRpkdZm823gEkpw8hYfuLp99ssKtGQMcEcZHC34xd2kQPYH-A@mail.gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
X-Mailman-Approved-At: Thu, 07 Nov 2019 12:24:22 +0100
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 David Daney <david.daney@cavium.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Peter Tyser <ptyser@xes-inc.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Marek Behun <marek.behun@nic.cz>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Bamvor Jian Zhang <bamv2005@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Jeffery <andrew@aj.id.au>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 1/2] gpio: Add definition for GPIO
	direction
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

On Wed, Nov 6, 2019 at 9:51 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> At least for me it is difficult to remember the meaning of GPIO
> direction values. Define GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT so that occasional GPIO contributors would
> not need to always check the meaning of hard coded values 1 and 0.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Patch applied.

Yours,
Linus Walleij
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
