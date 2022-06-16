Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFEE54ECF3
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 23:58:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 539571B1B;
	Thu, 16 Jun 2022 23:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 539571B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655416686;
	bh=sWEKbU6dqvHwRpnGPLTEIY49Qt7panA9csgyYzeYU3Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ipwIo6Mu2gC5hojWt2dSsCa6KWlnBqMDuYf2JD5gmjsJX3PWysZgepXD7lG9NcUpI
	 +4e8XH54NrXLtOFY8tGfFbbT1ubZKc88MNrKZFYkRbiMHtlYELagHBR4RfrkwituIP
	 Z7/qnIzLhggNEQ+YdXTRcS3H9E5m5RgvbOMbptPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCFB8F80557;
	Thu, 16 Jun 2022 23:54:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AC91F8053C; Thu, 16 Jun 2022 23:54:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78FCCF80527
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 23:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78FCCF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LSKwai30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655416484; x=1686952484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sWEKbU6dqvHwRpnGPLTEIY49Qt7panA9csgyYzeYU3Y=;
 b=LSKwai30C6B1iXnaviLHLJSqn/sLoCsqVYY1rHCy6rx71K9PVY4jg5Wk
 x0po7P8BfzsWJV25W3wRK2fJbyJAjIeON0BUYaIaGhxfGCk6Uc7G+n3nG
 UP+kRvmsFmcN4hDRLpOAPp70uPGfqUp32/8yp8A8mL+M4Z360sF7Tqd0F
 E8lvEzztqWpFeVFqO3xLpKtP+IWrRXxZ1OtkcL7b7z1e/6Cp1l+4tl4M9
 l9qO9bEhb2S7nd5LPWoXK7NYSGOWyxKrNAfIwMTND0UqybJOluTYRxy4A
 jCDHnuzE6KhdOdrwcM5hHGg6UTK5sjt+qtzhD+V91DDXWS8WWC89FfBWd w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268047812"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268047812"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:17 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="675212662"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/13] ASoC: SOF: Intel: hda-stream: remove use of __func__ in
 dev_dbg
Date: Thu, 16 Jun 2022 16:53:42 -0500
Message-Id: <20220616215351.135643-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
References: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
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

The module and function information can be added with
'modprobe foo dyndbg=+pmf'

Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index fad871966de83..4531e1ee5ed00 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -116,13 +116,13 @@ int hda_dsp_stream_setup_bdl(struct snd_sof_dev *sdev,
 	int remain, ioc;
 
 	period_bytes = hstream->period_bytes;
-	dev_dbg(sdev->dev, "%s: period_bytes:0x%x\n", __func__, period_bytes);
+	dev_dbg(sdev->dev, "period_bytes:0x%x\n", period_bytes);
 	if (!period_bytes)
 		period_bytes = hstream->bufsize;
 
 	periods = hstream->bufsize / period_bytes;
 
-	dev_dbg(sdev->dev, "%s: periods:%d\n", __func__, periods);
+	dev_dbg(sdev->dev, "periods:%d\n", periods);
 
 	remain = hstream->bufsize % period_bytes;
 	if (remain)
-- 
2.34.1

