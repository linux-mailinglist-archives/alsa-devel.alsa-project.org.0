Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A400D54D6EF
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 03:20:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 421BB1AAA;
	Thu, 16 Jun 2022 03:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 421BB1AAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655342400;
	bh=mHnKBRNcSwTkjbN8gxud9J1YwFKM2VUFALT+r+byS0k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DAxqtbfgOHELwXHilJsIAURjKSeTfEuxT4x3g8lqJNQAPL9TbgUU6IcBUMBikYgUt
	 cS3ZLaLI0IjJZwr7KVUNXpnRijEcIRAvS8/n9q3Vakj/lKIY+5Q0v0oGwI3M1VJ7r8
	 HwCPu/3kTXj8gaAy1pXbNcOhgxYm12Y3cYTLBd68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 587EDF802A0;
	Thu, 16 Jun 2022 03:18:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A064BF8016C; Thu, 16 Jun 2022 03:18:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D76CCF8012B
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 03:18:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D76CCF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="deGL45Xh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655342301; x=1686878301;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=mHnKBRNcSwTkjbN8gxud9J1YwFKM2VUFALT+r+byS0k=;
 b=deGL45XhlnkGKaSMXe9RWKQy4r8KfIQRTkHL7UTM7GI1F/Ko5qa3Sjlp
 D5WIIbXoCAIzxTM7tUAy9xazXRJJqSX6XO+qEKIUDaxyhNsPs9sW/zOOE
 Fl6rY2pHhzygdmUteCgKPl4QdVXj1+wTCYDwXC8QgXuWvZjzZJPRSYHf2
 s9AwGJOlSgaEVfem2qq6tl448r9MwflBPuY1xQCMwwYVZ2ZW2QLQj+O+y
 bLEDVOe320N98zcg1Nblc5BOc/E9w0iCLv6hdXLBcQiFxT6SyWtC5JGds
 rAlsrjDz1EtlLqHhdrUBwtAQHLJaqPt+loZOACkTrqxqz2okF0clBPUfD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="279195957"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="279195957"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 18:18:12 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="911939304"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 18:18:09 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 1/2] soundwire: Intel: add trigger callback
Date: Thu, 16 Jun 2022 09:17:57 +0800
Message-Id: <20220616011758.21155-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220616011758.21155-1-yung-chuan.liao@linux.intel.com>
References: <20220616011758.21155-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 ranjani.sridharan@linux.intel.com, sanyog.r.kale@intel.com,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
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

When a pipeline is split into FE and BE parts, the BE pipeline may need to
be triggered separately in the BE trigger op. So add the trigger callback
in the link_res ops that will be invoked during BE DAI trigger.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/intel.c           | 8 ++++++++
 include/linux/soundwire/sdw_intel.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 505c5ef061e3..2e7c27d303b4 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1004,9 +1004,17 @@ static int intel_trigger(struct snd_pcm_substream *substream, int cmd, struct sn
 {
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
+	struct sdw_intel_link_res *res = sdw->link_res;
 	struct sdw_cdns_dma_data *dma;
 	int ret = 0;
 
+	/* The .trigger callback is used to send required IPC to audio
+	 * firmware. The .free_stream callback will still be called
+	 * by intel_free_stream() in the TRIGGER_SUSPEND case.
+	 */
+	if (res->ops && res->ops->trigger)
+		res->ops->trigger(dai, cmd, substream->stream);
+
 	dma = snd_soc_dai_get_dma_data(dai, substream);
 	if (!dma) {
 		dev_err(dai->dev, "failed to get dma data in %s\n",
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index b5b489ea1aef..ec16ae49e6a4 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -121,6 +121,7 @@ struct sdw_intel_ops {
 			     struct sdw_intel_stream_params_data *params_data);
 	int (*free_stream)(struct device *dev,
 			   struct sdw_intel_stream_free_data *free_data);
+	int (*trigger)(struct snd_soc_dai *dai, int cmd, int stream);
 };
 
 /**
-- 
2.17.1

