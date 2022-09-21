Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 649C45BFB11
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 11:35:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0915C163B;
	Wed, 21 Sep 2022 11:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0915C163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663752905;
	bh=DiM6SGypgVf+BZrzH9OXRrJnfQ683OM024jomPAafRA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bPAY5pEvA2i7EE561sglCk/LajVL1lu2CsTQQgqI31P7uSiZPmB78xi1fZV5g0eob
	 F5MBvIGVM84ZjLq9JBoNrSMzS6UE2YC7w5SKMlbIM3vyTE2tvrbKEpWLa2RWZe12jg
	 bC3X/CHavmBtpJ3vk7ITylycjWvhBcijkIrWurxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00A1EF804CF;
	Wed, 21 Sep 2022 11:34:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D0DDF80425; Wed, 21 Sep 2022 11:34:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25B58F80425
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 11:33:56 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 76850A003F;
 Wed, 21 Sep 2022 11:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 76850A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1663752836; bh=2juqAuyS/N33Dt5P1RibtxNOSuDsnZN+dOhs3EOQ56w=;
 h=From:To:Cc:Subject:Date:From;
 b=IGHZE6k3z4DZVqzwD1NTY++mu7/LziZoOKdEsbFXfBL07YHYG/JIrrbzrMiaaFFc2
 42inGmYy489XxA7e/c7wSxKzSFroSghCxplWSCtgCx3NPkHcHVqRKhkPlkvQmRc8Rv
 pDUYUkJmb0GT8VfeONeMQh8VBTjqJKPYp9qECf/g=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 21 Sep 2022 11:33:53 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: hda/hdmi: ELD procfs - print the codec NIDs
Date: Wed, 21 Sep 2022 11:33:49 +0200
Message-Id: <20220921093349.82680-1-perex@perex.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

It is useful for the debugging to print also the used HDA codec NIDs
used for the given HDMI device. With the dynamic converter assignment
the converter NID is changed dynamically.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/pci/hda/hda_eld.c    | 6 +++++-
 sound/pci/hda/hda_local.h  | 3 ++-
 sound/pci/hda/patch_hdmi.c | 3 ++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/hda_eld.c b/sound/pci/hda/hda_eld.c
index 9e97443795f8..1d108ed5c6f2 100644
--- a/sound/pci/hda/hda_eld.c
+++ b/sound/pci/hda/hda_eld.c
@@ -440,7 +440,8 @@ static void hdmi_print_sad_info(int i, struct cea_sad *a,
 }
 
 void snd_hdmi_print_eld_info(struct hdmi_eld *eld,
-			     struct snd_info_buffer *buffer)
+			     struct snd_info_buffer *buffer,
+			     hda_nid_t pin_nid, int dev_id, hda_nid_t cvt_nid)
 {
 	struct parsed_hdmi_eld *e = &eld->info;
 	char buf[SND_PRINT_CHANNEL_ALLOCATION_ADVISED_BUFSIZE];
@@ -462,6 +463,9 @@ void snd_hdmi_print_eld_info(struct hdmi_eld *eld,
 
 	snd_iprintf(buffer, "monitor_present\t\t%d\n", eld->monitor_present);
 	snd_iprintf(buffer, "eld_valid\t\t%d\n", eld->eld_valid);
+	snd_iprintf(buffer, "codec_pin_nid\t\t0x%x\n", pin_nid);
+	snd_iprintf(buffer, "codec_dev_id\t\t0x%x\n", dev_id);
+	snd_iprintf(buffer, "codec_cvt_nid\t\t0x%x\n", cvt_nid);
 	if (!eld->eld_valid)
 		return;
 	snd_iprintf(buffer, "monitor_name\t\t%s\n", e->monitor_name);
diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index 682dca2057db..53a5a62b78fa 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -712,7 +712,8 @@ int snd_hdmi_get_eld_ati(struct hda_codec *codec, hda_nid_t nid,
 
 #ifdef CONFIG_SND_PROC_FS
 void snd_hdmi_print_eld_info(struct hdmi_eld *eld,
-			     struct snd_info_buffer *buffer);
+			     struct snd_info_buffer *buffer,
+			     hda_nid_t pin_nid, int dev_id, hda_nid_t cvt_nid);
 void snd_hdmi_write_eld_info(struct hdmi_eld *eld,
 			     struct snd_info_buffer *buffer);
 #endif
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index e20e0ed759f6..f27a4ee810e3 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -494,7 +494,8 @@ static void print_eld_info(struct snd_info_entry *entry,
 	struct hdmi_spec_per_pin *per_pin = entry->private_data;
 
 	mutex_lock(&per_pin->lock);
-	snd_hdmi_print_eld_info(&per_pin->sink_eld, buffer);
+	snd_hdmi_print_eld_info(&per_pin->sink_eld, buffer, per_pin->pin_nid,
+				per_pin->dev_id, per_pin->cvt_nid);
 	mutex_unlock(&per_pin->lock);
 }
 
-- 
2.35.3
