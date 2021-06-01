Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0519E39780E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 18:28:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8D6316F5;
	Tue,  1 Jun 2021 18:27:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8D6316F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622564902;
	bh=H7O8ZrpSIMZCHAO7xg+mjTrB/WExa5vGbRhdS1i7do4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kP1oYbp6e8ZaJ+8y6260UW3eKjiAi1hBUaa5vL9Vg86hka8x24JBIoVWBCEKyabOO
	 cZA9/EYqFU+9KK29gab/a3AfkZy1cg8iLBexhJKqtps97Ys0lK/tLwKv6DEf/s15WL
	 87GP91IUmVXnWy1tNNAE49glCLkMcrmQFqrwBpG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4B8AF804D6;
	Tue,  1 Jun 2021 18:25:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2228F804C3; Tue,  1 Jun 2021 18:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D904CF80253
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 18:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D904CF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="pdNlqkSP"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="mr02ufPg"
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9A76121961
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622564698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pvViDmprfGU02rol3x9WrN2xdF73SjXD0su7HbsJeks=;
 b=pdNlqkSPm5EaB+hwy+TyNPdW7473zPQhWzxsaR1rajnPBH0wsONULQVUhlpAuqKZp/VK5Z
 4qlRrNJCmO8jh63KlLnKRVhMsMqmxs5+RgPBC2zNLKtMd6gRvet/yr7Ji8sSK31XkybBeA
 fZyTHJHnkgvmvt8RwWFAczpOnTUuFrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622564698;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pvViDmprfGU02rol3x9WrN2xdF73SjXD0su7HbsJeks=;
 b=mr02ufPg4PYJehBXTM0f7OVF2mkOf1yCnkRNG2nSTTTWeNFGaInQlO1eEuPG1uysvGVOEE
 bzRjO/jXfwgBMaCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 8B273A3B87;
 Tue,  1 Jun 2021 16:24:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ALSA: usb-audio: Make snd_usb_pcm_delay() static
Date: Tue,  1 Jun 2021 18:24:53 +0200
Message-Id: <20210601162457.4877-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601162457.4877-1-tiwai@suse.de>
References: <20210601162457.4877-1-tiwai@suse.de>
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

It's a local function, let's make it static.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 4 ++--
 sound/usb/pcm.h | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index e5311b6bb3f6..359c759a7023 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -29,8 +29,8 @@
 #define SUBSTREAM_FLAG_SYNC_EP_STARTED	1
 
 /* return the estimated delay based on USB frame counters */
-snd_pcm_uframes_t snd_usb_pcm_delay(struct snd_usb_substream *subs,
-				    unsigned int rate)
+static snd_pcm_uframes_t snd_usb_pcm_delay(struct snd_usb_substream *subs,
+					   unsigned int rate)
 {
 	int current_frame_number;
 	int frame_diff;
diff --git a/sound/usb/pcm.h b/sound/usb/pcm.h
index 06c586467d3f..493a4e34d78d 100644
--- a/sound/usb/pcm.h
+++ b/sound/usb/pcm.h
@@ -2,9 +2,6 @@
 #ifndef __USBAUDIO_PCM_H
 #define __USBAUDIO_PCM_H
 
-snd_pcm_uframes_t snd_usb_pcm_delay(struct snd_usb_substream *subs,
-				    unsigned int rate);
-
 void snd_usb_set_pcm_ops(struct snd_pcm *pcm, int stream);
 int snd_usb_pcm_suspend(struct snd_usb_stream *as);
 int snd_usb_pcm_resume(struct snd_usb_stream *as);
-- 
2.26.2

