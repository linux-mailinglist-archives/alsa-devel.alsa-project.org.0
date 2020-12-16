Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEB82DBF59
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Dec 2020 12:27:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B15F179E;
	Wed, 16 Dec 2020 12:26:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B15F179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608118045;
	bh=UyldxBFdLzj10sV5PQGFDw09JdzGQsCJfBCkmubOPNU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BK4Z6tGxFdv5lsjKe7li7kPccdeD1hYmA+vvnBJ1gP5ujysEAK4IoUvRj1wh9CGuf
	 rG0OwbQmbC9w6YrbgJ/YSWz0mztwCE3nB+1jtECnHKHaaaLjugduvFugPzJLwc1MrY
	 E+wYY1NcKphkZ0I4gjgFZoJGHxhFdcAfPv/8JHBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4FCDF80274;
	Wed, 16 Dec 2020 12:26:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1244F80272; Wed, 16 Dec 2020 12:26:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3422F801F7
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 12:26:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3422F801F7
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kpUwb-0003B8-76; Wed, 16 Dec 2020 11:26:09 +0000
From: Colin King <colin.king@canonical.com>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ASoC: atmel: fix spelling mistake in Kconfig "programable" ->
 "programmable"
Date: Wed, 16 Dec 2020 11:26:08 +0000
Message-Id: <20201216112608.11385-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

There are a couple of spelling mistakes in the Kconfig help text. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/atmel/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index 142373ec411a..9fe9471f4514 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -143,7 +143,7 @@ config SND_MCHP_SOC_SPDIFTX
 	  - sama7g5
 
 	  This S/PDIF TX driver is compliant with IEC-60958 standard and
-	  includes programable User Data and Channel Status fields.
+	  includes programmable User Data and Channel Status fields.
 
 config SND_MCHP_SOC_SPDIFRX
 	tristate "Microchip ASoC driver for boards using S/PDIF RX"
@@ -157,5 +157,5 @@ config SND_MCHP_SOC_SPDIFRX
 	  - sama7g5
 
 	  This S/PDIF RX driver is compliant with IEC-60958 standard and
-	  includes programable User Data and Channel Status fields.
+	  includes programmable User Data and Channel Status fields.
 endif
-- 
2.29.2

