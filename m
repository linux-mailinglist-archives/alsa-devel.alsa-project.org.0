Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1578D899917
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 11:12:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6C092D19;
	Fri,  5 Apr 2024 11:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6C092D19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712308372;
	bh=BFKhp2p2cRaZeTDBNXe7r5uMuOf4g9Fj5CtNhBTFbc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ldx+UCiPhHbmTJoyvdUHKpeQTsbxI/0Qz+HAEERihyb5nWkGU+jRK8fXcDGK/MWeW
	 qcGPvZHVWVKqYBzs9RowGI4EueBvjCrs0D+QXmnZ3YKkVo89I8yDSL/SWXibAEnXo7
	 AhatwuBn4AIAxUVYTuJ8bkDPtSVzKb3c9IkE+ufQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B17E5F806C7; Fri,  5 Apr 2024 11:10:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D1FFF806C9;
	Fri,  5 Apr 2024 11:10:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E94EF8055C; Fri,  5 Apr 2024 11:08:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0325F80570
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 11:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0325F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ds65oOHb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308112; x=1743844112;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BFKhp2p2cRaZeTDBNXe7r5uMuOf4g9Fj5CtNhBTFbc8=;
  b=Ds65oOHb4ARIlIPCDvTlzekcI0NOvHqxyrhDudThOYahNYU4wt7ssIge
   huAGFGRprl0pmJrtiHaV+5OebLTBTBj9j7RkIRzF4fd+i/alE52WkTEoL
   Acqf/lyQrSDG4xoGCpPBC6HpAADHoIV0IPPcpcdCp+IDJmqWvkCBpkD/C
   5lVoGI25f5tyuekqQ2oESd3EHt5aC11OcDlW9612nwbhmv/Doh05pYJsx
   uf/rzK9YHCR20RvO8c7OOLofqAvH/BkKhelO3jsIQD0NSUaIqT06JFeLK
   u3H/9Cb8S2oxbVZmKfM0CxKAoverN3aU+swA4By7w4ixDdoUZ5xI9peLO
   A==;
X-CSE-ConnectionGUID: rsj98hrESTOBH36awx4E9Q==
X-CSE-MsgGUID: QHtjdZQjQjuE3N5QwWhxmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787485"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="7787485"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:08:29 -0700
X-CSE-ConnectionGUID: c8jiGaVGR6eC+hJmH3y1xA==
X-CSE-MsgGUID: 4olMcQRLTv2YzPbZfkb8cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="19042451"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:26 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 11/13] ASoC: Intel: avs: Init debugfs before booting firmware
Date: Fri,  5 Apr 2024 11:09:27 +0200
Message-Id: <20240405090929.1184068-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: APQDJDLSKAPE3L2UCPVKYEFJH5IUQQBN
X-Message-ID-Hash: APQDJDLSKAPE3L2UCPVKYEFJH5IUQQBN
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/APQDJDLSKAPE3L2UCPVKYEFJH5IUQQBN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When bringing up setups it's vital to have access to debug functionality
even if firmware boot fails. As order of probe()ing operations is
changed, update remove() procedure accordingly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index d7f8940099ce..76782a0f32bc 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -209,6 +209,7 @@ static void avs_hda_probe_work(struct work_struct *work)
 
 	snd_hdac_ext_bus_ppcap_enable(bus, true);
 	snd_hdac_ext_bus_ppcap_int_enable(bus, true);
+	avs_debugfs_init(adev);
 
 	ret = avs_dsp_first_boot_firmware(adev);
 	if (ret < 0)
@@ -217,7 +218,6 @@ static void avs_hda_probe_work(struct work_struct *work)
 	adev->nhlt = intel_nhlt_init(adev->dev);
 	if (!adev->nhlt)
 		dev_info(bus->dev, "platform has no NHLT\n");
-	avs_debugfs_init(adev);
 
 	avs_register_all_boards(adev);
 
@@ -548,9 +548,9 @@ static void avs_pci_remove(struct pci_dev *pci)
 
 	avs_unregister_all_boards(adev);
 
-	avs_debugfs_exit(adev);
 	if (adev->nhlt)
 		intel_nhlt_free(adev->nhlt);
+	avs_debugfs_exit(adev);
 
 	if (avs_platattr_test(adev, CLDMA))
 		hda_cldma_free(&code_loader);
-- 
2.25.1

