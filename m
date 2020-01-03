Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA4112F56A
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:27:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF37E172D;
	Fri,  3 Jan 2020 09:26:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF37E172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578040032;
	bh=Z9D6F4h3MiPGMIfxdZBDrophu7KCd6OerJ10ENfoRGU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cvRG4Vm+fZTxYx6fS0dMhCctIpYzYtx3c5DouUZ9URE102MoqN7C0wdH5McR3BIJ/
	 Oc9IPk9vAvdm7Wjq6XyWoaeqvp10xJwYJjfKZ58aWhwvtOqqk2qfeoSUKbR8+vCzrC
	 3qwsANjI3+uSdRISDz47pALeRiA4+nCupSkX53w4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 550EBF80299;
	Fri,  3 Jan 2020 09:18:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9018CF80331; Fri,  3 Jan 2020 09:17:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FA3EF8015F
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FA3EF8015F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0C3E7B22E
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:25 +0100
Message-Id: <20200103081714.9560-10-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 09/58] ALSA: pci: Constify snd_device_ops
	definitions
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

Now we may declare const for snd_device_ops definitions, so let's do
it for optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ac97/ac97_codec.c         | 4 ++--
 sound/pci/ad1889.c                  | 2 +-
 sound/pci/ak4531_codec.c            | 2 +-
 sound/pci/ali5451/ali5451.c         | 2 +-
 sound/pci/als300.c                  | 2 +-
 sound/pci/atiixp.c                  | 2 +-
 sound/pci/atiixp_modem.c            | 2 +-
 sound/pci/au88x0/au88x0.c           | 2 +-
 sound/pci/aw2/aw2-alsa.c            | 2 +-
 sound/pci/azt3328.c                 | 2 +-
 sound/pci/bt87x.c                   | 2 +-
 sound/pci/ca0106/ca0106_main.c      | 2 +-
 sound/pci/cmipci.c                  | 2 +-
 sound/pci/cs4281.c                  | 2 +-
 sound/pci/cs46xx/cs46xx_lib.c       | 2 +-
 sound/pci/cs5530.c                  | 2 +-
 sound/pci/cs5535audio/cs5535audio.c | 2 +-
 sound/pci/ctxfi/ctatc.c             | 2 +-
 sound/pci/echoaudio/echoaudio.c     | 2 +-
 sound/pci/emu10k1/emu10k1_main.c    | 2 +-
 sound/pci/emu10k1/emu10k1x.c        | 2 +-
 sound/pci/ens1370.c                 | 2 +-
 sound/pci/es1938.c                  | 2 +-
 sound/pci/es1968.c                  | 2 +-
 sound/pci/fm801.c                   | 2 +-
 sound/pci/ice1712/ice1712.c         | 2 +-
 sound/pci/ice1712/ice1724.c         | 2 +-
 sound/pci/intel8x0.c                | 2 +-
 sound/pci/intel8x0m.c               | 2 +-
 sound/pci/korg1212/korg1212.c       | 2 +-
 sound/pci/lola/lola.c               | 2 +-
 sound/pci/lx6464es/lx6464es.c       | 2 +-
 sound/pci/maestro3.c                | 2 +-
 sound/pci/mixart/mixart.c           | 2 +-
 sound/pci/nm256/nm256.c             | 2 +-
 sound/pci/pcxhr/pcxhr.c             | 2 +-
 sound/pci/riptide/riptide.c         | 2 +-
 sound/pci/sis7019.c                 | 2 +-
 sound/pci/sonicvibes.c              | 2 +-
 sound/pci/trident/trident_main.c    | 2 +-
 sound/pci/via82xx.c                 | 2 +-
 sound/pci/via82xx_modem.c           | 2 +-
 sound/pci/vx222/vx222.c             | 2 +-
 sound/pci/ymfpci/ymfpci_main.c      | 2 +-
 44 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index 66f6c3bf08e3..41bdec4249e1 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -1899,7 +1899,7 @@ int snd_ac97_bus(struct snd_card *card, int num, struct snd_ac97_bus_ops *ops,
 {
 	int err;
 	struct snd_ac97_bus *bus;
-	static struct snd_device_ops dev_ops = {
+	static const struct snd_device_ops dev_ops = {
 		.dev_free =	snd_ac97_bus_dev_free,
 	};
 
@@ -1999,7 +1999,7 @@ int snd_ac97_mixer(struct snd_ac97_bus *bus, struct snd_ac97_template *template,
 	unsigned long end_time;
 	unsigned int reg;
 	const struct ac97_codec_id *pid;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_ac97_dev_free,
 		.dev_register =	snd_ac97_dev_register,
 		.dev_disconnect =	snd_ac97_dev_disconnect,
diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index 7770157a3a8c..3daa978263f6 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -847,7 +847,7 @@ snd_ad1889_create(struct snd_card *card,
 	int err;
 
 	struct snd_ad1889 *chip;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_ad1889_dev_free,
 	};
 
diff --git a/sound/pci/ak4531_codec.c b/sound/pci/ak4531_codec.c
index 7fa8106b5010..fbf9a93a8053 100644
--- a/sound/pci/ak4531_codec.c
+++ b/sound/pci/ak4531_codec.c
@@ -371,7 +371,7 @@ int snd_ak4531_mixer(struct snd_card *card,
 	unsigned int idx;
 	int err;
 	struct snd_ak4531 *ak4531;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_ak4531_dev_free,
 	};
 
diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 434077527b95..39c33a944e5d 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -2046,7 +2046,7 @@ static int snd_ali_create(struct snd_card *card,
 	struct snd_ali *codec;
 	int i, err;
 	unsigned short cmdw;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_ali_dev_free,
         };
 
diff --git a/sound/pci/als300.c b/sound/pci/als300.c
index 6573a2259cb6..64d978307755 100644
--- a/sound/pci/als300.c
+++ b/sound/pci/als300.c
@@ -617,7 +617,7 @@ static int snd_als300_create(struct snd_card *card,
 	void *irq_handler;
 	int err;
 
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_als300_dev_free,
 	};
 	*rchip = NULL;
diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index 684b4f18e52c..61ae4fe8d646 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -1557,7 +1557,7 @@ static int snd_atiixp_create(struct snd_card *card,
 			     struct pci_dev *pci,
 			     struct atiixp **r_chip)
 {
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_atiixp_dev_free,
 	};
 	struct atiixp *chip;
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index 40cda5c3bfeb..b62cde3a00b2 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -1187,7 +1187,7 @@ static int snd_atiixp_create(struct snd_card *card,
 			     struct pci_dev *pci,
 			     struct atiixp_modem **r_chip)
 {
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_atiixp_dev_free,
 	};
 	struct atiixp_modem *chip;
diff --git a/sound/pci/au88x0/au88x0.c b/sound/pci/au88x0/au88x0.c
index c9e0159af2b1..be276fb3f5af 100644
--- a/sound/pci/au88x0/au88x0.c
+++ b/sound/pci/au88x0/au88x0.c
@@ -142,7 +142,7 @@ snd_vortex_create(struct snd_card *card, struct pci_dev *pci, vortex_t ** rchip)
 {
 	vortex_t *chip;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_vortex_dev_free,
 	};
 
diff --git a/sound/pci/aw2/aw2-alsa.c b/sound/pci/aw2/aw2-alsa.c
index 819b148573a6..b3be98e33845 100644
--- a/sound/pci/aw2/aw2-alsa.c
+++ b/sound/pci/aw2/aw2-alsa.c
@@ -223,7 +223,7 @@ static int snd_aw2_create(struct snd_card *card,
 {
 	struct aw2 *chip;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_aw2_dev_free,
 	};
 
diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index b36e7a64e268..810d5772f097 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -2355,7 +2355,7 @@ snd_azf3328_create(struct snd_card *card,
 {
 	struct snd_azf3328 *chip;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =     snd_azf3328_dev_free,
 	};
 	u8 dma_init;
diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index 2e16604c31ce..ece3f8971145 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -705,7 +705,7 @@ static int snd_bt87x_create(struct snd_card *card,
 {
 	struct snd_bt87x *chip;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_bt87x_dev_free
 	};
 
diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index a14e9b1e50b0..e65154cecad5 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -1595,7 +1595,7 @@ static int snd_ca0106_create(int dev, struct snd_card *card,
 	struct snd_ca0106 *chip;
 	struct snd_ca0106_details *c;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_ca0106_dev_free,
 	};
 
diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 266c4cf28b78..ff5525722d58 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -2976,7 +2976,7 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 {
 	struct cmipci *cm;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_cmipci_dev_free,
 	};
 	unsigned int val;
diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index e7294b9d2cb6..75450e329cee 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -1304,7 +1304,7 @@ static int snd_cs4281_create(struct snd_card *card,
 	struct cs4281 *chip;
 	unsigned int tmp;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_cs4281_dev_free,
 	};
 
diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index adfc750bc61c..6251fa8da939 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -3864,7 +3864,7 @@ int snd_cs46xx_create(struct snd_card *card,
 	struct snd_cs46xx_region *region;
 	struct cs_card_type *cp;
 	u16 ss_card, ss_vendor;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_cs46xx_dev_free,
 	};
 	
diff --git a/sound/pci/cs5530.c b/sound/pci/cs5530.c
index 3ab7ec565071..20b4faea50a6 100644
--- a/sound/pci/cs5530.c
+++ b/sound/pci/cs5530.c
@@ -104,7 +104,7 @@ static int snd_cs5530_create(struct snd_card *card,
 	void __iomem *mem;
 	int err;
 
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_cs5530_dev_free,
 	};
 	*rchip = NULL;
diff --git a/sound/pci/cs5535audio/cs5535audio.c b/sound/pci/cs5535audio/cs5535audio.c
index 15126aff63fc..930c2ac405e5 100644
--- a/sound/pci/cs5535audio/cs5535audio.c
+++ b/sound/pci/cs5535audio/cs5535audio.c
@@ -261,7 +261,7 @@ static int snd_cs5535audio_create(struct snd_card *card,
 	struct cs5535audio *cs5535au;
 
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_cs5535audio_dev_free,
 	};
 
diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index 055a71b0a643..8d92154ac262 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -1669,7 +1669,7 @@ int ct_atc_create(struct snd_card *card, struct pci_dev *pci,
 		  struct ct_atc **ratc)
 {
 	struct ct_atc *atc;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = atc_dev_free,
 	};
 	int err;
diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index abad652a4006..dae3a853a6e1 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -1856,7 +1856,7 @@ static int snd_echo_create(struct snd_card *card,
 	struct echoaudio *chip;
 	int err;
 	size_t sz;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_echo_dev_free,
 	};
 
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 65e9ec94b807..6a8fce8ac218 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -1791,7 +1791,7 @@ int snd_emu10k1_create(struct snd_card *card,
 	size_t page_table_size;
 	unsigned int silent_page;
 	const struct snd_emu_chip_details *c;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_emu10k1_dev_free,
 	};
 
diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index 6467142ec460..90ae1c72d663 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -886,7 +886,7 @@ static int snd_emu10k1x_create(struct snd_card *card,
 	struct emu10k1x *chip;
 	int err;
 	int ch;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_emu10k1x_dev_free,
 	};
 
diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 378141aa7c7d..7611e44e2af5 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -2041,7 +2041,7 @@ static int snd_ensoniq_create(struct snd_card *card,
 {
 	struct ensoniq *ensoniq;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_ensoniq_dev_free,
 	};
 
diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index d9fba07d36d0..9d5568509387 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -1548,7 +1548,7 @@ static int snd_es1938_create(struct snd_card *card,
 {
 	struct es1938 *chip;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_es1938_dev_free,
 	};
 
diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index 3610aa1da94c..43cfdf02048b 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -2656,7 +2656,7 @@ static int snd_es1968_create(struct snd_card *card,
 			     int radio_nr,
 			     struct es1968 **chip_ret)
 {
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_es1968_dev_free,
 	};
 	struct es1968 *chip;
diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index 152fbc352123..bb5cffee5dac 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -1183,7 +1183,7 @@ static int snd_fm801_create(struct snd_card *card,
 {
 	struct fm801 *chip;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_fm801_dev_free,
 	};
 
diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index ffacf5e6ac9a..15cb90dceeb8 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2474,7 +2474,7 @@ static int snd_ice1712_create(struct snd_card *card,
 {
 	struct snd_ice1712 *ice;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_ice1712_dev_free,
 	};
 
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 14e4da08adfd..628b0581a4ff 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2502,7 +2502,7 @@ static int snd_vt1724_create(struct snd_card *card,
 {
 	struct snd_ice1712 *ice;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_vt1724_dev_free,
 	};
 
diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index f88008465c44..563f3a3e820e 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -2897,7 +2897,7 @@ static int snd_intel8x0_create(struct snd_card *card,
 	unsigned int i;
 	unsigned int int_sta_masks;
 	struct ichdev *ichdev;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_intel8x0_dev_free,
 	};
 
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 2f73b45c845c..c6dc36167a01 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -1079,7 +1079,7 @@ static int snd_intel8x0m_create(struct snd_card *card,
 	unsigned int i;
 	unsigned int int_sta_masks;
 	struct ichdev *ichdev;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_intel8x0m_dev_free,
 	};
 	static struct ich_reg_info intel_regs[2] = {
diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 5d48ff0b32a7..f605926a0709 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -2153,7 +2153,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci,
         struct snd_korg1212 * korg1212;
 	const struct firmware *dsp_code;
 
-        static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
                 .dev_free = snd_korg1212_dev_free,
         };
 
diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
index e7c620caa935..cdd8db79bcfa 100644
--- a/sound/pci/lola/lola.c
+++ b/sound/pci/lola/lola.c
@@ -559,7 +559,7 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci,
 	struct lola *chip;
 	int err;
 	unsigned int dever;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = lola_dev_free,
 	};
 
diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
index 7f6b1c6c2afe..b92ea074ff2a 100644
--- a/sound/pci/lx6464es/lx6464es.c
+++ b/sound/pci/lx6464es/lx6464es.c
@@ -938,7 +938,7 @@ static int snd_lx6464es_create(struct snd_card *card,
 	struct lx6464es *chip;
 	int err;
 
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_lx6464es_dev_free,
 	};
 
diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index 9f75cc0c01dd..b94e3ec5f158 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -2522,7 +2522,7 @@ snd_m3_create(struct snd_card *card, struct pci_dev *pci,
 	struct snd_m3 *chip;
 	int i, err;
 	const struct snd_pci_quirk *quirk;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_m3_dev_free,
 	};
 
diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
index 18124bd97d80..44009c555322 100644
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -1030,7 +1030,7 @@ static int snd_mixart_create(struct mixart_mgr *mgr, struct snd_card *card, int
 {
 	int err;
 	struct snd_mixart *chip;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_mixart_chip_dev_free,
 	};
 
diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index 5da28b0adbd9..003a09788572 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -1471,7 +1471,7 @@ snd_nm256_create(struct snd_card *card, struct pci_dev *pci,
 {
 	struct nm256 *chip;
 	int err, pval;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_nm256_dev_free,
 	};
 	u32 addr;
diff --git a/sound/pci/pcxhr/pcxhr.c b/sound/pci/pcxhr/pcxhr.c
index f4330832e520..9e59d591217b 100644
--- a/sound/pci/pcxhr/pcxhr.c
+++ b/sound/pci/pcxhr/pcxhr.c
@@ -1179,7 +1179,7 @@ static int pcxhr_create(struct pcxhr_mgr *mgr,
 {
 	int err;
 	struct snd_pcxhr *chip;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = pcxhr_chip_dev_free,
 	};
 
diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index af6956e26c29..6617bc347bfb 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1824,7 +1824,7 @@ snd_riptide_create(struct snd_card *card, struct pci_dev *pci,
 	struct snd_riptide *chip;
 	struct riptideport *hwport;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = snd_riptide_dev_free,
 	};
 
diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index 515598e3cacf..2e351bf1d792 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -1280,7 +1280,7 @@ static int sis_chip_create(struct snd_card *card,
 {
 	struct sis7019 *sis = card->private_data;
 	struct voice *voice;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free = sis_dev_free,
 	};
 	int rc;
diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
index a2bff9431512..dcdf5a534c4e 100644
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -1221,7 +1221,7 @@ static int snd_sonicvibes_create(struct snd_card *card,
 	struct sonicvibes *sonic;
 	unsigned int dmaa, dmac;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_sonicvibes_dev_free,
 	};
 
diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
index 0d039eacbf0a..ba4a9fcd5eba 100644
--- a/sound/pci/trident/trident_main.c
+++ b/sound/pci/trident/trident_main.c
@@ -3487,7 +3487,7 @@ int snd_trident_create(struct snd_card *card,
 	int i, err;
 	struct snd_trident_voice *voice;
 	struct snd_trident_pcm_mixer *tmix;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_trident_dev_free,
 	};
 
diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index e72050a9ffdb..090b0c47fbdd 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -2332,7 +2332,7 @@ static int snd_via82xx_create(struct snd_card *card,
 {
 	struct via82xx *chip;
 	int err;
-        static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_via82xx_dev_free,
         };
 
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index 4e0858f8e372..7f138fa4e141 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -1074,7 +1074,7 @@ static int snd_via82xx_create(struct snd_card *card,
 {
 	struct via82xx_modem *chip;
 	int err;
-        static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_via82xx_dev_free,
         };
 
diff --git a/sound/pci/vx222/vx222.c b/sound/pci/vx222/vx222.c
index bc451224df16..b278c72797d5 100644
--- a/sound/pci/vx222/vx222.c
+++ b/sound/pci/vx222/vx222.c
@@ -128,7 +128,7 @@ static int snd_vx222_create(struct snd_card *card, struct pci_dev *pci,
 	struct vx_core *chip;
 	struct snd_vx222 *vx;
 	int i, err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_vx222_dev_free,
 	};
 	struct snd_vx_ops *vx_ops;
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 3bc92d236508..2e20cd9d8cfc 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -2327,7 +2327,7 @@ int snd_ymfpci_create(struct snd_card *card,
 {
 	struct snd_ymfpci *chip;
 	int err;
-	static struct snd_device_ops ops = {
+	static const struct snd_device_ops ops = {
 		.dev_free =	snd_ymfpci_dev_free,
 	};
 	
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
