Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A355073CBED
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Jun 2023 18:54:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0971844;
	Sat, 24 Jun 2023 18:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0971844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687625673;
	bh=k9x36MOJxcOwziBhNd3zH79xJSf4tCVgLCzVU7tw+V0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kjzAfvJzdQUIqJiklOQ7ceWkn8Vsoat8A/tgl6BIX/0leKjO99wzgmRqQxursYRKM
	 pvGITU+saG7aSgTsBvs9VtB13Df8CIAHGCRCRjT/esnnLXKO1c3SE5miwaH8rX8vXT
	 tD/FGNKfAxp6qMDSGvRsa6MXF4i2ObncgGWQjwng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4400F80132; Sat, 24 Jun 2023 18:53:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE593F80132;
	Sat, 24 Jun 2023 18:53:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 347EDF80141; Sat, 24 Jun 2023 18:52:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.horus.com (mail.horus.com [78.46.148.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B111F80124
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 18:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B111F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=horus.com header.i=@horus.com header.a=rsa-sha256
 header.s=20180324 header.b=ubznO/wo
Received: from [192.168.1.22] (193-81-115-8.adsl.highway.telekom.at
 [193.81.115.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(Client did not present a certificate)
	by mail.horus.com (Postfix) with ESMTPSA id 4DDEB640B6;
	Sat, 24 Jun 2023 18:52:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
	s=20180324; t=1687625547;
	bh=yKLKHJ/8mLJlQ9DofIA55oqKk8gNefn90/tKRkXoatA=;
	h=From:To:Cc:Subject:Date:From;
	b=ubznO/wocpWTQ6NvPMKjHd3Fdh0GEFsRWU0PaSuZ4n5XJDHLAW+8A6xTO1x+FsL7x
	 RggeXj/8TEaB7TUwarYSgS/3cr7BRY5k72tE2puUY/QNMLG/a4nAiB6skJGaG1tnhU
	 SL7HZSdTk9yR+CAqas2xJpuaPDD+w4N9r0GfKqUg=
Received: by camel3.lan (Postfix, from userid 1000)
	id B8ACA540544; Sat, 24 Jun 2023 18:52:26 +0200 (CEST)
From: Matthias Reichl <hias@horus.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Matthias Reichl <hias@horus.com>,
	Dom Cobley <popcornmix@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcm: fix ELD constraints for (E)AC3,
 DTS(-HD) and MLP formats
Date: Sat, 24 Jun 2023 18:52:16 +0200
Message-Id: <20230624165216.5719-1-hias@horus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OUCX4RKRZ54K3IGGERNWF3YF66MUKV4O
X-Message-ID-Hash: OUCX4RKRZ54K3IGGERNWF3YF66MUKV4O
X-MailFrom: hias@horus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OUCX4RKRZ54K3IGGERNWF3YF66MUKV4O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SADs of compressed formats contain the channel and sample rate
info of the audio data inside the compressed stream, but when
building constraints we must use the rates and channels used to
transport the compressed streams.

eg 48kHz 6ch EAC3 needs to be transmitted as a 2ch 192kHz stream.

This patch fixes the constraints for the common AC3 and DTS formats,
the constraints for the less common MPEG, DSD etc formats are copied
directly from the info in the SADs as before as I don't have the specs
and equipment to test those.

Signed-off-by: Matthias Reichl <hias@horus.com>
---
 sound/core/pcm_drm_eld.c | 73 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 70 insertions(+), 3 deletions(-)

diff --git a/sound/core/pcm_drm_eld.c b/sound/core/pcm_drm_eld.c
index 4b5faae5d16e5..07075071972dd 100644
--- a/sound/core/pcm_drm_eld.c
+++ b/sound/core/pcm_drm_eld.c
@@ -2,11 +2,25 @@
 /*
  *  PCM DRM helpers
  */
+#include <linux/bitfield.h>
 #include <linux/export.h>
+#include <linux/hdmi.h>
 #include <drm/drm_edid.h>
 #include <sound/pcm.h>
 #include <sound/pcm_drm_eld.h>
 
+#define SAD0_CHANNELS_MASK	GENMASK(2, 0) /* max number of channels - 1 */
+#define SAD0_FORMAT_MASK	GENMASK(6, 3) /* audio format */
+
+#define SAD1_RATE_MASK		GENMASK(6, 0) /* bitfield of supported rates */
+#define SAD1_RATE_32000_MASK	BIT(0)
+#define SAD1_RATE_44100_MASK	BIT(1)
+#define SAD1_RATE_48000_MASK	BIT(2)
+#define SAD1_RATE_88200_MASK	BIT(3)
+#define SAD1_RATE_96000_MASK	BIT(4)
+#define SAD1_RATE_176400_MASK	BIT(5)
+#define SAD1_RATE_192000_MASK	BIT(6)
+
 static const unsigned int eld_rates[] = {
 	32000,
 	44100,
@@ -17,9 +31,62 @@ static const unsigned int eld_rates[] = {
 	192000,
 };
 
+static unsigned int map_rate_families(const u8 *sad,
+				      unsigned int mask_32000,
+				      unsigned int mask_44100,
+				      unsigned int mask_48000)
+{
+	unsigned int rate_mask = 0;
+
+	if (sad[1] & SAD1_RATE_32000_MASK)
+		rate_mask |= mask_32000;
+	if (sad[1] & (SAD1_RATE_44100_MASK | SAD1_RATE_88200_MASK | SAD1_RATE_176400_MASK))
+		rate_mask |= mask_44100;
+	if (sad[1] & (SAD1_RATE_48000_MASK | SAD1_RATE_96000_MASK | SAD1_RATE_192000_MASK))
+		rate_mask |= mask_48000;
+	return rate_mask;
+}
+
+static unsigned int sad_rate_mask(const u8 *sad)
+{
+	switch (FIELD_GET(SAD0_FORMAT_MASK, sad[0])) {
+	case HDMI_AUDIO_CODING_TYPE_PCM:
+		return sad[1] & SAD1_RATE_MASK;
+	case HDMI_AUDIO_CODING_TYPE_AC3:
+	case HDMI_AUDIO_CODING_TYPE_DTS:
+		return map_rate_families(sad,
+					 SAD1_RATE_32000_MASK,
+					 SAD1_RATE_44100_MASK,
+					 SAD1_RATE_48000_MASK);
+	case HDMI_AUDIO_CODING_TYPE_EAC3:
+	case HDMI_AUDIO_CODING_TYPE_DTS_HD:
+	case HDMI_AUDIO_CODING_TYPE_MLP:
+		return map_rate_families(sad,
+					 0,
+					 SAD1_RATE_176400_MASK,
+					 SAD1_RATE_192000_MASK);
+	default:
+		/* TODO adjust for other compressed formats as well */
+		return sad[1] & SAD1_RATE_MASK;
+	}
+}
+
 static unsigned int sad_max_channels(const u8 *sad)
 {
-	return 1 + (sad[0] & 7);
+	switch (FIELD_GET(SAD0_FORMAT_MASK, sad[0])) {
+	case HDMI_AUDIO_CODING_TYPE_PCM:
+		return 1 + FIELD_GET(SAD0_CHANNELS_MASK, sad[0]);
+	case HDMI_AUDIO_CODING_TYPE_AC3:
+	case HDMI_AUDIO_CODING_TYPE_DTS:
+	case HDMI_AUDIO_CODING_TYPE_EAC3:
+		return 2;
+	case HDMI_AUDIO_CODING_TYPE_DTS_HD:
+	case HDMI_AUDIO_CODING_TYPE_MLP:
+		return 8;
+	default:
+		/* TODO adjust for other compressed formats as well */
+		return 1 + FIELD_GET(SAD0_CHANNELS_MASK, sad[0]);
+	}
 }
 
 static int eld_limit_rates(struct snd_pcm_hw_params *params,
@@ -42,7 +109,7 @@ static int eld_limit_rates(struct snd_pcm_hw_params *params,
 			 * requested number of channels.
 			 */
 			if (c->min <= max_channels)
-				rate_mask |= sad[1];
+				rate_mask |= sad_rate_mask(sad);
 		}
 	}
 
@@ -70,7 +137,7 @@ static int eld_limit_channels(struct snd_pcm_hw_params *params,
 				rate_mask |= BIT(i);
 
 		for (i = drm_eld_sad_count(eld); i > 0; i--, sad += 3)
-			if (rate_mask & sad[1])
+			if (rate_mask & sad_rate_mask(sad))
 				t.max = max(t.max, sad_max_channels(sad));
 	}
 
-- 
2.39.2

