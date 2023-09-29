Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D207B3158
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 13:27:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4488EE10;
	Fri, 29 Sep 2023 13:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4488EE10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695986821;
	bh=WIqnqrnEYC+eHAAe0XmX0Kua+R3ZcYduhStPWHo56H4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pjCV6zmExyWKH3QMHtt88XiT3FS5/YOC94gjg7hE/qjTzxMHDU1y0sA3u2RXj0x8G
	 BzjDZaykqInYx7zqKrSjbnp7NloUs5qB97/kiI+BCP0hMFoNAKxN4p7N4hsm6djTdj
	 1Lf9v/f1YaRKGzlezxQD1ORPJGeNKLiYGjjM6gro=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A87DF805A1; Fri, 29 Sep 2023 13:25:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5298F80580;
	Fri, 29 Sep 2023 13:25:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 415BBF801D5; Fri, 29 Sep 2023 13:24:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A663F80290
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 13:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A663F80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=d1D/MuAQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695986681; x=1727522681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WIqnqrnEYC+eHAAe0XmX0Kua+R3ZcYduhStPWHo56H4=;
  b=d1D/MuAQwtG1w+84Gd9BfOrBxdtS+AmZNUxjE37T/OnzblgEJwJ9rgFl
   plyWMfcWldPot2w8HniHQ8KFdiFqQoBeVSqkfxIFfREWvbREL2yj7mRrv
   8oGAuLMRbHw21e7BO13g8NQFWRHuQ70YJTifmFPO7XM4ln3hEn+fQM4/C
   6UPefZS7LmlarzCtPkPK6pBYH3VZwDVzaWzMsytSYleX6Hp+E516BVtks
   rHl8sgHAaC5WJx/S+x5oZybqSduDJD5M5kj9/V4AJCT8mmAfkJZcgXuK5
   ORBXyhk2h9gAGqUXebAoPB1L1YuIuM3Z/SfBgX8K4JlpqsnP0QWw/XlEG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="880256"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="880256"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 04:24:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="753353726"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="753353726"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga007.fm.intel.com with ESMTP; 29 Sep 2023 04:24:33 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 4/6] ASoC: Intel: avs: Keep module refcount up when gathering
 traces
Date: Fri, 29 Sep 2023 13:24:34 +0200
Message-Id: <20230929112436.787058-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929112436.787058-1-amadeuszx.slawinski@linux.intel.com>
References: <20230929112436.787058-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G6GDGLZXGN2QVGI2O3XQMJ7A5YVXAYEQ
X-Message-ID-Hash: G6GDGLZXGN2QVGI2O3XQMJ7A5YVXAYEQ
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G6GDGLZXGN2QVGI2O3XQMJ7A5YVXAYEQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Cezary Rojewski <cezary.rojewski@intel.com>

To prevent rmmod and similar behave unexpectedly when invoked on
snd_soc_avs module while the AudioDSP firmware tracing is ongoing,
increase the module refcount until the tracing is stopped.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/debugfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index bdd388ec01ea..4dfbff0ce508 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -236,6 +236,9 @@ static int strace_open(struct inode *inode, struct file *file)
 	struct avs_dev *adev = inode->i_private;
 	int ret;
 
+	if (!try_module_get(adev->dev->driver->owner))
+		return -ENODEV;
+
 	if (kfifo_initialized(&adev->trace_fifo))
 		return -EBUSY;
 
@@ -270,6 +273,7 @@ static int strace_release(struct inode *inode, struct file *file)
 
 	spin_unlock_irqrestore(&adev->trace_lock, flags);
 
+	module_put(adev->dev->driver->owner);
 	return 0;
 }
 
-- 
2.34.1

