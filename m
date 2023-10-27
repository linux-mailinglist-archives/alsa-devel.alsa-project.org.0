Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0106B7D95FF
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 13:07:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6236CDF0;
	Fri, 27 Oct 2023 13:06:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6236CDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698404840;
	bh=fOfitkbsDWDdgR7///RvDABbFaiYSzh0npo5N5wdWdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b3JI9bTardqCT+igrcUt/R7H9UjHVnBQltzgj5DbPJ1/4eoUNN8/D1Xb93KL0GLVm
	 Suisx313Czb1azdM2yteYWyuPX77eEMmvPvfl4zhGC6DWRgXRbOhb5gNQfxP2Q7Xs4
	 MfXrQNMyzpqHK6tDyXQwu5QH9hTR1vKaUZ6epN5I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BBD2F8055A; Fri, 27 Oct 2023 13:05:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62E58F80558;
	Fri, 27 Oct 2023 13:05:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F124F8012B; Fri, 27 Oct 2023 13:05:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CA67F8012B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 13:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CA67F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KHXZmyzW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698404734; x=1729940734;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fOfitkbsDWDdgR7///RvDABbFaiYSzh0npo5N5wdWdg=;
  b=KHXZmyzWW61V+0QNSnx7LqoQakJUpO5DJ8PMQ/TUKWUmi/FwZcWHi2NT
   8HwGUWHxxEFXeqHQtWF8obIUrYdw35kWNsUgEbSV4k12v6wgzZyMt1ZT2
   jxVH8aUbpe6kB3QaipNXjKX/wD3RpUF1Y5n+tL1DFPvUE25uQm5BpILES
   ZkVVvKp1WTg6GkufOMy5E6beDr2llFDNB2ZhivwE5LVncvcEwbwKiOfyO
   3sWr9BFOy8dosce0qGdNFpCAuLlf+X1tQiyhDQC4IkrzV0c47TUJdiZ6u
   3by7Rv4b7VNCwKww1xkHWda2Ddvb9jz1Fj+4s5RvgH6DCgXw6kHBdfBRQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="418866481"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200";
   d="scan'208";a="418866481"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 04:05:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="736054991"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200";
   d="scan'208";a="736054991"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orsmga006.jf.intel.com with ESMTP; 27 Oct 2023 04:05:30 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 2/2] ASoC: Intel: avs: Add rt5514 machine board
Date: Fri, 27 Oct 2023 13:05:37 +0200
Message-Id: <20231027110537.2103712-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027110537.2103712-1-amadeuszx.slawinski@linux.intel.com>
References: <20231027110537.2103712-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WYHRPDKXORIBQ6WFQ3BOHM3AJBCQWMBS
X-Message-ID-Hash: WYHRPDKXORIBQ6WFQ3BOHM3AJBCQWMBS
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WYHRPDKXORIBQ6WFQ3BOHM3AJBCQWMBS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In order to support Eve chromebooks add rt5514 configuration to board
lookup table. rt5514 is used for capture in DMIC configuration on SSP 0
and TDM 1.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/board_selection.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index c10fff705496..8e91eece992d 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -135,6 +135,15 @@ static struct snd_soc_acpi_mach avs_kbl_i2s_machines[] = {
 		},
 		.tplg_filename = "max98927-tplg.bin",
 	},
+	{
+		.id = "10EC5514",
+		.drv_name = "avs_rt5514",
+		.mach_params = {
+			.i2s_link_mask = AVS_SSP(0),
+		},
+		.pdata = (unsigned long[]){ 0x2, 0, 0, 0, 0, 0 }, /* SSP0 TDMs */
+		.tplg_filename = "rt5514-tplg.bin",
+	},
 	{
 		.id = "10EC5663",
 		.drv_name = "avs_rt5663",
-- 
2.34.1

