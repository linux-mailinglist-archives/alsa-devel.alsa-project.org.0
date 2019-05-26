Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E472ADD8
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 07:01:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 504E31769;
	Mon, 27 May 2019 07:01:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 504E31769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558933313;
	bh=SKBaLJuwrOC5vIWEeJ1+3Y+oB5HeIhVQpELprGIVyVg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YvBvL8WGnCdFznoAlm8NAusLpUgsB6BdrgcjymDb00JHb0MnvQP1l3WUYXHz86/W9
	 VAKexTZJPKhETHDYo28TA1xs0F2mKHmEjIvq+cKRe7q+zuS4Mm3Qj7us8XTPvTmi2i
	 JzL9W0V57JUhciewjEbAAumidJWflnygwMhKKCWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EF6CF89735;
	Mon, 27 May 2019 06:57:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79575F8970C; Mon, 27 May 2019 06:57:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 624A9F896F7
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 06:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 624A9F896F7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 May 2019 21:57:32 -0700
X-ExtLoop1: 1
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004.jf.intel.com with ESMTP; 26 May 2019 21:57:31 -0700
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Mon, 27 May 2019 00:58:36 +0800
Message-Id: <20190526165836.10867-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190526165836.10867-1-yung-chuan.liao@linux.intel.com>
References: <20190526165836.10867-1-yung-chuan.liao@linux.intel.com>
Cc: liam.r.girdwood@linux.intel.com, libin.yang@intel.com,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
Subject: [alsa-devel] [PATCH 5/5] ASoC: SOF: Force polling mode on CFL and
	CNL
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

There is a workaround in legacy HDA codec for too long time respone
with CFL machine. We need the same workaround on SOF driver. The same
issue is also seen on CNL machine.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 5c78f4dde6f5..b9f3c802924b 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -32,6 +32,9 @@
 /* platform specific devices */
 #include "shim.h"
 
+#define IS_CFL(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0xa348)
+#define IS_CNL(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x9dc8)
+
 /*
  * Debug
  */
@@ -217,6 +220,11 @@ static int hda_init(struct snd_sof_dev *sdev)
 	ext_ops = snd_soc_hdac_hda_get_ops();
 #endif
 	sof_hda_bus_init(bus, &pci->dev, ext_ops);
+
+	/* Workaround for a communication error on CFL (bko#199007) and CNL */
+	if (IS_CFL(pci) || IS_CNL(pci))
+		bus->polling_mode = 1;
+
 	bus->use_posbuf = 1;
 	bus->bdl_pos_adj = 0;
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
