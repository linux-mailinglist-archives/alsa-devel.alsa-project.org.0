Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB7DEFCB2
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 12:52:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B5ED170E;
	Tue,  5 Nov 2019 12:51:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B5ED170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572954753;
	bh=uUqK2KLl4v6XMdMV33VOjqTrNSD5FB/NjF57byBzO2M=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F5DsoS2uoYEwCZNZz1jgz37trfqYFkWXulkyy3lVu3e2Hj96PCYhVGBCSNezsLQom
	 xRO+G7mDdXMjHtFbief7kDDszZj9XAXbXR36WzYH/26ymvBiemvPXJntDLzEHb1QKo
	 9qJBowZMaXUQm37doYomHDSOaqgAMsQk1BnAPcCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FE9FF80446;
	Tue,  5 Nov 2019 12:50:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5962CF8049B; Tue,  5 Nov 2019 11:09:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFF84F80271
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 11:09:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFF84F80271
Received: by mail-lf1-f66.google.com with SMTP id 19so9486212lft.13
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 02:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=zk3Bb9MrnjOf99XNcjG+7oLOCBcvmwvMNgAHxWKOa5c=;
 b=JoKTjUh2NhEVuXTWWGAInE2DDXBQ60xDCsX6e2qZtlqxBPEckqHyfSlGSoiF1lW+qq
 NCY7CaN3LSURpMsNNPZxtrfhqSglRH+64Xc1PL1SJ9OzHidt81uXj2BmDcaQ/JKLVJ0S
 /XeI14+AYZDCKeBZwMMlYBRs92emZsUsPz/zoEgAnRAi+1hu1QwnZQsU8CLLScdihjcV
 4SDzWap1m7C0FvQA/ek4Q0x7VRwqfts4UQQN/V+KcZLnkGTP3LQPn507/tOI1EiqOdXx
 LeHSThN1CnwJccV8UcmcauQfROrkF4xC1Br6nkPV0EZ6kjZ1ho6Kk7XBhfJHa3wJf1IP
 kCNA==
X-Gm-Message-State: APjAAAV2R/Qiot54C0RDTwKmqTM3EzqrFLtFrr05rPF9jixcbmUWVu+Z
 qP8zRSrZFwj+ZrYYCdPle7U=
X-Google-Smtp-Source: APXvYqyBwgy1vqbuJGpl9AzCkQnGaEwRpvBUoN2XJ8vBJuigeUtT9eRmIbLOdes7+Mmv8dp9zewfFw==
X-Received: by 2002:a19:6f0e:: with SMTP id k14mr20278721lfc.34.1572948565410; 
 Tue, 05 Nov 2019 02:09:25 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id c14sm8834917ljd.3.2019.11.05.02.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 02:09:24 -0800 (PST)
Date: Tue, 5 Nov 2019 12:09:10 +0200
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Message-ID: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 05 Nov 2019 12:50:45 +0100
Cc: Semi Malinen <semi.malinen@ge.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, David Daney <david.daney@cavium.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 Peter Tyser <ptyser@xes-inc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Marek Behun <marek.behun@nic.cz>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com, Joel Stanley <joel@jms.id.au>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Bamvor Jian Zhang <bamv2005@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-omap@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Nandor Han <nandor.han@ge.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-gpio@vger.kernel.org,
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
Subject: [alsa-devel] [PATCH 00/62] Add definition for GPIO direction
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

The patch series adds definitions for GPIO line directions.

For occasional GPIO contributor like me it is always a pain to remember
whether 1 or 0 was used for GPIO direction INPUT/OUTPUT. Judging the
fact that I removed few comments like:

/* Return 0 if output, 1 if input */
/* This means "out" */
return 1; /* input */
return 0; /* output */

it seems at least some others may find it hard to remember too. Adding
defines for these values helps us who really have good - but short
duration - memory :]

Please also see the last patch. It adds warning prints to be emitted
from gpiolib if other than defined values are used. This patch can be
dropped out if there is a reason for that to still be allowed.

This idea comes from RFC series for ROHM BD71828 PMIC and was initially
discussed with Linus Walleij here:
https://lore.kernel.org/lkml/c06725c3dd34118a324907137758d8b85b3d4043.camel@fi.rohmeurope.com/
but as this has no dependencies to BD71828 work (which probably takes a
while) I decided to make it independent series.

Patches are compile-tested only. I have no HW to really test them. Thus I'd
appreciate carefull review. This work is mainly about converting zeros
and ones to the new defines but it wouldn't be first time I get it wrong
in one of the patches :)

Patch 1:
 - adds the defines
Patches 2 - 61:
 - convert drivers to use new defines
Patch 62:
 - Add warning print if values other than the defines is used for direction.

Patches are created on top of Linux v5.4-rc6.

--

Matti Vaittinen (62):
  gpio: Add definition for GPIO direction
  gpio: gpio-104-dio-48e: Use new GPIO_LINE_DIRECTION
  gpio: add gpio-104-idi-48: Use new GPIO_LINE_DIRECTION
  gpio: gpio-104-idio-16: Use new GPIO_LINE_DIRECTION
  gpio: gpio-74xx-mmio: Use new GPIO_LINE_DIRECTION
  gpio: gpio-amd-fch: Use new GPIO_LINE_DIRECTION
  gpio: gpio-aspeed: Use new GPIO_LINE_DIRECTION
  gpio: gpio-bcm-kona: Use new GPIO_LINE_DIRECTION
  gpio: gpio-bd70528: Use new GPIO_LINE_DIRECTION
  gpio: gpio-bd9571mwv: Use new GPIO_LINE_DIRECTION
  gpio: gpio-dln2: Use new GPIO_LINE_DIRECTION
  gpio: gpio-exar: Use new GPIO_LINE_DIRECTION
  gpio: gpio-f7188x: Use new GPIO_LINE_DIRECTION
  gpio: gpio-gpio-mm: Use new GPIO_LINE_DIRECTION
  gpio: gpio-htc-egpio: Use new GPIO_LINE_DIRECTION
  gpio: gpio-ich: Use new GPIO_LINE_DIRECTION
  gpio: gpio-kempld: Use new GPIO_LINE_DIRECTION
  gpio: gpio-lp873x: Use new GPIO_LINE_DIRECTION
  gpio: gpio-lp87565: Use new GPIO_LINE_DIRECTION
  gpio: gpio-madera: Use new GPIO_LINE_DIRECTION
  gpio: gpio-max3191x: Use new GPIO_LINE_DIRECTION
  gpio: gpio-mmio: Use new GPIO_LINE_DIRECTION
  gpio: gpio-merrifield: Use new GPIO_LINE_DIRECTION
  gpio: gpio-mockup: Use new GPIO_LINE_DIRECTION
  gpio: gpio-moxtet: Use new GPIO_LINE_DIRECTION
  gpio: gpio-mvebu: Use new GPIO_LINE_DIRECTION
  gpio: gpio-mxs: Use new GPIO_LINE_DIRECTION
  gpio: gpio-omap: Use new GPIO_LINE_DIRECTION
  gpio: gpio-pca953x: Use new GPIO_LINE_DIRECTION
  gpio: gpio-pcie-idio-24: Use new GPIO_LINE_DIRECTION
  gpio: gpio-pci-idio-16: Use new GPIO_LINE_DIRECTION
  gpio: gpio-pisosr: Use new GPIO_LINE_DIRECTION
  gpio: gpio-pl061: Use new GPIO_LINE_DIRECTION
  gpio: gpio-raspberrypi-exp: Use new GPIO_LINE_DIRECTION
  gpio: gpio-rcar: Use new GPIO_LINE_DIRECTION
  gpio: gpio-reg: Use new GPIO_LINE_DIRECTION
  gpio: gpio-sama5d2-piobu: Use new GPIO_LINE_DIRECTION
  gpio: gpio-sch311x: Use new GPIO_LINE_DIRECTION
  gpio: gpio-sch: Use new GPIO_LINE_DIRECTION
  gpio: gpio-siox: Use new GPIO_LINE_DIRECTION
  gpio: gpio-stmpe: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tc3589x: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tegra186: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tegra: Use new GPIO_LINE_DIRECTION
  gpio: gpio-thunderx: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tpic2810: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tps65086: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tps65912: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tps68470: Use new GPIO_LINE_DIRECTION
  gpio: gpio-tqmx86: Use new GPIO_LINE_DIRECTION
  gpio: gpio-ts4900: Use new GPIO_LINE_DIRECTION
  gpio: gpio-twl4030: Use new GPIO_LINE_DIRECTION
  gpio: gpio-twl6040: Use new GPIO_LINE_DIRECTION
  gpio: gpio-uniphier: Use new GPIO_LINE_DIRECTION
  gpio: gpio-wcove: Use new GPIO_LINE_DIRECTION
  gpio: gpio-ws16c48: Use new GPIO_LINE_DIRECTION
  gpio: gpio-xgene: Use new GPIO_LINE_DIRECTION
  gpio: gpio-xra1403: Use new GPIO_LINE_DIRECTION
  gpio: gpio-xtensa: Use new GPIO_LINE_DIRECTION
  gpio: gpio-zynq: Use new GPIO_LINE_DIRECTION
  gpio: gpio-sa1100: Use new GPIO_LINE_DIRECTION
  gpiolib: Nag for INPUT direction values other than
    GPIO_LINE_DIRECTION_IN

 drivers/gpio/gpio-104-dio-48e.c     |  5 ++++-
 drivers/gpio/gpio-104-idi-48.c      |  2 +-
 drivers/gpio/gpio-104-idio-16.c     |  4 ++--
 drivers/gpio/gpio-74xx-mmio.c       |  5 ++++-
 drivers/gpio/gpio-amd-fch.c         |  2 +-
 drivers/gpio/gpio-aspeed.c          |  7 +++----
 drivers/gpio/gpio-bcm-kona.c        |  6 +++---
 drivers/gpio/gpio-bd70528.c         |  8 +++++---
 drivers/gpio/gpio-bd9571mwv.c       |  4 +++-
 drivers/gpio/gpio-dln2.c            |  6 +++---
 drivers/gpio/gpio-exar.c            |  5 ++++-
 drivers/gpio/gpio-f7188x.c          |  5 ++++-
 drivers/gpio/gpio-gpio-mm.c         |  5 ++++-
 drivers/gpio/gpio-htc-egpio.c       |  5 ++++-
 drivers/gpio/gpio-ich.c             |  5 ++++-
 drivers/gpio/gpio-kempld.c          |  5 ++++-
 drivers/gpio/gpio-lp873x.c          |  2 +-
 drivers/gpio/gpio-lp87565.c         |  5 ++++-
 drivers/gpio/gpio-madera.c          |  5 ++++-
 drivers/gpio/gpio-max3191x.c        |  2 +-
 drivers/gpio/gpio-merrifield.c      |  5 ++++-
 drivers/gpio/gpio-mmio.c            | 21 +++++++++++++++------
 drivers/gpio/gpio-mockup.c          | 11 +++--------
 drivers/gpio/gpio-moxtet.c          |  4 ++--
 drivers/gpio/gpio-mvebu.c           |  5 ++++-
 drivers/gpio/gpio-mxs.c             |  5 ++++-
 drivers/gpio/gpio-omap.c            |  6 ++++--
 drivers/gpio/gpio-pca953x.c         |  5 ++++-
 drivers/gpio/gpio-pci-idio-16.c     |  4 ++--
 drivers/gpio/gpio-pcie-idio-24.c    |  9 ++++++---
 drivers/gpio/gpio-pisosr.c          |  2 +-
 drivers/gpio/gpio-pl061.c           |  5 ++++-
 drivers/gpio/gpio-raspberrypi-exp.c |  5 ++++-
 drivers/gpio/gpio-rcar.c            |  5 ++++-
 drivers/gpio/gpio-reg.c             |  3 ++-
 drivers/gpio/gpio-sa1100.c          |  5 ++++-
 drivers/gpio/gpio-sama5d2-piobu.c   |  7 ++++---
 drivers/gpio/gpio-sch.c             |  5 ++++-
 drivers/gpio/gpio-sch311x.c         |  5 ++++-
 drivers/gpio/gpio-siox.c            |  4 ++--
 drivers/gpio/gpio-stmpe.c           |  5 ++++-
 drivers/gpio/gpio-tc3589x.c         |  5 ++++-
 drivers/gpio/gpio-tegra.c           |  5 ++++-
 drivers/gpio/gpio-tegra186.c        |  4 ++--
 drivers/gpio/gpio-thunderx.c        |  5 ++++-
 drivers/gpio/gpio-tpic2810.c        |  2 +-
 drivers/gpio/gpio-tps65086.c        |  2 +-
 drivers/gpio/gpio-tps65912.c        |  4 ++--
 drivers/gpio/gpio-tps68470.c        |  6 +++---
 drivers/gpio/gpio-tqmx86.c          |  5 ++++-
 drivers/gpio/gpio-ts4900.c          |  5 ++++-
 drivers/gpio/gpio-twl4030.c         | 10 +++++-----
 drivers/gpio/gpio-twl6040.c         |  3 +--
 drivers/gpio/gpio-uniphier.c        |  5 ++++-
 drivers/gpio/gpio-wcove.c           |  7 +++++--
 drivers/gpio/gpio-ws16c48.c         |  5 ++++-
 drivers/gpio/gpio-xgene.c           |  5 ++++-
 drivers/gpio/gpio-xra1403.c         |  5 ++++-
 drivers/gpio/gpio-xtensa.c          |  4 ++--
 drivers/gpio/gpio-zynq.c            |  7 +++++--
 drivers/gpio/gpiolib.c              | 16 ++++++++++++++--
 include/linux/gpio/driver.h         |  3 +++
 62 files changed, 228 insertions(+), 104 deletions(-)

-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
