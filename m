Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD676471AB
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 15:25:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F2C2180D;
	Thu,  8 Dec 2022 15:24:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F2C2180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670509543;
	bh=GPaHpj+et3FlCtAQUdQT2RrjvHaHoRC9l8A8y+TKXPg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qpqmk23wqB05m10Afip95d5QmR11JKJMbviArqJlATrWoqvRGzHCd6p0g3aC4ggC0
	 vQKS/UG9unzqX4hx3FM4mCBu1rNl27ifOjPVGHiJRgrNDlMaQfRpOE4WPrNYN3AEpg
	 Ijl0w/9YH/uNp5X54sv2ygDoThRkmeG4y7iXoOh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F804F8024C;
	Thu,  8 Dec 2022 15:24:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04047F800F8; Thu,  8 Dec 2022 15:24:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E84DF800F8
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 15:24:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E84DF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DcHi2rWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670509479; x=1702045479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GPaHpj+et3FlCtAQUdQT2RrjvHaHoRC9l8A8y+TKXPg=;
 b=DcHi2rWjFqXG+sWN2rSjKtTZvmEi8bBrhdBuPSW9jVBTXF/0oaw+Zbtd
 Ca/Rmyl1PIweHsqWrFY3Z3YUhWo1BhQI7F15UCzZJ1fOko2EoW2piMlZb
 JMuHdsypQekRswaS9MBHpgn55uy9TATa3RBLScIFZft2hlCueBN1gp9RT
 rjpphQReIbwnEtqjGpELE/fQ6Es8M5wRT1kVJ5A3dTXJTBueZhvg5Nlew
 tTgrOue8ZdKMQmEEof6IjrLXtbsOlxu52Dybs/dJRWK8Bnal32vD21mmo
 NAf8UglfcguT7/eGZhzdYTZv6cc9GkawZQriZ4DIgU94PdRa2pjthQQ4Q A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="381476732"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="381476732"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 06:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="679541316"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="679541316"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga001.jf.intel.com with ESMTP; 08 Dec 2022 06:09:16 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Subject: [PATCH] ALSA: hda: Error out if invalid stream is being setup
Date: Thu,  8 Dec 2022 15:26:35 +0100
Message-Id: <20221208142635.1514944-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, error27@gmail.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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

Scenario when snd_hdac_stream_setup_periods() receives an instance of
struct hdac_stream with neither ->substream nor ->cstream initialized is
invalid.

Simultaneously addresses "uninitialized symbol 'dmab'" error reported by
Smatch.

Fixes: 3e9582267e3a ("ALSA: hda: Interrupt servicing and BDL setup for compress streams")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/hdac_stream.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 8f625402505f..547adbc22590 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -500,6 +500,9 @@ int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
 		dmab = snd_pcm_get_dma_buf(substream);
 	} else if (cstream) {
 		dmab = snd_pcm_get_dma_buf(cstream);
+	} else {
+		WARN(1, "No substream or cstream assigned\n");
+		return -EINVAL;
 	}
 
 	/* reset BDL address */
-- 
2.25.1

