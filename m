Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC3B130883
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:01:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 699F71764;
	Sun,  5 Jan 2020 16:01:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 699F71764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236513;
	bh=KC9jwusZhj5a48iBsG3toGJ/nmy/SaQpwJH3eYvz2wM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a1g2VjJgvJt+xk0C0Nfl/PzdFPLZ8Vk7r8PbnXz8ChtNfAUkeByNYZcUGsFhsNaYP
	 7UVCYSr4rN4iFdOj46691CkSrQ2TI29JfKWE/G5Np7OPPm3exqVgYsKkVKzOp5HBX6
	 hAHxwni01QSx5QGmRk3V8cndpQQr1z9OlmvxgNB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7414CF802A2;
	Sun,  5 Jan 2020 15:49:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7DBDF8033E; Sun,  5 Jan 2020 15:49:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A592FF8027B
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A592FF8027B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 98CBDB1EC
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:34 +0100
Message-Id: <20200105144823.29547-20-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 19/68] ALSA: hdspm: More constifications
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

Apply const prefix to each possible place: the string arrays, the
channel map tables and callers.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdspm.c | 66 +++++++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index f926899e4755..2212d5799151 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -637,7 +637,7 @@ MODULE_SUPPORTED_DEVICE("{{RME HDSPM-MADI}}");
 #define HDSPM_SPEED_QUAD   2
 
 /* names for speed modes */
-static char *hdspm_speed_names[] = { "single", "double", "quad" };
+static const char * const hdspm_speed_names[] = { "single", "double", "quad" };
 
 static const char *const texts_autosync_aes_tco[] = { "Word Clock",
 					  "AES1", "AES2", "AES3", "AES4",
@@ -684,7 +684,7 @@ static const char *const texts_freq[] = {
 	"192 kHz"
 };
 
-static char *texts_ports_madi[] = {
+static const char * const texts_ports_madi[] = {
 	"MADI.1", "MADI.2", "MADI.3", "MADI.4", "MADI.5", "MADI.6",
 	"MADI.7", "MADI.8", "MADI.9", "MADI.10", "MADI.11", "MADI.12",
 	"MADI.13", "MADI.14", "MADI.15", "MADI.16", "MADI.17", "MADI.18",
@@ -699,7 +699,7 @@ static char *texts_ports_madi[] = {
 };
 
 
-static char *texts_ports_raydat_ss[] = {
+static const char * const texts_ports_raydat_ss[] = {
 	"ADAT1.1", "ADAT1.2", "ADAT1.3", "ADAT1.4", "ADAT1.5", "ADAT1.6",
 	"ADAT1.7", "ADAT1.8", "ADAT2.1", "ADAT2.2", "ADAT2.3", "ADAT2.4",
 	"ADAT2.5", "ADAT2.6", "ADAT2.7", "ADAT2.8", "ADAT3.1", "ADAT3.2",
@@ -710,7 +710,7 @@ static char *texts_ports_raydat_ss[] = {
 	"SPDIF.L", "SPDIF.R"
 };
 
-static char *texts_ports_raydat_ds[] = {
+static const char * const texts_ports_raydat_ds[] = {
 	"ADAT1.1", "ADAT1.2", "ADAT1.3", "ADAT1.4",
 	"ADAT2.1", "ADAT2.2", "ADAT2.3", "ADAT2.4",
 	"ADAT3.1", "ADAT3.2", "ADAT3.3", "ADAT3.4",
@@ -719,7 +719,7 @@ static char *texts_ports_raydat_ds[] = {
 	"SPDIF.L", "SPDIF.R"
 };
 
-static char *texts_ports_raydat_qs[] = {
+static const char * const texts_ports_raydat_qs[] = {
 	"ADAT1.1", "ADAT1.2",
 	"ADAT2.1", "ADAT2.2",
 	"ADAT3.1", "ADAT3.2",
@@ -729,7 +729,7 @@ static char *texts_ports_raydat_qs[] = {
 };
 
 
-static char *texts_ports_aio_in_ss[] = {
+static const char * const texts_ports_aio_in_ss[] = {
 	"Analogue.L", "Analogue.R",
 	"AES.L", "AES.R",
 	"SPDIF.L", "SPDIF.R",
@@ -738,7 +738,7 @@ static char *texts_ports_aio_in_ss[] = {
 	"AEB.1", "AEB.2", "AEB.3", "AEB.4"
 };
 
-static char *texts_ports_aio_out_ss[] = {
+static const char * const texts_ports_aio_out_ss[] = {
 	"Analogue.L", "Analogue.R",
 	"AES.L", "AES.R",
 	"SPDIF.L", "SPDIF.R",
@@ -748,7 +748,7 @@ static char *texts_ports_aio_out_ss[] = {
 	"AEB.1", "AEB.2", "AEB.3", "AEB.4"
 };
 
-static char *texts_ports_aio_in_ds[] = {
+static const char * const texts_ports_aio_in_ds[] = {
 	"Analogue.L", "Analogue.R",
 	"AES.L", "AES.R",
 	"SPDIF.L", "SPDIF.R",
@@ -756,7 +756,7 @@ static char *texts_ports_aio_in_ds[] = {
 	"AEB.1", "AEB.2", "AEB.3", "AEB.4"
 };
 
-static char *texts_ports_aio_out_ds[] = {
+static const char * const texts_ports_aio_out_ds[] = {
 	"Analogue.L", "Analogue.R",
 	"AES.L", "AES.R",
 	"SPDIF.L", "SPDIF.R",
@@ -765,7 +765,7 @@ static char *texts_ports_aio_out_ds[] = {
 	"AEB.1", "AEB.2", "AEB.3", "AEB.4"
 };
 
-static char *texts_ports_aio_in_qs[] = {
+static const char * const texts_ports_aio_in_qs[] = {
 	"Analogue.L", "Analogue.R",
 	"AES.L", "AES.R",
 	"SPDIF.L", "SPDIF.R",
@@ -773,7 +773,7 @@ static char *texts_ports_aio_in_qs[] = {
 	"AEB.1", "AEB.2", "AEB.3", "AEB.4"
 };
 
-static char *texts_ports_aio_out_qs[] = {
+static const char * const texts_ports_aio_out_qs[] = {
 	"Analogue.L", "Analogue.R",
 	"AES.L", "AES.R",
 	"SPDIF.L", "SPDIF.R",
@@ -782,7 +782,7 @@ static char *texts_ports_aio_out_qs[] = {
 	"AEB.1", "AEB.2", "AEB.3", "AEB.4"
 };
 
-static char *texts_ports_aes32[] = {
+static const char * const texts_ports_aes32[] = {
 	"AES.1", "AES.2", "AES.3", "AES.4", "AES.5", "AES.6", "AES.7",
 	"AES.8", "AES.9.", "AES.10", "AES.11", "AES.12", "AES.13", "AES.14",
 	"AES.15", "AES.16"
@@ -796,7 +796,7 @@ static char *texts_ports_aes32[] = {
    where the data for that channel can be read/written from/to.
 */
 
-static char channel_map_unity_ss[HDSPM_MAX_CHANNELS] = {
+static const char channel_map_unity_ss[HDSPM_MAX_CHANNELS] = {
 	0, 1, 2, 3, 4, 5, 6, 7,
 	8, 9, 10, 11, 12, 13, 14, 15,
 	16, 17, 18, 19, 20, 21, 22, 23,
@@ -807,7 +807,7 @@ static char channel_map_unity_ss[HDSPM_MAX_CHANNELS] = {
 	56, 57, 58, 59, 60, 61, 62, 63
 };
 
-static char channel_map_raydat_ss[HDSPM_MAX_CHANNELS] = {
+static const char channel_map_raydat_ss[HDSPM_MAX_CHANNELS] = {
 	4, 5, 6, 7, 8, 9, 10, 11,	/* ADAT 1 */
 	12, 13, 14, 15, 16, 17, 18, 19,	/* ADAT 2 */
 	20, 21, 22, 23, 24, 25, 26, 27,	/* ADAT 3 */
@@ -820,7 +820,7 @@ static char channel_map_raydat_ss[HDSPM_MAX_CHANNELS] = {
 	-1, -1, -1, -1, -1, -1, -1, -1,
 };
 
-static char channel_map_raydat_ds[HDSPM_MAX_CHANNELS] = {
+static const char channel_map_raydat_ds[HDSPM_MAX_CHANNELS] = {
 	4, 5, 6, 7,		/* ADAT 1 */
 	8, 9, 10, 11,		/* ADAT 2 */
 	12, 13, 14, 15,		/* ADAT 3 */
@@ -835,7 +835,7 @@ static char channel_map_raydat_ds[HDSPM_MAX_CHANNELS] = {
 	-1, -1, -1, -1, -1, -1, -1, -1,
 };
 
-static char channel_map_raydat_qs[HDSPM_MAX_CHANNELS] = {
+static const char channel_map_raydat_qs[HDSPM_MAX_CHANNELS] = {
 	4, 5,			/* ADAT 1 */
 	6, 7,			/* ADAT 2 */
 	8, 9,			/* ADAT 3 */
@@ -851,7 +851,7 @@ static char channel_map_raydat_qs[HDSPM_MAX_CHANNELS] = {
 	-1, -1, -1, -1, -1, -1, -1, -1,
 };
 
-static char channel_map_aio_in_ss[HDSPM_MAX_CHANNELS] = {
+static const char channel_map_aio_in_ss[HDSPM_MAX_CHANNELS] = {
 	0, 1,			/* line in */
 	8, 9,			/* aes in, */
 	10, 11,			/* spdif in */
@@ -865,7 +865,7 @@ static char channel_map_aio_in_ss[HDSPM_MAX_CHANNELS] = {
 	-1, -1, -1, -1, -1, -1, -1, -1,
 };
 
-static char channel_map_aio_out_ss[HDSPM_MAX_CHANNELS] = {
+static const char channel_map_aio_out_ss[HDSPM_MAX_CHANNELS] = {
 	0, 1,			/* line out */
 	8, 9,			/* aes out */
 	10, 11,			/* spdif out */
@@ -880,7 +880,7 @@ static char channel_map_aio_out_ss[HDSPM_MAX_CHANNELS] = {
 	-1, -1, -1, -1, -1, -1, -1, -1,
 };
 
-static char channel_map_aio_in_ds[HDSPM_MAX_CHANNELS] = {
+static const char channel_map_aio_in_ds[HDSPM_MAX_CHANNELS] = {
 	0, 1,			/* line in */
 	8, 9,			/* aes in */
 	10, 11,			/* spdif in */
@@ -895,7 +895,7 @@ static char channel_map_aio_in_ds[HDSPM_MAX_CHANNELS] = {
 	-1, -1, -1, -1, -1, -1, -1, -1
 };
 
-static char channel_map_aio_out_ds[HDSPM_MAX_CHANNELS] = {
+static const char channel_map_aio_out_ds[HDSPM_MAX_CHANNELS] = {
 	0, 1,			/* line out */
 	8, 9,			/* aes out */
 	10, 11,			/* spdif out */
@@ -910,7 +910,7 @@ static char channel_map_aio_out_ds[HDSPM_MAX_CHANNELS] = {
 	-1, -1, -1, -1, -1, -1, -1, -1
 };
 
-static char channel_map_aio_in_qs[HDSPM_MAX_CHANNELS] = {
+static const char channel_map_aio_in_qs[HDSPM_MAX_CHANNELS] = {
 	0, 1,			/* line in */
 	8, 9,			/* aes in */
 	10, 11,			/* spdif in */
@@ -925,7 +925,7 @@ static char channel_map_aio_in_qs[HDSPM_MAX_CHANNELS] = {
 	-1, -1, -1, -1, -1, -1, -1, -1
 };
 
-static char channel_map_aio_out_qs[HDSPM_MAX_CHANNELS] = {
+static const char channel_map_aio_out_qs[HDSPM_MAX_CHANNELS] = {
 	0, 1,			/* line out */
 	8, 9,			/* aes out */
 	10, 11,			/* spdif out */
@@ -941,7 +941,7 @@ static char channel_map_aio_out_qs[HDSPM_MAX_CHANNELS] = {
 	-1, -1, -1, -1, -1, -1, -1, -1
 };
 
-static char channel_map_aes32[HDSPM_MAX_CHANNELS] = {
+static const char channel_map_aes32[HDSPM_MAX_CHANNELS] = {
 	0, 1, 2, 3, 4, 5, 6, 7,
 	8, 9, 10, 11, 12, 13, 14, 15,
 	-1, -1, -1, -1, -1, -1, -1, -1,
@@ -1010,17 +1010,21 @@ struct hdspm {
 	unsigned char max_channels_in;
 	unsigned char max_channels_out;
 
-	signed char *channel_map_in;
-	signed char *channel_map_out;
+	const signed char *channel_map_in;
+	const signed char *channel_map_out;
 
-	signed char *channel_map_in_ss, *channel_map_in_ds, *channel_map_in_qs;
-	signed char *channel_map_out_ss, *channel_map_out_ds, *channel_map_out_qs;
+	const signed char *channel_map_in_ss, *channel_map_in_ds, *channel_map_in_qs;
+	const signed char *channel_map_out_ss, *channel_map_out_ds, *channel_map_out_qs;
 
-	char **port_names_in;
-	char **port_names_out;
+	const char * const *port_names_in;
+	const char * const *port_names_out;
 
-	char **port_names_in_ss, **port_names_in_ds, **port_names_in_qs;
-	char **port_names_out_ss, **port_names_out_ds, **port_names_out_qs;
+	const char * const *port_names_in_ss;
+	const char * const *port_names_in_ds;
+	const char * const *port_names_in_qs;
+	const char * const *port_names_out_ss;
+	const char * const *port_names_out_ds;
+	const char * const *port_names_out_qs;
 
 	unsigned char *playback_buffer;	/* suitably aligned address */
 	unsigned char *capture_buffer;	/* suitably aligned address */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
