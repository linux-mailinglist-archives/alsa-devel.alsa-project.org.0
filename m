Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA4117BB0D
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 12:00:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 260B815E4;
	Fri,  6 Mar 2020 11:59:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 260B815E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583492448;
	bh=0BoSuDkKdTZ5ucTEhaDW1Vq5B/jeJzGjeBWh0aCUjVI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lqffqnhq/gWPWfLN0dPw8ViUEm3ldeY1iJ3wdrpaKp0rPyIfpC+lytlrJW9xTo7Ub
	 o8IEkff0FUFbyPh6sasCNQBnpZIEaRgsdr37Wyfu+NT/3ZKtKBpnDycai0g0om+aEU
	 2RQ4aTlwZy0exSeoZ2DhHNP2vt3rjI1Yj8IYNfIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10260F80126;
	Fri,  6 Mar 2020 11:59:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 738A0F801ED; Fri,  6 Mar 2020 11:59:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D246F8012D
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 11:58:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D246F8012D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E5273AC50;
 Fri,  6 Mar 2020 10:58:56 +0000 (UTC)
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: sgio2audio: Remove usage of dropped hw_params/hw_free
 functions
Date: Fri,  6 Mar 2020 11:58:37 +0100
Message-Id: <20200306105837.31523-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.25.0
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

Commit ee88f4ebe575 ("ALSA: mips: Use managed buffer allocation") removed
superfluous hw_params/hw_free callbacks, but forgot to remove them where
they were used.

Fixes: ee88f4ebe575 ("ALSA: mips: Use managed buffer allocation")
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 sound/mips/sgio2audio.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/mips/sgio2audio.c b/sound/mips/sgio2audio.c
index 9f60a5037f8b..5bf1ea150f26 100644
--- a/sound/mips/sgio2audio.c
+++ b/sound/mips/sgio2audio.c
@@ -649,8 +649,6 @@ snd_sgio2audio_pcm_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_sgio2audio_playback1_ops = {
 	.open =        snd_sgio2audio_playback1_open,
 	.close =       snd_sgio2audio_pcm_close,
-	.hw_params =   snd_sgio2audio_pcm_hw_params,
-	.hw_free =     snd_sgio2audio_pcm_hw_free,
 	.prepare =     snd_sgio2audio_pcm_prepare,
 	.trigger =     snd_sgio2audio_pcm_trigger,
 	.pointer =     snd_sgio2audio_pcm_pointer,
@@ -659,8 +657,6 @@ static const struct snd_pcm_ops snd_sgio2audio_playback1_ops = {
 static const struct snd_pcm_ops snd_sgio2audio_playback2_ops = {
 	.open =        snd_sgio2audio_playback2_open,
 	.close =       snd_sgio2audio_pcm_close,
-	.hw_params =   snd_sgio2audio_pcm_hw_params,
-	.hw_free =     snd_sgio2audio_pcm_hw_free,
 	.prepare =     snd_sgio2audio_pcm_prepare,
 	.trigger =     snd_sgio2audio_pcm_trigger,
 	.pointer =     snd_sgio2audio_pcm_pointer,
@@ -669,8 +665,6 @@ static const struct snd_pcm_ops snd_sgio2audio_playback2_ops = {
 static const struct snd_pcm_ops snd_sgio2audio_capture_ops = {
 	.open =        snd_sgio2audio_capture_open,
 	.close =       snd_sgio2audio_pcm_close,
-	.hw_params =   snd_sgio2audio_pcm_hw_params,
-	.hw_free =     snd_sgio2audio_pcm_hw_free,
 	.prepare =     snd_sgio2audio_pcm_prepare,
 	.trigger =     snd_sgio2audio_pcm_trigger,
 	.pointer =     snd_sgio2audio_pcm_pointer,
-- 
2.25.0

