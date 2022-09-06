Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D545AFC07
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 07:54:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82E6884A;
	Wed,  7 Sep 2022 07:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82E6884A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662530072;
	bh=uFbiWCS2T/k0QxIipksIggBdJfC0Pxci+zV6jc4nWW4=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PZm6vvDa1Vs4S6++7k44YYqtwNzJQuiGdvPxkFhOP6sH/fBeQOPHVmC32P1AEMxBl
	 xxLyP1uTaCKmys5bPH/Ymj0miBzb5sw+3DGWuCQwr1NvchDfcK3GJInBvMUBOLoKAP
	 eXctTaSEQzyYyzVn90eFiW5vFkbdpbpB0eab7SG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD726F80249;
	Wed,  7 Sep 2022 07:53:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DCC8F80249; Wed,  7 Sep 2022 00:02:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DEAR_SOMETHING,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B10B1F800E9
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 00:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B10B1F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="doePMxb8"
Received: by mail-vs1-xe35.google.com with SMTP id m65so2710379vsc.1
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 15:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=vCEWYWTfeEUzzo2+VTc1nXNx/83Q491Qdm/C53gF4Iw=;
 b=doePMxb8k4UcprV4erYgQvGu4SQAAGDwkfWhogMdez2UAKDK6mmxDiwcLpXbeG3eve
 dXypPPNpNzuXwWWREGGtiOzUyl1BVlJDEx9G2gy/3wzmHl5vrjW8vR63p5gVcmgmWVsW
 IS1jK7YLmj7XKek8PPWoDvgK04IQouXHp569in8eSrzeGzWwv9N6h7LmDZiQoNPsAGVG
 9jCB0jLMTTc/COrYFykD3sq/un5gsEEMu0SLoQmqwmX2sTAt5rB3C7wSgGLtW6I0zD8j
 G4Vsy+yPCm5lLRyyXkewdgc6uEdT7N3V/B5u+1+GunPdyBz003+UF7VFQdPsYIgpFXbh
 uksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=vCEWYWTfeEUzzo2+VTc1nXNx/83Q491Qdm/C53gF4Iw=;
 b=gG/bwlFo0RG4SNFrMpQLXCMQpGmkK6iqB4Tb2eY6s2u8oruG+N4ZJMO9/lRJfySGK6
 x0LWvcZBOZtykHtkoW8GxpsXb5K8PKkP+tLIKlGVv2rA/f2qhZWnWcNW0mSdJv9jMh33
 AZB4lPta0VaaQzXBq3vQm+je4ATX8IznFzsx0eR+clRP78oP7acyOjfB3IjlnXIDOW9k
 hbhBMry9uU8YBW/rWLTXXtNsi+h/zh7y+iRrV7+NiyFWuzdG8Tt1wskFUohlWYsdUFPw
 MY6X57jlCnCTYlhs8KJmg1EWcecpzyDC9rvDXODa80q1veiwVJz+49zXCMJjYRvEWW97
 SAKA==
X-Gm-Message-State: ACgBeo3YW6W4c3GOvdprqpHowqr7AuYEodm0Vr71obwvLMB2RA1Leo4I
 HIfFSn+GCGutBgbH6C6sM+7y8mZXbKZ9ZouM1XE=
X-Google-Smtp-Source: AA6agR7Swx5prKKvaTSv1+khgwFhwVwYziRSRtHKycY2eWBC3fvQN7VHNdcJEhBom3q++mTRJhXegPG9gVHXAb1DT0s=
X-Received: by 2002:a05:6102:e93:b0:390:df1a:ede5 with SMTP id
 l19-20020a0561020e9300b00390df1aede5mr186227vst.47.1662501729207; Tue, 06 Sep
 2022 15:02:09 -0700 (PDT)
MIME-Version: 1.0
From: Miroslav Lakota <lakota.miroslav.ele@gmail.com>
Date: Wed, 7 Sep 2022 00:01:58 +0200
Message-ID: <CAAT=u214xC4iHsK9wgkVAhfo85zg18=tbJJTEKg04XSWUTVHvw@mail.gmail.com>
Subject: Patch for fixing top firing speakers for Dell Inspiron 16 Plus (7620)
 laptop
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 07 Sep 2022 07:53:00 +0200
Cc: alsa-devel@alsa-project.org
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

Dear Sir or Madam,
I would like to submit a kernel patch fixing speakers on the laptop
Dell Inspiron 16 Plus 7620. The patch has been tested for a month with
5.19 and 6.0RC kernels.

The current issue:
- The top firing speakers on the laptop do not work. They are not
detected by the audio driver.

The solution:
- assign correct pins and DACs to the ALC chip

Status after application of the patch:
- Both bottom and top firing speakers work as expected. One small
issue remains - the top firing speakers are enabled with a 0,5s delay.
This is however not very noticeable in real life and the fact that
they work already means a significant improvement.

I am completely new to submiting kernel patches so I apologise
beforehand if I made any mistake in the formal process.

Best regards,
Miroslav Lakota

From 6f91aba8189a0b04fd977d218321e89df7e0673e Mon Sep 17 00:00:00 2001
From: Philipp Jungkamp <p.jungkamp@gmx.net>
Date: Mon, 15 Aug 2022 11:17:21 +0200
Subject: [PATCH] ALSA: patch_realtek: Fix Dell Inspiron Plus 16

---
 sound/pci/hda/patch_realtek.c | 48 +++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index fd630d62b5a0..9b0b4ddcc36d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6854,6 +6854,46 @@ static void
alc287_fixup_yoga9_14iap7_bass_spk_pin(struct hda_codec *codec,
     }
 }

+static void alc295_fixup_dell_inspiron_top_speakers(struct hda_codec *codec,
+                      const struct hda_fixup *fix, int action)
+{
+    /*
+     * The Pin Complex 0x17 for the top speakers is wrongly reported as
+     * unconnected.
+     * The top speakers should also have a sequence number lower than
+     * the bottom speakers on NID 0x14.
+     */
+    static const struct hda_pintbl pincfgs[] = {
+        { 0x14, 0x90170151 },
+        { 0x17, 0x90170150 },
+        { }
+    };
+    /*
+     * Avoid DAC 0x06 and 0x08, as they have no volume controls.
+     * DAC 0x02 and 0x03 would be fine.
+     */
+    static const hda_nid_t conn[] = { 0x02, 0x03 };
+    /*
+     * Prefer both bottom speakers (0x14) and headphones (0x21)
connected to DAC 0x02.
+     * Top speakers (0x21) are connected to DAC 0x03.
+     */
+    static const hda_nid_t preferred_pairs[] = {
+        0x14, 0x02,
+        0x17, 0x03,
+        0x21, 0x02,
+        0
+    };
+    struct alc_spec *spec = codec->spec;
+
+    switch (action) {
+    case HDA_FIXUP_ACT_PRE_PROBE:
+        snd_hda_apply_pincfgs(codec, pincfgs);
+        snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
+        spec->gen.preferred_dacs = preferred_pairs;
+        break;
+    }
+}
+
 enum {
     ALC269_FIXUP_GPIO2,
     ALC269_FIXUP_SONY_VAIO,
@@ -7094,6 +7134,7 @@ enum {
     ALC287_FIXUP_LEGION_16ITHG6,
     ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
     ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN,
+    ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS,
 };

 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9017,6 +9058,12 @@ static const struct hda_fixup alc269_fixups[] = {
         .chained = true,
         .chain_id = ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
     },
+    [ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS] = {
+        .type = HDA_FIXUP_FUNC,
+        .v.func = alc295_fixup_dell_inspiron_top_speakers,
+        .chained = true,
+        .chain_id = ALC269_FIXUP_DELL4_MIC_NO_PRESENCE,
+    },
 };

 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9116,6 +9163,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
     SND_PCI_QUIRK(0x1028, 0x0a9d, "Dell Latitude 5430",
ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
     SND_PCI_QUIRK(0x1028, 0x0a9e, "Dell Latitude 5430",
ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
     SND_PCI_QUIRK(0x1028, 0x0b19, "Dell XPS 15 9520", ALC289_FIXUP_DUAL_SPK),
+    SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620",
ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
     SND_PCI_QUIRK(0x1028, 0x164a, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
     SND_PCI_QUIRK(0x1028, 0x164b, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
     SND_PCI_QUIRK(0x103c, 0x1586, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC2),
--
2.37.2
