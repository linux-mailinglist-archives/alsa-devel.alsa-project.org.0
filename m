Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CEB387C5E
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 17:23:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CECE6172F;
	Tue, 18 May 2021 17:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CECE6172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621351394;
	bh=bZyM7H/7DLWoZnYwjm08BhWp2RM3ctSdvemsk3g1UFw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ns/AqK79OhUP9RkWW87MlbE56uC8VBUBCEln/HPVgshGCzrLlZ4P8HGGo0Cn/Miw7
	 nt9G7qHpxyZMlrwbKokKv4PP3cnJ6BU75sobkoLxj7Qu2I6truups+/wf+5UlMRx2V
	 pi5LGu6d/N7+uIZ+dtaikVEl/mi99+26bArjmfi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBBD5F8027D;
	Tue, 18 May 2021 17:21:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AEB0F8014C; Tue, 18 May 2021 17:21:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3198F8014C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 17:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3198F8014C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59329B15E
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 15:21:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: usb-audio: Handle error for the current selector
 gracefully
Date: Tue, 18 May 2021 17:21:12 +0200
Message-Id: <20210518152112.8016-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210518152112.8016-1-tiwai@suse.de>
References: <20210518152112.8016-1-tiwai@suse.de>
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

Currently we bail out when the device returns an error or an invalid
value for the current clock selector value via
uac_clock_selector_get_val().  But it's possible that the device is
really uninitialized and waits for the setup of the proper route at
first.

For handling such a case, this patch lets the driver dealing with the
error or the invalid error more gracefully, choosing the clock source
automatically instead.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/clock.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 48a79f1b6233..772478c725c2 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -299,8 +299,11 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 		/* the entity ID we are looking for is a selector.
 		 * find out what it currently selects */
 		ret = uac_clock_selector_get_val(chip, clock_id);
-		if (ret < 0)
-			return ret;
+		if (ret < 0) {
+			if (!chip->autoclock)
+				return ret;
+			goto find_others;
+		}
 
 		/* Selector values are one-based */
 
@@ -309,7 +312,10 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 				"%s(): selector reported illegal value, id %d, ret %d\n",
 				__func__, clock_id, ret);
 
-			return -EINVAL;
+			if (!chip->autoclock)
+				return -EINVAL;
+			ret = 0;
+			goto find_others;
 		}
 
 	find_source:
@@ -326,6 +332,7 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 		if (!validate || ret > 0 || !chip->autoclock)
 			return ret;
 
+	find_others:
 		/* The current clock source is invalid, try others. */
 		for (i = 1; i <= pins; i++) {
 			if (i == cur)
-- 
2.26.2

