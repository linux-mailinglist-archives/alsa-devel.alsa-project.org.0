Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C522602B71
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:14:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D180A3F24;
	Tue, 18 Oct 2022 14:13:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D180A3F24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095266;
	bh=izMBF4Qdr6hgAc2auZG1gPmSSnSh2f7dAFVwyWieQe0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rFjftmXTX3TspuChbId1bS15ezi01dJYz9aiQJeGi/E8UGf0fbobrnbkYpYNv1i2q
	 WEQCJ4N0Ee1e+JlMIu8HzDWzIFZw6FJQiBE4+CRzFyDPsuSAyvB++NPbE0u2fM2VS8
	 meed4zNu/gvh+LOiC+jts8G/55+Waux7OpyddaTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DE5DF805D5;
	Tue, 18 Oct 2022 14:09:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D7B9F805C2; Tue, 18 Oct 2022 14:09:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C846F805AB
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C846F805AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="isCg4vhO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094979; x=1697630979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=izMBF4Qdr6hgAc2auZG1gPmSSnSh2f7dAFVwyWieQe0=;
 b=isCg4vhOYNutyGvaDRAGXC1MUPGEjifFC61eCE/DUFHl488zMTiF/ytX
 bdwim8y5jRh2w7OtZpc+SvIO0BiUr2ACtXFrBAsSasC4JZqMloFiRn85s
 iu+6BBZ4GdCtvI6xAlcisC3vBqAm2E613VAy898rjod7/TTfIg5zKURTd
 mHGy2Jmk0LR8TvE0Gf7aZTG+qSfR9XnZvM1tAHYbgHieAcktf0YWP+hlP
 GLwcnJdJ7Uk+0ciNpJdOrIQPWU9PfWJ9wIj3uW/STsoxD6fhBujAHuYry
 G7OanfkHXzBhurPJWKG7qWT5wdId8mhP/fbVgk/LaOlygBjp/2WNcAxJ+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293453018"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="293453018"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:36 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579758042"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579758042"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:34 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 16/19] ASoC: SOF: loader: Add support for IPC dependent post
 firmware boot ops
Date: Tue, 18 Oct 2022 15:09:13 +0300
Message-Id: <20221018120916.19820-17-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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
2.38.0

