Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2222F7E0
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 20:39:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E551A169D;
	Mon, 27 Jul 2020 20:38:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E551A169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595875169;
	bh=i7Jkl4pxWVL6zc+YfsztV3CTe+UtY6rZXV7PTffr9qM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jwOK+DNX85pjW9uZzCsT07U/Mc0QYGyEw+ruPsWMUss2B3AE2vJI48LGvEQiIYvhy
	 xx4rwogT7ifbejIy+tpUJqcqCSFNOYK+HFRbUPZ6llFurPdTIJQP3ZA8z309TAJaSB
	 yP1xWvxnYZFJBTFj7r7tfS1xUim+ypCgRT2XkQYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8707DF8029B;
	Mon, 27 Jul 2020 20:36:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F493F801F7; Mon, 27 Jul 2020 20:36:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2DC3F80171
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 20:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2DC3F80171
IronPort-SDR: rEY4xv7rmWmwmYj3arsAbskD6UFy2vEbpPFCbyYJuMOu/0G54be/UMlH4Zzf5QnrbH1hbrI/NT
 ApmxuEQuablg==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="148562204"
X-IronPort-AV: E=Sophos;i="5.75,403,1589266800"; d="scan'208";a="148562204"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 11:36:36 -0700
IronPort-SDR: 8H5OTjkGRfH8Yzi1Q9ssWKCx2CRSHUH5Lh4vHFcmmiFJso9hcegoEWCIfGdxcQzVyNFcJmzz+8
 3lBcZhT5LXlg==
X-IronPort-AV: E=Sophos;i="5.75,403,1589266800"; d="scan'208";a="490063013"
Received: from rkbasco-mobl1.amr.corp.intel.com (HELO
 ranjani-desktop.localdomain) ([10.251.147.18])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 11:36:36 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: SOF: Intel: disable traces when switching to S0Ix
 D0I3
Date: Mon, 27 Jul 2020 11:36:13 -0700
Message-Id: <20200727183613.1419005-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727183613.1419005-1-ranjani.sridharan@linux.intel.com>
References: <20200727183613.1419005-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Marcin Rajwa <marcin.rajwa@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org
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

From: Marcin Rajwa <marcin.rajwa@linux.intel.com>

We should always disable DMA trace on S0Ix. When staying at S0-D0I3,
we should enable DMA trace while both DMA Trace debug is enabled and
hda_enable_trace_D0I3_S0 is set. This commit corrects the existed
logic errors about that.

Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 89961397010a..ed4d65a29d3a 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -408,11 +408,13 @@ static int hda_dsp_set_D0_state(struct snd_sof_dev *sdev,
 		value = SOF_HDA_VS_D0I3C_I3;
 
 		/*
-		 * Trace DMA is disabled by default when the DSP enters D0I3.
-		 * But it can be kept enabled when the DSP enters D0I3 while the
-		 * system is in S0 for debug.
+		 * Trace DMA need to be disabled when the DSP enters
+		 * D0I3 for S0Ix suspend, but it can be kept enabled
+		 * when the DSP enters D0I3 while the system is in S0
+		 * for debug purpose.
 		 */
-		if (hda_enable_trace_D0I3_S0 &&
+		if (!sdev->dtrace_is_supported ||
+		    !hda_enable_trace_D0I3_S0 ||
 		    sdev->system_suspend_target != SOF_SUSPEND_NONE)
 			flags = HDA_PM_NO_DMA_TRACE;
 	} else {
-- 
2.25.1

