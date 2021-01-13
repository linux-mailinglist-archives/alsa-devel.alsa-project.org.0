Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 139892F4E31
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 16:12:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F19A16DB;
	Wed, 13 Jan 2021 16:11:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F19A16DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610550744;
	bh=C//XlUVHJoZpMKLNNCCUCC/2zi6aHrcqLaR1aHViXj8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=huUGqWS+ZblseXwnLAHnE0uCZb7XPOvIsEkLIjs5NjsNvmeAuwtisUiouzfkif1Y4
	 oBbZapZ0UIT5HgYf/RrpGYGrzGIoIqZ243GAxhaCiyFrJ80WRTrjkz7BwKkFpt6wut
	 TpY7qe3RNTNo3h3Yv8LNBL8VaZQHhlIH2ywrRjW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16243F80254;
	Wed, 13 Jan 2021 16:10:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ECC5F8025F; Wed, 13 Jan 2021 16:10:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F15D9F80085
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 16:10:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F15D9F80085
IronPort-SDR: 1Ek65WZYJSIHLEmHTLRKLhemLjgzVh8c+Gh+idslHr71nvpP8neKrLT9vPvQeQQmhyd1+n1H4z
 ShCesxUxodgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="178363152"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="178363152"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 07:10:29 -0800
IronPort-SDR: s0ZVXAWu3SHLxMGhWLyU5W569T7NRD212VaE7QlA/xudU4tGxt/ibsmZcvosTqJrfTSDUO0cQh
 EG8KHdr6YsPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="400572542"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2021 07:10:26 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: fix page fault at probe if i915 init fails
Date: Wed, 13 Jan 2021 17:07:15 +0200
Message-Id: <20210113150715.3992635-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, Rander Wang <rander.wang@intel.com>,
 daniel.baluta@nxp.com, Bard Liao <bard.liao@intel.com>
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

The earlier commit to fix runtime PM in case i915 init fails,
introduces a possibility to hit a page fault.

snd_hdac_ext_bus_device_exit() is designed to be called from
dev.release(). Calling it outside device reference counting, is
not safe and may lead to calling the device_exit() function
twice. Additionally, as part of ext_bus_device_init(), the device
is also registered with snd_hdac_device_register(). Thus before
calling device_exit(), the device must be removed from device
hierarchy first.

Fix the issue by rolling back init actions by calling
hdac_device_unregister() and then releasing device with put_device().
This matches with existing code in hdac-ext module.

To complete the fix, add handling for the case where
hda_codec_load_module() returns -ENODEV, and clean up the hdac_ext
resources also in this case.

In future work, hdac-ext interface should be extended to allow clients
more flexibility to handle the life-cycle of individual devices, beyond
just the current snd_hdac_ext_bus_device_remove(), which removes all
devices.

BugLink: https://github.com/thesofproject/linux/issues/2646
Reported-by: Jaroslav Kysela <perex@perex.cz>
Fixes: 6c63c954e1c5 ("ASoC: SOF: fix a runtime pm issue in SOF when HDMI codec doesn't work")
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 6875fa570c2c..8b0ddc4b8227 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -156,7 +156,8 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 		if (!hdev->bus->audio_component) {
 			dev_dbg(sdev->dev,
 				"iDisp hw present but no driver\n");
-			goto error;
+			ret = -ENOENT;
+			goto out;
 		}
 		hda_priv->need_display_power = true;
 	}
@@ -173,24 +174,23 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 		 * other return codes without modification
 		 */
 		if (ret == 0)
-			goto error;
+			ret = -ENOENT;
 	}
 
-	return ret;
-
-error:
-	snd_hdac_ext_bus_device_exit(hdev);
-	return -ENOENT;
-
+out:
+	if (ret < 0) {
+		snd_hdac_device_unregister(hdev);
+		put_device(&hdev->dev);
+	}
 #else
 	hdev = devm_kzalloc(sdev->dev, sizeof(*hdev), GFP_KERNEL);
 	if (!hdev)
 		return -ENOMEM;
 
 	ret = snd_hdac_ext_bus_device_init(&hbus->core, address, hdev, HDA_DEV_ASOC);
+#endif
 
 	return ret;
-#endif
 }
 
 /* Codec initialization */
-- 
2.29.2

