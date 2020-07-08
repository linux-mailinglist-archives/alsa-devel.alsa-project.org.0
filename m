Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B5E2184D6
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 12:22:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4934A1670;
	Wed,  8 Jul 2020 12:21:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4934A1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594203737;
	bh=u5d1J8cKt6uvUD2dTzndH3U1+JIoqPC0PqLevjmBynY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OrVTpTN+/Dsce8U0ki7gQjHotmUCi49zkW1eB3lQ10fo7dQ3YQcM5Pk49oBDzxRBz
	 9XtwU4gs37+5/Y64dGzuOOk2F5ChWtPYrFmjgTN4jHfEkNdi6oYI1KRAxbVcFLpuVX
	 YYJnWTtwYYRxj9TEkyY8v/IDSkFi92hcZncf0Lvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62107F802DD;
	Wed,  8 Jul 2020 12:19:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DC3FF80150; Wed,  8 Jul 2020 12:19:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99D31F80258
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 12:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99D31F80258
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="11JBQfeY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jkfDC8SYLcRAPDATfR9VguvSs7UrKj28GPMRUIHZ24I=; b=11JBQfeY7m5NB3Yos6l/rkJNH1
 xs0OoPJhdDvD8OlI0PPRA64SgQtykG9AE0TCaXlmQFDX7RpCDvm1h7W3DoiWfvNk/rYyGh+0LlYFc
 NQjivSFTtNPYbI5jnmzD0z64fvC4IUlZXEQVJI1ZHGhAfwNgHxBCbMeED4P6GPfE/CeqvAPypYerg
 cOdaqL58nb7taWJDiHZtsxtvuHjtOpgjV/4YdFoW5WJ2RVm6TDQ6QI1Mmd7EveInsBb9uFvADznNd
 6MU73gIHzfBCgMGlpv38YJgwuhWeaEDCio/yxl3Bn28uCobxzYRqEK8b8k4oGILn/HGrIOlY3sJWc
 8LUflvEg==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jt7A8-0002Q2-G2; Wed, 08 Jul 2020 11:18:48 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jt7A8-0000uX-4X; Wed, 08 Jul 2020 11:18:48 +0100
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 3/5] echoaudio: Prevent races in calls to set_audio_format()
Date: Wed,  8 Jul 2020 11:18:46 +0100
Message-Id: <20200708101848.3457-3-mark@xwax.org>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <2007081115280.3085@stax.localdomain>
References: <2007081115280.3085@stax.localdomain>
Cc: alsa-devel@alsa-project.org
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

The function uses chip->comm_page which needs locking against
other use at the same time.

Signed-off-by: Mark Hills <mark@xwax.org>
---
 sound/pci/echoaudio/echoaudio.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 82a49dfd2384..19002d785d8d 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -711,9 +711,22 @@ static int pcm_prepare(struct snd_pcm_substream *substream)
 
 	if (snd_BUG_ON(pipe_index >= px_num(chip)))
 		return -EINVAL;
-	if (snd_BUG_ON(!is_pipe_allocated(chip, pipe_index)))
+
+	/*
+	 * We passed checks we can do independently; now take
+	 * exclusive control
+	 */
+
+	spin_lock_irq(&chip->lock);
+
+	if (snd_BUG_ON(!is_pipe_allocated(chip, pipe_index))) {
+		spin_unlock(&chip->lock);
 		return -EINVAL;
+	}
+
 	set_audio_format(chip, pipe_index, &format);
+	spin_unlock_irq(&chip->lock);
+
 	return 0;
 }
 
-- 
2.17.5

