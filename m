Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A894B1AFE67
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 23:23:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DA911663;
	Sun, 19 Apr 2020 23:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DA911663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587331421;
	bh=p4t5LrlBO5Veh8GkG6sHrvmsmgsdpyHZqlsylm9UN5U=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VYacWut2P6bxX4kHi6QaNPposNyklQGxp8scUSxyFye9Eiq/UnZSLysiurtX8KQOo
	 04b58YJ4bAHb0Bx2Moh5nbL7RLFjzU1l8kDitlCeTV2nqCtpg/o/xYrZLMQ/FdZ0Fn
	 nMcd2cYmnFoG4waPuJmKPetmlMHqo7jyOIXv8FjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46BFCF801EC;
	Sun, 19 Apr 2020 23:22:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB256F801EC; Sun, 19 Apr 2020 23:21:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C551F800BA
 for <alsa-devel@alsa-project.org>; Sun, 19 Apr 2020 23:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C551F800BA
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9E293ABEC
 for <alsa-devel@alsa-project.org>; Sun, 19 Apr 2020 21:21:35 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Print more information in stream proc files
Date: Sun, 19 Apr 2020 23:21:34 +0200
Message-Id: <20200419212134.14200-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

For more debug and usability information, add the entry showing the
DSD raw states and the channel mapping in each stream proc file.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/proc.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/sound/usb/proc.c b/sound/usb/proc.c
index 4174ad11fca6..5a36e192ebb0 100644
--- a/sound/usb/proc.c
+++ b/sound/usb/proc.c
@@ -54,6 +54,38 @@ void snd_usb_audio_create_proc(struct snd_usb_audio *chip)
 			     proc_audio_usbid_read);
 }
 
+static const char * const channel_labels[] = {
+	[SNDRV_CHMAP_NA]	= "N/A",
+	[SNDRV_CHMAP_MONO]	= "MONO",
+	[SNDRV_CHMAP_FL]	= "FL",
+	[SNDRV_CHMAP_FR]	= "FR",
+	[SNDRV_CHMAP_FC]	= "FC",
+	[SNDRV_CHMAP_LFE]	= "LFE",
+	[SNDRV_CHMAP_RL]	= "RL",
+	[SNDRV_CHMAP_RR]	= "RR",
+	[SNDRV_CHMAP_FLC]	= "FLC",
+	[SNDRV_CHMAP_FRC]	= "FRC",
+	[SNDRV_CHMAP_RC]	= "RC",
+	[SNDRV_CHMAP_SL]	= "SL",
+	[SNDRV_CHMAP_SR]	= "SR",
+	[SNDRV_CHMAP_TC]	= "TC",
+	[SNDRV_CHMAP_TFL]	= "TFL",
+	[SNDRV_CHMAP_TFC]	= "TFC",
+	[SNDRV_CHMAP_TFR]	= "TFR",
+	[SNDRV_CHMAP_TRL]	= "TRL",
+	[SNDRV_CHMAP_TRC]	= "TRC",
+	[SNDRV_CHMAP_TRR]	= "TRR",
+	[SNDRV_CHMAP_TFLC]	= "TFLC",
+	[SNDRV_CHMAP_TFRC]	= "TFRC",
+	[SNDRV_CHMAP_LLFE]	= "LLFE",
+	[SNDRV_CHMAP_RLFE]	= "RLFE",
+	[SNDRV_CHMAP_TSL]	= "TSL",
+	[SNDRV_CHMAP_TSR]	= "TSR",
+	[SNDRV_CHMAP_BC]	= "BC",
+	[SNDRV_CHMAP_RLC]	= "RLC",
+	[SNDRV_CHMAP_RRC]	= "RRC",
+};
+
 /*
  * proc interface for list the supported pcm formats
  */
@@ -97,6 +129,27 @@ static void proc_dump_substream_formats(struct snd_usb_substream *subs, struct s
 			snd_iprintf(buffer, "    Data packet interval: %d us\n",
 				    125 * (1 << fp->datainterval));
 		snd_iprintf(buffer, "    Bits: %d\n", fp->fmt_bits);
+
+		if (fp->dsd_raw)
+			snd_iprintf(buffer, "    DSD raw: DOP=%d, bitrev=%d\n",
+				    fp->dsd_dop, fp->dsd_bitrev);
+
+		if (fp->chmap) {
+			const struct snd_pcm_chmap_elem *map = fp->chmap;
+			int c;
+
+			snd_iprintf(buffer, "    Channel map:");
+			for (c = 0; c < map->channels; c++) {
+				if (map->map[c] >= sizeof(channel_labels) ||
+				    !channel_labels[map->map[c]])
+					snd_iprintf(buffer, " --");
+				else
+					snd_iprintf(buffer, " %s",
+						    channel_labels[map->map[c]]);
+			}
+			snd_iprintf(buffer, "\n");
+		}
+
 		// snd_iprintf(buffer, "    Max Packet Size = %d\n", fp->maxpacksize);
 		// snd_iprintf(buffer, "    EP Attribute = %#x\n", fp->attributes);
 	}
-- 
2.16.4

