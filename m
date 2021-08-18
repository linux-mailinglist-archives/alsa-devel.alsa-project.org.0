Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE013EFE7A
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 09:59:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED15F1686;
	Wed, 18 Aug 2021 09:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED15F1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629273567;
	bh=Y/uzR3GGpPehxp0/DWUKUBYg15ZeBnxan7j9G3uhmTs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c5yEzRDtxdqugU1PT03iUF73gal4zzhuElk5kr8R6RNBkb6dihNu2Mu+uJdSKNDrr
	 3zAYkqZwVAyIdm1uY+0qgm1KGSFqYr6GdiE2gWczc7URKq8MuXR6tPuHQHxZ3aPsZo
	 NDAb1CWjrGoRcd5XdJ7neFkjJZtqwP3jYdlg3iv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CF00F80524;
	Wed, 18 Aug 2021 09:55:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCBC9F8051A; Wed, 18 Aug 2021 09:55:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E75F9F80519
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 09:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E75F9F80519
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="195855585"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="195855585"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 00:55:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="676975010"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 18 Aug 2021 00:55:24 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/11] ASoC: Intel: Skylake: Properly configure modules with
 generic extension
Date: Wed, 18 Aug 2021 09:57:41 +0200
Message-Id: <20210818075742.1515155-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818075742.1515155-1-cezary.rojewski@intel.com>
References: <20210818075742.1515155-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Szymon Mielczarek <szymonx.mielczarek@intel.com>, jairaj.arava@intel.com,
 upstream@semihalf.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 harshapriya.n@intel.com, cujomalainey@google.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com,
 Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>, hdegoede@redhat.com,
 broonie@kernel.org, jenny.tc@intel.com, lma@semihalf.com,
 Pawel Harlozinski <pawel.harlozinski@linux.intel.com>,
 vamshi.krishna.gopal@intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>

Make use of struct skl_base_cfg_ext and its format setter to configure
modules which are described with said structure.

Signed-off-by: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>
Signed-off-by: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
Signed-off-by: Szymon Mielczarek <szymonx.mielczarek@intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-messages.c | 51 ++++++++------------------
 1 file changed, 15 insertions(+), 36 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index 8886f984ae26..eaad180af42e 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -806,27 +806,6 @@ static void skl_set_copier_format(struct skl_dev *skl,
 	skl_setup_cpr_gateway_cfg(skl, mconfig, cpr_mconfig);
 }
 
-/*
- * Algo module are DSP pre processing modules. Algo module take base module
- * configuration and params
- */
-
-static void skl_set_algo_format(struct skl_dev *skl,
-			struct skl_module_cfg *mconfig,
-			struct skl_algo_cfg *algo_mcfg)
-{
-	struct skl_base_cfg *base_cfg = (struct skl_base_cfg *)algo_mcfg;
-
-	skl_set_base_module_format(skl, mconfig, base_cfg);
-	if (mconfig->formats_config[SKL_PARAM_INIT].caps_size == 0)
-		return;
-
-	memcpy(algo_mcfg->params,
-			mconfig->formats_config[SKL_PARAM_INIT].caps,
-			mconfig->formats_config[SKL_PARAM_INIT].caps_size);
-
-}
-
 /*
  * Mic select module allows selecting one or many input channels, thus
  * acting as a demux.
@@ -849,6 +828,8 @@ static void skl_set_base_outfmt_format(struct skl_dev *skl,
 static u16 skl_get_module_param_size(struct skl_dev *skl,
 			struct skl_module_cfg *mconfig)
 {
+	struct skl_module_res *res;
+	struct skl_module *module = mconfig->module;
 	u16 param_size;
 
 	switch (mconfig->m_type) {
@@ -863,11 +844,6 @@ static u16 skl_get_module_param_size(struct skl_dev *skl,
 	case SKL_MODULE_TYPE_UPDWMIX:
 		return sizeof(struct skl_up_down_mixer_cfg);
 
-	case SKL_MODULE_TYPE_ALGO:
-		param_size = sizeof(struct skl_base_cfg);
-		param_size += mconfig->formats_config[SKL_PARAM_INIT].caps_size;
-		return param_size;
-
 	case SKL_MODULE_TYPE_BASE_OUTFMT:
 	case SKL_MODULE_TYPE_MIC_SELECT:
 		return sizeof(struct skl_base_outfmt_cfg);
@@ -876,12 +852,16 @@ static u16 skl_get_module_param_size(struct skl_dev *skl,
 	case SKL_MODULE_TYPE_KPB:
 		return sizeof(struct skl_base_cfg);
 
+	case SKL_MODULE_TYPE_ALGO:
 	default:
-		/*
-		 * return only base cfg when no specific module type is
-		 * specified
-		 */
-		return sizeof(struct skl_base_cfg);
+		res = &module->resources[mconfig->res_idx];
+
+		param_size = sizeof(struct skl_base_cfg) + sizeof(struct skl_base_cfg_ext);
+		param_size += (res->nr_input_pins + res->nr_output_pins) *
+			      sizeof(struct skl_pin_format);
+		param_size += mconfig->formats_config[SKL_PARAM_INIT].caps_size;
+
+		return param_size;
 	}
 
 	return 0;
@@ -922,10 +902,6 @@ static int skl_set_module_format(struct skl_dev *skl,
 		skl_set_updown_mixer_format(skl, module_config, *param_data);
 		break;
 
-	case SKL_MODULE_TYPE_ALGO:
-		skl_set_algo_format(skl, module_config, *param_data);
-		break;
-
 	case SKL_MODULE_TYPE_BASE_OUTFMT:
 	case SKL_MODULE_TYPE_MIC_SELECT:
 		skl_set_base_outfmt_format(skl, module_config, *param_data);
@@ -936,10 +912,13 @@ static int skl_set_module_format(struct skl_dev *skl,
 		skl_set_base_module_format(skl, module_config, *param_data);
 		break;
 
+	case SKL_MODULE_TYPE_ALGO:
 	default:
 		skl_set_base_module_format(skl, module_config, *param_data);
+		skl_set_base_ext_module_format(skl, module_config,
+					       *param_data +
+					       sizeof(struct skl_base_cfg));
 		break;
-
 	}
 
 	dev_dbg(skl->dev, "Module type=%d id=%d config size: %d bytes\n",
-- 
2.25.1

