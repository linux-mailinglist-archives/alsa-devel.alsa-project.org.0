Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E69AADCB94
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jun 2025 14:31:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66DEA601FA;
	Tue, 17 Jun 2025 14:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66DEA601FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750163461;
	bh=nOc/n1KV0S5P3fT9GMJf7e5kLYWdERJAb3PbQtwye74=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oXDXgGJ0hJBlqDjnJzB/z5FcuUSj/MbICZVa1hKVauYO30ASTOf0P2V6X3uczo+pJ
	 2JNWqYE7/sj8b+eQr6lHm1xQuDZZihjMCXUgWlwQC8mMlYTz8ZtNx+zS8nf8SR1vqG
	 wL+iKIvOhd+nW3jJ2Olh1X0c2n92VrMqirehMMg8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB53CF805BD; Tue, 17 Jun 2025 14:30:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AA05F800C1;
	Tue, 17 Jun 2025 14:30:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EEBCF80124; Mon, 16 Jun 2025 09:43:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by alsa1.perex.cz (Postfix) with ESMTP id 844A2F80100
	for <alsa-devel@alsa-project.org>; Mon, 16 Jun 2025 09:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 844A2F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=OQfR8UO4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7k
	mj3Dx6LNtxMuBXInzuZTk0/cSW/2IYoCKygr1quCg=; b=OQfR8UO46X3vjCAwwG
	ZxCNBQq9L7Q93CZnAU6JwLPCH0B/EbFRzEGqzH9WYGAMFpi79p1KR1dpIm0XySjq
	ZbO7ZVxXnzMJrIEx0ZhyiMmrOK932tbNxZea6JCx8ETampCwWhDiugJS4gHD7st5
	6zNdPwmwF9QXysxYuOiYCIZuc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wDnznM0y09ow3E6Ig--.7585S2;
	Mon, 16 Jun 2025 15:43:48 +0800 (CST)
From: wangdicheng <wangdich9700@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v2] ALSA: hda/conexant: Renaming the codec with device ID
 0x1f86 and 0x1f87
Date: Mon, 16 Jun 2025 15:43:31 +0800
Message-Id: <20250616074331.581309-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnznM0y09ow3E6Ig--.7585S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWfZr1UuFyxXw4UGw4kJFb_yoW5JF48pr
	18Way5JrW2qFn0vFWxJr4DGF43W3ZayF97JrWakryxtw15Xry7Wa4fWryIvF4fJFZ0gaya
	qFsrKF10qayYvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzWlkUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbBDQRuT2hPtVFw2wABsB
X-MailFrom: wangdich9700@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DLRTCKU27ZTIT3NCRFMHNU5I4JZYTPQ6
X-Message-ID-Hash: DLRTCKU27ZTIT3NCRFMHNU5I4JZYTPQ6
X-Mailman-Approved-At: Tue, 17 Jun 2025 12:30:24 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DLRTCKU27ZTIT3NCRFMHNU5I4JZYTPQ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: wangdicheng <wangdicheng@kylinos.cn>

Due to changes in the manufacturer's plan, all 0x14f11f86 will be named CX11880, and 0x14f11f87 will be named SN6140

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/pci/hda/patch_conexant.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 4985e72b9094..1366a33de8d3 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -42,7 +42,7 @@ struct conexant_spec {
 	unsigned int gpio_led;
 	unsigned int gpio_mute_led_mask;
 	unsigned int gpio_mic_led_mask;
-	bool is_cx8070_sn6140;
+	bool is_cx11880_sn6140;
 };
 
 
@@ -195,7 +195,7 @@ static int cx_auto_init(struct hda_codec *codec)
 	cxt_init_gpio_led(codec);
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT);
 
-	if (spec->is_cx8070_sn6140)
+	if (spec->is_cx11880_sn6140)
 		cx_fixup_headset_recog(codec);
 
 	return 0;
@@ -247,7 +247,7 @@ static void cx_update_headset_mic_vref(struct hda_codec *codec, struct hda_jack_
 {
 	unsigned int mic_present;
 
-	/* In cx8070 and sn6140, the node 16 can only be configured to headphone or disabled,
+	/* In cx11880 and sn6140, the node 16 can only be configured to headphone or disabled,
 	 * the node 19 can only be configured to microphone or disabled.
 	 * Check hp&mic tag to process headset plugin & plugout.
 	 */
@@ -1191,11 +1191,11 @@ static int patch_conexant_auto(struct hda_codec *codec)
 	codec->spec = spec;
 	codec->patch_ops = cx_auto_patch_ops;
 
-	/* init cx8070/sn6140 flag and reset headset_present_flag */
+	/* init cx11880/sn6140 flag and reset headset_present_flag */
 	switch (codec->core.vendor_id) {
 	case 0x14f11f86:
 	case 0x14f11f87:
-		spec->is_cx8070_sn6140 = true;
+		spec->is_cx11880_sn6140 = true;
 		snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
 		break;
 	}
@@ -1283,7 +1283,7 @@ static int patch_conexant_auto(struct hda_codec *codec)
  */
 
 static const struct hda_device_id snd_hda_id_conexant[] = {
-	HDA_CODEC_ENTRY(0x14f11f86, "CX8070", patch_conexant_auto),
+	HDA_CODEC_ENTRY(0x14f11f86, "CX11880", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f11f87, "SN6140", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f12008, "CX8200", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f120d0, "CX11970", patch_conexant_auto),
-- 
2.25.1

