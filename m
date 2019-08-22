Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B384F99F74
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:10:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A67F41677;
	Thu, 22 Aug 2019 21:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A67F41677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501003;
	bh=88bzGKfu+aZVvDGsgzMI0mbjAs4r2ARX8TF7g1MA1+w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vH8p+oPEOmdtG+MPjT7AlHluE8lmNYqGirzWvhTe9bBrMkUUKBhTwvztH71E0LnHC
	 5BonFza73XcP9ZfI6teloT0l+ca0e9u+7Y7cOYGzHXPaTfTcvlcrZfBt5YmeIURldJ
	 3Or2OKgLDzZEGqlUWLvytxcONwWrpIi/hvP4zxjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE7BFF800BF;
	Thu, 22 Aug 2019 21:05:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 531A5F8060D; Thu, 22 Aug 2019 21:05:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9405F804CB
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9405F804CB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:04:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524234"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:04:48 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:03:55 +0200
Message-Id: <20190822190425.23001-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 05/35] ASoC: Intel: Skylake: Reload libraries
	on D0 entry for CNL
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

As libraries are lost in D3, they need to be reloaded on D0 entry.
Cannonlake's library load process is equivalent to Broxton's, thus reuse
the existing one.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c     |  3 ++-
 sound/soc/intel/skylake/cnl-sst.c     | 11 +++++++++++
 sound/soc/intel/skylake/skl-sst-dsp.h |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 5bece3a6d741..cc9507d4702b 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -45,7 +45,7 @@ static unsigned int bxt_get_errorcode(struct sst_dsp *ctx)
 	 return sst_dsp_shim_read(ctx, BXT_ADSP_ERROR_CODE);
 }
 
-static int
+int
 bxt_load_library(struct sst_dsp *ctx, struct skl_lib_info *linfo, int lib_count)
 {
 	struct snd_dma_buffer dmab;
@@ -88,6 +88,7 @@ bxt_load_library(struct sst_dsp *ctx, struct skl_lib_info *linfo, int lib_count)
 	skl_release_library(linfo, lib_count);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(bxt_load_library);
 
 /*
  * First boot sequence has some extra steps. Core 0 waits for power
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 8984653d925d..a2b3bce631fc 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -179,6 +179,16 @@ static int cnl_set_dsp_D0(struct sst_dsp *ctx, unsigned int core_id)
 			return ret;
 		}
 
+		if (cnl->lib_count > 1) {
+			ret = ctx->fw_ops.load_library(ctx, cnl->lib_info,
+						cnl->lib_count);
+			if (ret < 0) {
+				dev_err(ctx->dev,
+					"reload libs failed: %d\n", ret);
+				return ret;
+			}
+		}
+
 		cnl->cores.state[core_id] = SKL_DSP_RUNNING;
 		return ret;
 	}
@@ -273,6 +283,7 @@ static const struct skl_dsp_fw_ops cnl_fw_ops = {
 	.set_state_D3 = cnl_set_dsp_D3,
 	.load_fw = cnl_load_base_firmware,
 	.get_fw_errcode = cnl_get_errno,
+	.load_library = bxt_load_library,
 };
 
 static struct sst_ops cnl_ops = {
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index 4da240582454..06979652985c 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -228,6 +228,8 @@ int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 		struct skl_dev **dsp);
 void skl_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl);
 void bxt_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl);
+int bxt_load_library(struct sst_dsp *ctx, struct skl_lib_info *linfo,
+		int lib_count);
 
 int snd_skl_parse_uuids(struct sst_dsp *ctx, const struct firmware *fw,
 				unsigned int offset, int index);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
