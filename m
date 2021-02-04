Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C3330FE8D
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 21:40:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 396A416A5;
	Thu,  4 Feb 2021 21:39:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 396A416A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612471241;
	bh=wnW9pmsE7TCQBxjc7+LjGCvNgwtAQx9azL8BSrxLM9o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BW5RvsWoHstwj8mTc0DTJFR7Rlcv+VV9U9XxF3bNeALzAjhUnlEcaLufhJNHHpEdq
	 Nb4J/59Ku8yK2CllNlMTaRNajcqpdGKO+2Mfxx8dDb1j1ItXKBN5GEufqi8kBMm5Ui
	 pIEWb2wC23obAOi5J0PbJ4VclKzRbaCOx6BF/IoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD4AFF8050F;
	Thu,  4 Feb 2021 21:34:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7B05F802C8; Thu,  4 Feb 2021 21:34:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5250F801F7
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 21:33:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5250F801F7
IronPort-SDR: rbLvSlYl9raY5zd6y8VprjBk1Fj4b6/5uNuan8I73laV7fYYGfbwKhbqvMW5wSEnUjN7wqJVjG
 g7TbTzVoEMqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="181472569"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="181472569"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:33:58 -0800
IronPort-SDR: IFZ86oOhPkU7o3dtBjTl9LxFTLWDXWT14T7LkbYVJnMMAYRhDvqqxTdDXOzNx00BM7YDfHtYKj
 nC/QDzbBWljw==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="483700375"
Received: from jdasilva-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.66.22])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:33:57 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/14] ASoC: SOF: Intel: hda: add dev_dbg() when DMIC number
 is overridden
Date: Thu,  4 Feb 2021 14:33:12 -0600
Message-Id: <20210204203312.27112-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
References: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

It's useful for debug and system integration to show cases where we
ignore the number of microphones reported by NHLT.

Suggested-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index a61eb7afd364..5926d23da9ae 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -612,8 +612,12 @@ static int dmic_topology_fixup(struct snd_sof_dev *sdev,
 	dmic_num = check_nhlt_dmic(sdev);
 
 	/* allow for module parameter override */
-	if (hda_dmic_num != -1)
+	if (hda_dmic_num != -1) {
+		dev_dbg(sdev->dev,
+			"overriding DMICs detected in NHLT tables %d by kernel param %d\n",
+			dmic_num, hda_dmic_num);
 		dmic_num = hda_dmic_num;
+	}
 
 	switch (dmic_num) {
 	case 1:
-- 
2.25.1

