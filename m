Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3665130885
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:03:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7283417C9;
	Sun,  5 Jan 2020 16:02:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7283417C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236593;
	bh=lXW2ZjVsONNWLpk8eVcGKvFI42fucZGwNneqQ1/DywY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qg+yxceKWpgkESsP7JA0aSuMFXUD0IEesv5hZAzS5aP3aF+AsIZT2RYcxb2LkLzxz
	 kJwPN8sQel+ec9OCYRSU/g41Eva/D/5z6DyTGAlShvAHvKiDT1ph2MRv/8e9o79Lut
	 l9G+3TYrd+m1R9642rpWIf40/MpxvCYmaXCeTWQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C03D0F802BD;
	Sun,  5 Jan 2020 15:49:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CF88F80340; Sun,  5 Jan 2020 15:49:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C84A1F80279
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C84A1F80279
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DCA7BB242
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:39 +0100
Message-Id: <20200105144823.29547-25-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 24/68] ALSA: mixart: More constifications
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

Apply const prefix to each possible place: the string arrays and the
static tables for volumes.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/mixart/mixart_hwdep.c | 2 +-
 sound/pci/mixart/mixart_mixer.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/mixart/mixart_hwdep.c b/sound/pci/mixart/mixart_hwdep.c
index 92b051c6572d..13dcb2fd0a85 100644
--- a/sound/pci/mixart/mixart_hwdep.c
+++ b/sound/pci/mixart/mixart_hwdep.c
@@ -548,7 +548,7 @@ static int mixart_dsp_load(struct mixart_mgr* mgr, int index, const struct firmw
 
 int snd_mixart_setup_firmware(struct mixart_mgr *mgr)
 {
-	static char *fw_files[3] = {
+	static const char * const fw_files[3] = {
 		"miXart8.xlx", "miXart8.elf", "miXart8AES.xlx"
 	};
 	char path[32];
diff --git a/sound/pci/mixart/mixart_mixer.c b/sound/pci/mixart/mixart_mixer.c
index 1378f9ee70a9..d2e7c3381267 100644
--- a/sound/pci/mixart/mixart_mixer.c
+++ b/sound/pci/mixart/mixart_mixer.c
@@ -20,7 +20,7 @@
 #include <sound/tlv.h>
 #include "mixart_mixer.h"
 
-static u32 mixart_analog_level[256] = {
+static const u32 mixart_analog_level[256] = {
 	0xc2c00000,		/* [000] -96.0 dB */
 	0xc2bf0000,		/* [001] -95.5 dB */
 	0xc2be0000,		/* [002] -95.0 dB */
@@ -443,7 +443,7 @@ static const struct snd_kcontrol_new mixart_control_output_switch = {
 	.put =          mixart_audio_sw_put
 };
 
-static u32 mixart_digital_level[256] = {
+static const u32 mixart_digital_level[256] = {
 	0x00000000,		/* [000] = 0.00e+000 = mute if <= -109.5dB */
 	0x366e1c7a,		/* [001] = 3.55e-006 = pow(10.0, 0.05 * -109.0dB) */
 	0x367c3860,		/* [002] = 3.76e-006 = pow(10.0, 0.05 * -108.5dB) */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
