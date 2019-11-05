Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CBEEFCBD
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 12:54:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7449A170A;
	Tue,  5 Nov 2019 12:53:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7449A170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572954841;
	bh=yVRGdkqBK922kkMdcNGwjOE3j7YI9JT5q0rmj2j+jl4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R5nla5Dou6SZds/JI166lVWGzcJWzu9ekccKjcOG3SmjffRM8bP8noAiivBelBBut
	 EMBl8ncLNZTVgpj2mWMlHoC6RxzbCsQiCZNqHd0cxGQHikIuDm9YX6F5B4jVIDBfWP
	 exC8Qx7F1DA0j3B9ndYXLT1Ifbfz985wEKKMSogU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C1C3F8060F;
	Tue,  5 Nov 2019 12:50:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECCA8F8049B; Tue,  5 Nov 2019 11:42:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 603D6F80271
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 11:42:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 603D6F80271
Received: by mail-lj1-f193.google.com with SMTP id r7so12536323ljg.2
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 02:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zJQtw6WsLKIdVwDZMV0Pz6fU4JFtWwFkbgS9iv+/IOA=;
 b=iPIXIKaIC9VXqexp1aCWwWlbteb7fcZPmVie2cv5FVY6vBfuHpqMTZPn+9fpYJnseM
 bPmcBOTv1imBYeSUGAVUWBRPdrh8OoHoPTDoPdGpeR2TB06+pdTdDa/G+yRF65xP12I9
 Oat005Y2QjHgw2r1V6K3s28zwdhgZ4CDo58C4sGNdHGyN6i5DrEo7wjalc/RcYhOIuMb
 jTzoZ1+HdrDPgy0XwJXhJk81gNw5gKcBfvbFdBs4W3xolZkJczVq253fUJa4cT7p6Uo6
 j6ckwAfaMlrB3jxA37dHNqr2B6tzNvYghLCyG3/SJcPEh1/CvN3F/iNRLK0Qd9SJuc0t
 rbcw==
X-Gm-Message-State: APjAAAUDG00fmkThq5ZhqCJdSOpcnvJfk0NJCnAk/NSVVDvumkDiGhHZ
 6+mbTgH0zQEjzrGykPOB9uU=
X-Google-Smtp-Source: APXvYqwOFSWIOcTngdfrUrZTLUT1vT2lZ4x7hyEHAU08t2ea6kvg8p56NtVIkvH7brQqOjIrQEACtw==
X-Received: by 2002:a2e:8e21:: with SMTP id r1mr22778902ljk.81.1572950548332; 
 Tue, 05 Nov 2019 02:42:28 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id z22sm8386482ljm.92.2019.11.05.02.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 02:42:27 -0800 (PST)
Date: Tue, 5 Nov 2019 12:42:21 +0200
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Message-ID: <06aa0acec5797fc5711354d8ecad18bc6e947122.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
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
Subject: [alsa-devel] [PATCH 62/62] gpiolib: Nag for INPUT direction values
 other than GPIO_LINE_DIRECTION_IN
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

It seems that bunch of drivers put some effort (namely use !! or ! when
converting GPIO direction register value to direction) to only return 1
or 0 for direction INPUT/UOTPUT. Others do just return any positive value
they happen to read from register for INPUT. Let's try iron out this habit
by nagging if our cool new definitions GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT are not used.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpiolib.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 104ed299d5ea..ed292498afb6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -226,6 +226,12 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	ret = chip->get_direction(chip, offset);
 	if (ret > 0) {
 		/* GPIOF_DIR_IN, or other positive */
+		if (ret != GPIO_LINE_DIRECTION_IN) {
+			struct gpio_device *gdev = chip->gpiodev;
+
+			dev_warn(&gdev->dev,
+				 "drivers should use GPIO_LINE_DIRECTION_IN\n");
+		}
 		ret = 1;
 		clear_bit(FLAG_IS_OUT, &desc->flags);
 	}
@@ -1389,12 +1395,18 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	for (i = 0; i < chip->ngpio; i++) {
 		struct gpio_desc *desc = &gdev->descs[i];
+		int dir;
 
 		if (chip->get_direction && gpiochip_line_is_valid(chip, i)) {
-			if (!chip->get_direction(chip, i))
+			dir = chip->get_direction(chip, i);
+			if (!dir) {
 				set_bit(FLAG_IS_OUT, &desc->flags);
-			else
+			} else {
+				if (dir != GPIO_LINE_DIRECTION_IN)
+					dev_warn(&gdev->dev,
+						 "drivers should use GPIO_LINE_DIRECTION_IN\n");
 				clear_bit(FLAG_IS_OUT, &desc->flags);
+			}
 		} else {
 			if (!chip->direction_input)
 				set_bit(FLAG_IS_OUT, &desc->flags);
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
