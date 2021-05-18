Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07938387DF8
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 18:55:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 715ED1755;
	Tue, 18 May 2021 18:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 715ED1755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621356958;
	bh=J8pjQAVRwZxyu9BdXFDj0UFkVs7YDnXupWVWFQV9p/g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=isRJfGZ2R8YfRIfdpMD9LhJTR7g/1eJP80Un6nbpbqY6eqT6fz+81JoOaZwRejZfL
	 XeY9SWbtVUAMiWMCv7Wry1gW2mDhAbHkT8R5E+i2AqwC6dcYXDa13XtaynHmS8yjsk
	 oS5tEFxhq0SeYx90F0wWcB/kJtqxDFxC7etcTvWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D82CAF804C1;
	Tue, 18 May 2021 18:52:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7CD9F8049C; Tue, 18 May 2021 18:52:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 284A8F802C8
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 18:52:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 284A8F802C8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79AFEB1C8;
 Tue, 18 May 2021 16:52:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/7] ALSA: pcm: Block the release until the system resume
 finishes
Date: Tue, 18 May 2021 18:52:00 +0200
Message-Id: <20210518165201.24376-7-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210518165201.24376-1-tiwai@suse.de>
References: <20210518165201.24376-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
index 8dbe86cf2e4f..3c6ba0dc2970 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2799,6 +2799,10 @@ static int snd_pcm_release(struct inode *inode, struct file *file)
 	if (snd_BUG_ON(!substream))
 		return -ENXIO;
 	pcm = substream->pcm;
+
+	/* block until the device gets woken up as it may touch the hardware */
+	snd_power_wait(pcm->card, SNDRV_CTL_POWER_D0);
+
 	mutex_lock(&pcm->open_mutex);
 	snd_pcm_release_substream(substream);
 	kfree(pcm_file);
-- 
2.26.2

