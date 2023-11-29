Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B5C7FD744
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 13:57:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C17DDDF3;
	Wed, 29 Nov 2023 13:56:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C17DDDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701262628;
	bh=DrPNJB1Cx5nxS/6nHhyoCgL07ikrf7u4dP2TnnOz++k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aPxYW8xGzav/3KOBEPJHcuz5/IwUxuc3BkcUL2z9iUlBnXR2OFO4Q7g0fMdwNmYah
	 lEfKAGpcpJ/mgV8OKrCKg2YpdEm72J3bSTdu3wtVQE0ySMDdNIcqgpPipW5HBazPjG
	 R9fmaKhww32eMuYlQ9A3Dwzcf1haNKvktytJqrwE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBC92F807A6; Wed, 29 Nov 2023 13:53:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EF54F80807;
	Wed, 29 Nov 2023 13:53:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9F54F805AD; Wed, 29 Nov 2023 13:53:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1E9FF8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 13:53:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1E9FF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nKW3dV6L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262384; x=1732798384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DrPNJB1Cx5nxS/6nHhyoCgL07ikrf7u4dP2TnnOz++k=;
  b=nKW3dV6LzrKD0f0Y+aZiMZCrAmbbDwvFIOXeWOFZgugHDQpfyfIfAiag
   kYnhtdtc4q/e9BhtQbqqC2IVF3eTkq6dw1Es4IQ+XoqpfPIUFT+7AOVd1
   QIlSQy/GCSDRzr0SidDrp9xm3K1vf+q1Rd2zQ3tpEztTyAcQ5/JT4abcy
   W8XgBd7jhM6QGwEkGVfRihO23nyRUnOdkK8EDooyaTQ27OG2/p4nR86MJ
   dRYVCRcsF/acauWViwdc1dHjVuablGm0GzxdpqFqej69qCfHRSP/t+VhT
   GsX/7vcyF8sU8R7b0nKdI4Pk5nBIw5GSnp85R8cjypVg6cPP2b+nU++TG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022897"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="392022897"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:53:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="17174616"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:53:00 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 04/13] ASoC: SOF: sof-acpi-dev: Save the default IPC type and
 path overrides
Date: Wed, 29 Nov 2023 14:53:18 +0200
Message-ID: <20231129125327.23708-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MYZV2KNGUNF45WD6ZOTHHTFUWXSZM6S7
X-Message-ID-Hash: MYZV2KNGUNF45WD6ZOTHHTFUWXSZM6S7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MYZV2KNGUNF45WD6ZOTHHTFUWXSZM6S7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Store the default IPC type and the firmware and topology path overrides to
ipc_file_profile_base

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-acpi-dev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 84a4a0a3318e..87c0c2edc4c9 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -87,6 +87,10 @@ int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc
 	else
 		sof_pdata->tplg_filename_prefix = desc->default_tplg_path[SOF_IPC_TYPE_3];
 
+	sof_pdata->ipc_file_profile_base.ipc_type = desc->ipc_default;
+	sof_pdata->ipc_file_profile_base.fw_path = fw_path;
+	sof_pdata->ipc_file_profile_base.tplg_path = tplg_path;
+
 	/* set callback to be called on successful device probe to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_acpi_probe_complete;
 
-- 
2.43.0

