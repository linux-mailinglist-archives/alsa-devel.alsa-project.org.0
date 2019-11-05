Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 167CBF0AD1
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 01:01:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9056316D8;
	Wed,  6 Nov 2019 01:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9056316D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572998481;
	bh=TZmsvRwXqRtY/N0PQQ7YM+MiJ2MxRth+G3xbfvyqBHg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SjCFKXzTq3/zxGry+bUHHuazqHCRmgpDWRxh9sa2Us93Sp68S2RVrbyRAy38AUbps
	 DWo2sU98+97tq11c7UJGxhcGuuCQ0UGj2Xfaud7vu6G9aewjUeQix7uAkP+yDtpIuu
	 9lvIKRj/aMu7SKj4VrWPSVsjis1aK1QN6p4Kdd5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C795CF8071C;
	Wed,  6 Nov 2019 00:51:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D612DF80659; Wed,  6 Nov 2019 00:51:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79882F8060D
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 00:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79882F8060D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cqu2LarW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=pgXL57elHnGZz+4zE/V1pXxWsA5qV5Jo7PnmWMB98Ew=; b=cqu2LarWfgvy
 gSiYy8D2sLwBrPNs9Xjss903HB2Eda6M4ATaZ1ffn7p7tZ6aQszp0cfiSGld4TTGQ5aBbYBIHZ278
 tAw8/n0k9qyi6VMAOMYCkcyniOcfeI/20Tl3ylEVCjrto4HAP+aXjNGunLrGRCVM9Lvm0kCsCY0af
 2E4Qw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS8ba-00081a-Uy; Tue, 05 Nov 2019 23:51:23 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6BC2D2743280; Tue,  5 Nov 2019 23:51:22 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8736f23jn4.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105235122.6BC2D2743280@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 23:51:22 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: add
	snd_soc_del_component_unlocked()" to the asoc tree
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

   ASoC: soc-core: add snd_soc_del_component_unlocked()

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

From 486c7978ff665eb763f70cc9477e0de6326e1c41 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Nov 2019 15:46:39 +0900
Subject: [PATCH] ASoC: soc-core: add snd_soc_del_component_unlocked()

It is easy to read code if it is cleanly using paired function/naming,
like start <-> stop, register <-> unregister, etc, etc.
But, current ALSA SoC code is very random, unbalance, not paired, etc.
It is easy to create bug at the such code, and is difficult to debug.

Now ALSA SoC has snd_soc_add_component(), but there is no paired
snd_soc_del_component(). Thus, snd_soc_unregister_component() is
calling cleanup function randomly. it is difficult to read.
This patch adds missing snd_soc_del_component_unlocked() and
balance up code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/8736f23jn4.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index acbaed4e4e9d..e91325b688f2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2764,12 +2764,7 @@ static void snd_soc_component_add(struct snd_soc_component *component)
 	mutex_unlock(&client_mutex);
 }
 
-static void snd_soc_component_cleanup(struct snd_soc_component *component)
-{
-	snd_soc_unregister_dais(component);
-}
-
-static void snd_soc_component_del_unlocked(struct snd_soc_component *component)
+static void snd_soc_component_del(struct snd_soc_component *component)
 {
 	struct snd_soc_card *card = component->card;
 
@@ -2823,6 +2818,12 @@ static void snd_soc_try_rebind_card(void)
 			list_del(&card->list);
 }
 
+static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
+{
+	snd_soc_unregister_dais(component);
+	snd_soc_component_del(component);
+}
+
 int snd_soc_add_component(struct device *dev,
 			struct snd_soc_component *component,
 			const struct snd_soc_component_driver *component_driver,
@@ -2855,7 +2856,7 @@ int snd_soc_add_component(struct device *dev,
 	return 0;
 
 err_cleanup:
-	snd_soc_component_cleanup(component);
+	snd_soc_del_component_unlocked(component);
 err_free:
 	return ret;
 }
@@ -2893,15 +2894,12 @@ static int __snd_soc_unregister_component(struct device *dev)
 		if (dev != component->dev)
 			continue;
 
-		snd_soc_component_del_unlocked(component);
+		snd_soc_del_component_unlocked(component);
 		found = 1;
 		break;
 	}
 	mutex_unlock(&client_mutex);
 
-	if (found)
-		snd_soc_component_cleanup(component);
-
 	return found;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
