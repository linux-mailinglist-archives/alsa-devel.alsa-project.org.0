Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB76F991C
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 19:51:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82D6111C;
	Tue, 12 Nov 2019 19:50:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82D6111C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573584685;
	bh=ZaoAXk5QTxMeDy9WOwN+bspDLZSbBdtYRb/0jKTpeeE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=T9+iVCidn4Wr+V1aqK6QfY2npTG85BWvFmZOjGHlFuXhtQjKMJ+uiJmXyMQGJOKpS
	 915RQzG8oeMupZHCsLL+SXF2iFHog6gzUvRKREkVzYgyNpZkpPhVFU4rEdsIKF539m
	 AtjYwtHoM4kVWA1kMcNWzLmpo2Fl4hcvYVIt50WA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33FE8F80642;
	Tue, 12 Nov 2019 19:47:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD2CBF8063A; Tue, 12 Nov 2019 19:47:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A59F4F80507
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 19:47:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A59F4F80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="E/uySWWM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=2go5CHqJx/ctxzLloiwM1ScNN+yDH+6GhaR+A8+iHx0=; b=E/uySWWMe0gI
 5+FQ3+ROPNXQzWUqjiJKVkm2F/GoDTTEWxuM/5p6SIpuZpbUSxtCdKTtoqeyb/47Ale83pfQ7Jfxo
 QumD3diK7VXYz6eo6gT9R/Ff37JkG8lpFdP4vE0/eXmcK4N8t2BUzeNZjr1/OCo/OODYlTy5rUi2C
 wsVTk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUbC4-00004y-SI; Tue, 12 Nov 2019 18:47:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 40E0427429FE; Tue, 12 Nov 2019 18:47:12 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r22lhkx8.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191112184712.40E0427429FE@ypsilon.sirena.org.uk>
Date: Tue, 12 Nov 2019 18:47:12 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: merge snd_soc_add_dai_link()
	and soc_bind_dai_link()" to the asoc tree
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

   ASoC: soc-core: merge snd_soc_add_dai_link() and soc_bind_dai_link()

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

From 63dc47da1f396fecd2373e41928e275f9ca3d924 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 6 Nov 2019 10:07:31 +0900
Subject: [PATCH] ASoC: soc-core: merge snd_soc_add_dai_link() and
 soc_bind_dai_link()

We don't need to separete snd_soc_add_dai_link() and
soc_bind_dai_link() anymore. Let's merge these.

One note is that before this patch, it adds list (A)
eventhough if it had dai_link->ignore (1), or already bounded dai_link (2).
But I guess it is wrong. This patch also solve this issue.

/* BEFORE */
	int soc_bind_dai_link(...)
	{
		...
(1)		if (dai_link->ignore)
			return 0;

(2)		if (soc_is_dai_link_bound(...))
			return 0;
		...
	}

	int snd_soc_add_dai_link(...)
	{
		...
=>		ret = soc_bind_dai_link(...);
=>		if (ret < 0)
=>			return ret;

(A)		list_add_tail(&dai_link->list, &card->dai_link_list);
		...
	}

/* AFTER */

	int snd_soc_add_dai_link(...)
	{
		...
(1)		if (dai_link->ignore)
			return 0;

(2)		if (soc_is_dai_link_bound(...))
			return 0;
		...
(A)		list_add_tail(&dai_link->list, &card->dai_link_list);
		return 0;
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87r22lhkx8.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 62 ++++++++++++++++++--------------------------
 1 file changed, 25 insertions(+), 37 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 01a8fb28b48f..8add98431881 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1059,14 +1059,33 @@ static void soc_unbind_dai_link(struct snd_soc_card *card,
 		soc_free_pcm_runtime(rtd);
 }
 
-static int soc_bind_dai_link(struct snd_soc_card *card,
-	struct snd_soc_dai_link *dai_link)
+/**
+ * snd_soc_add_dai_link - Add a DAI link dynamically
+ * @card: The ASoC card to which the DAI link is added
+ * @dai_link: The new DAI link to add
+ *
+ * This function adds a DAI link to the ASoC card's link list.
+ *
+ * Note: Topology can use this API to add DAI links when probing the
+ * topology component. And machine drivers can still define static
+ * DAI links in dai_link array.
+ */
+int snd_soc_add_dai_link(struct snd_soc_card *card,
+			 struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai_link_component *codec, *platform;
 	struct snd_soc_component *component;
 	int i, ret;
 
+	lockdep_assert_held(&client_mutex);
+
+	/*
+	 * Notify the machine driver for extra initialization
+	 */
+	if (card->add_dai_link)
+		card->add_dai_link(card, dai_link);
+
 	if (dai_link->ignore)
 		return 0;
 
@@ -1115,12 +1134,16 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
 		}
 	}
 
+	/* see for_each_card_links */
+	list_add_tail(&dai_link->list, &card->dai_link_list);
+
 	return 0;
 
 _err_defer:
 	soc_free_pcm_runtime(rtd);
 	return -EPROBE_DEFER;
 }
+EXPORT_SYMBOL_GPL(snd_soc_add_dai_link);
 
 static void soc_set_of_name_prefix(struct snd_soc_component *component)
 {
@@ -1411,41 +1434,6 @@ void snd_soc_disconnect_sync(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_soc_disconnect_sync);
 
-/**
- * snd_soc_add_dai_link - Add a DAI link dynamically
- * @card: The ASoC card to which the DAI link is added
- * @dai_link: The new DAI link to add
- *
- * This function adds a DAI link to the ASoC card's link list.
- *
- * Note: Topology can use this API to add DAI links when probing the
- * topology component. And machine drivers can still define static
- * DAI links in dai_link array.
- */
-int snd_soc_add_dai_link(struct snd_soc_card *card,
-		struct snd_soc_dai_link *dai_link)
-{
-	int ret;
-
-	lockdep_assert_held(&client_mutex);
-
-	/*
-	 * Notify the machine driver for extra initialization
-	 */
-	if (card->add_dai_link)
-		card->add_dai_link(card, dai_link);
-
-	ret = soc_bind_dai_link(card, dai_link);
-	if (ret < 0)
-		return ret;
-
-	/* see for_each_card_links */
-	list_add_tail(&dai_link->list, &card->dai_link_list);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(snd_soc_add_dai_link);
-
 /**
  * snd_soc_remove_dai_link - Remove a DAI link from the list
  * @card: The ASoC card that owns the link
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
