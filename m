Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 603B459DB0A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 13:59:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 298881638;
	Tue, 23 Aug 2022 13:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 298881638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661255971;
	bh=C1BMA+oajfykmDSKVt/GGLxX3Segr9izj69AIN4edBI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wr8hirX1Gbb9COQpgAwi/iVO1GYShGmx8mbbZ6Ir55iFCIogojLmcFtvVf/ROZxoV
	 5/OAn28oncXB0wtz2ohLsELG/ljoRv582xekuBpnTQTIc4LBgrFBov4m7jEj2SmQkU
	 ZMfuhelBrbBVkvrxmpWbex3EKZriGyp/vRXJAFzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9265F8052D;
	Tue, 23 Aug 2022 13:57:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75AB8F8052D; Tue, 23 Aug 2022 13:57:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 758CAF8020D
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 13:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 758CAF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="JCPBQ5OU"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="4b7tptFp"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 31CCC336D1;
 Tue, 23 Aug 2022 11:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661255864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gxr8Ly5IK/o0TT3qgwNuWi7ShMLbZpLRgUMkaHLTuV0=;
 b=JCPBQ5OUjkRsg8TIfieWG0x7tExAong8obZ90uFgTWXBtVvzzB+z991LqKhXJy7RARO4fS
 Ls+kR6lnZcqaCUzUJkLugwrfLoFNiSBLhg8PBwnz+jdWuZr+ouLrBbpn0jSq4PeqU2lsUT
 k6qrgvzzdjvcxPj1s5vkFEkctPqGRxg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661255864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gxr8Ly5IK/o0TT3qgwNuWi7ShMLbZpLRgUMkaHLTuV0=;
 b=4b7tptFp8L3u0RbCtynJCICW0+EYqFmpDMxSHUyeaqalkKEmP38VxUnGNrbcekCp4GxyJE
 uY73JYjXq4wtgyCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A75013AE6;
 Tue, 23 Aug 2022 11:57:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gMfaBbjABGP1OAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 23 Aug 2022 11:57:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: Intel: sst: Switch to standard device pages
Date: Tue, 23 Aug 2022 13:57:38 +0200
Message-Id: <20220823115740.14123-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220823115740.14123-1-tiwai@suse.de>
References: <20220823115740.14123-1-tiwai@suse.de>
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

ASoC Atom SST driver is using the continuous RAM pages with GFP_DMA
flag for its PCM buffer, but this should work fine with the standard
DMA pages.  As a part of cleanup work, this patch replaces the buffer
allocation to the standard device pages with SNDRV_DMA_TYPE_DEV.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index a56dd48c045f..c75616a5fd0a 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -676,10 +676,9 @@ static int sst_soc_pcm_new(struct snd_soc_component *component,
 
 	if (dai->driver->playback.channels_min ||
 			dai->driver->capture.channels_min) {
-		snd_pcm_set_managed_buffer_all(pcm,
-			SNDRV_DMA_TYPE_CONTINUOUS,
-			snd_dma_continuous_data(GFP_DMA),
-			SST_MIN_BUFFER, SST_MAX_BUFFER);
+		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+					       pcm->card->dev,
+					       SST_MIN_BUFFER, SST_MAX_BUFFER);
 	}
 	return 0;
 }
-- 
2.35.3

