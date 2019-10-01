Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1262C370E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 16:22:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C995167D;
	Tue,  1 Oct 2019 16:21:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C995167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569939768;
	bh=6ZiOwYBv5jPq4AYhij72GWX69WHAD3yU5gwD0ljpi00=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=csPR5lefNGT/j+WxEwAJu3N0dABaZPwDz+CvjZj24Y9U7dnPR4NsCiZglCRGX00M2
	 8gCX3O5ca+jw31xpFEnF/lZoojmnfaMb/X78bVXvIolNkdGxfarhFiKS6HnLqDQ95x
	 70E8FXgREKLtdKm97BcDoLGX2NMyvZYpRPjCZFFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E44EF80519;
	Tue,  1 Oct 2019 16:21:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 565B4F80506; Tue,  1 Oct 2019 16:21:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B780BF800DE
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 16:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B780BF800DE
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MHoVE-1iKFDt0sgo-00ExaL; Tue, 01 Oct 2019 16:20:31 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue,  1 Oct 2019 16:20:09 +0200
Message-Id: <20191001142026.1124917-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:hL/OrOqx1oO4Bmp86kRM00tNRZ3chWT/eTPxi4JaUrsImLSXYp7
 i+qhAnFRG6eViMZ5TNl46bk0rixPpe+lc1OET7BF5YF7A071moylb49GvEj4GDKarj0uC0+
 ZU+hnVbZdw2WlCiPsgBt8jo3E/gi5h3MNgOBHDOJ3oB6ufIx8rjPWbFJglcQSltdef+vZ+z
 vb+eFvoyJkEdMHXsRPfSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UD9CBuUg62g=:c9PbZz2InB7poesIjc/J/C
 JDvhs0OAUieNXQYRdSS/AETOv3aLuELWRzX420aQAkLscCBi3TzXaYL5Je/C5Hm+pDziHPC+f
 c8/qVlqXWZtXwbsyGdhRNrkj5uwl96NnLUAmarjmwh68CXMZ4J5Wlk7oaKCVyRQTR1xHpL8LY
 qQmtbXueO1sAQqJOPbZ0gmzdpEn38ToU3i5ZPMCEdaGPjtjc6wZNAsBEpzCXzbM0wvamttdRp
 qFL00i6GPGw5UoBa93WdO4uW80+vaP2nutw/LwKluTurpcYBUxW8pAbE8fhr1w1RYRxhKVxt3
 HT+/vR6HrFTBo7WDfY+MbBySCYD++0Wdz0QsEkdWJLm7ctUU9hzcJqBTMIKjAGdaVpo37d3AD
 mRNIvoKo62Q4/zz8HhMoU0FQdSetGcri26tevKkt9l4KikSL4wOuPsST0tr69YqVrgcVgzF22
 +V1yiuUtuLwAt/ugNS6K6nKEqEJvVj4RBXVMM65FY/cjPMTxqDrCWBbqqeOBj7vhoLHMvE8St
 NFOraaDm6HFe+AkhgJARAGBMLUYhnge9RaJBRR25cyJyxaRE0LUUIBEKUzPp4HSO1nsFtEWuQ
 9Bkw1DY/URAci10xnfO4M3F5hP1e+OOcmOlhE+V8vtziqpcgbdCU9OZ1YbkOnq0pEVJ08CSYc
 rc/ngKrFD5pK+v45Kh1oKYzooYfgrtaaXRAdzZmKGka4RXtGgn7etgDRNjSM/XaWxgK0XmKkw
 Sp/xgUJie7+imAetJyXn6jXjV14HtyyqgV4WUPsCFFXwibYETjtOLmrT3eXFMYpC12WseKotV
 jpdjAT5MMl/74tC5GVYZpp1hjPswSP3wr1EcRlaWd58P0++zn5yiuZJagiOEELf8bYtx7wUqI
 /B4b2Dbt883pMpM4aFqA==
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Hulk Robot <hulkci@huawei.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH] ASoC: SOF: imx: fix reverse
	CONFIG_SND_SOC_SOF_OF dependency
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

CONFIG_SND_SOC_SOF_IMX depends on CONFIG_SND_SOC_SOF, but is in
turn referenced by the sof-of-dev driver. This creates a reverse
dependency that manifests in a link error when CONFIG_SND_SOC_SOF_OF
is built-in but CONFIG_SND_SOC_SOF_IMX=m:

sound/soc/sof/sof-of-dev.o:(.data+0x118): undefined reference to `sof_imx8_ops'

Make the latter a 'bool' symbol and change the Makefile so the imx8
driver is compiled the same way as the driver using it.

A nicer way would be to reverse the layering and move all
the imx specific bits of sof-of-dev.c into the imx driver
itself, which can then call into the common code. Doing this
would need more testing and can be done if we add another
driver like the first one.

Fixes: f4df4e4042b0 ("ASoC: SOF: imx8: Fix COMPILE_TEST error")
Fixes: 202acc565a1f ("ASoC: SOF: imx: Add i.MX8 HW support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/sof/imx/Kconfig  | 2 +-
 sound/soc/sof/imx/Makefile | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 5acae75f5750..a3891654a1fc 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -12,7 +12,7 @@ config SND_SOC_SOF_IMX_TOPLEVEL
 if SND_SOC_SOF_IMX_TOPLEVEL
 
 config SND_SOC_SOF_IMX8
-	tristate "SOF support for i.MX8"
+	bool "SOF support for i.MX8"
 	depends on IMX_SCU
 	depends on IMX_DSP
 	help
diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
index 6ef908e8c807..9e8f35df0ff2 100644
--- a/sound/soc/sof/imx/Makefile
+++ b/sound/soc/sof/imx/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
 snd-sof-imx8-objs := imx8.o
 
-obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
+ifdef CONFIG_SND_SOC_SOF_IMX8
+obj-$(CONFIG_SND_SOC_SOF_OF) += snd-sof-imx8.o
+endif
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
