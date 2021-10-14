Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC3B42D9C1
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 15:08:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8437D82E;
	Thu, 14 Oct 2021 15:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8437D82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634216924;
	bh=awXYklvmQy06hOlOOxE6GiEdBIeTO5kJrIgzg2PplLY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l0hsVBsAZgBH9RymSkAOxoNkyuiFYoLqSkz4sC95LPjtikFSZKvbZ2YO75uobs93d
	 S8MISR4kafmdlgbYxsJDGR2Huq82C9+eF8f6E2CSiB+OT8wVUHt86JJ/prYfGfPXkP
	 NodHolKlLHT0BbmqMXUqish3U9lISZPE9CjbfbjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05861F804ED;
	Thu, 14 Oct 2021 15:06:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 094ECF804E5; Thu, 14 Oct 2021 15:06:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1315BF80212
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 15:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1315BF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="O4UkwUoj"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="aGJ+pd6V"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0F84E1FD34;
 Thu, 14 Oct 2021 13:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634216799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OMvjta8MHpfGK0frByts4+GBZ5P/weVUGM1+n/rpj00=;
 b=O4UkwUojLLYH31iA0dqv9Hyf32Jypoi3tTzw+tlPG7jbuxCj7lpPpjkeb4kTr+u8oTTNtU
 olLqQv1v0TbiYQkD39T3MzCauxaaySEsqFTPrwj8b2+UE2U0owkrAl5ZTxkT1ug1MvORwz
 cylX5DgPerzjQKD/LA3WI9NguweHM1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634216799;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OMvjta8MHpfGK0frByts4+GBZ5P/weVUGM1+n/rpj00=;
 b=aGJ+pd6V6ZDk5yG00YTz6Uh1Fm6kpgd/sdfcW4pjEKdBYuCc1+l07VxVO+gts2YwLfgYjs
 P6/A0A/gXCJMD6AA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id F3990A3B85;
 Thu, 14 Oct 2021 13:06:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: usb-audio: Downgrade error message in
 get_ctl_value_v2()
Date: Thu, 14 Oct 2021 15:06:34 +0200
Message-Id: <20211014130636.17860-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211014130636.17860-1-tiwai@suse.de>
References: <20211014130636.17860-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

The error message in get_ctl_value_v2() (for UAC2/3) is shown via
KERN_ERR level but it was intended to be rather a debug message as
seen in get_ctl_value_v1() (for UAC1).  This patch downgrade the
printk level.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index a2ce535df14b..a20af9243155 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -373,7 +373,7 @@ static int get_ctl_value_v2(struct usb_mixer_elem_info *cval, int request,
 
 	if (ret < 0) {
 error:
-		usb_audio_err(chip,
+		usb_audio_dbg(chip,
 			"cannot get ctl value: req = %#x, wValue = %#x, wIndex = %#x, type = %d\n",
 			request, validx, idx, cval->val_type);
 		return ret;
-- 
2.26.2

