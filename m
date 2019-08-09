Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7D087474
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 10:43:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A6B51671;
	Fri,  9 Aug 2019 10:42:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A6B51671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565340183;
	bh=WLcF7NYblFPeKbzze7p/s2io2Wp718NHnxF6tP0k1nQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NXdqNhais9oyFoAfp8EVPbjQsSZ+a6w1r6iKEHFLaVhV413hm17lUkDOVvt1bMnQf
	 jp4omoamuUNr2dPcKf6Po/9fqXRwO1s5M1FzODm36B5HHycEDpKZS0lGZHHkEHE/nx
	 BFW1R6sQBJEbppaInE9won+Q/UyacaA/++dRbeYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72662F80391;
	Fri,  9 Aug 2019 10:41:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E339EF803F3; Fri,  9 Aug 2019 10:41:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D10ADF8036B
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 10:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D10ADF8036B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 01:41:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="193349073"
Received: from smielczx-ws.igk.intel.com ([10.237.93.152])
 by fmsmga001.fm.intel.com with ESMTP; 09 Aug 2019 01:41:09 -0700
From: Szymon Mielczarek <szymonx.mielczarek@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  9 Aug 2019 10:40:34 +0200
Message-Id: <20190809084034.26220-1-szymonx.mielczarek@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Szymon Mielczarek <szymonx.mielczarek@linux.intel.com>
Subject: [alsa-devel] [RFC PATCH] ASoC: dapm: Invalidate only paths
	reachable for a given stream
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

By resetting the cached number of endpoints for all card's widgets we may
overwrite previously cached values for other streams. The situation may
happen especially when running streams simultaneously.

Signed-off-by: Szymon Mielczarek <szymonx.mielczarek@linux.intel.com>
---
 sound/soc/soc-dapm.c | 50 ++++++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d09bdca63c62..10819b3e0b98 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1128,6 +1128,34 @@ static int dapm_widget_list_create(struct snd_soc_dapm_widget_list **list,
 	return 0;
 }
 
+/*
+ * Recursively reset the cached number of inputs or outputs for the specified
+ * widget and all widgets that can be reached via incoming or outcoming paths
+ * from the widget.
+ */
+static void invalidate_paths_ep(struct snd_soc_dapm_widget *widget,
+	enum snd_soc_dapm_direction dir)
+{
+	enum snd_soc_dapm_direction rdir = SND_SOC_DAPM_DIR_REVERSE(dir);
+	struct snd_soc_dapm_path *path;
+
+	widget->endpoints[dir] = -1;
+
+	snd_soc_dapm_widget_for_each_path(widget, rdir, path) {
+		if (path->weak || path->is_supply)
+			continue;
+
+		if (path->walking)
+			return;
+
+		if (path->connect) {
+			path->walking = 1;
+			invalidate_paths_ep(path->node[dir], dir);
+			path->walking = 0;
+		}
+	}
+}
+
 /*
  * Common implementation for is_connected_output_ep() and
  * is_connected_input_ep(). The function is inlined since the combined size of
@@ -1257,21 +1285,17 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 
 	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
 
-	/*
-	 * For is_connected_{output,input}_ep fully discover the graph we need
-	 * to reset the cached number of inputs and outputs.
-	 */
-	list_for_each_entry(w, &card->widgets, list) {
-		w->endpoints[SND_SOC_DAPM_DIR_IN] = -1;
-		w->endpoints[SND_SOC_DAPM_DIR_OUT] = -1;
-	}
-
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-		paths = is_connected_output_ep(dai->playback_widget, &widgets,
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		w = dai->playback_widget;
+		invalidate_paths_ep(w, SND_SOC_DAPM_DIR_OUT);
+		paths = is_connected_output_ep(w, &widgets,
 				custom_stop_condition);
-	else
-		paths = is_connected_input_ep(dai->capture_widget, &widgets,
+	} else {
+		w = dai->capture_widget;
+		invalidate_paths_ep(w, SND_SOC_DAPM_DIR_IN);
+		paths = is_connected_input_ep(w, &widgets,
 				custom_stop_condition);
+	}
 
 	/* Drop starting point */
 	list_del(widgets.next);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
