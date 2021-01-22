Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C317C3005FC
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 15:50:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C0D11F19;
	Fri, 22 Jan 2021 15:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C0D11F19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611327043;
	bh=sy6UfY/Z060MCJ4m3YkqZeAoL32elhRoq5gAJLe+dB0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=koQ98K9eUQXgSQVPOxzgjb7jjhE5y0amLDn+IiEsd2FNyU9r0SV42veR0Pi9vI2mY
	 8hgWrKlOyCYo+LZnwb8wXieJrK6lVkH1WuQQrODniWQVLXRZQdCLcxX1S83f6bLkI7
	 09uCRqMyqwBdAI7bXQhqVjyvkekScIv96e6r7f6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E0ECF80290;
	Fri, 22 Jan 2021 15:48:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11659F80129; Fri, 22 Jan 2021 15:48:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2694F80129
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 15:48:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2694F80129
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 933DDADA2;
 Fri, 22 Jan 2021 14:48:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 2/4] pcm: ioplug: Pass appl_ptr and hw_ptr in
 snd_pcm_status()
Date: Fri, 22 Jan 2021 15:48:40 +0100
Message-Id: <20210122144842.8843-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210122144842.8843-1-tiwai@suse.de>
References: <20210122144842.8843-1-tiwai@suse.de>
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

The snd_pcm_status() of the ioplug doesn't return the current
positions of hw_ptr and appl_ptr as advertised.  Fix it by copying the
current values stored in the plugin data.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/pcm/pcm_ioplug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/pcm/pcm_ioplug.c b/src/pcm/pcm_ioplug.c
index e141b1f98da7..a1463bf6b50a 100644
--- a/src/pcm/pcm_ioplug.c
+++ b/src/pcm/pcm_ioplug.c
@@ -133,6 +133,8 @@ static int snd_pcm_ioplug_status(snd_pcm_t *pcm, snd_pcm_status_t * status)
 	gettimestamp(&status->tstamp, pcm->tstamp_type);
 	status->avail = snd_pcm_mmap_avail(pcm);
 	status->avail_max = io->avail_max;
+	status->appl_ptr = *pcm->appl.ptr;
+	status->hw_ptr = *pcm->hw.ptr;
 	if (snd_pcm_ioplug_delay(pcm, &sd) < 0)
 		sd = snd_pcm_mmap_delay(pcm);
 	status->delay = sd;
-- 
2.26.2

