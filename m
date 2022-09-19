Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 820AD5BCB8F
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:13:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 204BA1607;
	Mon, 19 Sep 2022 14:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 204BA1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663589620;
	bh=pAAuVbUHI+7GN6OCHHGCWJ2TREEEgGzf4R+/lBp3e3U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N3GoGIWwh9vtQ7zRee4lrFWgZAvIj/2b45xoEG95MlTqxyyqPfh6HmDpdzWSdmOz6
	 gEo/0egkdS6D5wa3MrvGp5PWKdNDBn+4PHmnKlR5AspAObSG27TlJ2YU2p/u0igCN7
	 7T/vXzIzcEkUfypD3PnlI8sgF5QoacgAaoytYYJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9305FF8055C;
	Mon, 19 Sep 2022 14:11:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B585EF8055C; Mon, 19 Sep 2022 14:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFE20F80553
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFE20F80553
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Qqr2m6U+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663589488; x=1695125488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pAAuVbUHI+7GN6OCHHGCWJ2TREEEgGzf4R+/lBp3e3U=;
 b=Qqr2m6U+IHrMmw4sl9BewUlz75b4S2UfPC8c+uG/FPuZYIuWm1TfLThX
 Vdv8lEqh3Byj0PGERBF/aTexBbEAYmrbFUlywPCFJccbV79VY68XBCUMx
 2O14vQOHdFUvY06QgTbapFPyfkXa0sW0LL+V1vaMEvQmfjMlk/YkeXxDm
 TgOuIPiRqJ68mQITIZY589qligGuH8/XcIm9CuuX62tfr3Ri7z9DKOOKD
 aNs5C5A02ZgGJczMat9v4sHRd3GiuskqPIeT7TSSMZ/ocHTR02Us0NCQR
 TsIPzzZfD5z2eTzakDLea4ianADkbPxr2GPPoA57ok8tggfCKI1eNraLS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="361121107"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="361121107"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:11:26 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="680826144"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:11:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/8] ALSA: hda: add snd_hdac_stop_streams() helper
Date: Mon, 19 Sep 2022 14:10:38 +0200
Message-Id: <20220919121041.43463-6-pierre-louis.bossart@linux.intel.com>
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

Minor code reuse, no functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/hdaudio.h        |  1 +
 sound/hda/hdac_stream.c        | 17 ++++++++++++++---
 sound/pci/hda/hda_controller.c |  4 +---
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 24c731e53ccb6..35459d740f008 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -562,6 +562,7 @@ int snd_hdac_stream_set_params(struct hdac_stream *azx_dev,
 				unsigned int format_val);
 void snd_hdac_stream_start(struct hdac_stream *azx_dev, bool fresh_start);
 void snd_hdac_stream_stop(struct hdac_stream *azx_dev);
+void snd_hdac_stop_streams(struct hdac_bus *bus);
 void snd_hdac_stop_streams_and_chip(struct hdac_bus *bus);
 void snd_hdac_stream_reset(struct hdac_stream *azx_dev);
 void snd_hdac_stream_sync_trigger(struct hdac_stream *azx_dev, bool set,
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 2e98f5fd50e54..c056bcc5543d1 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -174,17 +174,28 @@ void snd_hdac_stream_stop(struct hdac_stream *azx_dev)
 }
 EXPORT_SYMBOL_GPL(snd_hdac_stream_stop);
 
+/**
+ * snd_hdac_stop_streams - stop all streams
+ * @bus: HD-audio core bus
+ */
+void snd_hdac_stop_streams(struct hdac_bus *bus)
+{
+	struct hdac_stream *stream;
+
+	list_for_each_entry(stream, &bus->stream_list, list)
+		snd_hdac_stream_stop(stream);
+}
+EXPORT_SYMBOL_GPL(snd_hdac_stop_streams);
+
 /**
  * snd_hdac_stop_streams_and_chip - stop all streams and chip if running
  * @bus: HD-audio core bus
  */
 void snd_hdac_stop_streams_and_chip(struct hdac_bus *bus)
 {
-	struct hdac_stream *stream;
 
 	if (bus->chip_init) {
-		list_for_each_entry(stream, &bus->stream_list, list)
-			snd_hdac_stream_stop(stream);
+		snd_hdac_stop_streams(bus);
 		snd_hdac_bus_stop_chip(bus);
 	}
 }
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 75dcb14ff20ad..0ff286b7b66be 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -1033,10 +1033,8 @@ EXPORT_SYMBOL_GPL(azx_init_chip);
 void azx_stop_all_streams(struct azx *chip)
 {
 	struct hdac_bus *bus = azx_bus(chip);
-	struct hdac_stream *s;
 
-	list_for_each_entry(s, &bus->stream_list, list)
-		snd_hdac_stream_stop(s);
+	snd_hdac_stop_streams(bus);
 }
 EXPORT_SYMBOL_GPL(azx_stop_all_streams);
 
-- 
2.34.1

