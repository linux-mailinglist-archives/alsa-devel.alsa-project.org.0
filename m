Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EFB12F587
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:33:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FCB21748;
	Fri,  3 Jan 2020 09:32:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FCB21748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578040425;
	bh=L1t9scsuwjb6EwO6Zo/zlqmGvx1zzUjLseqBtQQEDTw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TMFO4SeFdZAi4ZP7U0rAKKdLYk3qkDKxCbhvXetoReeYs3uCY7Nq50fwG6IEww2Qz
	 VVxvwvG7PQ1ivpaq2N/oAogV6qWtgpCrsyXVzLetoEZcAc7Rb6CC194r1mR6F9CP0O
	 xHZfaSo3yN+9Kqy3s9zwr3IU7gvpiUmFZ/k3SrNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B3E9F80392;
	Fri,  3 Jan 2020 09:18:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 515EDF80349; Fri,  3 Jan 2020 09:18:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 234B5F8028D
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 234B5F8028D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1C6AEB272
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:46 +0100
Message-Id: <20200103081714.9560-31-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 30/58] ALSA: vx: Constify snd_vx_hardware and
	snd_vx_ops definitions
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

Both snd_vx_hardware and snd_vx_ops are only referred without
modification, hence they can be constified gracefully for further
optimizations.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/vx_core.h     |  9 +++++----
 sound/drivers/vx/vx_core.c  |  5 +++--
 sound/pci/vx222/vx222.c     | 12 ++++++------
 sound/pci/vx222/vx222.h     |  4 ++--
 sound/pci/vx222/vx222_ops.c |  4 ++--
 sound/pcmcia/vx/vxp_ops.c   |  2 +-
 sound/pcmcia/vx/vxpocket.c  |  4 ++--
 sound/pcmcia/vx/vxpocket.h  |  2 +-
 8 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/include/sound/vx_core.h b/include/sound/vx_core.h
index 84569ddf85e1..1ddd3036bdfc 100644
--- a/include/sound/vx_core.h
+++ b/include/sound/vx_core.h
@@ -147,8 +147,8 @@ struct vx_core {
 	/* ports are defined externally */
 
 	/* low-level functions */
-	struct snd_vx_hardware *hw;
-	struct snd_vx_ops *ops;
+	const struct snd_vx_hardware *hw;
+	const struct snd_vx_ops *ops;
 
 	struct mutex lock;
 
@@ -193,8 +193,9 @@ struct vx_core {
 /*
  * constructor
  */
-struct vx_core *snd_vx_create(struct snd_card *card, struct snd_vx_hardware *hw,
-			      struct snd_vx_ops *ops, int extra_size);
+struct vx_core *snd_vx_create(struct snd_card *card,
+			      const struct snd_vx_hardware *hw,
+			      const struct snd_vx_ops *ops, int extra_size);
 int snd_vx_setup_firmware(struct vx_core *chip);
 int snd_vx_load_boot_image(struct vx_core *chip, const struct firmware *dsp);
 int snd_vx_dsp_boot(struct vx_core *chip, const struct firmware *dsp);
diff --git a/sound/drivers/vx/vx_core.c b/sound/drivers/vx/vx_core.c
index 6bbc2a4f85c1..dd35de3f2434 100644
--- a/sound/drivers/vx/vx_core.c
+++ b/sound/drivers/vx/vx_core.c
@@ -765,8 +765,9 @@ EXPORT_SYMBOL(snd_vx_resume);
  *
  * return the instance pointer if successful, NULL in error.
  */
-struct vx_core *snd_vx_create(struct snd_card *card, struct snd_vx_hardware *hw,
-			      struct snd_vx_ops *ops,
+struct vx_core *snd_vx_create(struct snd_card *card,
+			      const struct snd_vx_hardware *hw,
+			      const struct snd_vx_ops *ops,
 			      int extra_size)
 {
 	struct vx_core *chip;
diff --git a/sound/pci/vx222/vx222.c b/sound/pci/vx222/vx222.c
index b278c72797d5..f7800ed1b67e 100644
--- a/sound/pci/vx222/vx222.c
+++ b/sound/pci/vx222/vx222.c
@@ -62,7 +62,7 @@ MODULE_DEVICE_TABLE(pci, snd_vx222_ids);
 static const DECLARE_TLV_DB_SCALE(db_scale_old_vol, -11350, 50, 0);
 static const DECLARE_TLV_DB_SCALE(db_scale_akm, -7350, 50, 0);
 
-static struct snd_vx_hardware vx222_old_hw = {
+static const struct snd_vx_hardware vx222_old_hw = {
 
 	.name = "VX222/Old",
 	.type = VX_TYPE_BOARD,
@@ -74,7 +74,7 @@ static struct snd_vx_hardware vx222_old_hw = {
 	.output_level_db_scale = db_scale_old_vol,
 };
 
-static struct snd_vx_hardware vx222_v2_hw = {
+static const struct snd_vx_hardware vx222_v2_hw = {
 
 	.name = "VX222/v2",
 	.type = VX_TYPE_V2,
@@ -86,7 +86,7 @@ static struct snd_vx_hardware vx222_v2_hw = {
 	.output_level_db_scale = db_scale_akm,
 };
 
-static struct snd_vx_hardware vx222_mic_hw = {
+static const struct snd_vx_hardware vx222_mic_hw = {
 
 	.name = "VX222/Mic",
 	.type = VX_TYPE_MIC,
@@ -122,7 +122,7 @@ static int snd_vx222_dev_free(struct snd_device *device)
 
 
 static int snd_vx222_create(struct snd_card *card, struct pci_dev *pci,
-			    struct snd_vx_hardware *hw,
+			    const struct snd_vx_hardware *hw,
 			    struct snd_vx222 **rchip)
 {
 	struct vx_core *chip;
@@ -131,7 +131,7 @@ static int snd_vx222_create(struct snd_card *card, struct pci_dev *pci,
 	static const struct snd_device_ops ops = {
 		.dev_free =	snd_vx222_dev_free,
 	};
-	struct snd_vx_ops *vx_ops;
+	const struct snd_vx_ops *vx_ops;
 
 	/* enable PCI device */
 	if ((err = pci_enable_device(pci)) < 0)
@@ -180,7 +180,7 @@ static int snd_vx222_probe(struct pci_dev *pci,
 {
 	static int dev;
 	struct snd_card *card;
-	struct snd_vx_hardware *hw;
+	const struct snd_vx_hardware *hw;
 	struct snd_vx222 *vx;
 	int err;
 
diff --git a/sound/pci/vx222/vx222.h b/sound/pci/vx222/vx222.h
index d27af637125c..46ddc6858a61 100644
--- a/sound/pci/vx222/vx222.h
+++ b/sound/pci/vx222/vx222.h
@@ -31,8 +31,8 @@ struct snd_vx222 {
 /* we use a lookup table with 148 values, see vx_mixer.c */
 #define VX2_AKM_LEVEL_MAX	0x93
 
-extern struct snd_vx_ops vx222_ops;
-extern struct snd_vx_ops vx222_old_ops;
+extern const struct snd_vx_ops vx222_ops;
+extern const struct snd_vx_ops vx222_old_ops;
 
 /* Offset of registers with base equal to portDSP. */
 #define VX_RESET_DMA_REGISTER_OFFSET    0x00000008
diff --git a/sound/pci/vx222/vx222_ops.c b/sound/pci/vx222/vx222_ops.c
index c145951e2fc6..6245240d8768 100644
--- a/sound/pci/vx222/vx222_ops.c
+++ b/sound/pci/vx222/vx222_ops.c
@@ -984,7 +984,7 @@ static int vx2_add_mic_controls(struct vx_core *_chip)
 /*
  * callbacks
  */
-struct snd_vx_ops vx222_ops = {
+const struct snd_vx_ops vx222_ops = {
 	.in8 = vx2_inb,
 	.in32 = vx2_inl,
 	.out8 = vx2_outb,
@@ -1004,7 +1004,7 @@ struct snd_vx_ops vx222_ops = {
 };
 
 /* for old VX222 board */
-struct snd_vx_ops vx222_old_ops = {
+const struct snd_vx_ops vx222_old_ops = {
 	.in8 = vx2_inb,
 	.in32 = vx2_inl,
 	.out8 = vx2_outb,
diff --git a/sound/pcmcia/vx/vxp_ops.c b/sound/pcmcia/vx/vxp_ops.c
index 447c6342eec8..f7cf707d315f 100644
--- a/sound/pcmcia/vx/vxp_ops.c
+++ b/sound/pcmcia/vx/vxp_ops.c
@@ -581,7 +581,7 @@ static void vxp_reset_board(struct vx_core *_chip, int cold_reset)
  * callbacks
  */
 /* exported */
-struct snd_vx_ops snd_vxpocket_ops = {
+const struct snd_vx_ops snd_vxpocket_ops = {
 	.in8 = vxp_inb,
 	.out8 = vxp_outb,
 	.test_and_ack = vxp_test_and_ack,
diff --git a/sound/pcmcia/vx/vxpocket.c b/sound/pcmcia/vx/vxpocket.c
index cad603ca0d93..afd30a90c807 100644
--- a/sound/pcmcia/vx/vxpocket.c
+++ b/sound/pcmcia/vx/vxpocket.c
@@ -82,7 +82,7 @@ static int snd_vxpocket_dev_free(struct snd_device *device)
 
 static const DECLARE_TLV_DB_SCALE(db_scale_old_vol, -11350, 50, 0);
 
-static struct snd_vx_hardware vxpocket_hw = {
+static const struct snd_vx_hardware vxpocket_hw = {
 	.name = "VXPocket",
 	.type = VX_TYPE_VXPOCKET,
 
@@ -104,7 +104,7 @@ static struct snd_vx_hardware vxpocket_hw = {
  * UER, but only for the first two inputs and outputs.
  */
 
-static struct snd_vx_hardware vxp440_hw = {
+static const struct snd_vx_hardware vxp440_hw = {
 	.name = "VXPocket440",
 	.type = VX_TYPE_VXP440,
 
diff --git a/sound/pcmcia/vx/vxpocket.h b/sound/pcmcia/vx/vxpocket.h
index 6dbd9f6bd2ff..bce616cc3aca 100644
--- a/sound/pcmcia/vx/vxpocket.h
+++ b/sound/pcmcia/vx/vxpocket.h
@@ -32,7 +32,7 @@ struct snd_vxpocket {
 
 #define to_vxpocket(x)	container_of(x, struct snd_vxpocket, core)
 
-extern struct snd_vx_ops snd_vxpocket_ops;
+extern const struct snd_vx_ops snd_vxpocket_ops;
 
 void vx_set_mic_boost(struct vx_core *chip, int boost);
 void vx_set_mic_level(struct vx_core *chip, int level);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
