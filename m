Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF4313AAC0
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:23:13 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60AE6269D;
	Mon, 13 Jan 2020 22:21:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60AE6269D
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4701F8029A;
	Mon, 13 Jan 2020 22:14:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8843F80292; Mon, 13 Jan 2020 22:14:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CF58F8028D
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 22:14:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CF58F8028D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 13:14:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,430,1571727600"; d="scan'208";a="218775931"
Received: from pboliset-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.152.72])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jan 2020 13:14:15 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 13 Jan 2020 15:14:04 -0600
Message-Id: <20200113211405.28070-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113211405.28070-1-pierre-louis.bossart@linux.intel.com>
References: <20200113211405.28070-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/2] ALSA: HDA: correct kernel-doc parameter
	descriptions
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

make W=1 throws warnings, provide missing documentation

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/hda/hda_codec.c    | 1 +
 sound/pci/hda/hda_generic.c  | 5 +++++
 sound/pci/hda/hda_jack.c     | 2 ++
 sound/pci/hda/patch_ca0132.c | 1 +
 4 files changed, 9 insertions(+)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 83aa4c1015d2..5dc42f932739 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -891,6 +891,7 @@ static int snd_hda_codec_device_init(struct hda_bus *bus, struct snd_card *card,
 /**
  * snd_hda_codec_new - create a HDA codec
  * @bus: the bus to assign
+ * @card: card for this codec
  * @codec_addr: the codec address
  * @codecp: the pointer to store the generated codec
  *
diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 6815f9dc8545..f4e9d9445e18 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -4042,6 +4042,11 @@ static void call_ledtrig_micmute(struct hda_codec *codec)
  *
  * Note that this fixup has to be called after other fixup that sets
  * cap_sync_hook.  Otherwise the chaining wouldn't work.
+ *
+ * @codec: the HDA codec
+ * @fix: fixup pointer
+ * @action: only supports HDA_FIXUP_ACT_PROBE value
+ *
  */
 void snd_hda_gen_fixup_micmute_led(struct hda_codec *codec,
 				   const struct hda_fixup *fix, int action)
diff --git a/sound/pci/hda/hda_jack.c b/sound/pci/hda/hda_jack.c
index bf0255cb0515..02cc682caa55 100644
--- a/sound/pci/hda/hda_jack.c
+++ b/sound/pci/hda/hda_jack.c
@@ -122,6 +122,7 @@ any_jack_tbl_get_from_nid(struct hda_codec *codec, hda_nid_t nid)
  * snd_hda_jack_tbl_new - create a jack-table entry for the given NID
  * @codec: the HDA codec
  * @nid: pin NID to assign
+ * @dev_id: pin device entry id
  */
 static struct hda_jack_tbl *
 snd_hda_jack_tbl_new(struct hda_codec *codec, hda_nid_t nid, int dev_id)
@@ -233,6 +234,7 @@ EXPORT_SYMBOL_GPL(snd_hda_jack_set_dirty_all);
  * snd_hda_jack_pin_sense - execute pin sense measurement
  * @codec: the CODEC to sense
  * @nid: the pin NID to sense
+ * @dev_id: pin device entry id
  *
  * Execute necessary pin sense measurement and return its Presence Detect,
  * Impedance, ELD Valid etc. status bits.
diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 46e105244ad3..ded8bc07d755 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1923,6 +1923,7 @@ static int dspio_send_scp_message(struct hda_codec *codec,
  * Prepare and send the SCP message to DSP
  * @codec: the HDA codec
  * @mod_id: ID of the DSP module to send the command
+ * @src_id: ID of the source
  * @req: ID of request to send to the DSP module
  * @dir: SET or GET
  * @data: pointer to the data to send with the request, request specific
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
