Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0C14F69CB
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 21:26:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D8E216FF;
	Wed,  6 Apr 2022 21:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D8E216FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649273174;
	bh=1A43FBL6HZp7/nOo8HqViO9THC16w8zbFkss4Zt6rtU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QlXPkXWCiHt5P5G7JaAinOgxRGK8HQ/LOBhCLOj1BlXvvMSI7PbESsCq4mx1Om5TN
	 9CoS2djGv90sy2dPNoYtNyvNan8Xf1+I3ClM/aSV5gbLNPtyE/BPOH8OER0ZpnRyAO
	 85YI23DTYfMa6IjOL+eJKmb02PNYOotKlVdIGIHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0170F800D1;
	Wed,  6 Apr 2022 21:25:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9B90F80161; Wed,  6 Apr 2022 21:25:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54C52F80054
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 21:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54C52F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="n4Y9KNDm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649273113; x=1680809113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1A43FBL6HZp7/nOo8HqViO9THC16w8zbFkss4Zt6rtU=;
 b=n4Y9KNDmG42DR6FZKvkSRvim1oCk1f8LvFp6pjtjqB2XdzRKu9DYoxy3
 Qt+3PsW9nqFt4v71MNN7CR7K9fUvlHA2zbp1SWzEW8cyPxreoavbcalms
 l8CI9NU/GhGtO/KSdiTW4OYpnSCeR36NTJDKmNOvv7HdMt6dpH6tOEr81
 3mHDN2SkSiOXHzfff+3oMmOMJsO7Kw6TBPKKrJlXhmfEf5SVGqWPSppZ7
 ofSWq8jg0LzdGYb4kE87on2ccjeqLhV0NCvmkQdEe7IYqZqXRNwIchKSR
 7XNYK8GnNclIZj8ZwP8WOdpu9k/zZZQfXZTr2Newa7ZlMhaUWZXLGyDIN w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="347580058"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="347580058"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:23:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="570708608"
Received: from cbok-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.137.86])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:23:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: soc-acpi: correct device endpoints for max98373
Date: Wed,  6 Apr 2022 14:23:41 -0500
Message-Id: <20220406192341.271465-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Chao Song <chao.song@linux.intel.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Chao Song <chao.song@linux.intel.com>

The left speaker of max98373 uses spk_r_endpoint, and right
speaker uses spk_l_endpoint, this is obviously wrong.

This patch corrects the endpoints for max98373 codec.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 6edc9b7108cd..ef19150e7b2e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -132,13 +132,13 @@ static const struct snd_soc_acpi_adr_device mx8373_1_adr[] = {
 	{
 		.adr = 0x000123019F837300ull,
 		.num_endpoints = 1,
-		.endpoints = &spk_l_endpoint,
+		.endpoints = &spk_r_endpoint,
 		.name_prefix = "Right"
 	},
 	{
 		.adr = 0x000127019F837300ull,
 		.num_endpoints = 1,
-		.endpoints = &spk_r_endpoint,
+		.endpoints = &spk_l_endpoint,
 		.name_prefix = "Left"
 	}
 };
-- 
2.30.2

