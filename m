Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3DD3AFFEA
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 11:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 417BE1684;
	Tue, 22 Jun 2021 11:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 417BE1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624352910;
	bh=x1GbKpEK+kcbO3oUZd6QqATxyM9Hz4vQG18p6c+X79E=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BVOawr/hGFRAlapf3S1akwTeuGhWvAFnwD5+ios82bzhHrCWjiQeLY3nlrNNNTaiw
	 72FIlPDsbsjbPPYwUf5g74K4tOceJs+naPDRjvq2xsTuU/VTIIMRMHbRmW/MUwuz74
	 EpTAlAIfYCI65Rp9biMQdfOwjvQDQD2IJIWcClSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1D3BF80137;
	Tue, 22 Jun 2021 11:07:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4496FF80268; Tue, 22 Jun 2021 11:06:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AF7EF80137
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 11:06:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AF7EF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="oi3WEfIi"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="F4gE0njU"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D4F0D219A0
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624352808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UwUb/HvabkKxuiPbhhGUhoqJmY0F4pNvEyp8vaEJkAE=;
 b=oi3WEfIiJ5ETBjSrfO3hA0Qq/yddMGhjV2PPqKTEcyFtmson9MRBkqrKkDyVvOwl9eh4ul
 pmF0XJvWqzHKDR/Xi0wyrbK/gTJc21ReC511wCtVJSojDvp9/qEty3y42RCYVXErE38E6o
 Kbx7TgFP/BAMIKdrITueyTbtV8eAwrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624352808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UwUb/HvabkKxuiPbhhGUhoqJmY0F4pNvEyp8vaEJkAE=;
 b=F4gE0njUz6Mdcv7NiiTaTVq3xYvv8JzvvoHvmswUO1eP5ICfMBfS18I+p3NrXeW+WTA9as
 iLbExzOs/4W+9pAg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C5AEDA3B84;
 Tue, 22 Jun 2021 09:06:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix OOB access at proc output
Date: Tue, 22 Jun 2021 11:06:47 +0200
Message-Id: <20210622090647.14021-1-tiwai@suse.de>
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

At extending the available mixer values for 32bit types, we forgot to
add the corresponding entries for the format dump in the proc output.
This may result in OOB access.  Here adds the missing entries.

Fixes: bc18e31c3042 ("ALSA: usb-audio: Fix parameter block size for UAC2 control requests")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 428d581f988f..4ea4875abdf8 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -3294,8 +3294,9 @@ static void snd_usb_mixer_dump_cval(struct snd_info_buffer *buffer,
 				    struct usb_mixer_elem_list *list)
 {
 	struct usb_mixer_elem_info *cval = mixer_elem_list_to_info(list);
-	static const char * const val_types[] = {"BOOLEAN", "INV_BOOLEAN",
-				    "S8", "U8", "S16", "U16"};
+	static const char * const val_types[] = {
+		"BOOLEAN", "INV_BOOLEAN", "S8", "U8", "S16", "U16", "S32", "U32",
+	};
 	snd_iprintf(buffer, "    Info: id=%i, control=%i, cmask=0x%x, "
 			    "channels=%i, type=\"%s\"\n", cval->head.id,
 			    cval->control, cval->cmask, cval->channels,
-- 
2.26.2

