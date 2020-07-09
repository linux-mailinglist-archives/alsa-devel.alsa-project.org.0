Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C5F219EFD
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 13:20:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7969515E5;
	Thu,  9 Jul 2020 13:19:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7969515E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594293633;
	bh=5qqXd2Jv8yywg0B9hioCTzi5qtyfFlZlBFyBUTqDaMg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fdsx4VZBPhzfrdPmt+JINpdSBRN9xHOUuOfzCipVwnrutOq6TP8chq/7LcmN5nz5f
	 qJhmkr/KNMrWxVwnjigb29/v/mEkHJddd304RwBC82t6v7KfCNlD/hKnjp2Oky4OoE
	 l7tqySSzwEErROD+LKMF7pRbOX3YYeb6IPpTNULs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 909FCF80257;
	Thu,  9 Jul 2020 13:18:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E33EF802BD; Thu,  9 Jul 2020 13:18:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB015F8011F
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 13:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB015F8011F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CEB6AEA5;
 Thu,  9 Jul 2020 11:17:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: atmel: Remove invalid "fall through" comments
Date: Thu,  9 Jul 2020 13:17:48 +0200
Message-Id: <20200709111750.8337-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200709111750.8337-1-tiwai@suse.de>
References: <20200709111750.8337-1-tiwai@suse.de>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>
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

The comments about fall through in sound/atmel/ac97.c are just
superfluous and rather confusing.  Let's remove them.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/atmel/ac97c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index a62f1cdad68f..1006458f7f85 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -219,7 +219,7 @@ static int atmel_ac97c_playback_prepare(struct snd_pcm_substream *substream)
 	switch (runtime->format) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		break;
-	case SNDRV_PCM_FORMAT_S16_BE: /* fall through */
+	case SNDRV_PCM_FORMAT_S16_BE:
 		word &= ~(AC97C_CMR_CEM_LITTLE);
 		break;
 	default:
@@ -301,7 +301,7 @@ static int atmel_ac97c_capture_prepare(struct snd_pcm_substream *substream)
 	switch (runtime->format) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		break;
-	case SNDRV_PCM_FORMAT_S16_BE: /* fall through */
+	case SNDRV_PCM_FORMAT_S16_BE:
 		word &= ~(AC97C_CMR_CEM_LITTLE);
 		break;
 	default:
-- 
2.16.4

