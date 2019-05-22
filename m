Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B350A26823
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 18:24:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35CC7166C;
	Wed, 22 May 2019 18:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35CC7166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558542263;
	bh=+TCsomuApUU+hBeJyw+1vdj9gMJf19UC3uwpbdytYzg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQC/q+izrIvcRG5SFZY6UD4DGIGv0BF0H19KKjLMZ0YhpUE5bjJIiI3+yi1+hPFX5
	 /ZugtxfQFpltczqGsqpO/22GPwVH7vmXQ4n6vrFlPxR+6i5ZthR21i4tnyo4TKKBFl
	 jvZBVxIqYVd6PlqXlt40RCCYRoxpY4+vOgfojswc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67CF3F8972E;
	Wed, 22 May 2019 18:22:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8A0DF89633; Wed, 22 May 2019 18:21:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2851FF8962C
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 18:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2851FF8962C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 09:21:49 -0700
X-ExtLoop1: 1
Received: from avcaesar-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.140.52])
 by fmsmga001.fm.intel.com with ESMTP; 22 May 2019 09:21:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 22 May 2019 11:21:31 -0500
Message-Id: <20190522162142.11525-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
References: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 01/12] ASoC: SOF: core: remove DSP after
	unregistering machine driver
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

snd_sof_remove() disables the DSP and unmaps the DSP BAR.
Removing topology after disabling the DSP results in a
kernel panic while unloading the pipeline widget. This is
because pipeline widget unload attempts to power down
the core it is scheduled on by accessing the DSP registers.

So, the suggested fix here is to unregister the machine driver
first to remove the topology and then disable the DSP
to avoid the situation described above.

Note that the kernel panic only happens in cases where the
HDaudio link is not managed by the hdac library,
e.g. no codec or when HDMI is not supported.
When the hdac library is used, snd_sof_remove() calls
snd_hdac_ext_bus_device_remove() to remove the codec which
unregisters the component driver thereby also removing the
topology before the DSP is disabled.

Fixes: c16211d6226 ("ASoC: SOF: Add Sound Open Firmware driver core")
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 32105e0fabe8..0bc4a8472c10 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -484,7 +484,6 @@ int snd_sof_device_remove(struct device *dev)
 	snd_sof_ipc_free(sdev);
 	snd_sof_free_debug(sdev);
 	snd_sof_free_trace(sdev);
-	snd_sof_remove(sdev);
 
 	/*
 	 * Unregister machine driver. This will unbind the snd_card which
@@ -494,6 +493,14 @@ int snd_sof_device_remove(struct device *dev)
 	if (!IS_ERR_OR_NULL(pdata->pdev_mach))
 		platform_device_unregister(pdata->pdev_mach);
 
+	/*
+	 * Unregistering the machine driver results in unloading the topology.
+	 * Some widgets, ex: scheduler, attempt to power down the core they are
+	 * scheduled on, when they are unloaded. Therefore, the DSP must be
+	 * removed only after the topology has been unloaded.
+	 */
+	snd_sof_remove(sdev);
+
 	/* release firmware */
 	release_firmware(pdata->fw);
 	pdata->fw = NULL;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
