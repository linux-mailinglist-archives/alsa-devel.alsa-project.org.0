Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5C07FD72E
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 13:54:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D73CBE75;
	Wed, 29 Nov 2023 13:54:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D73CBE75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701262465;
	bh=jCpn9ZNcLLcLhZMJvK9OlpkgsWy+ExRNpQspOpbl0XY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HW475EofnmG0U9Mq997lo8E/LXVuzj9+NX94j7wnLiDQK3HGSIfCs5ybuRFfeoKdt
	 iWByqKRD0l6eruHK3ZO0Sln5GPGi4yhMSuMM5ZjEXcW2mY8eQi6kXvwp94eXc0QCH7
	 mtyNHc1ZSTE78nn3rzl4XKlOhrYm2YPCbqGao/SE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 311F8F80608; Wed, 29 Nov 2023 13:53:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4F87F80604;
	Wed, 29 Nov 2023 13:53:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12B05F805AA; Wed, 29 Nov 2023 13:53:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D9B6F805A1
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 13:53:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D9B6F805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CGqvhvIk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262389; x=1732798389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jCpn9ZNcLLcLhZMJvK9OlpkgsWy+ExRNpQspOpbl0XY=;
  b=CGqvhvIkoCKMpYEqlVsO2sPNoSeqeeKrpVEyn4E24DZt5BytaL+JTqCf
   5DxNfWoLfcp/fROXzrqGUwqLG2eTA/GMYib6C7YkBMJn7N/xuzsvV5HEt
   ZXT7rTjPQcajOHDX0pX0WrnIY0jZXsoZeocu5K6OjizrCfyV+3dHHeI1q
   TGKr9nh2iVYfp4IWDfKpqVdSOo8Eak2mfuEX5t6mZNas4u3Dn1NWehs1y
   iOeubVMgGqDeU6lE8AqE0BtzJPuH1DmJjpde+riwR4F8Wir89br/u88rI
   c+5GVIhc8CsZ56QT7YloMUMgmwR/Sf+M0MngWgJ1Ura63awyOh28hzwes
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022924"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="392022924"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:53:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="17174631"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:53:04 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 06/13] ASoC: SOF: sof-pci-dev: Save the default IPC type and
 path overrides
Date: Wed, 29 Nov 2023 14:53:20 +0200
Message-ID: <20231129125327.23708-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BJ22IVZTNOPQ6GYU5FGE5T6L2CIM3Z6R
X-Message-ID-Hash: BJ22IVZTNOPQ6GYU5FGE5T6L2CIM3Z6R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJ22IVZTNOPQ6GYU5FGE5T6L2CIM3Z6R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Store the default IPC type and the overrides to ipc_file_profile_base

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-pci-dev.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 64b326e3ef85..becc85b27d51 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -190,6 +190,7 @@ static void sof_pci_probe_complete(struct device *dev)
 
 int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
+	struct sof_loadable_file_profile *path_override;
 	struct device *dev = &pci->dev;
 	const struct sof_dev_desc *desc =
 		(const struct sof_dev_desc *)pci_id->driver_data;
@@ -334,6 +335,20 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 			sof_pdata->tplg_filename = sof_dmi_override_tplg_name;
 	}
 
+	path_override = &sof_pdata->ipc_file_profile_base;
+	path_override->ipc_type = sof_pdata->ipc_type;
+	path_override->fw_path = fw_path;
+	path_override->fw_name = fw_filename;
+	path_override->fw_lib_path = lib_path;
+	path_override->tplg_path = tplg_path;
+	path_override->tplg_name = sof_pdata->tplg_filename;
+
+	if (dmi_check_system(community_key_platforms) &&
+	    sof_dmi_use_community_key) {
+		path_override->fw_path_postfix = "community";
+		path_override->fw_lib_path_postfix = "community";
+	}
+
 	/* set callback to be called on successful device probe to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_pci_probe_complete;
 
-- 
2.43.0

