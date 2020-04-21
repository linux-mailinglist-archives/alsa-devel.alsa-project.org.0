Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 280491B312A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 22:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5C7F16BA;
	Tue, 21 Apr 2020 22:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5C7F16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587500849;
	bh=Yk8IWfTWvjF8lGAbNTNjjJZY0uza82oL8XqH7ZTH2Yw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fcvq4rliAHce3u4W0iXRXzsGQC11T6zIKg7ozsobOJgW1XoCcwrpAVVJy345uB8gS
	 Eo31VmOXmMWRLEK/1ISqW6e9/gPwu95pVPV4fvkoGc82vapNkwrSLqErWQ3dTl9rhE
	 /gr06OfiTKwuqH7zhg5F/cT8qY+rYd3HyDM1/RQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91AAEF80299;
	Tue, 21 Apr 2020 22:24:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51982F8028F; Tue, 21 Apr 2020 22:24:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26B3FF801F5
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 22:24:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26B3FF801F5
IronPort-SDR: RJb9ph3+sS47FBLxx6mFSUTQmhDV8fI0hHBs/IjzHvFwST7LRlA36xF2MhWiV7MfPG5Sw1TGTQ
 3haO1nJ8MmNQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 13:24:30 -0700
IronPort-SDR: iMIVIKriUbyVJiEY1i2FcpPT2LybB5pHZ5IE39uMsMjdxVoWv9673pQIdVUmLhsajC+ka1nS6r
 5fyE4Z3j97Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,411,1580803200"; d="scan'208";a="456236701"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by fmsmga005.fm.intel.com with ESMTP; 21 Apr 2020 13:24:27 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: Intel: Skylake: Add alternative topology binary name
Date: Tue, 21 Apr 2020 22:25:17 +0200
Message-Id: <20200421202519.4008-3-mateusz.gorski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421202519.4008-1-mateusz.gorski@linux.intel.com>
References: <20200421202519.4008-1-mateusz.gorski@linux.intel.com>
Cc: cezary.rojewski@intel.com, Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 tiwai@suse.com
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

Add alternative topology binary file name based on used machine driver
and fallback to use this name after failed attempt to load topology file
with name based on NHLT.
This change addresses multiple issues with current mechanism, for
example - there are devices without NHLT table, and that currently
results in tplg_name being empty.

Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
---
 sound/soc/intel/skylake/skl-topology.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 69cd7a81bf2a..344b06df0e15 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3565,8 +3565,20 @@ int skl_tplg_init(struct snd_soc_component *component, struct hdac_bus *bus)
 
 	ret = request_firmware(&fw, skl->tplg_name, bus->dev);
 	if (ret < 0) {
-		dev_info(bus->dev, "tplg fw %s load failed with %d, falling back to dfw_sst.bin",
-				skl->tplg_name, ret);
+		char alt_tplg_name[64];
+
+		snprintf(alt_tplg_name, sizeof(alt_tplg_name), "%s-tplg.bin",
+				skl->i2s_dev->name);
+		dev_info(bus->dev, "tplg fw %s load failed with %d, trying alternative tplg name %s",
+				skl->tplg_name, ret, alt_tplg_name);
+
+		ret = request_firmware(&fw, alt_tplg_name, bus->dev);
+		if (!ret)
+			goto component_load;
+
+		dev_info(bus->dev, "tplg %s failed with %d, falling back to dfw_sst.bin",
+				alt_tplg_name, ret);
+
 		ret = request_firmware(&fw, "dfw_sst.bin", bus->dev);
 		if (ret < 0) {
 			dev_err(bus->dev, "Fallback tplg fw %s load failed with %d\n",
@@ -3575,6 +3587,9 @@ int skl_tplg_init(struct snd_soc_component *component, struct hdac_bus *bus)
 		}
 	}
 
+component_load:
+
+
 	/*
 	 * The complete tplg for SKL is loaded as index 0, we don't use
 	 * any other index
-- 
2.17.1

