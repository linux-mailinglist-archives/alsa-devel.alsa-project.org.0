Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C51602B75
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:14:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13C3B6ED6;
	Tue, 18 Oct 2022 14:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13C3B6ED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095299;
	bh=fz0oR4/tW5BeVt6QI/888tYY5BTA4o5fmjEITnmPnUw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZpF0PoMTIO5OhzH77/+BleG1FZlRUvfPWM9RxJ4C1o/e4rOWe+pdTsHRJP9pu4hPU
	 zN6JBbYgb5u5WOnrJ9+gZyc/7ZIwG+b4/3rzj8dT/nyJQ6uVGvvgeKL71KdvTpGjPj
	 bub5ZOYvzHjuCt/MBdLkbSSoKIqGJJEvPTZtq5lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2902F805E2;
	Tue, 18 Oct 2022 14:09:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45849F805D9; Tue, 18 Oct 2022 14:09:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54E27F805AC
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54E27F805AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="P7pSY/nO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094980; x=1697630980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fz0oR4/tW5BeVt6QI/888tYY5BTA4o5fmjEITnmPnUw=;
 b=P7pSY/nOydYlYj/drWrk15jJqUgUqXpqW8nNKnfoFkQ41v7uQIzysmhe
 UfJ0GueGj6PT7/Crr4f/E8ahU6IuaeCoKzkfS+xmS89Q1NNFdAKGcACsU
 0YFtuM0qyNq76HkA9FiAQ6LOKhKmmrPohcNRs7va2l0AgNxDNOdxP0Z4J
 2Ex7lD7r7mqU3w9auYZjrtk2qoPgVFBwGzn+ZSCpIdN3ysqf8ZDhnRY1n
 duelDxRonJzIEsO8hRf1GLMs1EJGFLlUOmh3SBEBWgnfS+dcxOZwy0hwj
 Vdy4gZ8U52utpBxDwj8UL3wkEA5pQguh68oSrHgSToRx3iA7W4ge6Cd9L w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293453031"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="293453031"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:38 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579758053"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579758053"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:36 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 17/19] ASoC: SOF: ipc4: Stop using the query_fw_configuration
 fw_loader ops
Date: Tue, 18 Oct 2022 15:09:14 +0300
Message-Id: <20221018120916.19820-18-peter.ujfalusi@linux.intel.com>
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

Execute the configuration query from the generic post_fw_boot callback and
do not set the query_fw_configuration ops to allow it's removal.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-loader.c | 3 +--
 sound/soc/sof/ipc4-priv.h   | 1 +
 sound/soc/sof/ipc4.c        | 9 +++++++++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index b7e8b3f3d4f0..dbe3ee4ef08c 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -202,7 +202,7 @@ static int sof_ipc4_validate_firmware(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-static int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
+int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	const struct sof_ipc_ops *iops = sdev->ipc->ops;
@@ -273,5 +273,4 @@ static int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 const struct sof_ipc_fw_loader_ops ipc4_loader_ops = {
 	.validate = sof_ipc4_validate_firmware,
 	.parse_ext_manifest = sof_ipc4_fw_parse_basefw_ext_man,
-	.query_fw_configuration = sof_ipc4_query_fw_configuration,
 };
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 7e7115ada2a2..e4bd6d93fb0f 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -90,6 +90,7 @@ extern const struct sof_ipc_fw_tracing_ops ipc4_mtrace_ops;
 int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 state);
 int sof_ipc4_mtrace_update_pos(struct snd_sof_dev *sdev, int core);
 
+int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev);
 struct sof_ipc4_fw_module *sof_ipc4_find_module_by_uuid(struct snd_sof_dev *sdev,
 							const guid_t *uuid);
 #endif
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index abbeb832027b..f1e5875675db 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -687,9 +687,18 @@ static void sof_ipc4_exit(struct snd_sof_dev *sdev)
 	xa_destroy(&ipc4_data->fw_lib_xa);
 }
 
+static int sof_ipc4_post_boot(struct snd_sof_dev *sdev)
+{
+	if (sdev->first_boot)
+		return sof_ipc4_query_fw_configuration(sdev);
+
+	return 0;
+}
+
 const struct sof_ipc_ops ipc4_ops = {
 	.init = sof_ipc4_init,
 	.exit = sof_ipc4_exit,
+	.post_fw_boot = sof_ipc4_post_boot,
 	.tx_msg = sof_ipc4_tx_msg,
 	.rx_msg = sof_ipc4_rx_msg,
 	.set_get_data = sof_ipc4_set_get_data,
-- 
2.38.0

