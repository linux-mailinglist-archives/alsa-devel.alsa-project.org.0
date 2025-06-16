Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C7ADCB96
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jun 2025 14:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2BB36020F;
	Tue, 17 Jun 2025 14:31:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2BB36020F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750163477;
	bh=jgAxsTdc39hBDx7iOTO5H6wVJ8soJenHQN6jHtoYN5s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qyPAGx7I9dp2MHQSpa2QpsR8Dqfa5floU/6YGeDJXn3O7mI+4myIcArYdM1VZyP7S
	 fCiJosgvxDvURsKBAwXZAh23n8G3yKurq47YLfT4SDw/CyMnVvEevMfMpLa92IqNAN
	 wDIOVgpNzYqjyYhGEMvamfeKnID45wSTwavti3fM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEA4AF805E0; Tue, 17 Jun 2025 14:30:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDF96F805EA;
	Tue, 17 Jun 2025 14:30:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88BD5F80124; Mon, 16 Jun 2025 09:45:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by alsa1.perex.cz (Postfix) with ESMTP id B7546F80100
	for <alsa-devel@alsa-project.org>; Mon, 16 Jun 2025 09:45:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7546F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=AnnBijBV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=W5
	j43MkTtuhs8sLgSYF06e94i28Dyh1YdNYRzVhcD+k=; b=AnnBijBVVxkVB0n/id
	LVlTpE4ey75AQ1TwAG+xGen99uajIa+EJ6OJZ9StTC/QpqU79mdMMet0QLVQrNCM
	9R0TppduEUHGdGBWxLrz3UkMvXQncERgK5A/Fmsrn1eOp3G5t8siUBg/gKc+YFQf
	Lwp83xJ9PLs1I/wqLjZWGV/pQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCHXoSgy09oddz2Aw--.42840S2;
	Mon, 16 Jun 2025 15:45:37 +0800 (CST)
From: wangdicheng <wangdich9700@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdich9700@163.com>,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/realtek: Fixup ft alc257 rename alc3328
Date: Mon, 16 Jun 2025 15:45:20 +0800
Message-Id: <20250616074520.582138-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgCHXoSgy09oddz2Aw--.42840S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFW5Ww13Kw4xCF1DKFW7Jwb_yoW8trWfpF
	45ZF48WFZ3XF92vr4xKF4UuF1rC3WkGFyrC3y3u34Iqw1kZ395GF4jqF4jvFn3GrW8Gry5
	Zr1qva4Yqr4Fqr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUku7UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbBDRBuT2hPyE1ZWwAAsc
X-MailFrom: wangdich9700@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2LBFFVG6SSQVWVCO23YDSPHOIA6K4EQY
X-Message-ID-Hash: 2LBFFVG6SSQVWVCO23YDSPHOIA6K4EQY
X-Mailman-Approved-At: Tue, 17 Jun 2025 12:30:25 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2LBFFVG6SSQVWVCO23YDSPHOIA6K4EQY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Audio ALC3328 recognized as ALC257, updated PCI ID0x10EC12F0 to rename it to 3328

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/pci/hda/patch_realtek.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d3c9ed963588..e18b2a2acba8 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6712,6 +6712,13 @@ static void alc_fixup_disable_mic_vref(struct hda_codec *codec,
 		snd_hda_codec_set_pin_target(codec, 0x19, PIN_VREFHIZ);
 }
 
+static void alc_fixup_ft_alc257_rename(struct hda_codec *codec,
+                                 const struct hda_fixup *fix, int action)
+{
+       int err;
+       if (action == HDA_FIXUP_ACT_PRE_PROBE)
+               err = alc_codec_rename(codec, "ALC3328");
+}
 
 static void alc294_gx502_toggle_output(struct hda_codec *codec,
 					struct hda_jack_callback *cb)
@@ -7799,6 +7806,7 @@ enum {
 	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
 	ALC233_FIXUP_MEDION_MTL_SPK,
 	ALC294_FIXUP_BASS_SPEAKER_15,
+	ALC257_FIXUP_FT_RENAME,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -10143,6 +10151,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc294_fixup_bass_speaker_15,
 	},
+	[ALC257_FIXUP_FT_RENAME] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_ft_alc257_rename,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -10715,6 +10727,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10cf, 0x1757, "Lifebook E752", ALC269_FIXUP_LIFEBOOK_HP_PIN),
 	SND_PCI_QUIRK(0x10cf, 0x1845, "Lifebook U904", ALC269_FIXUP_LIFEBOOK_EXTMIC),
 	SND_PCI_QUIRK(0x10ec, 0x10f2, "Intel Reference board", ALC700_FIXUP_INTEL_REFERENCE),
+	SND_PCI_QUIRK(0x10ec, 0x12f0, "BXC NF271B FT board", ALC257_FIXUP_FT_RENAME),
 	SND_PCI_QUIRK(0x10ec, 0x118c, "Medion EE4254 MD62100", ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE),
 	SND_PCI_QUIRK(0x10ec, 0x119e, "Positivo SU C1400", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
 	SND_PCI_QUIRK(0x10ec, 0x11bc, "VAIO VJFE-IL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-- 
2.25.1

