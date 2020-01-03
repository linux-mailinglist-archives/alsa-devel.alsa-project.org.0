Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0058612F58A
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:35:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88C0A1748;
	Fri,  3 Jan 2020 09:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88C0A1748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578040506;
	bh=JN4D1SVqoQy4RYpICB5Yief23ufk1yE5jplYMLKx4oU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qaq+HwABVVsg/l2FFrWss3i0tdlxyMnzdZWYvnQRfJGbyrWAGEZ1+QU8rEYDQx5i3
	 q1miFNwGWX+LNfhb+uYGdalWuuan4Trw2gHT7KTGV6fvKAeXrRke3lSMIEHuzqeH/g
	 wq2ZOSKHkKFNOuP4o4isTw5ZO4CHRmPx/e5qKfcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79647F803BC;
	Fri,  3 Jan 2020 09:18:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B925DF8034A; Fri,  3 Jan 2020 09:18:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF6B4F80279
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF6B4F80279
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E5ECBB26F
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:43 +0100
Message-Id: <20200103081714.9560-28-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 27/58] ALSA: pci: Constify snd_ac97_bus_ops
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

Now snd_ac97_bus() takes the const ops pointer, so we can define the
snd_ac97_bus_ops locally as const as well for further optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ad1889.c                  | 2 +-
 sound/pci/ali5451/ali5451.c         | 2 +-
 sound/pci/als300.c                  | 2 +-
 sound/pci/atiixp.c                  | 2 +-
 sound/pci/atiixp_modem.c            | 2 +-
 sound/pci/au88x0/au88x0_mixer.c     | 2 +-
 sound/pci/azt3328.c                 | 2 +-
 sound/pci/ca0106/ca0106_main.c      | 2 +-
 sound/pci/cs4281.c                  | 2 +-
 sound/pci/cs46xx/cs46xx_lib.c       | 2 +-
 sound/pci/cs5535audio/cs5535audio.c | 2 +-
 sound/pci/emu10k1/emu10k1x.c        | 2 +-
 sound/pci/emu10k1/emumixer.c        | 2 +-
 sound/pci/ens1370.c                 | 2 +-
 sound/pci/es1968.c                  | 2 +-
 sound/pci/fm801.c                   | 2 +-
 sound/pci/ice1712/ice1712.c         | 4 ++--
 sound/pci/ice1712/ice1724.c         | 2 +-
 sound/pci/intel8x0.c                | 6 +++---
 sound/pci/intel8x0m.c               | 2 +-
 sound/pci/maestro3.c                | 2 +-
 sound/pci/nm256/nm256.c             | 2 +-
 sound/pci/riptide/riptide.c         | 2 +-
 sound/pci/sis7019.c                 | 2 +-
 sound/pci/trident/trident_main.c    | 2 +-
 sound/pci/via82xx.c                 | 2 +-
 sound/pci/via82xx_modem.c           | 2 +-
 sound/pci/ymfpci/ymfpci_main.c      | 2 +-
 28 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index 3daa978263f6..5d42c42491bf 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -760,7 +760,7 @@ snd_ad1889_ac97_init(struct snd_ad1889 *chip, const char *quirk_override)
 {
 	int err;
 	struct snd_ac97_template ac97;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_ad1889_ac97_write,
 		.read = snd_ad1889_ac97_read,
 	};
diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 39c33a944e5d..b2374266c52c 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -1791,7 +1791,7 @@ static int snd_ali_mixer(struct snd_ali *codec)
 	struct snd_ac97_template ac97;
 	unsigned int idx;
 	int i, err;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_ali_codec_write,
 		.read = snd_ali_codec_read,
 	};
diff --git a/sound/pci/als300.c b/sound/pci/als300.c
index 64d978307755..8d2471ea090b 100644
--- a/sound/pci/als300.c
+++ b/sound/pci/als300.c
@@ -294,7 +294,7 @@ static int snd_als300_ac97(struct snd_als300 *chip)
 	struct snd_ac97_bus *bus;
 	struct snd_ac97_template ac97;
 	int err;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_als300_ac97_write,
 		.read = snd_als300_ac97_read,
 	};
diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index 61ae4fe8d646..c3281fab365d 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -1403,7 +1403,7 @@ static int snd_atiixp_mixer_new(struct atiixp *chip, int clock,
 	struct snd_ac97_template ac97;
 	int i, err;
 	int codec_count;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_atiixp_ac97_write,
 		.read = snd_atiixp_ac97_read,
 	};
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index b62cde3a00b2..3ec34e78ffef 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -1046,7 +1046,7 @@ static int snd_atiixp_mixer_new(struct atiixp_modem *chip, int clock)
 	struct snd_ac97_template ac97;
 	int i, err;
 	int codec_count;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_atiixp_ac97_write,
 		.read = snd_atiixp_ac97_read,
 	};
diff --git a/sound/pci/au88x0/au88x0_mixer.c b/sound/pci/au88x0/au88x0_mixer.c
index 60dd8a091bc3..5b647682b683 100644
--- a/sound/pci/au88x0/au88x0_mixer.c
+++ b/sound/pci/au88x0/au88x0_mixer.c
@@ -25,7 +25,7 @@ static int snd_vortex_mixer(vortex_t *vortex)
 	struct snd_ac97_bus *pbus;
 	struct snd_ac97_template ac97;
 	int err;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = vortex_codec_write,
 		.read = vortex_codec_read,
 	};
diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index 810d5772f097..898ba55fc0dd 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -757,7 +757,7 @@ snd_azf3328_mixer_new(struct snd_azf3328 *chip)
 {
 	struct snd_ac97_bus *bus;
 	struct snd_ac97_template ac97;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_azf3328_mixer_ac97_write,
 		.read = snd_azf3328_mixer_ac97_read,
 	};
diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index e65154cecad5..d3bd27ddb049 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -1161,7 +1161,7 @@ static int snd_ca0106_ac97(struct snd_ca0106 *chip)
 	struct snd_ac97_bus *pbus;
 	struct snd_ac97_template ac97;
 	int err;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_ca0106_ac97_write,
 		.read = snd_ca0106_ac97_read,
 	};
diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index 75450e329cee..8fd64dab372d 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -1064,7 +1064,7 @@ static int snd_cs4281_mixer(struct cs4281 *chip)
 	struct snd_card *card = chip->card;
 	struct snd_ac97_template ac97;
 	int err;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_cs4281_ac97_write,
 		.read = snd_cs4281_ac97_read,
 	};
diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 6251fa8da939..3f2fe26efee3 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -2465,7 +2465,7 @@ int snd_cs46xx_mixer(struct snd_cs46xx *chip, int spdif_device)
 	struct snd_ctl_elem_id id;
 	int err;
 	unsigned int idx;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
 		.reset = snd_cs46xx_codec_reset,
 #endif
diff --git a/sound/pci/cs5535audio/cs5535audio.c b/sound/pci/cs5535audio/cs5535audio.c
index 930c2ac405e5..11ce3c4589fa 100644
--- a/sound/pci/cs5535audio/cs5535audio.c
+++ b/sound/pci/cs5535audio/cs5535audio.c
@@ -138,7 +138,7 @@ static int snd_cs5535audio_mixer(struct cs5535audio *cs5535au)
 	struct snd_ac97_bus *pbus;
 	struct snd_ac97_template ac97;
 	int err;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_cs5535audio_ac97_codec_write,
 		.read = snd_cs5535audio_ac97_codec_read,
 	};
diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index 90ae1c72d663..ddb7c2ce3f7c 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -718,7 +718,7 @@ static int snd_emu10k1x_ac97(struct emu10k1x *chip)
 	struct snd_ac97_bus *pbus;
 	struct snd_ac97_template ac97;
 	int err;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_emu10k1x_ac97_write,
 		.read = snd_emu10k1x_ac97_read,
 	};
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 7c0417253cb5..0b3dfc71fa69 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -1898,7 +1898,7 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 	if (emu->card_capabilities->ac97_chip) {
 		struct snd_ac97_bus *pbus;
 		struct snd_ac97_template ac97;
-		static struct snd_ac97_bus_ops ops = {
+		static const struct snd_ac97_bus_ops ops = {
 			.write = snd_emu10k1_ac97_write,
 			.read = snd_emu10k1_ac97_read,
 		};
diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 7611e44e2af5..15e6d2377ecf 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -1596,7 +1596,7 @@ static int snd_ensoniq_1371_mixer(struct ensoniq *ensoniq,
 	struct snd_ac97_bus *pbus;
 	struct snd_ac97_template ac97;
 	int err;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_es1371_codec_write,
 		.read = snd_es1371_codec_read,
 		.wait = snd_es1371_codec_wait,
diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index 43cfdf02048b..f23a935267c3 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -2007,7 +2007,7 @@ snd_es1968_mixer(struct es1968 *chip)
 	struct snd_ctl_elem_id elem_id;
 #endif
 	int err;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_es1968_ac97_write,
 		.read = snd_es1968_ac97_read,
 	};
diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index bb5cffee5dac..ae2b413ff489 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -1020,7 +1020,7 @@ static int snd_fm801_mixer(struct fm801 *chip)
 	struct snd_ac97_template ac97;
 	unsigned int i;
 	int err;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_fm801_codec_write,
 		.read = snd_fm801_codec_read,
 	};
diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 15cb90dceeb8..9794bbedffc3 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -1464,11 +1464,11 @@ static int snd_ice1712_ac97_mixer(struct snd_ice1712 *ice)
 	int err, bus_num = 0;
 	struct snd_ac97_template ac97;
 	struct snd_ac97_bus *pbus;
-	static struct snd_ac97_bus_ops con_ops = {
+	static const struct snd_ac97_bus_ops con_ops = {
 		.write = snd_ice1712_ac97_write,
 		.read = snd_ice1712_ac97_read,
 	};
-	static struct snd_ac97_bus_ops pro_ops = {
+	static const struct snd_ac97_bus_ops pro_ops = {
 		.write = snd_ice1712_pro_ac97_write,
 		.read = snd_ice1712_pro_ac97_read,
 	};
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 628b0581a4ff..4630a8c42aa9 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -1463,7 +1463,7 @@ static int snd_vt1724_ac97_mixer(struct snd_ice1712 *ice)
 	if (!(ice->eeprom.data[ICE_EEP2_ACLINK] & VT1724_CFG_PRO_I2S)) {
 		struct snd_ac97_bus *pbus;
 		struct snd_ac97_template ac97;
-		static struct snd_ac97_bus_ops ops = {
+		static const struct snd_ac97_bus_ops ops = {
 			.write = snd_vt1724_ac97_write,
 			.read = snd_vt1724_ac97_read,
 		};
diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 563f3a3e820e..de875ea8ecbe 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -2138,12 +2138,12 @@ static int snd_intel8x0_mixer(struct intel8x0 *chip, int ac97_clock,
 	int err;
 	unsigned int i, codecs;
 	unsigned int glob_sta = 0;
-	struct snd_ac97_bus_ops *ops;
-	static struct snd_ac97_bus_ops standard_bus_ops = {
+	const struct snd_ac97_bus_ops *ops;
+	static const struct snd_ac97_bus_ops standard_bus_ops = {
 		.write = snd_intel8x0_codec_write,
 		.read = snd_intel8x0_codec_read,
 	};
-	static struct snd_ac97_bus_ops ali_bus_ops = {
+	static const struct snd_ac97_bus_ops ali_bus_ops = {
 		.write = snd_intel8x0_ali_codec_write,
 		.read = snd_intel8x0_ali_codec_read,
 	};
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index c6dc36167a01..74d45b9a1571 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -801,7 +801,7 @@ static int snd_intel8x0m_mixer(struct intel8x0m *chip, int ac97_clock)
 	struct snd_ac97 *x97;
 	int err;
 	unsigned int glob_sta = 0;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_intel8x0m_codec_write,
 		.read = snd_intel8x0m_codec_read,
 	};
diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index b94e3ec5f158..89018d44d777 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -2036,7 +2036,7 @@ static int snd_m3_mixer(struct snd_m3 *chip)
 	struct snd_ctl_elem_id elem_id;
 #endif
 	int err;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_m3_ac97_write,
 		.read = snd_m3_ac97_read,
 	};
diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index 003a09788572..99228b93b3c6 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -1309,7 +1309,7 @@ snd_nm256_mixer(struct nm256 *chip)
 	struct snd_ac97_bus *pbus;
 	struct snd_ac97_template ac97;
 	int err;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.reset = snd_nm256_ac97_reset,
 		.write = snd_nm256_ac97_write,
 		.read = snd_nm256_ac97_read,
diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 6617bc347bfb..625c85428955 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1963,7 +1963,7 @@ static int snd_riptide_mixer(struct snd_riptide *chip)
 	struct snd_ac97_bus *pbus;
 	struct snd_ac97_template ac97;
 	int err = 0;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_riptide_codec_write,
 		.read = snd_riptide_codec_read,
 	};
diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index 2e351bf1d792..4977ab0b8b3d 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -983,7 +983,7 @@ static int sis_mixer_create(struct sis7019 *sis)
 {
 	struct snd_ac97_bus *bus;
 	struct snd_ac97_template ac97;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = sis_ac97_write,
 		.read = sis_ac97_read,
 	};
diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
index ba4a9fcd5eba..6e50376163a2 100644
--- a/sound/pci/trident/trident_main.c
+++ b/sound/pci/trident/trident_main.c
@@ -2912,7 +2912,7 @@ static int snd_trident_mixer(struct snd_trident *trident, int pcm_spdif_device)
 	struct snd_kcontrol *kctl;
 	struct snd_ctl_elem_value *uctl;
 	int idx, err, retries = 2;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_trident_codec_write,
 		.read = snd_trident_codec_read,
 	};
diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 090b0c47fbdd..c8fb51885b6d 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -1868,7 +1868,7 @@ static int snd_via82xx_mixer_new(struct via82xx *chip, const char *quirk_overrid
 {
 	struct snd_ac97_template ac97;
 	int err;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_via82xx_codec_write,
 		.read = snd_via82xx_codec_read,
 		.wait = snd_via82xx_codec_wait,
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index 7f138fa4e141..84e589803e2e 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -871,7 +871,7 @@ static int snd_via82xx_mixer_new(struct via82xx_modem *chip)
 {
 	struct snd_ac97_template ac97;
 	int err;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_via82xx_codec_write,
 		.read = snd_via82xx_codec_read,
 		.wait = snd_via82xx_codec_wait,
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 1d9295bb00a9..a531f4d2605d 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -1780,7 +1780,7 @@ int snd_ymfpci_mixer(struct snd_ymfpci *chip, int rear_switch)
 	struct snd_pcm_substream *substream;
 	unsigned int idx;
 	int err;
-	static struct snd_ac97_bus_ops ops = {
+	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_ymfpci_codec_write,
 		.read = snd_ymfpci_codec_read,
 	};
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
