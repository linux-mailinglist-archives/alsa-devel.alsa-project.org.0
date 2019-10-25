Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C23C8E4855
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 12:14:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4761117B9;
	Fri, 25 Oct 2019 12:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4761117B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571998443;
	bh=aEK6WmttgyLea1pwrzN77Ng6Ka/SY1fr0Tt6rYo0Epc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hs3yHjVJqcQFm/0j/hBPyTmJESKsVitm285laeqIQu7lwsse669g5q2JFgeQQvjwN
	 rOOTiDfkt+4DUoXPQMeh+KXoMcA+kumt7EZpPrTAnv3US/v/TkUBDHVdANW2NePzXu
	 Dx0jWOEbuCVhEXIohqC+JfyTT/PdvA6o79CNyVf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2308DF805FD;
	Fri, 25 Oct 2019 12:12:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9654FF805FD; Fri, 25 Oct 2019 12:12:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE10FF80112
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 12:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE10FF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="w9XbI4Vt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=SshFH95hlvnohJa9NKLS6Cf2fJ2qBzDlAgOlmqIfTKM=; b=w9XbI4Vt67gR
 Ja/tZ9IXUqWXXEHb4sreas4M7HNAtDRlxbyl3Om+EIGpt+UQuJcMbwIixGWL5rjwvk7vHL2Jqpqvx
 qvylhr8HjuvHYsCSxf97K3SSzj2MSj/0is4eCkDg2Qfk6d5Sj26nWhZa/y1fQV3pbWqS6dxHH8ez/
 7fpy0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNwZo-0006e0-Rl; Fri, 25 Oct 2019 10:12:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 582B3274326E; Fri, 25 Oct 2019 11:12:12 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <20191024151603.29043-1-geert+renesas@glider.be>
X-Patchwork-Hint: ignore
Message-Id: <20191025101212.582B3274326E@ypsilon.sirena.org.uk>
Date: Fri, 25 Oct 2019 11:12:12 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Jiri Kosina <trivial@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: Spelling s/configr/configur/" to the
	asoc tree
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

   ASoC: Spelling s/configr/configur/

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

From c19255659b6ed952948ce54a260efb2ad950cc54 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Thu, 24 Oct 2019 17:16:03 +0200
Subject: [PATCH] ASoC: Spelling s/configr/configur/

Fix misspellings of "configuration" and "configure".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://lore.kernel.org/r/20191024151603.29043-1-geert+renesas@glider.be
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/wm8904.h     | 2 +-
 sound/soc/codecs/cx2072x.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/wm8904.h b/include/sound/wm8904.h
index 14074405f501..88ac1870510e 100644
--- a/include/sound/wm8904.h
+++ b/include/sound/wm8904.h
@@ -120,7 +120,7 @@
  * DRC configurations are specified with a label and a set of register
  * values to write (the enable bits will be ignored).  At runtime an
  * enumerated control will be presented for each DRC block allowing
- * the user to choose the configration to use.
+ * the user to choose the configuration to use.
  *
  * Configurations may be generated by hand or by using the DRC control
  * panel provided by the WISCE - see  http://www.wolfsonmicro.com/wisce/
diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 1c1ba7bea4d8..2ad00ed21bec 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1507,7 +1507,7 @@ static int cx2072x_probe(struct snd_soc_component *codec)
 	regmap_multi_reg_write(cx2072x->regmap, cx2072x_reg_init,
 			       ARRAY_SIZE(cx2072x_reg_init));
 
-	/* configre PortC as input device */
+	/* configure PortC as input device */
 	regmap_update_bits(cx2072x->regmap, CX2072X_PORTC_PIN_CTRL,
 			   0x20, 0x20);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
