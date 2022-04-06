Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 459C64F6A2F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 21:43:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D70D91724;
	Wed,  6 Apr 2022 21:42:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D70D91724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649274185;
	bh=qqmM84HzJCTPTpT3s8fPLN9PxGj173w/j18NpS+U13w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nadCx6sBbG5StXS/rB/IDpYh/U4HQxrHX0lNWDUryfg0brQT/6Ux+i3lLqfb6FsEb
	 MV89oJHIRykUy8dHQy3mUu2qfgrcQfLf0MDw/ykoxgb1Lvs29qTe5aeZtDH0E9swMN
	 mAg9dl+SSMlzFKXkzYunseRqEhDphZHk5v8OPL8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08C6AF8051E;
	Wed,  6 Apr 2022 21:41:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 920F9F80519; Wed,  6 Apr 2022 21:41:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68D99F80141
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 21:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68D99F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="B4utRJaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649274067; x=1680810067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qqmM84HzJCTPTpT3s8fPLN9PxGj173w/j18NpS+U13w=;
 b=B4utRJaw/JR2Wm50Qmlu+NRi6we7VS0zg/Y8K+K/iaDkNY85qpoTyM5D
 U2f0ngbv6iknq0W0KkbGzTNeYWuCpOHVs3PLVAYu+ct0RPlcoP0C4mJ4O
 1d08z4AGS8xU37jGTGctEF7L/v57qzEvFDfHiIoIqMR7u45R+40D7l81R
 fpUChxNLuog++LQEuwYWCkNGWUk7F3+lmWeK6AsmOH3uQBfB4xXG5vToa
 miiSjYrO4TeBq6rXO0VWUQF7N3D5946D7iUrakX65QaJG7H6EnZYi1BHy
 gtywqMzx5rZuJH++Ec89RrFCA7XAK1gOq40CO7NmoCcfM6tC2rK7If7U0 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="347582616"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="347582616"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:41:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="570713308"
Received: from cbok-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.137.86])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:41:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: SOF: mediatek: mt8195 add shutdown callback
Date: Wed,  6 Apr 2022 14:40:46 -0500
Message-Id: <20220406194048.289787-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406194048.289787-1-pierre-louis.bossart@linux.intel.com>
References: <20220406194048.289787-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, YC Hung <yc.hung@mediatek.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: YC Hung <yc.hung@mediatek.com>

Add mt8195 shutdown callback function implementation to ensure that
shutdown flow is called to shutdown dsp core, disable adsp clock, and
power off dsp sram correctly during reboot flow.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 3ab12f352935..b5e2fd72acfb 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -302,6 +302,11 @@ static int mt8195_dsp_probe(struct snd_sof_dev *sdev)
 	return ret;
 }
 
+static int mt8195_dsp_shutdown(struct snd_sof_dev *sdev)
+{
+	return snd_sof_suspend(sdev->dev);
+}
+
 static int mt8195_dsp_remove(struct snd_sof_dev *sdev)
 {
 	struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
@@ -392,6 +397,7 @@ static const struct snd_sof_dsp_ops sof_mt8195_ops = {
 	/* probe and remove */
 	.probe		= mt8195_dsp_probe,
 	.remove		= mt8195_dsp_remove,
+	.shutdown	= mt8195_dsp_shutdown,
 
 	/* DSP core boot */
 	.run		= mt8195_run,
@@ -451,6 +457,7 @@ MODULE_DEVICE_TABLE(of, sof_of_mt8195_ids);
 static struct platform_driver snd_sof_of_mt8195_driver = {
 	.probe = sof_of_probe,
 	.remove = sof_of_remove,
+	.shutdown = sof_of_shutdown,
 	.driver = {
 	.name = "sof-audio-of-mt8195",
 		.pm = &sof_of_pm,
-- 
2.30.2

