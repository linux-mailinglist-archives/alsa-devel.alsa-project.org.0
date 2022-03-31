Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1674C4ED8B2
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 13:49:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC4D018F1;
	Thu, 31 Mar 2022 13:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC4D018F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648727391;
	bh=+2QB/ZPh3eCGgWghXsJqdq16EQPF+2EC2fogqMKyTZQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FsG2hVRxagY0vyuRUoKwCYZfL8mtVsGIJ062Njp6+nODE2W3N72iCTW367Ura8ozp
	 1r/6+i2fyHVLt5H9yeXlDsk5J/lfVjJI30o4I928E1jRHcPU1tW0H60ATowh04TYcn
	 jxi+zhNMlngCTl0eiNgnJfzNnUpSLXL/+gVzJUys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A685EF802D2;
	Thu, 31 Mar 2022 13:48:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E59CBF802D2; Thu, 31 Mar 2022 13:48:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44639F802D2
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 13:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44639F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OGvUaHwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648727316; x=1680263316;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+2QB/ZPh3eCGgWghXsJqdq16EQPF+2EC2fogqMKyTZQ=;
 b=OGvUaHwE+h5AIAw6PSqlGvjp3cCOBMjspT5Pfj8n3COnyw0P9kl/0LjT
 85pe72dg5Qxr3wy2eRKXLoapCFtLM8d58P4KB1eShdkKNYYrDB9RFK4Bc
 d3PCam6XbO4j4ZTPJgNbL4nhPI5Z4xXA5vQcwl0+5m4hcnso5DbLKtqZj
 mDMmMtoWnL5sDM7QkcytA+I3UNEVq0z8S+6Pi5UyvSBWNGAAWhvDITunV
 ydzpTnhyr4gvnMPCDgNNv1xuVMNawcMzLPBJLJdUFQOeDDVdxrE0rH4j9
 cot5JWFuXQHigPiu+Ysmp6qBODhkVrIZ2ClkyZz/Rj5ep/am3JrePdfWe w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259519651"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="259519651"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 04:48:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="566407249"
Received: from dmmatarr-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.22])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 04:48:30 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: topology: Fix memory leak of scontrol->name
Date: Thu, 31 Mar 2022 14:48:45 +0300
Message-Id: <20220331114845.32747-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
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

The scontrol->name is allocated with kstrdup, it must be freed before the
scontrol is freed to avoid leaking memory.

The constant leaking happens via sof_widget_unload() path on every module
removal.

Fixes: b5cee8feb1d48 ("ASoC: SOF: topology: Make control parsing IPC agnostic")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/topology.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 9b11e9795a7a..75d78f9178a3 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -941,11 +941,13 @@ static int sof_control_load(struct snd_soc_component *scomp, int index,
 	default:
 		dev_warn(scomp->dev, "control type not supported %d:%d:%d\n",
 			 hdr->ops.get, hdr->ops.put, hdr->ops.info);
+		kfree(scontrol->name);
 		kfree(scontrol);
 		return 0;
 	}
 
 	if (ret < 0) {
+		kfree(scontrol->name);
 		kfree(scontrol);
 		return ret;
 	}
@@ -1380,6 +1382,7 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 		}
 		kfree(scontrol->ipc_control_data);
 		list_del(&scontrol->list);
+		kfree(scontrol->name);
 		kfree(scontrol);
 	}
 
-- 
2.35.1

