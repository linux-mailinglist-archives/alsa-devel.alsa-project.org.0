Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4B61742F0
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Feb 2020 00:21:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B980A16E3;
	Sat, 29 Feb 2020 00:20:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B980A16E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582932067;
	bh=li44pn4ZbjxKhoz74HBMFOZjuTvdXOaI3iUOkLou7aA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dE3qPoxV9Mgarua0neB1wZFowYBk0J47Nx2AHs4rJtkp8RMypl/KGCBU7/0lA/fr5
	 1eQLpIlYy5VSC5WZUt48SHuNky+C5j8LSqzFRssOcj6fCENrTp/cc8Hddxv7woMkEJ
	 CyCR6DhzYrttVfFRpfnkCQac2DqQf+0jtoocC+MM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ACC8F8028A;
	Sat, 29 Feb 2020 00:19:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 749C8F80278; Sat, 29 Feb 2020 00:19:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20E17F80089
 for <alsa-devel@alsa-project.org>; Sat, 29 Feb 2020 00:18:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20E17F80089
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2020 15:18:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,497,1574150400"; d="scan'208";a="272826540"
Received: from billycla-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.95.100])
 by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2020 15:18:54 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: SOF: ipc: check ipc return value before data copy
Date: Fri, 28 Feb 2020 17:18:48 -0600
Message-Id: <20200228231850.9226-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228231850.9226-1-pierre-louis.bossart@linux.intel.com>
References: <20200228231850.9226-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>,
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

From: Jaska Uimonen <jaska.uimonen@linux.intel.com>

In tx_wait_done the ipc payload is copied before the DSP transaction
error code is checked. This might lead to corrupted data in kernel side
even though the error would be handled later. It is also pointless to
copy the data in case of error. So change the order of error check and
copy.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 22d296f95761..cc5762706c9c 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -214,15 +214,17 @@ static int tx_wait_done(struct snd_sof_ipc *ipc, struct snd_sof_ipc_msg *msg,
 		snd_sof_handle_fw_exception(ipc->sdev);
 		ret = -ETIMEDOUT;
 	} else {
-		/* copy the data returned from DSP */
 		ret = msg->reply_error;
-		if (msg->reply_size)
-			memcpy(reply_data, msg->reply_data, msg->reply_size);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(sdev->dev, "error: ipc error for 0x%x size %zu\n",
 				hdr->cmd, msg->reply_size);
-		else
+		} else {
 			ipc_log_header(sdev->dev, "ipc tx succeeded", hdr->cmd);
+			if (msg->reply_size)
+				/* copy the data returned from DSP */
+				memcpy(reply_data, msg->reply_data,
+				       msg->reply_size);
+		}
 	}
 
 	return ret;
-- 
2.20.1

