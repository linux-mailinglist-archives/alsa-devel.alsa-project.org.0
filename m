Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC186D3FBB
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 11:09:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2CB61F9;
	Mon,  3 Apr 2023 11:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2CB61F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680512984;
	bh=VQ2N7IpKAZjfzIJrRPnJDXllKTJjvePBYNPePA2Tx/A=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XDjRULkRhF+4CUqLmBOasvgVQEdVlK0Ddulgu3QpcKLax//uUVYe630suFz5UGkI0
	 cX5qHZ1GetzBssc9QKTlAFtQjgFdi1iCEKXBuf3m2csG7s+wbxMojmrAIO5G/Xv85j
	 odlfbpRcdZ5ZIJHko3hUtWVOlWrTiLkYS8r2DnzM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCA72F80249;
	Mon,  3 Apr 2023 11:08:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A688F8024C; Mon,  3 Apr 2023 11:08:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EDB9F8015B
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 11:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EDB9F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mk+xZo7R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680512923; x=1712048923;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VQ2N7IpKAZjfzIJrRPnJDXllKTJjvePBYNPePA2Tx/A=;
  b=mk+xZo7R0rSn4y47qzf29ZFsOJ92TIxk7jgeOFrtgV4e0UT2GfFZH7Ne
   VKfGYg7E5UfOzAR3T7AjPALJeRv4fmCh3q0IsnOqfme/eF9YECrjWnLWu
   wBlJMw2dhaXAgD96OTb+NrWG1uESszEIIXEJOCveekfjEMAY8B7kH65TE
   jh+rwXZIWD8QMGCNSrNly7CMY4Rom/GF+j2ihRSzGYylTPALzwubFsCV7
   7Rtlt5n/qqjqXBDXo7h6IozAX2QicE1H6vh/lOU9RQFHWn6skI8fNlp26
   vMe6n7R9yIpqK+QTc6xARw3w9Tj2SzIv1ue2f9t+9UA09T7N8r+cpRjOe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="344400032"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400";
   d="scan'208";a="344400032"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 02:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="755157940"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400";
   d="scan'208";a="755157940"
Received: from xinpan-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.210.95])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 02:08:34 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH for v6.3-rc] ASoC: SOF: ipc4-topology: Clarify bind failure
 caused by missing fw_module
Date: Mon,  3 Apr 2023 12:09:09 +0300
Message-Id: <20230403090909.18233-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KMH5NIEDBY2UCBSGN2L42EVFWD2SJ62V
X-Message-ID-Hash: KMH5NIEDBY2UCBSGN2L42EVFWD2SJ62V
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 guennadi.liakhovetski@linux.intel.com, stable@vger.kernel.org,
 error27@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KMH5NIEDBY2UCBSGN2L42EVFWD2SJ62V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The original patch uses a feature in lib/vsprintf.c to handle the invalid
address when tring to print *_fw_module->man4_module_entry.name when the
*rc_fw_module is NULL.
This case is handled by check_pointer_msg() internally and turns the
invalid pointer to '(efault)' for printing but it is hiding useful
information about the circumstances. Change the print to emmit the name
of the widget and a note on which side's fw_module is missing.

Fixes: e3720f92e023 ("ASoC: SOF: avoid a NULL dereference with unsupported widgets")
Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/alsa-devel/4826f662-42f0-4a82-ba32-8bf5f8a03256@kili.mountain/
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi Mark, Dan,

This patch clarifies the print and will not rely on vsprintf internal protection
on printing the error.

Regards,
Peter

 sound/soc/sof/ipc4-topology.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 669b99a4f76e..3a5394c3dd83 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1806,10 +1806,12 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 	int ret;
 
 	if (!src_fw_module || !sink_fw_module) {
-		/* The NULL module will print as "(efault)" */
-		dev_err(sdev->dev, "source %s or sink %s widget weren't set up properly\n",
-			src_fw_module->man4_module_entry.name,
-			sink_fw_module->man4_module_entry.name);
+		dev_err(sdev->dev,
+			"cannot bind %s -> %s, no firmware module for: %s%s\n",
+			src_widget->widget->name, sink_widget->widget->name,
+			src_fw_module ? "" : " source",
+			sink_fw_module ? "" : " sink");
+
 		return -ENODEV;
 	}
 
-- 
2.40.0

