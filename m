Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7123005FB
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 15:50:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEB9C1F0E;
	Fri, 22 Jan 2021 15:49:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEB9C1F0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611327028;
	bh=WhUGQaGGsyrJxfqOrynii8drEhuZP3gCb5oJiqEncJo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IpbZZ2i49j6UnErEMxiGvSmj7r4RynIsUsWjkTWzNhXOoP/y+xhcHhTBXe1tcoRp1
	 WHpTMRay2FrLtnZhuSAbXVwK1Y4t5jHH00zUZJSKbKyRlNqa+gPaicmW2pYS4jpcsU
	 vM5cQleQ62A2uX040ArZn4RjUtBC+5K7RhtEMFr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3035CF80164;
	Fri, 22 Jan 2021 15:48:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E94E1F80227; Fri, 22 Jan 2021 15:48:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9C63F80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 15:48:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9C63F80164
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2506AE6D;
 Fri, 22 Jan 2021 14:48:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 4/4] pcm: share: Pass appl_ptr and hw_ptr in
 snd_pcm_status()
Date: Fri, 22 Jan 2021 15:48:42 +0100
Message-Id: <20210122144842.8843-5-tiwai@suse.de>
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

This one also has the same problem as others; the appl_ptr and hw_ptr
of share plugin aren't updated in snd_pcm_status() call.  Fix it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/pcm/pcm_share.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/pcm/pcm_share.c b/src/pcm/pcm_share.c
index bff9507d6422..72509491b366 100644
--- a/src/pcm/pcm_share.c
+++ b/src/pcm/pcm_share.c
@@ -711,6 +711,8 @@ static int snd_pcm_share_status(snd_pcm_t *pcm, snd_pcm_status_t *status)
  _notrunning:
 	status->delay = sd + d;
 	status->state = share->state;
+	status->appl_ptr = *pcm->appl.ptr;
+	status->hw_ptr = *pcm->hw.ptr;
 	status->trigger_tstamp = share->trigger_tstamp;
  _end:
 	Pthread_mutex_unlock(&slave->mutex);
-- 
2.26.2

