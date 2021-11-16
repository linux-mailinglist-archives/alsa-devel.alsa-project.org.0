Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D27452B39
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 07:57:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47B9E168E;
	Tue, 16 Nov 2021 07:56:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47B9E168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637045824;
	bh=qqHaEvjpEfdUNXqsbc2Li0mviOEi3aNNWyWrekTnt+Y=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lt8/kRDS4nulvCH/YAYBdb4EiXcReUGWGdvBLTEnfdSp+qhJObrohndY5tHTY11H9
	 gTlNdljhetCK2627KqkPMbWC84KtKt/M53V/WwTZt1nDa7FXdb2i3OzzN4auZvFrfv
	 gyBRc9tznZ8u1KEG1UaoT9467T6z5GxQNr+kvFFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 079A9F804FA;
	Tue, 16 Nov 2021 07:55:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F572F804F3; Tue, 16 Nov 2021 07:55:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42DC7F80272
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 07:54:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42DC7F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="x0R770lj"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Cp/snEcy"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8A4581FCA1
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 06:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637045658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTwoEKhCrG2l8C1ekei4omzPFhMokZIghkUs6mvdD44=;
 b=x0R770ljJe8+FgBAqJ66YPhfwWc+bph0VjwNTeyVj6TiUknu79a2Cnfb/XRm9xcOgNME7w
 UczzHwKBDAWOTEkN6oc4gXXdIvo2MshDXsj9UcBk1phNbTTS15WvtpdEJV3knnNhwzRe54
 Op3Q92PhSJZa8HZxBEAsoZEHWEMA4IA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637045658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTwoEKhCrG2l8C1ekei4omzPFhMokZIghkUs6mvdD44=;
 b=Cp/snEcyBTvyEGcceubzsfzQ5abmeZCS80X6D10evnD5FSusExw9HsWxR9Yynq6AmqkV8d
 70MiqPx83CL9HSAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 7AECCA3B83;
 Tue, 16 Nov 2021 06:54:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: usb-audio: Use int for dB map values
Date: Tue, 16 Nov 2021 07:54:13 +0100
Message-Id: <20211116065415.11159-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211116065415.11159-1-tiwai@suse.de>
References: <20211116065415.11159-1-tiwai@suse.de>
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

The values in usbmix_dB_map should be rather signed while we're using
u32.  As the copied target (usb_mixer_elem_info.dBmin and dBmax) is
int, let's make them also int.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer_maps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 55eea90ee993..92c06b1bb979 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -6,8 +6,8 @@
  */
 
 struct usbmix_dB_map {
-	u32 min;
-	u32 max;
+	int min;
+	int max;
 };
 
 struct usbmix_name_map {
-- 
2.26.2

