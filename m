Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 431721308CE
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:35:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5E821871;
	Sun,  5 Jan 2020 16:34:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5E821871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578238533;
	bh=58U7pKvlSXuKMuW6VC85G2wGYmgiBttYE/KNX1oOKmM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JE3FTByAtB2X2kkF9i9YjKEHdJ/Ui18DHVZROt+d6WdP0DoBrVIliHeTGJxGtZGbj
	 0yYzVHX28+bRza4JNPS5qkEP3mDJyJUQwGnmbaIRBDk2L44+ttTz/UhSxpkzVlvSeY
	 /UT+8zkkJOrlptlFPRiy+Iv0MqNlycLqdZqpxf/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91869F805FB;
	Sun,  5 Jan 2020 15:50:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87CEDF803FA; Sun,  5 Jan 2020 15:50:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_MED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1489BF80303
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1489BF80303
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 11AFCB15E
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:34 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:48:04 +0100
Message-Id: <20200105144823.29547-50-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 49/68] ALSA: gus: More constifications
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

Apply const prefix to each possible place: the static resource tables,
the volume table, etc.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/gus/gus_io.c     |  2 +-
 sound/isa/gus/gus_main.c   |  4 ++--
 sound/isa/gus/gus_volume.c |  9 +++++----
 sound/isa/gus/gusclassic.c |  6 +++---
 sound/isa/gus/gusextreme.c | 10 +++++-----
 sound/isa/gus/gusmax.c     |  6 +++---
 sound/isa/gus/interwave.c  | 10 +++++-----
 7 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/sound/isa/gus/gus_io.c b/sound/isa/gus/gus_io.c
index 0ab550bc80f2..fb7b5e2636b8 100644
--- a/sound/isa/gus/gus_io.c
+++ b/sound/isa/gus/gus_io.c
@@ -403,7 +403,7 @@ void snd_gf1_select_active_voices(struct snd_gus_card * gus)
 {
 	unsigned short voices;
 
-	static unsigned short voices_tbl[32 - 14 + 1] =
+	static const unsigned short voices_tbl[32 - 14 + 1] =
 	{
 	    44100, 41160, 38587, 36317, 34300, 32494, 30870, 29400, 28063, 26843,
 	    25725, 24696, 23746, 22866, 22050, 21289, 20580, 19916, 19293
diff --git a/sound/isa/gus/gus_main.c b/sound/isa/gus/gus_main.c
index e9fc333c0fcb..afc088f0377c 100644
--- a/sound/isa/gus/gus_main.c
+++ b/sound/isa/gus/gus_main.c
@@ -267,9 +267,9 @@ static int snd_gus_init_dma_irq(struct snd_gus_card * gus, int latches)
 	struct snd_card *card;
 	unsigned long flags;
 	int irq, dma1, dma2;
-	static unsigned char irqs[16] =
+	static const unsigned char irqs[16] =
 		{0, 0, 1, 3, 0, 2, 0, 4, 0, 1, 0, 5, 6, 0, 0, 7};
-	static unsigned char dmas[8] =
+	static const unsigned char dmas[8] =
 		{6, 1, 0, 2, 0, 3, 4, 5};
 
 	if (snd_BUG_ON(!gus))
diff --git a/sound/isa/gus/gus_volume.c b/sound/isa/gus/gus_volume.c
index 39a2e5bd6c0a..ed72196a361b 100644
--- a/sound/isa/gus/gus_volume.c
+++ b/sound/isa/gus/gus_volume.c
@@ -62,7 +62,7 @@ unsigned int snd_gf1_calc_ramp_rate(struct snd_gus_card * gus,
 				    unsigned short end,
 				    unsigned int us)
 {
-	static unsigned char vol_rates[19] =
+	static const unsigned char vol_rates[19] =
 	{
 		23, 24, 26, 28, 29, 31, 32, 34,
 		36, 37, 39, 40, 42, 44, 45, 47,
@@ -113,7 +113,7 @@ unsigned short snd_gf1_translate_freq(struct snd_gus_card * gus, unsigned int fr
 
 short snd_gf1_compute_vibrato(short cents, unsigned short fc_register)
 {
-	static short vibrato_table[] =
+	static const short vibrato_table[] =
 	{
 		0, 0, 32, 592, 61, 1175, 93, 1808,
 		124, 2433, 152, 3007, 182, 3632, 213, 4290,
@@ -121,7 +121,8 @@ short snd_gf1_compute_vibrato(short cents, unsigned short fc_register)
 	};
 
 	long depth;
-	short *vi1, *vi2, pcents, v1;
+	const short *vi1, *vi2;
+	short pcents, v1;
 
 	pcents = cents < 0 ? -cents : cents;
 	for (vi1 = vibrato_table, vi2 = vi1 + 2; pcents > *vi2; vi1 = vi2, vi2 += 2);
@@ -145,7 +146,7 @@ short snd_gf1_compute_vibrato(short cents, unsigned short fc_register)
 
 unsigned short snd_gf1_compute_pitchbend(unsigned short pitchbend, unsigned short sens)
 {
-	static long log_table[] = {1024, 1085, 1149, 1218, 1290, 1367, 1448, 1534, 1625, 1722, 1825, 1933};
+	static const long log_table[] = {1024, 1085, 1149, 1218, 1290, 1367, 1448, 1534, 1625, 1722, 1825, 1933};
 	int wheel, sensitivity;
 	unsigned int mantissa, f1, f2;
 	unsigned short semitones, f1_index, f2_index, f1_power, f2_power;
diff --git a/sound/isa/gus/gusclassic.c b/sound/isa/gus/gusclassic.c
index f7e869771d16..7419b1939754 100644
--- a/sound/isa/gus/gusclassic.c
+++ b/sound/isa/gus/gusclassic.c
@@ -67,9 +67,9 @@ static int snd_gusclassic_create(struct snd_card *card,
 				 struct device *dev, unsigned int n,
 				 struct snd_gus_card **rgus)
 {
-	static long possible_ports[] = {0x220, 0x230, 0x240, 0x250, 0x260};
-	static int possible_irqs[] = {5, 11, 12, 9, 7, 15, 3, 4, -1};
-	static int possible_dmas[] = {5, 6, 7, 1, 3, -1};
+	static const long possible_ports[] = {0x220, 0x230, 0x240, 0x250, 0x260};
+	static const int possible_irqs[] = {5, 11, 12, 9, 7, 15, 3, 4, -1};
+	static const int possible_dmas[] = {5, 6, 7, 1, 3, -1};
 
 	int i, error;
 
diff --git a/sound/isa/gus/gusextreme.c b/sound/isa/gus/gusextreme.c
index 8cf366bbdd8d..ed2f9d64efae 100644
--- a/sound/isa/gus/gusextreme.c
+++ b/sound/isa/gus/gusextreme.c
@@ -83,9 +83,9 @@ static int snd_gusextreme_es1688_create(struct snd_card *card,
 					struct snd_es1688 *chip,
 					struct device *dev, unsigned int n)
 {
-	static long possible_ports[] = {0x220, 0x240, 0x260};
-	static int possible_irqs[] = {5, 9, 10, 7, -1};
-	static int possible_dmas[] = {1, 3, 0, -1};
+	static const long possible_ports[] = {0x220, 0x240, 0x260};
+	static const int possible_irqs[] = {5, 9, 10, 7, -1};
+	static const int possible_dmas[] = {1, 3, 0, -1};
 
 	int i, error;
 
@@ -122,8 +122,8 @@ static int snd_gusextreme_gus_card_create(struct snd_card *card,
 					  struct device *dev, unsigned int n,
 					  struct snd_gus_card **rgus)
 {
-	static int possible_irqs[] = {11, 12, 15, 9, 5, 7, 3, -1};
-	static int possible_dmas[] = {5, 6, 7, 3, 1, -1};
+	static const int possible_irqs[] = {11, 12, 15, 9, 5, 7, 3, -1};
+	static const int possible_dmas[] = {5, 6, 7, 3, 1, -1};
 
 	if (gf1_irq[n] == SNDRV_AUTO_IRQ) {
 		gf1_irq[n] = snd_legacy_find_free_irq(possible_irqs);
diff --git a/sound/isa/gus/gusmax.c b/sound/isa/gus/gusmax.c
index efe576625f48..05cd9be4dd8a 100644
--- a/sound/isa/gus/gusmax.c
+++ b/sound/isa/gus/gusmax.c
@@ -191,8 +191,8 @@ static int snd_gusmax_match(struct device *pdev, unsigned int dev)
 
 static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 {
-	static int possible_irqs[] = {5, 11, 12, 9, 7, 15, 3, -1};
-	static int possible_dmas[] = {5, 6, 7, 1, 3, -1};
+	static const int possible_irqs[] = {5, 11, 12, 9, 7, 15, 3, -1};
+	static const int possible_dmas[] = {5, 6, 7, 1, 3, -1};
 	int xirq, xdma1, xdma2, err;
 	struct snd_card *card;
 	struct snd_gus_card *gus = NULL;
@@ -241,7 +241,7 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 				     pcm_channels[dev],
 				     0, &gus);
 	} else {
-		static unsigned long possible_ports[] = {
+		static const unsigned long possible_ports[] = {
 			0x220, 0x230, 0x240, 0x250, 0x260
 		};
 		int i;
diff --git a/sound/isa/gus/interwave.c b/sound/isa/gus/interwave.c
index 5cd4aa477ba7..3e9ad930deae 100644
--- a/sound/isa/gus/interwave.c
+++ b/sound/isa/gus/interwave.c
@@ -364,7 +364,7 @@ struct rom_hdr {
 
 static void snd_interwave_detect_memory(struct snd_gus_card *gus)
 {
-	static unsigned int lmc[13] =
+	static const unsigned int lmc[13] =
 	{
 		0x00000001, 0x00000101, 0x01010101, 0x00000401,
 		0x04040401, 0x00040101, 0x04040101, 0x00000004,
@@ -475,7 +475,7 @@ static void snd_interwave_init(int dev, struct snd_gus_card *gus)
 
 }
 
-static struct snd_kcontrol_new snd_interwave_controls[] = {
+static const struct snd_kcontrol_new snd_interwave_controls[] = {
 WSS_DOUBLE("Master Playback Switch", 0,
 		CS4231_LINE_LEFT_OUTPUT, CS4231_LINE_RIGHT_OUTPUT, 7, 7, 1, 1),
 WSS_DOUBLE("Master Playback Volume", 0,
@@ -788,8 +788,8 @@ static int snd_interwave_isa_probe(struct device *pdev,
 				   unsigned int dev)
 {
 	int err;
-	static int possible_irqs[] = {5, 11, 12, 9, 7, 15, 3, -1};
-	static int possible_dmas[] = {0, 1, 3, 5, 6, 7, -1};
+	static const int possible_irqs[] = {5, 11, 12, 9, 7, 15, 3, -1};
+	static const int possible_dmas[] = {0, 1, 3, 5, 6, 7, -1};
 
 	if (irq[dev] == SNDRV_AUTO_IRQ) {
 		if ((irq[dev] = snd_legacy_find_free_irq(possible_irqs)) < 0) {
@@ -813,7 +813,7 @@ static int snd_interwave_isa_probe(struct device *pdev,
 	if (port[dev] != SNDRV_AUTO_PORT)
 		return snd_interwave_isa_probe1(dev, pdev);
 	else {
-		static long possible_ports[] = {0x210, 0x220, 0x230, 0x240, 0x250, 0x260};
+		static const long possible_ports[] = {0x210, 0x220, 0x230, 0x240, 0x250, 0x260};
 		int i;
 		for (i = 0; i < ARRAY_SIZE(possible_ports); i++) {
 			port[dev] = possible_ports[i];
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
