Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 437F8605FFB
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:17:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D81A7B964;
	Thu, 20 Oct 2022 14:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D81A7B964
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268274;
	bh=pG5f4b7Y7kY7R2vw4tdnNGiff5DiDZqyzyt1sLyP1P4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K+C7R9PDtYWb/ljW7C29C2tMqzU0VlkOdujxCAfSXsK0gaea+GqPnacgKOffDNUF1
	 3DaC5ygPnj3unJ0xSknfsOGs5relGUW+nnk6WhxIzKI48+AndR73mU7BhKhYxq6TRj
	 Opm1zpxh3tyPEHZEdYKcQmQ9ysDWPmMMZ5cBThGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CB4AF805E2;
	Thu, 20 Oct 2022 14:13:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8081EF805E1; Thu, 20 Oct 2022 14:13:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03E1EF805D4
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03E1EF805D4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IZCmOHAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267987; x=1697803987;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pG5f4b7Y7kY7R2vw4tdnNGiff5DiDZqyzyt1sLyP1P4=;
 b=IZCmOHATOr6DIWxyqmEBM3OZGdbuepwSahyAXR9Cf9EuuY8l+ekwc9dD
 cJBaKF+V/za2PYc6NRftA1e+NV8ieT6poTkq3KrRRDaZRtiYomYfwA3vn
 sSABErmMqPnCv4igWsUklcb93BADmKDC+tfOcDuf+EQjrQj5KEtcb/T34
 7mnIlUryPJbmJp1yJ0A7D0z+BoiCDXLSsU3m8Rlipzcq1awDYjrX+f9Oc
 K2bdfcBkVZVMUtMsmcXMO5NS/8VZNFGyL/BXn1V3LsfQlg0e6I9rEjgQ5
 Fj6l2Ekq9kIC1SES4iBrMuiBa8q4f/bthjM6ht3xu0CEqNpjl/gD3bJtw Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333256435"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333256435"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:13:04 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="663010173"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="663010173"
Received: from awrynn-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:13:01 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 17/19] ASoC: SOF: ipc4: Stop using the
 query_fw_configuration fw_loader ops
Date: Thu, 20 Oct 2022 15:12:36 +0300
Message-Id: <20221020121238.18339-18-peter.ujfalusi@linux.intel.com>
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
index cafbd75d8762..91c4ea72b4b6 100644
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
2.38.1

