Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A91305BCB89
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:12:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56839163C;
	Mon, 19 Sep 2022 14:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56839163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663589553;
	bh=hPT8BL93uZoJEXYCqO95k3Xet+rpQ3Tbssed4NA4sBM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DF/kXAEWXbkPWVA4uoWsZhmFZuMamnt4D+FgloSqLsvcxFuS/qNqYlljL8ypVQemV
	 yZLppUzuVPQzhXQ04bfr8CJJc5GTG2boaEpzaTYubzG6L7V/IUsdyXg55lTKEAx62X
	 8lal3gQ6u48qZx36km4kvSWeR5BHjstMYNRiZVmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E1BDF804FF;
	Mon, 19 Sep 2022 14:11:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9076EF804B4; Mon, 19 Sep 2022 14:11:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2EFDF8032B
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2EFDF8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="juPV+GAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663589472; x=1695125472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hPT8BL93uZoJEXYCqO95k3Xet+rpQ3Tbssed4NA4sBM=;
 b=juPV+GADtTCZnISvXr2DcT2lzgSfUuV4+LJ8VD5CA32gnfT4WCJ2Tj0V
 PqXhbLkQvmyJhPcfmvIv15RT8a44JvDPLq8FDJYPihrAidS4/4Zx/cmZj
 yYro8zNINvvfTONnGgIxme02GRnfEbuEe7OTzeHNCIKpf9QFxiCMy83nM
 nu2L0pPo/k92/V99UbIqq1H7tyQkIJeaqQSHjmZ7PIgWA3O61drm+S0mO
 qqX0yViXNZTtO7MD/jhLL9S266dzmYkma076AdZmV5OnB/NoQtRfgzInj
 FfxSRTaZtggFJV2DGTiQctw9gROg81qPWkaOKl4Jt0re/zxSdbFZGSmJo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="361121047"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="361121047"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:11:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="680826071"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:11:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/8] ALSA: hda: make snd_hdac_stream_clear() static
Date: Mon, 19 Sep 2022 14:10:34 +0200
Message-Id: <20220919121041.43463-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919121041.43463-1-pierre-louis.bossart@linux.intel.com>
References: <20220919121041.43463-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
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

This helper has no users outside of hdac_stream.c. External users
should only use snd_hdac_stream_start() and snd_hdac_stream_stop().

No functional change beyond making the function static and removing
the symbol export.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/hdaudio.h | 1 -
 sound/hda/hdac_stream.c | 5 ++---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 6e74aeafeda41..24c731e53ccb6 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -561,7 +561,6 @@ int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev);
 int snd_hdac_stream_set_params(struct hdac_stream *azx_dev,
 				unsigned int format_val);
 void snd_hdac_stream_start(struct hdac_stream *azx_dev, bool fresh_start);
-void snd_hdac_stream_clear(struct hdac_stream *azx_dev);
 void snd_hdac_stream_stop(struct hdac_stream *azx_dev);
 void snd_hdac_stop_streams_and_chip(struct hdac_bus *bus);
 void snd_hdac_stream_reset(struct hdac_stream *azx_dev);
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index bdf6d4db67694..2dbde3d1cf683 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -112,10 +112,10 @@ void snd_hdac_stream_start(struct hdac_stream *azx_dev, bool fresh_start)
 EXPORT_SYMBOL_GPL(snd_hdac_stream_start);
 
 /**
- * snd_hdac_stream_clear - stop a stream DMA
+ * snd_hdac_stream_clear - helper to clear stream registers and stop DMA transfers
  * @azx_dev: HD-audio core stream to stop
  */
-void snd_hdac_stream_clear(struct hdac_stream *azx_dev)
+static void snd_hdac_stream_clear(struct hdac_stream *azx_dev)
 {
 	snd_hdac_stream_updateb(azx_dev, SD_CTL,
 				SD_CTL_DMA_START | SD_INT_MASK, 0);
@@ -124,7 +124,6 @@ void snd_hdac_stream_clear(struct hdac_stream *azx_dev)
 		snd_hdac_stream_updateb(azx_dev, SD_CTL_3B, SD_CTL_STRIPE_MASK, 0);
 	azx_dev->running = false;
 }
-EXPORT_SYMBOL_GPL(snd_hdac_stream_clear);
 
 /**
  * snd_hdac_stream_stop - stop a stream
-- 
2.34.1

