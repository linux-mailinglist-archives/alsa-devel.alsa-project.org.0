Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FFF482558
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Dec 2021 18:17:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A4281729;
	Fri, 31 Dec 2021 18:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A4281729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640971031;
	bh=kmFCbeBoNckRPph5FcAxLBziF4jYyKKeQcmc+M/kb90=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hl/Ti8SrEi+/Og+wrIR06vOWz5zDgJKiClgnrNJvCBXyPA4b1oTS8OTOFfRV5ONzo
	 Dj38Qiwncjp/J4pKmgkJ6aZpD7HA81O2alnkNjODO08almYzmdX6Zl48OA243gg+cc
	 oeuzIuF3WVYTlDKozhEaX/+MIpseaEih0ur+NFLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D96FF8050F;
	Fri, 31 Dec 2021 18:15:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99F88F80118; Fri, 31 Dec 2021 14:44:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
 by alsa1.perex.cz (Postfix) with ESMTP id 84259F800EB
 for <alsa-devel@alsa-project.org>; Fri, 31 Dec 2021 14:44:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84259F800EB
Received: by cae.in-ulm.de (Postfix, from userid 1000)
 id 4E7AA14042E; Fri, 31 Dec 2021 14:44:32 +0100 (CET)
Date: Fri, 31 Dec 2021 14:44:32 +0100
From: "Christian A. Ehrhardt" <cae@familie-ehrhardt.de>
To: alsa-devel@alsa-project.org
Subject: hda/cs8904: Fix jack detection after resume
Message-ID: <20211231134432.atwmuzeceqiklcoa@cae.in-ulm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Fri, 31 Dec 2021 18:15:28 +0100
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
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


Hi,

while debugging something different, I found the following
jack detection related bug in the cs8904 driver on my DELL
Inspirion 3501:
- Plug in a headset, play some sound to make sure that
  the headset is detected.
- Stop the sound, wait for the codec to go into suspend (30s
  should be plenty enough time)
- Unplug the headset while the codec is in suspend.
- Try to play sound on the internal speakers. Notice that
  the the driver still thinks the headset is connected. As a result
  there is no sound on the internal speakers.

AFAICS the bug was introduced by the following commit:
| commit 424e531b47f83da87490464c5bf633dfb624fe6a
| Author: Stefan Binding <sbinding@opensource.cirrus.com>
| Date:   Fri Aug 27 12:02:51 2021 +0100
| 
|     ALSA: hda/cs8409: Ensure Type Detection is only run on startup when
|     necessary

The bug is with the hp_jack_in and mic_jack_in flags that are used
to determine if jack detection should be run etc. These flags
are cleared in the suspend path. This prevents a status change from
being detected after resume as hp_jack_in is cleared by suspend and
there is no jack due to the unplug of the headset.

This status change was never reported to the HDA core, though.
On suspend this is not done, only hd_jack_in is cleared and on
resume the driver thinks that there is no change the needs reporting.

Proposed fix below, please consider inclusion.

     regards   Christian

From 1dcf34c1d1c6c4852a86ec3ae189afa5d90ea09c Mon Sep 17 00:00:00 2001
From: "Christian A. Ehrhardt" <lk@c--e.de>
Date: Fri, 31 Dec 2021 12:13:48 +0100
Subject: [PATCH 2/2] ALSA: hda/cs8409: Fix Jack detection after resume

The suspend code unconditionally sets ->hp_jack_in and ->mic_jack_in
to zero but without reporting this status change to the HDA core.
To compensate for this, always assume a status change on the
first unsol event after boot or resume.

Fixes:	424e531b47f8 ("ALSA: hda/cs8409: Ensure Type Detection is only run on startup when necessary")
Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
---
 sound/pci/hda/patch_cs8409-tables.c | 3 +++
 sound/pci/hda/patch_cs8409.c        | 5 ++++-
 sound/pci/hda/patch_cs8409.h        | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index 0fb0a428428b..df0b4522babf 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -252,6 +252,7 @@ struct sub_codec cs8409_cs42l42_codec = {
 	.init_seq_num = ARRAY_SIZE(cs42l42_init_reg_seq),
 	.hp_jack_in = 0,
 	.mic_jack_in = 0,
+	.force_status_change = 1,
 	.paged = 1,
 	.suspended = 1,
 	.no_type_dect = 0,
@@ -443,6 +444,7 @@ struct sub_codec dolphin_cs42l42_0 = {
 	.init_seq_num = ARRAY_SIZE(dolphin_c0_init_reg_seq),
 	.hp_jack_in = 0,
 	.mic_jack_in = 0,
+	.force_status_change = 1,
 	.paged = 1,
 	.suspended = 1,
 	.no_type_dect = 0,
@@ -456,6 +458,7 @@ struct sub_codec dolphin_cs42l42_1 = {
 	.init_seq_num = ARRAY_SIZE(dolphin_c1_init_reg_seq),
 	.hp_jack_in = 0,
 	.mic_jack_in = 0,
+	.force_status_change = 1,
 	.paged = 1,
 	.suspended = 1,
 	.no_type_dect = 1,
diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index bf5d7f0c6ba5..aff2b5abb81e 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -636,7 +636,9 @@ static void cs42l42_run_jack_detect(struct sub_codec *cs42l42)
 
 static int cs42l42_handle_tip_sense(struct sub_codec *cs42l42, unsigned int reg_ts_status)
 {
-	int status_changed = 0;
+	int status_changed = cs42l42->force_status_change;
+
+	cs42l42->force_status_change = 0;
 
 	/* TIP_SENSE INSERT/REMOVE */
 	switch (reg_ts_status) {
@@ -791,6 +793,7 @@ static void cs42l42_suspend(struct sub_codec *cs42l42)
 	cs42l42->last_page = 0;
 	cs42l42->hp_jack_in = 0;
 	cs42l42->mic_jack_in = 0;
+	cs42l42->force_status_change = 1;
 
 	/* Put CS42L42 into Reset */
 	gpio_data = snd_hda_codec_read(codec, CS8409_PIN_AFG, 0, AC_VERB_GET_GPIO_DATA, 0);
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index ade2b838590c..d0b725c7285b 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -305,6 +305,7 @@ struct sub_codec {
 
 	unsigned int hp_jack_in:1;
 	unsigned int mic_jack_in:1;
+	unsigned int force_status_change:1;
 	unsigned int suspended:1;
 	unsigned int paged:1;
 	unsigned int last_page;
-- 
2.32.0

