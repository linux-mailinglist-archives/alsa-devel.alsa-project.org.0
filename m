Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A8F340886
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 16:15:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 129DB16A4;
	Thu, 18 Mar 2021 16:14:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 129DB16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616080514;
	bh=JU26kSYAxWeB3dUE7oyxXRbBG8oGWy45s1h2h6cM8+Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ps//1PMomRvLT2hzoC9FtLN+FsovVxD2lQR91jkY+eTasvSK9qbcKsgLSupEhM/wP
	 c8463QAjf/G0l6IWtG21BF5Q5advCDnUlAtxwamaHzu6BbLT1Ln9CgtOK8BySI8jQI
	 LZLUB+RQMDDCm0KS+aO9bU9PVDasc1a6Q8S1iCbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ED4FF800E0;
	Thu, 18 Mar 2021 16:13:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F36F0F80163; Thu, 18 Mar 2021 16:13:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D72EF80163
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 16:13:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D72EF80163
IronPort-SDR: EdIVBrCYaLKRvFpDrxkhY+TKw/K3B9C532eHOzDBcHcZD4tWN8RL5EirEwkukxPJCu9fW5w+41
 rtTw68gXCvNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="209702407"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="209702407"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 08:13:21 -0700
IronPort-SDR: llGvNA/9szs4dA/FLzFYFmOXqkoYLJ2KIIC2LAHfyp5ZkNW5fzfp6XByJgdfiPR7WQP2PYIUVg
 3/E4D/Cie9gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="606207196"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by fmsmga005.fm.intel.com with ESMTP; 18 Mar 2021 08:13:19 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/3] ALSA: pcm: Add debug print on memory allocation failure
Date: Thu, 18 Mar 2021 16:11:20 +0100
Message-Id: <20210318151122.2493096-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318151122.2493096-1-amadeuszx.slawinski@linux.intel.com>
References: <20210318151122.2493096-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Add debug prints after calls of do_alloc_pages. One simplification would
be to move print into do_alloc_pages, however it would cause spam in
logs, as preallocate_pcm_pages loops over do_alloc_pages trying lower
values in case of failures.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/core/pcm_memory.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 289dd1fd8fe7..2878c4c23583 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -176,6 +176,10 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
 					   substream->dma_buffer.dev.dev,
 					   size, &new_dmab) < 0) {
 				buffer->error = -ENOMEM;
+				pr_debug("ALSA pcmC%dD%d%c,%d:%s: cannot preallocate for size %zu\n",
+					 substream->pcm->card->number, substream->pcm->device,
+					 substream->stream ? 'c' : 'p', substream->number,
+					 substream->pcm->name, size);
 				return;
 			}
 			substream->buffer_bytes_max = size;
@@ -400,6 +404,10 @@ int snd_pcm_lib_malloc_pages(struct snd_pcm_substream *substream, size_t size)
 				   substream->dma_buffer.dev.dev,
 				   size, dmab) < 0) {
 			kfree(dmab);
+			pr_debug("ALSA pcmC%dD%d%c,%d:%s: cannot preallocate for size %zu\n",
+				 substream->pcm->card->number, substream->pcm->device,
+				 substream->stream ? 'c' : 'p', substream->number,
+				 substream->pcm->name, size);
 			return -ENOMEM;
 		}
 	}
-- 
2.25.1

