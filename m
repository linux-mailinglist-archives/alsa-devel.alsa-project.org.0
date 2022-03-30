Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 489254ECDD1
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 22:23:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFBDC1AC0;
	Wed, 30 Mar 2022 22:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFBDC1AC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648671797;
	bh=OqFKwt4A9we7mD2JOnrn8nl7vvqgCI6+8961qBDqWCw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oUyUqdfbZgPFlyskZz33zFk7dDtG1hdgW6vxpIcntVATIsF/5HmnkU4q5YRJPJf3b
	 JOpTrhlnR5IolWKaMBafALWM4L1i7DDLlEdBzrleeuWM7dZr3Gwgj9K6aHPezPSpPn
	 uw1mSuFPjWGgYtCmFDKc2moMtfC2aBFYyEdPgnRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F6C9F8053D;
	Wed, 30 Mar 2022 22:20:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77B48F80536; Wed, 30 Mar 2022 22:19:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46B48F8050F
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 22:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46B48F8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lzJUDUff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648671586; x=1680207586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OqFKwt4A9we7mD2JOnrn8nl7vvqgCI6+8961qBDqWCw=;
 b=lzJUDUffGP4wOWi951Ax49dA0SWiUtZzC/P94aucoUC3l4BtBmka0fgC
 nDfLXhAtnmwptJ2NE7KTg5QM+YvtvbgnujQKqGhMZ61Wcj+i/Y7Y2CVYU
 Y+znq6yELKTEUod+1hkCYSOedV03mp22sBI8jrS+TkOVlOisbwp7BF4uk
 wH4DJQu7HjA1L8b6PY2qKGUIiKLX3lnwIHOVo38rU2NYogeyrMWqi5J8l
 o+QEiQfnx1ecUWubm1xaYZHd09iYy/uHM2eYjlaeydHlPU0IUyQNZiDcg
 DfIGGSth+ppnZtdyAUX/+TIW3h1cYiyYgttVIPlGA7pxljFru08kI7xof A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322819833"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="322819833"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="522045040"
Received: from ggunnam-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.195])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:38 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/11] ASoC: SOF: ipc: Use msg->reply_data directly in
 snd_sof_ipc_get_reply()
Date: Wed, 30 Mar 2022 13:19:23 -0700
Message-Id: <20220330201926.1330402-9-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
References: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Instead of using a local reply to first read out the header from the
mailbox then memcpy it or read it again to msg->reply_data, read it
directly to it's final place from the start.

If we received an error we do not need to do a memcpy anymore.
If the reply is reporting a success then we don not need to read the reply
again from the mailbox if the reply_size equals to the already read header
size.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index c722ca0b00a6..46c40dfd9f2b 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -393,7 +393,7 @@ EXPORT_SYMBOL(sof_ipc_tx_message_no_pm);
 void snd_sof_ipc_get_reply(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_ipc_msg *msg = sdev->msg;
-	struct sof_ipc_reply reply;
+	struct sof_ipc_reply *reply;
 	int ret = 0;
 
 	/*
@@ -407,13 +407,12 @@ void snd_sof_ipc_get_reply(struct snd_sof_dev *sdev)
 	}
 
 	/* get the generic reply */
-	snd_sof_dsp_mailbox_read(sdev, sdev->host_box.offset, &reply,
-				 sizeof(reply));
+	reply = msg->reply_data;
+	snd_sof_dsp_mailbox_read(sdev, sdev->host_box.offset, reply, sizeof(*reply));
 
-	if (reply.error < 0) {
-		memcpy(msg->reply_data, &reply, sizeof(reply));
-		ret = reply.error;
-	} else if (!reply.hdr.size) {
+	if (reply->error < 0) {
+		ret = reply->error;
+	} else if (!reply->hdr.size) {
 		/* Reply should always be >= sizeof(struct sof_ipc_reply) */
 		if (msg->reply_size)
 			dev_err(sdev->dev,
@@ -424,24 +423,27 @@ void snd_sof_ipc_get_reply(struct snd_sof_dev *sdev)
 
 		ret = -EINVAL;
 	} else if (msg->reply_size > 0) {
-		if (reply.hdr.size == msg->reply_size) {
+		if (reply->hdr.size == msg->reply_size) {
 			ret = 0;
-		} else if (reply.hdr.size < msg->reply_size) {
+		} else if (reply->hdr.size < msg->reply_size) {
 			dev_dbg(sdev->dev,
 				"reply size (%u) is less than expected (%zu)\n",
-				reply.hdr.size, msg->reply_size);
+				reply->hdr.size, msg->reply_size);
 
-			msg->reply_size = reply.hdr.size;
+			msg->reply_size = reply->hdr.size;
 			ret = 0;
 		} else {
 			dev_err(sdev->dev,
 				"reply size (%u) exceeds the buffer size (%zu)\n",
-				reply.hdr.size, msg->reply_size);
+				reply->hdr.size, msg->reply_size);
 			ret = -EINVAL;
 		}
 
-		/* get the full message if reply.hdr.size <= msg->reply_size */
-		if (!ret)
+		/*
+		 * get the full message if reply->hdr.size <= msg->reply_size
+		 * and the reply->hdr.size > sizeof(struct sof_ipc_reply)
+		 */
+		if (!ret && msg->reply_size > sizeof(*reply))
 			snd_sof_dsp_mailbox_read(sdev, sdev->host_box.offset,
 						 msg->reply_data, msg->reply_size);
 	}
-- 
2.25.1

