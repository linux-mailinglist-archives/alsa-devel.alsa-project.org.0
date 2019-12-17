Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED768122671
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 09:16:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 402421657;
	Tue, 17 Dec 2019 09:16:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 402421657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576570615;
	bh=y4wj31/mesdMHgtjJVnbAZsaZB0wonFaAOQ9+wGTJjQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gVJo+Fv2iFaZCBTOrU8s67pP4SIOWg0qG6vpoX6yhpixJaRb3p3Xd3BleBovOaVDs
	 31mC2q9TCnuQwIBE/SxX9QZJcyQH7iYvpLLssodslFCLFZlmcc/Oqbo/DriJxs3zK3
	 kSjhevbHSNBTbH/SGpCYlDPFuncxxMSGngvmH6Rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E962F80100;
	Tue, 17 Dec 2019 09:15:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3BCEF80234; Tue, 17 Dec 2019 09:15:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAB05F80100
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 09:14:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAB05F80100
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3AA94ACD9
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 08:14:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 09:14:48 +0100
Message-Id: <20191217081448.1144-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: cmipci: Allow disabling MPU port via
	module option
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

Patrick May reported that his sound card with CMI8378 chip causes a
crash / reboot when accessing the MIDI port that isn't actually
present on the board.  Moreover, despite of the documentation,
passing mpu_port=0 doesn't disable the MIDI port on this board.

It implies that the chip is a newer revision and the MPU401 port is
integrated and mapped on the PCI register.  For this chip model, the
driver enables the MPU port unconditionally, so far.

Although fixing the unexpected reboot would be the best solution, it's
not so trivial to identify the cause.  So, as a plan B, this patch
extends the existing mpu_port option usage to allow disabling the port
by specifying the value 0, just like we applied for fm_port option in
commit 2f24d159d5ac ("[ALSA] cmipci - Allow to disable integrated FM
port").  As default, the MPU port is still enabled, but user can pass
mpu_port=0 to disable it.

Reported-and-tested-by: Patrick May <dusthillresident@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/alsa-configuration.rst | 3 ++-
 sound/pci/cmipci.c                         | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 02aacd69ab96..392875a1b94e 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -495,7 +495,8 @@ Module for C-Media CMI8338/8738/8768/8770 PCI sound cards.
 mpu_port
     port address of MIDI interface (8338 only):
     0x300,0x310,0x320,0x330 = legacy port,
-    0 = disable (default)
+    1 = integrated PCI port (default on 8738),
+    0 = disable
 fm_port
     port address of OPL-3 FM synthesizer (8x38 only):
     0x388 = legacy port,
diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 4bfab21c53f4..266c4cf28b78 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -42,7 +42,7 @@ MODULE_SUPPORTED_DEVICE("{{C-Media,CMI8738},"
 static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;	/* Index 0-MAX */
 static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;	/* ID for this card */
 static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;	/* Enable switches */
-static long mpu_port[SNDRV_CARDS];
+static long mpu_port[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] = 1};
 static long fm_port[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)]=1};
 static bool soft_ac3[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)]=1};
 #ifdef SUPPORT_JOYSTICK
@@ -3132,7 +3132,8 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 	if (cm->chip_version >= 39) {
 		val = snd_cmipci_read_b(cm, CM_REG_MPU_PCI + 1);
 		if (val != 0x00 && val != 0xff) {
-			iomidi = cm->iobase + CM_REG_MPU_PCI;
+			if (mpu_port[dev])
+				iomidi = cm->iobase + CM_REG_MPU_PCI;
 			integrated_midi = 1;
 		}
 	}
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
