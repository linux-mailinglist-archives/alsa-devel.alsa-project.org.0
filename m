Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AD47F9DF1
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 11:52:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B713C84D;
	Mon, 27 Nov 2023 11:52:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B713C84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701082368;
	bh=NMSe3c8+Xo+G3eS2Zqx/vyUseR9hOOuVhhGMZHfayJU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vanpEe0vI3n848Zqj2LZ7B5XWjvpp/nSpK55ZRQYvpxrzolscD3N+K6iW9fqlnsrA
	 O6DiM/NxemwHhrvNsP9gyxZKw4dlk3rhZ8WnFxNCQyJQAUSftv6FF5o4PKdHAmVesC
	 Ts5HPfuC91oPMela8t15KTEtBFLsao9ruKc4Xx7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AE99F8057A; Mon, 27 Nov 2023 11:52:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 227C3F80579;
	Mon, 27 Nov 2023 11:52:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 290F3F801D5; Mon, 27 Nov 2023 11:52:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 391DDF8007E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 11:52:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 391DDF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=a85GgXIp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701082327; x=1732618327;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NMSe3c8+Xo+G3eS2Zqx/vyUseR9hOOuVhhGMZHfayJU=;
  b=a85GgXIpz4fzMqMrVx6FhzFmxPUbdSsn6l1lYeWsL4tYpZW4GwBe+fUi
   MCyE0ChoTL+iD7W3QnMENW7loyJBbDFyHXUjdCPiNiHVcVMC9KcDvHDF0
   x1Rg09qLrpLscbJe7B22VUN6w0JTW1RUf+mJSwin0FTxuJGozWpdoyemE
   FNZO+suWnBiITDiteOMzYrps86mjISoVk50r8g728bWyxfyBeLblq55gw
   PIQ5N3s2srlzJayNeTbVv1MzQ3KTF8d4nOhnMhpmdFoNGxJcP1tKsj6st
   WvdmHNA/zBeisB412BqNB+5qFgmMkeoBNHPBseQdN0NS3aqMqTcWMjtDJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="377713057"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="377713057"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 02:52:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="797206526"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600";
   d="scan'208";a="797206526"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 02:52:01 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yong.zhi@intel.com
Subject: [PATCH] ASoC: SOF: Intel: mtl: call dsp dump when boot retry fails
Date: Mon, 27 Nov 2023 12:52:35 +0200
Message-ID: <20231127105235.30071-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ONOGHOCVA64BZCV2GK4NRCNMHBDCNNAS
X-Message-ID-Hash: ONOGHOCVA64BZCV2GK4NRCNMHBDCNNAS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONOGHOCVA64BZCV2GK4NRCNMHBDCNNAS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Yong Zhi <yong.zhi@intel.com>

Call snd_sof_dsp_dbg_dump() with the same flags/dump_msg
as used in function hda_loader.c/cl_dsp_init().

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 254dbbeac1d0..3ef9e5c37028 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -440,7 +440,8 @@ int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 	unsigned int status;
-	u32 ipc_hdr;
+	u32 ipc_hdr, flags;
+	char *dump_msg;
 	int ret;
 
 	/* step 1: purge FW request */
@@ -493,8 +494,18 @@ int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 	return 0;
 
 err:
-	snd_sof_dsp_dbg_dump(sdev, "MTL DSP init fail", 0);
+	flags = SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX | SOF_DBG_DUMP_OPTIONAL;
+
+	/* after max boot attempts make sure that the dump is printed */
+	if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
+		flags &= ~SOF_DBG_DUMP_OPTIONAL;
+
+	dump_msg = kasprintf(GFP_KERNEL, "Boot iteration failed: %d/%d",
+			     hda->boot_iteration, HDA_FW_BOOT_ATTEMPTS);
+	snd_sof_dsp_dbg_dump(sdev, dump_msg, flags);
 	mtl_dsp_core_power_down(sdev, SOF_DSP_PRIMARY_CORE);
+
+	kfree(dump_msg);
 	return ret;
 }
 
-- 
2.43.0

