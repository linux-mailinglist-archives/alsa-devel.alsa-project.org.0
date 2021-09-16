Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 455B040D788
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 12:36:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC7CB1888;
	Thu, 16 Sep 2021 12:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC7CB1888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631788560;
	bh=AbW5tNOKNITnWaVPP1Rle8ehXez24pjRyTLuOgdWDak=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rcu7ors+jBSq/kzinFN1BJizMMm9hylRT6wFkMDzz+Xq4FyGYuXcDLYVXZFif0HbN
	 H1aGwwqAV7eWQfDGvTqlkf0O+okuKc7qKAkobPNuxysz/S4YjxUqYloNKdORv4veUB
	 PLlf3mHPXA8revu1gIDAWg7yZ0toI/7dooNLLRyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17EE1F80516;
	Thu, 16 Sep 2021 12:33:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1B15F8032B; Thu, 16 Sep 2021 12:33:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E58BCF8025E
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 12:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E58BCF8025E
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="202031868"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="202031868"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:32:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="545473539"
Received: from gkapusti-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.35.152])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:32:24 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 5/6] ASoC: SOF: Intel: Rename hda-compress.c to hda-probes.c
Date: Thu, 16 Sep 2021 13:32:10 +0300
Message-Id: <20210916103211.1573-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916103211.1573-1-peter.ujfalusi@linux.intel.com>
References: <20210916103211.1573-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

The hda-compress.c is implementing the SOF probe support for intel HDA
platforms using compress API.

To avoid the confusion, rename it to reflect this.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/Makefile                         | 2 +-
 sound/soc/sof/intel/{hda-compress.c => hda-probes.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename sound/soc/sof/intel/{hda-compress.c => hda-probes.c} (100%)

diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index feae487f0227..9635dd47a17d 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -9,7 +9,7 @@ snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
 				 hda-dai.o hda-bus.o \
 				 apl.o cnl.o tgl.o icl.o
-snd-sof-intel-hda-common-$(CONFIG_SND_SOC_SOF_HDA_PROBES) += hda-compress.o
+snd-sof-intel-hda-common-$(CONFIG_SND_SOC_SOF_HDA_PROBES) += hda-probes.o
 
 snd-sof-intel-hda-objs := hda-codec.o
 
diff --git a/sound/soc/sof/intel/hda-compress.c b/sound/soc/sof/intel/hda-probes.c
similarity index 100%
rename from sound/soc/sof/intel/hda-compress.c
rename to sound/soc/sof/intel/hda-probes.c
-- 
2.33.0

