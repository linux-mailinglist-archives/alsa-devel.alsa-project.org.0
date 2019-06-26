Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61784567AF
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 13:34:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC8211675;
	Wed, 26 Jun 2019 13:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC8211675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561548877;
	bh=VplyV9zz+b1KswtSd6EymrY86ptPrqlulKUnTncnrUM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=h1KroJs8Xj6Jfb8RDZjMnxlCHvsi2Sa8SiJMBRP0NcbFIq3XwkwsCODzrM0cBtqxU
	 rBPG1AsrYw382uoFa5+ix0+J+ulc44/F3IHYWRFf5kfs24Pa8kjmXwUgxdpbYpC/NX
	 KvUjECq/Mfguthv28+dzkBY1nIwLSE1UPfFVU7eM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1207AF896EA;
	Wed, 26 Jun 2019 13:32:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E74FF8071F; Wed, 26 Jun 2019 13:32:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8D07F8071F
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 13:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8D07F8071F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="iuV/Pm9h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=1u5ZRMPoj0kMTpFVYfSslLk3rWRnJbFG3bncKK/Up8s=; b=iuV/Pm9h9+pY
 KePq3N9N3wWkI+gjQIHpFIB3EgMCFGlWUmh17ovZRYPa4l53bLAia9OpQEf1AOefTlDwlcoDRFsNn
 Rt9zqelxsD7j2xlf8dme5+TYEZlW+qrBM0pzRT9NavDtKmTGUEKnZX6ilVDKUsvkXSa1heoFyrEE0
 fvQNs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hg6AO-0007mw-LC; Wed, 26 Jun 2019 11:32:44 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 2499844004A; Wed, 26 Jun 2019 12:32:44 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877e99yur2.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190626113244.2499844004A@finisterre.sirena.org.uk>
Date: Wed, 26 Jun 2019 12:32:44 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Hien Dang <hien.dang.eb@renesas.com>, Mark Brown <broonie@kernel.org>,
 Chaoliang Qin <chaoliang.qin.jg@renesas.com>
Subject: [alsa-devel] Applied "ASoC: rsnd: ssiu: tidyup SSI_MODE1/2
	settings" to the asoc tree
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

   ASoC: rsnd: ssiu: tidyup SSI_MODE1/2 settings

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From dfea7b2c5c7eaf657086bb95d61814d7e04d1409 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 26 Jun 2019 10:58:56 +0900
Subject: [PATCH] ASoC: rsnd: ssiu: tidyup SSI_MODE1/2 settings

R-Car Sound can use pin sharing and multi-SSI for
SSI0/1/2/3/4/9.
Because complex HW settings and spaghetti code,
the settings for SSI9 pin sharing with SSI0 doesn't work.

This patch tidyup settings for it.

Reported-by: Hien Dang <hien.dang.eb@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Chaoliang Qin <chaoliang.qin.jg@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/ssiu.c | 92 +++++++++++++++++++---------------------
 1 file changed, 44 insertions(+), 48 deletions(-)

diff --git a/sound/soc/sh/rcar/ssiu.c b/sound/soc/sh/rcar/ssiu.c
index 2347f3404c06..f35d88211887 100644
--- a/sound/soc/sh/rcar/ssiu.c
+++ b/sound/soc/sh/rcar/ssiu.c
@@ -60,11 +60,11 @@ static int rsnd_ssiu_init(struct rsnd_mod *mod,
 			  struct rsnd_priv *priv)
 {
 	struct rsnd_dai *rdai = rsnd_io_to_rdai(io);
-	u32 multi_ssi_slaves = rsnd_ssi_multi_slaves_runtime(io);
+	u32 ssis = rsnd_ssi_multi_slaves_runtime(io);
 	int use_busif = rsnd_ssi_use_busif(io);
 	int id = rsnd_mod_id(mod);
-	u32 mask1, val1;
-	u32 mask2, val2;
+	int is_clk_master = rsnd_rdai_is_clk_master(rdai);
+	u32 val1, val2;
 	int i;
 
 	/* clear status */
@@ -89,57 +89,53 @@ static int rsnd_ssiu_init(struct rsnd_mod *mod,
 	rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);
 
 	/*
-	 * SSI_MODE1
+	 * SSI_MODE1 / SSI_MODE2
+	 *
+	 * FIXME
+	 * sharing/multi with SSI0 are mainly supported
 	 */
-	mask1 = (1 << 4) | (1 << 20);	/* mask sync bit */
-	mask2 = (1 << 4);		/* mask sync bit */
-	val1  = val2  = 0;
-	if (id == 8) {
-		/*
-		 * SSI8 pin is sharing with SSI7, nothing to do.
-		 */
-	} else if (rsnd_ssi_is_pin_sharing(io)) {
-		int shift = -1;
-
-		switch (id) {
-		case 1:
-			shift = 0;
-			break;
-		case 2:
-			shift = 2;
-			break;
-		case 4:
-			shift = 16;
-			break;
-		default:
-			return -EINVAL;
-		}
-
-		mask1 |= 0x3 << shift;
-		val1 = rsnd_rdai_is_clk_master(rdai) ?
-			0x2 << shift : 0x1 << shift;
+	val1 = rsnd_mod_read(mod, SSI_MODE1);
+	val2 = rsnd_mod_read(mod, SSI_MODE2);
+	if (rsnd_ssi_is_pin_sharing(io)) {
 
-	} else if (multi_ssi_slaves) {
+		ssis |= (1 << id);
 
-		mask2 |= 0x00000007;
-		mask1 |= 0x0000000f;
-
-		switch (multi_ssi_slaves) {
-		case 0x0206: /* SSI0/1/2/9 */
-			val2 = (1 << 4) | /* SSI0129 sync */
-				(rsnd_rdai_is_clk_master(rdai) ? 0x2 : 0x1);
-			/* fall through */
-		case 0x0006: /* SSI0/1/2 */
-			val1 = rsnd_rdai_is_clk_master(rdai) ?
-				0xa : 0x5;
+	} else if (ssis) {
+		/*
+		 * Multi SSI
+		 *
+		 * set synchronized bit here
+		 */
 
-			if (!val2)  /* SSI012 sync */
-				val1 |= (1 << 4);
-		}
+		/* SSI4 is synchronized with SSI3 */
+		if (ssis & (1 << 4))
+			val1 |= (1 << 20);
+		/* SSI012 are synchronized */
+		if (ssis == 0x0006)
+			val1 |= (1 << 4);
+		/* SSI0129 are synchronized */
+		if (ssis == 0x0206)
+			val2 |= (1 << 4);
 	}
 
-	rsnd_mod_bset(mod, SSI_MODE1, mask1, val1);
-	rsnd_mod_bset(mod, SSI_MODE2, mask2, val2);
+	/* SSI1 is sharing pin with SSI0 */
+	if (ssis & (1 << 1))
+		val1 |= is_clk_master ? 0x2 : 0x1;
+
+	/* SSI2 is sharing pin with SSI0 */
+	if (ssis & (1 << 2))
+		val1 |= is_clk_master ?	0x2 << 2 :
+					0x1 << 2;
+	/* SSI4 is sharing pin with SSI3 */
+	if (ssis & (1 << 4))
+		val1 |= is_clk_master ? 0x2 << 16 :
+					0x1 << 16;
+	/* SSI9 is sharing pin with SSI0 */
+	if (ssis & (1 << 9))
+		val2 |= is_clk_master ? 0x2 : 0x1;
+
+	rsnd_mod_bset(mod, SSI_MODE1, 0x0013001f, val1);
+	rsnd_mod_bset(mod, SSI_MODE2, 0x00000017, val2);
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
