Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11524605FFD
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:18:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0424B47A7;
	Thu, 20 Oct 2022 14:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0424B47A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268304;
	bh=4TEBX8EwgFg+vodi7TTyk76ED89H2x9OnLo/TLKQtPA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QRXflKSYYT2gafMQYvtzkUV6MyXy70GZvg60OQve4RgKM/vDYnP5a4DD+OFjCympG
	 qn+I7UHzI0TY2QHRhmjxR48auaI2Wf4Qv7fNeZJJnjilVRNwAh6yuNgJJiz2Gq2IkD
	 yZQCuR16qan7Lq+jjM2SJlnbcylamO235cdeB0EU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A419F805D8;
	Thu, 20 Oct 2022 14:13:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2E25F8053C; Thu, 20 Oct 2022 14:13:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64695F805C9
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:13:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64695F805C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HZQab413"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267984; x=1697803984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4TEBX8EwgFg+vodi7TTyk76ED89H2x9OnLo/TLKQtPA=;
 b=HZQab413BbNURgBRODl6co0r+rqZer3X6p6/vR3K5wU+dmnGXt6w8FUS
 9X33G7tIcQlblpSbb/F7jCQzrVFzHsiTpbs2rIkFGgEGONJ8f69LAHyCi
 bSicOyTnYe4bobARXN2iSoZckHJ26w7FeDy6gOaPVo4ci4Qnn1Cd+IX1s
 EyBFB8UgfIeVYs920fr5eB8Z/sXxcW48/s9CCJbPFbFv6PQLfZVUWUizZ
 6vLaJUqrdwoN9pgSfmYWm1YF6eVutKT96stpkHyBJq8fOmTF3hbxIqfX4
 7gxszwLfMQOwzuCq//+k7Wxiyn8w0q1ndAOvKRORkUrL/JEChcZTEBO+N Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333256424"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333256424"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:13:01 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="663010150"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="663010150"
Received: from awrynn-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:58 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 16/19] ASoC: SOF: loader: Add support for IPC dependent
 post firmware boot ops
Date: Thu, 20 Oct 2022 15:12:35 +0300
Message-Id: <20221020121238.18339-17-peter.ujfalusi@linux.intel.com>
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

Add support for executing IPC dependent tasks after a successful firmware
boot.

The new post_fw_boot ops can make the fw_loader query_fw_configuration
callback redundant as IPC code can handle the first boot internally.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/loader.c   | 6 ++++++
 sound/soc/sof/sof-priv.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 723bd8267a3d..a1c4a51636c9 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -174,6 +174,12 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
+	if (sdev->ipc->ops->post_fw_boot) {
+		ret = sdev->ipc->ops->post_fw_boot(sdev);
+		if (ret)
+			return ret;
+	}
+
 	if (sdev->first_boot && sdev->ipc->ops->fw_loader->query_fw_configuration)
 		return sdev->ipc->ops->fw_loader->query_fw_configuration(sdev);
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index ea6013ab1d4a..c7ab78b042aa 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -445,6 +445,8 @@ struct sof_ipc_pcm_ops;
  *
  * @init:	Optional pointer for IPC related initialization
  * @exit:	Optional pointer for IPC related cleanup
+ * @post_fw_boot: Optional pointer to execute IPC related tasks after firmware
+ *		boot.
  *
  * @tx_msg:	Function pointer for sending a 'short' IPC message
  * @set_get_data: Function pointer for set/get data ('large' IPC message). This
@@ -469,6 +471,7 @@ struct sof_ipc_ops {
 
 	int (*init)(struct snd_sof_dev *sdev);
 	void (*exit)(struct snd_sof_dev *sdev);
+	int (*post_fw_boot)(struct snd_sof_dev *sdev);
 
 	int (*tx_msg)(struct snd_sof_dev *sdev, void *msg_data, size_t msg_bytes,
 		      void *reply_data, size_t reply_bytes, bool no_pm);
-- 
2.38.1

