Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F44D5EA7C1
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 15:58:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D1C9851;
	Mon, 26 Sep 2022 15:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D1C9851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664200725;
	bh=Uccr4YyUj7vZniAI5fU0V9h6+bQNLVS5JSs1/w17tik=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FpKZxWV88k5uEln9ECcBJiQ6uz6MBb1hdkytJ2cDP8NO6AtGPgYZsvqfKHHYYETbq
	 g+auBySgkz3zsBwf7h4wUoQPyr/2DvtP95PF28DPicamb5V4Z9fRlrcpMZXiMygTrW
	 mw4stGmkr8i+0j6V+trL2gMDj3ZUeCp1iJSvJlvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41978F80567;
	Mon, 26 Sep 2022 15:56:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0E1FF80533; Mon, 26 Sep 2022 15:56:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CCD5F80510
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 15:56:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CCD5F80510
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="FAIVkDDZ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="7+UWxNfB"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5F61D21DD9;
 Mon, 26 Sep 2022 13:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664200572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMBvjXiwif1lo9Oaph82DIjE8x4f5cq1uGIADLmH+0E=;
 b=FAIVkDDZnAWvknUGgwFd1ffySdIb3WzQPcCYWZ3FS3Np86oW42BGt5OHzFdMHUssQ7jkN7
 auuyyLzNlYOHDi2ZctJsIKIfFdE7PMpoQZQBEEJeDZQjIPJzLMXReccBqc9BRAy5+GoMhu
 m0XdZnYdjmF3C+GbF5DRm3b4pSEdH24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664200572;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMBvjXiwif1lo9Oaph82DIjE8x4f5cq1uGIADLmH+0E=;
 b=7+UWxNfBT/iE2nj2AknyteGLH3hI5w/igQf3eYeoxniNZoQMITMN1f76I3p511ofXcNO9A
 Fk0OdlPYyWQICHBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3BB64139BD;
 Mon, 26 Sep 2022 13:56:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qPrRDXyvMWPxegAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 26 Sep 2022 13:56:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/11] ALSA: hda: Replace runtime->status->state reference to
 runtime->state
Date: Mon, 26 Sep 2022 15:55:52 +0200
Message-Id: <20220926135558.26580-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220926135558.26580-1-tiwai@suse.de>
References: <20220926135558.26580-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

The recent change in ALSA core allows drivers to get the current PCM
state directly from runtime object.  Replace the calls accordingly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/hdmi_chmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/hdmi_chmap.c b/sound/hda/hdmi_chmap.c
index aad5c4bf4d34..5d8e1d944b0a 100644
--- a/sound/hda/hdmi_chmap.c
+++ b/sound/hda/hdmi_chmap.c
@@ -774,7 +774,7 @@ static int hdmi_chmap_ctl_put(struct snd_kcontrol *kcontrol,
 	substream = snd_pcm_chmap_substream(info, ctl_idx);
 	if (!substream || !substream->runtime)
 		return 0; /* just for avoiding error from alsactl restore */
-	switch (substream->runtime->status->state) {
+	switch (substream->runtime->state) {
 	case SNDRV_PCM_STATE_OPEN:
 	case SNDRV_PCM_STATE_SETUP:
 		break;
-- 
2.35.3

