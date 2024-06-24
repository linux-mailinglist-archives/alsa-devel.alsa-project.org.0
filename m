Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE9291497B
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 14:13:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 834FDDF6;
	Mon, 24 Jun 2024 14:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 834FDDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719231203;
	bh=Dp+m3q2E7PgVso4OtZK0clbxLP/VF/JVrzwZvIK4P+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fU3DS72v/x15eO+dIykhTqqY8ScrzM67d5SB8gO2G4ArGEQDgxKPEWdla19xppSo5
	 UENV5K8Hkjlgu/TevTRPTc4KptchTKul6WzTSkvY8QcbkyTjPDBx9/3gFsSd2bINFw
	 MjyRkAfoakWqHqv11gAfWYPGsoJFaAKMQqs1zd00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBA03F8065D; Mon, 24 Jun 2024 14:11:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 111C9F8064C;
	Mon, 24 Jun 2024 14:11:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2049DF805D4; Mon, 24 Jun 2024 14:11:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D5CFF804F2
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 14:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D5CFF804F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RvZwUb/w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231104; x=1750767104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dp+m3q2E7PgVso4OtZK0clbxLP/VF/JVrzwZvIK4P+Y=;
  b=RvZwUb/wFjnOFzvtUQh4eVeobJp+B/YHehLf9c0/Oe5zdsP+5SeKYwE2
   oebTAyBkTi/zAkb8TJ9bFCDXy6oOUzRZAGy2XHd5N57YRwz9GevAF+4f1
   PPxBhXB/mCNF2LYd1O5yauas/6qcEjeIMirzi7vBGwkUA11lVPEOeqkdv
   olHBhNI0Sg3BEKm2zKxEKieeEHmq3OlkQKD+OiIMxZPRcMkFYOEkBSmE6
   PXF4SD511Qn6d87GLqSeul+baCDgDlXMKl4lffdIBiZoezNNKAdGfNJF6
   GdsiQoDnFcCzuKSRYrxkeYTt1dS21NpXtaFD6wjJ+KRSHbggk6YtE6sZh
   Q==;
X-CSE-ConnectionGUID: 6R//XlsvTkmkUlVAw36w8Q==
X-CSE-MsgGUID: 4ovad9m0RR6Hl7e8/MDNFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15887557"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="15887557"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:11:43 -0700
X-CSE-ConnectionGUID: rWcG9NItTY6ZNe9Rn61Y2Q==
X-CSE-MsgGUID: alK3MkPFQUWog/MnBtxX3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="43091222"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:11:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 4/4] ASoC: Intel: sof_sdw: select PINCTRL_CS42L43 and
 SPI_CS42L43
Date: Mon, 24 Jun 2024 14:11:19 +0200
Message-ID: <20240624121119.91552-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HH7CEET4Y4PMPZQ3DXAWFEI6YMDZUTCL
X-Message-ID-Hash: HH7CEET4Y4PMPZQ3DXAWFEI6YMDZUTCL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HH7CEET4Y4PMPZQ3DXAWFEI6YMDZUTCL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Cs42l43 bridge mode needs the two configurations.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 4e0586034de4..f1faa5dd2a4f 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -677,6 +677,8 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_CS42L43_SDW
 	select MFD_CS42L43
 	select MFD_CS42L43_SDW
+	select PINCTRL_CS42L43
+	select SPI_CS42L43
 	select SND_SOC_CS35L56_SPI
 	select SND_SOC_CS35L56_SDW
 	select SND_SOC_DMIC
-- 
2.43.0

