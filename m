Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7D360E236
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 15:35:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C0743D8D;
	Wed, 26 Oct 2022 15:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C0743D8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666791347;
	bh=dQKkzmZ3yfEQdV4udzrrUVDha8AaXSEuw3JA3rqff7s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EkGftAK7+VHvl4sy6Y29stuezMjFMusGnfgTtLQ6asMOxlscJ61CZnFF9t+jrylfm
	 2oYc67P8GCqwXeVZq7IVsdQupNG/y2DAaZvg+8tcQ/ZQZv0bJ2GT98JXh65oiS/hNi
	 G5HrdjaTOMcLPUckGK9J015AR93M6oJ3Sjn9FDMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2163F8056F;
	Wed, 26 Oct 2022 15:33:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 449F4F8055A; Wed, 26 Oct 2022 15:33:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FAC4F80271
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 15:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FAC4F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kEaO1erv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666791216; x=1698327216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dQKkzmZ3yfEQdV4udzrrUVDha8AaXSEuw3JA3rqff7s=;
 b=kEaO1ervJKOqPmxWq405CnUYS3pfBrnsD4QhQTLRzkue7Mo+cJSuXBtD
 xN172ZFjNJ86+QI/O5eD4WejSabmTq85xMRAZ+Osqh2iRO/17K8/hEBYo
 GKv2f/OkGgF7NqTFkhJehb/ZKRGe/jRVG3MkH3jze3rd1kPwkZvCzIpvA
 4TuA46j6Mzlrzwqw/l+TL8pbzjhcdTMPeYsyXpQPYnZj5pkg95tU2xnur
 8O4xj9I2Mw2J20MHDiJBn4fDBKMla7w79K64ji2403IdXYASTxk75d4UK
 /wQ/N3uX79pYBiyuT2Ydsfq4DZknEOUmwzUecfQ29fU0SXF+PH/RJ1Xc0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="372155603"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="372155603"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 06:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="609952667"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="609952667"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 26 Oct 2022 06:33:30 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 3/9] ALSA: hda: Introduce snd_hdac_stream_wait_drsm()
Date: Wed, 26 Oct 2022 15:50:08 +0200
Message-Id: <20221026135014.1403705-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221026135014.1403705-1-cezary.rojewski@intel.com>
References: <20221026135014.1403705-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
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

Allow for waiting for DRSM bit for specified stream to be cleared from
HDAudio library level. Drivers may utilize this optional step during the
stream resume procedure.

Suggested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio.h |  1 +
 sound/hda/hdac_stream.c | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 78f1809a4ad6..a6872537724d 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -597,6 +597,7 @@ int snd_hdac_stream_get_spbmaxfifo(struct hdac_bus *bus,
 				   struct hdac_stream *azx_dev);
 void snd_hdac_stream_drsm_enable(struct hdac_bus *bus,
 				 bool enable, int index);
+int snd_hdac_stream_wait_drsm(struct hdac_stream *azx_dev);
 int snd_hdac_stream_set_dpibr(struct hdac_bus *bus,
 			      struct hdac_stream *azx_dev, u32 value);
 int snd_hdac_stream_set_lpib(struct hdac_stream *azx_dev, u32 value);
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 35fe2bd582ac..59e8bfe4feca 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -821,6 +821,27 @@ void snd_hdac_stream_drsm_enable(struct hdac_bus *bus,
 }
 EXPORT_SYMBOL_GPL(snd_hdac_stream_drsm_enable);
 
+/*
+ * snd_hdac_stream_wait_drsm - wait for HW to clear RSM for a stream
+ * @azx_dev: HD-audio core stream to await RSM for
+ *
+ * Returns 0 on success and -ETIMEDOUT upon a timeout.
+ */
+int snd_hdac_stream_wait_drsm(struct hdac_stream *azx_dev)
+{
+	struct hdac_bus *bus = azx_dev->bus;
+	u32 mask, reg;
+	int ret;
+
+	mask = 1 << azx_dev->index;
+
+	ret = readb_poll_timeout(bus->drsmcap + AZX_REG_DRSM_CTL, reg, !(reg & mask), 250, 2000);
+	if (ret)
+		dev_dbg(bus->dev, "polling RSM 0x%08x failed: %d\n", mask, ret);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_stream_wait_drsm);
+
 /**
  * snd_hdac_stream_set_dpibr - sets the dpibr value of a stream
  * @bus: HD-audio core bus
-- 
2.25.1

