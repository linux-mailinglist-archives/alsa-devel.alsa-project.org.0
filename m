Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B791F1188
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 09:55:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB3B716B2;
	Wed,  6 Nov 2019 09:55:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB3B716B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573030556;
	bh=I9txAEDTyV9oPZh2k37wvyO0vFAF+35cCej/y7Rhut8=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S+I00tCuo1nXE/vhOs4nU2bVH+sAaGSdFZuvLNKFayBq2TUEkkNu1ufGkPvzdq0vr
	 ABrsGMOmZggcRUqlcXNfbz3MEuso4Y3595vqpAbPTYFXXAUca7DkFJdMQUcnKTyGfW
	 Mvw9YTpAZ3/PQAZgN2pFUJv+WtfN5crlAcE7CGyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57916F8060E;
	Wed,  6 Nov 2019 09:52:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36620F803D0; Wed,  6 Nov 2019 09:51:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91432F800F3
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 09:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91432F800F3
Received: by mail-lj1-f194.google.com with SMTP id 139so25164005ljf.1
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 00:51:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=c3nnHozNVo33X9zO/QL+5QpZZS5/E8q0Yvon3W4ua40=;
 b=KgP12X1s7f5Uzws2LiUtUliZYPD/G5oOlFi/ls8g7+VjO8zr6+QTSir566yj5Jj36s
 Hy3kz1eYGG3J3u9J4DmfE9i8934q3RNcG65Mcm89ojBuSi8mmKMDLxW44eof+RLs2rFf
 TMsRbLKV1M0m86Rs9ghklkehhlzzgaJFqwB3WT4lRBNJbOs09HLL6uSX9DQTbhiYUhiA
 yofMwBVq/gdJGAaaR0DXl7jhqBOQhe5I4+bmvavGJHHqpSOVGbaLqzAbBm+VBRNrWkhW
 /okLnm+/UdnJI/y9keOQ+JMII3ZUIkEYq2S4x/B5oEPGwMjRumloywK+cc8sbI4D/Z1G
 oAsQ==
X-Gm-Message-State: APjAAAX406gOO/HfMiBo2nnW0TWGo3fgwu5sXHeccMNN4CvoP1b+J668
 NgnOKW29Iwj15yTZM4Bm674=
X-Google-Smtp-Source: APXvYqy367nB+V0F1e2toQfvmNROyVnp/ORoMN537PDITKvukOhmV78ubJvC9dv5Gfr74RPoFLhXVg==
X-Received: by 2002:a2e:3e18:: with SMTP id l24mr1039173lja.48.1573030281406; 
 Wed, 06 Nov 2019 00:51:21 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id u12sm10608459lje.1.2019.11.06.00.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 00:51:20 -0800 (PST)
Date: Wed, 6 Nov 2019 10:51:06 +0200
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Message-ID: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Wed, 06 Nov 2019 09:52:36 +0100
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
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
 Sascha Hauer <s.hauer@pengutronix.de>,
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
Subject: [alsa-devel] [PATCH v2 0/2] Add definition for GPIO direction
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

This idea comes from RFC series for ROHM BD71828 PMIC and was initially
discussed with Linus Walleij here:
https://lore.kernel.org/lkml/c06725c3dd34118a324907137758d8b85b3d4043.camel@fi.rohmeurope.com/
but as this has no dependencies to BD71828 work (which probably takes a
while) I decided to make it independent series.

Patches are compile-tested only. I have no HW to really test them. Thus I'd
appreciate carefull review. This work is mainly about converting zeros
and ones to the new defines but it wouldn't be first time I get it
wrong.

Changelog v2:
 - squashed patches 2-61 into patch 2.
 - dropped patch 62 (can be applied later)
 - rebased (cherry-picked) changes on top of GPIO devel branch.

Patch 1:
 - adds the defines
Patch 2:
 - convert drivers to use new defines

This patch series is based on GPIO tree devel branch.

---

Matti Vaittinen (2):
  gpio: Add definition for GPIO direction
  gpio: Use new GPIO_LINE_DIRECTION

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
 include/linux/gpio/driver.h         |  3 +++
 61 files changed, 214 insertions(+), 102 deletions(-)

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
