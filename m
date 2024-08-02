Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 244A1945DFB
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 14:42:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BEF140EA;
	Fri,  2 Aug 2024 14:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BEF140EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722602509;
	bh=BA+rQmWVZoNfcwVjU2aaR/O56oHGO4Ts62YtTgNThgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nP4GYJqL+R51N4hIdPYuModFpM6NTGJORKsAF/e2Ftw6fcsl+ORUuj8A00C1OvSbJ
	 MiA2dQdwQZ55I9zb9OvF0E1QZe+xg4mA9UQp9jOirFIW7V/ntgi3hwafYaW7D/lB54
	 UBCb6F/ujj5WxaG6KH7KqJrUL7DfUl0xNgowOuUw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4994CF805DA; Fri,  2 Aug 2024 14:41:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 261A1F805D3;
	Fri,  2 Aug 2024 14:41:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B56C7F80448; Fri,  2 Aug 2024 14:40:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C72FF80269
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 14:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C72FF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CTJJXDPs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722602432; x=1754138432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BA+rQmWVZoNfcwVjU2aaR/O56oHGO4Ts62YtTgNThgw=;
  b=CTJJXDPsniahHvshBdFkd9SHLmAyEhRQtX/K2ueDWUKQuAzEw95Htx1p
   WaahYdG/Ad1Y8QNZG6PdYi5ifDvgZw7IqSLoMbuLMBrXFgGF39hD6znNL
   skOfogfgHmO72DkbDb7VUVbD+oNX313IL9a5IWq500WK5nkxBGyBi8Iss
   0FaNaJn1vO72rf6x+7CISCZ1V/kgVpAczvj00xPwnVqHjwXudOfJ/ZLa1
   I9CLSd8caDXMHnm+m0G52daqTTz/b24HWVIk1tqOAjA4z9/DHYKgdUPcg
   c0I2LwPPGIN45lWTx6Dw/cmEu+oMlihGYlHTSCVFCFdscBBLDAQsiRZ+e
   w==;
X-CSE-ConnectionGUID: nqfoTZq3Qd68X0TK2peB1w==
X-CSE-MsgGUID: X0abmLloTLOmlpFJ4Yqvlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="24488201"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="24488201"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:40:29 -0700
X-CSE-ConnectionGUID: KbuZj4uFRfmqHtlZLcADWQ==
X-CSE-MsgGUID: wIP/GcPsR6m5HSpX+o+NQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="55024750"
Received: from ltuz-desk.ger.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.245.246.89])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:40:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Fred Oh <fred.oh@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v4 2/5] ASoC: SOF: Intel: add PTL specific power control
 register
Date: Fri,  2 Aug 2024 14:40:08 +0200
Message-ID: <20240802124011.173820-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240802124011.173820-1-pierre-louis.bossart@linux.intel.com>
References: <20240802124011.173820-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PMP3K6HWNRCEEEJ4M47YYWPCTNVYBJO3
X-Message-ID-Hash: PMP3K6HWNRCEEEJ4M47YYWPCTNVYBJO3
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PMP3K6HWNRCEEEJ4M47YYWPCTNVYBJO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fred Oh <fred.oh@linux.intel.com>

PTL has some differences from MTL/LNL. Need to use different register
to power up.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 16 ++++++++++++++--
 sound/soc/sof/intel/mtl.h |  2 ++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 24dcd8a3098d..e767de085f04 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -245,6 +245,18 @@ int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 	u32 cpa;
 	u32 pgs;
 	int ret;
+	u32 dsppwrctl;
+	u32 dsppwrsts;
+	const struct sof_intel_dsp_desc *chip;
+
+	chip = get_chip_info(sdev->pdata);
+	if (chip->hw_ip_version > SOF_INTEL_ACE_2_0) {
+		dsppwrctl = PTL_HFPWRCTL2;
+		dsppwrsts = PTL_HFPWRSTS2;
+	} else {
+		dsppwrctl = MTL_HFPWRCTL;
+		dsppwrsts = MTL_HFPWRSTS;
+	}
 
 	/* Set the DSP subsystem power on */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_HFDSSCS,
@@ -264,14 +276,14 @@ int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 	}
 
 	/* Power up gated-DSP-0 domain in order to access the DSP shim register block. */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_HFPWRCTL,
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, dsppwrctl,
 				MTL_HFPWRCTL_WPDSPHPXPG, MTL_HFPWRCTL_WPDSPHPXPG);
 
 	usleep_range(1000, 1010);
 
 	/* poll with timeout to check if operation successful */
 	pgs = MTL_HFPWRSTS_DSPHPXPGS_MASK;
-	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_HFPWRSTS, dsphfpwrsts,
+	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, dsppwrsts, dsphfpwrsts,
 					    (dsphfpwrsts & pgs) == pgs,
 					    HDA_DSP_REG_POLL_INTERVAL_US,
 					    HDA_DSP_RESET_TIMEOUT_US);
diff --git a/sound/soc/sof/intel/mtl.h b/sound/soc/sof/intel/mtl.h
index 7acaa7e724f4..9ab4b21c960e 100644
--- a/sound/soc/sof/intel/mtl.h
+++ b/sound/soc/sof/intel/mtl.h
@@ -12,9 +12,11 @@
 #define MTL_HFDSSCS_CPA_MASK		BIT(24)
 #define MTL_HFSNDWIE			0x114C
 #define MTL_HFPWRCTL			0x1D18
+#define PTL_HFPWRCTL2			0x1D20
 #define MTL_HfPWRCTL_WPIOXPG(x)		BIT((x) + 8)
 #define MTL_HFPWRCTL_WPDSPHPXPG		BIT(0)
 #define MTL_HFPWRSTS			0x1D1C
+#define PTL_HFPWRSTS2			0x1D24
 #define MTL_HFPWRSTS_DSPHPXPGS_MASK	BIT(0)
 #define MTL_HFINTIPPTR			0x1108
 #define MTL_IRQ_INTEN_L_HOST_IPC_MASK	BIT(0)
-- 
2.43.0

