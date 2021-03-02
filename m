Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB203329C82
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 12:26:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 896511735;
	Tue,  2 Mar 2021 12:25:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 896511735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614684366;
	bh=cfaDG0CsDkWjXtFu07R+FJxbG+tugJ23ed4upjZF7Ec=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hy6Aevn7JZXCcyohMSrkzYltpPZfsH3cHS2/IVi5P+3q2zYzdALSStXopo7cKCmKc
	 Xx/QZXCNVMKehP1+aYnk1QozXkftWMZL3MjLBbqHjO4344nTlkhIOStLH541p7nQvk
	 p+ZTsj7SIGj3YvZFzmsPTEOYhkdZOrafUZmV0OQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17804F80269;
	Tue,  2 Mar 2021 12:25:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7FCFF80271; Tue,  2 Mar 2021 12:25:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA799F80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 12:25:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA799F80227
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 9644BC800CD;
 Tue,  2 Mar 2021 12:25:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id lbnLkmpAJE1l; Tue,  2 Mar 2021 12:25:06 +0100 (CET)
Received: from [IPv6:2003:e3:7f23:4700:cc41:88a7:f2f8:d6b8]
 (p200300e37f234700CC4188a7F2f8D6b8.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f23:4700:cc41:88a7:f2f8:d6b8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 52B51C800CB;
 Tue,  2 Mar 2021 12:25:06 +0100 (CET)
From: Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Intel NUC 10
To: wse@tuxedocomputers.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 alsa-devel@vger.kernel.org
Autocrypt: addr=wse@tuxedocomputers.com; keydata=
 mDMEX6ALvhYJKwYBBAHaRw8BAQdAG/kE3mlbV1YLpCU8iA7Pyq2eDq9LxzGQxcOZODh2Vnq0
 KFdlcm5lciBTZW1iYWNoIDx3c2VAdHV4ZWRvY29tcHV0ZXJzLmNvbT6IlgQTFggAPhYhBNzq
 jJqAsvWKK1h7bi7eQpXUvijKBQJfoAu+AhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMBAh4B
 AheAAAoJEC7eQpXUvijKzkEA/jblmQRWU/e18oo8J9GPHWOCRUA1WJLUt9lSye5cgl2vAP0Y
 q+EpkDRS+QqtIcIr3fVELwA4b/V1lVE2LW+plcmdCbg4BF+gC74SCisGAQQBl1UBBQEBB0Bc
 k3J9DVAB4ysrdDcKE7L9iAUjlWD+rsLh/5soPORqFQMBCAeIfgQYFggAJhYhBNzqjJqAsvWK
 K1h7bi7eQpXUvijKBQJfoAu+AhsMBQkJZgGAAAoJEC7eQpXUvijKBBYA/2DT2g26dpTU2Rbc
 lqviltu+woGZCd0GBfRgXuzUK0OfAQCwr8qPCl8uIsBgOsDmWIJYByG2ddwmXiAgBS1985bM Ag==
Message-ID: <447c7c3f-9e9b-bdbe-5c91-c6d8ab306173@tuxedocomputers.com>
Date: Tue, 2 Mar 2021 12:25:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

From: Werner Sembach <wse@tuxedocomputers.com>

ALSA: hda/realtek: Add quirk for Intel NUC 10

This adds a new SND_PCI_QUIRK(...) and applies it to the Intel NUC 10
devices. This fixes the issue of the devices not having audio input and
output on the headset jack because the kernel does not recognize when
something is plugged in.

The new quirk was inspired by the quirk for the Intel NUC 8 devices, but
it turned out that the NUC 10 uses another pin. This information was
acquired by black box testing likely pins.

Co-developed-by: Eckhart Mohr <e.mohr@tuxedocomputers.com>
Signed-off-by: Eckhart Mohr <e.mohr@tuxedocomputers.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
Hi,
this is my second ever submitted kernel patch with the first one send just some minutes ago, feel free to criticise me if I made an error or missed a best practice bullet point.
Also: I'm unsure if this would fit the requirements for stable@vger.kernel.org and/or trivial@kernel.org, but I think not (correct me if I'm wrong).
Kind regards
Werner Sembach

From d281364b8ca6c054a0e5ce20caa599bf7d08160d Mon Sep 17 00:00:00 2001
From: Werner Sembach <wse@tuxedocomputers.com>
Date: Fri, 26 Feb 2021 13:54:30 +0100
Subject: [PATCH] Fix Intel NUC10 no output and input on headset jack

---
 sound/pci/hda/patch_realtek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 290645516313..c14d624dbaf1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6362,6 +6362,7 @@ enum {
     ALC269_FIXUP_LEMOTE_A1802,
     ALC269_FIXUP_LEMOTE_A190X,
     ALC256_FIXUP_INTEL_NUC8_RUGGED,
+    ALC256_FIXUP_INTEL_NUC10,
     ALC255_FIXUP_XIAOMI_HEADSET_MIC,
     ALC274_FIXUP_HP_MIC,
     ALC274_FIXUP_HP_HEADSET_MIC,
@@ -7744,6 +7745,15 @@ static const struct hda_fixup alc269_fixups[] = {
         .chained = true,
         .chain_id = ALC269_FIXUP_HEADSET_MODE
     },
+    [ALC256_FIXUP_INTEL_NUC10] = {
+        .type = HDA_FIXUP_PINS,
+        .v.pins = (const struct hda_pintbl[]) {
+            { 0x19, 0x01a1913c }, /* use as headset mic, without its own jack detect */
+            { }
+        },
+        .chained = true,
+        .chain_id = ALC269_FIXUP_HEADSET_MODE
+    },
     [ALC255_FIXUP_XIAOMI_HEADSET_MIC] = {
         .type = HDA_FIXUP_VERBS,
         .v.verbs = (const struct hda_verb[]) {
@@ -8183,6 +8193,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
     SND_PCI_QUIRK(0x1c06, 0x2013, "Lemote A1802", ALC269_FIXUP_LEMOTE_A1802),
     SND_PCI_QUIRK(0x1c06, 0x2015, "Lemote A190X", ALC269_FIXUP_LEMOTE_A190X),
     SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),
+    SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
 
 #if 0
     /* Below is a quirk table taken from the old code.
-- 
2.25.1








