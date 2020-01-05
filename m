Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D2E130875
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 15:54:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7951E1779;
	Sun,  5 Jan 2020 15:54:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7951E1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236094;
	bh=UkBovUAS7Vr31d4Tac1wElI9cspVnZj1CStkQZuU5k8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GoZQc7Q0oatDsNrIFPRGB+/ps5d5MfMpIJeuV0Vh/lrKR1gjsFO/yH5KSnZxCHQFe
	 N5wK2V/uamap7jtSD88i2ojfkl4FNrDOwpUNgXpcVI7UDoBk7K44Japsdc0UDCJeGb
	 CqBJtFHf0I7OpNCRez2yx+Vo3NjRr/gwaZc6IXso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E0E5F80277;
	Sun,  5 Jan 2020 15:49:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CD8FF80328; Sun,  5 Jan 2020 15:48:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41822F80216
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41822F80216
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DC526B185
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:31 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:22 +0100
Message-Id: <20200105144823.29547-8-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 07/68] ALSA: vx: More constifications
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

Apply const prefix to every possible place: the static tables for DSP
commands, the string tables, and register/offset tables.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/vx/vx_cmd.c   |  2 +-
 sound/drivers/vx/vx_core.c  | 12 ++++++------
 sound/drivers/vx/vx_hwdep.c |  2 +-
 sound/drivers/vx/vx_mixer.c |  2 +-
 sound/pci/vx222/vx222_ops.c |  4 ++--
 sound/pcmcia/vx/vxp_ops.c   |  2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/drivers/vx/vx_cmd.c b/sound/drivers/vx/vx_cmd.c
index 77ae59aef4e0..b0970a04883e 100644
--- a/sound/drivers/vx/vx_cmd.c
+++ b/sound/drivers/vx/vx_cmd.c
@@ -15,7 +15,7 @@
 /*
  * Array of DSP commands
  */
-static struct vx_cmd_info vx_dsp_cmds[] = {
+static const struct vx_cmd_info vx_dsp_cmds[] = {
 [CMD_VERSION] =			{ 0x010000, 2, RMH_SSIZE_FIXED, 1 },
 [CMD_SUPPORTED] =		{ 0x020000, 1, RMH_SSIZE_FIXED, 2 },
 [CMD_TEST_IT] =			{ 0x040000, 1, RMH_SSIZE_FIXED, 1 },
diff --git a/sound/drivers/vx/vx_core.c b/sound/drivers/vx/vx_core.c
index dd35de3f2434..ffab0400d7fb 100644
--- a/sound/drivers/vx/vx_core.c
+++ b/sound/drivers/vx/vx_core.c
@@ -39,7 +39,7 @@ MODULE_LICENSE("GPL");
 int snd_vx_check_reg_bit(struct vx_core *chip, int reg, int mask, int bit, int time)
 {
 	unsigned long end_time = jiffies + (time * HZ + 999) / 1000;
-	static char *reg_names[VX_REG_MAX] = {
+	static const char * const reg_names[VX_REG_MAX] = {
 		"ICR", "CVR", "ISR", "IVR", "RXH", "RXM", "RXL",
 		"DMA", "CDSP", "RFREQ", "RUER/V2", "DATA", "MEMIRQ",
 		"ACQ", "BIT0", "BIT1", "MIC0", "MIC1", "MIC2",
@@ -588,11 +588,11 @@ static void vx_reset_board(struct vx_core *chip, int cold_reset)
 static void vx_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *buffer)
 {
 	struct vx_core *chip = entry->private_data;
-	static char *audio_src_vxp[] = { "Line", "Mic", "Digital" };
-	static char *audio_src_vx2[] = { "Analog", "Analog", "Digital" };
-	static char *clock_mode[] = { "Auto", "Internal", "External" };
-	static char *clock_src[] = { "Internal", "External" };
-	static char *uer_type[] = { "Consumer", "Professional", "Not Present" };
+	static const char * const audio_src_vxp[] = { "Line", "Mic", "Digital" };
+	static const char * const audio_src_vx2[] = { "Analog", "Analog", "Digital" };
+	static const char * const clock_mode[] = { "Auto", "Internal", "External" };
+	static const char * const clock_src[] = { "Internal", "External" };
+	static const char * const uer_type[] = { "Consumer", "Professional", "Not Present" };
 	
 	snd_iprintf(buffer, "%s\n", chip->card->longname);
 	snd_iprintf(buffer, "Xilinx Firmware: %s\n",
diff --git a/sound/drivers/vx/vx_hwdep.c b/sound/drivers/vx/vx_hwdep.c
index f0d31b0a178e..01baa6d872e9 100644
--- a/sound/drivers/vx/vx_hwdep.c
+++ b/sound/drivers/vx/vx_hwdep.c
@@ -32,7 +32,7 @@ MODULE_FIRMWARE("vx/l_1_vp4.d56");
 
 int snd_vx_setup_firmware(struct vx_core *chip)
 {
-	static char *fw_files[VX_TYPE_NUMS][4] = {
+	static const char * const fw_files[VX_TYPE_NUMS][4] = {
 		[VX_TYPE_BOARD] = {
 			NULL, "x1_1_vx2.xlx", "bd56002.boot", "l_1_vx2.d56",
 		},
diff --git a/sound/drivers/vx/vx_mixer.c b/sound/drivers/vx/vx_mixer.c
index b17c67b14d59..13099f8c84d6 100644
--- a/sound/drivers/vx/vx_mixer.c
+++ b/sound/drivers/vx/vx_mixer.c
@@ -961,7 +961,7 @@ int snd_vx_mixer_new(struct vx_core *chip)
 		return err;
 	/* VU, peak, saturation meters */
 	for (c = 0; c < 2; c++) {
-		static char *dir[2] = { "Output", "Input" };
+		static const char * const dir[2] = { "Output", "Input" };
 		for (i = 0; i < chip->hw->num_ins; i++) {
 			int val = (i * 2) | (c << 8);
 			if (c == 1) {
diff --git a/sound/pci/vx222/vx222_ops.c b/sound/pci/vx222/vx222_ops.c
index 6245240d8768..23d4338dc553 100644
--- a/sound/pci/vx222/vx222_ops.c
+++ b/sound/pci/vx222/vx222_ops.c
@@ -19,7 +19,7 @@
 #include "vx222.h"
 
 
-static int vx2_reg_offset[VX_REG_MAX] = {
+static const int vx2_reg_offset[VX_REG_MAX] = {
 	[VX_ICR]    = 0x00,
 	[VX_CVR]    = 0x04,
 	[VX_ISR]    = 0x08,
@@ -45,7 +45,7 @@ static int vx2_reg_offset[VX_REG_MAX] = {
 	[VX_GPIOC]  = 0x54,		// VX_GPIOC (new with PLX9030)
 };
 
-static int vx2_reg_index[VX_REG_MAX] = {
+static const int vx2_reg_index[VX_REG_MAX] = {
 	[VX_ICR]	= 1,
 	[VX_CVR]	= 1,
 	[VX_ISR]	= 1,
diff --git a/sound/pcmcia/vx/vxp_ops.c b/sound/pcmcia/vx/vxp_ops.c
index f7cf707d315f..45eeb0f57d59 100644
--- a/sound/pcmcia/vx/vxp_ops.c
+++ b/sound/pcmcia/vx/vxp_ops.c
@@ -15,7 +15,7 @@
 #include "vxpocket.h"
 
 
-static int vxp_reg_offset[VX_REG_MAX] = {
+static const int vxp_reg_offset[VX_REG_MAX] = {
 	[VX_ICR]	= 0x00,		// ICR
 	[VX_CVR]	= 0x01,		// CVR
 	[VX_ISR]	= 0x02,		// ISR
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
