Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 747885EA7CE
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 16:00:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05858AE9;
	Mon, 26 Sep 2022 15:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05858AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664200820;
	bh=tRwd3ICmjZgFBsVtXsRJ1xm74c43hKqyoIxkd0NfRB0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XKYy3jQ3DeqOjOkROoBYrPEqBwRV+wmgcEDqEbMZAFc8OtvJrdNR3cm4hIyeAd3eF
	 FU3rWp1EfmvCZM04i3Kybrsmh+Uot+hf9zS+I9jIOxfCiKnvUwvDP5+18xoMdsCj+d
	 5uUUqvQ/4YrWd5KoIclYS6XVSC9zLA8osr9g6gTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20416F805AC;
	Mon, 26 Sep 2022 15:56:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB876F8053D; Mon, 26 Sep 2022 15:56:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0689AF8053D
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 15:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0689AF8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="QkOyaa9l"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="/1w3rVOx"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8568A1F8A3;
 Mon, 26 Sep 2022 13:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664200576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7HQ+mNS2SLZQ5EQpkbWXY32NZiwFQkSXqOxocm7fzQ=;
 b=QkOyaa9l9c7t1G4pXFyrQNWSm5UsaPqf/6ro+AcYbwaop2tHmGPqwdH5CDD/Sb/RIUUwT1
 VIuysLFABqy63yFT9nFbV378fgf3QVeyFsCN8jSCDG655bD8bUdc+H3PIoM0s547cLtwqU
 ViluvD9jRsjQ2AP1ByekHL7eBIhxGLM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664200576;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7HQ+mNS2SLZQ5EQpkbWXY32NZiwFQkSXqOxocm7fzQ=;
 b=/1w3rVOxfr0gXescLlRn1nTqXftYR98NBn6D52uEvegDEfjxxc6qr9KBV5o2tKO4S7GG59
 XLlevqdWyhZvGCBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 675CA139BD;
 Mon, 26 Sep 2022 13:56:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UGKPGICvMWPxegAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 26 Sep 2022 13:56:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/11] ASoC: sh: Replace runtime->status->state reference to
 runtime->state
Date: Mon, 26 Sep 2022 15:55:57 +0200
Message-Id: <20220926135558.26580-11-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220926135558.26580-1-tiwai@suse.de>
References: <20220926135558.26580-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
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

Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

I'm going to merge this through my sound git tree as it requires ALSA
core changes.

 sound/soc/sh/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 7ace0c0db5b1..5d6bae33ae34 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -598,7 +598,7 @@ static int rz_ssi_dma_transfer(struct rz_ssi_priv *ssi,
 		return -EINVAL;
 
 	runtime = substream->runtime;
-	if (runtime->status->state == SNDRV_PCM_STATE_DRAINING)
+	if (runtime->state == SNDRV_PCM_STATE_DRAINING)
 		/*
 		 * Stream is ending, so do not queue up any more DMA
 		 * transfers otherwise we play partial sound clips
-- 
2.35.3

