Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9242A21E1F9
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jul 2020 23:19:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31302850;
	Mon, 13 Jul 2020 23:19:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31302850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594675197;
	bh=4KEpH69Gy0kpZKcd7UA+qynddFujiKa5MuE0r/3KbI0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vdeCCAskb2f0xQgqMzOJhAKLG2m2/BD7KY4paaT2muprlbSdo4FvDlr65yx3FBFA9
	 KVcQev6RVaPxckMRJu2QnlMOgW0TGSonKDLBz/csYy7Ss43QccYqRFSKAzSF6Cra+I
	 KFAno5Qp3b1izgEnZ5PDnvXbK5wlQzuginO3sAP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57AAFF8026A;
	Mon, 13 Jul 2020 23:17:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20F31F80227; Mon, 13 Jul 2020 23:17:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.horus.com (mail.horus.com [78.46.148.228])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2A45F80116
 for <alsa-devel@alsa-project.org>; Mon, 13 Jul 2020 23:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2A45F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=horus.com header.i=@horus.com
 header.b="JUZX5ivR"
Received: from lenny.lan (178-190-192-205.adsl.highway.telekom.at
 [178.190.192.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "E-Mail Matthias Reichl Lenny",
 Issuer "HiassofT CA 2014" (verified OK))
 by mail.horus.com (Postfix) with ESMTPSA id 06CD16409B;
 Mon, 13 Jul 2020 23:17:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
 s=20180324; t=1594675025;
 bh=J+7SFZKii5BncKSfsKj7o9fv4TpKfShepnxsEnUW2/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JUZX5ivRTXZVbq2HKp79fT9qJfltF1nb7+Yv7Clw08+LZNRzIuYbDr0LUoY/Oe366
 1ZTJJ9br/OKdOOxq/M3oFQivmmK+NVxVGt9Bp4Dg0SybF1ja6ymu/CCB60Ig2HPlxh
 2FCvIT8B+Iod7Wkks/gpXsqVFz46tAcZtggzhCTs=
Received: by lenny.lan (Postfix, from userid 1000)
 id 6F1BC202270; Mon, 13 Jul 2020 23:17:04 +0200 (CEST)
From: Matthias Reichl <hias@horus.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 2/2] pcm: iec958: set channel status bits according to rate
 and format
Date: Mon, 13 Jul 2020 23:17:04 +0200
Message-Id: <20200713211704.19083-3-hias@horus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200713211704.19083-1-hias@horus.com>
References: <20200713211704.19083-1-hias@horus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Dom Cobley <popcornmix@gmail.com>, alsa-devel@alsa-project.org
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

This mimics snd_pcm_create_iec958_consumer in the kernel.

The rate and wordlength bits will only be modified if they are
set to "not indicated", which is now the default if no status
option is used.

This allows applications to override parameters determined from
the stream or implement channel status bits extensions without
needing to change pcm_iec958 code.

Signed-off-by: Matthias Reichl <hias@horus.com>
---
 src/pcm/pcm_iec958.c | 80 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 76 insertions(+), 4 deletions(-)

diff --git a/src/pcm/pcm_iec958.c b/src/pcm/pcm_iec958.c
index 17ade957..a11a0439 100644
--- a/src/pcm/pcm_iec958.c
+++ b/src/pcm/pcm_iec958.c
@@ -365,9 +365,80 @@ static int snd_pcm_iec958_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params
 			iec->byteswap = format != SND_PCM_FORMAT_IEC958_SUBFRAME;
 		}
 	}
-	/* FIXME: needs to adjust status_bits according to the format
-	 *        and sample rate
-	 */
+
+	if ((iec->status[0] & IEC958_AES0_PROFESSIONAL) == 0) {
+		if ((iec->status[3] & IEC958_AES3_CON_FS) == IEC958_AES3_CON_FS_NOTID) {
+			unsigned int rate = 0;
+			unsigned char fs;
+
+			err = INTERNAL(snd_pcm_hw_params_get_rate)(params, &rate, 0);
+			if (err < 0)
+				rate = 0;
+
+			switch (rate) {
+			case 22050:
+				fs = IEC958_AES3_CON_FS_22050;
+				break;
+			case 24000:
+				fs = IEC958_AES3_CON_FS_24000;
+				break;
+			case 32000:
+				fs = IEC958_AES3_CON_FS_32000;
+				break;
+			case 44100:
+				fs = IEC958_AES3_CON_FS_44100;
+				break;
+			case 48000:
+				fs = IEC958_AES3_CON_FS_48000;
+				break;
+			case 88200:
+				fs = IEC958_AES3_CON_FS_88200;
+				break;
+			case 96000:
+				fs = IEC958_AES3_CON_FS_96000;
+				break;
+			case 176400:
+				fs = IEC958_AES3_CON_FS_176400;
+				break;
+			case 192000:
+				fs = IEC958_AES3_CON_FS_192000;
+				break;
+			case 768000:
+				fs = IEC958_AES3_CON_FS_768000;
+				break;
+			default:
+				fs = IEC958_AES3_CON_FS_NOTID;
+				break;
+			}
+
+			iec->status[3] &= ~IEC958_AES3_CON_FS;
+			iec->status[3] |= fs;
+		}
+
+		if ((iec->status[4] & IEC958_AES4_CON_WORDLEN) == IEC958_AES4_CON_WORDLEN_NOTID) {
+			unsigned char ws;
+			switch (snd_pcm_format_width(format)) {
+			case 16:
+				ws = IEC958_AES4_CON_WORDLEN_20_16;
+				break;
+			case 18:
+				ws = IEC958_AES4_CON_WORDLEN_22_18;
+				break;
+			case 20:
+				ws = IEC958_AES4_CON_WORDLEN_20_16 | IEC958_AES4_CON_MAX_WORDLEN_24;
+				break;
+			case 24:
+			case 32: /* Assume 24-bit width for 32-bit samples. */
+				ws = IEC958_AES4_CON_WORDLEN_24_20 | IEC958_AES4_CON_MAX_WORDLEN_24;
+				break;
+			default:
+				ws = IEC958_AES4_CON_WORDLEN_NOTID;
+				break;
+			}
+			iec->status[4] &= ~(IEC958_AES4_CON_MAX_WORDLEN_24 | IEC958_AES4_CON_WORDLEN);
+			iec->status[4] |= ws;
+		}
+	}
 	return 0;
 }
 
@@ -504,7 +575,8 @@ int snd_pcm_iec958_open(snd_pcm_t **pcmp, const char *name, snd_pcm_format_t sfo
 		IEC958_AES0_CON_EMPHASIS_NONE,
 		IEC958_AES1_CON_ORIGINAL | IEC958_AES1_CON_PCM_CODER,
 		0,
-		IEC958_AES3_CON_FS_48000
+		IEC958_AES3_CON_FS_NOTID, /* will be set in hwparams */
+		IEC958_AES4_CON_WORDLEN_NOTID /* will be set in hwparams */
 	};
 
 	assert(pcmp && slave);
-- 
2.20.1

