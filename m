Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF7925B5E0
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 23:32:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37754170F;
	Wed,  2 Sep 2020 23:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37754170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599082333;
	bh=rI5wkWYTb2OnqSAx7wDxN1HqlyIyqCd1r9dV29LRdaY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=btYl7vRRj7iOPzvZnyuokRU9PMQ+Mbzo4c9m9J9VHiG+EZvcCB4G9PWHTjtZl+Jqo
	 101ONl835X3oUCmjc6Cc1ta37Vq2Kr3VmmffaTA5/HR8njyhECok9gvFor6EpLi+x1
	 wK5Wk8Ub0E7i6gvjkFc4hAg/RIlmrGVMcdv87Igs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 834B9F80344;
	Wed,  2 Sep 2020 23:22:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 996BBF802E3; Wed,  2 Sep 2020 23:22:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0DEEF802E8
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 23:22:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0DEEF802E8
IronPort-SDR: 7upAJpcGzAQniLVBerFel2ivwMLnX4l6iD5qeejGfndbSrEHlcvLRw1zDytzmmdjqPBDlcwG8E
 2ts0st0ez3aQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="157482900"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="157482900"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:12 -0700
IronPort-SDR: r1Eir6ecieuVQ3e3dBgjV7d1v69sVsBrD82GHw3RgBfZSOL5PxFd6IiYwNFgjGjhHh8MiYwRZf
 haXcrLJj/YMQ==
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="477798297"
Received: from rnagarat-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.56.27])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 17/18] ALSA: vx: vx_pcm: remove redundant assignment
Date: Wed,  2 Sep 2020 16:21:32 -0500
Message-Id: <20200902212133.30964-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
References: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix cppcheck warning:

sound/drivers/vx/vx_pcm.c:539:30: style: Variable
'chip->playback_pipes[audio]' is reassigned a value before the old one
has been used. [redundantAssignment]
 chip->playback_pipes[audio] = pipe;
                             ^
sound/drivers/vx/vx_pcm.c:533:31: note: chip->playback_pipes[audio] is
assigned
  chip->playback_pipes[audio] = pipe;
                              ^
sound/drivers/vx/vx_pcm.c:539:30: note: chip->playback_pipes[audio] is
overwritten
 chip->playback_pipes[audio] = pipe;
                             ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/drivers/vx/vx_pcm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/drivers/vx/vx_pcm.c b/sound/drivers/vx/vx_pcm.c
index 664b9efa9a50..47361e26be80 100644
--- a/sound/drivers/vx/vx_pcm.c
+++ b/sound/drivers/vx/vx_pcm.c
@@ -530,7 +530,6 @@ static int vx_pcm_playback_open(struct snd_pcm_substream *subs)
 		err = vx_alloc_pipe(chip, 0, audio, 2, &pipe); /* stereo playback */
 		if (err < 0)
 			return err;
-		chip->playback_pipes[audio] = pipe;
 	}
 	/* open for playback */
 	pipe->references++;
-- 
2.25.1

