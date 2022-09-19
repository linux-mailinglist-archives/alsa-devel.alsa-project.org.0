Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2A35BCB98
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:14:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BB7D163E;
	Mon, 19 Sep 2022 14:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BB7D163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663589648;
	bh=nphop1WCoXNgA20NgVWO2FTAKCS+Ovac2aXm1fbvjfE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lp+XaUqNrLY3PI0NyIoto3EENQnOX4a5kdTiZIigpdrUJZED/3kBfi9925gHNrW8a
	 9DuPrL3JC/aaXW4+Mi4pFrccBwBAo5W+V3K+S+jQuf7W/uj4gHFqDz02Qdb9TOEmZs
	 2T6DdemG9EDs4ErQvFLeTTMhZtAbKzY9F9IqM9i8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E069F80571;
	Mon, 19 Sep 2022 14:11:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDBB1F80570; Mon, 19 Sep 2022 14:11:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A05AF80563
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:11:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A05AF80563
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mRcEXfDS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663589496; x=1695125496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nphop1WCoXNgA20NgVWO2FTAKCS+Ovac2aXm1fbvjfE=;
 b=mRcEXfDS5lxXCPCiFRs2sUTXVZvvc2iNjE451eyTNhkgAAVOIV5XDt7A
 /XDJSKV7wDZJZhBpWe+VoGcGZmtZFqFJIz+9+uUdX0Wwa9QQn2gNhoM/e
 WLVtljHDQGZjt7e5evb9MQLdmHF1X/SemEOsRF9bxUGvjDKIJaQRz7mO0
 DXECgaWjoyzBugYeMqGwsNJ5dXSVozivsZsfHhuMBVVEuap/LK7qHUnLt
 DyLMTbgtqiRR+HQWUYrGbHXRqUCq90yNeqTI/kDDfR7KyR99P+OqiYGNv
 3WPoctwiexKeznXD/JXH8Da1R2HzyBHgtEDORA1bNehMiO4lelpRld/ls w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="361121129"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="361121129"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:11:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="680826217"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:11:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/8] ALSA: hda: ext: fix locking in stream_release
Date: Mon, 19 Sep 2022 14:10:40 +0200
Message-Id: <20220919121041.43463-8-pierre-louis.bossart@linux.intel.com>
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

The snd_hdac_ext_stream_release() routine uses the bus reg_lock, but
releases it before calling snd_hdac_stream_release() where the bus
reg_lock is taken again.

This creates a timing window where the link stream release could test
an invalid 'opened' boolean status and fail to recouple the host and
link parts.

Fix by exposing a locked version of snd_hdac_stream_release() and use
it without releasing the spinlock.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/hdaudio.h         |  1 +
 sound/hda/ext/hdac_ext_stream.c |  2 +-
 sound/hda/hdac_stream.c         | 19 ++++++++++++++++---
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 35459d740f008..ddff03e546e9f 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -551,6 +551,7 @@ void snd_hdac_stream_init(struct hdac_bus *bus, struct hdac_stream *azx_dev,
 			  int idx, int direction, int tag);
 struct hdac_stream *snd_hdac_stream_assign(struct hdac_bus *bus,
 					   struct snd_pcm_substream *substream);
+void snd_hdac_stream_release_locked(struct hdac_stream *azx_dev);
 void snd_hdac_stream_release(struct hdac_stream *azx_dev);
 struct hdac_stream *snd_hdac_get_stream(struct hdac_bus *bus,
 					int dir, int stream_tag);
diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/ext/hdac_ext_stream.c
index 254df9a67bd2b..9a2bc7e803dd6 100644
--- a/sound/hda/ext/hdac_ext_stream.c
+++ b/sound/hda/ext/hdac_ext_stream.c
@@ -384,8 +384,8 @@ void snd_hdac_ext_stream_release(struct hdac_ext_stream *hext_stream, int type)
 		spin_lock_irq(&bus->reg_lock);
 		if (hext_stream->decoupled && !hext_stream->link_locked)
 			snd_hdac_ext_stream_decouple_locked(bus, hext_stream, false);
+		snd_hdac_stream_release_locked(&hext_stream->hstream);
 		spin_unlock_irq(&bus->reg_lock);
-		snd_hdac_stream_release(&hext_stream->hstream);
 		break;
 
 	case HDAC_EXT_STREAM_TYPE_LINK:
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index c056bcc5543d1..1b8be39c38a96 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -365,6 +365,21 @@ struct hdac_stream *snd_hdac_stream_assign(struct hdac_bus *bus,
 }
 EXPORT_SYMBOL_GPL(snd_hdac_stream_assign);
 
+/**
+ * snd_hdac_stream_release_locked - release the assigned stream
+ * @azx_dev: HD-audio core stream to release
+ *
+ * Release the stream that has been assigned by snd_hdac_stream_assign().
+ * The bus->reg_lock needs to be taken at a higher level
+ */
+void snd_hdac_stream_release_locked(struct hdac_stream *azx_dev)
+{
+	azx_dev->opened = 0;
+	azx_dev->running = 0;
+	azx_dev->substream = NULL;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_stream_release_locked);
+
 /**
  * snd_hdac_stream_release - release the assigned stream
  * @azx_dev: HD-audio core stream to release
@@ -376,9 +391,7 @@ void snd_hdac_stream_release(struct hdac_stream *azx_dev)
 	struct hdac_bus *bus = azx_dev->bus;
 
 	spin_lock_irq(&bus->reg_lock);
-	azx_dev->opened = 0;
-	azx_dev->running = 0;
-	azx_dev->substream = NULL;
+	snd_hdac_stream_release_locked(azx_dev);
 	spin_unlock_irq(&bus->reg_lock);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_stream_release);
-- 
2.34.1

