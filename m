Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3F3130874
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 15:54:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68DF5176B;
	Sun,  5 Jan 2020 15:53:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68DF5176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236063;
	bh=s9LARy9Td1Xx+GTaZGA8YMnUZhKlPpSJiQmMCAJ71B4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QrQ/BeEdbvHLhTos9lalQJupDS/66ktEGCfbc3Cf24YVoTNTwbYbWOqEKTujGhts1
	 pJccWXkyO8i1AHWv0u3SlvECdHR5KTM39bUq/8+0ojhcPf2UT3hJPXTSf3QOBS+H0L
	 wzOKpD3o31LEKGA9dFVAQW5BwZQZ0zFM6PZB4Lq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB2B6F80333;
	Sun,  5 Jan 2020 15:49:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63285F80315; Sun,  5 Jan 2020 15:48:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19E04F801F5
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19E04F801F5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 11D24B19A
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:25 +0100
Message-Id: <20200105144823.29547-11-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 10/68] ALSA: ac97: More constifications
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

Apply const prefix to each possible place: the static tables for
registers and bits, the quirk tables, etc.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ac97/ac97_codec.c | 10 +++++-----
 sound/pci/ac97/ac97_patch.c | 26 +++++++++++++-------------
 sound/pci/ac97/ac97_pcm.c   |  4 ++--
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index fcfa8499e453..6758c072000e 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -1753,10 +1753,10 @@ static unsigned int snd_ac97_determine_spdif_rates(struct snd_ac97 *ac97)
 {
 	unsigned int result = 0;
 	int i;
-	static unsigned short ctl_bits[] = {
+	static const unsigned short ctl_bits[] = {
 		AC97_SC_SPSR_44K, AC97_SC_SPSR_32K, AC97_SC_SPSR_48K
 	};
-	static unsigned int rate_bits[] = {
+	static const unsigned int rate_bits[] = {
 		SNDRV_PCM_RATE_44100, SNDRV_PCM_RATE_32000, SNDRV_PCM_RATE_48000
 	};
 
@@ -2346,7 +2346,7 @@ struct ac97_power_reg {
 
 enum { PWIDX_ADC, PWIDX_FRONT, PWIDX_CLFE, PWIDX_SURR, PWIDX_MIC, PWIDX_SIZE };
 
-static struct ac97_power_reg power_regs[PWIDX_SIZE] = {
+static const struct ac97_power_reg power_regs[PWIDX_SIZE] = {
 	[PWIDX_ADC] = { AC97_PCM_LR_ADC_RATE, AC97_POWERDOWN, AC97_PD_PR0},
 	[PWIDX_FRONT] = { AC97_PCM_FRONT_DAC_RATE, AC97_POWERDOWN, AC97_PD_PR1},
 	[PWIDX_CLFE] = { AC97_PCM_LFE_DAC_RATE, AC97_EXTENDED_STATUS,
@@ -2829,7 +2829,7 @@ struct quirk_table {
 	int (*func)(struct snd_ac97 *);
 };
 
-static struct quirk_table applicable_quirks[] = {
+static const struct quirk_table applicable_quirks[] = {
 	{ "none", NULL },
 	{ "hp_only", tune_hp_only },
 	{ "swap_hp", tune_swap_hp },
@@ -2857,7 +2857,7 @@ static int apply_quirk(struct snd_ac97 *ac97, int type)
 static int apply_quirk_str(struct snd_ac97 *ac97, const char *typestr)
 {
 	int i;
-	struct quirk_table *q;
+	const struct quirk_table *q;
 
 	for (i = 0; i < ARRAY_SIZE(applicable_quirks); i++) {
 		q = &applicable_quirks[i];
diff --git a/sound/pci/ac97/ac97_patch.c b/sound/pci/ac97/ac97_patch.c
index 524f9d2dcb3c..ebf926728c5f 100644
--- a/sound/pci/ac97/ac97_patch.c
+++ b/sound/pci/ac97/ac97_patch.c
@@ -1211,25 +1211,25 @@ static const struct snd_ac97_build_ops patch_sigmatel_stac9758_ops = {
 
 static int patch_sigmatel_stac9758(struct snd_ac97 * ac97)
 {
-	static unsigned short regs[4] = {
+	static const unsigned short regs[4] = {
 		AC97_SIGMATEL_OUTSEL,
 		AC97_SIGMATEL_IOMISC,
 		AC97_SIGMATEL_INSEL,
 		AC97_SIGMATEL_VARIOUS
 	};
-	static unsigned short def_regs[4] = {
+	static const unsigned short def_regs[4] = {
 		/* OUTSEL */ 0xd794, /* CL:CL, SR:SR, LO:MX, LI:DS, MI:DS */
 		/* IOMISC */ 0x2001,
 		/* INSEL */ 0x0201, /* LI:LI, MI:M1 */
 		/* VARIOUS */ 0x0040
 	};
-	static unsigned short m675_regs[4] = {
+	static const unsigned short m675_regs[4] = {
 		/* OUTSEL */ 0xfc70, /* CL:MX, SR:MX, LO:DS, LI:MX, MI:DS */
 		/* IOMISC */ 0x2102, /* HP amp on */
 		/* INSEL */ 0x0203, /* LI:LI, MI:FR */
 		/* VARIOUS */ 0x0041 /* stereo mic */
 	};
-	unsigned short *pregs = def_regs;
+	const unsigned short *pregs = def_regs;
 	int i;
 
 	/* Gateway M675 notebook */
@@ -1361,7 +1361,7 @@ static int patch_cx20551(struct snd_ac97 *ac97)
 #ifdef CONFIG_PM
 static void ad18xx_resume(struct snd_ac97 *ac97)
 {
-	static unsigned short setup_regs[] = {
+	static const unsigned short setup_regs[] = {
 		AC97_AD_MISC, AC97_AD_SERIAL_CFG, AC97_AD_JACK_SPDIF,
 	};
 	int i, codec;
@@ -1470,7 +1470,7 @@ static unsigned short patch_ad1881_unchained(struct snd_ac97 * ac97, int idx, un
 
 static int patch_ad1881_chained1(struct snd_ac97 * ac97, int idx, unsigned short codec_bits)
 {
-	static int cfg_bits[3] = { 1<<12, 1<<14, 1<<13 };
+	static const int cfg_bits[3] = { 1<<12, 1<<14, 1<<13 };
 	unsigned short val;
 	
 	snd_ac97_update_bits(ac97, AC97_AD_SERIAL_CFG, 0x7000, cfg_bits[idx]);
@@ -1794,7 +1794,7 @@ static const struct snd_kcontrol_new snd_ac97_ad1981x_jack_sense[] = {
 /* black list to avoid HP/Line jack-sense controls
  * (SS vendor << 16 | device)
  */
-static unsigned int ad1981_jacks_blacklist[] = {
+static const unsigned int ad1981_jacks_blacklist[] = {
 	0x10140523, /* Thinkpad R40 */
 	0x10140534, /* Thinkpad X31 */
 	0x10140537, /* Thinkpad T41p */
@@ -1838,7 +1838,7 @@ static const struct snd_ac97_build_ops patch_ad1981a_build_ops = {
 /* white list to enable HP jack-sense bits
  * (SS vendor << 16 | device)
  */
-static unsigned int ad1981_jacks_whitelist[] = {
+static const unsigned int ad1981_jacks_whitelist[] = {
 	0x0e11005a, /* HP nc4000/4010 */
 	0x103c0890, /* HP nc6000 */
 	0x103c0938, /* HP nc4220 */
@@ -3116,22 +3116,22 @@ static void cm9761_update_jacks(struct snd_ac97 *ac97)
 	/* FIXME: check the bits for each model
 	 *        model 83 is confirmed to work
 	 */
-	static unsigned short surr_on[3][2] = {
+	static const unsigned short surr_on[3][2] = {
 		{ 0x0008, 0x0000 }, /* 9761-78 & 82 */
 		{ 0x0000, 0x0008 }, /* 9761-82 rev.B */
 		{ 0x0000, 0x0008 }, /* 9761-83 */
 	};
-	static unsigned short clfe_on[3][2] = {
+	static const unsigned short clfe_on[3][2] = {
 		{ 0x0000, 0x1000 }, /* 9761-78 & 82 */
 		{ 0x1000, 0x0000 }, /* 9761-82 rev.B */
 		{ 0x0000, 0x1000 }, /* 9761-83 */
 	};
-	static unsigned short surr_shared[3][2] = {
+	static const unsigned short surr_shared[3][2] = {
 		{ 0x0000, 0x0400 }, /* 9761-78 & 82 */
 		{ 0x0000, 0x0400 }, /* 9761-82 rev.B */
 		{ 0x0000, 0x0400 }, /* 9761-83 */
 	};
-	static unsigned short clfe_shared[3][2] = {
+	static const unsigned short clfe_shared[3][2] = {
 		{ 0x2000, 0x0880 }, /* 9761-78 & 82 */
 		{ 0x0000, 0x2880 }, /* 9761-82 rev.B */
 		{ 0x2000, 0x0800 }, /* 9761-83 */
@@ -3635,7 +3635,7 @@ struct vt1618_uaj_item {
 
 /* This list reflects the vt1618 docs for Vendor Defined Register 0x60. */
 
-static struct vt1618_uaj_item vt1618_uaj[3] = {
+static const struct vt1618_uaj_item vt1618_uaj[3] = {
 	{
 		/* speaker jack */
 		.mask  = 0x03,
diff --git a/sound/pci/ac97/ac97_pcm.c b/sound/pci/ac97/ac97_pcm.c
index 1c23a0f90559..491de1a623cb 100644
--- a/sound/pci/ac97/ac97_pcm.c
+++ b/sound/pci/ac97/ac97_pcm.c
@@ -26,7 +26,7 @@
  *  PCM support
  */
 
-static unsigned char rate_reg_tables[2][4][9] = {
+static const unsigned char rate_reg_tables[2][4][9] = {
 {
   /* standard rates */
   {
@@ -129,7 +129,7 @@ static unsigned char rate_reg_tables[2][4][9] = {
 }};
 
 /* FIXME: more various mappings for ADC? */
-static unsigned char rate_cregs[9] = {
+static const unsigned char rate_cregs[9] = {
 	AC97_PCM_LR_ADC_RATE,	/* 3 */
 	AC97_PCM_LR_ADC_RATE,	/* 4 */
 	0xff,			/* 5 */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
