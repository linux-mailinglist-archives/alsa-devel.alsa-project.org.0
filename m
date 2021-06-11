Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D38D3A3F42
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 11:41:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7BA61941;
	Fri, 11 Jun 2021 11:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7BA61941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623404496;
	bh=IufTmV0BMdSJwpe7aunH79inBcHXGHi17GzE3wPe7es=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iM4CQ2Zxr1uiW+ld3b+4dz9r2i4bAeyKlc1OhoNZz5NgB4qV2eAWQxQat4n2MS7T6
	 2S6T87srmQdg+KsfCrPTfKeBhnHoL8mNTbc5fK7ch0cJVijAAS7OH3W9LK8wDtbVbE
	 rItMmc6eCqz/v93jyb5NePLCnJeWRw0Md34yRvwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1914DF804EB;
	Fri, 11 Jun 2021 11:38:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F12C7F804CF; Fri, 11 Jun 2021 11:37:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11FB8F8026C
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 11:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11FB8F8026C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="FH5Fpo5P"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jauythSI"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 5FFCB1AF0;
 Fri, 11 Jun 2021 05:37:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 11 Jun 2021 05:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=v61mwo6enk6eI
 JzCYspnEl9PtoberoQfSu8atFP9GFM=; b=FH5Fpo5P/UTmZ1upMMw4wAf66Vu9y
 krF+xmS+J7NbAGGHsKkvgY5nvY2cssT0hiHXD4+iezOGlHEvZTaThCOopB/fxk4a
 4DXTNBwv8GlnYsUg3ARgHJoK1yvmRA7GXf4BHXw+gRBC71X0RO4+sYcEoeKBsHXi
 Sd/tUDEu1zsgCFydxbKAyVvlYglWkl4N3lfuUO93qYVIuYxcq6BiVmIGMwLo3gKG
 gqDSRFuRBhCyhuCxj0q2+oKxIJfXUZxiaM8qqLmtJ0Dy2W9NY9HqZn0Yw0IqtIWf
 EAtbxDmSEBDBf1//RPXH2u0flvN0N7OvA0gxP/ciXCuNCi//q2zxQGMUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=v61mwo6enk6eIJzCYspnEl9PtoberoQfSu8atFP9GFM=; b=jauythSI
 /+352D4e7ODFS5O2wzeahnPEsX7fShycCb3ef+srwkiVcu/cTrwaOZWIlBiks9hm
 EIjZVC04c1acTAOE07l8gnb712fHT7geCxZ53kDT4fRNJMDQSCTymdC0RtPXH2gG
 L2492MrqSYCMDtqh0EclaQUeD6KGpGrfuUe610Vx04yIUQQJgvwrzRBJhGbXxxS4
 3WMe6IjO91ZZjoNr8b4Ox8EbLyyvWqcil0Y8PukrU4xKcvpd15XAPI5XShkASxLP
 q5InTtpPq5yd5Z78Q2phYimlEX5Fyen/AeiYgZWylWK9umHkdkGawZWwALPRTY8y
 hJa5zmLC8hbdGw==
X-ME-Sender: <xms:6S7DYDe81Yzctunm7m-qwJrvcf67M0l37yLhj7cGerYj4S_jfNDsyw>
 <xme:6S7DYJOpxHr6UAiMJ8aCslHooIJrwQnDJLCsAGsXnHtj6cR8yYJ0QEJQPpb1yoVBW
 4l0lj53VM0Yt0x_9c4>
X-ME-Received: <xmr:6S7DYMid-rqnW7FSMULWEAT8GY1To1y-vf1fmeRy6-rzAPnBFGdrkeb6oMwWkFuuqPrA_C4_9w1uWycvMAdKMPiHXowa4YCp-nQ6sSFMbcgue0DN04RM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedujedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:6S7DYE9Kuu8ItrREdhxyXn72FMWXV9Srzprm-TTilVRHTEK7MQTAHw>
 <xmx:6S7DYPthLLBJlndQoXg_usRQRgmkX4zMuKSjxy0SG9gSnBAg_buEmQ>
 <xmx:6S7DYDHWN2HEpn6UKwtJlJkk5mJqxDrOj6OGk_N-mcEH3y0UmSm5gA>
 <xmx:6i7DYIWw7ITu8NsXT9vwtHX72WMmERISGrBSc3dTGzUEPjaZP97cdw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jun 2021 05:37:44 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 5/6] ALSA: bebob: code refactoring for M-Audio models
Date: Fri, 11 Jun 2021 18:37:29 +0900
Message-Id: <20210611093730.78254-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210611093730.78254-1-o-takashi@sakamocchi.jp>
References: <20210611093730.78254-1-o-takashi@sakamocchi.jp>
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

For M-Audio FireWire 410, the value of immediate entry for vendor in unit
directory is the value for BridgeCo. AG OUI. It seems that M-Audio uses
initial settings as is for its product.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index 6784ab2cb678..9f8df57c1e8b 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -54,8 +54,7 @@ static DECLARE_BITMAP(devices_used, SNDRV_CARDS);
 #define VEN_TERRATEC	0x00000aac
 #define VEN_YAMAHA	0x0000a0de
 #define VEN_FOCUSRITE	0x0000130e
-#define VEN_MAUDIO1	0x00000d6c
-#define VEN_MAUDIO2	0x000007f5
+#define VEN_MAUDIO	0x00000d6c
 #define VEN_DIGIDESIGN	0x00a07e
 
 #define MODEL_FOCUSRITE_SAFFIRE_BOTH	0x00000000
@@ -159,7 +158,7 @@ check_audiophile_booted(struct fw_unit *unit)
 
 static int detect_quirks(struct snd_bebob *bebob, const struct ieee1394_device_id *entry)
 {
-	if (entry->vendor_id == VEN_MAUDIO1) {
+	if (entry->vendor_id == VEN_MAUDIO) {
 		switch (entry->model_id) {
 		case MODEL_MAUDIO_PROFIRELIGHTBRIDGE:
 			// M-Audio ProFire Lightbridge has a quirk to transfer packets with
@@ -192,7 +191,7 @@ static int bebob_probe(struct fw_unit *unit, const struct ieee1394_device_id *en
 	if (entry->vendor_id == VEN_FOCUSRITE &&
 	    entry->model_id == MODEL_FOCUSRITE_SAFFIRE_BOTH)
 		spec = get_saffire_spec(unit);
-	else if (entry->vendor_id == VEN_MAUDIO1 &&
+	else if (entry->vendor_id == VEN_MAUDIO &&
 		 entry->model_id == MODEL_MAUDIO_AUDIOPHILE_BOTH &&
 		 !check_audiophile_booted(unit))
 		spec = NULL;
@@ -200,7 +199,8 @@ static int bebob_probe(struct fw_unit *unit, const struct ieee1394_device_id *en
 		spec = (const struct snd_bebob_spec *)entry->driver_data;
 
 	if (spec == NULL) {
-		if (entry->vendor_id == VEN_MAUDIO1 || entry->vendor_id == VEN_MAUDIO2)
+		// To boot up M-Audio models.
+		if (entry->vendor_id == VEN_MAUDIO || entry->vendor_id == VEN_BRIDGECO)
 			return snd_bebob_maudio_load_firmware(unit);
 		else
 			return -ENODEV;
@@ -280,7 +280,7 @@ static int bebob_probe(struct fw_unit *unit, const struct ieee1394_device_id *en
 	if (err < 0)
 		goto error;
 
-	if (entry->vendor_id == VEN_MAUDIO1 &&
+	if (entry->vendor_id == VEN_MAUDIO &&
 	    (entry->model_id == MODEL_MAUDIO_FW1814 || entry->model_id == MODEL_MAUDIO_PROJECTMIX)) {
 		// This is a workaround. This bus reset seems to have an effect to make devices
 		// correctly handling transactions. Without this, the devices have gap_count
@@ -443,26 +443,26 @@ static const struct ieee1394_device_id bebob_id_table[] = {
 	/* Focusrite, Saffire(no label and LE) */
 	SND_BEBOB_DEV_ENTRY(VEN_FOCUSRITE, MODEL_FOCUSRITE_SAFFIRE_BOTH,
 			    &saffire_spec),
-	/* M-Audio, Firewire 410 */
-	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO2, 0x00010058, NULL),	/* bootloader */
-	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO2, 0x00010046, &maudio_fw410_spec),
+	// M-Audio, Firewire 410. The vendor field is left as BridgeCo. AG.
+	SND_BEBOB_DEV_ENTRY(VEN_BRIDGECO, 0x00010058, NULL),
+	SND_BEBOB_DEV_ENTRY(VEN_BRIDGECO, 0x00010046, &maudio_fw410_spec),
 	/* M-Audio, Firewire Audiophile */
-	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO1, MODEL_MAUDIO_AUDIOPHILE_BOTH,
+	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO, MODEL_MAUDIO_AUDIOPHILE_BOTH,
 			    &maudio_audiophile_spec),
 	/* M-Audio, Firewire Solo */
-	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO1, 0x00010062, &maudio_solo_spec),
+	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO, 0x00010062, &maudio_solo_spec),
 	/* M-Audio, Ozonic */
-	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO1, 0x0000000a, &maudio_ozonic_spec),
+	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO, 0x0000000a, &maudio_ozonic_spec),
 	/* M-Audio NRV10 */
-	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO1, 0x00010081, &maudio_nrv10_spec),
+	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO, 0x00010081, &maudio_nrv10_spec),
 	/* M-Audio, ProFireLightbridge */
-	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO1, MODEL_MAUDIO_PROFIRELIGHTBRIDGE, &spec_normal),
+	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO, MODEL_MAUDIO_PROFIRELIGHTBRIDGE, &spec_normal),
 	/* Firewire 1814 */
-	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO1, 0x00010070, NULL),	/* bootloader */
-	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO1, MODEL_MAUDIO_FW1814,
+	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO, 0x00010070, NULL),	/* bootloader */
+	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO, MODEL_MAUDIO_FW1814,
 			    &maudio_special_spec),
 	/* M-Audio ProjectMix */
-	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO1, MODEL_MAUDIO_PROJECTMIX,
+	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO, MODEL_MAUDIO_PROJECTMIX,
 			    &maudio_special_spec),
 	/* Digidesign Mbox 2 Pro */
 	SND_BEBOB_DEV_ENTRY(VEN_DIGIDESIGN, 0x0000a9, &spec_normal),
-- 
2.30.2

