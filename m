Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C41265280D6
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 11:25:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EC701682;
	Mon, 16 May 2022 11:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EC701682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652693156;
	bh=MykYtU4LcUJEI80s8uTCziHdsehvjigul8oyDVJ045E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jet0ORMaAsOMip8nVecbKbbTORj9r3IZO48Za4PAIm02Lc8n8Agrxuq4OtuzdGJG6
	 OsEhWnJ4xogz3Ek5V+QI9/BO77MOhAMVE9Wk3ky3NImC4d1kzDsDpqp314A9u7Ix4e
	 IQTBqtqs+VrPKotsLfMkxAx9pokyyImxyX4YzVrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AC08F80171;
	Mon, 16 May 2022 11:24:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A80AF8014B; Mon, 16 May 2022 11:24:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CEE8F800F8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 11:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CEE8F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="An75QJS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652693091; x=1684229091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MykYtU4LcUJEI80s8uTCziHdsehvjigul8oyDVJ045E=;
 b=An75QJS/0he14L7WP0VdZNv3oPf/YzUrYxf2r/jpLllHFA+BjuW9cyzh
 kZj3MPNiOpZ3mFKp0t4szE8Cs5NxLZkoEHd6uaOYtm4cuXAlIDXoXVYL0
 IKKaDwsJ/eUMbN1hH26ovIgsY2TXShcgitnStONDc66KYAnX68YtU6twp
 9qfAvGoUk3lTo43uJX+boZ5x1W9nqIpZCqLI2iOsp5cKGLxUT5zPql/Oe
 vUblZOw6969KhBan2PtANZziZMXjMKbylbwU9hf1GrY3hjPOwO9VNnRjH
 VsFt0btWWeY6foH2odFtOCHpwTWdtQ2NyaE6KLVJnlu7YEJ7BPZfsxhEp A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="331406236"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="331406236"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 02:24:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="596433986"
Received: from afialcko-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.51.55])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 02:24:16 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, dan.carpenter@oracle.com
Subject: [PATCH] ASoC: SOF: ipc-msg-injector: Cap the rmaining to count in
 IPC4 mode
Date: Mon, 16 May 2022 12:24:42 +0300
Message-Id: <20220516092442.17027-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

If user space provides smaller buffer than the IPC4 reply then it is
possible that we corrupt user space memory since the IPC4 dfs_read function
is not using the count directly in copy_to_user() due to the nature of
an IPC4 message.

Cap the remaining counter to make sure that we are not writing too much to
the user space provided buffer.

Add a check also to make sure that the buffer is at least the size of the
IPC4 header.

Fixes: 066c67624d8c: "ASoC: SOF: ipc-msg-injector: Add support for IPC4 messages"
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-client-ipc-msg-injector.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index c2480317730c..03490a4d4ae7 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -76,12 +76,17 @@ static ssize_t sof_msg_inject_ipc4_dfs_read(struct file *file,
 	struct sof_client_dev *cdev = file->private_data;
 	struct sof_msg_inject_priv *priv = cdev->data;
 	struct sof_ipc4_msg *ipc4_msg = priv->rx_buffer;
+	size_t header_size = sizeof(ipc4_msg->header_u64);
 	size_t remaining;
 
 	if (!ipc4_msg->header_u64 || !count || *ppos)
 		return 0;
 
-	remaining = sizeof(ipc4_msg->header_u64);
+	/* we need space for the header at minimum (u64) */
+	if (count < header_size)
+		return -ENOSPC;
+
+	remaining = header_size;
 
 	/* Only get large config have payload */
 	if (SOF_IPC4_MSG_IS_MODULE_MSG(ipc4_msg->primary) &&
@@ -90,13 +95,15 @@ static ssize_t sof_msg_inject_ipc4_dfs_read(struct file *file,
 
 	if (count > remaining)
 		count = remaining;
+	else if (count < remaining)
+		remaining = count;
 
 	/* copy the header first */
-	if (copy_to_user(buffer, &ipc4_msg->header_u64, sizeof(ipc4_msg->header_u64)))
+	if (copy_to_user(buffer, &ipc4_msg->header_u64, header_size))
 		return -EFAULT;
 
-	*ppos += sizeof(ipc4_msg->header_u64);
-	remaining -= sizeof(ipc4_msg->header_u64);
+	*ppos += header_size;
+	remaining -= header_size;
 
 	if (!remaining)
 		return count;
-- 
2.36.1

