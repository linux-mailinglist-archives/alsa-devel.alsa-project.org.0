Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB606AAC3
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 16:43:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAF65168C;
	Tue, 16 Jul 2019 16:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAF65168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563288189;
	bh=8lnh/cLIc8GYxthG9s3AsAhW3snKeUljnew6qJ7B4nM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VgMtuDjDXYSExXBekoFqP7bBC6SJonQHimJlRhNg777zbLwfC60UqLUrPcyPZRXQe
	 cevRMwUjxsN2cWwr/WwHQfWYh8xyaJvQd4t8Ll/cLK7F1tjXzexMS5d32GOVEAfdZK
	 S60h1v+NSjXxHpOTQIHdoIp+JxtJ3+hyQ+ZLjwuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16599F8038F;
	Tue, 16 Jul 2019 16:41:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1D15F80376; Tue, 16 Jul 2019 16:41:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A13BFF800C6
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 16:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A13BFF800C6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E683AB164;
 Tue, 16 Jul 2019 14:41:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 16 Jul 2019 16:41:11 +0200
Message-Id: <20190716144111.1470-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Hui Wang <hui.wang@canonical.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH v2] ALSA: hda/hdmi - Fix i915 reverse port/pin
	mapping
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

The recent fix for Icelake HDMI codec introduced the mapping from pin
NID to the i915 gfx port number.  However, it forgot the reverse
mapping from the port number to the pin NID that is used in the ELD
notifier callback.  As a result, it's processed to a wrong widget and
gives a warning like
  snd_hda_codec_hdmi hdaudioC0D2: HDMI: pin nid 5 not registered

This patch corrects it with a proper reverse mapping function.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=204133
Fixes: b0d8bc50b9f2 ("ALSA: hda: hdmi - add Icelake support")
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: Add missing error check from intel_port2pin()

 sound/pci/hda/patch_hdmi.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 1e6c489bca15..0b2a26e2c5f1 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2524,18 +2524,32 @@ static int intel_pin2port(void *audio_ptr, int pin_nid)
 	return -1;
 }
 
+static int intel_port2pin(struct hda_codec *codec, int port)
+{
+	struct hdmi_spec *spec = codec->spec;
+
+	if (!spec->port_num) {
+		/* we assume only from port-B to port-D */
+		if (port < 1 || port > 3)
+			return 0;
+		/* intel port is 1-based */
+		return port + intel_base_nid(codec) - 1;
+	}
+
+	if (port < 1 || port > spec->port_num)
+		return 0;
+	return spec->port_map[port - 1];
+}
+
 static void intel_pin_eld_notify(void *audio_ptr, int port, int pipe)
 {
 	struct hda_codec *codec = audio_ptr;
 	int pin_nid;
 	int dev_id = pipe;
 
-	/* we assume only from port-B to port-D */
-	if (port < 1 || port > 3)
+	pin_nid = intel_port2pin(codec, port);
+	if (!pin_nid)
 		return;
-
-	pin_nid = port + intel_base_nid(codec) - 1; /* intel port is 1-based */
-
 	/* skip notification during system suspend (but not in runtime PM);
 	 * the state will be updated at resume
 	 */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
