Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2084E60B317
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:56:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 959001FCC;
	Mon, 24 Oct 2022 18:55:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 959001FCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666630569;
	bh=qmjhZyi70p2iPcs+iHIxnVjUb/ktUC2fx19Ez2zQMwA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U1XXdveQnZVSUWHnfy22KUwxDG0xezaAou9fv+Gx2KwIX7NBVolOF8sfvf+V5CEb8
	 cV3IPcN9uKPrJp6CW/LSSiS5VDUdoPvnfutz+tKAwmIjs3m/7wdkn7jg0ibxvBNGun
	 VjySw4OcRU+xzRp4qzeGJ8peC5rfX3Ye5wlH4HUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81494F80580;
	Mon, 24 Oct 2022 18:53:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF88DF8057D; Mon, 24 Oct 2022 18:53:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB66DF8052F
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB66DF8052F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IqkxFCj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666630414; x=1698166414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qmjhZyi70p2iPcs+iHIxnVjUb/ktUC2fx19Ez2zQMwA=;
 b=IqkxFCj3CYgRANeyN6deetXTQINBIOZNeCbbAPDsrStcJy/KwFlI0PXn
 oN8OC68+fxW2VwNL3BuhbvPhcCCQThYf+UN0v7DGvS1lv35J3BQk2Mbqb
 B+U1Hqtu0c0VmNou/d8FlJeiAvQJ7fvD2GV14wfId6CY15Ae+zTUdMFap
 BH8S0rlrmcfp7Gbn4U7KOuVsdSKeQmkOnyBvZXSHoYNEZ+g3ZwMn5xIq/
 ZjuMA+3TfKAQxAXDEf0RxtfWzEOV/E7Boaidh4AyaEPYueo49D7t8e9LL
 cWmW3Q9h2z7s7b/kjy1iptpb8jJ3lRRCarpoI93xGQSErdWztgk6ogNT/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287868647"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="287868647"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:29 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609263067"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609263067"
Received: from tdsilva-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/16] ASoC: SOF: Intel: hda-ctrl: remove useless sleep
Date: Mon, 24 Oct 2022 11:53:03 -0500
Message-Id: <20221024165310.246183-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

The hda_dsp_ctrl_link_reset() already performs a usleep and a check that
GCTL has been modified, there's no point in waiting more.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 0c29bb196e593..7f387ad5ef6f4 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -207,16 +207,12 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 			goto err;
 		}
 
-		usleep_range(500, 1000);
-
 		/* exit HDA controller reset */
 		ret = hda_dsp_ctrl_link_reset(sdev, false);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: failed to exit HDA controller reset\n");
 			goto err;
 		}
-
-		usleep_range(1000, 1200);
 	}
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-- 
2.34.1

