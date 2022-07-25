Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 768BF5804E4
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 21:55:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7AA115F9;
	Mon, 25 Jul 2022 21:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7AA115F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658778940;
	bh=/igeBZwE6dzF0iNudQYu7rD4hBbaXOoTcWrbYWEUHoU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cbo9jO1bmXCoCRYnLJggD7yNWyVuGZpxqSea+0tdcPIn3pDuSxQcLz77vLDeED1XY
	 e/nrk/zRsboZDTaXBQehk09I3ZRJ+2j57HGxVqvUfza6W/eniwGb/qxJVzVxAdyjKB
	 2WO9vqUFd70TWptWzRMOXwaJKJvjhZv3qACV7mb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 721AFF80128;
	Mon, 25 Jul 2022 21:54:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88D81F80543; Mon, 25 Jul 2022 21:54:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAB58F80128
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 21:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAB58F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="H5SeM+v/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658778837; x=1690314837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/igeBZwE6dzF0iNudQYu7rD4hBbaXOoTcWrbYWEUHoU=;
 b=H5SeM+v/yjJUthiUIL5Xvt8jo2BpQNVHksrIW7uff3tTOVBGWjKxjB6u
 mm7225/IYfJU/ZrxiER8aM0dVrmOxbThWwfM/OyLXQOVyEvd2sJoSiyks
 CXnT7vs0T2F+eo25ZmpNJiPXcxIGUB1WOmn9q27qTW7C4DUn34ob2/+G8
 wezQKAsT9b5yJ7K+tQctfKG6rk9pbpkpZIlj7DcVTnIAHLpXKyV6obXe5
 +XIOtR89ALaJzAhE97cFZauamAmgSjkld+eXV01YzV/J/QVBPXSR3bqP+
 xL0cE3/ElO+bR0fOYmZoIE8VFlM2teZ3QtuBQwrsXItVMCKZoCwqu5dq+ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="270820359"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="270820359"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:53:51 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="627593492"
Received: from mbianco-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.71.159])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:53:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: SOF: Intel: hda: add sanity check on SSP index
 reported by NHLT
Date: Mon, 25 Jul 2022 14:53:41 -0500
Message-Id: <20220725195343.145603-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725195343.145603-1-pierre-louis.bossart@linux.intel.com>
References: <20220725195343.145603-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

We should have a limited trust in the BIOS and verify that the SSP
index reported in NHLT is valid for each platform.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index d337d55050e2..8639ea63a10d 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1527,6 +1527,7 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		if (tplg_fixup &&
 		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER &&
 		    mach->mach_params.i2s_link_mask) {
+			const struct sof_intel_dsp_desc *chip = get_chip_info(sdev->pdata);
 			int ssp_num;
 
 			if (hweight_long(mach->mach_params.i2s_link_mask) > 1 &&
@@ -1536,6 +1537,12 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 			/* fls returns 1-based results, SSPs indices are 0-based */
 			ssp_num = fls(mach->mach_params.i2s_link_mask) - 1;
 
+			if (ssp_num >= chip->ssp_count) {
+				dev_err(sdev->dev, "Invalid SSP %d, max on this platform is %d\n",
+					ssp_num, chip->ssp_count);
+				return NULL;
+			}
+
 			tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
 						       "%s%s%d",
 						       sof_pdata->tplg_filename,
-- 
2.34.1

