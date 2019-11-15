Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02906FE25B
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 17:11:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B3D01667;
	Fri, 15 Nov 2019 17:10:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B3D01667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573834263;
	bh=nxDAPW585FBOW1EoVvgXVagr8upDl7cbuVzJNwlWOGA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qnXhH9jmFPpp07abJpvI5x+SJzFU7CUc1cdWwSa6zWHTzeysg9HMN8aU/k0oWNBCV
	 fMo4sG8O45eDlVHEFrUv7XCAoY5A64/s6kzVrgs8Ewg58N7VF0AtWyGssZyt9Ks7qy
	 Fxfaap3LCpoB24Av7MnInUH3fBeFbPQFSdJMlBhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5DB0F8010B;
	Fri, 15 Nov 2019 17:08:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E468EF80105; Fri, 15 Nov 2019 17:08:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45615F800CC
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:08:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45615F800CC
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.lab.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1iVe90-0002S6-MC; Fri, 15 Nov 2019 17:08:22 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1iVe8y-00047G-6i; Fri, 15 Nov 2019 17:08:20 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: robh+dt@kernel.org, KCHSU0@nuvoton.com, broonie@kernel.org,
 thomas.fehrenbacher@siedle.de
Date: Fri, 15 Nov 2019 17:08:18 +0100
Message-Id: <20191115160819.15557-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191115160819.15557-1-m.felsch@pengutronix.de>
References: <20191115160819.15557-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel@pengutronix.de
Subject: [alsa-devel] [PATCH 2/3] ASoC: nau8810: add support for nau8812
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

The nau8812 device [1] uses exactly the same register layout as the
nau8810 so there is no need to differentiate those. The only difference
is the output power and an additional aux-port input on the nau8812.
The registers related to the aux-port don't affect the nau8810 in a
negative way. They are just ignored (set to '0').

[1] http://www.nuvoton.com/resource-files/NAU8812DatasheetRev2.7.pdf

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 sound/soc/codecs/Kconfig   | 2 +-
 sound/soc/codecs/nau8810.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 229cc89f8c5a..d13a2e5d0afb 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1470,7 +1470,7 @@ config SND_SOC_NAU8540
        depends on I2C
 
 config SND_SOC_NAU8810
-	tristate "Nuvoton Technology Corporation NAU88C10 CODEC"
+	tristate "Nuvoton Technology Corporation NAU88C10/12 CODEC"
 	depends on I2C
 
 config SND_SOC_NAU8822
diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index de26758c30a8..a32a4a8d5f50 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -862,6 +862,7 @@ static int nau8810_i2c_probe(struct i2c_client *i2c,
 
 static const struct i2c_device_id nau8810_i2c_id[] = {
 	{ "nau8810", 0 },
+	{ "nau8812", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nau8810_i2c_id);
@@ -869,6 +870,7 @@ MODULE_DEVICE_TABLE(i2c, nau8810_i2c_id);
 #ifdef CONFIG_OF
 static const struct of_device_id nau8810_of_match[] = {
 	{ .compatible = "nuvoton,nau8810", },
+	{ .compatible = "nuvoton,nau8812", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, nau8810_of_match);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
