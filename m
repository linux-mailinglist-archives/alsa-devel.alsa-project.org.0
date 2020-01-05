Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9426130884
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:02:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8520317C4;
	Sun,  5 Jan 2020 16:01:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8520317C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236553;
	bh=TRHFGaI2T8DwwO2alhzpATOXfGZ7ao9OI6Eib07fLsk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S6Fr29J4kqeC6pJdZyMyM+5AfvWCeYVJg8UmymVJGKlVbsXBha1e2EbOfRPBObXAd
	 2E9dFJJT4hPMLJ5ONpVlghhqCgv3NkG4HqvJpnAWUIO/H+otVuezUZoxWgvDNyNIKe
	 KjLi0jbQ8+qk8v7h/QI1l63XiUwUQcJUCMz7XbWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BB66F8038F;
	Sun,  5 Jan 2020 15:49:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75945F8033F; Sun,  5 Jan 2020 15:49:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74B22F80273
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74B22F80273
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6CA0BB1DB
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:31 +0100
Message-Id: <20200105144823.29547-17-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 16/68] ALSA: ice1712: More constifications
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

Apply const prefix to each possible place: the EEPROM tables, the
static string arrays, the init verb tables, etc.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ice1712/aureon.c       |  8 ++++----
 sound/pci/ice1712/juli.c         |  6 +++---
 sound/pci/ice1712/maya44.c       | 10 +++++-----
 sound/pci/ice1712/phase.c        |  4 ++--
 sound/pci/ice1712/pontis.c       |  2 +-
 sound/pci/ice1712/prodigy192.c   |  2 +-
 sound/pci/ice1712/prodigy_hifi.c | 16 ++++++++--------
 sound/pci/ice1712/psc724.c       |  2 +-
 sound/pci/ice1712/quartet.c      |  8 ++++----
 sound/pci/ice1712/se.c           |  8 ++++----
 sound/pci/ice1712/vt1720_mobo.c  |  4 ++--
 sound/pci/ice1712/wtm.c          |  6 +++---
 12 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/sound/pci/ice1712/aureon.c b/sound/pci/ice1712/aureon.c
index 025fe7820620..9a30f6d35d13 100644
--- a/sound/pci/ice1712/aureon.c
+++ b/sound/pci/ice1712/aureon.c
@@ -2133,7 +2133,7 @@ static int aureon_init(struct snd_ice1712 *ice)
  * hence the driver needs to sets up it properly.
  */
 
-static unsigned char aureon51_eeprom[] = {
+static const unsigned char aureon51_eeprom[] = {
 	[ICE_EEP2_SYSCONF]     = 0x0a,	/* clock 512, spdif-in/ADC, 3DACs */
 	[ICE_EEP2_ACLINK]      = 0x80,	/* I2S */
 	[ICE_EEP2_I2S]         = 0xfc,	/* vol, 96k, 24bit, 192k */
@@ -2149,7 +2149,7 @@ static unsigned char aureon51_eeprom[] = {
 	[ICE_EEP2_GPIO_STATE2] = 0x00,
 };
 
-static unsigned char aureon71_eeprom[] = {
+static const unsigned char aureon71_eeprom[] = {
 	[ICE_EEP2_SYSCONF]     = 0x0b,	/* clock 512, spdif-in/ADC, 4DACs */
 	[ICE_EEP2_ACLINK]      = 0x80,	/* I2S */
 	[ICE_EEP2_I2S]         = 0xfc,	/* vol, 96k, 24bit, 192k */
@@ -2166,7 +2166,7 @@ static unsigned char aureon71_eeprom[] = {
 };
 #define prodigy71_eeprom aureon71_eeprom
 
-static unsigned char aureon71_universe_eeprom[] = {
+static const unsigned char aureon71_universe_eeprom[] = {
 	[ICE_EEP2_SYSCONF]     = 0x2b,	/* clock 512, mpu401, spdif-in/ADC,
 					 * 4DACs
 					 */
@@ -2184,7 +2184,7 @@ static unsigned char aureon71_universe_eeprom[] = {
 	[ICE_EEP2_GPIO_STATE2] = 0x00,
 };
 
-static unsigned char prodigy71lt_eeprom[] = {
+static const unsigned char prodigy71lt_eeprom[] = {
 	[ICE_EEP2_SYSCONF]     = 0x4b,	/* clock 384, spdif-in/ADC, 4DACs */
 	[ICE_EEP2_ACLINK]      = 0x80,	/* I2S */
 	[ICE_EEP2_I2S]         = 0xfc,	/* vol, 96k, 24bit, 192k */
diff --git a/sound/pci/ice1712/juli.c b/sound/pci/ice1712/juli.c
index 079e58ec8b09..7be4eb42f05e 100644
--- a/sound/pci/ice1712/juli.c
+++ b/sound/pci/ice1712/juli.c
@@ -397,7 +397,7 @@ static const struct snd_kcontrol_new juli_mute_controls[] = {
 	},
 };
 
-static char *slave_vols[] = {
+static const char * const slave_vols[] = {
 	PCM_VOLUME,
 	MONITOR_AN_IN_VOLUME,
 	MONITOR_DIG_IN_VOLUME,
@@ -420,7 +420,7 @@ static struct snd_kcontrol *ctl_find(struct snd_card *card,
 
 static void add_slaves(struct snd_card *card,
 		       struct snd_kcontrol *master,
-		       char * const *list)
+		       const char * const *list)
 {
 	for (; *list; list++) {
 		struct snd_kcontrol *slave = ctl_find(card, *list);
@@ -651,7 +651,7 @@ static int juli_init(struct snd_ice1712 *ice)
  * hence the driver needs to sets up it properly.
  */
 
-static unsigned char juli_eeprom[] = {
+static const unsigned char juli_eeprom[] = {
 	[ICE_EEP2_SYSCONF]     = 0x2b,	/* clock 512, mpu401, 1xADC, 1xDACs,
 					   SPDIF in */
 	[ICE_EEP2_ACLINK]      = 0x80,	/* I2S */
diff --git a/sound/pci/ice1712/maya44.c b/sound/pci/ice1712/maya44.c
index c2761e009c67..b46df1821251 100644
--- a/sound/pci/ice1712/maya44.c
+++ b/sound/pci/ice1712/maya44.c
@@ -116,7 +116,7 @@ struct maya_vol_info {
 	unsigned char mux_bits[2];	/* extra bits for ADC mute */
 };
 
-static struct maya_vol_info vol_info[WM_NUM_VOLS] = {
+static const struct maya_vol_info vol_info[WM_NUM_VOLS] = {
 	[WM_VOL_HP] = {
 		.maxval = 80,
 		.regs = { WM8776_REG_HEADPHONE_L, WM8776_REG_HEADPHONE_R },
@@ -158,7 +158,7 @@ static int maya_vol_info(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_info *uinfo)
 {
 	unsigned int idx = kcontrol->private_value;
-	struct maya_vol_info *vol = &vol_info[idx];
+	const struct maya_vol_info *vol = &vol_info[idx];
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = 2;
@@ -189,7 +189,7 @@ static int maya_vol_put(struct snd_kcontrol *kcontrol,
 	struct snd_wm8776 *wm =
 		&chip->wm[snd_ctl_get_ioff(kcontrol, &ucontrol->id)];
 	unsigned int idx = kcontrol->private_value;
-	struct maya_vol_info *vol = &vol_info[idx];
+	const struct maya_vol_info *vol = &vol_info[idx];
 	unsigned int val, data;
 	int ch, changed = 0;
 
@@ -662,7 +662,7 @@ static const struct snd_pcm_hw_constraint_list dac_rates = {
 /*
  * chip addresses on I2C bus
  */
-static unsigned char wm8776_addr[2] = {
+static const unsigned char wm8776_addr[2] = {
 	0x34, 0x36, /* codec 0 & 1 */
 };
 
@@ -712,7 +712,7 @@ static int maya44_init(struct snd_ice1712 *ice)
  * hence the driver needs to sets up it properly.
  */
 
-static unsigned char maya44_eeprom[] = {
+static const unsigned char maya44_eeprom[] = {
 	[ICE_EEP2_SYSCONF]     = 0x45,
 		/* clock xin1=49.152MHz, mpu401, 2 stereo ADCs+DACs */
 	[ICE_EEP2_ACLINK]      = 0x80,
diff --git a/sound/pci/ice1712/phase.c b/sound/pci/ice1712/phase.c
index ced4a2bfd08e..1e47e46ab8ac 100644
--- a/sound/pci/ice1712/phase.c
+++ b/sound/pci/ice1712/phase.c
@@ -157,7 +157,7 @@ static int phase22_add_controls(struct snd_ice1712 *ice)
 	return 0;
 }
 
-static unsigned char phase22_eeprom[] = {
+static const unsigned char phase22_eeprom[] = {
 	[ICE_EEP2_SYSCONF]     = 0x28,  /* clock 512, mpu 401,
 					spdif-in/1xADC, 1xDACs */
 	[ICE_EEP2_ACLINK]      = 0x80,	/* I2S */
@@ -174,7 +174,7 @@ static unsigned char phase22_eeprom[] = {
 	[ICE_EEP2_GPIO_STATE2] = 0x00,
 };
 
-static unsigned char phase28_eeprom[] = {
+static const unsigned char phase28_eeprom[] = {
 	[ICE_EEP2_SYSCONF]     = 0x2b,  /* clock 512, mpu401,
 					spdif-in/1xADC, 4xDACs */
 	[ICE_EEP2_ACLINK]      = 0x80,	/* I2S */
diff --git a/sound/pci/ice1712/pontis.c b/sound/pci/ice1712/pontis.c
index 8ddb6c35a5e6..683909ca147c 100644
--- a/sound/pci/ice1712/pontis.c
+++ b/sound/pci/ice1712/pontis.c
@@ -778,7 +778,7 @@ static int pontis_init(struct snd_ice1712 *ice)
  * hence the driver needs to sets up it properly.
  */
 
-static unsigned char pontis_eeprom[] = {
+static const unsigned char pontis_eeprom[] = {
 	[ICE_EEP2_SYSCONF]     = 0x08,	/* clock 256, mpu401, spdif-in/ADC, 1DAC */
 	[ICE_EEP2_ACLINK]      = 0x80,	/* I2S */
 	[ICE_EEP2_I2S]         = 0xf8,	/* vol, 96k, 24bit, 192k */
diff --git a/sound/pci/ice1712/prodigy192.c b/sound/pci/ice1712/prodigy192.c
index 105716961e39..8df14f63b10d 100644
--- a/sound/pci/ice1712/prodigy192.c
+++ b/sound/pci/ice1712/prodigy192.c
@@ -753,7 +753,7 @@ static int prodigy192_init(struct snd_ice1712 *ice)
  * hence the driver needs to sets up it properly.
  */
 
-static unsigned char prodigy71_eeprom[] = {
+static const unsigned char prodigy71_eeprom[] = {
 	[ICE_EEP2_SYSCONF]     = 0x6a,	/* 49MHz crystal, mpu401,
 					 * spdif-in+ 1 stereo ADC,
 					 * 3 stereo DACs
diff --git a/sound/pci/ice1712/prodigy_hifi.c b/sound/pci/ice1712/prodigy_hifi.c
index ba37f7eab166..91f83cef0e56 100644
--- a/sound/pci/ice1712/prodigy_hifi.c
+++ b/sound/pci/ice1712/prodigy_hifi.c
@@ -930,7 +930,7 @@ static int prodigy_hd2_add_controls(struct snd_ice1712 *ice)
 
 static void wm8766_init(struct snd_ice1712 *ice)
 {
-	static unsigned short wm8766_inits[] = {
+	static const unsigned short wm8766_inits[] = {
 		WM8766_RESET,	   0x0000,
 		WM8766_DAC_CTRL,	0x0120,
 		WM8766_INT_CTRL,	0x0022, /* I2S Normal Mode, 24 bit */
@@ -953,7 +953,7 @@ static void wm8766_init(struct snd_ice1712 *ice)
 
 static void wm8776_init(struct snd_ice1712 *ice)
 {
-	static unsigned short wm8776_inits[] = {
+	static const unsigned short wm8776_inits[] = {
 		/* These come first to reduce init pop noise */
 		WM_ADC_MUX,	0x0003,	/* ADC mute */
 		/* 0x00c0 replaced by 0x0003 */
@@ -973,7 +973,7 @@ static void wm8776_init(struct snd_ice1712 *ice)
 #ifdef CONFIG_PM_SLEEP
 static int prodigy_hifi_resume(struct snd_ice1712 *ice)
 {
-	static unsigned short wm8776_reinit_registers[] = {
+	static const unsigned short wm8776_reinit_registers[] = {
 		WM_MASTER_CTRL,
 		WM_DAC_INT,
 		WM_ADC_INT,
@@ -1033,7 +1033,7 @@ static int prodigy_hifi_resume(struct snd_ice1712 *ice)
  */
 static int prodigy_hifi_init(struct snd_ice1712 *ice)
 {
-	static unsigned short wm8776_defaults[] = {
+	static const unsigned short wm8776_defaults[] = {
 		WM_MASTER_CTRL,  0x0022, /* 256fs, slave mode */
 		WM_DAC_INT,	0x0022,	/* I2S, normal polarity, 24bit */
 		WM_ADC_INT,	0x0022,	/* I2S, normal polarity, 24bit */
@@ -1108,7 +1108,7 @@ static int prodigy_hifi_init(struct snd_ice1712 *ice)
  */
 static void ak4396_init(struct snd_ice1712 *ice)
 {
-	static unsigned short ak4396_inits[] = {
+	static const unsigned short ak4396_inits[] = {
 		AK4396_CTRL1,	   0x87,   /* I2S Normal Mode, 24 bit */
 		AK4396_CTRL2,	   0x02,
 		AK4396_CTRL3,	   0x00, 
@@ -1180,7 +1180,7 @@ static int prodigy_hd2_init(struct snd_ice1712 *ice)
 }
 
 
-static unsigned char prodigy71hifi_eeprom[] = {
+static const unsigned char prodigy71hifi_eeprom[] = {
 	0x4b,   /* SYSCONF: clock 512, spdif-in/ADC, 4DACs */
 	0x80,   /* ACLINK: I2S */
 	0xfc,   /* I2S: vol, 96k, 24bit, 192k */
@@ -1196,7 +1196,7 @@ static unsigned char prodigy71hifi_eeprom[] = {
 	0x00,   /* GPIO_STATE2 */
 };
 
-static unsigned char prodigyhd2_eeprom[] = {
+static const unsigned char prodigyhd2_eeprom[] = {
 	0x4b,   /* SYSCONF: clock 512, spdif-in/ADC, 4DACs */
 	0x80,   /* ACLINK: I2S */
 	0xfc,   /* I2S: vol, 96k, 24bit, 192k */
@@ -1212,7 +1212,7 @@ static unsigned char prodigyhd2_eeprom[] = {
 	0x00,   /* GPIO_STATE2 */
 };
 
-static unsigned char fortissimo4_eeprom[] = {
+static const unsigned char fortissimo4_eeprom[] = {
 	0x43,   /* SYSCONF: clock 512, ADC, 4DACs */	
 	0x80,   /* ACLINK: I2S */
 	0xfc,   /* I2S: vol, 96k, 24bit, 192k */
diff --git a/sound/pci/ice1712/psc724.c b/sound/pci/ice1712/psc724.c
index 7287ebed2b5a..7aa3f92040d0 100644
--- a/sound/pci/ice1712/psc724.c
+++ b/sound/pci/ice1712/psc724.c
@@ -420,7 +420,7 @@ static void psc724_exit(struct snd_ice1712 *ice)
 }
 
 /* PSC724 has buggy EEPROM (no 96&192kHz, all FFh GPIOs), so override it here */
-static unsigned char psc724_eeprom[] = {
+static const unsigned char psc724_eeprom[] = {
 	[ICE_EEP2_SYSCONF]	= 0x42,	/* 49.152MHz, 1 ADC, 3 DACs */
 	[ICE_EEP2_ACLINK]	= 0x80,	/* I2S */
 	[ICE_EEP2_I2S]		= 0xf0,	/* I2S volume, 96kHz, 24bit */
diff --git a/sound/pci/ice1712/quartet.c b/sound/pci/ice1712/quartet.c
index bfd811a08d90..866596205710 100644
--- a/sound/pci/ice1712/quartet.c
+++ b/sound/pci/ice1712/quartet.c
@@ -657,7 +657,7 @@ static int qtet_php_put(struct snd_kcontrol *kcontrol,
 	.get_register = get_##xreg,\
 	.texts = {xtext1, xtext2} }
 
-static struct qtet_kcontrol_private qtet_privates[] = {
+static const struct qtet_kcontrol_private qtet_privates[] = {
 	PRIV_ENUM2(IN12_SEL, CPLD_IN12_SEL, cpld, "An In 1/2", "An In 3/4"),
 	PRIV_ENUM2(IN34_SEL, CPLD_IN34_SEL, cpld, "An In 3/4", "IEC958 In"),
 	PRIV_ENUM2(AIN34_SEL, SCR_AIN34_SEL, scr, "Line In 3/4", "Hi-Z"),
@@ -757,7 +757,7 @@ static const struct snd_kcontrol_new qtet_controls[] = {
 	QTET_CONTROL("Output 3/4 to Monitor 1/2", sw, OUT34_MON12),
 };
 
-static char *slave_vols[] = {
+static const char * const slave_vols[] = {
 	PCM_12_PLAYBACK_VOLUME,
 	PCM_34_PLAYBACK_VOLUME,
 	NULL
@@ -777,7 +777,7 @@ static struct snd_kcontrol *ctl_find(struct snd_card *card,
 }
 
 static void add_slaves(struct snd_card *card,
-		       struct snd_kcontrol *master, char * const *list)
+		       struct snd_kcontrol *master, const char * const *list)
 {
 	for (; *list; list++) {
 		struct snd_kcontrol *slave = ctl_find(card, *list);
@@ -1053,7 +1053,7 @@ static int qtet_init(struct snd_ice1712 *ice)
 	return 0;
 }
 
-static unsigned char qtet_eeprom[] = {
+static const unsigned char qtet_eeprom[] = {
 	[ICE_EEP2_SYSCONF]     = 0x28,	/* clock 256(24MHz), mpu401, 1xADC,
 					   1xDACs, SPDIF in */
 	[ICE_EEP2_ACLINK]      = 0x80,	/* I2S */
diff --git a/sound/pci/ice1712/se.c b/sound/pci/ice1712/se.c
index fdc502783e07..ffa9d8860a5a 100644
--- a/sound/pci/ice1712/se.c
+++ b/sound/pci/ice1712/se.c
@@ -245,7 +245,7 @@ static const char * const se200pci_sel[] = {
 static void se200pci_WM8776_set_input_selector(struct snd_ice1712 *ice,
 					       unsigned int sel)
 {
-	static unsigned char vals[] = {
+	static const unsigned char vals[] = {
 		/* LINE, CD, MIC, ALL, GND */
 		0x10, 0x04, 0x08, 0x1c, 0x03
 	};
@@ -288,7 +288,7 @@ static void se200pci_WM8776_set_agc(struct snd_ice1712 *ice, unsigned int agc)
 static void se200pci_WM8776_init(struct snd_ice1712 *ice)
 {
 	int i;
-	static unsigned short default_values[] = {
+	static const unsigned short default_values[] = {
 		0x100, 0x100, 0x100,
 		0x100, 0x100, 0x100,
 		0x000, 0x090, 0x000, 0x000,
@@ -701,7 +701,7 @@ static int se_add_controls(struct snd_ice1712 *ice)
 /*  entry point                                                             */
 /****************************************************************************/
 
-static unsigned char se200pci_eeprom[] = {
+static const unsigned char se200pci_eeprom[] = {
 	[ICE_EEP2_SYSCONF]	= 0x4b,	/* 49.152Hz, spdif-in/ADC, 4DACs */
 	[ICE_EEP2_ACLINK]	= 0x80,	/* I2S */
 	[ICE_EEP2_I2S]		= 0x78,	/* 96k-ok, 24bit, 192k-ok */
@@ -720,7 +720,7 @@ static unsigned char se200pci_eeprom[] = {
 	[ICE_EEP2_GPIO_STATE2]	= 0x07, /* WM8766 ML/MC/MD */
 };
 
-static unsigned char se90pci_eeprom[] = {
+static const unsigned char se90pci_eeprom[] = {
 	[ICE_EEP2_SYSCONF]	= 0x4b,	/* 49.152Hz, spdif-in/ADC, 4DACs */
 	[ICE_EEP2_ACLINK]	= 0x80,	/* I2S */
 	[ICE_EEP2_I2S]		= 0x78,	/* 96k-ok, 24bit, 192k-ok */
diff --git a/sound/pci/ice1712/vt1720_mobo.c b/sound/pci/ice1712/vt1720_mobo.c
index 3d240125a644..47470b07197c 100644
--- a/sound/pci/ice1712/vt1720_mobo.c
+++ b/sound/pci/ice1712/vt1720_mobo.c
@@ -39,7 +39,7 @@ static int k8x800_add_controls(struct snd_ice1712 *ice)
 
 /* EEPROM image */
 
-static unsigned char k8x800_eeprom[] = {
+static const unsigned char k8x800_eeprom[] = {
 	[ICE_EEP2_SYSCONF]     = 0x01,	/* clock 256, 1ADC, 2DACs */
 	[ICE_EEP2_ACLINK]      = 0x02,	/* ACLINK, packed */
 	[ICE_EEP2_I2S]         = 0x00,	/* - */
@@ -55,7 +55,7 @@ static unsigned char k8x800_eeprom[] = {
 	[ICE_EEP2_GPIO_STATE2] = 0x00,	/* - */
 };
 
-static unsigned char sn25p_eeprom[] = {
+static const unsigned char sn25p_eeprom[] = {
 	[ICE_EEP2_SYSCONF]     = 0x01,	/* clock 256, 1ADC, 2DACs */
 	[ICE_EEP2_ACLINK]      = 0x02,	/* ACLINK, packed */
 	[ICE_EEP2_I2S]         = 0x00,	/* - */
diff --git a/sound/pci/ice1712/wtm.c b/sound/pci/ice1712/wtm.c
index 4a7315ad51e8..f613f0067d8c 100644
--- a/sound/pci/ice1712/wtm.c
+++ b/sound/pci/ice1712/wtm.c
@@ -567,12 +567,12 @@ static int wtm_add_controls(struct snd_ice1712 *ice)
 
 static int wtm_init(struct snd_ice1712 *ice)
 {
-	static unsigned short stac_inits_wtm[] = {
+	static const unsigned short stac_inits_wtm[] = {
 		STAC946X_RESET, 0,
 		STAC946X_MASTER_CLOCKING, 0x11,
 		(unsigned short)-1
 	};
-	unsigned short *p;
+	const unsigned short *p;
 	struct wtm_spec *spec;
 
 	/*WTM 192M*/
@@ -599,7 +599,7 @@ static int wtm_init(struct snd_ice1712 *ice)
 }
 
 
-static unsigned char wtm_eeprom[] = {
+static const unsigned char wtm_eeprom[] = {
 	[ICE_EEP2_SYSCONF]      = 0x67, /*SYSCONF: clock 192KHz, mpu401,
 							4ADC, 8DAC */
 	[ICE_EEP2_ACLINK]       = 0x80, /* ACLINK : I2S */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
