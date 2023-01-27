Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A04BB67E91A
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 16:11:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6B63DF5;
	Fri, 27 Jan 2023 16:10:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6B63DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674832307;
	bh=LvKTiEZRlMazR+r++JvGSgZfrTxuCnGAk8uY0I0iui8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WmJiP1IEyoxhmUXm98CkpZ1R22P5C5eV5UlmjzcV2Ku93VXnaO8d5PbnfaWIQI0XS
	 lCVsckf1cAeKgkmVvffShS/oUHjUryhKPYeSWFhCnYCdb+/0u3y4V7n8TdEwWIKBZo
	 07oIHL4BzJPu7e2M1iKNsv7Ih79YYFwmVPEE8jCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E5EBF804F3;
	Fri, 27 Jan 2023 16:10:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D1FBF804F3; Fri, 27 Jan 2023 16:10:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A196F8007C
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 16:10:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A196F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cgN1xjfp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674832217; x=1706368217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LvKTiEZRlMazR+r++JvGSgZfrTxuCnGAk8uY0I0iui8=;
 b=cgN1xjfpNqj3H/WX5qglLZ0HQQ4UNYvMlyckfhu/fzsEiIpzfHKN3KGO
 aj+G8P4siR5HnPGUDGuPkRIBPk0BVwkgtVsGogMT/RcCS1HAq8aZ6uyGz
 jmjRPMppzYA4cQWV6BozZ2/2L6GNhoFmZD5ZkR+F1WPkNrDF2tfovN3nF
 APvmLW1F1q43ABYJSHOmdAj28MOLAv+ZRSvf0X0Ghn6+24vUrEzDAT12q
 QYeudD15Zoq099VRZtDWNuSsoLx5uDSSomU5lUZ+43gs3sydBBMgk7tIp
 HbsDi7KjdUFHfXArw6MW+YprGXFORHF72qoh5sV1lng8z2iGXb8agydS8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="324795769"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="324795769"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 07:10:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="908708985"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="908708985"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jan 2023 07:10:11 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 01/11] ASoC: topology: Properly access value coming from
 topology file
Date: Sat, 28 Jan 2023 00:11:01 +0100
Message-Id: <20230127231111.937721-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
References: <20230127231111.937721-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When accessing values coming from topology, le32_to_cpu should be used.
One of recent commits missed that.

Fixes: 86e2d14b6d1a ("ASoC: topology: Add header payload_size verification")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index c3be24b2fac5..b9addbab2b3d 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2404,7 +2404,7 @@ static int soc_valid_header(struct soc_tplg *tplg,
 		return -EINVAL;
 	}
 
-	if (soc_tplg_get_hdr_offset(tplg) + hdr->payload_size >= tplg->fw->size) {
+	if (soc_tplg_get_hdr_offset(tplg) + le32_to_cpu(hdr->payload_size) >= tplg->fw->size) {
 		dev_err(tplg->dev,
 			"ASoC: invalid header of type %d at offset %ld payload_size %d\n",
 			le32_to_cpu(hdr->type), soc_tplg_get_hdr_offset(tplg),
-- 
2.25.1

