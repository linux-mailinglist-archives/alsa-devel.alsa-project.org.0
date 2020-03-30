Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D881980B2
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 18:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65FDC1677;
	Mon, 30 Mar 2020 18:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65FDC1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585584876;
	bh=UVgjcljnVgAJsNx80U016iVtFKCtjiqyGJFPH3zDRHk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=csPGuarctKjxbWmNMt4zy27IUY0MJ49E3oAciak3w47ZeQBbL0ea94LcjZGUhrHpt
	 NVdBtwcgggStZISN1bKkv4ME5gs8O/cuizOyc4G7D0STDqDYtu1KLb5rWBtvuK8pA9
	 oFewDI5g6LS/8UuYmlmQZ24HGbN1UM4yMrpfZC0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D42B7F80290;
	Mon, 30 Mar 2020 18:11:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38426F8014A; Mon, 30 Mar 2020 18:10:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 437B8F80148
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 18:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 437B8F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EwpufE1f"
Received: by mail-qt1-x843.google.com with SMTP id z12so15530922qtq.5
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 09:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ub7ScHk+nLkXNGoDRW/6X3tib9hB0debFlDw1vCHvmE=;
 b=EwpufE1fsdpxxandyYt2l2BTwK6xYzstuZPrCh47XzSEk1ngPWDprS+QOa8luHUAdF
 D5FO58SPvO/42H30j2T35ruUb7aPjLgla8hlbEhtird8DVW3oyng8wngWIiAPleyWozR
 HIHiUNgAjQeQbRNf6Ige9clVmrR5B+AOD77i+U1cqAX5jEuuRzb0CHXRLtRV+xlyTo6E
 7km4ejo9g6RyLyCyrbUlqwueEgpl0zncRSHEf1MCXFiWBVVIK6djIrlwchEcw9RhIpaY
 NW6yaFgtu6ZKN6+/mOc9M2RDtPfMiGbXrPs83ZC0nCRRT/tdHGOuXAA8UKhzYDgFVdZD
 gU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ub7ScHk+nLkXNGoDRW/6X3tib9hB0debFlDw1vCHvmE=;
 b=p7X0Ed1u9HG7YniCMENiOsk2VUT6rPEEKhgqjbXgMWLjNtHFhEPD0/hpB7TzmqXtcj
 j7lJUgvjpj96Ou47ayTJbfBIp2tCAVmcz7HncXD9uwOsPFIiAP6J52AoYGlDLpAT2MAU
 0wLuNpjeHyXad38vAA8NexeutRycpnDZF+gUN/xJJswTKpBy9iqQMyCYJt8xNBiAnnVS
 /BaSSURBb5jZCfmJLyYnHPk0UIOGWw1HiRKfSN0DlWDTtV7Tkpj/Ny93iTNM7QhDS6jh
 Oo5rAk98ZMxZ1RHj8jLdYWjTwODHJQm2y+q/uSANEkkPQOWKJ+HGu31c0OQqjh8EJWLk
 35pw==
X-Gm-Message-State: ANhLgQ0q8+VEW+fmqNY0jRbKq0CE3qy7EYfw6UJNyB3TN2KlPVQdfpSg
 O98Ytw9hJ6n17Qxm2dPcUWWYx4amGiVMcg==
X-Google-Smtp-Source: ADFU+vsnkleV9IONCVxp6Oji0VctEpP9HCHyDUEUd/AphKLBAkzsLHCpJlaZBr7cZe5HRIUc9FRIgw==
X-Received: by 2002:aed:38ea:: with SMTP id k97mr743011qte.66.1585584596357;
 Mon, 30 Mar 2020 09:09:56 -0700 (PDT)
Received: from stingray.lan (pool-173-76-255-234.bstnma.fios.verizon.net.
 [173.76.255.234])
 by smtp.gmail.com with ESMTPSA id z18sm11789091qtz.77.2020.03.30.09.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 09:09:55 -0700 (PDT)
From: Thomas Hebb <tommyhebb@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/3] ALSA: hda/realtek - Remove now-unnecessary XPS 13
 headphone noise fixups
Date: Mon, 30 Mar 2020 12:09:39 -0400
Message-Id: <b649a00edfde150cf6eebbb4390e15e0c2deb39a.1585584498.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1585584498.git.tommyhebb@gmail.com>
References: <cover.1585584498.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Kailang Yang <kailang@realtek.com>, Tomas Espeleta <tomas.espeleta@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Sergey Bostandzhyan <jin@mediatomb.cc>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 Thomas Hebb <tommyhebb@gmail.com>, Jian-Hong Pan <jian-hong@endlessm.com>,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
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

patch_realtek.c has historically failed to properly configure the PC
Beep Hidden Register for the ALC256 codec (among others). Depending on
your kernel version, symptoms of this misconfiguration can range from
chassis noise, picked up by a poorly-shielded PCBEEP trace, getting
amplified and played on your internal speaker and/or headphones to loud
feedback, which responds to the "Headphone Mic Boost" ALSA control,
getting played through your headphones. For details of the problem, see
the patch in this series titled "ALSA: hda/realtek - Set principled PC
Beep configuration for ALC256", which fixes the configuration.

These symptoms have been most noticed on the Dell XPS 13 9350 and 9360,
popular laptops that use the ALC256. As a result, several model-specific
fixups have been introduced to try and fix the problem, the most
egregious of which locks the "Headphone Mic Boost" control as a hack to
minimize noise from a feedback loop that shouldn't have been there in
the first place.

Now that the underlying issue has been fixed, remove all these fixups.
Remaining fixups needed by the XPS 13 are all picked up by existing pin
quirks.

This change should, for the XPS 13 9350/9360

 - Significantly increase volume and audio quality on headphones
 - Eliminate headphone popping on suspend/resume
 - Allow "Headphone Mic Boost" to be set again, making the headphone
   jack fully usable as a microphone jack too.

Fixes: 8c69729b4439 ("ALSA: hda - Fix headphone noise after Dell XPS 13 resume back from S3")
Fixes: 423cd785619a ("ALSA: hda - Fix headphone noise on Dell XPS 13 9360")
Fixes: e4c9fd10eb21 ("ALSA: hda - Apply headphone noise quirk for another Dell XPS 13 variant")
Fixes: 1099f48457d0 ("ALSA: hda/realtek: Reduce the Headphone static noise on XPS 9350/9360")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---

Changes in v2: None

 Documentation/sound/hd-audio/models.rst |  2 --
 sound/pci/hda/patch_realtek.c           | 34 -------------------------
 2 files changed, 36 deletions(-)

diff --git a/Documentation/sound/hd-audio/models.rst b/Documentation/sound/hd-audio/models.rst
index 11298f0ce44d..0ea967d34583 100644
--- a/Documentation/sound/hd-audio/models.rst
+++ b/Documentation/sound/hd-audio/models.rst
@@ -216,8 +216,6 @@ alc298-dell-aio
     ALC298 fixups on Dell AIO machines
 alc275-dell-xps
     ALC275 fixups on Dell XPS models
-alc256-dell-xps13
-    ALC256 fixups on Dell XPS13
 lenovo-spk-noise
     Workaround for speaker noise on Lenovo machines
 lenovo-hotkey
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 9efb0a858c64..38511f3fccfd 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5378,17 +5378,6 @@ static void alc271_hp_gate_mic_jack(struct hda_codec *codec,
 	}
 }
 
-static void alc256_fixup_dell_xps_13_headphone_noise2(struct hda_codec *codec,
-						      const struct hda_fixup *fix,
-						      int action)
-{
-	if (action != HDA_FIXUP_ACT_PRE_PROBE)
-		return;
-
-	snd_hda_codec_amp_stereo(codec, 0x1a, HDA_INPUT, 0, HDA_AMP_VOLMASK, 1);
-	snd_hda_override_wcaps(codec, 0x1a, get_wcaps(codec, 0x1a) & ~AC_WCAP_IN_AMP);
-}
-
 static void alc269_fixup_limit_int_mic_boost(struct hda_codec *codec,
 					     const struct hda_fixup *fix,
 					     int action)
@@ -5866,8 +5855,6 @@ enum {
 	ALC298_FIXUP_DELL1_MIC_NO_PRESENCE,
 	ALC298_FIXUP_DELL_AIO_MIC_NO_PRESENCE,
 	ALC275_FIXUP_DELL_XPS,
-	ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE,
-	ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE2,
 	ALC293_FIXUP_LENOVO_SPK_NOISE,
 	ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY,
 	ALC255_FIXUP_DELL_SPK_NOISE,
@@ -6607,23 +6594,6 @@ static const struct hda_fixup alc269_fixups[] = {
 			{}
 		}
 	},
-	[ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE] = {
-		.type = HDA_FIXUP_VERBS,
-		.v.verbs = (const struct hda_verb[]) {
-			/* Disable pass-through path for FRONT 14h */
-			{0x20, AC_VERB_SET_COEF_INDEX, 0x36},
-			{0x20, AC_VERB_SET_PROC_COEF, 0x1737},
-			{}
-		},
-		.chained = true,
-		.chain_id = ALC255_FIXUP_DELL1_MIC_NO_PRESENCE
-	},
-	[ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE2] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = alc256_fixup_dell_xps_13_headphone_noise2,
-		.chained = true,
-		.chain_id = ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE
-	},
 	[ALC293_FIXUP_LENOVO_SPK_NOISE] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_disable_aamix,
@@ -7117,17 +7087,14 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x06de, "Dell", ALC293_FIXUP_DISABLE_AAMIX_MULTIJACK),
 	SND_PCI_QUIRK(0x1028, 0x06df, "Dell", ALC293_FIXUP_DISABLE_AAMIX_MULTIJACK),
 	SND_PCI_QUIRK(0x1028, 0x06e0, "Dell", ALC293_FIXUP_DISABLE_AAMIX_MULTIJACK),
-	SND_PCI_QUIRK(0x1028, 0x0704, "Dell XPS 13 9350", ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE2),
 	SND_PCI_QUIRK(0x1028, 0x0706, "Dell Inspiron 7559", ALC256_FIXUP_DELL_INSPIRON_7559_SUBWOOFER),
 	SND_PCI_QUIRK(0x1028, 0x0725, "Dell Inspiron 3162", ALC255_FIXUP_DELL_SPK_NOISE),
 	SND_PCI_QUIRK(0x1028, 0x0738, "Dell Precision 5820", ALC269_FIXUP_NO_SHUTUP),
-	SND_PCI_QUIRK(0x1028, 0x075b, "Dell XPS 13 9360", ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE2),
 	SND_PCI_QUIRK(0x1028, 0x075c, "Dell XPS 27 7760", ALC298_FIXUP_SPK_VOLUME),
 	SND_PCI_QUIRK(0x1028, 0x075d, "Dell AIO", ALC298_FIXUP_SPK_VOLUME),
 	SND_PCI_QUIRK(0x1028, 0x07b0, "Dell Precision 7520", ALC295_FIXUP_DISABLE_DAC3),
 	SND_PCI_QUIRK(0x1028, 0x0798, "Dell Inspiron 17 7000 Gaming", ALC256_FIXUP_DELL_INSPIRON_7559_SUBWOOFER),
 	SND_PCI_QUIRK(0x1028, 0x080c, "Dell WYSE", ALC225_FIXUP_DELL_WYSE_MIC_NO_PRESENCE),
-	SND_PCI_QUIRK(0x1028, 0x082a, "Dell XPS 13 9360", ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE2),
 	SND_PCI_QUIRK(0x1028, 0x084b, "Dell", ALC274_FIXUP_DELL_AIO_LINEOUT_VERB),
 	SND_PCI_QUIRK(0x1028, 0x084e, "Dell", ALC274_FIXUP_DELL_AIO_LINEOUT_VERB),
 	SND_PCI_QUIRK(0x1028, 0x0871, "Dell Precision 3630", ALC255_FIXUP_DELL_HEADSET_MIC),
@@ -7480,7 +7447,6 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC298_FIXUP_DELL1_MIC_NO_PRESENCE, .name = "alc298-dell1"},
 	{.id = ALC298_FIXUP_DELL_AIO_MIC_NO_PRESENCE, .name = "alc298-dell-aio"},
 	{.id = ALC275_FIXUP_DELL_XPS, .name = "alc275-dell-xps"},
-	{.id = ALC256_FIXUP_DELL_XPS_13_HEADPHONE_NOISE, .name = "alc256-dell-xps13"},
 	{.id = ALC293_FIXUP_LENOVO_SPK_NOISE, .name = "lenovo-spk-noise"},
 	{.id = ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY, .name = "lenovo-hotkey"},
 	{.id = ALC255_FIXUP_DELL_SPK_NOISE, .name = "dell-spk-noise"},
-- 
2.25.2

