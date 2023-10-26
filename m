Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 801677D7E74
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 10:27:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9A6E826;
	Thu, 26 Oct 2023 10:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9A6E826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698308828;
	bh=iQfH7kjWWSYCdi/ONnIK+4qe1rIwBGf/wYH1iugGS+E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UB7L9Jh6g5P3BFdgS4ygFI7Dtf4qvDVOEB4hdbxf11c4owGrJM5b4cvmS8KrFHHqS
	 hD7dD60620vBNquGaXtN+xB6y6zVCa/OTRp+gS4yVHd+wNrZqdnDUa8/vnen7xn9qW
	 y652HYbt6ETi1e/zuWLOIkczXh1MTWQr29QwuXX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E7DBF80537; Thu, 26 Oct 2023 10:26:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8B2FF80157;
	Thu, 26 Oct 2023 10:26:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B07DF80165; Thu, 26 Oct 2023 10:26:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80B25F8014B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 10:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80B25F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RtoXXvI8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698308766; x=1729844766;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iQfH7kjWWSYCdi/ONnIK+4qe1rIwBGf/wYH1iugGS+E=;
  b=RtoXXvI8Fr46JdYOvSUp9l7aDZjTXuR4KMob7rKIVM6zlcBjwV+lR6pw
   99Arq8yCxwx4prLcVAqZvJmLR8WvsLswdTRpreC0cg1bBAz7IMU/UDwTh
   TJZ0ihFM/WNjbNgcFl/+HU+9Makk8b157j1/grXJ4nQxmpENRU/PSTey2
   0r/8HPuZDcHle6cjqinr9XNcnRB66SMT/BzLP4D8ktLdzJBpH7g92D+0P
   iY5qYhOX2QHFXARPcSPVeFYW7Jb0xlEc83QdY1cj4FxTkDl25TlvThqPJ
   YmvfJqNyOSa1VI2U3960FjPK7T28g5/j2WbZC1sn5w8ozRrA3ZLZG9vG9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="367698977"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200";
   d="scan'208";a="367698977"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 01:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="735668748"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200";
   d="scan'208";a="735668748"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga006.jf.intel.com with ESMTP; 26 Oct 2023 01:25:58 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: Intel: Skylake: Fix mem leak when parsing UUIDs fails
Date: Thu, 26 Oct 2023 10:25:58 +0200
Message-Id: <20231026082558.1864910-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3JXRAXV2F4XEKGWZPPCPYCU2C3IVE2GW
X-Message-ID-Hash: 3JXRAXV2F4XEKGWZPPCPYCU2C3IVE2GW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3JXRAXV2F4XEKGWZPPCPYCU2C3IVE2GW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Cezary Rojewski <cezary.rojewski@intel.com>

Error path in snd_skl_parse_uuids() shall free last allocated module if
its instance_id allocation fails.

Fixes: f8e066521192 ("ASoC: Intel: Skylake: Fix uuid_module memory leak in failure case")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/skylake/skl-sst-utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/skylake/skl-sst-utils.c b/sound/soc/intel/skylake/skl-sst-utils.c
index 57ea815d3f04..b776c58dcf47 100644
--- a/sound/soc/intel/skylake/skl-sst-utils.c
+++ b/sound/soc/intel/skylake/skl-sst-utils.c
@@ -299,6 +299,7 @@ int snd_skl_parse_uuids(struct sst_dsp *ctx, const struct firmware *fw,
 		module->instance_id = devm_kzalloc(ctx->dev, size, GFP_KERNEL);
 		if (!module->instance_id) {
 			ret = -ENOMEM;
+			kfree(module);
 			goto free_uuid_list;
 		}
 
-- 
2.34.1

