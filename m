Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE57D253D2D
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 07:23:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68E1017CC;
	Thu, 27 Aug 2020 07:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68E1017CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598505802;
	bh=/YKZEFi5F0VKwiUokMJyOPMPcVNtv4vaP8XbgJUKHLY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WLzqKwX42/DBJFPsujP3jpba1raEql1AJuLXtZB0BvYO9sJHkNQYpZ/Y5Ha+xdDls
	 9YwbbpABRYvhPwaP2YqOWm88WGFudTl7lu3lITvbz024GNPjmttLcT090LiZBl70Rl
	 ZZgKkqfdCTbHThGfiT5NsMyFF/iq2Pi9TPqNX5ZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87DEDF80105;
	Thu, 27 Aug 2020 07:21:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E558DF8016F; Thu, 27 Aug 2020 07:21:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FE16F80105
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 07:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FE16F80105
IronPort-SDR: 3qw2Iw8kmGWvt6q6/ki+wt1uGPmrkuWgPOW5vCi7hTOvZ4XEbEKKEiV9GYhUExHhKBkUZS8Upx
 NRKakjTNxTkw==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="217972727"
X-IronPort-AV: E=Sophos;i="5.76,358,1592895600"; d="scan'208";a="217972727"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 22:21:19 -0700
IronPort-SDR: iphuY5GyNlaZ+FhOB8c4v0qoUYwl+6sFdYcoxQDk7TiBsHK8o/oMEY4wiqsaoocfTQNDGijVXa
 nBJXAq4lbD6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,358,1592895600"; d="scan'208";a="323459519"
Received: from joycetoh-desk.sc.intel.com ([172.25.206.187])
 by fmsmga004.fm.intel.com with ESMTP; 26 Aug 2020 22:21:18 -0700
From: Harsha Priya <harshapriya.n@intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: Realtek: Early Forbid of runtime PM
Date: Wed, 26 Aug 2020 22:20:43 -0700
Message-Id: <1598505643-30347-1-git-send-email-harshapriya.n@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Harsha Priya <harshapriya.n@intel.com>,
 Emmanuel Jillela <emmanuel.jillela@intel.com>
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

For Realtek codecs, pm_runtime_forbid() is called in the probe function 
after the build_controls(). In a stress test, occasionally the runtime
PM calls are invoked before controls are built. This causes the codec to be
runtime suspended before probe completes. Because of this, not all
controls are enumerated correctly and audio does not work until
system is rebooted.

This patch calls pm_runtime_forbid() early to fix the issue.
Multiple stress tests of 2000+ cycles has been done to test the fix.

Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
Signed-off-by: Emmanuel Jillela <emmanuel.jillela@intel.com>
Reviewed-by: Kailang Yang <kailang@realtek.com>

---
 sound/pci/hda/patch_realtek.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 98789691a479..30ea07fd6735 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8418,6 +8418,7 @@ static int patch_alc269(struct hda_codec *codec)
 {
 	struct alc_spec *spec;
 	int err;
+	struct device *dev = hda_codec_dev(codec);
 
 	err = alc_alloc_spec(codec, 0x0b);
 	if (err < 0)
@@ -8430,6 +8431,8 @@ static int patch_alc269(struct hda_codec *codec)
 #ifdef CONFIG_PM
 	codec->patch_ops.suspend = alc269_suspend;
 	codec->patch_ops.resume = alc269_resume;
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_forbid(dev);
 #endif
 	spec->shutup = alc_default_shutup;
 	spec->init_hook = alc_default_init;
-- 
2.17.1

