Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F462EFEDD
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 14:41:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87C391704;
	Tue,  5 Nov 2019 14:41:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87C391704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572961314;
	bh=GC2GHEJF3z5x8AeYThCyFg2BNQrbikcJ2v7B5kHqgKY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bHlLHlap3ZyahPLpaAfUAVHa58LHGYh/lNiuCyT0Fe0p4sD3y4+JoihbKFhemyHhJ
	 fSlX9hQu5rAmVpz1wwMEiWo090Fjp8iUfG+4/seFHIErGji4iE2W0F127bNIoH2Sjz
	 fnbn9V0elbpYDtE6Lk/PGgr55fCSKhFtJhn7rFq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82B64F80637;
	Tue,  5 Nov 2019 14:38:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EA57F8049B; Tue,  5 Nov 2019 14:11:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80A2FF80271
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 14:11:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80A2FF80271
Received: by mail-lf1-f65.google.com with SMTP id q28so15110810lfa.5
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 05:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l8Im5R3FQ0f+QIAnNwvzY4o+9bLtjTOzR+ED97CX0bQ=;
 b=Ggi0kUu9YYeSFrCLOY3TArWmAXMSY7FtCDMkhTgwEUqY0S4IskpWmFCHM+0j9huwxo
 u4WtiertstU8Q0hs2+CLU9+7BD6o1fC5qw1WjEBrqvP78u60kaf3RedKluWumRT375Z1
 ELg6XEZBunzbd9qpgwiSksRoiLlOrM8uuSUpmRlE6X8BCLWjn4zzDINURm//S4cEUFF0
 FOPLEzrKUW8uGxGz1aXW2a7dMHeUpjf/vcJ8EKjGR96DqWGtOSyWofO2h3Z9+Oka/2Lm
 7ptVGX510Eizv3CRCyZwngJnhIjx1vHI5lrr0CU3nZIblLQPR/7BPg7Xwu90P4aMs1+v
 optg==
X-Gm-Message-State: APjAAAVuzvltBIRn/fHELtlCV1za42Ak4J19WMrTaM5JlOWnqC3FcXAK
 /E2FTkXeK0yhsfuq75NZAGM=
X-Google-Smtp-Source: APXvYqxG8YUAy+DwKkIGY9cWv77NiqqeBDme3G0xG3YGsXTNlOyWrcCj6kB+mRP7VfBCxP+SG4zG9Q==
X-Received: by 2002:a19:5010:: with SMTP id e16mr7124449lfb.49.1572959468332; 
 Tue, 05 Nov 2019 05:11:08 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id z22sm8538198ljm.92.2019.11.05.05.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 05:11:07 -0800 (PST)
Date: Tue, 5 Nov 2019 15:10:54 +0200
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Message-ID: <9e233d62cc282f3b03196d638f2188d9ab394b75.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 05 Nov 2019 14:38:15 +0100
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
Subject: [alsa-devel] [RESEND PATCH 01/62] gpio: Add definition for GPIO
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

At least for me it is difficult to remember the meaning of GPIO
direction values. Define GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT so that occasional GPIO contributors would
not need to always check the meaning of hard coded values 1 and 0.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Sorry for folks. I do resend this single patch as this was intended
to be sent for _all_ reviewers. I accidentally did originally send
this only to those the get_maintainer.py listed for this patch.

 include/linux/gpio/driver.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 5dd9c982e2cb..cc9ade4552d9 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -22,6 +22,9 @@ enum gpio_lookup_flags;
 
 struct gpio_chip;
 
+#define GPIO_LINE_DIRECTION_IN	1
+#define GPIO_LINE_DIRECTION_OUT	0
+
 /**
  * struct gpio_irq_chip - GPIO interrupt controller
  */
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
