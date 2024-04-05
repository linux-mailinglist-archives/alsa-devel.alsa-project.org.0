Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C41EC89990D
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 11:11:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1DBD2D17;
	Fri,  5 Apr 2024 11:11:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1DBD2D17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712308294;
	bh=4U5eUPSVHVLioRHAIf9Fo+vGvEmxAF6r2cSIUvxQg8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ksO1Ukrhxpwlpy87CvTX1qbphrCv7omq5/8zGrn3jBcuOKomfbSdKAD3oejhuvkZR
	 Epmp0H90QbAOEwlCOMmVCtlRDOyM+X7z7AF/VYekuhZRmwP+H+UcFQot3ZxHwDseCb
	 3P79LxA6xEqTWCakNjXccok3e4u9Oy65iv2sh5yk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 246C8F805FC; Fri,  5 Apr 2024 11:10:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54894F80612;
	Fri,  5 Apr 2024 11:10:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7CBCF8057A; Fri,  5 Apr 2024 11:08:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B72F1F8016E
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 11:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B72F1F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=H2P/f8Ud
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308095; x=1743844095;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4U5eUPSVHVLioRHAIf9Fo+vGvEmxAF6r2cSIUvxQg8w=;
  b=H2P/f8Udmu5c57/Ud9KA0hlEFk8SVku43hJpdzWyXow5tIUb8Byx0UdF
   X3B0t9rUGqMEtI3Grzwp0svpXl/BS/CJBph/VEOY2AfuEJ2yg2wkTjuld
   GGh0IYKP56ssi4a9Yyd8G6JHyUpei3Mlbq0bsAZNjRDYt1CIESbFfevPT
   tsiNrO4jqNa8OtDQ+Xu9p8nd6G7iZDcjAPOqEUli7o/hHb9+mjI8UJaGJ
   gzVuvx4W4q4mIaMh2PUUJy/GrQ83C2j8vYOZ30ZKl6UMJ+L69iPPcDygi
   CWR+z5KgwbjQtO6OTcKbFK7Cp4vdyiGrsP8Yj+fA6tjj6WsqsAkSxwKSd
   g==;
X-CSE-ConnectionGUID: WuzzfmNwSgCh5iX581uu8w==
X-CSE-MsgGUID: NSLUcacCTOKMMLCasgy9NQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787428"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="7787428"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:08:14 -0700
X-CSE-ConnectionGUID: kkSYAi88Tcm5aM5jnaFeSw==
X-CSE-MsgGUID: 8CaWEeVRR+C5q++h6+JdbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="19042424"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 04/13] ASoC: Intel: avs: Fix config_length for config-less
 copiers
Date: Fri,  5 Apr 2024 11:09:20 +0200
Message-Id: <20240405090929.1184068-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FM73IMO4DYCYQ7QGSMOJJMSYWY4VFVSK
X-Message-ID-Hash: FM73IMO4DYCYQ7QGSMOJJMSYWY4VFVSK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FM73IMO4DYCYQ7QGSMOJJMSYWY4VFVSK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Copier's config_length shall always be at least one even if there is no
configuration payload to carry. While the firmware treats
config_length=0 or 1 in the same manner, the driver shall initialize the
module properly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 5944865a1193..9bd03a44fcb9 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -148,11 +148,12 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 	struct avs_copier_cfg *cfg;
 	struct nhlt_specific_cfg *ep_blob;
 	union avs_connector_node_id node_id = {0};
-	size_t cfg_size, data_size = 0;
+	size_t cfg_size, data_size;
 	void *data = NULL;
 	u32 dma_type;
 	int ret;
 
+	data_size = sizeof(cfg->gtw_cfg.config);
 	dma_type = t->cfg_ext->copier.dma_type;
 	node_id.dma_type = dma_type;
 
@@ -233,10 +234,7 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 		break;
 	}
 
-	cfg_size = sizeof(*cfg) + data_size;
-	/* Every config-BLOB contains gateway attributes. */
-	if (data_size)
-		cfg_size -= sizeof(cfg->gtw_cfg.config.attrs);
+	cfg_size = offsetof(struct avs_copier_cfg, gtw_cfg.config) + data_size;
 	if (cfg_size > AVS_MAILBOX_SIZE)
 		return -EINVAL;
 
-- 
2.25.1

