Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7654130881
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:01:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C52D1779;
	Sun,  5 Jan 2020 16:00:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C52D1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236471;
	bh=YSE7Aja9qWQiGysgwURgJ9OFtPKQZRMHxf88iTt4o18=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HCl5FNSsMafDhoT2qp8PQbXo0SirgMs/tNmTgujiaAqSMlpn3ld9QvaYRgZClm4Ih
	 MLnMMNixuE0VRRrPF8ZYdVF10Ma3Il6R7M8O8hwmw7ea3+XBick7h7xMMqoaReoN+2
	 quO768M8cjOrqqAuifxdDLRSdaX9H2GwE0D2dJyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7978DF8029B;
	Sun,  5 Jan 2020 15:49:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AB93F8033E; Sun,  5 Jan 2020 15:49:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D24BF80277
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D24BF80277
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5BE83B1D6
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:30 +0100
Message-Id: <20200105144823.29547-16-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 15/68] ALSA: riptide: More constifications
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

Apply const prefix to each lbus path table definition and its
callers.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/riptide/riptide.c | 60 ++++++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 625c85428955..b4f300281822 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -361,9 +361,9 @@ enum RT_CHANNEL_IDS {
 enum { SB_CMD = 0, MODEM_CMD, I2S_CMD0, I2S_CMD1, FM_CMD, MAX_CMD };
 
 struct lbuspath {
-	unsigned char *noconv;
-	unsigned char *stereo;
-	unsigned char *mono;
+	const unsigned char *noconv;
+	const unsigned char *stereo;
+	const unsigned char *mono;
 };
 
 struct cmdport {
@@ -464,7 +464,7 @@ struct sgd {			/* scatter gather desriptor */
 
 struct pcmhw {			/* pcm descriptor */
 	struct lbuspath paths;
-	unsigned char *lbuspath;
+	const unsigned char *lbuspath;
 	unsigned char source;
 	unsigned char intdec[2];
 	unsigned char mixer;
@@ -517,7 +517,7 @@ MODULE_DEVICE_TABLE(pci, snd_riptide_ids);
 /*
  */
 
-static unsigned char lbusin2out[E2SINK_MAX + 1][2] = {
+static const unsigned char lbusin2out[E2SINK_MAX + 1][2] = {
 	{NO_OUT, LS_NONE1}, {NO_OUT, LS_NONE2}, {NO_OUT, LS_NONE1}, {NO_OUT,
 								     LS_NONE2},
 	{NO_OUT, LS_NONE1}, {NO_OUT, LS_NONE2}, {NO_OUT, LS_NONE1}, {NO_OUT,
@@ -557,63 +557,63 @@ static unsigned char lbusin2out[E2SINK_MAX + 1][2] = {
 								     LS_NONE2},
 };
 
-static unsigned char lbus_play_opl3[] = {
+static const unsigned char lbus_play_opl3[] = {
 	DIGITAL_MIXER_IN0 + FM_MIXER, 0xff
 };
-static unsigned char lbus_play_modem[] = {
+static const unsigned char lbus_play_modem[] = {
 	DIGITAL_MIXER_IN0 + MODEM_MIXER, 0xff
 };
-static unsigned char lbus_play_i2s[] = {
+static const unsigned char lbus_play_i2s[] = {
 	INTER0_IN + I2S_INTDEC, DIGITAL_MIXER_IN0 + I2S_MIXER, 0xff
 };
-static unsigned char lbus_play_out[] = {
+static const unsigned char lbus_play_out[] = {
 	PDAC2ACLNK, 0xff
 };
-static unsigned char lbus_play_outhp[] = {
+static const unsigned char lbus_play_outhp[] = {
 	HNDSPK2ACLNK, 0xff
 };
-static unsigned char lbus_play_noconv1[] = {
+static const unsigned char lbus_play_noconv1[] = {
 	DIGITAL_MIXER_IN0, 0xff
 };
-static unsigned char lbus_play_stereo1[] = {
+static const unsigned char lbus_play_stereo1[] = {
 	INTER0_IN, DIGITAL_MIXER_IN0, 0xff
 };
-static unsigned char lbus_play_mono1[] = {
+static const unsigned char lbus_play_mono1[] = {
 	INTERM0_IN, DIGITAL_MIXER_IN0, 0xff
 };
-static unsigned char lbus_play_noconv2[] = {
+static const unsigned char lbus_play_noconv2[] = {
 	DIGITAL_MIXER_IN1, 0xff
 };
-static unsigned char lbus_play_stereo2[] = {
+static const unsigned char lbus_play_stereo2[] = {
 	INTER1_IN, DIGITAL_MIXER_IN1, 0xff
 };
-static unsigned char lbus_play_mono2[] = {
+static const unsigned char lbus_play_mono2[] = {
 	INTERM1_IN, DIGITAL_MIXER_IN1, 0xff
 };
-static unsigned char lbus_play_noconv3[] = {
+static const unsigned char lbus_play_noconv3[] = {
 	DIGITAL_MIXER_IN2, 0xff
 };
-static unsigned char lbus_play_stereo3[] = {
+static const unsigned char lbus_play_stereo3[] = {
 	INTER2_IN, DIGITAL_MIXER_IN2, 0xff
 };
-static unsigned char lbus_play_mono3[] = {
+static const unsigned char lbus_play_mono3[] = {
 	INTERM2_IN, DIGITAL_MIXER_IN2, 0xff
 };
-static unsigned char lbus_rec_noconv1[] = {
+static const unsigned char lbus_rec_noconv1[] = {
 	LBUS2ARM_FIFO5, 0xff
 };
-static unsigned char lbus_rec_stereo1[] = {
+static const unsigned char lbus_rec_stereo1[] = {
 	DECIM0_IN, LBUS2ARM_FIFO5, 0xff
 };
-static unsigned char lbus_rec_mono1[] = {
+static const unsigned char lbus_rec_mono1[] = {
 	DECIMM3_IN, LBUS2ARM_FIFO5, 0xff
 };
 
-static unsigned char play_ids[] = { 4, 1, 2, };
-static unsigned char play_sources[] = {
+static const unsigned char play_ids[] = { 4, 1, 2, };
+static const unsigned char play_sources[] = {
 	ARM2LBUS_FIFO4, ARM2LBUS_FIFO1, ARM2LBUS_FIFO2,
 };
-static struct lbuspath lbus_play_paths[] = {
+static const struct lbuspath lbus_play_paths[] = {
 	{
 	 .noconv = lbus_play_noconv1,
 	 .stereo = lbus_play_stereo1,
@@ -737,7 +737,7 @@ static int loadfirmware(struct cmdif *cif, const unsigned char *img,
 
 static void
 alloclbuspath(struct cmdif *cif, unsigned char source,
-	      unsigned char *path, unsigned char *mixer, unsigned char *s)
+	      const unsigned char *path, unsigned char *mixer, unsigned char *s)
 {
 	while (*path != 0xff) {
 		unsigned char sink, type;
@@ -765,7 +765,7 @@ alloclbuspath(struct cmdif *cif, unsigned char source,
 			}
 		}
 		if (*path++ & SPLIT_PATH) {
-			unsigned char *npath = path;
+			const unsigned char *npath = path;
 
 			while (*npath != 0xff)
 				npath++;
@@ -775,7 +775,7 @@ alloclbuspath(struct cmdif *cif, unsigned char source,
 }
 
 static void
-freelbuspath(struct cmdif *cif, unsigned char source, unsigned char *path)
+freelbuspath(struct cmdif *cif, unsigned char source, const unsigned char *path)
 {
 	while (*path != 0xff) {
 		unsigned char sink;
@@ -787,7 +787,7 @@ freelbuspath(struct cmdif *cif, unsigned char source, unsigned char *path)
 			source = lbusin2out[sink][0];
 		}
 		if (*path++ & SPLIT_PATH) {
-			unsigned char *npath = path;
+			const unsigned char *npath = path;
 
 			while (*npath != 0xff)
 				npath++;
@@ -1441,7 +1441,7 @@ static int snd_riptide_prepare(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct pcmhw *data = get_pcmhwdev(substream);
 	struct cmdif *cif = chip->cif;
-	unsigned char *lbuspath = NULL;
+	const unsigned char *lbuspath = NULL;
 	unsigned int rate, channels;
 	int err = 0;
 	snd_pcm_format_t format;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
