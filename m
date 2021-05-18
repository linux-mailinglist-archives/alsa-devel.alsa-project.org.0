Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 959A2386F1E
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 03:26:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 109AA166E;
	Tue, 18 May 2021 03:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 109AA166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621301217;
	bh=hcjhdL5MuWTX041AMr49SXeE4lo7Bsa6b6scFKXph8g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jqSfypo9okrCV8rRxN/n01cs2etQH7HnBf7cmE3en0+Ov+Xafn/xG0kH1eq9S4pCD
	 7jyjyJI2ljxlfi4rgqvAZuwjFG5GF2p2huwKPpxaN9RVKLJYrvNGN1wuPNEpOejum9
	 VZM+wOVyIxq6U/QLdL8+C2zpUrMy9BupkoLar4ow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F5B0F80246;
	Tue, 18 May 2021 03:25:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 956B0F8020B; Tue, 18 May 2021 03:25:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE75FF80169
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 03:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE75FF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ds2OYD7c"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qdNxUy7L"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 99F7D5C0199;
 Mon, 17 May 2021 21:25:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 17 May 2021 21:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=3rjAVkqwcP2W6S09Kbxwv7k12D
 5hQzYhUQX8PAu6oRA=; b=ds2OYD7cDXg1HRPIRktwcAsxE+kCUYCSYpvIPf2e/I
 EPhllJFFK6NovMGnrx80A6KtNSJvr1WoTH7apvk1MtDH212Gap4ehpVhlGaazQLw
 e0nwEY/E4REsJT7GV5zl3KID2mW8z5KWwIP7c7X79sug140VHZH+1SSBoaJUcSAp
 rOXw2S4+LWrLOiODGkOLi1YOrCADnSQHqaTj70MKCVN3Wf2keckmAMIKyoIm/TFM
 /TR8+6vumrrJmr5jgjAo9zudqc0mCBxyvSQoR2hann8ga+86r1jRF5OcipXc9F1D
 eR1ThHE5C3W//zzLTs9JWn631DkDSVQKKUWrC/im0fMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3rjAVkqwcP2W6S09K
 bxwv7k12D5hQzYhUQX8PAu6oRA=; b=qdNxUy7L3L+thUqVy/JwCMW+U1t5r9HeR
 EV1S7xX5+CCa6QkPlAfIYeM4yzh7y8OobovzDUDoXcYzN8qj7fwUhKqGb1iWwjDf
 e98zG//qUwGryQ30EWA/PY87juiwl1WL0vivbACJ96ydCtrtKjhauSgT067sChsM
 p9B++ZoyC7W27YGLTngEHzMYWw4Yso8TAWhadnXhu+lKoYtTznr5D9IXf4PeSniv
 gk0tAjuoz8NtFa68wYldI2jvJd0xajj19rho++5uxhGCBqKTAgjTviqF5JItvz8K
 tuAWfdFr5kw8HG0hHPBkRiwhclTZPLuXY/xcIgkK3MlZ58DrXXObA==
X-ME-Sender: <xms:ehejYMGV9JXaL_8D0oyPANDEf0wjvHaLJaZaq3J9B6g1V6mN8k_O8Q>
 <xme:ehejYFVFkUv7Ae_rUqGvlEJoQKgqPTLhc0V2pFEG5RER8M9efHKZ7eMflaGMtsJbh
 ouN6l0RpNh_W4mycK4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeiiedggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecukfhppedugedrfedr
 ieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:ehejYGI74UiihLV4x2g5jpqz_C1priUbf95gTb6SwXp5I2R5O6Ljqg>
 <xmx:ehejYOHAe2KAHWRc79HH9yO2VBveI9mNkI-gg1_Ea1AIGUc2AJ5JGQ>
 <xmx:ehejYCUKq0exFL9rwIFupLNJK1qNogCnsvjpCW8ObLN4kxTn4JoIqw>
 <xmx:exejYLeiYeQTcBXfIe-337GxSiqYRXAE3DJJhDFwrGkP3mnviF9-Pg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 21:25:13 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: dice: disable double_pcm_frames mode for M-Audio
 Profire 610, 2626 and Avid M-Box 3 Pro
Date: Tue, 18 May 2021 10:25:10 +0900
Message-Id: <20210518012510.37126-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

ALSA dice driver detects jumbo payload at high sampling transfer frequency
for below models:

 * Avid M-Box 3 Pro
 * M-Audio Profire 610
 * M-Audio Profire 2626

Although many DICE-based devices have a quirk at high sampling transfer
frequency to multiplex double number of PCM frames into data block than
the number in IEC 61883-1/6, the above devices are just compliant to
IEC 61883-1/6.

This commit disables the mode of double_pcm_frames for the models.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-pcm.c    |  4 ++--
 sound/firewire/dice/dice-stream.c |  2 +-
 sound/firewire/dice/dice.c        | 24 ++++++++++++++++++++++++
 sound/firewire/dice/dice.h        |  3 ++-
 4 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index af8a90ee40f3..a69ca1111b03 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -218,7 +218,7 @@ static int pcm_open(struct snd_pcm_substream *substream)
 
 		if (frames_per_period > 0) {
 			// For double_pcm_frame quirk.
-			if (rate > 96000) {
+			if (rate > 96000 && !dice->disable_double_pcm_frames) {
 				frames_per_period *= 2;
 				frames_per_buffer *= 2;
 			}
@@ -273,7 +273,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 
 		mutex_lock(&dice->mutex);
 		// For double_pcm_frame quirk.
-		if (rate > 96000) {
+		if (rate > 96000 && !dice->disable_double_pcm_frames) {
 			events_per_period /= 2;
 			events_per_buffer /= 2;
 		}
diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index 1a14c083e8ce..c4dfe76500c2 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -181,7 +181,7 @@ static int keep_resources(struct snd_dice *dice, struct amdtp_stream *stream,
 	// as 'Dual Wire'.
 	// For this quirk, blocking mode is required and PCM buffer size should
 	// be aligned to SYT_INTERVAL.
-	double_pcm_frames = rate > 96000;
+	double_pcm_frames = (rate > 96000 && !dice->disable_double_pcm_frames);
 	if (double_pcm_frames) {
 		rate /= 2;
 		pcm_chs *= 2;
diff --git a/sound/firewire/dice/dice.c b/sound/firewire/dice/dice.c
index 107a81691f0e..239d164b0eea 100644
--- a/sound/firewire/dice/dice.c
+++ b/sound/firewire/dice/dice.c
@@ -21,6 +21,7 @@ MODULE_LICENSE("GPL v2");
 #define OUI_SSL			0x0050c2	// Actually ID reserved by IEEE.
 #define OUI_PRESONUS		0x000a92
 #define OUI_HARMAN		0x000fd7
+#define OUI_AVID		0x00a07e
 
 #define DICE_CATEGORY_ID	0x04
 #define WEISS_CATEGORY_ID	0x00
@@ -222,6 +223,14 @@ static int dice_probe(struct fw_unit *unit,
 				(snd_dice_detect_formats_t)entry->driver_data;
 	}
 
+	// Below models are compliant to IEC 61883-1/6 and have no quirk at high sampling transfer
+	// frequency.
+	// * Avid M-Box 3 Pro
+	// * M-Audio Profire 610
+	// * M-Audio Profire 2626
+	if (entry->vendor_id == OUI_MAUDIO || entry->vendor_id == OUI_AVID)
+		dice->disable_double_pcm_frames = true;
+
 	spin_lock_init(&dice->lock);
 	mutex_init(&dice->mutex);
 	init_completion(&dice->clock_accepted);
@@ -278,7 +287,22 @@ static void dice_bus_reset(struct fw_unit *unit)
 
 #define DICE_INTERFACE	0x000001
 
+#define DICE_DEV_ENTRY_TYPICAL(vendor, model, data) \
+	{ \
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID | \
+				  IEEE1394_MATCH_MODEL_ID | \
+				  IEEE1394_MATCH_SPECIFIER_ID | \
+				  IEEE1394_MATCH_VERSION, \
+		.vendor_id	= (vendor), \
+		.model_id	= (model), \
+		.specifier_id	= (vendor), \
+		.version	= DICE_INTERFACE, \
+		.driver_data = (kernel_ulong_t)(data), \
+	}
+
 static const struct ieee1394_device_id dice_id_table[] = {
+	// Avid M-Box 3 Pro. To match in probe function.
+	DICE_DEV_ENTRY_TYPICAL(OUI_AVID, 0x000004, snd_dice_detect_extension_formats),
 	/* M-Audio Profire 2626 has a different value in version field. */
 	{
 		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
diff --git a/sound/firewire/dice/dice.h b/sound/firewire/dice/dice.h
index adc6f7c84460..3c967d1b3605 100644
--- a/sound/firewire/dice/dice.h
+++ b/sound/firewire/dice/dice.h
@@ -109,7 +109,8 @@ struct snd_dice {
 	struct fw_iso_resources rx_resources[MAX_STREAMS];
 	struct amdtp_stream tx_stream[MAX_STREAMS];
 	struct amdtp_stream rx_stream[MAX_STREAMS];
-	bool global_enabled;
+	bool global_enabled:1;
+	bool disable_double_pcm_frames:1;
 	struct completion clock_accepted;
 	unsigned int substreams_counter;
 
-- 
2.27.0

