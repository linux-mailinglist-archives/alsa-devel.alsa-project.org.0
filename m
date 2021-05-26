Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A903920E5
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 21:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C21B41719;
	Wed, 26 May 2021 21:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C21B41719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622057512;
	bh=uI5/gfGxvHXQu20+LImJJcEKf7DN8tdTZdEdOIwcQI4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mjZJVQnJd3o7qk2NX9QB+vR8qA4rNqUXz+sLmr1F9QJnBdJPy7BKGyJjkCCUZpVfX
	 hREmiHZs89mqZYgNxL6Kwrr+QbprHYi+IAA1luPsGOOfo5ULdYahRYg98kZ5W0DQQL
	 Vxtfo1uWQu4tTXhXpu06iHU8At8CVMmLYRx4b5Jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1659FF80264;
	Wed, 26 May 2021 21:30:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F301F8026B; Wed, 26 May 2021 21:30:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CFE8F8025C
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 21:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CFE8F8025C
IronPort-SDR: oVJMGj3SdqAGOB9UyODOxZ6H5sU6XsEqWi6LjV6jZ3PJU0/LNse7vMP2iVuubK2pv+k2lRARCN
 oo54MaBG1/mw==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="266447554"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="266447554"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 12:30:07 -0700
IronPort-SDR: PqBeF03cvn4rlp51qCx1CYMYbsb5zRtEcA93bz5n8TZbVyhJ1c3sEqPS9at6Is+plbqmI/ixrA
 JlHzLxe+UTJA==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="414587768"
Received: from pmundle-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.181.158])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 12:30:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: drivers: opl3: fix useless self-comparison
Date: Wed, 26 May 2021 14:29:56 -0500
Message-Id: <20210526192957.449515-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

Sparse throws the following warning:

sound/drivers/opl3/opl3_midi.c:183:60: error: self-comparison always
evaluates to false

This is likely a 16+ year old confusion between vp2 and vp.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/drivers/opl3/opl3_midi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_midi.c
index eb23c55323ae..e1b69c65c3c8 100644
--- a/sound/drivers/opl3/opl3_midi.c
+++ b/sound/drivers/opl3/opl3_midi.c
@@ -180,8 +180,7 @@ static int opl3_get_voice(struct snd_opl3 *opl3, int instr_4op,
 			if (vp2->state == SNDRV_OPL3_ST_ON_2OP) {
 				/* kill two voices, EXPENSIVE */
 				bp++;
-				voice_time = (voice_time > vp->time) ?
-					voice_time : vp->time;
+				voice_time = max(voice_time, vp2->time);
 			}
 		} else {
 			/* allocate 2op voice */
-- 
2.25.1

