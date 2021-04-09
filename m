Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 379EB35A89F
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 00:11:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA9031679;
	Sat, 10 Apr 2021 00:11:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA9031679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618006314;
	bh=IX5Jd2svaNX4SFUo4gmoJVyq+hPy8uvgXmK1CIs6jUs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PQjaJ0gnopsFft0TnbPWNoxI1WBJm3GKWhA8eijlHIi6GOscfch6eNzJgG+jf/PRE
	 YgF6AXxdYE+Erds6BvcjTpBPL9CCE8dqxAcwl/e0XRO1MaS1FoQcNobnpdilemjtS4
	 gmbXBrkavnz76Hb0amLMMk3iVHHduG4y3H1wxJ7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9192FF800EE;
	Sat, 10 Apr 2021 00:10:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24482F8025C; Sat, 10 Apr 2021 00:10:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82A88F800EE
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 00:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82A88F800EE
IronPort-SDR: 8nnTNUYYpy8z0jnBeEko9+IikSHNqZLMORaksPK0QYKR4Y1Ce0M5vyK80yyPfK2piywp5AwKFg
 AcZOYFV2T+fQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="214285708"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="214285708"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:10:05 -0700
IronPort-SDR: PrUfgEW4S/fNFpNxJrCKKewtI/f93wdXwKWtxl9nCJCUqN8MHjbo/PfeXd4vaPFm6ff30Ruabv
 pyYIfLIe3gpg==
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="599292827"
Received: from ukorat-mobl2.amr.corp.intel.com (HELO rsridh-mobl1.localdomain)
 ([10.212.104.152])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:10:05 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: SOF: core: Add missing error prints to device probe
 operation
Date: Fri,  9 Apr 2021 15:09:58 -0700
Message-Id: <20210409220959.1543456-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409220959.1543456-1-ranjani.sridharan@linux.intel.com>
References: <20210409220959.1543456-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Two error cases in snd_sof_device_probe() and sof_probe_continue() are
missing error prints.
If either of them happens it is not possible to identify the reason for the
failure.

Add dev_err() prints for the cases to aim debugging.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 7005353602c4..3e4dd4a86363 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -232,8 +232,11 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	}
 
 	ret = snd_sof_machine_register(sdev, plat_data);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: failed to register machine driver %d\n", ret);
 		goto fw_trace_err;
+	}
 
 	/*
 	 * Some platforms in SOF, ex: BYT, may not have their platform PM
@@ -309,8 +312,10 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	    !sof_ops(sdev)->block_read || !sof_ops(sdev)->block_write ||
 	    !sof_ops(sdev)->send_msg || !sof_ops(sdev)->load_firmware ||
 	    !sof_ops(sdev)->ipc_msg_data || !sof_ops(sdev)->ipc_pcm_params ||
-	    !sof_ops(sdev)->fw_ready)
+	    !sof_ops(sdev)->fw_ready) {
+		dev_err(dev, "error: missing mandatory ops\n");
 		return -EINVAL;
+	}
 
 	INIT_LIST_HEAD(&sdev->pcm_list);
 	INIT_LIST_HEAD(&sdev->kcontrol_list);
-- 
2.25.1

