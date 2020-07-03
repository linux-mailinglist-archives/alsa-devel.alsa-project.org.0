Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C8E2135AB
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 10:02:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98C9116DC;
	Fri,  3 Jul 2020 10:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98C9116DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593763369;
	bh=Vr+Osw71HRhc1c1LtcUtT84mbq9oLhJIuphV8YHKl3s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PDR65O/rC7DE+SbdR7iFVUTRtrWbiIDdc4Fdr3hRYmBMLAbNrMv0c4p/d8VKIHTol
	 HyF+DLTdHC16QE21IO8GesnGmR7yyoxdc8fCiMK7f6hNq61ltzx0UT712QJ2+5W43I
	 I7osgmx+BTNVWzcDCl8uKHrmR+yC3bvibOv6q91Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FA91F802A9;
	Fri,  3 Jul 2020 10:01:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8A71F8028F; Fri,  3 Jul 2020 10:01:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01000F8025F
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 10:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01000F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ro1+dS7O"
Received: by mail-pj1-x1041.google.com with SMTP id gc15so4773139pjb.0
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 01:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bf0tUB1OTya15R9dk1GYVgxFlAwlmys8lOZXXEtOzmM=;
 b=Ro1+dS7O5mQyJhnWZ7bhxzE/3suTdbPoIobAPWa4eRpewUsuwsOuE8B1exawWNnb+B
 E2TuPvPGLXOyGElixvq09oRBmEefuHzlrbqbm00nF8J+XbZz1xwOZNWxY7x53H5z/4Br
 hqN8yqsVG251tJLEMquKdmQnOCx60IIc4m7RKv6aRYGqsErVZE44tiLeGXE/+YXVx+yR
 TFXNSobOcm83qJgUIY/AG9sTDDWGcjPVqwbqwqUEYfy0xw1NRmzEbDSdI+MfsXrSS7q2
 hzxc4eRxuVS5DVWAroxem+SmYgHWGq6yQ0nItKGP3KCTLZDRkox7ujqXs6R2UCeqP7hZ
 6cUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bf0tUB1OTya15R9dk1GYVgxFlAwlmys8lOZXXEtOzmM=;
 b=lmIpVdE3VSYRSG7LCcRcON4DtmgsTb/fwPujjS9Wehe8JD4UoIam/iNg4+udi+TAKm
 5mv2y4ugRt8x3eOSLRl6FXZAmTrSEfVavJPeL9RZRALqlGNHZghrjPe9fgwY+yUw3m2V
 N7KqwrsXUFJ3P88bIQb6MELBgi1CopkpcldzSByHH01emOz/7wBsywnm77RbrpruXX5G
 CKRDyLau/JvVYTpE2k6IkR/Qf0UPNI/rt9YbcY6zbDf0dtVlH0Q0K+0YKm2ehY0m1qia
 ErwwOgMgNJNY1AGgfrImAwijm09/KFWsZ4c9nAIKWefLrxANY4iDgbJ+IhzA4+bvWXff
 OZ5g==
X-Gm-Message-State: AOAM533v5SZQkOVYCgTP3QE0JkTMROpymN5uSSIfde71pcNgMEiQ97yk
 Jph/L80qcznZSNppXuDphuE3n2C4C8M=
X-Google-Smtp-Source: ABdhPJzBJUR+NquVq0Vh8kohTfEreMwbZnNCTPs+FFN5KI1fCwBa3Ir72TOlaMRyM5HJQYV7go5ZOA==
X-Received: by 2002:a17:902:b08d:: with SMTP id
 p13mr28897276plr.141.1593763263555; 
 Fri, 03 Jul 2020 01:01:03 -0700 (PDT)
Received: from f3.nvidia.com (ae055068.dynamic.ppp.asahi-net.or.jp.
 [14.3.55.68])
 by smtp.gmail.com with ESMTPSA id 17sm8956411pfv.16.2020.07.03.01.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:01:02 -0700 (PDT)
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] ALSA: hda/realtek - Replace Lenovo Thinkpad X1 Carbon
 7th quirk
Date: Fri,  3 Jul 2020 17:00:05 +0900
Message-Id: <20200703080005.8942-3-benjamin.poirier@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200703080005.8942-1-benjamin.poirier@gmail.com>
References: <20200703080005.8942-1-benjamin.poirier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kailang Yang <kailang@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Vincent Bernat <vincent@bernat.ch>, Even Brenden <evenbrenden@gmail.com>
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

As a result of commit d2cd795c4ece ("ALSA: hda - fixup for the bass speaker
on Lenovo Carbon X1 7th gen"), the sound output level on my machine, an X1
Carbon 7th gen, was reduced to ~65% of its previous level when playing
certain sounds. [1]

Internally, this laptop model has three outputs (PCM-OUT1, connection 0x02;
PCM-OUT2, connection 0x03; SP-OUT PCM, connection 0x06) which can be routed
to two sets of stereo speakers: Front (tweeters, node 0x14) and Bass
(woofers, node 0x17, aka Rear in some contexts) and one headphone output
(node 0x21). The tweeters are noticeably less powerful than the woofers.
[2]

Before commit d2cd795c4ece, the bass speakers were connected to SP-OUT PCM.
SP-OUT PCM is meant for s/pdif output and does not have volume control.
This connection made volume control commonly ineffective (using the Master
slider in alsa or pulseaudio apparently had little effect or alternated
between mute or max with nothing in between).

commit d2cd795c4ece added quirk ALC285_FIXUP_SPEAKER2_TO_DAC1 which
resulted in assigning both sets of speakers to PCM-OUT1, bringing
the two sets of speakers under one effective volume control but also
lowering the output volume noticeably.

Fix this by connecting PCM-OUT1 to Front speakers and PCM-OUT2 to Rear
speakers. Each set of speakers gets its own volume control and the max
output volume is restored to what it was before commit d2cd795c4ece. This
is done by setting the connection of node 0x17 to 0x03.

However, when we do this, the HDA auto config automatically changes the
connection of node 0x21 to 0x02. This output, meant for the front speakers,
has some "secret" equalizer which changes the output volume according to
the level of what's being played, after some delay[3]. This is undesirable
with headphones. Therefore, this patch manually limits the connection of
node 0x21 to 0x03.

The volume control for PCM-OUT2 is renamed to reflect its dual effect.
This name is also used in a modified alsa UCM profile. [4]

It is possible that the X1 Carbon 8th gen would benefit from the same
changes but I don't have a device to test that. Fixups are reordered so
that the devices for 7th & 8th gen can share the same chain after the first
fixup. The resulting chain is:
ALC295_FIXUP_TPX17_DUAL_SPEAKERS/ALC285_FIXUP_SPEAKER2_TO_DAC1
ALC285_FIXUP_THINKPAD_HEADSET_JACK
ALC269_FIXUP_THINKPAD_ACPI
ALC269_FIXUP_SKU_IGNORE

[1] https://gist.github.com/hamidzr/dd81e429dc86f4327ded7a2030e7d7d9#gistcomment-3214171
[2] https://bugzilla.kernel.org/show_bug.cgi?id=207407#c10
[3] https://gist.github.com/hamidzr/dd81e429dc86f4327ded7a2030e7d7d9#gistcomment-3276276
[4] https://lore.kernel.org/alsa-devel/20200703072302.16876-1-benjamin.poirier@gmail.com/

Fixes: d2cd795c4ece ("ALSA: hda - fixup for the bass speaker on Lenovo Carbon X1 7th gen")
Link: https://lore.kernel.org/alsa-devel/20200210025249.GA2700@f3/
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Kailang Yang <kailang@realtek.com>
Tested-by: Vincent Bernat <vincent@bernat.ch>
Tested-by: Even Brenden <evenbrenden@gmail.com>
Signed-off-by: Benjamin Poirier <benjamin.poirier@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 56 ++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 16696694da91..ef3dbf83e42b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5825,6 +5825,46 @@ static void alc285_fixup_speaker2_to_dac1(struct hda_codec *codec,
 	}
 }
 
+static void alc295_fixup_tpx17_dual_speakers(struct hda_codec *codec,
+					     const struct hda_fixup *fix,
+					     int action)
+{
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		static const hda_nid_t conn[] = { 0x03 };
+
+		/* For NID 0x17 (bass speakers), the connection list is {0x02,
+		 * 0x03, 0x06}. Disable SP-OUT PCM (0x06) selection since it
+		 * has no volume control, disable PCM1 (0x02) selection since
+		 * it is for front speakers. This leaves PCM2 (0x03).
+		 */
+		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn),
+					   conn);
+		/* For NID 0x21 (headphone out), the connection list is {0x02,
+		 * 0x03}. Disable LOUT1 (0x02) selection since its volume
+		 * fluctuates according to input level. This leaves LOUT2
+		 * (0x03).
+		 */
+		snd_hda_override_conn_list(codec, 0x21, ARRAY_SIZE(conn),
+					   conn);
+	} else if (action == HDA_FIXUP_ACT_INIT) {
+		/* Because the overridden connection lists contain only a
+		 * single node, __parse_nid_path() does not label the output
+		 * as "multi". This leads snd_hda_activate_path() to skip the
+		 * AC_VERB_SET_CONNECT_SEL even though it might be needed. Do
+		 * it here instead.
+		 * Note that when doing AC_VERB_SET_CONNECT_SEL, the
+		 * connection is specified by index instead of nid.
+		 */
+		snd_hda_codec_write(codec, 0x17, 0, AC_VERB_SET_CONNECT_SEL,
+				    0x1);
+		snd_hda_codec_write(codec, 0x21, 0, AC_VERB_SET_CONNECT_SEL,
+				    0x1);
+	} else if (action == HDA_FIXUP_ACT_BUILD) {
+		rename_ctl(codec, "Headphone Playback Volume",
+			   "Headphone/Bass Speaker Playback Volume");
+	}
+}
+
 /* Hook to update amp GPIO4 for automute */
 static void alc280_hp_gpio4_automute_hook(struct hda_codec *codec,
 					  struct hda_jack_callback *jack)
@@ -6077,6 +6117,7 @@ enum {
 	ALC225_FIXUP_DISABLE_MIC_VREF,
 	ALC225_FIXUP_DELL1_MIC_NO_PRESENCE,
 	ALC295_FIXUP_DISABLE_DAC3,
+	ALC295_FIXUP_TPX17_DUAL_SPEAKERS,
 	ALC285_FIXUP_SPEAKER2_TO_DAC1,
 	ALC280_FIXUP_HP_HEADSET_MIC,
 	ALC221_FIXUP_HP_FRONT_MIC,
@@ -6886,11 +6927,17 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc295_fixup_disable_dac3,
 	},
+	[ALC295_FIXUP_TPX17_DUAL_SPEAKERS] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc295_fixup_tpx17_dual_speakers,
+		.chained = true,
+		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK
+	},
 	[ALC285_FIXUP_SPEAKER2_TO_DAC1] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_speaker2_to_dac1,
 		.chained = true,
-		.chain_id = ALC269_FIXUP_THINKPAD_ACPI
+		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK
 	},
 	[ALC256_FIXUP_DELL_INSPIRON_7559_SUBWOOFER] = {
 		.type = HDA_FIXUP_PINS,
@@ -7263,7 +7310,7 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_headset_jack,
 		.chained = true,
-		.chain_id = ALC285_FIXUP_SPEAKER2_TO_DAC1
+		.chain_id = ALC269_FIXUP_THINKPAD_ACPI
 	},
 	[ALC294_FIXUP_ASUS_HPE] = {
 		.type = HDA_FIXUP_VERBS,
@@ -7559,8 +7606,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x224c, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
-	SND_PCI_QUIRK(0x17aa, 0x22be, "Thinkpad X1 Carbon 8th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
+	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC295_FIXUP_TPX17_DUAL_SPEAKERS),
+	SND_PCI_QUIRK(0x17aa, 0x22be, "Thinkpad X1 Carbon 8th", ALC285_FIXUP_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x17aa, 0x30bb, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
 	SND_PCI_QUIRK(0x17aa, 0x30e2, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
 	SND_PCI_QUIRK(0x17aa, 0x310c, "ThinkCentre Station", ALC294_FIXUP_LENOVO_MIC_LOCATION),
@@ -7746,6 +7793,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC255_FIXUP_DELL_SPK_NOISE, .name = "dell-spk-noise"},
 	{.id = ALC225_FIXUP_DELL1_MIC_NO_PRESENCE, .name = "alc225-dell1"},
 	{.id = ALC295_FIXUP_DISABLE_DAC3, .name = "alc295-disable-dac3"},
+	{.id = ALC295_FIXUP_TPX17_DUAL_SPEAKERS, .name = "alc295-thinkpad-x1-gen7"},
 	{.id = ALC285_FIXUP_SPEAKER2_TO_DAC1, .name = "alc285-speaker2-to-dac1"},
 	{.id = ALC280_FIXUP_HP_HEADSET_MIC, .name = "alc280-hp-headset"},
 	{.id = ALC221_FIXUP_HP_FRONT_MIC, .name = "alc221-hp-mic"},
-- 
2.27.0

