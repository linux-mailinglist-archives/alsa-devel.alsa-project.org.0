Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D597416B8B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 21:41:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5823917B2;
	Tue,  7 May 2019 21:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5823917B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557258064;
	bh=owK5zqJ/cw9lXOvm5KZzmC5yWbPxCPQ00R7M7HdB17k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ITKLzX9UWRscaTLTchFTV9gzcQasjfXLdR2in1fdls1sf8Ajb9C6+IdoKY4x6nYP5
	 OjW9uKUWbjjLp2GCiPqLH21jh/bEV+zyMcV4vEmdKOg3NFNje6u1sSXngL5fwOAkDv
	 XPW/8EbcF1u4ZfBu7rDmFbkkbKWR60SMK+gAbxXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3322F89678;
	Tue,  7 May 2019 21:39:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D40AF89674; Tue,  7 May 2019 21:39:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 566ADF89671
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 21:39:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 566ADF89671
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2292FAC1B;
 Tue,  7 May 2019 19:39:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue,  7 May 2019 21:39:10 +0200
Message-Id: <20190507193910.23943-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: SOF: Propagate
	sof_get_ctrl_copy_params() error properly
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This fixes a compile warning below by properly handling the error code
from sof_get_ctrl_copy_params():
  include/linux/kernel.h:843:43: warning: 'sparams.pl_size' may be used uninitialized in this function [-Wmaybe-uninitialized]
  sound/soc/sof/ipc.c:639:34: note: 'sparams.pl_size' was declared here

The function returns an error before setting sparams.pl_size, so it'd
assign an uninitialized value at a later point.

Fixes: 53e0c72d98ba ("ASoC: SOF: Add support for IPC IO between DSP and Host")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sof/ipc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index ba1bb17a8d1e..f0b9d3c53f6f 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -567,7 +567,7 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
 	size_t offset = 0;
 	size_t msg_bytes;
 	size_t pl_size;
-	int err = 0;
+	int err;
 	int i;
 
 	/* allocate max ipc size because we have at least one */
@@ -576,9 +576,13 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
 		return -ENOMEM;
 
 	if (send)
-		sof_get_ctrl_copy_params(cdata->type, cdata, partdata, sparams);
+		err = sof_get_ctrl_copy_params(cdata->type, cdata, partdata,
+					       sparams);
 	else
-		sof_get_ctrl_copy_params(cdata->type, partdata, cdata, sparams);
+		err = sof_get_ctrl_copy_params(cdata->type, partdata, cdata,
+					       sparams);
+	if (err < 0)
+		return err;
 
 	msg_bytes = sparams->msg_bytes;
 	pl_size = sparams->pl_size;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
