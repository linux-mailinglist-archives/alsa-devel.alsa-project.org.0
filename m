Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5DA2DE6B4
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 16:35:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0E63177A;
	Fri, 18 Dec 2020 16:34:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0E63177A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608305749;
	bh=atWTPFU8xdkHVs1DkeXDbd7kWFeJrNk2wZir06la9Ak=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HOUMmKgO/h8/dqyVViHksqV48ub72kcvevjux69xVcOyjsKBiJhFgtmDOdD08jKTP
	 WiFsdj2OZzt9KecUj4ZFIpYmakpGyLuc/ZH/fHyeC8vsd4drXYaXusGHaRo8nnNGi9
	 D0cyJjivZ04a08p/Bj5kk935qijbVsvmU0eupSW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F363F801F7;
	Fri, 18 Dec 2020 16:34:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49206F80171; Fri, 18 Dec 2020 16:34:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60AD0F80103
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 16:34:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60AD0F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="GsOvEvwc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=LN3JRau4TbdwcG8poHgN+0eJlipXw7hfW1lT5BgfLBs=; b=GsOvEvwcVZqfpXPl0YWrNC217s
 JThKHtU5VrmkkOj5PvPBgawn9cjsmgmcKRnY+DWOTz2wkBR5MJUj7OSI4T+7RdqT1batdNfGFmlpo
 NiB0rDF4sGq9HFE+5YoWytsLp+T+JVN6TO5EPA6bIbGFYzsLCe6tPWq2bHF8NcpSMmwC2Z2bwvwWM
 VRF1PO/cjlUnmLd6NcBN25IbMYBFa5/NSnHIQk80GbDPtMjjxqhSaCQzxoIBGxX9ix1HR/6VEAwGg
 OVFJHqYw+ELjiOWiK9cI0Zvfelw+7eRHOYWvoW0KnS2wwzChmtawcUUscS7d4Zu4uGQSdC90l6P2Z
 jg8Epzmw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kqHle-000DLI-2l; Fri, 18 Dec 2020 16:34:06 +0100
Received: from [62.216.202.54] (helo=lars-desktop.fritz.box)
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kqHld-00014w-Uj; Fri, 18 Dec 2020 16:34:05 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: pcm: Remove snd_pcm_lib_preallocate_dma_free()
Date: Fri, 18 Dec 2020 16:34:00 +0100
Message-Id: <20201218153400.18394-1-lars@metafoo.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26021/Fri Dec 18 13:56:31 2020)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>
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

Since commit d4cfb30fce03 ("ALSA: pcm: Set per-card upper limit of PCM
buffer allocations") snd_pcm_lib_preallocate_dma_free() is a single line
function that has one caller, which is another single line function.

Clean this up a bit and remove snd_pcm_lib_preallocate_dma_free() and
directly call do_free_pages() from snd_pcm_lib_preallocate_free(). This is
a bit less boilerplate.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 sound/core/pcm_memory.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 4f03ba8ed0ae..ee6e9c5eec45 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -89,14 +89,6 @@ static int preallocate_pcm_pages(struct snd_pcm_substream *substream, size_t siz
 	return 0;
 }
 
-/*
- * release the preallocated buffer if not yet done.
- */
-static void snd_pcm_lib_preallocate_dma_free(struct snd_pcm_substream *substream)
-{
-	do_free_pages(substream->pcm->card, &substream->dma_buffer);
-}
-
 /**
  * snd_pcm_lib_preallocate_free - release the preallocated buffer of the specified substream.
  * @substream: the pcm substream instance
@@ -105,7 +97,7 @@ static void snd_pcm_lib_preallocate_dma_free(struct snd_pcm_substream *substream
  */
 void snd_pcm_lib_preallocate_free(struct snd_pcm_substream *substream)
 {
-	snd_pcm_lib_preallocate_dma_free(substream);
+	do_free_pages(substream->pcm->card, &substream->dma_buffer);
 }
 
 /**
-- 
2.20.1

