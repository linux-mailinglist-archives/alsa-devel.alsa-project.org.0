Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A6053F864
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 10:42:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07C09183A;
	Tue,  7 Jun 2022 10:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07C09183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654591351;
	bh=wvNQPnbIQiXkOsmO8r7t8EVINEajKE+jofC6gisgShI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KAWc3jS1lNo6MC+XYeo85tvggEdBqSSADSZccH5y5EMr7eS28TlZe5r041UMSjRMq
	 2miaejg49VqBf8rgzxhGSkUXaMxINSOeUOGKjLgojhAYkaktPbcdDkU8SqY/rLw2GP
	 9RrScc2xsf1pnh+OL3OWYak7SjQww5eucKUjZmf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8497FF800ED;
	Tue,  7 Jun 2022 10:41:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 587DDF80109; Tue,  7 Jun 2022 10:41:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 964A9F80109
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 10:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 964A9F80109
X-QQ-mid: bizesmtp66t1654591274tjr4kd6n
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 07 Jun 2022 16:41:12 +0800 (CST)
X-QQ-SSF: 01400000002000B0I000B00A0000000
X-QQ-FEAT: ZHWZeLXy+8eqKx+JuPk8Ym3VtqxoQYUIFeKyur0hG1PG3CRVlrxVF2bp/pOTd
 SMgoJKIknFJwER5HZcDShBVDQbai7Rez98VXa7aPdOg3YMRL0XrmkrjoUFrZWz4C4wizFZU
 ke7ZWCGj322Gh+iFgHgwP1/PsctzPrUZrT/T+rMYuLNy34t2qCpzRcyekuO0YAq43N//Prr
 C7S1Z3o7UplMasp4pVFxEADtt26G/m/xKHnCOKdgXK9wWP/OwOYIWyxvWQpTYJmFZOaQWoB
 d8lq9hdg5F2fknLtbWdJSzotd8jEdoAzctxg7ltv/9Hw1r1p8VOYiHRNw4BqvsfV+MFaeE1
 jbgYsXpvMcYWdHH+F+FuHyG0yU1jRncLbsu1oGv
X-QQ-GoodBg: 2
From: huangwenhui <huangwenhuia@uniontech.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek - Add HW8326 support
Date: Tue,  7 Jun 2022 16:41:09 +0800
Message-Id: <20220607084109.29120-1-huangwenhuia@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign10
X-QQ-Bgrelay: 1
Cc: alsa-devel@alsa-project.org, kailang@realtek.com,
 tanureal@opensource.cirrus.com, jeremy.szu@canonical.com,
 linux-kernel@vger.kernel.org, wse@tuxedocomputers.com,
 huangwenhui <huangwenhuia@uniontech.com>, hui.wang@canonical.com,
 sami@loone.fi, cam@neo-zeon.de
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

Added the support of new Huawei codec HW8326.

Signed-off-by: huangwenhui <huangwenhuia@uniontech.com>
---
 sound/hda/hdac_device.c       |  1 +
 sound/pci/hda/patch_realtek.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 3e9e9ac804f6..775474f00141 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -651,6 +651,7 @@ static const struct hda_vendor_id hda_vendor_ids[] = {
 	{ 0x1095, "Silicon Image" },
 	{ 0x10de, "Nvidia" },
 	{ 0x10ec, "Realtek" },
+	{ 0x19e5, "Huawei" },
 	{ 0x1102, "Creative" },
 	{ 0x1106, "VIA" },
 	{ 0x111d, "IDT" },
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f3ad454b3fbf..0f32c0d17a3f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -443,6 +443,7 @@ static void alc_fill_eapd_coef(struct hda_codec *codec)
 	case 0x10ec0245:
 	case 0x10ec0255:
 	case 0x10ec0256:
+	case 0x19e58326:
 	case 0x10ec0257:
 	case 0x10ec0282:
 	case 0x10ec0283:
@@ -580,6 +581,7 @@ static void alc_shutup_pins(struct hda_codec *codec)
 	switch (codec->core.vendor_id) {
 	case 0x10ec0236:
 	case 0x10ec0256:
+	case 0x19e58326:
 	case 0x10ec0283:
 	case 0x10ec0286:
 	case 0x10ec0288:
@@ -3247,6 +3249,7 @@ static void alc_disable_headset_jack_key(struct hda_codec *codec)
 	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
+	case 0x19e58326:
 		alc_write_coef_idx(codec, 0x48, 0x0);
 		alc_update_coef_idx(codec, 0x49, 0x0045, 0x0);
 		break;
@@ -3275,6 +3278,7 @@ static void alc_enable_headset_jack_key(struct hda_codec *codec)
 	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
+	case 0x19e58326:
 		alc_write_coef_idx(codec, 0x48, 0xd011);
 		alc_update_coef_idx(codec, 0x49, 0x007f, 0x0045);
 		break;
@@ -4910,6 +4914,7 @@ static void alc_headset_mode_unplugged(struct hda_codec *codec)
 	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
+	case 0x19e58326:
 		alc_process_coef_fw(codec, coef0256);
 		break;
 	case 0x10ec0234:
@@ -5025,6 +5030,7 @@ static void alc_headset_mode_mic_in(struct hda_codec *codec, hda_nid_t hp_pin,
 	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
+	case 0x19e58326:
 		alc_write_coef_idx(codec, 0x45, 0xc489);
 		snd_hda_set_pin_ctl_cache(codec, hp_pin, 0);
 		alc_process_coef_fw(codec, coef0256);
@@ -5175,6 +5181,7 @@ static void alc_headset_mode_default(struct hda_codec *codec)
 	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
+	case 0x19e58326:
 		alc_write_coef_idx(codec, 0x1b, 0x0e4b);
 		alc_write_coef_idx(codec, 0x45, 0xc089);
 		msleep(50);
@@ -5274,6 +5281,7 @@ static void alc_headset_mode_ctia(struct hda_codec *codec)
 	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
+	case 0x19e58326:
 		alc_process_coef_fw(codec, coef0256);
 		break;
 	case 0x10ec0234:
@@ -5388,6 +5396,7 @@ static void alc_headset_mode_omtp(struct hda_codec *codec)
 	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
+	case 0x19e58326:
 		alc_process_coef_fw(codec, coef0256);
 		break;
 	case 0x10ec0234:
@@ -5489,6 +5498,7 @@ static void alc_determine_headset_type(struct hda_codec *codec)
 	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
+	case 0x19e58326:
 		alc_write_coef_idx(codec, 0x1b, 0x0e4b);
 		alc_write_coef_idx(codec, 0x06, 0x6104);
 		alc_write_coefex_idx(codec, 0x57, 0x3, 0x09a3);
@@ -5783,6 +5793,7 @@ static void alc255_set_default_jack_type(struct hda_codec *codec)
 	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
+	case 0x19e58326:
 		alc_process_coef_fw(codec, alc256fw);
 		break;
 	}
@@ -6385,6 +6396,7 @@ static void alc_combo_jack_hp_jd_restart(struct hda_codec *codec)
 	case 0x10ec0236:
 	case 0x10ec0255:
 	case 0x10ec0256:
+	case 0x19e58326:
 		alc_update_coef_idx(codec, 0x1b, 0x8000, 1 << 15); /* Reset HP JD */
 		alc_update_coef_idx(codec, 0x1b, 0x8000, 0 << 15);
 		break;
@@ -10095,6 +10107,7 @@ static int patch_alc269(struct hda_codec *codec)
 	case 0x10ec0230:
 	case 0x10ec0236:
 	case 0x10ec0256:
+	case 0x19e58326:
 		spec->codec_variant = ALC269_TYPE_ALC256;
 		spec->shutup = alc256_shutup;
 		spec->init_hook = alc256_init;
@@ -11479,6 +11492,7 @@ static const struct hda_device_id snd_hda_id_realtek[] = {
 	HDA_CODEC_ENTRY(0x10ec0236, "ALC236", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0245, "ALC245", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0255, "ALC255", patch_alc269),
+	HDA_CODEC_ENTRY(0x19e58326, "HW8326", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0256, "ALC256", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0257, "ALC257", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0260, "ALC260", patch_alc260),
-- 
2.20.1



