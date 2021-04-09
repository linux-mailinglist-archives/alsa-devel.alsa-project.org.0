Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F82A3591DD
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 04:09:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE2EC1616;
	Fri,  9 Apr 2021 04:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE2EC1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617934185;
	bh=RZjD1mKHBKNr1GKpkZqJkwdfEXTu9CrK+9/M6f7bOG0=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O1YEZn9pZ815X1A4bLwm9g2jKzamI3zf7lXzAvXfpYRAr2CdZjmDiHtvxeD/6gfex
	 fSWR9B+wb1qXc5reMV5Px0trZ07032RljbvyUdGiTJlKeIB8B7uv+ynjNX5uZeEYJ7
	 O0HPOs4orSg5vN6Ok8sfX3lKpI1bFqU4IG9N20xM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00818F80168;
	Fri,  9 Apr 2021 04:08:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6F2AF8016A; Fri,  9 Apr 2021 04:08:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 063E3F80162
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 04:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 063E3F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=philcalvin.com header.i=phil@philcalvin.com
 header.b="bG1cshJd"
ARC-Seal: i=1; a=rsa-sha256; t=1617934084; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FD8oAcDQuSsKwP6yGz9cqqNZQ1dbqM53VQXNXvv7NQsufMSS48Yl1SKCgJPh/nunG0Pgejez7/11uMEKimx5Iz4O8TnB1OUNUlbnikSgywbptIYBcaFaIStd+G4azHlybUC9E/mikYBMzx6Sc42U7IlIKSdnsyMZjbfWsRFYcEk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1617934084;
 h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=VOHz1bXrqnZD8iz7sj42tkZfxnwZqzPsifTpP4zbUWM=; 
 b=cCoWnmxNibU9k5r/cxSGXl7eF8zqpXAd5CZJuWfhg681M0tyhOehyPO37OUgj7LDNmmGc0WKF7ly9Ox7YHQ2dYjQcr+iDKq/N/kgVo1jPMySfyVeXMIgD88ycT280ZBdpkKUCA4LXt7HvlCD92nHa/QQX3ymFw+YOsq5kWh4Hz0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=philcalvin.com;
 spf=pass  smtp.mailfrom=phil@philcalvin.com;
 dmarc=pass header.from=<phil@philcalvin.com> header.from=<phil@philcalvin.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1617934084; 
 s=default; d=philcalvin.com; i=phil@philcalvin.com;
 h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=VOHz1bXrqnZD8iz7sj42tkZfxnwZqzPsifTpP4zbUWM=;
 b=bG1cshJdWHgohcfTFN+rfKXxW3wZ1qo1T99/J+MimSrwZbg10xq0pl7khTczulBh
 pxlHGRrZMLSNu7JmAwynk2AgEt2AlT6aWLky1sxs4+y7CHNdRAf0m+ITXiznTlFXFZ2
 Ro7cFUdjjtsmRxAcaugWUXzAkBhtuzGeqCr5YrEc=
Received: from [192.168.1.11] (pool-100-33-69-201.nycmny.fios.verizon.net
 [100.33.69.201]) by mx.zohomail.com
 with SMTPS id 1617934075446291.0914746576934;
 Thu, 8 Apr 2021 19:07:55 -0700 (PDT)
From: Phil Calvin <phil@philcalvin.com>
Subject: [PATCH] ALSA: hda/realtek: fix mic boost on Intel NUC 8
To: alsa-devel@alsa-project.org
Message-ID: <4eb65c6c-271c-7660-e7bf-b5608b7d56d7@philcalvin.com>
Date: Thu, 8 Apr 2021 22:07:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

Just wanted to say thank you to everybody that helps maintain the
Intel HDA subsystem. My first Linux sound experience was running
`modprobe cs46xx` or so on a SuSE installation and hearing a promising
noise from the speakers, and these days it seems audio works out of
the box on most hardware.

Thanks also to Takashi Iwai for `hda-emu`, which saved me a lot of
rebooting while testing.

I have tested the patch on this hardware both by recompiling the
relevant modules and running them with the 5.10 kernel distributed in
Debian `testing`, and atop the 5.12-rc6 kernel built with `make
deb-pkg`.

I could not decipher the ordering of the fixup tables, so I am of
course happy to move these around to fit the organizational scheme as
needed.

I'm not an EE, but I am inclined to think the upper two boost values
can probably be made to work by some kind of software workaround,
given that they do produce analog noise coming from something. If you
have any hunches about a possible workaround based on experience with
other similar codecs, please point me to those fixups on- or off-list
and I can try them out on my hardware.

Phil

>8------------------------------------------------------8<

Fix two bugs with the Intel HDA Realtek ALC233 sound codec
present in Intel NUC NUC8i7BEH and probably a few other similar
NUC models.

These codecs advertise a 4-level microphone input boost amplifier on
pin 0x19, but the highest two boost settings do not work correctly,
and produce only low analog noise that does not seem to contain any
discernible signal. There is an existing fixup for this exact problem
but for a different PCI subsystem ID, so we re-use that logic.

Changing the boost level also triggers a DC spike in the input signal
that bleeds off over about a second and overwhelms any input during
that time. Thankfully, the existing fixup has the side effect of
making the boost control show up in userspace as a mute/unmute switch,
and this keeps (e.g.) PulseAudio from fiddling with it during normal
input volume adjustments.

Finally, the NUC hardware has built-in inverted stereo mics. This
patch also enables the usual fixup for this so the two channels cancel
noise instead of the actual signal.

Signed-off-by: Phil Calvin <phil@philcalvin.com>
---
  sound/pci/hda/patch_realtek.c | 13 +++++++++++++
  1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 58946d069ee5..e1fd4c81965a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6405,6 +6405,8 @@ enum {
  	ALC269_FIXUP_LEMOTE_A1802,
  	ALC269_FIXUP_LEMOTE_A190X,
  	ALC256_FIXUP_INTEL_NUC8_RUGGED,
+	ALC233_FIXUP_INTEL_NUC8_DMIC,
+	ALC233_FIXUP_INTEL_NUC8_BOOST,
  	ALC256_FIXUP_INTEL_NUC10,
  	ALC255_FIXUP_XIAOMI_HEADSET_MIC,
  	ALC274_FIXUP_HP_MIC,
@@ -7122,6 +7124,16 @@ static const struct hda_fixup alc269_fixups[] = {
  		.type = HDA_FIXUP_FUNC,
  		.v.func = alc233_fixup_lenovo_line2_mic_hotkey,
  	},
+	[ALC233_FIXUP_INTEL_NUC8_DMIC] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_inv_dmic,
+		.chained = true,
+		.chain_id = ALC233_FIXUP_INTEL_NUC8_BOOST,
+	},
+	[ALC233_FIXUP_INTEL_NUC8_BOOST] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc269_fixup_limit_int_mic_boost
+	},
  	[ALC255_FIXUP_DELL_SPK_NOISE] = {
  		.type = HDA_FIXUP_FUNC,
  		.v.func = alc_fixup_disable_aamix,
@@ -8265,6 +8277,7 @@ static const struct snd_pci_quirk 
alc269_fixup_tbl[] = {
  	SND_PCI_QUIRK(0x1c06, 0x2013, "Lemote A1802", ALC269_FIXUP_LEMOTE_A1802),
  	SND_PCI_QUIRK(0x1c06, 0x2015, "Lemote A190X", ALC269_FIXUP_LEMOTE_A190X),
  	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", 
ALC256_FIXUP_INTEL_NUC8_RUGGED),
+	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", 
ALC233_FIXUP_INTEL_NUC8_DMIC),
  	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
   #if 0
-- 
2.30.2

