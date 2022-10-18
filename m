Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F751602B58
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C436B9CBD;
	Tue, 18 Oct 2022 14:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C436B9CBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095074;
	bh=0/jrLrhSQQPaTWdXMN7fDUjo7D4gNP0zMQYyJX/XApk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EWSzHjDkSXY7zTqw4I/QL/imLha9eqylFZaHBkzr3pSl9KiYwNX9CCwFgKZOd0DqX
	 TTPnUbr4dHpxaHvdvB+ozv+rudfTTgkB9YDH2rvCesSjRLmxHTLpZJveOQ5AxVx8l4
	 2NvaCt0xKAgg5xOGBmNsu0pElQ8l63p9iyghydWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0121EF8024C;
	Tue, 18 Oct 2022 14:09:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C462F80549; Tue, 18 Oct 2022 14:09:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CB69F800AB
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CB69F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Sr5l0yWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094946; x=1697630946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0/jrLrhSQQPaTWdXMN7fDUjo7D4gNP0zMQYyJX/XApk=;
 b=Sr5l0yWoL4HzslFkfrkDM1hQGCwwY2OtokcAgIKd9tc9E7Agfy5yGj9u
 J46EHVeZTxINZYZNxAFRWI/0uGlwl45UiS/YfM6rH+6tp1pVSxDYLi+51
 mv9MLd6vKKxs44niHvGkwC6q7p/QvEMRqgVujMneTy44RJ3WWP+NRUKeh
 fZItu6CXhWjFyk4Efw8FgJYfMjygXjBN2XELlwCpJ2+Ih50A/4SKj45RK
 7T9QFZwwzZlBU7n8ZA0Q3v9WpDkZgyS5mXAPOp6Cy+ZEPY/oD9WzojBBO
 HGRm1jHL7fy7kQGYZKUNCSYuAgU+u6rspNJsdWgKLKYxWoNgG39KMUu/o g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="303697474"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="303697474"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:04 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579757842"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579757842"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:02 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 04/19] ASoC: SOF: Intel: hda-loader: Use the basefw firmware
 container directly
Date: Tue, 18 Oct 2022 15:09:01 +0300
Message-Id: <20221018120916.19820-5-peter.ujfalusi@linux.intel.com>
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

Switch to access to the firmware struct via sdev->basefw container to
unblock the removal of the firmware information from plat_data.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 98812d51b31c..147ddc5ee932 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -318,7 +318,6 @@ int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream
 
 int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 {
-	struct snd_sof_pdata *plat_data = sdev->pdata;
 	struct hdac_ext_stream *iccmax_stream;
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct firmware stripped_firmware;
@@ -329,12 +328,12 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 	/* save the original LTRP guardband value */
 	original_gb = snd_hdac_chip_readb(bus, VS_LTRP) & HDA_VS_INTEL_LTRP_GB_MASK;
 
-	if (plat_data->fw->size <= plat_data->fw_offset) {
+	if (sdev->basefw.fw->size <= sdev->basefw.payload_offset) {
 		dev_err(sdev->dev, "error: firmware size must be greater than firmware offset\n");
 		return -EINVAL;
 	}
 
-	stripped_firmware.size = plat_data->fw->size - plat_data->fw_offset;
+	stripped_firmware.size = sdev->basefw.fw->size - sdev->basefw.payload_offset;
 
 	/* prepare capture stream for ICCMAX */
 	iccmax_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
@@ -405,13 +404,13 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 
 	chip_info = desc->chip_info;
 
-	if (plat_data->fw->size <= plat_data->fw_offset) {
+	if (sdev->basefw.fw->size <= sdev->basefw.payload_offset) {
 		dev_err(sdev->dev, "error: firmware size must be greater than firmware offset\n");
 		return -EINVAL;
 	}
 
-	stripped_firmware.data = plat_data->fw->data + plat_data->fw_offset;
-	stripped_firmware.size = plat_data->fw->size - plat_data->fw_offset;
+	stripped_firmware.data = sdev->basefw.fw->data + sdev->basefw.payload_offset;
+	stripped_firmware.size = sdev->basefw.fw->size - sdev->basefw.payload_offset;
 
 	/* init for booting wait */
 	init_waitqueue_head(&sdev->boot_wait);
-- 
2.38.0

