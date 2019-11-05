Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93528F0AC6
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 01:00:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 285A716DB;
	Wed,  6 Nov 2019 00:59:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 285A716DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572998402;
	bh=dxmXo7BXPSQICHANA0AhzLHuDBsaw0EpHVEBOg36vPQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KpKv+FqWZbDtklrx2Zd4Ecv3nO33qH7yUXf5vWRyAxvIJfp0RsdrsBkDcdfnptgYM
	 nAlndIuZ+OSQus3iBgtsQA0qJH4hoCFEanM4ByDrqyJDMY9V54S7UQvtTElcvzCd6D
	 4s0ZjogV5WVfF4ak77p1c+Zq014whbgCrZMxArlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A2FEF80709;
	Wed,  6 Nov 2019 00:51:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 547D6F80642; Wed,  6 Nov 2019 00:51:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B79D1F8053B
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 00:51:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B79D1F8053B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NZS9FLdM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=dE62fVUkhyeJBjI7LcvT4s1M06u2firYWVjVN2LghlI=; b=NZS9FLdMhBbJ
 /s4jxxR9Tw6Avb+JBVW9yTL4sYykrF3yVQ4xLL05nz2JChfMLodD8eHkFMm4qwG5+3RnZiwJYixqm
 41hnWTxMMNhNfmmE8lHu0cYIbabqgCxHadjZ7BWvadn3CNyVoBeJlJtuBoAHjW+GpoQ3XgyKC5N/j
 TEGtM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS8bb-00081j-4T; Tue, 05 Nov 2019 23:51:23 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A0E032741915; Tue,  5 Nov 2019 23:51:22 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874kzi3jn8.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105235122.A0E032741915@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 23:51:22 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: tidyup
	snd_soc_lookup_component()" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: soc-core: tidyup snd_soc_lookup_component()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 5bd7e08b3c5f3924259643e1f413e10ca6c97634 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Nov 2019 15:46:35 +0900
Subject: [PATCH] ASoC: soc-core: tidyup snd_soc_lookup_component()

snd_soc_lookup_component() is using mix of continue and break
in the same loop. It is odd.
This patch cleanup it.

Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/874kzi3jn8.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b71bddb30db1..acbaed4e4e9d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -360,25 +360,22 @@ struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
 						   const char *driver_name)
 {
 	struct snd_soc_component *component;
-	struct snd_soc_component *ret;
+	struct snd_soc_component *found_component;
 
-	ret = NULL;
+	found_component = NULL;
 	mutex_lock(&client_mutex);
 	for_each_component(component) {
-		if (dev != component->dev)
-			continue;
-
-		if (driver_name &&
-		    (driver_name != component->driver->name) &&
-		    (strcmp(component->driver->name, driver_name) != 0))
-			continue;
-
-		ret = component;
-		break;
+		if ((dev == component->dev) &&
+		    (!driver_name ||
+		     (driver_name == component->driver->name) ||
+		     (strcmp(component->driver->name, driver_name) == 0))) {
+			found_component = component;
+			break;
+		}
 	}
 	mutex_unlock(&client_mutex);
 
-	return ret;
+	return found_component;
 }
 EXPORT_SYMBOL_GPL(snd_soc_lookup_component);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
