Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3335F38DAA0
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 11:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C4AC16C9;
	Sun, 23 May 2021 11:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C4AC16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621761165;
	bh=6VsCuwe2+99hS2ycwU8Xe/loV4dezW2/8PoWkR8YQ2w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ax3a4nA4nba0ii83NiC9YhSIRJIllhnR18AMRcTgMcDsDVEvbaBnj/TlQa1B5oVsj
	 mKAS9UJLMayz7CggxGs8KsOg5/ofhxT6UysVl/IGYc2awYcq/m6Rvs3atsQK0qHKGk
	 yMolIrFOEtvimeiTSXD5QElxt5Hu/t/OGgjHtfWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14159F804AF;
	Sun, 23 May 2021 11:09:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72717F80475; Sun, 23 May 2021 11:09:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5182FF8026F
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 11:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5182FF8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="O1unDZZY"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="J/tkbUfh"
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621760963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KWTghrdRecU/kT8IHPl0fXrYPcOhNh8B9pIxV8vnsUk=;
 b=O1unDZZYANx2ptoqHGvrAC9rpcYpJM5XZQ0dZ/29/y4KHFvgNMRf3VqGNRYzRw2EsbyCnp
 TnCkixlbc0jurOBESrAJPYbbachs2TCnqTA/T6Tp/4Z/m6S1uRlCia83UP8nViKaCrQwSj
 M8vVTm/KaJhgG7Q1EmyrxMFlAS8uJoM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621760963;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KWTghrdRecU/kT8IHPl0fXrYPcOhNh8B9pIxV8vnsUk=;
 b=J/tkbUfhva2VTk8kqWPtB4LQYSkFDFEK61RBPlQdQJsR5W1kr3QRw5jT39NO7Fw1YCa0NX
 BljXQxSKmQevKeCA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30089AC8F;
 Sun, 23 May 2021 09:09:23 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 6/6] ALSA: pcm: Block the release until the system resume
 finishes
Date: Sun, 23 May 2021 11:09:20 +0200
Message-Id: <20210523090920.15345-7-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210523090920.15345-1-tiwai@suse.de>
References: <20210523090920.15345-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

The normal PCM operations are already blocked during the card power
off state in the PCM common ioctl handler, but the release isn't
covered.  As the PCM stream release may also access the hardware,
let's block the release until the card power turns on.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 82f80d0c068b..11acea02bc74 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2799,6 +2799,10 @@ static int snd_pcm_release(struct inode *inode, struct file *file)
 	if (snd_BUG_ON(!substream))
 		return -ENXIO;
 	pcm = substream->pcm;
+
+	/* block until the device gets woken up as it may touch the hardware */
+	snd_power_wait(pcm->card);
+
 	mutex_lock(&pcm->open_mutex);
 	snd_pcm_release_substream(substream);
 	kfree(pcm_file);
-- 
2.26.2

