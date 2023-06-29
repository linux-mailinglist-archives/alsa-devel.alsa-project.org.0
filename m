Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 894BE7424BA
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 13:08:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A422F83B;
	Thu, 29 Jun 2023 13:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A422F83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688036926;
	bh=L+0BxRft9Eo/S5hfLVxrAW60paJHdsg55r5iG9negCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SVkzc/JY16YQ0wNywR3WZyk63cFaYZigj2bfsgIFl7aacw6nBrSI31kLNoGDAnCYz
	 GVr2wzXV8wtQxUC90wWdp60oeoPBhizqzGPzxfQtpttL02/i8rtS32AsVNlMABWkIl
	 jBD+uxH8p99GQgxBrSuDgjJGEtYrIhvxmHZWsQAg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5A28F80558; Thu, 29 Jun 2023 13:07:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BF62F80549;
	Thu, 29 Jun 2023 13:07:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7D48F80246; Thu, 29 Jun 2023 13:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B5B8F80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 13:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B5B8F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BrbaWtJv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688036822; x=1719572822;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L+0BxRft9Eo/S5hfLVxrAW60paJHdsg55r5iG9negCY=;
  b=BrbaWtJvixr61CZ/nnC3zY3cQLMo8oHKNrEVr8zl3JiHQC6xykAPQa3F
   ZqP+6xdWhs3R0gPKAWWJ8GrRy6QSXJNiXUrwtFGKuf9jK0TnmLakaAlaS
   T7xrWwg9yvAqcnsOFNYhSgncsVyrEbWsIEzrg6qZO4cNZeDxUWAidJtCB
   HJhrnhoyKImA8UW0jv+sycrwgaVJjZ9DSaQasmWKMmqhygj4nkqCcOJJ6
   U7+F1LIddXVJJjMkiLfemeb9fTMi93yc/8ENAKfAMWYzENz/oFoGNLSXM
   8TyVk6PVlnDyD18/qQP+frld2NS3/OgRHHg4CzUCwfc+GRgP4223+6ubF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="365543572"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="365543572"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 04:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="1047732690"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="1047732690"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jun 2023 04:06:51 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	zhuning@everest-semi.com,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/8] ASoC: codecs: es8316: Add support for 24 MHz MCLK
Date: Thu, 29 Jun 2023 13:24:42 +0200
Message-Id: <20230629112449.1755928-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230629112449.1755928-1-cezary.rojewski@intel.com>
References: <20230629112449.1755928-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J2QS7P32DAYSXVGYWTQI74RO5PLFHIMN
X-Message-ID-Hash: J2QS7P32DAYSXVGYWTQI74RO5PLFHIMN
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2QS7P32DAYSXVGYWTQI74RO5PLFHIMN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

MCLK operates on 24MHz on Intel KabyLake-based platforms. To support
that frequency add new MCLK-LRCK ratio.

While at it, utilize ARRAY_SIZE rather than hardcode to improve
robustness.

Cc: Zhu Ning <zhuning@everest-semi.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/es8316.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 34cf60769b62..5d1fd505d6ba 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -27,9 +27,9 @@
  * MCLK/LRCK ratios, but we also add ratio 400, which is commonly used on
  * Intel Cherry Trail platforms (19.2MHz MCLK, 48kHz LRCK).
  */
-#define NR_SUPPORTED_MCLK_LRCK_RATIOS 6
+#define NR_SUPPORTED_MCLK_LRCK_RATIOS ARRAY_SIZE(supported_mclk_lrck_ratios)
 static const unsigned int supported_mclk_lrck_ratios[] = {
-	256, 384, 400, 512, 768, 1024
+	256, 384, 400, 500, 512, 768, 1024
 };
 
 struct es8316_priv {
-- 
2.25.1

