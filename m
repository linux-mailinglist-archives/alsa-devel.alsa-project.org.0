Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0624D1DB2
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 17:47:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D1BC17F1;
	Tue,  8 Mar 2022 17:46:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D1BC17F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646758027;
	bh=+swSm3wPEFZSVw9Cfp5+ZQJFB6mQEStIMYUvZ9tTVNk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bhYnExNAJbhmATQyA2MsV81dz+f8zhov786H4b22Kixr+FWhLxXB3GCEWxuzz2puL
	 syqkZIKyufDt2PUgpfB0nahc1ys5+OFZbQM5hihohkPPB+Ty8BXSFz2fbgjPGf7njl
	 JnZaGi2tgt9B0etslp/ZpGpNa07csk/vqXkeIJ0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1D9CF8053B;
	Tue,  8 Mar 2022 17:44:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23188F8052E; Tue,  8 Mar 2022 17:44:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAD8BF8025E
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 17:44:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAD8BF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IRvxnOav"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646757850; x=1678293850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+swSm3wPEFZSVw9Cfp5+ZQJFB6mQEStIMYUvZ9tTVNk=;
 b=IRvxnOavfWHsi78B4PY8VmKU+g9iXFUjZyOwsk7H8VzbHGdQmgHVY19s
 CT7U9MMqL2Q8STIGnjjZfkdLBmk7a7i7GuhfN/UFsfXUF5mDrIOjl7Z6c
 JuIeOgnjVW1HkwYKA/bLRvi/YjnUqwB9V6F+AxT3PXa8DfObECKD3ATM6
 7idADyYlWF0w8p/Ic1KNCyAOzZh7ptO8Lw13vIdR8fY5B0zMyiGNvWMxm
 5y9a3RMFOElJKuY9BIRSa5HzydPBzViQ62JgEuDbbjO0Pl2JFEuk0Uml+
 bDbWSBPVlMqQj3G+/OX8DFCWJp4l+laCitacJKUrbtBqy93Bnjr/DExIe A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252307205"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252307205"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:52 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="537633211"
Received: from bustam3x-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.251.130.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:52 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 02/18] ASoC: SOF: simplify snd_sof_device_remove()
Date: Tue,  8 Mar 2022 08:43:28 -0800
Message-Id: <20220308164344.577647-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
References: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The commit "ASoC: SOF: core: Unregister machine driver before IPC and
debugfs" moved the call to unregister the machine driver to be done
before freeing the IPC. With this change, we can safely move the call to
snd_sof_remove() inside the same if() block just above.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 2a35d8ddf43e..95a845d26f6e 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -442,16 +442,8 @@ int snd_sof_device_remove(struct device *dev)
 
 		snd_sof_ipc_free(sdev);
 		snd_sof_free_debug(sdev);
-	}
-
-	/*
-	 * Unregistering the machine driver results in unloading the topology.
-	 * Some widgets, ex: scheduler, attempt to power down the core they are
-	 * scheduled on, when they are unloaded. Therefore, the DSP must be
-	 * removed only after the topology has been unloaded.
-	 */
-	if (sdev->fw_state > SOF_FW_BOOT_NOT_STARTED)
 		snd_sof_remove(sdev);
+	}
 
 	/* release firmware */
 	snd_sof_fw_unload(sdev);
-- 
2.25.1

