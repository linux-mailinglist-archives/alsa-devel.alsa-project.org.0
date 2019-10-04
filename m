Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0650CC239
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 19:57:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3582F168B;
	Fri,  4 Oct 2019 19:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3582F168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570211871;
	bh=ZuzS86cpOqFv28PtIHjBtEVM+Tvh6k3MCMHqbTLoUQQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=eX7FqjJg/kTNNChWSF52bEGN9D/V0Jc1rYuu831uU6OFXkecJBYvWevJqDAlxypnU
	 qpoEiWJqNHyqAUsZdSK93x1ArnaRPeYCkEExlTuQ+p/IyxAUBAtz8Ghxh2kUeP/koF
	 wBuDveKpLimsjRaNr7Ricj5pUFRfvWhgy96FJEc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67888F8063D;
	Fri,  4 Oct 2019 19:52:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 457C5F805FE; Fri,  4 Oct 2019 19:52:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77153F80377
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 19:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77153F80377
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HkUpiaSm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=oYLVZLWmGAZnFnYmN0rAySi9QjYTZ+Q4UCUl8X/mowI=; b=HkUpiaSmuwxf
 7WnWfahTPCrjVo8eg5u7IteE44hsXFUzHNZNuEAlLAlxKL53etxoaWQgxTWjOw5EidlardFb/esDU
 2kAwrv4JaBqoH4Ip/daD01PSjFx1QZPy1cZ8/lHwsF0hNimGZTQMNaTjUhMO0Bx18turL0CdscOlL
 DHFpQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iGRkp-0003up-Fp; Fri, 04 Oct 2019 17:52:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E712A2741EF2; Fri,  4 Oct 2019 18:52:34 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874l0rbu1i.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191004175234.E712A2741EF2@ypsilon.sirena.org.uk>
Date: Fri,  4 Oct 2019 18:52:34 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: add soc_setup_card_name()" to
	the asoc tree
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

   ASoC: soc-core: add soc_setup_card_name()

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

From 0f23f718ecbc135866ac40db3424dd75f01c76ea Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:22:49 +0900
Subject: [PATCH] ASoC: soc-core: add soc_setup_card_name()

ALSA needs to setup shortname, longname, and driver.
These methods are very similar.
This patch adds new soc_setup_card_name() and setup these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/874l0rbu1i.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 60 +++++++++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a34000d08856..f79ffc4b5b57 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1905,6 +1905,42 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 	}
 }
 
+#define soc_setup_card_name(name, name1, name2, norm)		\
+	__soc_setup_card_name(name, sizeof(name), name1, name2, norm)
+static void __soc_setup_card_name(char *name, int len,
+				  const char *name1, const char *name2,
+				  int normalization)
+{
+	int i;
+
+	snprintf(name, len, "%s", name1 ? name1 : name2);
+
+	if (!normalization)
+		return;
+
+	/*
+	 * Name normalization
+	 *
+	 * The driver name is somewhat special, as it's used as a key for
+	 * searches in the user-space.
+	 *
+	 * ex)
+	 *	"abcd??efg" -> "abcd__efg"
+	 */
+	for (i = 0; i < len; i++) {
+		switch (name[i]) {
+		case '_':
+		case '-':
+		case '\0':
+			break;
+		default:
+			if (!isalnum(name[i]))
+				name[i] = '_';
+			break;
+		}
+	}
+}
+
 static void soc_cleanup_card_resources(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link, *_link;
@@ -2070,24 +2106,12 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	/* try to set some sane longname if DMI is available */
 	snd_soc_set_dmi_name(card, NULL);
 
-	snprintf(card->snd_card->shortname, sizeof(card->snd_card->shortname),
-		 "%s", card->name);
-	snprintf(card->snd_card->longname, sizeof(card->snd_card->longname),
-		 "%s", card->long_name ? card->long_name : card->name);
-	snprintf(card->snd_card->driver, sizeof(card->snd_card->driver),
-		 "%s", card->driver_name ? card->driver_name : card->name);
-	for (i = 0; i < ARRAY_SIZE(card->snd_card->driver); i++) {
-		switch (card->snd_card->driver[i]) {
-		case '_':
-		case '-':
-		case '\0':
-			break;
-		default:
-			if (!isalnum(card->snd_card->driver[i]))
-				card->snd_card->driver[i] = '_';
-			break;
-		}
-	}
+	soc_setup_card_name(card->snd_card->shortname,
+			    card->name, NULL, 0);
+	soc_setup_card_name(card->snd_card->longname,
+			    card->long_name, card->name, 0);
+	soc_setup_card_name(card->snd_card->driver,
+			    card->driver_name, card->name, 1);
 
 	if (card->late_probe) {
 		ret = card->late_probe(card);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
