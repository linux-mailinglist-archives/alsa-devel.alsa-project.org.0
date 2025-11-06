Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD59C4757F
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:50:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E40466038B;
	Mon, 10 Nov 2025 15:50:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E40466038B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762786229;
	bh=BA5DN392L5pMC/hE704tkepVLlbE3jtRvAkCi+fzRaA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DQWc2uze0xTLoSTd/sm/CVNC+/guZnbwYLe0bHc9w7tZZtZarbiqM3xmZZzVrqEdd
	 7fhvUpaPPajIuYSASoLwGTOu/6uDbfDLiI6GiHFO8Xo7IkEPCzoMFqAA5uLJ05k8As
	 p9/KUfs6gZDE6xtBUAeJefzmCJr3qql/X36ecTdw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BE63F806FA; Mon, 10 Nov 2025 15:42:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6B82F8983F;
	Mon, 10 Nov 2025 15:42:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D9F4F80272; Thu,  6 Nov 2025 03:38:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPOOFED_FREEMAIL,
	T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR,UNPARSEABLE_RELAY shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 616F5F800D2
	for <alsa-devel@alsa-project.org>; Thu,  6 Nov 2025 03:38:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 616F5F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=flx61ELH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0b
	4R35jSS/yUbZ/j8tv6hexOvyBCIsa6naKN2CvBI5A=; b=flx61ELHtHf/djU+6x
	qzS+D/GFkbb1BCYVzBwK/9kA2yPjxHR8NfnNGcu+JZFrotnLBzs3pJR/J7viZdo8
	LUOb+8XCZXjpsM9mMoFwfybCROk4GILxlBdipeAbj3Y8NLtbia76l3/BGFQ58WJs
	pb42bhUVuQUqzK5x8/JlsixIU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id
 _____wD3B_kSCgxpGD7kBw--.791S2;
	Thu, 06 Nov 2025 10:38:11 +0800 (CST)
From: wangdich9700@163.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	cezary.rojewski@intel.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdich9700@163.com>,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] [PATCH v3] ALSA: hda/conexant: Fix pop noise on
 CX11880/SN6140 codecs
Date: Thu,  6 Nov 2025 10:38:09 +0800
Message-Id: <20251106023809.70002-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3B_kSCgxpGD7kBw--.791S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF1kAr47GrW3XrWkJr4kCrg_yoWrWF17pr
	15Ka43K393JF1Ivr4fJr48A3WFgF95WFsrJw13t3W3JwsxKryxWa1jgryxKF1rJryqgry2
	vF429FWUKr45AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piOBMAUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwBPjM2kMChNt-gAA3s
X-MailFrom: wangdich9700@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PZIZSOVFZOFZ7UZYBNQDRJKGCAJRML3Y
X-Message-ID-Hash: PZIZSOVFZOFZ7UZYBNQDRJKGCAJRML3Y
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:42:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZIZSOVFZOFZ7UZYBNQDRJKGCAJRML3Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: wangdicheng <wangdich9700@163.com>

Pop noise mitigation: When headphones are unplugged during playback, mute
speaker DAC (0x17) immediately and restore after 20ms delay to avoid
audible popping. This fix is specifically for CX11880 (0x14f11f86) and
SN6140 (0x14f11f87) codecs based on testing verification.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/hda/codecs/conexant.c | 73 +++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5fcbc1312c69..f2f447ab749e 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -43,6 +43,10 @@ struct conexant_spec {
 	unsigned int gpio_mute_led_mask;
 	unsigned int gpio_mic_led_mask;
 	bool is_cx11880_sn6140;
+
+	/* Pop noise mitigation */
+	struct hda_codec *codec;
+	struct delayed_work pop_mitigation_work;
 };
 
 
@@ -212,10 +216,74 @@ static void cx_auto_shutdown(struct hda_codec *codec)
 
 static void cx_remove(struct hda_codec *codec)
 {
+	struct conexant_spec *spec = codec->spec;
+
+	cancel_delayed_work_sync(&spec->pop_mitigation_work);
 	cx_auto_shutdown(codec);
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
+		codec_dbg(codec, "mute_speaker, set 0x%x PinCtrl to 0.\n", nid);
+	} else {
+		snd_hda_codec_write(codec, nid, 0, 0x707, 0x40);
+		codec_dbg(codec, "unmute_speaker, set 0x%x PinCtrl to 0x40.\n", nid);
+	}
+}
+
+static void pop_mitigation_worker(struct work_struct *work)
+{
+	struct conexant_spec *spec = container_of(work, struct conexant_spec,
+			pop_mitigation_work.work);
+	struct hda_codec *codec = spec->codec;
+
+	mute_unmute_speaker(codec, 0x17, false);
+}
+
+static void cx_auto_pop_mitigation(struct hda_codec *codec,
+		struct hda_jack_callback *event)
+{
+	struct conexant_spec *spec = codec->spec;
+	int phone_present;
+
+	phone_present = snd_hda_codec_read(codec, 0x16, 0, 0xf09, 0x0);
+	if (!(phone_present & 0x80000000)) {
+		/* Headphone unplugged, mute speaker immediately */
+		mute_unmute_speaker(codec, 0x17, true);
+		/* Schedule unmute after 20ms delay */
+		schedule_delayed_work(&spec->pop_mitigation_work, msecs_to_jiffies(20));
+	} else {
+		/* Headphone plugged in, cancel any pending unmute */
+		cancel_delayed_work_sync(&spec->pop_mitigation_work);
+	}
+}
+
 static void cx_process_headset_plugin(struct hda_codec *codec)
 {
 	unsigned int val;
@@ -1178,6 +1246,9 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	spec = kzalloc(sizeof(*spec), GFP_KERNEL);
 	if (!spec)
 		return -ENOMEM;
+
+	spec->codec = codec;
+	INIT_DELAYED_WORK(&spec->pop_mitigation_work, pop_mitigation_worker);
 	snd_hda_gen_spec_init(&spec->gen);
 	codec->spec = spec;
 
@@ -1187,6 +1258,8 @@ static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
 	case 0x14f11f87:
 		spec->is_cx11880_sn6140 = true;
 		snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
+		/* Enable pop noise mitigation for both codecs */
+		snd_hda_jack_detect_enable_callback(codec, 0x16, cx_auto_pop_mitigation);
 		break;
 	}
 
-- 
2.25.1

