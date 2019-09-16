Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3A4B367F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 10:40:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EB391669;
	Mon, 16 Sep 2019 10:39:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EB391669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568623202;
	bh=o8BiSwaMqU7YT1hZ5/YHqfXHIkuzvrlyGnOmop4IgGY=;
	h=To:From:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sCgVol9S5wJ1imLtQ4YTQW/eFwrZ5HvJhqvAgSvyXxIsF+yebBcvkPZOWPC8mc9Q8
	 jcZC2yEQpIAuatFdDUFxGLt9N/gcs477P79pMVE0fh4HzuNjNOGJzM+yrcrjfyi2H+
	 cEGBX+k3pVSoA2MMlkq7kK8KzhyIRwNxkZshstQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EDE6F80148;
	Mon, 16 Sep 2019 10:38:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5B2AF80506; Mon, 16 Sep 2019 10:38:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ironchief.h-da.de (ironchief.h-da.de [141.100.10.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1369AF801DA
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 10:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1369AF801DA
IronPort-SDR: r++LXmCBdiUoh6kGPxcVgfVsmuFYwwDK6IkhVYmFM72gvt1ZEPW4ReGaqV/R0Z+BfZdioQXsxt
 Plu1P/165vaA==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GcAACkSH9d/2soZI1mGgEBAQEBAgE?=
 =?us-ascii?q?BAQEHAgEBAQGBVgIBAQEBCwGCF3BwEiqEIY9TAQEBAQEBBoUily4JAQEBPQE?=
 =?us-ascii?q?BhD+CayM3Bg4CAwkBAQUBAQEBAQUEAgJphGtPhUsBKVYoBAMBAgMCJgJLAQU?=
 =?us-ascii?q?bBgIBAReDB4F3GKoAgTIaAoomgQwoAYt3GHiBB4ERJ4I9hVyCX4JYBI8VhX5?=
 =?us-ascii?q?elnmBRWeUeiGNdQUUA4sIqRsjgVhNJBSDJ5EJPjOQdgEB?=
X-IPAS-Result: =?us-ascii?q?A2GcAACkSH9d/2soZI1mGgEBAQEBAgEBAQEHAgEBAQGBV?=
 =?us-ascii?q?gIBAQEBCwGCF3BwEiqEIY9TAQEBAQEBBoUily4JAQEBPQEBhD+CayM3Bg4CA?=
 =?us-ascii?q?wkBAQUBAQEBAQUEAgJphGtPhUsBKVYoBAMBAgMCJgJLAQUbBgIBAReDB4F3G?=
 =?us-ascii?q?KoAgTIaAoomgQwoAYt3GHiBB4ERJ4I9hVyCX4JYBI8VhX5elnmBRWeUeiGNd?=
 =?us-ascii?q?QUUA4sIqRsjgVhNJBSDJ5EJPjOQdgEB?=
Received: from unknown (HELO mail.fbihome.de) ([141.100.40.107])
 by ironchief.h-da.de with ESMTP; 16 Sep 2019 10:38:11 +0200
Received: from [192.168.2.102] (p5B157B5B.dip0.t-ipconnect.de [91.21.123.91])
 by mail.fbihome.de (Postfix) with ESMTPSA id 581C4421B7;
 Mon, 16 Sep 2019 10:38:11 +0200 (CEST)
To: alsa-devel@alsa-project.org
From: Jan-Marek Glogowski <glogow@fbihome.de>
Openpgp: preference=signencrypt
Autocrypt: addr=glogow@fbihome.de; prefer-encrypt=mutual; keydata=
 mQGiBEDrcVsRBACdQcj/8k2CSP+5frReJ2y7AAs4+3nBKPg08yOAsdcyQJAPbRGO8r1wJ6lb
 fnJI8+y8uvmsdQ83P4262EqpShHCpI7ioPUopkAKW5dWp/NM+YjYK0m3kMI03HlHeHKAMjyc
 pUmFu0sHktbDwrDUxTksgkcRHU1bbcyVuR7yaPbpdwCgoUn/Fthp7RItKuCLktKop6BcQbsE
 AIXM5gjo5C6l7I2tXFuO1+4boEwmL2WnGFEawFB4gBaBBJ6zUHzikdZW/5WHCUalSKRd38Bi
 PW2buoftYwIjuoRj30+YEVZ/2/oZsREcIazUeZzXaP2Emr/2rRNugj5KDPfgh6v6F9+Ravkw
 z6Bixv1lti7DoP32c7oDwggJEH6LA/0UVRt4RL3gO5Dcz+KIwOVrviZCKYB6/XSMfoAUDwne
 KhnYeQCB2ylV4O/bMrHz3dkNKHfgZ6SbMFJdAmCD1Vey0819jsh/CLCz9vp2wr5IzpTanL7y
 XYjj9R/qpDaW00LZF3+Maqavi3JKAi7K0CjnbcVfV65Rm/Qs1cfrsKQTf7QnSmFuLU1hcmVr
 IEdsb2dvd3NraSA8Z2xvZ293QGZiaWhvbWUuZGU+iFsEExECABsFAkDrcVsGCwkIBwMCAxUC
 AwMWAgECHgECF4AACgkQj6MK58wZA3cK/gCfb8IUFtgcxPSuAH1w8hn4C5WuSsUAn1P1Amys
 nLextO0t3xDDrFWO3PFhuQENBEDrcV0QBADpsD+yR9/1FEKKDGq7Q+jyz7or/SEwuCG/kHk3
 G+ynZYQzFEQ0cWBw0QFzNUNnwVAvG22M0UDjBn8v7BBH0ZtlrqVRUx++6uVv5dlj1uuBp1gp
 cpAHSQgmcXxN4xYSwdJ7fPbMeAkf+8IZc99xG2geF3uZNwzPxVFBHhP7zIZqIwADBQP8D5PU
 ZfoGLr3lDFqhoj6Z6sz9wrqWBC0+zjFcCBaoK4C9x7wxIyBJVRe+yhucLlxQt+LrrU9uQjlT
 YeHqkIL96Xp3KN4y2pr98bzMEF6uIifTEpZs+D+Jq1VvUiJiVUnw0EuCTzmds7tm9CMkOXcH
 hs7GRsJSHXRSWqsXZUec3muIRgQYEQIABgUCQOtxXQAKCRCPowrnzBkDd02+AJ0caVX6EEut
 2yzgPx9/lndIHGYlhgCfXy/f9ENFxfAxMlLXjTvDUe9qye8=
Message-ID: <8f4f9b20-0aeb-f8f1-c02f-fd53c09679f1@fbihome.de>
Date: Mon, 16 Sep 2019 10:38:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Cc: Chris Chiu <chiu@endlessm.com>, Takashi Iwai <tiwai@suse.com>,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>
Subject: [alsa-devel] RfC / [PATCH] Jack sense support for Medion E4254
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

Hi everybody,

I recently bought the laptop. It has one jack for attaching a headset. Jack
sense is announced by the HDA config but not working. Except for some
positioning, and color information, the PIN config seemed to be sensible, and
everything I tried to override, didn't result in a working jack.

Manually unmuting the jack using hda-analyser resulted in working output, so
generally the config seemed to work.

Reading the patch-realtek code, if found ALC256_FIXUP_ASUS_HEADSET_MODE, which
somehow changed the pin 0x19 to be associated with the 0x21 headset out pin,
resulting in this dmesg change:

-snd_hda_codec_realtek hdaudioC0D0:      Mic=0x19
+snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=0x19

And for whatever reason jack sense is now working, at least for some normal
output-only headset (currently I don't have one included a mic with me, so
actually can't test that mic volume works correctly).

I was just wondering, if my pin values are actually correct, because they still
define different association, as I understand it, but the ASUS fix even works
with these wrong channels /associations 2 and 4.

So the attached patch works for me, but I'm still wondering, if this is the
correct solution. FWIW, jack sense works fine in Windows.

Anything I might be missing here?

Jan-Marek

-------

From 0ccc5f07d8737690bd2df6d88a5af0f1f36d0e40 Mon Sep 17 00:00:00 2001
From: Jan-Marek Glogowski <glogow@fbihome.de>
Date: Sun, 15 Sep 2019 16:57:28 +0200
Subject: [PATCH] ALSA: hda/realtek: PCI quirk for Medion E4254

The laptop has a combined jack to attach headsets on the right.
The BIOS encodes them as two different colored jacks at the front,
but otherwise it seems to be configured ok. But any adaption of
the pins config on its own doesn't fix the jack detection to work
in Linux. Still Windows works correct.

This is somehow fixed by chaining ALC256_FIXUP_ASUS_HEADSET_MODE,
which seems to register the microphone jack as a headset part and
also results in fixing jack sensing, visible in dmesg as:

-snd_hda_codec_realtek hdaudioC0D0:      Mic=0x19
+snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=0x19

Signed-off-by: Jan-Marek Glogowski <glogow@fbihome.de>
---
 sound/pci/hda/patch_realtek.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index c1ddfd2fac52..448e0146dab2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5800,6 +5800,7 @@ enum {
 	ALC256_FIXUP_ASUS_MIC_NO_PRESENCE,
 	ALC299_FIXUP_PREDATOR_SPK,
 	ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC,
+	ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE,
 };

 static const struct hda_fixup alc269_fixups[] = {
@@ -6850,6 +6851,16 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
 	},
+	[ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x04a11040 },
+			{ 0x21, 0x04211020 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC256_FIXUP_ASUS_HEADSET_MODE
+	},
 };

 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7113,6 +7124,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x9e54, "LENOVO NB", ALC269_FIXUP_LENOVO_EAPD),
 	SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MACH-WX9", ALC256_FIXUP_HUAWEI_MACH_WX9_PINS),
 	SND_PCI_QUIRK(0x1b7d, 0xa831, "Ordissimo EVE2 ", ALC269VB_FIXUP_ORDISSIMO_EVE2), /* Also known as Malata PC-B1303 */
+	SND_PCI_QUIRK(0x10ec, 0x118c, "Medion EE4254 MD62100", ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE),

 #if 0
 	/* Below is a quirk table taken from the old code.
@@ -7280,6 +7292,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC225_FIXUP_HEADSET_JACK, .name = "alc-headset-jack"},
 	{.id = ALC295_FIXUP_CHROME_BOOK, .name = "alc-chrome-book"},
 	{.id = ALC299_FIXUP_PREDATOR_SPK, .name = "predator-spk"},
+	{.id = ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE, .name = "alc256-medion-headset"},
 	{}
 };
 #define ALC225_STANDARD_PINS \
-- 
2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
