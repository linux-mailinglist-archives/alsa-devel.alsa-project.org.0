Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 145101E1B35
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 08:26:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3B631740;
	Tue, 26 May 2020 08:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3B631740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590474368;
	bh=bsokGtFfMhLwDOzFkEAEdcDVafcBSCwXgv61P3R+gaI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NYBS1rTz988xtdjIJICBQ5pmGamgGdzomUggnKR2xeKNwuSOyP3e+Gs04XRYJmrH/
	 RGFJlEBbgQOCemwu5bfk8TEMZDMBY8JOp+3kjtI8NNACSzgpYnG6Hk0Y/g9nRC7k/V
	 +qQFmE8pb5LOTB40sr4J2+8aE6O3FMSodpEOabAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE124F8015C;
	Tue, 26 May 2020 08:24:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48CB2F80150; Tue, 26 May 2020 08:24:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF685F80100
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 08:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF685F80100
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 34F3DABE4
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 06:24:13 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek - Add a model for Thinkpad T570 without DAC
 workaround
Date: Tue, 26 May 2020 08:24:06 +0200
Message-Id: <20200526062406.9799-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

We fixed the regression of the speaker volume for some Thinkpad models
(e.g. T570) by the commit 54947cd64c1b ("ALSA: hda/realtek - Fix
speaker output regression on Thinkpad T570").  Essentially it fixes
the DAC / pin pairing by a static table.  It was confirmed and merged
to stable kernel later.

Now, interestingly, we got another regression report for the very same
model (T570) about the similar problem, and the commit above was the
culprit.  That is, by some reason, there are devices that prefer the
DAC1, and another device DAC2!

Unfortunately those have the same ID and we have no idea what can
differentiate, in this patch, a new fixup model "tpt470-dock-fix" is
provided, so that users with such a machine can apply it manually.
When model=tpt470-dock-fix option is passed to snd-hda-intel module,
it avoids the fixed DAC pairing and the DAC1 is assigned to the
speaker like the earlier versions.

Fixes: 54947cd64c1b ("ALSA: hda/realtek - Fix speaker output regression on Thinkpad T570")
BugLink: https://apibugzilla.suse.com/show_bug.cgi?id=1172017
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 041d2a32059b..92c6e58c3862 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5484,18 +5484,9 @@ static void alc_fixup_tpt470_dock(struct hda_codec *codec,
 		{ 0x19, 0x21a11010 }, /* dock mic */
 		{ }
 	};
-	/* Assure the speaker pin to be coupled with DAC NID 0x03; otherwise
-	 * the speaker output becomes too low by some reason on Thinkpads with
-	 * ALC298 codec
-	 */
-	static const hda_nid_t preferred_pairs[] = {
-		0x14, 0x03, 0x17, 0x02, 0x21, 0x02,
-		0
-	};
 	struct alc_spec *spec = codec->spec;
 
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
-		spec->gen.preferred_dacs = preferred_pairs;
 		spec->parse_flags = HDA_PINCFG_NO_HP_FIXUP;
 		snd_hda_apply_pincfgs(codec, pincfgs);
 	} else if (action == HDA_FIXUP_ACT_INIT) {
@@ -5508,6 +5499,23 @@ static void alc_fixup_tpt470_dock(struct hda_codec *codec,
 	}
 }
 
+static void alc_fixup_tpt470_dacs(struct hda_codec *codec,
+				  const struct hda_fixup *fix, int action)
+{
+	/* Assure the speaker pin to be coupled with DAC NID 0x03; otherwise
+	 * the speaker output becomes too low by some reason on Thinkpads with
+	 * ALC298 codec
+	 */
+	static const hda_nid_t preferred_pairs[] = {
+		0x14, 0x03, 0x17, 0x02, 0x21, 0x02,
+		0
+	};
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		spec->gen.preferred_dacs = preferred_pairs;
+}
+
 static void alc_shutup_dell_xps13(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
@@ -6063,6 +6071,7 @@ enum {
 	ALC700_FIXUP_INTEL_REFERENCE,
 	ALC274_FIXUP_DELL_BIND_DACS,
 	ALC274_FIXUP_DELL_AIO_LINEOUT_VERB,
+	ALC298_FIXUP_TPT470_DOCK_FIX,
 	ALC298_FIXUP_TPT470_DOCK,
 	ALC255_FIXUP_DUMMY_LINEOUT_VERB,
 	ALC255_FIXUP_DELL_HEADSET_MIC,
@@ -6994,12 +7003,18 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC274_FIXUP_DELL_BIND_DACS
 	},
-	[ALC298_FIXUP_TPT470_DOCK] = {
+	[ALC298_FIXUP_TPT470_DOCK_FIX] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_tpt470_dock,
 		.chained = true,
 		.chain_id = ALC293_FIXUP_LENOVO_SPK_NOISE
 	},
+	[ALC298_FIXUP_TPT470_DOCK] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_tpt470_dacs,
+		.chained = true,
+		.chain_id = ALC298_FIXUP_TPT470_DOCK_FIX
+	},
 	[ALC255_FIXUP_DUMMY_LINEOUT_VERB] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -7638,6 +7653,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC292_FIXUP_TPT440_DOCK, .name = "tpt440-dock"},
 	{.id = ALC292_FIXUP_TPT440, .name = "tpt440"},
 	{.id = ALC292_FIXUP_TPT460, .name = "tpt460"},
+	{.id = ALC298_FIXUP_TPT470_DOCK_FIX, .name = "tpt470-dock-fix"},
 	{.id = ALC298_FIXUP_TPT470_DOCK, .name = "tpt470-dock"},
 	{.id = ALC233_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
 	{.id = ALC700_FIXUP_INTEL_REFERENCE, .name = "alc700-ref"},
-- 
2.16.4

