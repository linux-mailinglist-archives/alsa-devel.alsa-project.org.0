Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7F711806C
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:27:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D114D167B;
	Tue, 10 Dec 2019 07:27:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D114D167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575959273;
	bh=vHHLw35YBF2Wkk4eAsNHF2A6PFbjObte57rNADg3eP0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nNrZn3SuZWbRDx5Tof0D/atvTN2YapB8MCmZTgdLxEgYVkXX7QyovYHhaT7jxwfSD
	 vSXBXCh56uRJpzBTnSdJmMH1WIg6Q+6lSDzRw9AtCLYLCZElG4Uw+LtX1BYVX1zHoC
	 iNUFdRjzgzRU7vKtk+/ET2/5Mf4LTTCD2/WZ36j0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 672E4F8034C;
	Tue, 10 Dec 2019 07:13:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A7A3F802EA; Tue, 10 Dec 2019 07:13:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DBA7F80264
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:11:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DBA7F80264
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6DF9CB2F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:11:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:11:42 +0100
Message-Id: <20191210061145.24641-21-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210061145.24641-1-tiwai@suse.de>
References: <20191210061145.24641-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 20/23] ALSA: spi: Drop superfluous ioctl PCM ops
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/spi/at73c213.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/spi/at73c213.c b/sound/spi/at73c213.c
index 8b1b5c86cebf..77563baf7a8f 100644
--- a/sound/spi/at73c213.c
+++ b/sound/spi/at73c213.c
@@ -316,7 +316,6 @@ snd_at73c213_pcm_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops at73c213_playback_ops = {
 	.open		= snd_at73c213_pcm_open,
 	.close		= snd_at73c213_pcm_close,
-	.ioctl		= snd_pcm_lib_ioctl,
 	.hw_params	= snd_at73c213_pcm_hw_params,
 	.prepare	= snd_at73c213_pcm_prepare,
 	.trigger	= snd_at73c213_pcm_trigger,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
