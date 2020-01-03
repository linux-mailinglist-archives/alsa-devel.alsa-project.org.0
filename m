Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C1512F55D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:23:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 693711713;
	Fri,  3 Jan 2020 09:22:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 693711713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578039795;
	bh=NTMUs9qXftAvCbz0pZN2W/QLzezA5WHZGVm5pqDRR2Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sI9L5CJpYcp4QgDDDysuE0OjwIPVfpy9JcPv4zp9jTdO2ezJixKM9faM767SaxKA5
	 wrq5Z/0n/E/OePiX+mmse2dy6IsJ72uS+O1rjY6Q5UkVrOO1hy+eFlGJwsTXMmweVl
	 SaEXLCQj7ELl8VL/H+S+pbyLhsJPTayl/XOXWvKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2004F80332;
	Fri,  3 Jan 2020 09:17:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02064F80315; Fri,  3 Jan 2020 09:17:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7B4DF8015D
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7B4DF8015D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 90732B1F7
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:17 +0100
Message-Id: <20200103081714.9560-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 01/58] ALSA: pci: Constify snd_pcm_hardware
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

Most of snd_pcm_hardware definitions are just copied to another object
as-is, hence we can define them as const for further optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ali5451/ali5451.c     | 8 ++++----
 sound/pci/echoaudio/darla20.c   | 2 +-
 sound/pci/echoaudio/darla24.c   | 2 +-
 sound/pci/echoaudio/echo3g.c    | 2 +-
 sound/pci/echoaudio/gina20.c    | 2 +-
 sound/pci/echoaudio/gina24.c    | 2 +-
 sound/pci/echoaudio/indigo.c    | 2 +-
 sound/pci/echoaudio/indigodj.c  | 2 +-
 sound/pci/echoaudio/indigodjx.c | 2 +-
 sound/pci/echoaudio/indigoio.c  | 2 +-
 sound/pci/echoaudio/indigoiox.c | 2 +-
 sound/pci/echoaudio/layla20.c   | 2 +-
 sound/pci/echoaudio/layla24.c   | 2 +-
 sound/pci/echoaudio/mia.c       | 2 +-
 sound/pci/echoaudio/mona.c      | 2 +-
 sound/pci/nm256/nm256.c         | 6 +++---
 sound/pci/rme9652/hdspm.c       | 4 ++--
 17 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 9f78cf9e0b47..434077527b95 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -1400,7 +1400,7 @@ static snd_pcm_uframes_t snd_ali_pointer(struct snd_pcm_substream *substream)
 	return cso;
 }
 
-static struct snd_pcm_hardware snd_ali_playback =
+static const struct snd_pcm_hardware snd_ali_playback =
 {
 	.info =		(SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_INTERLEAVED |
 			 SNDRV_PCM_INFO_BLOCK_TRANSFER |
@@ -1426,7 +1426,7 @@ static struct snd_pcm_hardware snd_ali_playback =
  *  Capture support device description
  */
 
-static struct snd_pcm_hardware snd_ali_capture =
+static const struct snd_pcm_hardware snd_ali_capture =
 {
 	.info =		(SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_INTERLEAVED |
 			 SNDRV_PCM_INFO_BLOCK_TRANSFER |
@@ -1457,7 +1457,7 @@ static void snd_ali_pcm_free_substream(struct snd_pcm_runtime *runtime)
 }
 
 static int snd_ali_open(struct snd_pcm_substream *substream, int rec,
-			int channel, struct snd_pcm_hardware *phw)
+			int channel, const struct snd_pcm_hardware *phw)
 {
 	struct snd_ali *codec = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -1537,7 +1537,7 @@ static int snd_ali_modem_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_pcm_hardware snd_ali_modem =
+static const struct snd_pcm_hardware snd_ali_modem =
 {
 	.info =		(SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_INTERLEAVED |
 			 SNDRV_PCM_INFO_BLOCK_TRANSFER |
diff --git a/sound/pci/echoaudio/darla20.c b/sound/pci/echoaudio/darla20.c
index 0f1c65d701f9..e295c71c7a39 100644
--- a/sound/pci/echoaudio/darla20.c
+++ b/sound/pci/echoaudio/darla20.c
@@ -56,7 +56,7 @@ static const struct pci_device_id snd_echo_ids[] = {
 	{0,}
 };
 
-static struct snd_pcm_hardware pcm_hardware_skel = {
+static const struct snd_pcm_hardware pcm_hardware_skel = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
diff --git a/sound/pci/echoaudio/darla24.c b/sound/pci/echoaudio/darla24.c
index 6dd7bfd643da..ae816e78f599 100644
--- a/sound/pci/echoaudio/darla24.c
+++ b/sound/pci/echoaudio/darla24.c
@@ -61,7 +61,7 @@ static const struct pci_device_id snd_echo_ids[] = {
 	{0,}
 };
 
-static struct snd_pcm_hardware pcm_hardware_skel = {
+static const struct snd_pcm_hardware pcm_hardware_skel = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
diff --git a/sound/pci/echoaudio/echo3g.c b/sound/pci/echoaudio/echo3g.c
index 8a03c4bb9f4c..3d37bb4030ec 100644
--- a/sound/pci/echoaudio/echo3g.c
+++ b/sound/pci/echoaudio/echo3g.c
@@ -74,7 +74,7 @@ static const struct pci_device_id snd_echo_ids[] = {
 	{0,}
 };
 
-static struct snd_pcm_hardware pcm_hardware_skel = {
+static const struct snd_pcm_hardware pcm_hardware_skel = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
diff --git a/sound/pci/echoaudio/gina20.c b/sound/pci/echoaudio/gina20.c
index fa1208f4031f..4f864ddc9530 100644
--- a/sound/pci/echoaudio/gina20.c
+++ b/sound/pci/echoaudio/gina20.c
@@ -60,7 +60,7 @@ static const struct pci_device_id snd_echo_ids[] = {
 	{0,}
 };
 
-static struct snd_pcm_hardware pcm_hardware_skel = {
+static const struct snd_pcm_hardware pcm_hardware_skel = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
diff --git a/sound/pci/echoaudio/gina24.c b/sound/pci/echoaudio/gina24.c
index 3089c3221a25..eff69e83ca0a 100644
--- a/sound/pci/echoaudio/gina24.c
+++ b/sound/pci/echoaudio/gina24.c
@@ -81,7 +81,7 @@ static const struct pci_device_id snd_echo_ids[] = {
 	{0,}
 };
 
-static struct snd_pcm_hardware pcm_hardware_skel = {
+static const struct snd_pcm_hardware pcm_hardware_skel = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
diff --git a/sound/pci/echoaudio/indigo.c b/sound/pci/echoaudio/indigo.c
index 0e85070b305e..a9f2efc58f6e 100644
--- a/sound/pci/echoaudio/indigo.c
+++ b/sound/pci/echoaudio/indigo.c
@@ -61,7 +61,7 @@ static const struct pci_device_id snd_echo_ids[] = {
 	{0,}
 };
 
-static struct snd_pcm_hardware pcm_hardware_skel = {
+static const struct snd_pcm_hardware pcm_hardware_skel = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
diff --git a/sound/pci/echoaudio/indigodj.c b/sound/pci/echoaudio/indigodj.c
index 0ad022137e53..14e9769ceba1 100644
--- a/sound/pci/echoaudio/indigodj.c
+++ b/sound/pci/echoaudio/indigodj.c
@@ -61,7 +61,7 @@ static const struct pci_device_id snd_echo_ids[] = {
 	{0,}
 };
 
-static struct snd_pcm_hardware pcm_hardware_skel = {
+static const struct snd_pcm_hardware pcm_hardware_skel = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
diff --git a/sound/pci/echoaudio/indigodjx.c b/sound/pci/echoaudio/indigodjx.c
index 38f17d39e53a..a14a7dc8c87d 100644
--- a/sound/pci/echoaudio/indigodjx.c
+++ b/sound/pci/echoaudio/indigodjx.c
@@ -61,7 +61,7 @@ static const struct pci_device_id snd_echo_ids[] = {
 	{0,}
 };
 
-static struct snd_pcm_hardware pcm_hardware_skel = {
+static const struct snd_pcm_hardware pcm_hardware_skel = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
diff --git a/sound/pci/echoaudio/indigoio.c b/sound/pci/echoaudio/indigoio.c
index 29e0137feb02..97e024450d19 100644
--- a/sound/pci/echoaudio/indigoio.c
+++ b/sound/pci/echoaudio/indigoio.c
@@ -62,7 +62,7 @@ static const struct pci_device_id snd_echo_ids[] = {
 	{0,}
 };
 
-static struct snd_pcm_hardware pcm_hardware_skel = {
+static const struct snd_pcm_hardware pcm_hardware_skel = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
diff --git a/sound/pci/echoaudio/indigoiox.c b/sound/pci/echoaudio/indigoiox.c
index f5c9ef6148ad..a017c966b4dc 100644
--- a/sound/pci/echoaudio/indigoiox.c
+++ b/sound/pci/echoaudio/indigoiox.c
@@ -62,7 +62,7 @@ static const struct pci_device_id snd_echo_ids[] = {
 	{0,}
 };
 
-static struct snd_pcm_hardware pcm_hardware_skel = {
+static const struct snd_pcm_hardware pcm_hardware_skel = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
diff --git a/sound/pci/echoaudio/layla20.c b/sound/pci/echoaudio/layla20.c
index 74906c35c662..7e38bc9c025d 100644
--- a/sound/pci/echoaudio/layla20.c
+++ b/sound/pci/echoaudio/layla20.c
@@ -70,7 +70,7 @@ static const struct pci_device_id snd_echo_ids[] = {
 	{0,}
 };
 
-static struct snd_pcm_hardware pcm_hardware_skel = {
+static const struct snd_pcm_hardware pcm_hardware_skel = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
diff --git a/sound/pci/echoaudio/layla24.c b/sound/pci/echoaudio/layla24.c
index 69742326f188..95c52210fb65 100644
--- a/sound/pci/echoaudio/layla24.c
+++ b/sound/pci/echoaudio/layla24.c
@@ -80,7 +80,7 @@ static const struct pci_device_id snd_echo_ids[] = {
 	{0,}
 };
 
-static struct snd_pcm_hardware pcm_hardware_skel = {
+static const struct snd_pcm_hardware pcm_hardware_skel = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
diff --git a/sound/pci/echoaudio/mia.c b/sound/pci/echoaudio/mia.c
index ee9722db62f5..a2d4b0003b57 100644
--- a/sound/pci/echoaudio/mia.c
+++ b/sound/pci/echoaudio/mia.c
@@ -71,7 +71,7 @@ static const struct pci_device_id snd_echo_ids[] = {
 	{0,}
 };
 
-static struct snd_pcm_hardware pcm_hardware_skel = {
+static const struct snd_pcm_hardware pcm_hardware_skel = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
diff --git a/sound/pci/echoaudio/mona.c b/sound/pci/echoaudio/mona.c
index 3e5747ea4860..1b45a2b5066f 100644
--- a/sound/pci/echoaudio/mona.c
+++ b/sound/pci/echoaudio/mona.c
@@ -90,7 +90,7 @@ static const struct pci_device_id snd_echo_ids[] = {
 	{0,}
 };
 
-static struct snd_pcm_hardware pcm_hardware_skel = {
+static const struct snd_pcm_hardware pcm_hardware_skel = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index ac194485aa78..5da28b0adbd9 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -785,7 +785,7 @@ snd_nm256_capture_update(struct nm256 *chip)
 /*
  * hardware info
  */
-static struct snd_pcm_hardware snd_nm256_playback =
+static const struct snd_pcm_hardware snd_nm256_playback =
 {
 	.info =			SNDRV_PCM_INFO_MMAP_IOMEM |SNDRV_PCM_INFO_MMAP_VALID |
 				SNDRV_PCM_INFO_INTERLEAVED |
@@ -804,7 +804,7 @@ static struct snd_pcm_hardware snd_nm256_playback =
 	.period_bytes_max =	128 * 1024,
 };
 
-static struct snd_pcm_hardware snd_nm256_capture =
+static const struct snd_pcm_hardware snd_nm256_capture =
 {
 	.info =			SNDRV_PCM_INFO_MMAP_IOMEM | SNDRV_PCM_INFO_MMAP_VALID |
 				SNDRV_PCM_INFO_INTERLEAVED |
@@ -838,7 +838,7 @@ static int snd_nm256_pcm_hw_params(struct snd_pcm_substream *substream,
  */
 static void snd_nm256_setup_stream(struct nm256 *chip, struct nm256_stream *s,
 				   struct snd_pcm_substream *substream,
-				   struct snd_pcm_hardware *hw_ptr)
+				   const struct snd_pcm_hardware *hw_ptr)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 56ae14c90a2c..9e3263395f98 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -5820,7 +5820,7 @@ static int snd_hdspm_prepare(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static struct snd_pcm_hardware snd_hdspm_playback_subinfo = {
+static const struct snd_pcm_hardware snd_hdspm_playback_subinfo = {
 	.info = (SNDRV_PCM_INFO_MMAP |
 		 SNDRV_PCM_INFO_MMAP_VALID |
 		 SNDRV_PCM_INFO_NONINTERLEAVED |
@@ -5845,7 +5845,7 @@ static struct snd_pcm_hardware snd_hdspm_playback_subinfo = {
 	.fifo_size = 0
 };
 
-static struct snd_pcm_hardware snd_hdspm_capture_subinfo = {
+static const struct snd_pcm_hardware snd_hdspm_capture_subinfo = {
 	.info = (SNDRV_PCM_INFO_MMAP |
 		 SNDRV_PCM_INFO_MMAP_VALID |
 		 SNDRV_PCM_INFO_NONINTERLEAVED |
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
