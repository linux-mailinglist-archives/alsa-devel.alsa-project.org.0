Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4832D762C
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 14:02:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 449941753;
	Fri, 11 Dec 2020 14:01:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 449941753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607691755;
	bh=BSRz0CCONlVGsGmluF9jFUBXjdlZw+IzW2M++QEDruU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rd729GYC1fuBwnk2/AcURkjoNGdr30girYJVqALdFUCAFbrNduLX1trOLCCVPnncW
	 z9/ojGkyb/EHo2KhGjOHuFLvPKA+UQ9cTY0V24zgClkJQzdr1XXvP7JN19xTyxPf/p
	 ALOguA6PB45uyQVe4Nrj/vqJpuoQUBtX6liLrBU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A71E9F8014E;
	Fri, 11 Dec 2020 14:01:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07C0EF8020D; Fri, 11 Dec 2020 14:00:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDDC3F8011F
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 14:00:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDDC3F8011F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17DADAE87
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 13:00:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix control 'access overflow' errors from
 chmap
Date: Fri, 11 Dec 2020 14:00:48 +0100
Message-Id: <20201211130048.6358-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The current channel-map control implementation in USB-audio driver may
lead to an error message like
  "control 3:0:0:Playback Channel Map:0: access overflow"
when CONFIG_SND_CTL_VALIDATION is set.  It's because the chmap get
callback clears the whole array no matter which count is set, and
rather the false-positive detection.

This patch fixes the problem by clearing only the needed array range
at usb_chmap_ctl_get().

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/stream.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index ca76ba5b5c0b..2f6d39c2ba7c 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -193,16 +193,16 @@ static int usb_chmap_ctl_get(struct snd_kcontrol *kcontrol,
 	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
 	struct snd_usb_substream *subs = info->private_data;
 	struct snd_pcm_chmap_elem *chmap = NULL;
-	int i;
+	int i = 0;
 
-	memset(ucontrol->value.integer.value, 0,
-	       sizeof(ucontrol->value.integer.value));
 	if (subs->cur_audiofmt)
 		chmap = subs->cur_audiofmt->chmap;
 	if (chmap) {
 		for (i = 0; i < chmap->channels; i++)
 			ucontrol->value.integer.value[i] = chmap->map[i];
 	}
+	for (; i < subs->channels_max; i++)
+		ucontrol->value.integer.value[i] = 0;
 	return 0;
 }
 
-- 
2.26.2

