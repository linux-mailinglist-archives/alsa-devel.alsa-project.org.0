Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF388697E2B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 15:18:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49A2382E;
	Wed, 15 Feb 2023 15:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49A2382E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676470732;
	bh=FKbIkbBN7U2L+EHEW52xFzvXWOkU5BnB6J9xahaWK8o=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SYs3RXrg7yMmyeQ8Ir5zQgrbFeR7J2O3m8DNXQQB2NA8Tm04orqZ8M+vWil1YsIXY
	 dQYkWyOEc3DUlCr2GfIen647ccIy8JLUhWqE8byv7wOEutFSy/3rSrfY8BhwZ20bTO
	 TwlDbqtBaJW3GhkD5jUieppjAGslMtPZcQi6EkMM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABB94F801C0;
	Wed, 15 Feb 2023 15:18:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39C82F8047C; Wed, 15 Feb 2023 15:17:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA7BAF80083
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 15:17:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA7BAF80083
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:2521:459c:4528:7ba9])
	by michel.telenet-ops.be with bizsmtp
	id MSHq2900B4e7GJY06SHq5p; Wed, 15 Feb 2023 15:17:51 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pSIbA-00966q-QN;
	Wed, 15 Feb 2023 15:17:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pSIbW-004cmb-Ft;
	Wed, 15 Feb 2023 15:17:50 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: rsnd: adg: Fix BRG typos
Date: Wed, 15 Feb 2023 15:17:41 +0100
Message-Id: 
 <ac6365c17861d71fbc89d823089db4aafdb763ed.1676470202.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UN6FLBYAOVLXCRPNSWPNN5W27F3NZ3AC
X-Message-ID-Hash: UN6FLBYAOVLXCRPNSWPNN5W27F3NZ3AC
X-MailFrom: geert@linux-m68k.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UN6FLBYAOVLXCRPNSWPNN5W27F3NZ3AC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

"BRG" stands for "Baud Rate Generator", but is frequently misspelled as
"RBG".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 sound/soc/sh/rcar/adg.c | 64 ++++++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index 7bc4421835d7261f..0b8926600d900a68 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -39,10 +39,10 @@ struct rsnd_adg {
 	int clkin_size;
 	int clkout_size;
 	u32 ckr;
-	u32 rbga;
-	u32 rbgb;
+	u32 brga;
+	u32 brgb;
 
-	int rbg_rate[ADG_HZ_SIZE]; /* RBGA / RBGB */
+	int brg_rate[ADG_HZ_SIZE]; /* BRGA / BRGB */
 };
 
 #define for_each_rsnd_clkin(pos, adg, i)	\
@@ -75,7 +75,7 @@ static const char * const clkout_name_gen2[] = {
 	[CLKOUT3] = "audio_clkout3",
 };
 
-static u32 rsnd_adg_calculate_rbgx(unsigned long div)
+static u32 rsnd_adg_calculate_brgx(unsigned long div)
 {
 	int i;
 
@@ -131,8 +131,8 @@ static void __rsnd_adg_get_timesel_ratio(struct rsnd_priv *priv,
 		adg->clkin_rate[CLKA],	/* 0000: CLKA */
 		adg->clkin_rate[CLKB],	/* 0001: CLKB */
 		adg->clkin_rate[CLKC],	/* 0010: CLKC */
-		adg->rbg_rate[ADG_HZ_441],	/* 0011: RBGA */
-		adg->rbg_rate[ADG_HZ_48],	/* 0100: RBGB */
+		adg->brg_rate[ADG_HZ_441],	/* 0011: BRGA */
+		adg->brg_rate[ADG_HZ_48],	/* 0100: BRGB */
 	};
 
 	min = ~0;
@@ -323,10 +323,10 @@ int rsnd_adg_clk_query(struct rsnd_priv *priv, unsigned int rate)
 	/*
 	 * find divided clock from BRGA/BRGB
 	 */
-	if (rate == adg->rbg_rate[ADG_HZ_441])
+	if (rate == adg->brg_rate[ADG_HZ_441])
 		return 0x10;
 
-	if (rate == adg->rbg_rate[ADG_HZ_48])
+	if (rate == adg->brg_rate[ADG_HZ_48])
 		return 0x20;
 
 	return -EIO;
@@ -358,13 +358,13 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 		ckr = 0x80000000; /* BRGB output = 48kHz */
 
 	rsnd_mod_bset(adg_mod, BRGCKR, 0x80770000, adg->ckr | ckr);
-	rsnd_mod_write(adg_mod, BRRA,  adg->rbga);
-	rsnd_mod_write(adg_mod, BRRB,  adg->rbgb);
+	rsnd_mod_write(adg_mod, BRRA,  adg->brga);
+	rsnd_mod_write(adg_mod, BRRB,  adg->brgb);
 
 	dev_dbg(dev, "CLKOUT is based on BRG%c (= %dHz)\n",
 		(ckr) ? 'B' : 'A',
-		(ckr) ?	adg->rbg_rate[ADG_HZ_48] :
-			adg->rbg_rate[ADG_HZ_441]);
+		(ckr) ?	adg->brg_rate[ADG_HZ_48] :
+			adg->brg_rate[ADG_HZ_441]);
 
 	return 0;
 }
@@ -484,7 +484,7 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *np = dev->of_node;
 	struct property *prop;
-	u32 ckr, rbgx, rbga, rbgb;
+	u32 ckr, brgx, brga, brgb;
 	u32 rate, div;
 	u32 req_rate[ADG_HZ_SIZE] = {};
 	uint32_t count = 0;
@@ -501,8 +501,8 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 	};
 
 	ckr = 0;
-	rbga = 2; /* default 1/6 */
-	rbgb = 2; /* default 1/6 */
+	brga = 2; /* default 1/6 */
+	brgb = 2; /* default 1/6 */
 
 	/*
 	 * ADG supports BRRA/BRRB output only
@@ -543,30 +543,30 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 		if (0 == rate) /* not used */
 			continue;
 
-		/* RBGA */
-		if (!adg->rbg_rate[ADG_HZ_441] && (0 == rate % 44100)) {
+		/* BRGA */
+		if (!adg->brg_rate[ADG_HZ_441] && (0 == rate % 44100)) {
 			div = 6;
 			if (req_Hz[ADG_HZ_441])
 				div = rate / req_Hz[ADG_HZ_441];
-			rbgx = rsnd_adg_calculate_rbgx(div);
-			if (BRRx_MASK(rbgx) == rbgx) {
-				rbga = rbgx;
-				adg->rbg_rate[ADG_HZ_441] = rate / div;
+			brgx = rsnd_adg_calculate_brgx(div);
+			if (BRRx_MASK(brgx) == brgx) {
+				brga = brgx;
+				adg->brg_rate[ADG_HZ_441] = rate / div;
 				ckr |= brg_table[i] << 20;
 				if (req_Hz[ADG_HZ_441])
 					parent_clk_name = __clk_get_name(clk);
 			}
 		}
 
-		/* RBGB */
-		if (!adg->rbg_rate[ADG_HZ_48] && (0 == rate % 48000)) {
+		/* BRGB */
+		if (!adg->brg_rate[ADG_HZ_48] && (0 == rate % 48000)) {
 			div = 6;
 			if (req_Hz[ADG_HZ_48])
 				div = rate / req_Hz[ADG_HZ_48];
-			rbgx = rsnd_adg_calculate_rbgx(div);
-			if (BRRx_MASK(rbgx) == rbgx) {
-				rbgb = rbgx;
-				adg->rbg_rate[ADG_HZ_48] = rate / div;
+			brgx = rsnd_adg_calculate_brgx(div);
+			if (BRRx_MASK(brgx) == brgx) {
+				brgb = brgx;
+				adg->brg_rate[ADG_HZ_48] = rate / div;
 				ckr |= brg_table[i] << 16;
 				if (req_Hz[ADG_HZ_48])
 					parent_clk_name = __clk_get_name(clk);
@@ -620,8 +620,8 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 
 rsnd_adg_get_clkout_end:
 	adg->ckr = ckr;
-	adg->rbga = rbga;
-	adg->rbgb = rbgb;
+	adg->brga = brga;
+	adg->brgb = brgb;
 
 	return 0;
 
@@ -663,9 +663,9 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 			__clk_get_name(clk), clk, clk_get_rate(clk));
 
 	dbg_msg(dev, m, "BRGCKR = 0x%08x, BRRA/BRRB = 0x%x/0x%x\n",
-		adg->ckr, adg->rbga, adg->rbgb);
-	dbg_msg(dev, m, "BRGA (for 44100 base) = %d\n", adg->rbg_rate[ADG_HZ_441]);
-	dbg_msg(dev, m, "BRGB (for 48000 base) = %d\n", adg->rbg_rate[ADG_HZ_48]);
+		adg->ckr, adg->brga, adg->brgb);
+	dbg_msg(dev, m, "BRGA (for 44100 base) = %d\n", adg->brg_rate[ADG_HZ_441]);
+	dbg_msg(dev, m, "BRGB (for 48000 base) = %d\n", adg->brg_rate[ADG_HZ_48]);
 
 	/*
 	 * Actual CLKOUT will be exchanged in rsnd_adg_ssi_clk_try_start()
-- 
2.34.1

