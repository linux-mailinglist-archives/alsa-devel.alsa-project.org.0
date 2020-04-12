Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E31E41A5D6F
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Apr 2020 10:15:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E53816C7;
	Sun, 12 Apr 2020 10:14:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E53816C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586679329;
	bh=xVcgDfEHqGPxp8ZNB81WdGmeSh76wbMMYsNCC0YYKbE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VKe+nFoeh0YNFx0cZrj9yfrlayFqJQW69+V3IQhmOJc5xicwAoy5u2Eoz6l5TDvKV
	 fdCU0J5oLZqsY7EdJ5aHq4fkHNYjc+UksKysaNjElhjATph1jSYK3WYCbaqUesElSz
	 fIIqualW6dLTMsMKnvOZs0yyd86Lf7sE4LwV6H5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36FDCF8016F;
	Sun, 12 Apr 2020 10:13:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8A95F800B6; Sun, 12 Apr 2020 10:13:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E11CCF80112
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 10:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E11CCF80112
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1CB62AD79
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 08:13:36 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ALSA: usb-audio: Filter error from connector kctl ops, too
Date: Sun, 12 Apr 2020 10:13:28 +0200
Message-Id: <20200412081331.4742-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200412081331.4742-1-tiwai@suse.de>
References: <20200412081331.4742-1-tiwai@suse.de>
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

The ignore_ctl_error option should filter the error at kctl accesses,
but there was an overlook: mixer_ctl_connector_get() returns an error
from the request.

This patch covers the forgotten code path and apply filter_error()
properly.  The locking error is still returned since this is a fatal
error that has to be reported even with ignore_ctl_error option.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=206873
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 721d12130d0c..d27e390dcd32 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1457,7 +1457,7 @@ static int mixer_ctl_connector_get(struct snd_kcontrol *kcontrol,
 		usb_audio_err(chip,
 			"cannot get connectors status: req = %#x, wValue = %#x, wIndex = %#x, type = %d\n",
 			UAC_GET_CUR, validx, idx, cval->val_type);
-		return ret;
+		return filter_error(cval, ret);
 	}
 
 	ucontrol->value.integer.value[0] = val;
-- 
2.16.4

