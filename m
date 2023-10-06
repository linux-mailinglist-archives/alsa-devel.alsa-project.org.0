Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F4A7BB369
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 10:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1229E1EB;
	Fri,  6 Oct 2023 10:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1229E1EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696581695;
	bh=kqQ5bWxKMTPCKD5vuBMw+imGjAeFsgAw52rlBTXKLYI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XWLrqwsKI7Kn4GV1uNnqZDYICD5tlVqys2romSmLkeqWgoE4lcGwrcw6d1cwHmdzL
	 ysjSxWVgCQGWrTmKHTf2w2jLIuTdqOM3NARIEJ8R+vU3VnO5Nb0d43BQc/6AvbYI2J
	 WAwBuuIx6Jv+Q+VXxh85igwf4KRQXCSE5ptCnG+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C08E4F80553; Fri,  6 Oct 2023 10:40:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 533E5F80310;
	Fri,  6 Oct 2023 10:40:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D8A0F80310; Fri,  6 Oct 2023 10:40:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 385F1F8047D
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 10:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 385F1F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RC4ex6m4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696581636; x=1728117636;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kqQ5bWxKMTPCKD5vuBMw+imGjAeFsgAw52rlBTXKLYI=;
  b=RC4ex6m4wo5gZJzE+7Sk0vNKlJKpqSkN5zYeJ/e+NP/Kd39ViEs4Jlfg
   qCbmksafXBv3lqMn3RkbDe6QDAhmhJrOtJF/HsGPAq/jZbkBvQheUga86
   Qh0gFxW4aWlX/YZ+ewpa9cdPrRTPghbOJlvDJXsmSfsRl4eubhNnKBdez
   lK0UWMKCPQBoin0wYvtoDUy3wC3aMXWl3d05n2ziAbJrX2RO1247Bw+T4
   ILhysBseiv7Q2P8YNICI/HYgmLSm2gxWjAwc+gkhezTODqIhzrc+l/iGm
   GXKrr8xkzrkCKcjaso+og0mV3eFSf8CmhTkyCCPOJXk2MxfcMb+cQZkB3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="383596364"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="383596364"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="999260435"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="999260435"
Received: from mesalamy-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.42.190])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:40:30 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	cujomalainey@chromium.org
Subject: [PATCH] ASoC: SOF: sof-client: fix build when only IPC4 is selected
Date: Fri,  6 Oct 2023 11:40:41 +0300
Message-ID: <20231006084041.18100-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3KVEL46N2LJDOWSSAFNTZ74TLBAVB4OO
X-Message-ID-Hash: 3KVEL46N2LJDOWSSAFNTZ74TLBAVB4OO
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KVEL46N2LJDOWSSAFNTZ74TLBAVB4OO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

When IPC3 is not selected, sof-client.c still makes a hard-coded
reference to an IPC3-specific function:

ERROR: modpost: "sof_ipc3_do_rx_work" [sound/soc/sof/snd-sof.ko]
undefined!

Fix by making the code conditional.

Closes: https://github.com/thesofproject/linux/issues/4581
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-client.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index 3f636b82173e..9dce7f53b482 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -305,7 +305,8 @@ EXPORT_SYMBOL_NS_GPL(sof_client_ipc_tx_message, SND_SOC_SOF_CLIENT);
 
 int sof_client_ipc_rx_message(struct sof_client_dev *cdev, void *ipc_msg, void *msg_buf)
 {
-	if (cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_3) {
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_IPC3) &&
+	    cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_3) {
 		struct sof_ipc_cmd_hdr *hdr = ipc_msg;
 
 		if (hdr->size < sizeof(hdr)) {
-- 
2.42.0

