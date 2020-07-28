Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 644F623162C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 01:12:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7641173F;
	Wed, 29 Jul 2020 01:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7641173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595977934;
	bh=rLxnqT4LZRyhXvVl75QDCdVGtKvIT/lEwF9+qyRv6XU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MvgrcdoM8e9VSGnCh5YRBPgEuqGWkNrYuZr7mODq/vDnM4iY35XQDCtWHWYLotnwp
	 2PcYrpr4MQ5t5zxwDpj+jDQTUbWjZIEWKJJst2ZqVj+2T3zyQTnFZJtVMHycZdwKQU
	 nyOBcj8KHLABKwI1DavqfS7MVhM3tgZQcOiUuSTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB91F80227;
	Wed, 29 Jul 2020 01:10:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02C19F800DE; Wed, 29 Jul 2020 01:10:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8496EF800DE
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 01:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8496EF800DE
IronPort-SDR: cPvKp4jp0Dt05eoTTMmkldA51DVsLUi+E8kgkd/qkTVM0fCogm7HvoZvs96lWRwl6KmdViOmPQ
 G2xss0HhIIKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="151312748"
X-IronPort-AV: E=Sophos;i="5.75,408,1589266800"; d="scan'208";a="151312748"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2020 16:10:17 -0700
IronPort-SDR: 4phUcnZAMpaomEE3XGPwxZOaAchOsFPFYqB5/WF5IXLVGrX7la+btKViYz48z1dV4OflabVmVT
 L69loOAr8mNQ==
X-IronPort-AV: E=Sophos;i="5.75,408,1589266800"; d="scan'208";a="434494870"
Received: from hfranco-mobl1.amr.corp.intel.com (HELO
 ranjani-desktop.localdomain) ([10.254.52.60])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2020 16:10:17 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: fix NULL pointer dereference during suspend
Date: Tue, 28 Jul 2020 16:10:11 -0700
Message-Id: <20200728231011.1454066-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 tiwai@suse.com, yong.zhi@intel.com
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

When the ASoC card registration fails and the codec component driver
never probes, the codec device is not initialized and therefore
memory for codec->wcaps is not allocated. This results in a NULL pointer
dereference when the codec driver suspend callback is invoked during
system suspend. Fix this by returning without performing any actions
during codec suspend/resume if the card was not registered successfully.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/pci/hda/hda_codec.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 3576e2d8452f..9b1f387d18e5 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2936,6 +2936,10 @@ static int hda_codec_runtime_suspend(struct device *dev)
 	struct hda_codec *codec = dev_to_hda_codec(dev);
 	unsigned int state;
 
+	/* Nothing to do if card registration fails and the component driver never probes */
+	if (!codec->card)
+		return 0;
+
 	cancel_delayed_work_sync(&codec->jackpoll_work);
 	state = hda_call_codec_suspend(codec);
 	if (codec->link_down_at_suspend ||
@@ -2950,6 +2954,10 @@ static int hda_codec_runtime_resume(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
 
+	/* Nothing to do if card registration fails and the component driver never probes */
+	if (!codec->card)
+		return 0;
+
 	codec_display_power(codec, true);
 	snd_hdac_codec_link_up(&codec->core);
 	hda_call_codec_resume(codec);
-- 
2.25.1

