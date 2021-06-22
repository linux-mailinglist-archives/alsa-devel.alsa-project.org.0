Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 426DA3B0535
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 14:51:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1DED1674;
	Tue, 22 Jun 2021 14:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1DED1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624366304;
	bh=ECXAJtbalSay+Qd0eaUuhl/WG7f9fngW4KybbUdEXHA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a+unnWqLna4Je8srHMstU5aKjvkoQsF+Mw8/j+Uw8pXI51N//9xBWgQwgU7RTAvFb
	 HI1IQEv9X/T0LJMYfbTIoavABUi6nAGibrnYNtqpPDpttiioRDt1oyNochazEf4aBW
	 O5QbL3f+Ta9rg06k91fqnXTiWQ0dafWDVv9HFbaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06CE0F8026A;
	Tue, 22 Jun 2021 14:50:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95497F80268; Tue, 22 Jun 2021 14:50:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A024BF80161
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 14:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A024BF80161
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6C6C21A0E58;
 Tue, 22 Jun 2021 14:50:07 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 65EF81A0E88;
 Tue, 22 Jun 2021 14:50:03 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 199354024D;
 Tue, 22 Jun 2021 20:49:58 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_spdif: Fix unexpected interrupt after suspend
Date: Tue, 22 Jun 2021 20:31:24 +0800
Message-Id: <1624365084-7934-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

When system enter suspend, the machine driver suspend callback
function will be called, then the cpu driver trigger callback
(SNDRV_PCM_TRIGGER_SUSPEND) be called, it would disable the
interrupt.

But the machine driver suspend and cpu dai driver suspend order
maybe changed, the cpu dai driver's suspend callback is called before
machine driver's suppend callback, then the interrupt is not cleared
successfully in trigger callback.

So need to clear interrupts in cpu dai driver's suspend callback
to avoid such issue.

Fixes: 9cb2b3796e08 ("ASoC: fsl_spdif: Add pm runtime function")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_spdif.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index a9c6b930b04a..8ffb1a6048d6 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -1467,6 +1467,9 @@ static int fsl_spdif_runtime_suspend(struct device *dev)
 	struct fsl_spdif_priv *spdif_priv = dev_get_drvdata(dev);
 	int i;
 
+	/* Disable all the interrupts */
+	regmap_update_bits(spdif_priv->regmap, REG_SPDIF_SIE, 0xffffff, 0);
+
 	regmap_read(spdif_priv->regmap, REG_SPDIF_SRPC,
 			&spdif_priv->regcache_srpc);
 	regcache_cache_only(spdif_priv->regmap, true);
-- 
2.27.0

