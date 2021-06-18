Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9EC3AD03C
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 18:19:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B32A0172B;
	Fri, 18 Jun 2021 18:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B32A0172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624033142;
	bh=jkVk9gNIcwstWV6BRXnIWsTx1XZvlYVSej2H8Hbbirc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uriy8MpybXJ2ZzrI76i/pDuTE504SFb354gCD0bTKyEvhjZEAiqP5PmIGEdsMZzbA
	 P2evZYUe/vvMxJLN+PUnJkBh580mX+w13jxPqWf1BR2BAvadqHAL3zQb2FNFbBBU1V
	 s6h2+QluzqTdY6aHdWPs0M2ujPNj/a1pQ7AkPYzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A540F80423;
	Fri, 18 Jun 2021 18:17:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E28FEF80148; Fri, 18 Jun 2021 18:17:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A6C1F80148
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 18:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A6C1F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="CIMeIQAC"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="tzPj9Q21"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 310A621AF1
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 16:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624033041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Uu4PQgqCIhpfS6Rd7JJCun0zOjMPD7nB4S1hHWBqSwM=;
 b=CIMeIQAC0Y/tJ5VMty4N4mXOMXQFZMFprLzHvWOti3bayqINjUfzrqM5u5zLuBwhJ7caZY
 phQkUxbnqstxdoP2I8A4NtikvsslTFba4BtoQdQ8GFAsJxmAjO6r0MNkCmf/9wAZOUz0gY
 qC7/zv90Vx3OoPs2XupFDebCxWCUYWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624033041;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Uu4PQgqCIhpfS6Rd7JJCun0zOjMPD7nB4S1hHWBqSwM=;
 b=tzPj9Q21JApV6wJaOSF9FjCEsbaXLBsYTGRBt4N5WsZtQyiXVSoi71jK4VBTpnuUPS9fp6
 vtE/J6DN/okWGyBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 205A3A3B9D;
 Fri, 18 Jun 2021 16:17:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add another ALC236 variant support
Date: Fri, 18 Jun 2021 18:17:20 +0200
Message-Id: <20210618161720.28694-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The codec chip 10ec:0230 is another variant of ALC236, combined with a
card reader.  Apply the equivalent setup as 10ec:0236.

BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1184869
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index bbbe37f3e724..fac2f15d9e26 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -385,6 +385,7 @@ static void alc_fill_eapd_coef(struct hda_codec *codec)
 		alc_update_coef_idx(codec, 0x67, 0xf000, 0x3000);
 		fallthrough;
 	case 0x10ec0215:
+	case 0x10ec0230:
 	case 0x10ec0233:
 	case 0x10ec0235:
 	case 0x10ec0236:
@@ -3127,6 +3128,7 @@ static void alc_disable_headset_jack_key(struct hda_codec *codec)
 		alc_update_coef_idx(codec, 0x49, 0x0045, 0x0);
 		alc_update_coef_idx(codec, 0x44, 0x0045 << 8, 0x0);
 		break;
+	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
 		alc_write_coef_idx(codec, 0x48, 0x0);
@@ -3154,6 +3156,7 @@ static void alc_enable_headset_jack_key(struct hda_codec *codec)
 		alc_update_coef_idx(codec, 0x49, 0x007f, 0x0045);
 		alc_update_coef_idx(codec, 0x44, 0x007f << 8, 0x0045 << 8);
 		break;
+	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
 		alc_write_coef_idx(codec, 0x48, 0xd011);
@@ -4689,6 +4692,7 @@ static void alc_headset_mode_unplugged(struct hda_codec *codec)
 	case 0x10ec0255:
 		alc_process_coef_fw(codec, coef0255);
 		break;
+	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
 		alc_process_coef_fw(codec, coef0256);
@@ -4803,6 +4807,7 @@ static void alc_headset_mode_mic_in(struct hda_codec *codec, hda_nid_t hp_pin,
 		alc_process_coef_fw(codec, coef0255);
 		snd_hda_set_pin_ctl_cache(codec, mic_pin, PIN_VREF50);
 		break;
+	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
 		alc_write_coef_idx(codec, 0x45, 0xc489);
@@ -4952,6 +4957,7 @@ static void alc_headset_mode_default(struct hda_codec *codec)
 	case 0x10ec0255:
 		alc_process_coef_fw(codec, coef0255);
 		break;
+	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
 		alc_write_coef_idx(codec, 0x1b, 0x0e4b);
@@ -5050,6 +5056,7 @@ static void alc_headset_mode_ctia(struct hda_codec *codec)
 	case 0x10ec0255:
 		alc_process_coef_fw(codec, coef0255);
 		break;
+	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
 		alc_process_coef_fw(codec, coef0256);
@@ -5163,6 +5170,7 @@ static void alc_headset_mode_omtp(struct hda_codec *codec)
 	case 0x10ec0255:
 		alc_process_coef_fw(codec, coef0255);
 		break;
+	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
 		alc_process_coef_fw(codec, coef0256);
@@ -5263,6 +5271,7 @@ static void alc_determine_headset_type(struct hda_codec *codec)
 		val = alc_read_coef_idx(codec, 0x46);
 		is_ctia = (val & 0x0070) == 0x0070;
 		break;
+	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
 		alc_write_coef_idx(codec, 0x1b, 0x0e4b);
@@ -5556,6 +5565,7 @@ static void alc255_set_default_jack_type(struct hda_codec *codec)
 	case 0x10ec0255:
 		alc_process_coef_fw(codec, alc255fw);
 		break;
+	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
 		alc_process_coef_fw(codec, alc256fw);
@@ -6156,6 +6166,7 @@ static void alc_combo_jack_hp_jd_restart(struct hda_codec *codec)
 		alc_update_coef_idx(codec, 0x4a, 0x8000, 1 << 15); /* Reset HP JD */
 		alc_update_coef_idx(codec, 0x4a, 0x8000, 0 << 15);
 		break;
+	case 0x10ec0230:
 	case 0x10ec0235:
 	case 0x10ec0236:
 	case 0x10ec0255:
@@ -9130,6 +9141,7 @@ static int patch_alc269(struct hda_codec *codec)
 		spec->shutup = alc256_shutup;
 		spec->init_hook = alc256_init;
 		break;
+	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
 		spec->codec_variant = ALC269_TYPE_ALC256;
@@ -10421,6 +10433,7 @@ static const struct hda_device_id snd_hda_id_realtek[] = {
 	HDA_CODEC_ENTRY(0x10ec0221, "ALC221", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0222, "ALC222", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0225, "ALC225", patch_alc269),
+	HDA_CODEC_ENTRY(0x10ec0230, "ALC236", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0231, "ALC231", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0233, "ALC233", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0234, "ALC234", patch_alc269),
-- 
2.26.2

