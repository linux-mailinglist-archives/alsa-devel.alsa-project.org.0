Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E473EF199D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 16:12:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61F8F169D;
	Wed,  6 Nov 2019 16:11:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61F8F169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573053126;
	bh=XmTyvhveuysgHEQCxm+RGRLeiEaGVjiHYB5YSXyEvOk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VI5Q+XZ5/+DdiCY/VupzASfwwxVjQOqs1xgzb3Y9w8mBQ61zdpx1ZNdoRR4X60gaQ
	 BBUvU3wy6XApvsHvX0SBmuJNCv3R9GW270ESo6/uVsAoR/j2GCaRrZ98/ZqrX/ZSzF
	 Wtv+ICFJRJOvab98qUnl+jt8w3Rrw3wdNEDlEBEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5F3FF8060D;
	Wed,  6 Nov 2019 16:09:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34281F8048D; Wed,  6 Nov 2019 15:40:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DEBEF80321
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 15:40:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DEBEF80321
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cuDum2cb"
Received: by mail-yw1-xc42.google.com with SMTP id i2so9622034ywg.13
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 06:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BVrTVz8ui5Yp2HVcAdLi7rCx+++bQxsOlRhu0XjCdeM=;
 b=cuDum2cbx52NXdaDRZT0ieXihdO/5T2jtmSnDfsL0Mb1dBV+gPEZWE9lh5soiuJnet
 kGtI1/WLWkq3/cbSiBoQBYh6lF7B039WrABEFiM8HUcecIDO0zEHsSM8OcpejoIAjrqk
 Jtc9inj8ruXwB/yuQrGrneghTT1lUH2Zi6g0aVsI3XaALTO3YLa0gkq5b+aAoyTXKw6V
 C+E/1I4XbruPAgDdS7wAdmu/6I4Btz8ErUSqjJrsCJ1AT1v5dBif9DRG6TeUPEbukijF
 ApAFiWiH7OZ6xLADVOTR4xCfYA0GhkPiqUW99Sao2tVlGt3qFlUVd0vvA36ntMHvlSwS
 82XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BVrTVz8ui5Yp2HVcAdLi7rCx+++bQxsOlRhu0XjCdeM=;
 b=IPE1mblUbZSzM0tRwgUNPff0buK0DABhyfkV6w/Ui+B7cOiC6dGf5qNwjdmjniNBmX
 zgdIRGoWQv5GWeoPjcJmTiOWqTmj9FIMq5Um1Rxi2aIQJyNyf/LWN8wSCA1zzweFqdZk
 Nxgi61LfYs2tvLu543UXpIiBKO2ALDnBzU1Ly6+WDPCGp4Vi9mX545GaUw6uApOF+FmX
 qnAJgXt7Tw5P7E3WNvNboYPJFpqCDTGxxo0KhOivsW8FdsfqBIbxNm5vAYePKN/eQbH2
 rtPbhpKGJfq2bWr8sXMroN5ZUAIlMNDjq/X8EFkLnrM6kTfboz2TcuJJeO93emyxV+jp
 r/UA==
X-Gm-Message-State: APjAAAV4m3FKZdF2LgAxJ5IqhZGRVzIJK3QUP5rW4UTqcF24SaaYEiB1
 QTLyAgMEfTCflydzmWULkkw=
X-Google-Smtp-Source: APXvYqxRUPEr6QgHY++cmspAGCQjmvK0JdJGvaYm4sCFJmqo6EO5dj0fS8aHhdWeWgO5dcya5jh3Bg==
X-Received: by 2002:a81:784b:: with SMTP id t72mr1838127ywc.118.1573051201835; 
 Wed, 06 Nov 2019 06:40:01 -0800 (PST)
Received: from icarus (072-189-084-142.res.spectrum.com. [72.189.84.142])
 by smtp.gmail.com with ESMTPSA id b199sm9542385ywh.23.2019.11.06.06.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 06:40:00 -0800 (PST)
Date: Wed, 6 Nov 2019 09:39:38 -0500
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Message-ID: <20191106143938.GA3176@icarus>
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Wed, 06 Nov 2019 16:08:48 +0100
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, David Daney <david.daney@cavium.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 Peter Tyser <ptyser@xes-inc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Marek Behun <marek.behun@nic.cz>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com, Joel Stanley <joel@jms.id.au>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Bamvor Jian Zhang <bamv2005@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-omap@vger.kernel.org,
 mazziesaccount@gmail.com, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Jeffery <andrew@aj.id.au>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 0/2] Add definition for GPIO direction
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

On Wed, Nov 06, 2019 at 10:51:06AM +0200, Matti Vaittinen wrote:
> The patch series adds definitions for GPIO line directions.
> 
> For occasional GPIO contributor like me it is always a pain to remember
> whether 1 or 0 was used for GPIO direction INPUT/OUTPUT. Judging the
> fact that I removed few comments like:
> 
> /* Return 0 if output, 1 if input */
> /* This means "out" */
> return 1; /* input */
> return 0; /* output */
> 
> it seems at least some others may find it hard to remember too. Adding
> defines for these values helps us who really have good - but short
> duration - memory :]
> 
> This idea comes from RFC series for ROHM BD71828 PMIC and was initially
> discussed with Linus Walleij here:
> https://lore.kernel.org/lkml/c06725c3dd34118a324907137758d8b85b3d4043.camel@fi.rohmeurope.com/
> but as this has no dependencies to BD71828 work (which probably takes a
> while) I decided to make it independent series.
> 
> Patches are compile-tested only. I have no HW to really test them. Thus I'd
> appreciate carefull review. This work is mainly about converting zeros
> and ones to the new defines but it wouldn't be first time I get it
> wrong.
> 
> Changelog v2:
>  - squashed patches 2-61 into patch 2.
>  - dropped patch 62 (can be applied later)
>  - rebased (cherry-picked) changes on top of GPIO devel branch.
> 
> Patch 1:
>  - adds the defines
> Patch 2:
>  - convert drivers to use new defines
> 
> This patch series is based on GPIO tree devel branch.

Just a tip for future patchsets in case you didn't know, you case
specify the base of your patchset by using the "--base" option:
https://git-scm.com/docs/git-format-patch#_base_tree_information

This will append a "base-commit" line with the commit hash at the end of
the first message so that it's unabiguous which base you're using
(useful in case the branch changes before your patch is reviewed).

William Breathitt Gray

> 
> ---
> 
> Matti Vaittinen (2):
>   gpio: Add definition for GPIO direction
>   gpio: Use new GPIO_LINE_DIRECTION
> 
>  drivers/gpio/gpio-104-dio-48e.c     |  5 ++++-
>  drivers/gpio/gpio-104-idi-48.c      |  2 +-
>  drivers/gpio/gpio-104-idio-16.c     |  4 ++--
>  drivers/gpio/gpio-74xx-mmio.c       |  5 ++++-
>  drivers/gpio/gpio-amd-fch.c         |  2 +-
>  drivers/gpio/gpio-aspeed.c          |  7 +++----
>  drivers/gpio/gpio-bcm-kona.c        |  6 +++---
>  drivers/gpio/gpio-bd70528.c         |  8 +++++---
>  drivers/gpio/gpio-bd9571mwv.c       |  4 +++-
>  drivers/gpio/gpio-dln2.c            |  6 +++---
>  drivers/gpio/gpio-exar.c            |  5 ++++-
>  drivers/gpio/gpio-f7188x.c          |  5 ++++-
>  drivers/gpio/gpio-gpio-mm.c         |  5 ++++-
>  drivers/gpio/gpio-htc-egpio.c       |  5 ++++-
>  drivers/gpio/gpio-ich.c             |  5 ++++-
>  drivers/gpio/gpio-kempld.c          |  5 ++++-
>  drivers/gpio/gpio-lp873x.c          |  2 +-
>  drivers/gpio/gpio-lp87565.c         |  5 ++++-
>  drivers/gpio/gpio-madera.c          |  5 ++++-
>  drivers/gpio/gpio-max3191x.c        |  2 +-
>  drivers/gpio/gpio-merrifield.c      |  5 ++++-
>  drivers/gpio/gpio-mmio.c            | 21 +++++++++++++++------
>  drivers/gpio/gpio-mockup.c          | 11 +++--------
>  drivers/gpio/gpio-moxtet.c          |  4 ++--
>  drivers/gpio/gpio-mvebu.c           |  5 ++++-
>  drivers/gpio/gpio-mxs.c             |  5 ++++-
>  drivers/gpio/gpio-omap.c            |  6 ++++--
>  drivers/gpio/gpio-pca953x.c         |  5 ++++-
>  drivers/gpio/gpio-pci-idio-16.c     |  4 ++--
>  drivers/gpio/gpio-pcie-idio-24.c    |  9 ++++++---
>  drivers/gpio/gpio-pisosr.c          |  2 +-
>  drivers/gpio/gpio-pl061.c           |  5 ++++-
>  drivers/gpio/gpio-raspberrypi-exp.c |  5 ++++-
>  drivers/gpio/gpio-rcar.c            |  5 ++++-
>  drivers/gpio/gpio-reg.c             |  3 ++-
>  drivers/gpio/gpio-sa1100.c          |  5 ++++-
>  drivers/gpio/gpio-sama5d2-piobu.c   |  7 ++++---
>  drivers/gpio/gpio-sch.c             |  5 ++++-
>  drivers/gpio/gpio-sch311x.c         |  5 ++++-
>  drivers/gpio/gpio-siox.c            |  4 ++--
>  drivers/gpio/gpio-stmpe.c           |  5 ++++-
>  drivers/gpio/gpio-tc3589x.c         |  5 ++++-
>  drivers/gpio/gpio-tegra.c           |  5 ++++-
>  drivers/gpio/gpio-tegra186.c        |  4 ++--
>  drivers/gpio/gpio-thunderx.c        |  5 ++++-
>  drivers/gpio/gpio-tpic2810.c        |  2 +-
>  drivers/gpio/gpio-tps65086.c        |  2 +-
>  drivers/gpio/gpio-tps65912.c        |  4 ++--
>  drivers/gpio/gpio-tps68470.c        |  6 +++---
>  drivers/gpio/gpio-tqmx86.c          |  5 ++++-
>  drivers/gpio/gpio-ts4900.c          |  5 ++++-
>  drivers/gpio/gpio-twl4030.c         | 10 +++++-----
>  drivers/gpio/gpio-twl6040.c         |  3 +--
>  drivers/gpio/gpio-uniphier.c        |  5 ++++-
>  drivers/gpio/gpio-wcove.c           |  7 +++++--
>  drivers/gpio/gpio-ws16c48.c         |  5 ++++-
>  drivers/gpio/gpio-xgene.c           |  5 ++++-
>  drivers/gpio/gpio-xra1403.c         |  5 ++++-
>  drivers/gpio/gpio-xtensa.c          |  4 ++--
>  drivers/gpio/gpio-zynq.c            |  7 +++++--
>  include/linux/gpio/driver.h         |  3 +++
>  61 files changed, 214 insertions(+), 102 deletions(-)
> 
> -- 
> 2.21.0
> 
> 
> -- 
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =] 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
