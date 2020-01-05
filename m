Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9655413087E
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 15:59:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BDA317B8;
	Sun,  5 Jan 2020 15:59:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BDA317B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236390;
	bh=nBLsi82AVbsqlMwKxIm5imtc1/4BIvCziHL3HDTNMjY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=miGNUn3pU7Y4Rz1WaO5K88hVAFX9MS7Q4+hdQSbZFyXWdhlkmx6Mvl3eaJDAWPlsT
	 RTDDPVzA/fFggNziUJ7BoSP9eYrNOThLy4C1MVJPucBARJTFRs1ykEUHtn9wayWr7g
	 bsrIKcoElBhK0F66hSZQmkB9st0fidozw0Sa08Tk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEEFDF80290;
	Sun,  5 Jan 2020 15:49:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B997FF80333; Sun,  5 Jan 2020 15:48:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9021F80276
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9021F80276
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3EC0CB1D1
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:28 +0100
Message-Id: <20200105144823.29547-14-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 13/68] ALSA: au88x0: More constifications
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

Apply const prefix to each possible place: the static register tables,
the coef tables, the string arrays, etc.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/au88x0/au88x0_core.c   |  2 +-
 sound/pci/au88x0/au88x0_eq.c     | 22 +++++++++++-----------
 sound/pci/au88x0/au88x0_eqdata.c | 18 +++++++++---------
 sound/pci/au88x0/au88x0_pcm.c    |  4 ++--
 4 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/sound/pci/au88x0/au88x0_core.c b/sound/pci/au88x0/au88x0_core.c
index ce0564c5392a..f5512b72b3e0 100644
--- a/sound/pci/au88x0/au88x0_core.c
+++ b/sound/pci/au88x0/au88x0_core.c
@@ -1989,7 +1989,7 @@ vortex_connect_codecrec(vortex_t * vortex, int en, unsigned char mixin0,
 // Higher level ADB audio path (de)allocator.
 
 /* Resource manager */
-static int resnum[VORTEX_RESOURCE_LAST] =
+static const int resnum[VORTEX_RESOURCE_LAST] =
     { NR_ADB, NR_SRC, NR_MIXIN, NR_MIXOUT, NR_A3D };
 /*
  Checkout/Checkin resource of given type. 
diff --git a/sound/pci/au88x0/au88x0_eq.c b/sound/pci/au88x0/au88x0_eq.c
index abaf9f912784..58e92f2a72c0 100644
--- a/sound/pci/au88x0/au88x0_eq.c
+++ b/sound/pci/au88x0/au88x0_eq.c
@@ -51,7 +51,7 @@ static inline u16 sign_invert(u16 a)
 		return -a;
 }
 
-static void vortex_EqHw_SetLeftCoefs(vortex_t * vortex, u16 coefs[])
+static void vortex_EqHw_SetLeftCoefs(vortex_t *vortex, const u16 coefs[])
 {
 	eqhw_t *eqhw = &(vortex->eq.this04);
 	int i = 0, n /*esp2c */;
@@ -73,7 +73,7 @@ static void vortex_EqHw_SetLeftCoefs(vortex_t * vortex, u16 coefs[])
 	}
 }
 
-static void vortex_EqHw_SetRightCoefs(vortex_t * vortex, u16 coefs[])
+static void vortex_EqHw_SetRightCoefs(vortex_t *vortex, const u16 coefs[])
 {
 	eqhw_t *eqhw = &(vortex->eq.this04);
 	int i = 0, n /*esp2c */;
@@ -96,7 +96,7 @@ static void vortex_EqHw_SetRightCoefs(vortex_t * vortex, u16 coefs[])
 
 }
 
-static void vortex_EqHw_SetLeftStates(vortex_t * vortex, u16 a[], u16 b[])
+static void vortex_EqHw_SetLeftStates(vortex_t *vortex, const u16 a[], const u16 b[])
 {
 	eqhw_t *eqhw = &(vortex->eq.this04);
 	int i = 0, ebx;
@@ -113,7 +113,7 @@ static void vortex_EqHw_SetLeftStates(vortex_t * vortex, u16 a[], u16 b[])
 	}
 }
 
-static void vortex_EqHw_SetRightStates(vortex_t * vortex, u16 a[], u16 b[])
+static void vortex_EqHw_SetRightStates(vortex_t *vortex, const u16 a[], const u16 b[])
 {
 	eqhw_t *eqhw = &(vortex->eq.this04);
 	int i = 0, ebx;
@@ -206,7 +206,7 @@ vortex_EqHw_SetRightGainsSingleTarget(vortex_t * vortex, u16 index, u16 b)
 	hwwrite(vortex->mmio, 0x2b20c + (index * 0x30), b);
 }
 
-static void vortex_EqHw_SetLeftGainsTarget(vortex_t * vortex, u16 a[])
+static void vortex_EqHw_SetLeftGainsTarget(vortex_t *vortex, const u16 a[])
 {
 	eqhw_t *eqhw = &(vortex->eq.this04);
 	int ebx;
@@ -216,7 +216,7 @@ static void vortex_EqHw_SetLeftGainsTarget(vortex_t * vortex, u16 a[])
 	}
 }
 
-static void vortex_EqHw_SetRightGainsTarget(vortex_t * vortex, u16 a[])
+static void vortex_EqHw_SetRightGainsTarget(vortex_t *vortex, const u16 a[])
 {
 	eqhw_t *eqhw = &(vortex->eq.this04);
 	int ebx;
@@ -226,7 +226,7 @@ static void vortex_EqHw_SetRightGainsTarget(vortex_t * vortex, u16 a[])
 	}
 }
 
-static void vortex_EqHw_SetLeftGainsCurrent(vortex_t * vortex, u16 a[])
+static void vortex_EqHw_SetLeftGainsCurrent(vortex_t *vortex, const u16 a[])
 {
 	eqhw_t *eqhw = &(vortex->eq.this04);
 	int ebx;
@@ -236,7 +236,7 @@ static void vortex_EqHw_SetLeftGainsCurrent(vortex_t * vortex, u16 a[])
 	}
 }
 
-static void vortex_EqHw_SetRightGainsCurrent(vortex_t * vortex, u16 a[])
+static void vortex_EqHw_SetRightGainsCurrent(vortex_t *vortex, const u16 a[])
 {
 	eqhw_t *eqhw = &(vortex->eq.this04);
 	int ebx;
@@ -309,7 +309,7 @@ static void vortex_EqHw_GetRightGainsCurrent(vortex_t * vortex, u16 a[])
 
 #endif
 /* EQ band levels settings */
-static void vortex_EqHw_SetLevels(vortex_t * vortex, u16 peaks[])
+static void vortex_EqHw_SetLevels(vortex_t *vortex, const u16 peaks[])
 {
 	eqhw_t *eqhw = &(vortex->eq.this04);
 	int i;
@@ -574,7 +574,7 @@ static int vortex_Eqlzr_SetAllBandsFromActiveCoeffSet(vortex_t * vortex)
 }
 
 static int
-vortex_Eqlzr_SetAllBands(vortex_t * vortex, u16 gains[], s32 count)
+vortex_Eqlzr_SetAllBands(vortex_t *vortex, const u16 gains[], s32 count)
 {
 	eqlzr_t *eq = &(vortex->eq);
 	int i;
@@ -852,7 +852,7 @@ static const struct snd_kcontrol_new vortex_levels_kcontrol = {
 };
 
 /* EQ band gain labels. */
-static char *EqBandLabels[10] = {
+static const char * const EqBandLabels[10] = {
 	"EQ0 31Hz\0",
 	"EQ1 63Hz\0",
 	"EQ2 125Hz\0",
diff --git a/sound/pci/au88x0/au88x0_eqdata.c b/sound/pci/au88x0/au88x0_eqdata.c
index 49a52d298b1a..a74f266f0bd0 100644
--- a/sound/pci/au88x0/au88x0_eqdata.c
+++ b/sound/pci/au88x0/au88x0_eqdata.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Data structs */
 
-static u16 asEqCoefsZeros[50] = {
+static const u16 asEqCoefsZeros[50] = {
 	0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
 	0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
 	0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
@@ -14,7 +14,7 @@ static u16 asEqCoefsZeros[50] = {
 	0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
 };
 
-static u16 asEqCoefsPipes[64] = {
+static const u16 asEqCoefsPipes[64] = {
 	0x0000, 0x0000,
 	0x0000, 0x0666, 0x0000, 0x0000, 0x0666,
 	0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
@@ -33,7 +33,7 @@ static u16 asEqCoefsPipes[64] = {
 };
 
 /* More coef sets can be found in the win2k "inf" file. */
-static auxxEqCoeffSet_t asEqCoefsNormal = {
+static const auxxEqCoeffSet_t asEqCoefsNormal = {
 	.LeftCoefs = {
 		      0x7e60, 0xc19e, 0x0001, 0x0002, 0x0001,
 		      0x7fa0, 0xc05f, 0x004f, 0x0000, 0xffb1,
@@ -66,7 +66,7 @@ static auxxEqCoeffSet_t asEqCoefsNormal = {
 		       0x3e96, 0x3e96, 0x3e96, 0x3e96, 0x3e96}
 };
 
-static u16 eq_gains_normal[20] = {
+static const u16 eq_gains_normal[20] = {
 	0x3e96, 0x3e96, 0x3e96, 0x3e96, 0x3e96,
 	0x3e96, 0x3e96, 0x3e96, 0x3e96, 0x3e96,
 	0x3e96, 0x3e96, 0x3e96, 0x3e96, 0x3e96,
@@ -74,22 +74,22 @@ static u16 eq_gains_normal[20] = {
 };
 
 /* _rodatab60 */
-static u16 eq_gains_zero[10] = {
+static const u16 eq_gains_zero[10] = {
 	0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
 	0x0000, 0x0000, 0x0000, 0x0000, 0x0000
 };
 
 /* _rodatab7c:  ProgramPipe */
-static u16 eq_gains_current[12] = {
+static const u16 eq_gains_current[12] = {
 	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff,
 	0x7fff,
 	0x7fff, 0x7fff, 0x7fff
 };
 
 /* _rodatab78 */
-static u16 eq_states_zero[2] = { 0x0000, 0x0000 };
+static const u16 eq_states_zero[2] = { 0x0000, 0x0000 };
 
-static u16 asEqOutStateZeros[48] = {
+static const u16 asEqOutStateZeros[48] = {
 	0x0000, 0x0000, 0x0000, 0x0000,
 	0x0000, 0x0000, 0x0000, 0x0000,
 	0x0000, 0x0000, 0x0000, 0x0000,
@@ -105,7 +105,7 @@ static u16 asEqOutStateZeros[48] = {
 };
 
 /*_rodataba0:*/
-static u16 eq_levels[64] = {
+static const u16 eq_levels[64] = {
 	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
 	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
 	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
diff --git a/sound/pci/au88x0/au88x0_pcm.c b/sound/pci/au88x0/au88x0_pcm.c
index 2cdb7845f651..d019aa566de3 100644
--- a/sound/pci/au88x0/au88x0_pcm.c
+++ b/sound/pci/au88x0/au88x0_pcm.c
@@ -433,14 +433,14 @@ static const struct snd_pcm_ops snd_vortex_playback_ops = {
 *  definitions of capture are omitted here...
 */
 
-static char *vortex_pcm_prettyname[VORTEX_PCM_LAST] = {
+static const char * const vortex_pcm_prettyname[VORTEX_PCM_LAST] = {
 	CARD_NAME " ADB",
 	CARD_NAME " SPDIF",
 	CARD_NAME " A3D",
 	CARD_NAME " WT",
 	CARD_NAME " I2S",
 };
-static char *vortex_pcm_name[VORTEX_PCM_LAST] = {
+static const char * const vortex_pcm_name[VORTEX_PCM_LAST] = {
 	"adb",
 	"spdif",
 	"a3d",
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
