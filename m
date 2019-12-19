Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB77A126FC5
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 22:35:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3320784F;
	Thu, 19 Dec 2019 22:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3320784F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576791312;
	bh=H8fla0FY3adt+Xx3j4t1l1iBtGz9k/bC6kPpTkLbXDM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=peRfTbJh0pNpvWK6tmT0CpGKtw/tYIDkGSvoDE/su8nHfOrZGJYckaZvrF+diY+tl
	 azqYwo7o2cgw/kzKT3xBmCmhdYZbGKK0gE2+jWgSHPdSzrpjdFB+CyXcrcv50h2GEI
	 NlTbR/FNjjEQoNYn/2R//JmgpNKeUdjpTcX/Z3Pg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B10AF80266;
	Thu, 19 Dec 2019 22:33:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA183F80259; Thu, 19 Dec 2019 22:33:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A172F8013E
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 22:33:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A172F8013E
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47f4qJ1dwxz1rgD3;
 Thu, 19 Dec 2019 22:33:00 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47f4qJ13Wgz1qr2L;
 Thu, 19 Dec 2019 22:33:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id RHVTxaXA_q6W; Thu, 19 Dec 2019 22:32:59 +0100 (CET)
X-Auth-Info: Q2TjMNxd4xR94wHv4FBSGwJKrL3sd3PZQJKHzOCY//U=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 19 Dec 2019 22:32:59 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: alsa-devel@alsa-project.org
Date: Thu, 19 Dec 2019 22:32:57 +0100
Message-Id: <20191219213257.366145-1-marex@denx.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Igor Opaniuk <igor.opaniuk@toradex.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>, festevam@gmail.com
Subject: [alsa-devel] [PATCH] ASoC: sgtl5000: Fix VDDA and VDDIO comparison
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

Comparing the voltage of VDDA and VDDIO to determine whether or not to
enable VDDC manual override is insufficient. This is a problem in case
the VDDA is supplied from different regulator than VDDIO, while both
report the same voltage to the regulator framework. In that case where
VDDA and VDDIO is supplied by different regulators, the VDDC manual
override must not be applied.

Fixes: b6319b061ba2 ("ASoC: sgtl5000: Fix charge pump source assignment")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---
 sound/soc/codecs/sgtl5000.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 93da6b58c97df..b4568f417d78e 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -28,6 +28,8 @@
 
 #include "sgtl5000.h"
 
+#include "../../../drivers/regulator/internal.h"
+
 #define SGTL5000_DAP_REG_OFFSET	0x0100
 #define SGTL5000_MAX_REG_OFFSET	0x013A
 
@@ -1344,7 +1346,8 @@ static int sgtl5000_set_power_regs(struct snd_soc_component *component)
 		 * if vddio == vdda the source of charge pump should be
 		 * assigned manually to VDDIO
 		 */
-		if (vddio == vdda) {
+		if (sgtl5000->supplies[VDDA].consumer->rdev ==
+		    sgtl5000->supplies[VDDIO].consumer->rdev) {
 			lreg_ctrl |= SGTL5000_VDDC_ASSN_OVRD;
 			lreg_ctrl |= SGTL5000_VDDC_MAN_ASSN_VDDIO <<
 				    SGTL5000_VDDC_MAN_ASSN_SHIFT;
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
