Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D23C47571
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:50:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52B5D6030E;
	Mon, 10 Nov 2025 15:49:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52B5D6030E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762786209;
	bh=YEhGzlYvaxknDODKk9pV+4jV9odIZpMcPlhU5BRJVSg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rYc44zlKCjEeKWwFw3KeDaIX8dLiEusBuQgs2eg+V7TP72+P1rj5xL1BfTEkRqbKI
	 DT7DVMOR6vbnzdUs+Aa/D5k3yO4jQgn0eFF9zM00wWX4g7PWz6vgCHxUBnAbjmuCmg
	 V2xDuV+mzBzXu37kOtdaHfmYy+SekEEnB0fvk46M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1431F89811; Mon, 10 Nov 2025 15:42:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8A6AF89821;
	Mon, 10 Nov 2025 15:42:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DC38F804F3; Wed,  5 Nov 2025 03:25:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPOOFED_FREEMAIL,
	T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR,UNPARSEABLE_RELAY shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57BE8F800FE
	for <alsa-devel@alsa-project.org>; Wed,  5 Nov 2025 03:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57BE8F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=DgtSb4RO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=/p
	2mNp4gNAgGCW3IMGenGM2K7t6SvD8ichbCMBxhLHs=; b=DgtSb4ROT+7ZTf/2Kw
	jBA/cNT0xndd6kmGtsY/9Y6GoESOOBLBIVJev0UhoQs26x93eJg7bIpJzu2PC/4L
	YaxB9paFN3809Q93RC9j4ucM85eVXagvt9rvLfrysoHBjoKhqlvvRsb10u4Bt0SW
	nTLyDpVrNcK/neROxwzkH2UIw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wDH3_GYtQppMrN8BQ--.117S2;
	Wed, 05 Nov 2025 10:25:31 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdich9700@163.com>,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v2] ALSA: hda/conexant: Fix pop noise on conexant codec
Date: Wed,  5 Nov 2025 10:25:26 +0800
Message-Id: <20251105022527.69770-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDH3_GYtQppMrN8BQ--.117S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr18KF45Gr1xAF4kGFykXwb_yoW5tFyUpr
	15Ga43GrZ3JF1I9r4fJr4fA3WYkFykWFsxJ34ft3W3Jw43Kry7Wa1jqFyI9F1fJrW7Kry2
	vF42vrWUKrW5JFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi0JPtUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwBtwv2kKtZvLrgAA38
X-MailFrom: wangdich9700@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: U5KB3ATPWBKENS3AP2VTTH5FSRKP5JJE
X-Message-ID-Hash: U5KB3ATPWBKENS3AP2VTTH5FSRKP5JJE
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:41:40 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U5KB3ATPWBKENS3AP2VTTH5FSRKP5JJE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: wangdicheng <wangdich9700@163.com>

Pop noise mitigation: When headphones are unplugged during playback,mute
speaker DAC(0x17)immediately and restore after 20ms delay to avoid
audible popping.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/conexant.c | 65 +++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5fcbc1312c69..2c16d1930a75 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -43,6 +43,9 @@ struct conexant_spec {
 	unsigned int gpio_mute_led_mask;
 	unsigned int gpio_mic_led_mask;
 	bool is_cx11880_sn6140;
+
+	struct hda_codec *conexant_codec;
+	struct delayed_work change_pinctl_work;
 };
 
 
@@ -216,6 +219,63 @@ static void cx_remove(struct hda_codec *codec)
 	snd_hda_gen_remove(codec);
 }
 
+static void mute_unmute_speaker(struct hda_codec *codec, hda_nid_t nid, bool mute)
+{
+	unsigned int conn_sel, dac, conn_list, gain_left, gain_right;
+
+	conn_sel = snd_hda_codec_read(codec, nid, 0, 0xf01, 0x0);
+	conn_list = snd_hda_codec_read(codec, nid, 0, 0xf02, 0x0);
+
+	dac = ((conn_list >> (conn_sel * 8)) & 0xff);
+	if (dac == 0)
+		return;
+
+	gain_left = snd_hda_codec_read(codec, dac, 0, 0xba0, 0x0);
+	gain_right = snd_hda_codec_read(codec, dac, 0, 0xb80, 0x0);
+
+	if (mute) {
+		gain_left |= 0x80;
+		gain_right |= 0x80;
+	} else {
+		gain_left &= (~(0x80));
+		gain_right &= (~(0x80));
+	}
+
+	snd_hda_codec_write(codec, dac, 0, 0x3a0, gain_left);
+	snd_hda_codec_write(codec, dac, 0, 0x390, gain_right);
+
+	if (mute) {
+		snd_hda_codec_write(codec, nid, 0, 0x707, 0);
+		codec_dbg(codec, "mute_speaker, set 0x%x  PinCtrl to 0.\n", nid);
+	} else {
+		snd_hda_codec_write(codec, nid, 0, 0x707, 0x40);
+		codec_dbg(codec, "unmute_speaker, set 0x%x  PinCtrl to 0x40.\n", nid);
+	}
+}
+
+static void change_pinctl_worker(struct work_struct *work)
+{
+	struct hda_codec *codec;
+	struct conexant_spec *spec;
+
+	spec = container_of(work, struct conexant_spec, change_pinctl_work.work);
+	codec = spec->conexant_codec;
+
+	return mute_unmute_speaker(codec, 0x17, false);
+}
+
+static void cx_auto_mute_unmute_speaker(struct hda_codec *codec, struct hda_jack_callback *event)
+{
+	struct conexant_spec *spec = codec->spec;
+	int phone_present;
+
+	phone_present = snd_hda_codec_read(codec, 0x16, 0, 0xf09, 0x0);
+	if (!(phone_present & 0x80000000)) {
+		mute_unmute_speaker(codec, 0x17, true);
+		schedule_delayed_work(&spec->change_pinctl_work, 20);
+	}
+}
+
 static void cx_process_headset_plugin(struct hda_codec *codec)
 {
 	unsigned int val;
@@ -1178,6 +1238,10 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	spec = kzalloc(sizeof(*spec), GFP_KERNEL);
 	if (!spec)
 		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&spec->change_pinctl_work, change_pinctl_worker);
+	spec->conexant_codec = codec;
+
 	snd_hda_gen_spec_init(&spec->gen);
 	codec->spec = spec;
 
@@ -1187,6 +1251,7 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	case 0x14f11f87:
 		spec->is_cx11880_sn6140 = true;
 		snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
+		snd_hda_jack_detect_enable_callback(codec, 0x16, cx_auto_mute_unmute_speaker);
 		break;
 	}
 
-- 
2.25.1

