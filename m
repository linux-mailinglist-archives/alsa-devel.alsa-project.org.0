Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C2F84DE2E
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 11:24:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1475E826;
	Thu,  8 Feb 2024 11:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1475E826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707387883;
	bh=RtezLeKtYqzMMlD7l4M22QwSiNc/vjvRHMceNkkvGLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pGoBlLB8uPOv9RcrEKFzVMLGLNxgrosqSAU/Fa0t3qHRa4vqKxuFyHvbm7Cb4dn+8
	 HcvsPoblN+O9F9EZqxVUV0WHxm8kIwL4HYVANP9QNV4vt1+JFjOyQdcBaRI131ojpu
	 9ZVYYD7iZoQJe5Em+srxgtBnch65h4C7GfDiK8Ak=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17FF0F805C7; Thu,  8 Feb 2024 11:23:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 082F7F805CB;
	Thu,  8 Feb 2024 11:23:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7DBFF80548; Thu,  8 Feb 2024 11:23:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95DBBF800EE
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 11:23:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95DBBF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iF3EIEgK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707387819; x=1738923819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RtezLeKtYqzMMlD7l4M22QwSiNc/vjvRHMceNkkvGLc=;
  b=iF3EIEgKYba4DMUXT4bRkq71CLrToDq85ecGEoPmaNFBGvLjMfgwacHg
   5JAaoyM9Pvb/TSTgrx1jS6xt9QXLOT2dYgT00eQv8Wc8W9qXBPsvHB7JE
   l9t0VEnI9KgGbf/jtFP9QVAOA09vnZUu/jvqhPMUbcpccfeCkYvJue3n+
   c/AMCSFJ7sq2qQg/Otalb47/kZSBWHl3xlxUOdUx2LKIoZQ1tRp5zAeNA
   V6HRZTefZNTkA0ZBVUlXP/AsYJR2WxnQ/xaFmknljSFfg7MYP2VbDwOjt
   VPvknLryU6zCCrtnBgMpzLd6zrDelR/QwUl74FnPjUli6s6eJ5thczEKx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="18699117"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400";
   d="scan'208";a="18699117"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 02:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400";
   d="scan'208";a="1913784"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2024 02:23:32 -0800
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
Subject: [PATCH v2 1/3] ASoC: Intel: avs: UAPI: Add tokens for initial config
 feature
Date: Thu,  8 Feb 2024 11:23:58 +0100
Message-Id: <20240208102400.2497791-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208102400.2497791-1-amadeuszx.slawinski@linux.intel.com>
References: <20240208102400.2497791-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VLH22M3ZBRJHZDUZ763HXY255B67C4M4
X-Message-ID-Hash: VLH22M3ZBRJHZDUZ763HXY255B67C4M4
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLH22M3ZBRJHZDUZ763HXY255B67C4M4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allow for defining initial config which will be send after module
initialization to configure initial module state. This is only useful
for modules which need to be configured on init.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/uapi/sound/intel/avs/tokens.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/uapi/sound/intel/avs/tokens.h b/include/uapi/sound/intel/avs/tokens.h
index 4ffe546aa409a..4beca03405c07 100644
--- a/include/uapi/sound/intel/avs/tokens.h
+++ b/include/uapi/sound/intel/avs/tokens.h
@@ -19,6 +19,8 @@ enum avs_tplg_token {
 	AVS_TKN_MANIFEST_NUM_MODCFGS_EXT_U32		= 6,
 	AVS_TKN_MANIFEST_NUM_PPLCFGS_U32		= 7,
 	AVS_TKN_MANIFEST_NUM_BINDINGS_U32		= 8,
+	AVS_TKN_MANIFEST_NUM_CONDPATH_TMPLS_U32		= 9,
+	AVS_TKN_MANIFEST_NUM_INIT_CONFIGS_U32		= 10,
 
 	/* struct avs_tplg_library */
 	AVS_TKN_LIBRARY_ID_U32				= 101,
@@ -109,6 +111,8 @@ enum avs_tplg_token {
 	AVS_TKN_MOD_PROC_DOMAIN_U8			= 1705,
 	AVS_TKN_MOD_MODCFG_EXT_ID_U32			= 1706,
 	AVS_TKN_MOD_KCONTROL_ID_U32			= 1707,
+	AVS_TKN_MOD_INIT_CONFIG_NUM_IDS_U32		= 1708,
+	AVS_TKN_MOD_INIT_CONFIG_ID_U32			= 1709,
 
 	/* struct avs_tplg_path_template */
 	AVS_TKN_PATH_TMPL_ID_U32			= 1801,
@@ -125,6 +129,11 @@ enum avs_tplg_token {
 
 	/* struct avs_tplg_kcontrol */
 	AVS_TKN_KCONTROL_ID_U32				= 2301,
+
+	/* struct avs_tplg_init_config */
+	AVS_TKN_INIT_CONFIG_ID_U32			= 2401,
+	AVS_TKN_INIT_CONFIG_PARAM_U8			= 2402,
+	AVS_TKN_INIT_CONFIG_LENGTH_U32			= 2403,
 };
 
 #endif
-- 
2.34.1

