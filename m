Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFD61AAD4F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 18:26:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38D8B886;
	Wed, 15 Apr 2020 18:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38D8B886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586968017;
	bh=LF5RrecsPOXuE9abqcEIwnTIPP9CXA6YBwkvek02Juw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IhFV7e5AqTSRoFmpCfh8MxLywEpS3jz7jizJaeTyfk5RyBUSd8InA4zRRyym9DgcC
	 z7D/ekiEKNB30xNxuuQ4iwPUc3eav/8NC86NzodKfavL6ZqFPhg1Bq0LCnRE7xIa0W
	 tBwluIYav/EC8MDlhuzXteXImDHXionosefu6IN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94C6DF80266;
	Wed, 15 Apr 2020 18:25:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C735F80266; Wed, 15 Apr 2020 18:25:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AECDF80229
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 18:25:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AECDF80229
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 05D1FABD1
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 16:25:23 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/hdmi: Add module option to disable audio component
 binding
Date: Wed, 15 Apr 2020 18:25:23 +0200
Message-Id: <20200415162523.27499-1-tiwai@suse.de>
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

As the recent regression showed, we want sometimes to turn off the
audio component binding just for debugging.  This patch adds the
module option to control it easily without compilation.

Fixes: ade49db337a9 ("ALSA: hda/hdmi - Allow audio component for AMD/ATI and Nvidia HDMI")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207223
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index bb287a916dae..4eff16053bd5 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -38,6 +38,10 @@ static bool static_hdmi_pcm;
 module_param(static_hdmi_pcm, bool, 0644);
 MODULE_PARM_DESC(static_hdmi_pcm, "Don't restrict PCM parameters per ELD info");
 
+static bool enable_acomp = true;
+module_param(enable_acomp, bool, 0444);
+MODULE_PARM_DESC(enable_acomp, "Enable audio component binding (default=yes)");
+
 struct hdmi_spec_per_cvt {
 	hda_nid_t cvt_nid;
 	int assigned;
@@ -2505,6 +2509,11 @@ static void generic_acomp_init(struct hda_codec *codec,
 {
 	struct hdmi_spec *spec = codec->spec;
 
+	if (!enable_acomp) {
+		codec_info(codec, "audio component disabled by module option\n");
+		return;
+	}
+
 	spec->port2pin = port2pin;
 	setup_drm_audio_ops(codec, ops);
 	if (!snd_hdac_acomp_init(&codec->bus->core, &spec->drm_audio_ops,
-- 
2.25.0

