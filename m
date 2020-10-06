Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 778EF2862BF
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 17:57:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E57C416DD;
	Wed,  7 Oct 2020 17:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E57C416DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602086239;
	bh=98rFKXMPiqC15og4YIXkljwFjSEyr2DDiNvqAxS67Q0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kJZCqAgNm40LWRsa6j61XVdYeZYSXmzW7fy2uyBK8fTrybCh2WXU7iBlXbEr+XTpd
	 bLpX7id8pLFabtgen7Rzj1jjp0rCKJH1/F2JiSLRuL6ZAL0piTx7xUNuOfp0pel6t9
	 DXGiiRtxUBB4tiLsDVw+Yql5F23PQXrFrALoeuiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4A62F8025A;
	Wed,  7 Oct 2020 17:54:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1931F8012A; Tue,  6 Oct 2020 09:56:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 241FCF80128
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 09:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 241FCF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos-org.20150623.gappssmtp.com
 header.i=@endlessos-org.20150623.gappssmtp.com header.b="bgGP3X3d"
Received: by mail-pg1-x542.google.com with SMTP id o25so7553903pgm.0
 for <alsa-devel@alsa-project.org>; Tue, 06 Oct 2020 00:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t5k1TjFGfKLHv3RvX/XEqm6WMW98Ka1st8yEK6IBJ2w=;
 b=bgGP3X3dHLY2qGFBCDETgUuZnETOhBrm5SSdHeWbTTxBk/0woDrgJHT2uz6IknHzoF
 xLKHawWZGhi/41XIYsdchOctVgDI3fK7TRqBCZwtNAy/QS3ScWLiAZm9GdUq4I4Qmz+k
 6QOrlFQhgFAwOvPBHIjWUt8ozTG/9rJfVrPbaE17OLc+u2s7W+eADPxPp0L7JdYE0p5b
 yBIeoSBtbs8B1Fkelb8lykJir4bBNcQNomZ2Er3wbL+4w3SnayfGn3VMGO7qdowtiBqi
 gu42n6MqDCdfrvCXlhuPGqJoTrQz21ecrqm1Z8TQx6kUBlykRRv2u5KJ+d2SJK8cJiKV
 htEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t5k1TjFGfKLHv3RvX/XEqm6WMW98Ka1st8yEK6IBJ2w=;
 b=oG+QrLdR+nJX5418rHy7jDWysmMVaVAqn/Di+ty3S1MTbhav9GDmA7bntfY6zMYcWH
 y940SxVL6NarSqmeHJqCCypuaz0RSGTWUWkmSlSTpwQJIB8eSvIhvLH6L1sZ/4YX65iH
 4XZXXtL67prH2k+LoIX1oNoKycczhHFJnByTK3F2pbi+So1Ij0kdjESTxze7CHNSj4Ma
 k7nwP8AYYQLyQ+4Apc8a4V2ieNU3fIb1LyWP8ktf6r9E3xMWK0Vh/86ZY+A0qnGWzfGG
 zys4Uj5ZssEjViZjfk9G6/D6PI646EU/ihxODtpyBPUIEReeBbWwquuhm2xhXfDeIDGY
 36yw==
X-Gm-Message-State: AOAM530pqalFUmKpOPt9QB0XNNSAz1qmiw4NtGSO866auA2hDlRR0yoM
 trLZT+MOvlqEV59Q5sFV4Ai/3g==
X-Google-Smtp-Source: ABdhPJwtHzUm2cAS9e4kkuQt6lVyfV8Hv9Sh5DvNjZO+3EmmvkTTAL2WCvuFcrnFCISreK4hCjW0Jg==
X-Received: by 2002:aa7:8e9c:0:b029:152:8a25:548d with SMTP id
 a28-20020aa78e9c0000b02901528a25548dmr3655973pfr.73.1601970973435; 
 Tue, 06 Oct 2020 00:56:13 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id n2sm1875377pja.41.2020.10.06.00.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 00:56:12 -0700 (PDT)
From: Jian-Hong Pan <jhp@endlessos.org>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda/realtek: Enable audio jacks of ASUS D700SA with
 ALC887
Date: Tue,  6 Oct 2020 15:53:35 +0800
Message-Id: <20201006075334.92933-1-jhp@endlessos.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 07 Oct 2020 17:54:46 +0200
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 linux@endlessm.com, linux-kernel@vger.kernel.org,
 Jian-Hong Pan <jhp@endlessos.org>
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

The ASUS D700SA desktop's audio (1043:2390) with ALC887 cannot detect
the headset microphone and another headphone jack until
ALC887_FIXUP_ASUS_HMIC and ALC887_FIXUP_ASUS_AUDIO quirks are applied.
The NID 0x15 maps as the headset microphone and NID 0x19 maps as another
headphone jack. Also need the function like alc887_fixup_asus_jack to
enable the audio jacks.

Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
Signed-off-by: Kailang Yang <kailang@realtek.com>
---
 sound/pci/hda/patch_realtek.c | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d4f17b465892..8d0928bdc9ff 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -1929,6 +1929,8 @@ enum {
 	ALC1220_FIXUP_CLEVO_P950,
 	ALC1220_FIXUP_CLEVO_PB51ED,
 	ALC1220_FIXUP_CLEVO_PB51ED_PINS,
+	ALC887_FIXUP_ASUS_AUDIO,
+	ALC887_FIXUP_ASUS_HMIC,
 };
 
 static void alc889_fixup_coef(struct hda_codec *codec,
@@ -2141,6 +2143,30 @@ static void alc1220_fixup_clevo_pb51ed(struct hda_codec *codec,
 	alc_fixup_headset_mode_no_hp_mic(codec, fix, action);
 }
 
+static void alc887_asus_hp_automute_hook(struct hda_codec *codec,
+					 struct hda_jack_callback *jack)
+{
+	struct alc_spec *spec = codec->spec;
+	int vref;
+
+	snd_hda_gen_hp_automute(codec, jack);
+
+	vref = spec->gen.hp_jack_present ? 0xc4 : 0xc0;
+	snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL,
+			    vref);
+}
+
+static void alc887_fixup_asus_jack(struct hda_codec *codec,
+				     const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+	if (action != HDA_FIXUP_ACT_PROBE)
+		return;
+	snd_hda_codec_write(codec, 0x1b, 0, AC_VERB_SET_PIN_WIDGET_CONTROL,
+			    0xc0);
+	spec->gen.hp_automute_hook = alc887_asus_hp_automute_hook;
+}
+
 static const struct hda_fixup alc882_fixups[] = {
 	[ALC882_FIXUP_ABIT_AW9D_MAX] = {
 		.type = HDA_FIXUP_PINS,
@@ -2398,6 +2424,20 @@ static const struct hda_fixup alc882_fixups[] = {
 		.chained = true,
 		.chain_id = ALC1220_FIXUP_CLEVO_PB51ED,
 	},
+	[ALC887_FIXUP_ASUS_AUDIO] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x15, 0x02a14150 }, /* use as headset mic, without its own jack detect */
+			{ 0x19, 0x22219420 },
+			{}
+		},
+	},
+	[ALC887_FIXUP_ASUS_HMIC] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc887_fixup_asus_jack,
+		.chained = true,
+		.chain_id = ALC887_FIXUP_ASUS_AUDIO,
+	},
 };
 
 static const struct snd_pci_quirk alc882_fixup_tbl[] = {
@@ -2431,6 +2471,7 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x13c2, "Asus A7M", ALC882_FIXUP_EAPD),
 	SND_PCI_QUIRK(0x1043, 0x1873, "ASUS W90V", ALC882_FIXUP_ASUS_W90V),
 	SND_PCI_QUIRK(0x1043, 0x1971, "Asus W2JC", ALC882_FIXUP_ASUS_W2JC),
+	SND_PCI_QUIRK(0x1043, 0x2390, "Asus D700SA", ALC887_FIXUP_ASUS_HMIC),
 	SND_PCI_QUIRK(0x1043, 0x835f, "Asus Eee 1601", ALC888_FIXUP_EEE1601),
 	SND_PCI_QUIRK(0x1043, 0x84bc, "ASUS ET2700", ALC887_FIXUP_ASUS_BASS),
 	SND_PCI_QUIRK(0x1043, 0x8691, "ASUS ROG Ranger VIII", ALC882_FIXUP_GPIO3),
-- 
2.28.0

