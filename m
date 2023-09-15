Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8112C7A1EEB
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:42:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAD18AEA;
	Fri, 15 Sep 2023 14:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAD18AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781770;
	bh=wjTnUecFMHY60czI9aK2gYJcFw8a7fWEbC9CHw8DHF0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SDJ0LR2nCZXsyGXZOTsM1/w8XspIHLolJp5bIpkWlh/CsE5nC5RHxTI8UbGZ/Xt4A
	 Bup7IcYeu9tzlIv90AIihaRRshDTlTBaAEGGGfTbPG1cHh63tnIOh6M3J2N37png2Z
	 jRtCzaARMA28nneN29AQC2ml+SOl1akxcgyzH8YI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 883BEF80579; Fri, 15 Sep 2023 14:40:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD9AF80579;
	Fri, 15 Sep 2023 14:40:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D382F80570; Fri, 15 Sep 2023 14:40:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AD0AF80431
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AD0AF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nEFMvwz3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781619; x=1726317619;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wjTnUecFMHY60czI9aK2gYJcFw8a7fWEbC9CHw8DHF0=;
  b=nEFMvwz31OeICFJwqR+sdiX8n6r+bfuymx0gqeZvFMzb/ToyAI3afOCQ
   d9FL2GykBqRa+cDyuV0ReUD9DL8XPXktSygmSLP/RUIKCXdyHOrRmv5Xl
   7TD+E3IrLY0x3lcEMFb6I735EtIVu0+c07Oz70X3azJFugjqD3EmSt1HS
   tHJMC+PdHxzt+5JZTMKEpjL+yNIs9CPvM2YFK7vBEN5G1Xrsg0DDNf+om
   4EDSqNslavRAnBs4J/4ndAUQACufXusVhagRzmZRamzkbXkSwDlazla7V
   cmsJKUZkwBOUB1rHodfvFDgBd6TQ/HWfbsEe3ljYmew4G69B47IEyxiWX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="465601064"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="465601064"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="815161610"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="815161610"
Received: from brhacker-mobl26.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.34])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:09 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	rander.wang@intel.com
Subject: [PATCH] ASoC: SOF: core: Only call sof_ops_free() on remove if the
 probe was successful
Date: Fri, 15 Sep 2023 15:40:15 +0300
Message-ID: <20230915124015.19637-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KPZ7JYUADN4QFFVAQDG7BT7BBOFAIGWM
X-Message-ID-Hash: KPZ7JYUADN4QFFVAQDG7BT7BBOFAIGWM
X-MailFrom: peter.ujfalusi@linux.intel.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

All the fail paths during probe will free up the ops, on remove we should
only free it if the probe was successful.

Fixes: bc433fd76fae ("ASoC: SOF: Add ops_free")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 30db685cc5f4..2d1616b81485 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -486,10 +486,9 @@ int snd_sof_device_remove(struct device *dev)
 		snd_sof_ipc_free(sdev);
 		snd_sof_free_debug(sdev);
 		snd_sof_remove(sdev);
+		sof_ops_free(sdev);
 	}
 
-	sof_ops_free(sdev);
-
 	/* release firmware */
 	snd_sof_fw_unload(sdev);
 
-- 
2.42.0

