Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F86137A6F
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jan 2020 01:04:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5940C16CC;
	Sat, 11 Jan 2020 01:03:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5940C16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578701045;
	bh=+a4IQIOkW48mip2Ezdl7gcfTo0cfDlFIy24iFR2BafU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=djB0qdNI3BpEpqpsssi8JAcZXL2NLGyUaa4xmTR75DMfb8nTqyvzs6SPv2ahKuuFn
	 uf2LNGBG4/sAqy2vd6ObnaYmZ4x030JbNOGicmgN96i9U4LqnPMTxgNNYrtGvJEeNx
	 LQfobh/mvnR2qYvFswVsUOUcNcwggnep8WGDzMtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 521E7F802A1;
	Sat, 11 Jan 2020 00:58:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D831DF80273; Sat, 11 Jan 2020 00:58:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62582F801F4
 for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2020 00:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62582F801F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 15:58:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,418,1571727600"; d="scan'208";a="224345307"
Received: from jrderube-mobl5.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.155.251])
 by orsmga003.jf.intel.com with ESMTP; 10 Jan 2020 15:58:11 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 10 Jan 2020 17:57:51 -0600
Message-Id: <20200110235751.3404-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110235751.3404-1-pierre-louis.bossart@linux.intel.com>
References: <20200110235751.3404-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 8/8] ASoC: hdac_hda: Fix error in driver
	removal after failed probe
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

In case system has multiple HDA codecs, and codec probe fails for
at least one but not all codecs, driver will end up cancelling
a non-initialized timer context upon driver removal.

Call trace of typical case:

[   60.593646] WARNING: CPU: 1 PID: 1147 at kernel/workqueue.c:3032
__flush_work+0x18b/0x1a0
[...]
[   60.593670]  __cancel_work_timer+0x11f/0x1a0
[   60.593673]  hdac_hda_dev_remove+0x25/0x30 [snd_soc_hdac_hda]
[   60.593674]  device_release_driver_internal+0xe0/0x1c0
[   60.593675]  bus_remove_device+0xd6/0x140
[   60.593677]  device_del+0x175/0x3e0
[   60.593679]  ? widget_tree_free.isra.7+0x90/0xb0 [snd_hda_core]
[   60.593680]  snd_hdac_device_unregister+0x34/0x50 [snd_hda_core]
[   60.593682]  snd_hdac_ext_bus_device_remove+0x2a/0x60 [snd_hda_ext_core]
[   60.593684]  hda_dsp_remove+0x26/0x100 [snd_sof_intel_hda_common]
[   60.593686]  snd_sof_device_remove+0x84/0xa0 [snd_sof]
[   60.593687]  sof_pci_remove+0x10/0x30 [snd_sof_pci]
[   60.593689]  pci_device_remove+0x36/0xb0

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/hdac_hda.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 4e0f4afe6ddc..de003acb1951 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -604,7 +604,9 @@ static int hdac_hda_dev_remove(struct hdac_device *hdev)
 	struct hdac_hda_priv *hda_pvt;
 
 	hda_pvt = dev_get_drvdata(&hdev->dev);
-	cancel_delayed_work_sync(&hda_pvt->codec.jackpoll_work);
+	if (hda_pvt && hda_pvt->codec.registered)
+		cancel_delayed_work_sync(&hda_pvt->codec.jackpoll_work);
+
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
