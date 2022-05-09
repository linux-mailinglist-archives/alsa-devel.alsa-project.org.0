Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB3A51F741
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 10:50:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FB0F18C2;
	Mon,  9 May 2022 10:49:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FB0F18C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652086229;
	bh=qNTHXf2RIDZy/9lSF2O/pjd63bl4254Y0BknyWnS9dY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OsCztVLpCqHT3ppSTRrui0DseB9XzkAqkcgLKH3LQSKu2wzFNRNOOeUIT7eh2czqG
	 PL9k+WSyq1CiWHhT7Ki4lOOBEp2EhSrtcNJ2Zd+pv99jqCW/JMOFxISFV/OW03ZVxa
	 SBIJi3PwQbE23xg/kfyd6I7HttqV8d3N30na2oOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82C02F80510;
	Mon,  9 May 2022 10:48:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2514DF80508; Mon,  9 May 2022 10:48:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35A96F80237
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 10:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35A96F80237
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bfr6TkaN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652086124; x=1683622124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qNTHXf2RIDZy/9lSF2O/pjd63bl4254Y0BknyWnS9dY=;
 b=bfr6TkaNKEe/5Wxqy0h3YGi7PKxQehguhXklDZeI3VeeEb9CSXQCOX0I
 0KVI2kdrblw2JitSG55fMFOK72d3xTqFTo4iboXr/csWHXocOUPQIwOsJ
 Tv5AIEX80lLNKlebOHzLN5FYa45FBlwVqExrVSBhiDDSW9VIjvLE7ckLt
 ptCc3knBma6AdPn4xn8ZvkK27LicO9lee0J4R4l5WPNEUHJ2KRBlYXKMH
 0QXHgL7Vch7t0ESXrrcOPsuOaVb73t9kxS6YvSmY3j2aPS8OR6KGP37pG
 DGn7eUPxnn6HJfC1ptfTnsZudJ2khZgqH7033AoDYlZf+ez9n+a37x+c0 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="294208494"
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; d="scan'208";a="294208494"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 01:48:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; d="scan'208";a="738068111"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 09 May 2022 01:48:32 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 01/15] ASoC: Intel: avs: Account for libraries when booting
 basefw
Date: Mon,  9 May 2022 10:58:07 +0200
Message-Id: <20220509085821.3852259-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509085821.3852259-1-cezary.rojewski@intel.com>
References: <20220509085821.3852259-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Not all modules are part of base firmware. Some are part of loadable
libraries. These need to be loaded after base firmware reports ready
status through FW_READY notification.

Their loading process is similar to the base firmware's one. Request the
binary file, verify and strip the manifest and load the actual code into
DSP memory with help of CLDMA or HD-Audio render stream, depending on
audio device generation.

List of libraries needed for loading is obtained through the topology -
vendor sections specifying the name of firmware files to request.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h    |  3 ++
 sound/soc/intel/avs/loader.c | 80 ++++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index c57a07a18d8e..14b4a780a91c 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -19,6 +19,8 @@
 
 struct avs_dev;
 struct avs_tplg;
+struct avs_tplg_library;
+struct avs_soc_component;
 
 /*
  * struct avs_dsp_ops - Platform-specific DSP operations
@@ -241,6 +243,7 @@ void avs_hda_clock_gating_enable(struct avs_dev *adev, bool enable);
 void avs_hda_power_gating_enable(struct avs_dev *adev, bool enable);
 void avs_hda_l1sen_enable(struct avs_dev *adev, bool enable);
 
+int avs_dsp_load_libraries(struct avs_dev *adev, struct avs_tplg_library *libs, u32 num_libs);
 int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge);
 int avs_dsp_first_boot_firmware(struct avs_dev *adev);
 
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index c47f85161d95..8aa658c52325 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -15,6 +15,7 @@
 #include "cldma.h"
 #include "messages.h"
 #include "registers.h"
+#include "topology.h"
 
 #define AVS_ROM_STS_MASK		0xFF
 #define AVS_ROM_INIT_DONE		0x1
@@ -466,6 +467,71 @@ int avs_hda_transfer_modules(struct avs_dev *adev, bool load,
 	return 0;
 }
 
+int avs_dsp_load_libraries(struct avs_dev *adev, struct avs_tplg_library *libs, u32 num_libs)
+{
+	int start, id, i = 0;
+	int ret;
+
+	/* Calculate the id to assign for the next lib. */
+	for (id = 0; id < adev->fw_cfg.max_libs_count; id++)
+		if (adev->lib_names[id][0] == '\0')
+			break;
+	if (id + num_libs >= adev->fw_cfg.max_libs_count)
+		return -EINVAL;
+
+	start = id;
+	while (i < num_libs) {
+		struct avs_fw_manifest *man;
+		const struct firmware *fw;
+		struct firmware stripped_fw;
+		char *filename;
+		int j;
+
+		filename = kasprintf(GFP_KERNEL, "%s/%s/%s", AVS_ROOT_DIR, adev->spec->name,
+				     libs[i].name);
+		if (!filename)
+			return -ENOMEM;
+
+		/*
+		 * If any call after this one fails, requested firmware is not released with
+		 * avs_release_last_firmware() as failing to load code results in need for reload
+		 * of entire driver module. And then avs_release_firmwares() is in place already.
+		 */
+		ret = avs_request_firmware(adev, &fw, filename);
+		kfree(filename);
+		if (ret < 0)
+			return ret;
+
+		stripped_fw = *fw;
+		ret = avs_fw_manifest_strip_verify(adev, &stripped_fw, NULL);
+		if (ret) {
+			dev_err(adev->dev, "invalid library data: %d\n", ret);
+			return ret;
+		}
+
+		ret = avs_fw_manifest_offset(&stripped_fw);
+		if (ret < 0)
+			return ret;
+		man = (struct avs_fw_manifest *)(stripped_fw.data + ret);
+
+		/* Don't load anything that's already in DSP memory. */
+		for (j = 0; j < id; j++)
+			if (!strncmp(adev->lib_names[j], man->name, AVS_LIB_NAME_SIZE))
+				goto next_lib;
+
+		ret = avs_dsp_op(adev, load_lib, &stripped_fw, id);
+		if (ret)
+			return ret;
+
+		strncpy(adev->lib_names[id], man->name, AVS_LIB_NAME_SIZE);
+		id++;
+next_lib:
+		i++;
+	}
+
+	return start == id ? 1 : 0;
+}
+
 static int avs_dsp_load_basefw(struct avs_dev *adev)
 {
 	const struct avs_fw_version *min_req;
@@ -519,6 +585,7 @@ static int avs_dsp_load_basefw(struct avs_dev *adev)
 
 int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
 {
+	struct avs_soc_component *acomp;
 	int ret, i;
 
 	/* Forgo full boot if flash from IMR succeeds. */
@@ -538,7 +605,20 @@ int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
 	avs_hda_l1sen_enable(adev, false);
 
 	ret = avs_dsp_load_basefw(adev);
+	if (ret)
+		goto reenable_gating;
+
+	mutex_lock(&adev->comp_list_mutex);
+	list_for_each_entry(acomp, &adev->comp_list, node) {
+		struct avs_tplg *tplg = acomp->tplg;
+
+		ret = avs_dsp_load_libraries(adev, tplg->libs, tplg->num_libs);
+		if (ret < 0)
+			break;
+	}
+	mutex_unlock(&adev->comp_list_mutex);
 
+reenable_gating:
 	avs_hda_l1sen_enable(adev, true);
 	avs_hda_clock_gating_enable(adev, true);
 
-- 
2.25.1

