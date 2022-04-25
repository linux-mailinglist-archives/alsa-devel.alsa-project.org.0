Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E9F50EB7D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 00:14:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 502E21883;
	Tue, 26 Apr 2022 00:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 502E21883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650924848;
	bh=eeUHy03QHwaaRueSuGxqhwbBJPJbgC1lxYmXvAgzn8c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ldk9S2/+74aZD5VgwbF8YoNkUzus4bY49V/cHuQwIFgKuRcpTlYOUlINliVyostG2
	 9bZWndkjgQ34ZHuBApoikrNoMa9wjfQsr5QF1pYoVZwV5M1R6sexAq3YZ6vHKTf5r9
	 cX8bsa50kS5/6T9196LtV8aOVG+85QPJuYOVGo1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E34DAF80506;
	Tue, 26 Apr 2022 00:12:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87A54F804FD; Tue, 26 Apr 2022 00:11:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DACDF80152
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 00:11:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DACDF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="COTucqtm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650924707; x=1682460707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eeUHy03QHwaaRueSuGxqhwbBJPJbgC1lxYmXvAgzn8c=;
 b=COTucqtmSGt8gtsOEQxKBo4j76rGEMnJsZDDPIAPWbjNdiKUZK+v5VFK
 3pdjaKWF+MIKzOQ3Pn5GPjtHwlZRqGBrBcnw3I8EXiAquf1leSlkJloY/
 C6GT/qTq+Jg3dxUmhUCZWJ4RgJYwju5AjKjHPWdr32h5fa0GuP6Icqkp3
 sfUHEkawb9qEGIHnZnqpCWQcL7RKPOiSdI+UxI+c7AB8KWxGeaHDRdUal
 xxkklU2L8rOHXoA0iJI0uoLPvydzfxVIHpQWwHlHd7l6OU2CiOVl/te7d
 ykb7eQGjXysxw78VS67zQ18BBy9shvjGYNYMSXa6CYHQJcXaS4i5mCKtD Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="264897776"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="264897776"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="729939943"
Received: from shivakax-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.59.189])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:38 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/10] ASoC: SOF: Intel: bdw/byt/pci-tng: Do not set the
 load_module ops
Date: Mon, 25 Apr 2022 15:11:26 -0700
Message-Id: <20220425221129.124615-8-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425221129.124615-1-ranjani.sridharan@linux.intel.com>
References: <20220425221129.124615-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.com,
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The used firmware loader (snd_sof_load_firmware_memcpy) can use the generic
module loading, which is by default uses the same implementation as the
snd_sof_parse_module_memcpy.

No need to set the callback for these platforms.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/bdw.c     | 3 ---
 sound/soc/sof/intel/byt.c     | 6 ------
 sound/soc/sof/intel/pci-tng.c | 3 ---
 3 files changed, 12 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index c0a1d4ae8c68..26df780c702e 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -613,9 +613,6 @@ static struct snd_sof_dsp_ops sof_bdw_ops = {
 	.pcm_open	= sof_stream_pcm_open,
 	.pcm_close	= sof_stream_pcm_close,
 
-	/* Module loading */
-	.load_module    = snd_sof_parse_module_memcpy,
-
 	/*Firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 0fd5edb1bdbc..4ed8381eceda 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -267,9 +267,6 @@ static struct snd_sof_dsp_ops sof_byt_ops = {
 	.pcm_open	= sof_stream_pcm_open,
 	.pcm_close	= sof_stream_pcm_close,
 
-	/* module loading */
-	.load_module	= snd_sof_parse_module_memcpy,
-
 	/*Firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
@@ -349,9 +346,6 @@ static struct snd_sof_dsp_ops sof_cht_ops = {
 	.pcm_open	= sof_stream_pcm_open,
 	.pcm_close	= sof_stream_pcm_close,
 
-	/* module loading */
-	.load_module	= snd_sof_parse_module_memcpy,
-
 	/*Firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index f1aae9667834..f0f6d9ba8803 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -186,9 +186,6 @@ struct snd_sof_dsp_ops sof_tng_ops = {
 	.pcm_open	= sof_stream_pcm_open,
 	.pcm_close	= sof_stream_pcm_close,
 
-	/* module loading */
-	.load_module	= snd_sof_parse_module_memcpy,
-
 	/*Firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
-- 
2.25.1

