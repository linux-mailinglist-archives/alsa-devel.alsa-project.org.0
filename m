Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7447B113713
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 22:27:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05F43166F;
	Wed,  4 Dec 2019 22:26:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05F43166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575494821;
	bh=w6dLTem889vRRCGo/BGrN7xlG8WjjCzdBjzI8c2zboo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dMImFWXajEFWLBAyYByf9c4OTI35R/XNFKXz1l71ajElFD6NNHWlBU6z053PRKfUP
	 PC01tLZtOd/hMUAghdDekVfcfabqzsXUW6i6pEhGlasYLfMK/kJ+jSkuRSu/cRLr/8
	 HoVSVpDWKBZ1MmqLlXVdhVsbyWpv/HFFs9F4M8/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55B21F802EA;
	Wed,  4 Dec 2019 22:17:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8682CF801D9; Wed,  4 Dec 2019 22:17:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21DC8F80234
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 22:16:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21DC8F80234
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 13:16:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="223378679"
Received: from rgolani-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.153.236])
 by orsmga002.jf.intel.com with ESMTP; 04 Dec 2019 13:16:24 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  4 Dec 2019 15:15:55 -0600
Message-Id: <20191204211556.12671-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191204211556.12671-1-pierre-louis.bossart@linux.intel.com>
References: <20191204211556.12671-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 12/13] ASoC: SOF: Remove unused drv_name in
	sof_pdata
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

This field is only set but never used. Let's remove
it to make code cleaner.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof.h     | 1 -
 sound/soc/sof/nocodec.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 98a757d3a67d..96625355aa94 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -22,7 +22,6 @@ struct snd_sof_dsp_ops;
  */
 struct snd_sof_pdata {
 	const struct firmware *fw;
-	const char *drv_name;
 	const char *name;
 	const char *platform;
 
diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 0a2167f19f25..56d887545da3 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -74,8 +74,6 @@ int sof_nocodec_setup(struct device *dev,
 	if (!mach)
 		return -EINVAL;
 
-	sof_pdata->drv_name = "sof-nocodec";
-
 	mach->drv_name = "sof-nocodec";
 	sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
