Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 757983DDC3A
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 17:19:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D66841731;
	Mon,  2 Aug 2021 17:18:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D66841731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627917546;
	bh=aWVbQr9MNIh/6BJKBcVSn79lLDvG8uA80nE73nF/gio=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dPI6hZiRvwgdvd1Ukew21sy+/SPWJH2YECnwYexIU2qeLhByNZ8NFu/1OxnvcJHwB
	 mSZC8G7jWW/aO+384K4rsQoXitBT2jG3xUE/hilXmMKQI/1eDXX25sL9xWMsskEPFX
	 Med6RXNAjs3EqAoUHy+j57PODzCJUbvbJCePuDlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 801BBF8026A;
	Mon,  2 Aug 2021 17:18:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4C9FF80268; Mon,  2 Aug 2021 17:18:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2A1CF80095
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 17:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2A1CF80095
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="299064519"
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="299064519"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 08:18:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="457972445"
Received: from skarumur-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.72.192])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 08:17:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Intel: hda-ipc: fix reply size checking
Date: Mon,  2 Aug 2021 10:17:49 -0500
Message-Id: <20210802151749.15417-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

Checking that two values don't have common bits makes no sense,
strict equality is meant.

Fixes: f3b433e4699f  ("ASoC: SOF: Implement Probe IPC API")
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-ipc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index c91aa951df22..acfeca42604c 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -107,8 +107,8 @@ void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev)
 	} else {
 		/* reply correct size ? */
 		if (reply.hdr.size != msg->reply_size &&
-			/* getter payload is never known upfront */
-			!(reply.hdr.cmd & SOF_IPC_GLB_PROBE)) {
+		    /* getter payload is never known upfront */
+		    ((reply.hdr.cmd & SOF_GLB_TYPE_MASK) != SOF_IPC_GLB_PROBE)) {
 			dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
 				msg->reply_size, reply.hdr.size);
 			ret = -EINVAL;
-- 
2.25.1

