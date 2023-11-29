Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3AB7FD73C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 13:55:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9BB7844;
	Wed, 29 Nov 2023 13:55:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9BB7844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701262529;
	bh=7o5Df0wGKeyYfnVIG1saGTKWLSJETSw4n9hnQZo8JuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=he/9tlKplieF9qa6jAk7NGrAcW/U26PlSIsdND/+1yyYoZzQWqNkU4J6x3wlO19g6
	 CwKefBPLQS/eFp1hzVakhgzg5KRJe1pwwzCHiVXlZSZTdxyl3lag3DVjiXvckUS8gF
	 460KUn92UGdie3cFB9Imowxr3u4ouoiJ3jObXVwA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2FB8F806A1; Wed, 29 Nov 2023 13:53:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A49EEF806B3;
	Wed, 29 Nov 2023 13:53:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC232F80640; Wed, 29 Nov 2023 13:53:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0343F8060B
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 13:53:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0343F8060B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B7pF+UYt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262400; x=1732798400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7o5Df0wGKeyYfnVIG1saGTKWLSJETSw4n9hnQZo8JuU=;
  b=B7pF+UYt3SHt7kSUrC6Dcs7ze9JdnnSAU8OSDghz6zjyJq3R1IVEOSqC
   6Ld9pQwOMR8yR61LqpNlb/RBjO/8672+3aVc9nAtyl/u+Q567Mmb3gbEY
   vHr4TC1lqfMK7rCCVJW3cAMVN6GbKmGCBE/RMDBGsJ8DXfbYCOPIbHsyY
   InBpnZUgcGkIi/V2MNILgpDWayD1vWS3VGPjg2kTa5H8xOx5pL3irRpZ+
   iHBjtgAX65Xj/ayBmHOuI7lgdMQEZr3bBxoEIGMmFEuC/kVB1hOkngu27
   avjhbddMUxdyFzfWp0lB53mBYY9hFv9T7Ye9uudPrG/XHptZkwubwZJlX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022965"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="392022965"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:53:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="17174647"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:53:15 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 11/13] ASoC: SOF: core: Add helper for initialization of
 paths, ops
Date: Wed, 29 Nov 2023 14:53:25 +0200
Message-ID: <20231129125327.23708-12-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PTBDCBWSEDFUCIXC3LLSL74UNXWE2YGE
X-Message-ID-Hash: PTBDCBWSEDFUCIXC3LLSL74UNXWE2YGE
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add sof_init_environment() as a helper function to contain path and ops
initialization.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/core.c | 56 +++++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index f1a083de9f9e..a2e9506e0f85 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -265,6 +265,38 @@ static int sof_select_ipc_and_paths(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static int sof_init_environment(struct snd_sof_dev *sdev)
+{
+	int ret;
+
+	ret = sof_select_ipc_and_paths(sdev);
+	if (ret)
+		return ret;
+
+	/* init ops, if necessary */
+	ret = sof_ops_init(sdev);
+	if (ret < 0)
+		return ret;
+
+	/* check all mandatory ops */
+	if (!sof_ops(sdev) || !sof_ops(sdev)->probe) {
+		dev_err(sdev->dev, "missing mandatory ops\n");
+		sof_ops_free(sdev);
+		return -EINVAL;
+	}
+
+	if (!sdev->dspless_mode_selected &&
+	    (!sof_ops(sdev)->run || !sof_ops(sdev)->block_read ||
+	     !sof_ops(sdev)->block_write || !sof_ops(sdev)->send_msg ||
+	     !sof_ops(sdev)->load_firmware || !sof_ops(sdev)->ipc_msg_data)) {
+		dev_err(sdev->dev, "missing mandatory DSP ops\n");
+		sof_ops_free(sdev);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /*
  *			FW Boot State Transition Diagram
  *
@@ -503,31 +535,11 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 		}
 	}
 
-	ret = sof_select_ipc_and_paths(sdev);
+	/* Initialize loadable file paths and check the environment validity */
+	ret = sof_init_environment(sdev);
 	if (ret)
 		return ret;
 
-	/* init ops, if necessary */
-	ret = sof_ops_init(sdev);
-	if (ret < 0)
-		return ret;
-
-	/* check all mandatory ops */
-	if (!sof_ops(sdev) || !sof_ops(sdev)->probe) {
-		sof_ops_free(sdev);
-		dev_err(dev, "missing mandatory ops\n");
-		return -EINVAL;
-	}
-
-	if (!sdev->dspless_mode_selected &&
-	    (!sof_ops(sdev)->run || !sof_ops(sdev)->block_read ||
-	     !sof_ops(sdev)->block_write || !sof_ops(sdev)->send_msg ||
-	     !sof_ops(sdev)->load_firmware || !sof_ops(sdev)->ipc_msg_data)) {
-		sof_ops_free(sdev);
-		dev_err(dev, "missing mandatory DSP ops\n");
-		return -EINVAL;
-	}
-
 	INIT_LIST_HEAD(&sdev->pcm_list);
 	INIT_LIST_HEAD(&sdev->kcontrol_list);
 	INIT_LIST_HEAD(&sdev->widget_list);
-- 
2.43.0

