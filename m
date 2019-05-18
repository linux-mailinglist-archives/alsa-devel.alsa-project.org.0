Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F633224D6
	for <lists+alsa-devel@lfdr.de>; Sat, 18 May 2019 22:29:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 220A31674;
	Sat, 18 May 2019 22:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 220A31674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558211394;
	bh=RLGoJwhnoN/pSdsDf414YWbvCCZsEFzHnfHafhkmGVk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vjKFAlbcUKp/ktEMQjqmX6rtWqzPUNCZNb0K0QjWg9HWbeFw97ZrPAj+qkrV+VTGq
	 Moei43gooVg2FfLcIADsSjXsP6OqcKhMgMG8UISVWo+aS+I0JlHEDLoRrDr8cpKcLA
	 j+UJOzPgypytdBLjrkXJJLzrlxB9xKIwTlMBu5EI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D27A9F89732;
	Sat, 18 May 2019 22:27:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30359F8961D; Sat, 18 May 2019 22:27:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDD45F8961D
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 22:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDD45F8961D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 May 2019 13:27:21 -0700
X-ExtLoop1: 1
Received: from bmaster1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.14])
 by orsmga002.jf.intel.com with ESMTP; 18 May 2019 13:27:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 18 May 2019 15:26:53 -0500
Message-Id: <20190518202704.7772-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190518202704.7772-1-pierre-louis.bossart@linux.intel.com>
References: <20190518202704.7772-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 01/12] ASoC: SOF: core: remove DSP after
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
