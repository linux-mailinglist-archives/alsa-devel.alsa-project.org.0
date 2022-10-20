Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC5F605FFC
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:18:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3FAC1813;
	Thu, 20 Oct 2022 14:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3FAC1813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268285;
	bh=VJ8eaoMoyC4cKnYOABwb1de3yBpTvyRDd/AdXhutmwE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YcNOSWgrdvVuCKZMJYx5tDNh0riAtULnltYYPUou4AsktoSS+VcKoVGc3K5R2UYRj
	 PKK7b9ihdqDjI/O2kXHrm5elbCjgrOyYdIcYxGZLMyTM+lgVf/VBifPcj+DOncQEwL
	 zngdtAA2EUvEDHGIQxnzdE6+1N6Qo4VOYgxK8kEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E40A5F805C9;
	Thu, 20 Oct 2022 14:13:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75EFAF805E4; Thu, 20 Oct 2022 14:13:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89FC9F805D8
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89FC9F805D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NK9cpG2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267988; x=1697803988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VJ8eaoMoyC4cKnYOABwb1de3yBpTvyRDd/AdXhutmwE=;
 b=NK9cpG2LPxvCNRnKibZ7TfXVgo08KTUd3/Tw61iNlNqezGNd9LTXpDnJ
 ViRsxx9UcWxzjfqKXU4uODUTcSr++80WyG2d6adSzFanvW9vtag7HGLhg
 uwjV1+bebmd5mqPBECfkihe7WVT4IqwpDJu8LMJowZLPW5zt+1NxPg3qX
 Fu93YNR9KVLyVpdy/ctegEqEd1CQ7lWeAz+Rtr7ikJ03JfHLsa189KEG1
 f3jQx4SJaytvt0BB+QYQhdXN65Ofktvi6uU6F6/ccNQe6Y7HxrsDwNkx3
 V0a0dYLaCUbvmHB6d+wG7sVRpIPEh2X2uZPrf9akGjQXUr6HZY2M5iEvB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333256446"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333256446"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:13:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="663010192"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="663010192"
Received: from awrynn-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:13:04 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 18/19] ASoC: SOF: loader: Remove the query_fw_configuration
 ops
Date: Thu, 20 Oct 2022 15:12:37 +0300
Message-Id: <20221020121238.18339-19-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
References: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 chao.song@intel.com
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

The query_fw_configuration callback is redundant and the only user of it
was converted to use the generic post_fw_boot ops.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/loader.c   | 10 ++--------
 sound/soc/sof/sof-priv.h |  4 ----
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index a1c4a51636c9..81d202e5ce53 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -174,14 +174,8 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	if (sdev->ipc->ops->post_fw_boot) {
-		ret = sdev->ipc->ops->post_fw_boot(sdev);
-		if (ret)
-			return ret;
-	}
-
-	if (sdev->first_boot && sdev->ipc->ops->fw_loader->query_fw_configuration)
-		return sdev->ipc->ops->fw_loader->query_fw_configuration(sdev);
+	if (sdev->ipc->ops->post_fw_boot)
+		return sdev->ipc->ops->post_fw_boot(sdev);
 
 	return 0;
 }
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index c7ab78b042aa..403e81220244 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -421,15 +421,11 @@ struct sof_ipc_pm_ops {
  *			DSP.
  *			The function implements generic, hardware independent way
  *			of loading the initial firmware and its modules (if any).
- * @query_fw_configuration: Optional function pointer to query information and
- *			configuration from the booted firmware.
- *			Executed after the first successful firmware boot.
  */
 struct sof_ipc_fw_loader_ops {
 	int (*validate)(struct snd_sof_dev *sdev);
 	size_t (*parse_ext_manifest)(struct snd_sof_dev *sdev);
 	int (*load_fw_to_dsp)(struct snd_sof_dev *sdev);
-	int (*query_fw_configuration)(struct snd_sof_dev *sdev);
 };
 
 struct sof_ipc_tplg_ops;
-- 
2.38.1

