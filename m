Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D60D0182F91
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 12:48:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79B8E16D8;
	Thu, 12 Mar 2020 12:47:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79B8E16D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584013694;
	bh=zamNgFLHdNKz5knZsp6dPQgYjhZo6HVkR9TtUdlF2DE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pVFVFQC3xGpCy1fc7uyBQz4NZlIVxJs6D9+JKevbWyjJjd8gvRGQOz0VpG6z32/SF
	 mfHWWGUmvUyZVKM4BmihcroZOTjezaw+mzXKiE5uHhqk2J3RDCRNx30PMXX20q3VUf
	 rVLvtw60TXIwCaHRUPGVzYSvhTk4ewRlKecAM2bU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 347A7F8013E;
	Thu, 12 Mar 2020 12:47:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A4AAF8023F; Thu, 12 Mar 2020 12:47:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E61BF8013E
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 12:47:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E61BF8013E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 04:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,544,1574150400"; d="scan'208";a="443898812"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 04:46:59 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: SOF: Intel: Fix stream cleanup on pcm close
Date: Thu, 12 Mar 2020 12:46:54 +0100
Message-Id: <20200312114654.14260-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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

Field "substream" gets assigned during stream setup in
hda_dsp_pcm_hw_params() but it is never cleared afterwards during
cleanup procedure. Now, any non-pcm operation e.g.: compress can
mistakenly make use of that pointer as it's bypassing all
"if (s->substream)" checks.

Nulling the pointer during close operation ensures no wild pointers are
left behind.

Fixes: cdae3b9a47aa ("ASoC: SOF: Intel: Add Intel specific HDA PCM operations")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v2:
- relocated stream->substream assignment from _pcm_close() to _hw_free()


 sound/soc/sof/intel/hda-stream.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 7daa913dbde0..5d386956906f 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -547,6 +547,8 @@ int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
 					SOF_HDA_REG_PP_PPCTL, mask, 0);
 	spin_unlock_irq(&bus->reg_lock);
 
+	stream->substream = NULL;
+
 	return 0;
 }
 
-- 
2.17.1

