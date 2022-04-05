Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E734F3CD6
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:30:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C64741898;
	Tue,  5 Apr 2022 19:30:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C64741898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649179858;
	bh=OPvHLNvzji28iCiTbiONGSUXe4tvcqYgKbh4alLzudU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AKVh4g4sA7leg74v4F341ogTfm3LgLC0m/ludSH0iR6fGZzU/91uuqDozk9jQyD7L
	 XgnYROGYINcXtX/9Uod5jjwPRENHY5ZNDbiNO92/IEBIWtd6tGRj7sCJdL9qnpJbjd
	 QkGfhP7QwvbCZshAwvQ543J6+RPNzSEv2fg2guAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5597BF80526;
	Tue,  5 Apr 2022 19:27:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD9DDF8052E; Tue,  5 Apr 2022 19:27:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A80FF8051C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A80FF8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="D0ST6qWg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649179660; x=1680715660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OPvHLNvzji28iCiTbiONGSUXe4tvcqYgKbh4alLzudU=;
 b=D0ST6qWgZEv4D1rXVXnfz69COrOxOPRf1tEl9gC+tckuOJ+DUFT+DIcD
 Yvuqr1AIbtLoUbdyjO6/jJifgmITDAHWyAHPA9Rz1ymzJDyBwPXn3FeNK
 pfNEmAywzk5cKg1+MooH5J/ZB7K6Fu9iO1Q+fNDGUk7TPA7nhXc/u3gMY
 +zH5mOCj/ynNpDP/h9zpbo8cOowKBfaNcsWPWI3wLHJyHZlC+eZ/dswJd
 vrYqZjQlQWMu2hIpFezY3Np++NE/65sx9gmsZtQRVvf1xK4azrt+2hw7K
 QBiVX5KhKFhdhnoOH2EUeSC7W5eNmY6eVbyt6KRQDuFdMOcgW6ojJ6wJK w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="323986763"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="323986763"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:25 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="722140989"
Received: from reginari-mobl7.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:25 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/15] ASoC: SOF: ipc: Use the get_reply ops in
 snd_sof_ipc_get_reply()
Date: Tue,  5 Apr 2022 10:27:03 -0700
Message-Id: <20220405172708.122168-11-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
References: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

Use the get_reply ops to allow IPC dependent handling of the reply message.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c | 50 ++-------------------------------------------
 1 file changed, 2 insertions(+), 48 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index d11c5e6e57fb..39ec4361048a 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -443,63 +443,17 @@ EXPORT_SYMBOL(sof_ipc_tx_message_no_pm);
 /* Generic helper function to retrieve the reply */
 void snd_sof_ipc_get_reply(struct snd_sof_dev *sdev)
 {
-	struct snd_sof_ipc_msg *msg = sdev->msg;
-	struct sof_ipc_reply *reply;
-	int ret = 0;
-
 	/*
 	 * Sometimes, there is unexpected reply ipc arriving. The reply
 	 * ipc belongs to none of the ipcs sent from driver.
 	 * In this case, the driver must ignore the ipc.
 	 */
-	if (!msg) {
+	if (!sdev->msg) {
 		dev_warn(sdev->dev, "unexpected ipc interrupt raised!\n");
 		return;
 	}
 
-	/* get the generic reply */
-	reply = msg->reply_data;
-	snd_sof_dsp_mailbox_read(sdev, sdev->host_box.offset, reply, sizeof(*reply));
-
-	if (reply->error < 0) {
-		ret = reply->error;
-	} else if (!reply->hdr.size) {
-		/* Reply should always be >= sizeof(struct sof_ipc_reply) */
-		if (msg->reply_size)
-			dev_err(sdev->dev,
-				"empty reply received, expected %zu bytes\n",
-				msg->reply_size);
-		else
-			dev_err(sdev->dev, "empty reply received\n");
-
-		ret = -EINVAL;
-	} else if (msg->reply_size > 0) {
-		if (reply->hdr.size == msg->reply_size) {
-			ret = 0;
-		} else if (reply->hdr.size < msg->reply_size) {
-			dev_dbg(sdev->dev,
-				"reply size (%u) is less than expected (%zu)\n",
-				reply->hdr.size, msg->reply_size);
-
-			msg->reply_size = reply->hdr.size;
-			ret = 0;
-		} else {
-			dev_err(sdev->dev,
-				"reply size (%u) exceeds the buffer size (%zu)\n",
-				reply->hdr.size, msg->reply_size);
-			ret = -EINVAL;
-		}
-
-		/*
-		 * get the full message if reply->hdr.size <= msg->reply_size
-		 * and the reply->hdr.size > sizeof(struct sof_ipc_reply)
-		 */
-		if (!ret && msg->reply_size > sizeof(*reply))
-			snd_sof_dsp_mailbox_read(sdev, sdev->host_box.offset,
-						 msg->reply_data, msg->reply_size);
-	}
-
-	msg->reply_error = ret;
+	sdev->msg->reply_error = sdev->ipc->ops->get_reply(sdev);
 }
 EXPORT_SYMBOL(snd_sof_ipc_get_reply);
 
-- 
2.25.1

