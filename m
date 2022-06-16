Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E83954ED1D
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 00:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CEEE1B1F;
	Fri, 17 Jun 2022 00:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CEEE1B1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655417290;
	bh=96P6uvGDTDGFtAFSYZWWSlbmSlPk/R9jOmty2SHjkCU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4RK5ALHpSrlqtzEoEy6mf7ARikz2HPr+Gp7VJMpGjqUHPvnRh7XX33cccKSux364
	 hmfijDcCFmLG4GbwGPg1Oyr2XQ0txX6u7Amb+T0I9ZhgUmDU9IQVn4Dm8xU2JOivJ+
	 pds9Gxng5toDf5zBxExr4jEOsweCKOr0FavDSTWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 330ACF8055B;
	Fri, 17 Jun 2022 00:05:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDA07F80543; Fri, 17 Jun 2022 00:04:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B71B7F8053A
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 00:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B71B7F8053A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LiSaGJVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655417093; x=1686953093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=96P6uvGDTDGFtAFSYZWWSlbmSlPk/R9jOmty2SHjkCU=;
 b=LiSaGJVmtW6QU10TajeCmDTZKpgIev1zYz8EU7fZ8Uf7TJr9UAm3g86r
 6fcG8PTKpWIQ/h9A9fKhkU3R1X0hqclpzT6+hNJx9nuz3OHHGxJGbo1aj
 oKPXbesGchv4dz0rb+Kd6XKwHv7K6VbqD//S12eBf1Cqm75AtSlLJq4UL
 ZoeriQRahWTEsrJB7u/HoLE0wZVeCUUnL9sCwFdZvLwFcR/Bm3yxqWQ9V
 WsgJCX8RfcV1NOHRqbxl6nnNTn1Q5gWK8yqCtd+5Py90+4Bnlu3bxX/C+
 ttkRCyT4ozkB0nBuifRbvSeNEvOY5YVYv1ajHhNHuceffmPdrnWFBYxzM g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="304810975"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="304810975"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:04:52 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="728085035"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:04:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/11] ASoC: tas2552: use pm_runtime_resume_and_get()
Date: Thu, 16 Jun 2022 17:04:26 -0500
Message-Id: <20220616220427.136036-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
References: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Stephen Kitt <steve@sk2.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The use of pm_runtime_get_sync() is buggy with no use of put_noidle() on
error.

Use pm_runtime_resume_and_get() instead.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/codecs/tas2552.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index c98a9332dcc0e..da744cfae611c 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -581,7 +581,7 @@ static int tas2552_component_probe(struct snd_soc_component *component)
 
 	gpiod_set_value(tas2552->enable_gpio, 1);
 
-	ret = pm_runtime_get_sync(component->dev);
+	ret = pm_runtime_resume_and_get(component->dev);
 	if (ret < 0) {
 		dev_err(component->dev, "Enabling device failed: %d\n",
 			ret);
-- 
2.34.1

