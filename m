Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 326D02E8354
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jan 2021 09:40:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E981E16AA;
	Fri,  1 Jan 2021 09:39:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E981E16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609490443;
	bh=KXCliTDenGFnIpd5YWwkCeNWkEcPEALu9P65yrjuK8w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kXdIY2hQg0AQSgzRpduVf8YX9xvlLL8k75sil7oxzzB2P8tYoJB5vi9zNPc8ftWEC
	 UXQusHx2v8F3eLgGjelxYnhFO24ph2cXzqaGqQAql2abPIaSlDppe+UWBgtUAStg8q
	 fgT3SLgBilL4nARrv2dw/gxPDvEFdOy5HmNFruKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABE88F800B7;
	Fri,  1 Jan 2021 09:39:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2027F801F5; Fri,  1 Jan 2021 09:39:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88830F8015F
 for <alsa-devel@alsa-project.org>; Fri,  1 Jan 2021 09:38:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88830F8015F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9F40FB750;
 Fri,  1 Jan 2021 08:38:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/hdmi: Fix incorrect mutex unlock in
 silent_stream_disable()
Date: Fri,  1 Jan 2021 09:38:52 +0100
Message-Id: <20210101083852.12094-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jan Alexander Steffens <heftig@archlinux.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

The silent_stream_disable() function introduced by the commit
b1a5039759cb ("ALSA: hda/hdmi: fix silent stream for first playback to
DP") takes the per_pin->lock mutex, but it unlocks the wrong one,
spec->pcm_lock, which causes a deadlock.  This patch corrects it.

Fixes: b1a5039759cb ("ALSA: hda/hdmi: fix silent stream for first playback to DP")
Reported-by: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 1e4a4b83fbf6..74d246a0dc6d 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1733,7 +1733,7 @@ static void silent_stream_disable(struct hda_codec *codec,
 	per_pin->silent_stream = false;
 
  unlock_out:
-	mutex_unlock(&spec->pcm_lock);
+	mutex_unlock(&per_pin->lock);
 }
 
 /* update ELD and jack state via audio component */
-- 
2.26.2

