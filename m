Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A93A55DE
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 14:26:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1581F16D6;
	Mon,  2 Sep 2019 14:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1581F16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567427191;
	bh=eilOvdXLUbFvS2GhKre+yHHlyg7WNoBj/2SKZzwsv48=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gV40O+EMGq7px/DfsPiT+6rZNPckJx11ukiN8tCsMvAfnfqumU9zdojYoKmPIiQ0p
	 N1awPxN28mpBiakriCJv9hpM9F+h1RQxNZRgeWZzmHqWcFitkCL9nOfjK6sgEpBEzl
	 i+ntreDoqO90rYi+h/6eW8A53KrBoFIaUkneNvA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD477F805A9;
	Mon,  2 Sep 2019 14:24:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9783F80448; Mon,  2 Sep 2019 14:23:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0FEFF8011E
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 14:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0FEFF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HgDpxgoC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=n3bv0DNbHFt9TQsui7MEZg0ic3KrForlzwpGY4VViA8=; b=HgDpxgoCVU94
 BgaW3GzpDKtE7fKjX/kQEtlFxTQvr57IZV89NWCGdxG+zTMC2VYKyDIEYHkDkRZZbhdBlgxv7GP/o
 YMN2SPDoxhpSEFNncZFpPnQMYven+vZN7Ubhzq0zX9bwHqNJ/0dwBJ8QbKSKMB7Ib72bnLBwaTPWI
 Z5gwo=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i4lNA-0003By-Uo; Mon, 02 Sep 2019 12:23:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2C1942742CCB; Mon,  2 Sep 2019 13:23:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o90g7lbd.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190902122352.2C1942742CCB@ypsilon.sirena.org.uk>
Date: Mon,  2 Sep 2019 13:23:52 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: move
	soc_probe_link_components() position" to the asoc tree
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

   ASoC: soc-core: move soc_probe_link_components() position

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 6fb035502956ad1f338ca61c057653d5372ffd8c Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 23 Aug 2019 09:58:58 +0900
Subject: [PATCH] ASoC: soc-core: move soc_probe_link_components() position

It is easy to read code if it is cleanly using paired function/naming,
like start <-> stop, register <-> unregister, etc, etc.
But, current ALSA SoC code is very random, unbalance, not paired, etc.
It is easy to create bug at the such code, and it will be difficult to
debug.

soc_probe_link_components() has paired soc_remove_link_components(),
but, these are implemented at different place.
So it is difficult to confirm code.
This patch moves soc_probe_link_components() next to
soc_remove_link_components().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87o90g7lbd.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 8e831ae59eb8..2a166abaade1 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1135,6 +1135,26 @@ static void soc_remove_link_components(struct snd_soc_card *card,
 	}
 }
 
+static int soc_probe_link_components(struct snd_soc_card *card,
+				     struct snd_soc_pcm_runtime *rtd, int order)
+{
+	struct snd_soc_component *component;
+	struct snd_soc_rtdcom_list *rtdcom;
+	int ret;
+
+	for_each_rtdcom(rtd, rtdcom) {
+		component = rtdcom->component;
+
+		if (component->driver->probe_order == order) {
+			ret = soc_probe_component(card, component);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 static void soc_remove_dai_links(struct snd_soc_card *card)
 {
 	int order;
@@ -1379,26 +1399,6 @@ static int soc_rtd_init(struct snd_soc_pcm_runtime *rtd, const char *name)
 	return 0;
 }
 
-static int soc_probe_link_components(struct snd_soc_card *card,
-				     struct snd_soc_pcm_runtime *rtd, int order)
-{
-	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
-	int ret;
-
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
-		if (component->driver->probe_order == order) {
-			ret = soc_probe_component(card, component);
-			if (ret < 0)
-				return ret;
-		}
-	}
-
-	return 0;
-}
-
 static int soc_probe_dai(struct snd_soc_dai *dai, int order)
 {
 	int ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
