Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB10060B32B
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:58:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7416A7055;
	Mon, 24 Oct 2022 18:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7416A7055
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666630698;
	bh=sWOBwgRsoy9y5kURmZI6YfuFPM6WQDD0eUCExvrxxZ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jjSI+H39EyAF/VKaSctW/RpMsbLZ94jjfsi061ajTvaXSitPWo2cp3hyag7tJ8mLi
	 XPAhPenCPyA/0CH41dROZg3XsAsa8eoHPVJqZ9eVW4DsuI5ZbQVUujZoklYc/f99gX
	 XM4mpFjZXVuTZm6cHrPlvsI5yQgEGf8QOUthvNuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71444F805C5;
	Mon, 24 Oct 2022 18:53:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 430FDF8059F; Mon, 24 Oct 2022 18:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A753F8055A
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A753F8055A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UlQHxJO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666630414; x=1698166414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sWOBwgRsoy9y5kURmZI6YfuFPM6WQDD0eUCExvrxxZ8=;
 b=UlQHxJO59TBUHSOxNj5fB+8YbbiszFHESwsA//X4Urm0em7XmkqbP/Dd
 RETHUQQC2j0C/cEPOqektTidDAde+PFVBbDrQ7iyw8P9ONPQpzu3qHmTQ
 JQxlZnH0KfE/OSfAJHjw3KSgTVQR4h3jwww9Qjh30QzmNZ2Nm3Ch9sx+F
 lOBGyajc16Epc/eRsWXgF+gboLJQLPDFn/U1R/Grxzp39OGi9LtmYePUj
 waGTIT5LFKrgfY57eKMWFGw9sTwXbnzNCGaIypgHQmuXINwacuAHMU26Q
 E3IyGKYpkM7ETwa1CapI98vdq0CGqcdj/QdD3ROf0/PTX7GzXiZ4+B2Rl w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287868655"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="287868655"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:30 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609263072"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609263072"
Received: from tdsilva-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/16] ASoC: SOF: Intel: hda: remove useless check on GCTL
Date: Mon, 24 Oct 2022 11:53:05 -0500
Message-Id: <20221024165310.246183-12-pierre-louis.bossart@linux.intel.com>
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

Now that we always do a full reset, there's no point in checking if
the controller is always out-of-reset. This is always true by
construction.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index e3334693c2926..8a8b5f93db254 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -214,13 +214,6 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 	}
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	/* check to see if controller is ready */
-	if (!snd_hdac_chip_readb(bus, GCTL)) {
-		dev_dbg(bus->dev, "controller not ready!\n");
-		ret = -EBUSY;
-		goto err;
-	}
-
 	/* Accept unsolicited responses */
 	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, AZX_GCTL_UNSOL);
 
-- 
2.34.1

