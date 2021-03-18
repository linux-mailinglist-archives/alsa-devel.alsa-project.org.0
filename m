Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2B23409BF
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 17:10:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EA22169F;
	Thu, 18 Mar 2021 17:09:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EA22169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616083847;
	bh=aXyEFh8tW2QuQC4xor7E/UVAXzj2ceCRRMXjo/1qObY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dffRxnZr7JOIFml+sIYAzneoepiCBNpFhOKFV4V35Y9HwvTvfOA5vQ8wXbqPb0O9k
	 X4er88Asa9GAi7vBWhXtlCnglf6EQacjMGZ+ch3Of99mAwZqPDJaOI1gTfJE4G4Zli
	 eWA354yGFA7mT7FgegjC2daCAqBGhBm7nOznSpq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0485FF8027D;
	Thu, 18 Mar 2021 17:08:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F0C5F80423; Thu, 18 Mar 2021 17:08:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0671F8023B
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 17:08:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0671F8023B
IronPort-SDR: aDDnviJYefTaBP1inKReRM+7IM/lnsMDDsjj3zTqlUsj7/hFb91vzG9qC1lES7Rqq3GgZs2Ofm
 g7lO9pzQayUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="186360115"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="186360115"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 09:07:57 -0700
IronPort-SDR: 61Q5lJy7PXzSVMeSYIv3fBjxynir+AK3B/cov92RXbTt/x8CLztwaiNOG4mjoSyIBknz+kMnOh
 HERBr+ng0Jqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="413142070"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga008.jf.intel.com with ESMTP; 18 Mar 2021 09:07:56 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/3] ALSA: pcm: Add debug print on memory allocation failure
Date: Thu, 18 Mar 2021 17:06:16 +0100
Message-Id: <20210318160618.2504068-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318160618.2504068-1-amadeuszx.slawinski@linux.intel.com>
References: <20210318160618.2504068-1-amadeuszx.slawinski@linux.intel.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
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

