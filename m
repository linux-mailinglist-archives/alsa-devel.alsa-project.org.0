Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C16325247F
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 01:56:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5503016E7;
	Wed, 26 Aug 2020 01:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5503016E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598399768;
	bh=yjmAumisjaJ/+9hOepN5qM/ZqUYO42acOL/+vswKRwQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vdgFAvfkvDQyCFvEU8AbuSekdnot6Fm4FlDHgjpCjL56fB26JhVrcTh2r0tE/y+ru
	 eokFKHHIyK80gILsAEzECS6BfQu53YUcSfTnrWWgNEfvyVdB67Av8Uykot5guvKdOi
	 jafJccOKCBhjC7Vs7H8Ch3coPqybwVGqV9FdE57c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36625F802EA;
	Wed, 26 Aug 2020 01:51:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3ADBF80245; Wed, 26 Aug 2020 01:51:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E16E8F8025A
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 01:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E16E8F8025A
IronPort-SDR: 2TfRF/2aex7iauts9v/6n5twjS+X/v6SDzgGOwxOtmLymjlO5Dud+gSa8OogOsOS888No3vJ36
 9igm0kfhr7XA==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="157253461"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="157253461"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:50:57 -0700
IronPort-SDR: u7meM4mVEbiBlT/jiRAO68bnN02L1OdxvrpGiY/od8ld9Xc/XCy0QFNI2P5LTvut7fVov9+O4o
 wPm7RcLQyf/g==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="443818988"
Received: from cdurvasu-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.42.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:50:56 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/7] ASoC: SOF: fix a runtime pm issue in SOF when HDMI codec
 doesn't work
Date: Tue, 25 Aug 2020 16:50:35 -0700
Message-Id: <20200825235040.1586478-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
References: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

From: Rander Wang <rander.wang@intel.com>

When hda_codec_probe() doesn't initialize audio component, we disable
the codec and keep going. However,the resources are not released. The
child_count of SOF device is increased in snd_hdac_ext_bus_device_init
but is not decrease in error case, so SOF can't get suspended.

snd_hdac_ext_bus_device_exit will be invoked in HDA framework if it
gets a error. Now copy this behavior to release resources and decrease
SOF device child_count to release SOF device.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 55811b99e47a..f6ba3b593e1f 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -151,7 +151,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 		if (!hdev->bus->audio_component) {
 			dev_dbg(sdev->dev,
 				"iDisp hw present but no driver\n");
-			return -ENOENT;
+			goto error;
 		}
 		hda_priv->need_display_power = true;
 	}
@@ -174,7 +174,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 		 * other return codes without modification
 		 */
 		if (ret == 0)
-			ret = -ENOENT;
+			goto error;
 	}
 
 	return ret;
-- 
2.25.1

