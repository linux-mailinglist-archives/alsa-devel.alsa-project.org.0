Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF3D870A0F
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 20:06:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D67A9DE5;
	Mon,  4 Mar 2024 20:06:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D67A9DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709579190;
	bh=j+q5dWt1plxctsU8WpiPca8LVYrRcW5b2lgmqcYGMdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EOp+6/KaF2EGnnMCycTxExthZAkGDWNoI4GdZMeLGjStp9Ee62CdUq/ywpb+KTPRq
	 wmbn/o0pug2LZHfkgCO1FSa9LJRgkDby+6LByDYSBNbyjEgGoK+/3Z4fHdl7pnaKoP
	 ZUHbQ0R+aRC/xIeeW5d7CK7C6cdMosGt7x2zKB0Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7D9DF80680; Mon,  4 Mar 2024 20:04:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E153CF80679;
	Mon,  4 Mar 2024 20:04:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D64EF805D7; Mon,  4 Mar 2024 20:04:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3EF1F8024E
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 20:04:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3EF1F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hx5aVwd9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709579073; x=1741115073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j+q5dWt1plxctsU8WpiPca8LVYrRcW5b2lgmqcYGMdc=;
  b=hx5aVwd9GjmjmgHNFBf3W3LUljxYkCMGhsO579vMr3TSsQ+B0bErO17Q
   UAKyriZLdjDOzwTx8bo0n/2PDSa3vDSEtAxmOYIY61V1ghVVaIMgtpbXx
   NJX7yXbD6iiAmY4BpiCiCCvMyrnmcERLcgM4YVSJfrU0KrZBd9fw/qBFC
   lFDVXyWGqyE9FtKp5ayP7T+9kfDHKQvjUQqsbTQc9oQvk/tKb7WhRYV8g
   5Q4FTSBLTwr9p6RCt3fjiOQxI7SO6VcuPWA5il6ZgfeF7nO2Pb8e4c8Ns
   r2t17RMGpPpJijS/rI+qPo8jblSx1ndji6vMAFcqZVYf9zeB7i56JdO3e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4257285"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="4257285"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 11:04:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="13788285"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 04 Mar 2024 11:04:28 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/5] ASoC: Intel: avs: ssm4567: Do not ignore route checks
Date: Mon,  4 Mar 2024 20:05:34 +0100
Message-Id: <20240304190536.1783332-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304190536.1783332-1-cezary.rojewski@intel.com>
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VL6L4D542SUI2CRFPKFI55WS6K376AM2
X-Message-ID-Hash: VL6L4D542SUI2CRFPKFI55WS6K376AM2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VL6L4D542SUI2CRFPKFI55WS6K376AM2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A copy-paste from intel/boards/skl_nau88l25_ssm4567.c made the avs's
equivalent disable route checks as well. Such behavior is not desired.

Fixes: 69ea14efe99b ("ASoC: Intel: avs: Add ssm4567 machine board")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/ssm4567.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 4a0e136835ff..b64be685dc23 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -172,7 +172,6 @@ static int avs_ssm4567_probe(struct platform_device *pdev)
 	card->dapm_routes = card_base_routes;
 	card->num_dapm_routes = ARRAY_SIZE(card_base_routes);
 	card->fully_routed = true;
-	card->disable_route_checks = true;
 
 	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
 	if (ret)
-- 
2.25.1

