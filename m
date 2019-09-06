Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9235EAB4FE
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 11:35:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A5BC1607;
	Fri,  6 Sep 2019 11:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A5BC1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567762537;
	bh=71uGPohtMlmef13p2NRg1VH9V8gcixEjcVabiBxrVO8=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cV/UiJc8CGrj2vg2A1e7EIwLGu9FDdIU0thr8oVVqQ+Ey+vGkv5hTOHIG52FkORB+
	 vUL+S5cjTjyBarbU8ziCkdJP3KByu/wEY81v5kJs4A+ukuZWCsXnyXg5jKbw9RUrPl
	 YQ5CDhlb5xv8Mx/pVox5OB0WLql6uoIryN/W8JpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49B61F803D6;
	Fri,  6 Sep 2019 11:33:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2831BF80394; Fri,  6 Sep 2019 11:33:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_PASS, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.xn--80adja5bqm.su (xn--80adja5bqm.su [45.62.210.217])
 by alsa1.perex.cz (Postfix) with ESMTP id 5AD02F80214
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 11:33:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AD02F80214
Received: by mail1.xn--80adja5bqm.su (Postfix, from userid 1000)
 id 91FD82185604; Fri,  6 Sep 2019 11:33:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail1.xn--80adja5bqm.su 91FD82185604
Date: Fri, 6 Sep 2019 11:33:43 +0200
From: Sergey Bostandzhyan <jin@mediatomb.cc>
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <20190906093343.GA7640@xn--80adja5bqm.su>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5ha7bipysk.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] Add Acer Aspire Ethos 8951G model quirk
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This notebook has 6 built in speakers for 5.1 surround support, however
only two got autodetected and have also not been assigned correctly.

This patch enables all speakers and also fixes muting when headphones are
plugged in.

The speaker layout is as follows:

pin 0x15 Front Left / Front Right
pin 0x18 Front Center / Subwoofer
pin 0x1b Rear Left / Rear Right (Surround)

The quirk will be enabled automatically on this hardware, but can also be
activated manually via the model=aspire-ethos module parameter.

Caveat: pin 0x1b is shared between headphones jack and surround speakers.
When headphones are plugged in, the surround speakers get muted
automatically by the hardware, however all other speakers remain
unmuted. Currently it's not possible to make use of the generic automute
function in the driver, because such shared pins are not supported.

If we would change the pin settings to identify the pin as headphones,
the surround channel and thus the ability to select 5.1 profiles would
get lost.

This quirk solves the above problem by monitoring jack state of 0x1b and
by connecting/disconnecting all remaining speaker pins when something
gets plugged in or unplugged from the headphones jack port.

Signed-off-by: Sergey Bostandzhyan <jin@mediatomb.cc>
---
 sound/pci/hda/patch_realtek.c | 71 +++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e333b3e30e31..5135e13da284 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8251,6 +8251,45 @@ static void alc662_fixup_usi_headset_mic(struct hda_codec *codec,
 	}
 }
 
+static void alc662_aspire_ethos_mute_speakers(struct hda_codec *codec,
+					struct hda_jack_callback *cb)
+{
+	/* surround speakers at 0x1b already get muted automatically when
+	 * headphones are plugged in, but we have to mute/unmute the remaining
+	 * channels manually:
+	 * 0x15 - front left/front right
+	 * 0x18 - front center/ LFE
+	 */
+	if (snd_hda_jack_detect_state(codec, 0x1b) == HDA_JACK_PRESENT) {
+		snd_hda_set_pin_ctl_cache(codec, 0x15, 0);
+		snd_hda_set_pin_ctl_cache(codec, 0x18, 0);
+	} else {
+		snd_hda_set_pin_ctl_cache(codec, 0x15, PIN_OUT);
+		snd_hda_set_pin_ctl_cache(codec, 0x18, PIN_OUT);
+	}
+}
+
+static void alc662_fixup_aspire_ethos_hp(struct hda_codec *codec,
+					const struct hda_fixup *fix, int action)
+{
+    /* Pin 0x1b: shared headphones jack and surround speakers */
+	if (!is_jack_detectable(codec, 0x1b))
+		return;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		snd_hda_jack_detect_enable_callback(codec, 0x1b,
+				alc662_aspire_ethos_mute_speakers);
+		break;
+	case HDA_FIXUP_ACT_INIT:
+		/* Make sure to start in a correct state, i.e. if
+		 * headphones have been plugged in before powering up the system
+		 */
+		alc662_aspire_ethos_mute_speakers(codec, NULL);
+		break;
+	}
+}
+
 static struct coef_fw alc668_coefs[] = {
 	WRITE_COEF(0x01, 0xbebe), WRITE_COEF(0x02, 0xaaaa), WRITE_COEF(0x03,    0x0),
 	WRITE_COEF(0x04, 0x0180), WRITE_COEF(0x06,    0x0), WRITE_COEF(0x07, 0x0f80),
@@ -8322,6 +8361,9 @@ enum {
 	ALC662_FIXUP_USI_FUNC,
 	ALC662_FIXUP_USI_HEADSET_MODE,
 	ALC662_FIXUP_LENOVO_MULTI_CODECS,
+	ALC669_FIXUP_ACER_ASPIRE_ETHOS,
+	ALC669_FIXUP_ACER_ASPIRE_ETHOS_SUBWOOFER,
+	ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET,
 };
 
 static const struct hda_fixup alc662_fixups[] = {
@@ -8648,6 +8690,33 @@ static const struct hda_fixup alc662_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc233_alc662_fixup_lenovo_dual_codecs,
 	},
+	[ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc662_fixup_aspire_ethos_hp,
+	},
+	[ALC669_FIXUP_ACER_ASPIRE_ETHOS_SUBWOOFER] = {
+		.type = HDA_FIXUP_VERBS,
+        /* subwoofer needs an extra GPIO setting to become audible */
+		.v.verbs = (const struct hda_verb[]) {
+			{0x01, AC_VERB_SET_GPIO_MASK, 0x02},
+			{0x01, AC_VERB_SET_GPIO_DIRECTION, 0x02},
+			{0x01, AC_VERB_SET_GPIO_DATA, 0x00},
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET
+	},
+	[ALC669_FIXUP_ACER_ASPIRE_ETHOS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x15, 0x92130110 }, /* front speakers */
+			{ 0x18, 0x99130111 }, /* center/subwoofer */
+			{ 0x1b, 0x11130012 }, /* surround plus jack for HP */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC669_FIXUP_ACER_ASPIRE_ETHOS_SUBWOOFER
+	},
 };
 
 static const struct snd_pci_quirk alc662_fixup_tbl[] = {
@@ -8693,6 +8762,7 @@ static const struct snd_pci_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x19da, 0xa130, "Zotac Z68", ALC662_FIXUP_ZOTAC_Z68),
 	SND_PCI_QUIRK(0x1b0a, 0x01b8, "ACER Veriton", ALC662_FIXUP_ACER_VERITON),
 	SND_PCI_QUIRK(0x1b35, 0x2206, "CZC P10T", ALC662_FIXUP_CZC_P10T),
+	SND_PCI_QUIRK(0x1025, 0x0566, "Acer Aspire Ethos 8951G", ALC669_FIXUP_ACER_ASPIRE_ETHOS),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
@@ -8786,6 +8856,7 @@ static const struct hda_model_fixup alc662_fixup_models[] = {
 	{.id = ALC892_FIXUP_ASROCK_MOBO, .name = "asrock-mobo"},
 	{.id = ALC662_FIXUP_USI_HEADSET_MODE, .name = "usi-headset"},
 	{.id = ALC662_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
+	{.id = ALC669_FIXUP_ACER_ASPIRE_ETHOS, .name = "aspire-ethos"},
 	{}
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
