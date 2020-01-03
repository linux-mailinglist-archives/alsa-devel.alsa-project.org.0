Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE45F12F5A3
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:42:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67F8E1771;
	Fri,  3 Jan 2020 09:41:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67F8E1771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578040933;
	bh=HO/fSfEpwNtbPPHIZvSHQDEF2+WHJ/YHx0ACxkz5N3A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QgPT3ytVf8vrA1UDzM8aw2VsOOpzHf+SwK/CDPnJfwjiPkEaw0bz68q13dod/VLvq
	 2d4Q1OKwmRq9Jzxls4u/jR7tBUf7+GGZpKmOlf6C7jhmsOguNv4UAEmEbfgoyf/g0Y
	 lJr9j3TTQ4M7cIYLLhcXk96ZktBxDlR/5MBjHM6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8482F80441;
	Fri,  3 Jan 2020 09:19:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0272DF8036F; Fri,  3 Jan 2020 09:18:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 275BCF8028B
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 275BCF8028B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 65BFEB278
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:52 +0100
Message-Id: <20200103081714.9560-37-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 36/58] ALSA: hda: Constify snd_kcontrol_new
	items
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Most of snd_kcontrol_new definitions are read-only and passed as-is.
Let's declare them as const for further optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_codec.c      | 8 ++++----
 sound/pci/hda/patch_sigmatel.c | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 8f166bbc438b..d039eeec080f 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2387,7 +2387,7 @@ static int snd_hda_spdif_out_switch_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
-static struct snd_kcontrol_new dig_mixes[] = {
+static const struct snd_kcontrol_new dig_mixes[] = {
 	{
 		.access = SNDRV_CTL_ELEM_ACCESS_READ,
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
@@ -2437,7 +2437,7 @@ int snd_hda_create_dig_out_ctls(struct hda_codec *codec,
 {
 	int err;
 	struct snd_kcontrol *kctl;
-	struct snd_kcontrol_new *dig_mix;
+	const struct snd_kcontrol_new *dig_mix;
 	int idx = 0;
 	int val = 0;
 	const int spdif_index = 16;
@@ -2655,7 +2655,7 @@ static int snd_hda_spdif_in_status_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static struct snd_kcontrol_new dig_in_ctls[] = {
+static const struct snd_kcontrol_new dig_in_ctls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, SWITCH),
@@ -2687,7 +2687,7 @@ int snd_hda_create_spdif_in_ctls(struct hda_codec *codec, hda_nid_t nid)
 {
 	int err;
 	struct snd_kcontrol *kctl;
-	struct snd_kcontrol_new *dig_mix;
+	const struct snd_kcontrol_new *dig_mix;
 	int idx;
 
 	idx = find_empty_mixer_ctl_idx(codec, "IEC958 Capture Switch", 0);
diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
index 8ecb53bce509..9b816b377547 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -825,11 +825,11 @@ static int stac_auto_create_beep_ctls(struct hda_codec *codec,
 	struct sigmatel_spec *spec = codec->spec;
 	u32 caps = query_amp_caps(codec, nid, HDA_OUTPUT);
 	struct snd_kcontrol_new *knew;
-	static struct snd_kcontrol_new abeep_mute_ctl =
+	static const struct snd_kcontrol_new abeep_mute_ctl =
 		HDA_CODEC_MUTE(NULL, 0, 0, 0);
-	static struct snd_kcontrol_new dbeep_mute_ctl =
+	static const struct snd_kcontrol_new dbeep_mute_ctl =
 		HDA_CODEC_MUTE_BEEP(NULL, 0, 0, 0);
-	static struct snd_kcontrol_new beep_vol_ctl =
+	static const struct snd_kcontrol_new beep_vol_ctl =
 		HDA_CODEC_VOLUME(NULL, 0, 0, 0);
 
 	/* check for mute support for the the amp */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
