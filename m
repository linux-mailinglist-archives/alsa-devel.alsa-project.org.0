Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBDE184765
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 14:05:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28A951801;
	Fri, 13 Mar 2020 14:04:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28A951801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584104732;
	bh=iO+RKb968WATkhBcGWhWZ/Z9X0QHOvcKETwYxjKrA28=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KCZ+xhaAp1BUmosMST1y6+DeN5GMWGyOQRhj56YIJYSCkuXgIIqbQaIOJ8oLVbRpJ
	 qYEZ3kxfbvwPW0gE2yQOzblNeDxSIT3xSw0MlpGFl6O2aPxOv1FjKCCBITm9wLPWfM
	 dIT/FKEA6MlVIrDORFuxxo9Dsp3ptzDQp6W+BYwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02E25F80249;
	Fri, 13 Mar 2020 14:03:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2614DF801EB; Fri, 13 Mar 2020 14:02:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72078F80090
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 14:02:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72078F80090
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ED1F1B135
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 13:02:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Use scnprintf() for string truncation
Date: Fri, 13 Mar 2020 14:02:41 +0100
Message-Id: <20200313130241.8970-1-tiwai@suse.de>
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

snd_hdac_codec_modalias() truncates the string to the given size and
returns its size, but it returned a wrong size from snprintf().
snprintf() returns the would-be-output size, not the actual size.
Use scnprintf() instead to return the correct size.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/hdac_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 9a526aeef8da..e3119f5cb0d5 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -204,7 +204,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_device_set_chip_name);
  */
 int snd_hdac_codec_modalias(struct hdac_device *codec, char *buf, size_t size)
 {
-	return snprintf(buf, size, "hdaudio:v%08Xr%08Xa%02X\n",
+	return scnprintf(buf, size, "hdaudio:v%08Xr%08Xa%02X\n",
 			codec->vendor_id, codec->revision_id, codec->type);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_codec_modalias);
-- 
2.16.4

