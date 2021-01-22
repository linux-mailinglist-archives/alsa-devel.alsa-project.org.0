Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EDC300608
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 15:51:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6C121F0F;
	Fri, 22 Jan 2021 15:50:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6C121F0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611327097;
	bh=8HSsi4K7hqfkuCAcYutMTTD+GmtCBFy6vsJyYqltlos=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lNvv4mTTKjg6tVj9qIskJPE4GVJFPWsCSIh5ScUTCGK2ir/JwMhlCpYqdA9r+gap3
	 1gWCMGQV/+DDVadEJqu/YAw7wYVjABAavnjogJtDQdpNWRNGn9+kPSXPBLYVt4bNhh
	 um8jwWvfCzt2rp53ZAI1WR9VR7l4rIaXZ3JXH2TY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 970F3F804CC;
	Fri, 22 Jan 2021 15:49:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B23DF80253; Fri, 22 Jan 2021 15:48:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C257AF8019D
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 15:48:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C257AF8019D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9F0F1AE05;
 Fri, 22 Jan 2021 14:48:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 3/4] pcm: null: Pass appl_ptr and hw_ptr in
 snd_pcm_status()
Date: Fri, 22 Jan 2021 15:48:41 +0100
Message-Id: <20210122144842.8843-4-tiwai@suse.de>
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

Just like the previous fix for ioplug, the null plugin also misses the
appl_ptr and hw_ptr updates for snd_pcm_status().  Fix it as well.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/pcm/pcm_null.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/pcm/pcm_null.c b/src/pcm/pcm_null.c
index 1d81548569f0..c8ea9b38785f 100644
--- a/src/pcm/pcm_null.c
+++ b/src/pcm/pcm_null.c
@@ -96,6 +96,8 @@ static int snd_pcm_null_status(snd_pcm_t *pcm, snd_pcm_status_t * status)
 	memset(status, 0, sizeof(*status));
 	status->state = null->state;
 	status->trigger_tstamp = null->trigger_tstamp;
+	status->appl_ptr = *pcm->appl.ptr;
+	status->hw_ptr = *pcm->hw.ptr;
 	gettimestamp(&status->tstamp, pcm->tstamp_type);
 	status->avail = snd_pcm_null_avail_update(pcm);
 	status->avail_max = pcm->buffer_size;
-- 
2.26.2

