Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 877B82F9AE5
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 09:00:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2005B17B4;
	Mon, 18 Jan 2021 09:00:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2005B17B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610956855;
	bh=gDyByuXHJu57qkFmcRhG1lVed0JE6iEDxJbpOkJiwYw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U0zWIEz/efZfkEZX/wvXRXo66/PjLp0Z7Q3/dJypM47Fzgne3kmOBUdVJ+6sOr7YM
	 h5zIbS48xGIL+ExJo1D1+clCUIKK1wEp14nPFSxiwNo8MVdRAdThkm/AAn6y2lkYon
	 dbYM4v99aPzmXM4oa2Bb2akFtSHD5pCDQiodeALc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5279CF80166;
	Mon, 18 Jan 2021 08:58:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49D68F804C2; Mon, 18 Jan 2021 08:58:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A2DEF80166
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 08:58:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A2DEF80166
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D987AC4F;
 Mon, 18 Jan 2021 07:58:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: usb-audio: Set sample rate for all sharing EPs on
 UAC1
Date: Mon, 18 Jan 2021 08:58:15 +0100
Message-Id: <20210118075816.25068-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118075816.25068-1-tiwai@suse.de>
References: <20210118075816.25068-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <konference@frantovo.cz>,
 Geraldo <geraldogabriel@gmail.com>
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

The UAC2/3 sample rate setup is based on the clock node, which is
usually shared in the interface, and can't be re-setup without
deselecting the interface once, and that's how the current code
behaves.  OTOH, the sample rate setup of UAC1 is per endpoint, hence
we basically need to call for each endpoint usage even if those share
the same interface.

This patch fixes the behavior of UAC1 to call always
snd_usb_init_sample_rate() in snd_usb_endpoint_configure().

Fixes: bf6313a0ff76 ("ALSA: usb-audio: Refactor endpoint management")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index fe73fe3ff2bc..8e568823c992 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1252,6 +1252,15 @@ int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
 
 	/* If the interface has been already set up, just set EP parameters */
 	if (!ep->iface_ref->need_setup) {
+		/* sample rate setup of UAC1 is per endpoint, and we need
+		 * to update at each EP configuration
+		 */
+		if (ep->cur_audiofmt->protocol == UAC_VERSION_1) {
+			err = snd_usb_init_sample_rate(chip, ep->cur_audiofmt,
+						       ep->cur_rate);
+			if (err < 0)
+				goto unlock;
+		}
 		err = snd_usb_endpoint_set_params(chip, ep);
 		if (err < 0)
 			goto unlock;
-- 
2.26.2

