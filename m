Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 013B371DBB
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 19:31:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90DF8191B;
	Tue, 23 Jul 2019 19:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90DF8191B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563903081;
	bh=XB465CTXR4SwamqxttQJe9ZhHp2uRn+JRStzI2hIw6s=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=oE2eT6gNsEnVL1dJ+CAAu3XdXFx2ZbcZVblMRbTVsiFPRHmZZ6wDIAO7yMPd8guHK
	 s1qU8b+kBY8vFdQ+1YARPI09p5RWUnoODkxQ/iLYI5nmN3j+/ULYGlCcctLb8P1m7P
	 KI9UTo8Bg87JRRpNJTSEYYD2PkQYhPq7RqlFELHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36209F8064C;
	Tue, 23 Jul 2019 19:19:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8339DF8049B; Tue, 23 Jul 2019 19:19:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B4F3F8044B
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 19:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B4F3F8044B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="J2xiaKDr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=wHxpQiDNFmYJ3i82PX+UjldPOgUHXb7lr/LENUqA398=; b=J2xiaKDr79GC
 Ohw9PgW0RJ5TxW/3nppZNWMLfnw7uOjnJthDAlPXSg6TQGI1ipkr8WjDzJzIhFNiJWXvie7ynG7hk
 I3XdORUiprsSUZmqutgQBskVUA0qSFBdt9aZuVCHh/DQ03gjN1wVELF9EIeBb15bjFv3Xq9HLid4j
 3Gego=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpyRC-0004MS-A4; Tue, 23 Jul 2019 17:18:54 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 98F9F2742B59; Tue, 23 Jul 2019 18:18:53 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Timo Wischer <twischer@de.adit-jv.com>
In-Reply-To: <20190722072403.11008-2-jiada_wang@mentor.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723171853.98F9F2742B59@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 18:18:53 +0100 (BST)
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, jiada_wang@mentor.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: rsnd: Support hw_free() callback at DAI
	level" to the asoc tree
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

   ASoC: rsnd: Support hw_free() callback at DAI level

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

From 859fd6cbf1fb32b5428c26f837215c085b8a822e Mon Sep 17 00:00:00 2001
From: Timo Wischer <twischer@de.adit-jv.com>
Date: Mon, 22 Jul 2019 16:24:01 +0900
Subject: [PATCH] ASoC: rsnd: Support hw_free() callback at DAI level

This patch provides the needed infrastructure to support calling hw_free()
at the DAI level. This is for example required to free resources allocated
in hw_params() callback.

The modification of __rsnd_mod_add_hw_params does not have any side
effects because rsnd_mod_ops::hw_params callback is not used by anyone
until now.

Signed-off-by: Timo Wischer <twischer@de.adit-jv.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
Link: https://lore.kernel.org/r/20190722072403.11008-2-jiada_wang@mentor.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/core.c | 16 +++++++++++++++-
 sound/soc/sh/rcar/rsnd.h | 12 +++++++++---
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 56e8dae9a15c..bda5b958d0dc 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1421,6 +1421,20 @@ static int rsnd_hw_params(struct snd_pcm_substream *substream,
 					params_buffer_bytes(hw_params));
 }
 
+static int rsnd_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_dai *dai = rsnd_substream_to_dai(substream);
+	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
+	struct rsnd_dai_stream *io = rsnd_rdai_to_io(rdai, substream);
+	int ret;
+
+	ret = rsnd_dai_call(hw_free, io, substream);
+	if (ret)
+		return ret;
+
+	return snd_pcm_lib_free_pages(substream);
+}
+
 static snd_pcm_uframes_t rsnd_pointer(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_dai *dai = rsnd_substream_to_dai(substream);
@@ -1436,7 +1450,7 @@ static snd_pcm_uframes_t rsnd_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops rsnd_pcm_ops = {
 	.ioctl		= snd_pcm_lib_ioctl,
 	.hw_params	= rsnd_hw_params,
-	.hw_free	= snd_pcm_lib_free_pages,
+	.hw_free	= rsnd_hw_free,
 	.pointer	= rsnd_pointer,
 };
 
diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index 7727add3eb1a..ea6cbaa9743e 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -327,6 +327,9 @@ struct rsnd_mod_ops {
 	int (*cleanup)(struct rsnd_mod *mod,
 		       struct rsnd_dai_stream *io,
 		       struct rsnd_priv *priv);
+	int (*hw_free)(struct rsnd_mod *mod,
+		       struct rsnd_dai_stream *io,
+		       struct snd_pcm_substream *substream);
 	u32 *(*get_status)(struct rsnd_mod *mod,
 			   struct rsnd_dai_stream *io,
 			   enum rsnd_mod_type type);
@@ -351,12 +354,12 @@ struct rsnd_mod {
  *
  * B	0: init		1: quit
  * C	0: start	1: stop
+ * D	0: hw_params	1: hw_free
  *
  * H is always called (see __rsnd_mod_call)
  * H	0: probe	1: remove
  * H	0: pcm_new
  * H	0: fallback
- * H	0: hw_params
  * H	0: pointer
  * H	0: prepare
  * H	0: cleanup
@@ -365,12 +368,13 @@ struct rsnd_mod {
 #define __rsnd_mod_shift_quit		4
 #define __rsnd_mod_shift_start		8
 #define __rsnd_mod_shift_stop		8
+#define __rsnd_mod_shift_hw_params	12
+#define __rsnd_mod_shift_hw_free	12
 #define __rsnd_mod_shift_probe		28 /* always called */
 #define __rsnd_mod_shift_remove		28 /* always called */
 #define __rsnd_mod_shift_irq		28 /* always called */
 #define __rsnd_mod_shift_pcm_new	28 /* always called */
 #define __rsnd_mod_shift_fallback	28 /* always called */
-#define __rsnd_mod_shift_hw_params	28 /* always called */
 #define __rsnd_mod_shift_pointer	28 /* always called */
 #define __rsnd_mod_shift_prepare	28 /* always called */
 #define __rsnd_mod_shift_cleanup	28 /* always called */
@@ -383,10 +387,11 @@ struct rsnd_mod {
 #define __rsnd_mod_add_quit		-1
 #define __rsnd_mod_add_start		 1
 #define __rsnd_mod_add_stop		-1
+#define __rsnd_mod_add_hw_params	1
+#define __rsnd_mod_add_hw_free		-1
 #define __rsnd_mod_add_irq		0
 #define __rsnd_mod_add_pcm_new		0
 #define __rsnd_mod_add_fallback		0
-#define __rsnd_mod_add_hw_params	0
 #define __rsnd_mod_add_pointer		0
 
 #define __rsnd_mod_call_probe		0
@@ -402,6 +407,7 @@ struct rsnd_mod {
 #define __rsnd_mod_call_fallback	0
 #define __rsnd_mod_call_hw_params	0
 #define __rsnd_mod_call_pointer		0
+#define __rsnd_mod_call_hw_free		1
 
 #define rsnd_mod_to_priv(mod)	((mod)->priv)
 #define rsnd_mod_power_on(mod)	clk_enable((mod)->clk)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
