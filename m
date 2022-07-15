Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4065763EA
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 16:56:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A64C1192D;
	Fri, 15 Jul 2022 16:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A64C1192D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657896977;
	bh=Tis0FQT0e+DRH/Zi+V3hONW0zjENY2eP93kg4/dUjnI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SdCng+rz+3LfQ4410+oOqufFlWfihpPs6iSxpR7TpIOOAiGgZ8LzYnPtO5HIZWJVm
	 fmCxctxHJDJh3cUvrP0Kl5cTD0t/uJcYjdk38+S464QhCwPbyZD8ok2IuCc6m7MUlD
	 qVc2tsNYsleIUfJMHlQ+0tPkQqTVebTCGSuqpmCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D61DF8057D;
	Fri, 15 Jul 2022 16:53:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5AA4F8055C; Fri, 15 Jul 2022 16:53:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0AD6F80543
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 16:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0AD6F80543
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="k1txNH5v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657896778; x=1689432778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tis0FQT0e+DRH/Zi+V3hONW0zjENY2eP93kg4/dUjnI=;
 b=k1txNH5vxOOra2q77ZPF2aCbAC7IRBlkh7bBO1mNbRhA0r5POCnSi/PD
 10qqLKIoF3aqRyzlOn2krBK+pH4TA2ae9qSQkQzOe3zt003Ul/VVj/UO3
 cEwd3Q6u9I+7scU8Zb0fwq9VGVlH5kdb1uohW7sP4FuEeVGJwtZ1otIvw
 OO8rJTuSWYC+FtZ/2H6TwHM7IEId5+g+uQ7/hwmlLDHvAevUARjSGeYl2
 fPFZj0s9CINC+s5d/AlmhD52zIlCQxLz1j9xasNG1/zLPDIz4ouWDtcgM
 WIPE4pjdYNswIFettdFFJvJjW8duP371ywT5VkhXVZ6tbvDXQBPwgOynv w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="311476913"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="311476913"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:34 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="923533125"
Received: from jmurope-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.14.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/11] ASoC: SOF: Intel: atom: don't keep a temporary string
 in fixup_tplg_name
Date: Fri, 15 Jul 2022 09:52:12 -0500
Message-Id: <20220715145216.277003-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
References: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 broonie@kernel.org, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

fixup_tplg_name() doesn't need to keep the string, allocated for
filename - it's temporary.

Inspired by similar change for hda:
commit b9088535e102 ("ASoC: SOF: Intel: HDA: don't keep a temporary variable")

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/atom.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/atom.c b/sound/soc/sof/intel/atom.c
index ff5900b155dc..bd9789b483b1 100644
--- a/sound/soc/sof/intel/atom.c
+++ b/sound/soc/sof/intel/atom.c
@@ -274,22 +274,22 @@ static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
 				   const char *ssp_str)
 {
 	const char *tplg_filename = NULL;
-	char *filename;
-	char *split_ext;
+	const char *split_ext;
+	char *filename, *tmp;
 
-	filename = devm_kstrdup(sdev->dev, sof_tplg_filename, GFP_KERNEL);
+	filename = kstrdup(sof_tplg_filename, GFP_KERNEL);
 	if (!filename)
 		return NULL;
 
 	/* this assumes a .tplg extension */
-	split_ext = strsep(&filename, ".");
-	if (split_ext) {
+	tmp = filename;
+	split_ext = strsep(&tmp, ".");
+	if (split_ext)
 		tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
 					       "%s-%s.tplg",
 					       split_ext, ssp_str);
-		if (!tplg_filename)
-			return NULL;
-	}
+	kfree(filename);
+
 	return tplg_filename;
 }
 
-- 
2.34.1

