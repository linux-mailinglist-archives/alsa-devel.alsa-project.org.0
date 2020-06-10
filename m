Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5643E1F51EB
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 12:10:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C28FA1663;
	Wed, 10 Jun 2020 12:09:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C28FA1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591783824;
	bh=rTYYQzi6+u4P8XdgsIltFuVZXj5TrAlU7/DVwDQxYQo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RuD/V8K1DMzbDYRTAbD7Q/ArykWoB85kClK6/mrM8JYSkpHLzb26D8mQX1wObbhps
	 cDyapyoRROLy/Igk4V2pGPN9y9dU1cDNWXRTXVllYYEsxOKLznx/tT70/ukFXaoOSE
	 6buBX9zJPtjuCTxYyQLnV/zbEFmFltP4j/9KaXYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F404FF80088;
	Wed, 10 Jun 2020 12:08:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D79F0F80088; Wed, 10 Jun 2020 12:08:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF41EF80088
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 12:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF41EF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DvnUv3KU"
Received: by mail-wr1-x444.google.com with SMTP id c3so1546135wru.12
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 03:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4WcGKmG4Em8CGRb1sOMBrhLYqKdA8bExoZ3wWUVyJW4=;
 b=DvnUv3KU4S8Lh5Uv8DrTXTyD2Uj2tPoCzCpgSJuoIIi5t8AAL6UWyXNqU6dvIfmiVP
 5ewlP1kMqc2IQyDUCGfTmoSGbTIdCHvOdbzKVlaYO+cBe3jKihid/K3MxumsSXd3PJgn
 pfaAQ/6v6vV79Nsm2WX4v4XsXm/5tP1gl9vALFZ5Yw2wMuaBbiQ+7jjIqAfG3PVowqGo
 PE3Rq4djozkWLBSSO/0hFnCh3edPks5UY4kHeeM/T5ejDkYUWJTV2Sip3DdDB+PNegNO
 Y0iPXY/M/Gt++1lOp4EebQ/1EdyqmlpnLB2QQre5lYnaD7Ig5AxPa+mtI9E13T+fuwEF
 EUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4WcGKmG4Em8CGRb1sOMBrhLYqKdA8bExoZ3wWUVyJW4=;
 b=tDairnm97JJx8cZQ81scEv4q7ixUv2u5hh195Eoy5shMsFanKS5aabG/uthE9NxWgV
 TVYq6V4ywfLFMDi/K932TOoLv1b+uVokIBhPBfD5SIPQsU4xbGIl+vMvZX3J84H5+BEH
 1tZ6291GwBzgtUvqWbcZVC/IEx+j0XdjN3SXb/IC7a7KEpsiGBr6ng6uzJ1y8A38jKWm
 tG2Vv2k7wUGiPYsTkoNu7V+IyWpnOeYeBgprpuYlueS2iPNY8gUZFIDuYgnxwtCLaPJR
 N6eS2qeyDuhSO8D1mIpo0NFVDl9fo0b1PTFAb11b+FlOFZjuvmknJaMU47zoTkimq+v3
 K57g==
X-Gm-Message-State: AOAM532Gx2xPTwkTyFceTHI6dc7lwcmRyu/nzu6uBtdTLQSlpNkjqSQv
 B4H5I2TlVKsQvTlvRt7Pjxd5sg==
X-Google-Smtp-Source: ABdhPJw09wktHVTyjsGCacuk2gE1D/IgwGZO8zvrddmzIg9nGy2ATklylYksTfUUgBkSifQjEwm+hw==
X-Received: by 2002:adf:e40c:: with SMTP id g12mr2808457wrm.121.1591783709471; 
 Wed, 10 Jun 2020 03:08:29 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id b14sm2755955wmb.20.2020.06.10.03.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 03:08:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [RFC PATCH] ALSA: compress: Fix gapless playback state machine
Date: Wed, 10 Jun 2020 11:07:29 +0100
Message-Id: <20200610100729.362-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

For gapless playback call to snd_compr_drain_notify() after
partial drain should put the state to SNDRV_PCM_STATE_RUNNING
rather than SNDRV_PCM_STATE_SETUP as the driver is ready to
process the buffers for new track.

With existing code, if we are playing 3 tracks in gapless, after
partial drain finished on previous track 1 the state is set to
SNDRV_PCM_STATE_SETUP which is then moved to SNDRV_PCM_STATE_PREPARED
after data write. With this state calls to snd_compr_next_track() and
few other calls will fail as they expect the state to be in
SNDRV_PCM_STATE_RUNNING.

Here is the sequence of events and state transitions:

1. set_params (Track 1), state =  SNDRV_PCM_STATE_SETUP
2. set_metadata (Track 1), no state change, state = SNDRV_PCM_STATE_SETUP
3. fill and trigger start (Track 1), state = SNDRV_PCM_STATE_RUNNING
4. set_next_track (Track 2), state = SNDRV_PCM_STATE_RUNNING
5. partial_drain (Track 1), state = SNDRV_PCM_STATE_SETUP
6  snd_compr_drain_notify (Track 1), state = SNDRV_PCM_STATE_SETUP
7. fill data (Track 2), state = SNDRV_PCM_STATE_PREPARED
8. set_metadata (Track 3), no state change, state = SNDRV_PCM_STATE_PREPARED
9. set_next_track (Track 3), !! FAILURE as state != SNDRV_PCM_STATE_RUNNING

Fixes: f44f2a5417b2 ("ALSA: compress: fix drain calls blocking other compress functions (v6)")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---

I wonder who did gapless work on upstream so far?

 include/sound/compress_driver.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index 6ce8effa0b12..eabac33864c2 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -182,7 +182,7 @@ static inline void snd_compr_drain_notify(struct snd_compr_stream *stream)
 	if (snd_BUG_ON(!stream))
 		return;
 
-	stream->runtime->state = SNDRV_PCM_STATE_SETUP;
+	stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
 
 	wake_up(&stream->runtime->sleep);
 }
-- 
2.21.0

