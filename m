Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EEB70972C
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 14:18:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B66EF6C1;
	Fri, 19 May 2023 14:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B66EF6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684498717;
	bh=GnlcbuHN3eUB4vi5MH4ZwiwwbuNCRhLF1S/ytDw3KOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I57zeDtQJ7CxsJjiRpoyzkmgeyHxN7b+uQknHA6NYDc7NnA49/8vlPV6TyD+b8WDN
	 F7gdD4jxbB/70gN5RWZAQo3E2kyvBpwxHcJ6zhIwivskNhR+7D6hKTozEvJrlQaN+m
	 xVPvm9krIhQCeTgzzyoetm/CDTAnsEYfdp3ty9/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0680F80580; Fri, 19 May 2023 14:16:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3446FF8058C;
	Fri, 19 May 2023 14:16:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4196FF80553; Fri, 19 May 2023 14:16:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96877F802E8
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 14:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96877F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Vo8ui6Px
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684498562; x=1716034562;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GnlcbuHN3eUB4vi5MH4ZwiwwbuNCRhLF1S/ytDw3KOc=;
  b=Vo8ui6PxZ/IUjgtm3lkPMat/xB16gzq1jV/RWJxoW1LVtMIhSV8wTgcJ
   ex7Hjme3wKMk67PHCk5nv5p2q4fASRHtfNY4qSc5a8o2O8n5wJ+ltc42m
   4aqGEUgCC3VTNqoXdRvCiyxMJIKom2XUdqLuliJMmsWHKPKzcxqAAP29G
   V8J9wWQIAC9UPh7lXGxo38RwEyK1K2R7pbMS0BC4VtKRPN7HRw4oCTnea
   9Qt5ouHqF6V/468pMBglYaR3IpuygAm3tiKMdijLbEIJX8eWO+A5MWQxw
   m8ZNlnA7llbx/xCl+XQiajVstPfgGClPSAqG1/fH1EDeHAFdtRkR2G9dk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="355584436"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="355584436"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 05:16:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="733283676"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="733283676"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga008.jf.intel.com with ESMTP; 19 May 2023 05:15:58 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 4/7] ASoC: Intel: avs: Fix declaration of enum
 avs_channel_config
Date: Fri, 19 May 2023 22:17:08 +0200
Message-Id: <20230519201711.4073845-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519201711.4073845-1-amadeuszx.slawinski@linux.intel.com>
References: <20230519201711.4073845-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NZ3D3OC5RGLD4GIRJRTEG6W4LY3ZI7TB
X-Message-ID-Hash: NZ3D3OC5RGLD4GIRJRTEG6W4LY3ZI7TB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NZ3D3OC5RGLD4GIRJRTEG6W4LY3ZI7TB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Cezary Rojewski <cezary.rojewski@intel.com>

Constant 'C4_CHANNEL' does not exist on the firmware side. Value 0xC is
reserved for 'C7_1' instead.

Fixes: 580a5912d1fe ("ASoC: Intel: avs: Declare module configuration types")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/messages.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index d3b60ae7d743..7f23a304b4a9 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -619,7 +619,7 @@ enum avs_channel_config {
 	AVS_CHANNEL_CONFIG_DUAL_MONO = 9,
 	AVS_CHANNEL_CONFIG_I2S_DUAL_STEREO_0 = 10,
 	AVS_CHANNEL_CONFIG_I2S_DUAL_STEREO_1 = 11,
-	AVS_CHANNEL_CONFIG_4_CHANNEL = 12,
+	AVS_CHANNEL_CONFIG_7_1 = 12,
 	AVS_CHANNEL_CONFIG_INVALID
 };
 
-- 
2.34.1

