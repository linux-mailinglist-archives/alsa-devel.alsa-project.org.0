Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFF688C8A0
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:09:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD4252BE9;
	Tue, 26 Mar 2024 17:09:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD4252BE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469385;
	bh=CqMw0hQCpoYpsInZ7ccCCDW4BJ6/9Rb+vQzek9KYCzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E93PF0FbKSUP5phXdvCn3z/QSlJ5vxeaAeFhT7/ykhaHvhnOLRm4UTaT8eVmJrJk0
	 U79VyAJZiokgsqmKorh8u0b1w1a/IOe8IEYR/kIn8kWncA5G4fEwMeVeu/saFyRoD3
	 60CZ+ayOAQ646i2QN+BHhW/0IQTZLPVW9qZ3PlWY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3009F805BE; Tue, 26 Mar 2024 17:06:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBC70F807B5;
	Tue, 26 Mar 2024 17:06:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 921C9F80636; Tue, 26 Mar 2024 17:06:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6520F80579
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6520F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gA6CTvP3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469135; x=1743005135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CqMw0hQCpoYpsInZ7ccCCDW4BJ6/9Rb+vQzek9KYCzw=;
  b=gA6CTvP3WYEtSFsXhhOP7izAbgOk6hOLpDfMQxT8TzzY4W/8c8x/BHx7
   lCcMVqd+cmT8nwq8G3HIEfv/uyk1NmCc7Qr2jq0tK+ABbaXNb6dVpR+Tz
   t79wqB1/AHQKUyIAaxLWdWkDWHdiAwJUy7sHkfOxWvp6GX2n5OOZ0ssAi
   QpFwqvPQCOdQBcbMO0CZkmh7zRG96NUEtRhmrfPiJYiUBhj8stZJvZ2qE
   3XD4mgA0W59APTdtKAhVhuymEtbHJKSVQxiKsdMsp9vkDp1/mK22KDomo
   F2iiGQWBmBWyMpeYn+YTecSJIUSTe82Vezs7c0cpxhrCDNg7MaE9h121B
   A==;
X-CSE-ConnectionGUID: hAdgoiaQSTW6KwZ37q5loQ==
X-CSE-MsgGUID: H9j3i7EXSh6m8hwAXTjE0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260385"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260385"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482198"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/34] ASoC: Intel: sof_sdw: Use for_each_set_bit
Date: Tue, 26 Mar 2024 11:04:04 -0500
Message-Id: <20240326160429.13560-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4KXACAHDD5LWVJJQZZQGG3EY75RNYNO3
X-Message-ID-Hash: 4KXACAHDD5LWVJJQZZQGG3EY75RNYNO3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KXACAHDD5LWVJJQZZQGG3EY75RNYNO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Rather than open coding a loop to process each bit use for_each_set_bit.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0ffa6e36dbed..a12283d3e1cc 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -5,6 +5,7 @@
  *  sof_sdw - ASOC Machine driver for Intel SoundWire platforms
  */
 
+#include <linux/bitmap.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/module.h>
@@ -1644,7 +1645,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	char *codec_name, *codec_dai_name;
 	int i, j, be_id = 0;
 	int hdmi_num;
-	int ssp_mask;
+	unsigned long ssp_mask;
 	int ret;
 
 	ret = get_dailink_info(dev, adr_link, &sdw_be_num, &codec_conf_num);
@@ -1782,12 +1783,10 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (!ssp_num)
 		goto DMIC;
 
-	for (i = 0, j = 0; ssp_mask; i++, ssp_mask >>= 1) {
+	j = 0;
+	for_each_set_bit(i, &ssp_mask, BITS_PER_TYPE(ssp_mask)) {
 		int playback, capture;
 
-		if (!(ssp_mask & 0x1))
-			continue;
-
 		name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", i);
 		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", i);
 		codec_name = devm_kasprintf(dev, GFP_KERNEL, "i2c-%s:0%d",
-- 
2.40.1

