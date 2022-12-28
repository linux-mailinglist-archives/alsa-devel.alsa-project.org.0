Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE546576B7
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 13:58:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18B0D21BE;
	Wed, 28 Dec 2022 13:57:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18B0D21BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672232313;
	bh=UJO0xIzLwvFjkQ62GxKPAs0F7siOxaXbsK5YIEv4gUE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XsDNiXw6ML24fLc7h/fwO5hK9pQDfX9/VtI6bjwaAuLRwFttBn3rXvbBMgrzpEfsR
	 Qx1LSIom3SlRKF5H+CUZbBAMrVyA2PEtTeL2TpKFwg7vxMPvQq7WdwO9UIW6vAYuW9
	 arUOW8wnl+rYbNyuVeMKSuyxVEE/9frkIBxu5XWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDAC3F8049E;
	Wed, 28 Dec 2022 13:57:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E74E0F8042F; Wed, 28 Dec 2022 13:57:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44A77F800F0
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 13:57:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44A77F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=kq1nDEB4; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PPhtKi8w
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D88FF21A6E;
 Wed, 28 Dec 2022 12:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672232237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7qznrTg00mW6ZYOrA04xLF3W7FPWHrvzWf9c2GFQGSI=;
 b=kq1nDEB4stdrg0KoF+TV+OJ8XUIifvpBB8hiuWlIXCEYkckLaEP4IA/y6PNr9lrKy+smnI
 yjCM/MXDfFYL0+NErTs2obA6oCxxZWiwvcwfSOjw6TSUYSNCFn1VXBzpTO9fogeW9f+S/j
 4Td3ZONfQkah4qvjt5w03HnEBQOfD3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672232237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7qznrTg00mW6ZYOrA04xLF3W7FPWHrvzWf9c2GFQGSI=;
 b=PPhtKi8w/ljDpDG03FJpTifbDmxykiSJUHjqAZsWVNOA135mzdL+ICbs2SHAnSd1gmWq7U
 NC2gNuhdECYl4ECQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE0DE134F5;
 Wed, 28 Dec 2022 12:57:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QRrILS09rGNMIgAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 28 Dec 2022 12:57:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/hdmi: Static PCM mapping again with AMD HDMI codecs
Date: Wed, 28 Dec 2022 13:57:14 +0100
Message-Id: <20221228125714.16329-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

The recent code refactoring for HD-audio HDMI codec driver caused a
regression on AMD/ATI HDMI codecs; namely, PulseAudioand pipewire
don't recognize HDMI outputs any longer while the direct output via
ALSA raw access still works.

The problem turned out that, after the code refactoring, the driver
assumes only the dynamic PCM assignment, and when a PCM stream that
still isn't assigned to any pin gets opened, the driver tries to
assign any free converter to the PCM stream.  This behavior is OK for
Intel and other codecs, as they have arbitrary connections between
pins and converters.  OTOH, on AMD chips that have a 1:1 mapping
between pins and converters, this may end up with blocking the open of
the next PCM stream for the pin that is tied with the formerly taken
converter.

Also, with the code refactoring, more PCM streams are exposed than
necessary as we assume all converters can be used, while this isn't
true for AMD case.  This may change the PCM stream assignment and
confuse users as well.

This patch fixes those problems by:

- Introducing a flag spec->static_pcm_mapping, and if it's set, the
  driver applies the static mapping between pins and converters at the
  probe time
- Limiting the number of PCM streams per pins, too; this avoids the
  superfluous PCM streams

Fixes: ef6f5494faf6 ("ALSA: hda/hdmi: Use only dynamic PCM device allocation")
Cc: <stable@vger.kernel.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216836
Co-developed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 8015e4471267..386dd9d9143f 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -167,6 +167,7 @@ struct hdmi_spec {
 	struct hdmi_ops ops;
 
 	bool dyn_pin_out;
+	bool static_pcm_mapping;
 	/* hdmi interrupt trigger control flag for Nvidia codec */
 	bool hdmi_intr_trig_ctrl;
 	bool nv_dp_workaround; /* workaround DP audio infoframe for Nvidia */
@@ -1525,13 +1526,16 @@ static void update_eld(struct hda_codec *codec,
 	 */
 	pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
 
-	if (eld->eld_valid) {
-		hdmi_attach_hda_pcm(spec, per_pin);
-		hdmi_pcm_setup_pin(spec, per_pin);
-	} else {
-		hdmi_pcm_reset_pin(spec, per_pin);
-		hdmi_detach_hda_pcm(spec, per_pin);
+	if (!spec->static_pcm_mapping) {
+		if (eld->eld_valid) {
+			hdmi_attach_hda_pcm(spec, per_pin);
+			hdmi_pcm_setup_pin(spec, per_pin);
+		} else {
+			hdmi_pcm_reset_pin(spec, per_pin);
+			hdmi_detach_hda_pcm(spec, per_pin);
+		}
 	}
+
 	/* if pcm_idx == -1, it means this is in monitor connection event
 	 * we can get the correct pcm_idx now.
 	 */
@@ -2281,8 +2285,8 @@ static int generic_hdmi_build_pcms(struct hda_codec *codec)
 	struct hdmi_spec *spec = codec->spec;
 	int idx, pcm_num;
 
-	/* limit the PCM devices to the codec converters */
-	pcm_num = spec->num_cvts;
+	/* limit the PCM devices to the codec converters or available PINs */
+	pcm_num = min(spec->num_cvts, spec->num_pins);
 	codec_dbg(codec, "hdmi: pcm_num set to %d\n", pcm_num);
 
 	for (idx = 0; idx < pcm_num; idx++) {
@@ -2379,6 +2383,11 @@ static int generic_hdmi_build_controls(struct hda_codec *codec)
 		struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
 		struct hdmi_eld *pin_eld = &per_pin->sink_eld;
 
+		if (spec->static_pcm_mapping) {
+			hdmi_attach_hda_pcm(spec, per_pin);
+			hdmi_pcm_setup_pin(spec, per_pin);
+		}
+
 		pin_eld->eld_valid = false;
 		hdmi_present_sense(per_pin, 0);
 	}
@@ -4419,6 +4428,8 @@ static int patch_atihdmi(struct hda_codec *codec)
 
 	spec = codec->spec;
 
+	spec->static_pcm_mapping = true;
+
 	spec->ops.pin_get_eld = atihdmi_pin_get_eld;
 	spec->ops.pin_setup_infoframe = atihdmi_pin_setup_infoframe;
 	spec->ops.pin_hbr_setup = atihdmi_pin_hbr_setup;
-- 
2.35.3

