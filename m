Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1365E76A
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 17:07:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F039B16A1;
	Wed,  3 Jul 2019 17:06:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F039B16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562166465;
	bh=mtZv9B1fMV12B4Ur4khSFQrHJnqqv4m1mUAdtJqkYgk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nd5z/5TRv8W+0swoAwAHsuLP2wbnBEXIu+iWrOwYtLNTdn84TZfv0fgUSwShDNsr9
	 jO1uy1SnCi3RthOdPZZHgHe5Aa1OXBvi/9ungPpjck6QIJUHeMKj46+MhSPWEC9Yi3
	 ZHqpHPy//TjSM5oPCkMKruFFXubQmxD6bd4PGyuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F299F8010F;
	Wed,  3 Jul 2019 17:05:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EFFFF800F3; Wed,  3 Jul 2019 17:05:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7458CF800C5
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 17:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7458CF800C5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jul 2019 08:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,446,1557212400"; d="scan'208";a="172161469"
Received: from keyon-x299.sh.intel.com ([10.239.159.75])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Jul 2019 08:05:13 -0700
From: Keyon Jie <yang.jie@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  3 Jul 2019 23:10:23 +0800
Message-Id: <20190703151023.30313-2-yang.jie@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703151023.30313-1-yang.jie@linux.intel.com>
References: <20190703151023.30313-1-yang.jie@linux.intel.com>
MIME-Version: 1.0
Cc: Keyon Jie <yang.jie@linux.intel.com>, ranjani.sridharan@linux.intel.com,
 Marcin Rajwa <marcin.rajwa@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v2 2/2] ASoC: SOF: Intel: fix reset of
	host_period_bytes
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

From: Marcin Rajwa <marcin.rajwa@linux.intel.com>

This patch prevents the reset of host period bytes.
The parameter has been used to keep information about
completion of period copy. Right now we keep this
information in period_irq.

Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
---
 sound/soc/sof/intel/hda-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 9b730f183529..c7022346aba0 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -116,9 +116,9 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 	/* disable SPIB, to enable buffer wrap for stream */
 	hda_dsp_stream_spib_config(sdev, stream, HDA_DSP_SPIB_DISABLE, 0);
 
-	/* set host_period_bytes to 0 if no IPC position */
+	/* update no_period_irq flag for ipc params */
 	if (hda && hda->no_ipc_position)
-		ipc_params->host_period_bytes = 0;
+		ipc_params->no_period_irq = 1;
 
 	ipc_params->stream_tag = hstream->stream_tag;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
