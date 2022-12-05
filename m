Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84679642943
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 14:22:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03970185A;
	Mon,  5 Dec 2022 14:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03970185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670246576;
	bh=GVqasnUZUFppt8L4KzOC3MBgSF4gAWjpRkFb47xIZh0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o658/hhLFt+cMZKOG09Yi3fxoZcGFsT/ZtgWm1od3OtBgJrXjmbeuhs7+ACOyhDnV
	 JyDrvxVoSTvsCznbYOV3wipjPwHcW2F4m7tqSU1CEbX+8B8rOV+hHoa5zRUW1VJ+sJ
	 VIblsAgLUco+jxksm6hS65rD4vV+Pl52IlNjmmqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0808BF8049E;
	Mon,  5 Dec 2022 14:21:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BB86F8049E; Mon,  5 Dec 2022 14:21:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3202AF8014C
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 14:21:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3202AF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="BqpFzupL"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="cQC6eP96"
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 752572260B;
 Mon,  5 Dec 2022 13:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670246487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pe3DPYrkMJAqI/+GF8n8S0goPx841PWsO0FySDB9gwU=;
 b=BqpFzupLs1c89CmDWJ3y+uu7ZXNXeaigEJ8AHGOr7JUhczFwDCnIKq9i3/xSPVC3ff7tvP
 V+5qVuKtTR9kzXFoL5W9fc1p1v9cffxhhcSo3xeQ+ta2pPGFChk1dAHXMns+6rSpD+S1/M
 Si2i4xZcpcZ9On+lZPGm+61pdElVKPw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670246487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pe3DPYrkMJAqI/+GF8n8S0goPx841PWsO0FySDB9gwU=;
 b=cQC6eP96CdkUhKPCRCfM2p+06trJQzuUwYEHudMsqVmKxG0OjB1vTVwqFlznP74ntlXCHI
 8Byaa+NRLIzfqmDQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5A1D513326;
 Mon,  5 Dec 2022 13:21:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id KOYdFVfwjWOZagAAGKfGzw
 (envelope-from <tiwai@suse.de>); Mon, 05 Dec 2022 13:21:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: pcm: Handle XRUN at trigger START
Date: Mon,  5 Dec 2022 14:21:23 +0100
Message-Id: <20221205132124.11585-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221205132124.11585-1-tiwai@suse.de>
References: <20221205132124.11585-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Carl Hetherington <lists@carlh.net>
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

When the driver returns -EPIPE for indicating an XRUN already at PCM
trigger START, we should treat properly and set it to the XRUN state.
Otherwise the state is missing and the application would try to issue
trigger again without knowing that it's in an error state.

This is just for a theoretical bug, and it won't happen in most
cases.

Link: https://lore.kernel.org/r/b4e71631-4a94-613-27b2-fb595792630@carlh.net
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index e3deec62b9a1..9c122e757efe 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1424,9 +1424,15 @@ static int snd_pcm_pre_start(struct snd_pcm_substream *substream,
 static int snd_pcm_do_start(struct snd_pcm_substream *substream,
 			    snd_pcm_state_t state)
 {
+	int err;
+
 	if (substream->runtime->trigger_master != substream)
 		return 0;
-	return substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_START);
+	err = substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_START);
+	/* XRUN happened during the start */
+	if (err == -EPIPE)
+		__snd_pcm_set_state(substream->runtime, SNDRV_PCM_STATE_XRUN);
+	return err;
 }
 
 static void snd_pcm_undo_start(struct snd_pcm_substream *substream,
-- 
2.35.3

