Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A5A7FD69E
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 13:20:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B4E2DEF;
	Wed, 29 Nov 2023 13:20:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B4E2DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701260434;
	bh=58dNflj4gktJ609m3w+Zgx50tZFYg2Vm5gW6Jl/OgJI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jXvfwEIWJ6hNKkPQZuxkKugLLXPjXZM3ZI91tNViujNXxj+KZO/JbSxTJef8kyOuh
	 7ewZULCKfXQNKwCdEnFMGwfbgFNIEvUtmszNi52mk8SwzCvhpal7s/wlrws0wIrGKU
	 9VYs1oM9B2cZbbSmqQCEEwINbdVp6U2tXBLU2Bx4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBFFAF80589; Wed, 29 Nov 2023 13:20:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A2A5F8016E;
	Wed, 29 Nov 2023 13:20:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7647FF8016E; Wed, 29 Nov 2023 13:19:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B766F8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 13:19:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B766F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=l7ORp3DI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701260393; x=1732796393;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=58dNflj4gktJ609m3w+Zgx50tZFYg2Vm5gW6Jl/OgJI=;
  b=l7ORp3DIC594928v0gM2hSwj2IKJiW4gl6M/ocPnHpJQ3RGCRKXe3BMF
   01/nyhcSAtT4QiGAinhVsVxgDACDdpTn+SLgVAD0B1aDsk08COEIIyXvJ
   wzQqCFd9cJrxH1BnCPzl+I5Tt2lVT+KRXf+8EzkI7R1y49trvxUtFrWlM
   lB5mProtq06QvPkp06UU8WVQ0j54iA/wI0Vl9Qk1QLPAkKrjSs7UCU03+
   GSf0ZvK4nnmNqzaR/mzsXpNoC3pUxRhDdC/RdJs8/AKxUQ1AEgt/ZeY+d
   zOuPfL66AaGI/3WXRhPBBxcmWKV9gFcOdBjndx9aosx2GCgFsk3CCRI9Q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6421109"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="6421109"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:19:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834995169"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="834995169"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:19:45 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4: check return value of snd_sof_ipc_msg_data
Date: Wed, 29 Nov 2023 14:20:21 +0200
Message-ID: <20231129122021.679-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6JT373EANFAVSMFWQCEXXKZ7NE7UYKKJ
X-Message-ID-Hash: 6JT373EANFAVSMFWQCEXXKZ7NE7UYKKJ
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6JT373EANFAVSMFWQCEXXKZ7NE7UYKKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

snd_sof_ipc_msg_data could return error.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index a9d9800d2fcc..145d319e041f 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -713,7 +713,14 @@ static void sof_ipc4_rx_msg(struct snd_sof_dev *sdev)
 			return;
 
 		ipc4_msg->data_size = data_size;
-		snd_sof_ipc_msg_data(sdev, NULL, ipc4_msg->data_ptr, ipc4_msg->data_size);
+		err = snd_sof_ipc_msg_data(sdev, NULL, ipc4_msg->data_ptr, ipc4_msg->data_size);
+		if (err < 0) {
+			dev_err(sdev->dev, "failed to read IPC notification data: %d\n", err);
+			kfree(ipc4_msg->data_ptr);
+			ipc4_msg->data_ptr = NULL;
+			ipc4_msg->data_size = 0;
+			return;
+		}
 	}
 
 	/* Handle notifications with payload */
-- 
2.43.0

