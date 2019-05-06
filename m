Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B53314512
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 09:20:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 974F7183B;
	Mon,  6 May 2019 09:19:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 974F7183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557127238;
	bh=bBjCI8VGWKiWXNbVQ5Zy90i7QMRx/rq2IZJmsUFWEA0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gDQ3df1lP6ozIvphRAVHgOobKsbea3DbyvgGf9d2vUYT5O6HLL1efUct+NwEn886m
	 bdgay4+05dXlohBb4aQt/CCpvC91M4hij0ayqL9CWEkKDmUwSrBfCy1yrl97i81Swj
	 aEtJekszl4XVo7K/S+3xjGXfPTCXFhjDKriOSov8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88CE5F8963C;
	Mon,  6 May 2019 09:18:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4284BF89673; Mon,  6 May 2019 09:18:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8467F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 09:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8467F80C07
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 00:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,437,1549958400"; d="scan'208";a="148947501"
Received: from younglee-svr.sh.intel.com ([10.239.159.31])
 by fmsmga007.fm.intel.com with ESMTP; 06 May 2019 00:18:43 -0700
From: libin.yang@intel.com
To: alsa-devel@alsa-project.org
Date: Mon,  6 May 2019 14:59:20 +0800
Message-Id: <1557125960-29353-1-git-send-email-libin.yang@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Libin Yang <libin.yang@intel.com>, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 subhransu.s.prusty@intel.com, samreen.nilofer@intel.com
Subject: [alsa-devel] [RFC PATCH] ASoC: codec: hdac_hdmi: no checking
	monitor in hw_params
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

From: Libin Yang <libin.yang@intel.com>

This patch move the check of monitor from hw_params to trigger callback.

The original code will check the monitor presence in hw_params. If the
monitor doesn't exist, hw_params will return -ENODEV. Mostly this is OK.

However, pulseaudio will check the pcm devices when kernel is booting up.
It will try to open, set hw_params, prepare such pcm devices. We can't
guarantee that the monitor will be connected when kernel is booting up.
Especially, hdac_hdmi will export 3 pcms at most. It's hard to say users
will connect 3 monitors to the HDMI/DP ports. This will cause pulseaudio
fail in parsing the pcm devices because the driver will return -ENODEV in
hw_params.

This patch tries to move the check of monitor presence into trigger
callback. This can "trick" the pulseaudio the pcm is ready.

This bug is found when we try to enable HDMI detection in
gnome-sound-setting for ASoC hdac_hdmi. After we enable the hdmi in UCM,
pulseaudio will try to parse the hdmi pcm devices. It will cause failure if
there are no monitors connected.

Signed-off-by: Libin Yang <libin.yang@intel.com>
---
 sound/soc/codecs/hdac_hdmi.c | 44 +++++++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 4de1fbf..f482e09 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -455,24 +455,11 @@ static int hdac_hdmi_set_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *hparams, struct snd_soc_dai *dai)
 {
 	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
-	struct hdac_device *hdev = hdmi->hdev;
 	struct hdac_hdmi_dai_port_map *dai_map;
-	struct hdac_hdmi_port *port;
 	struct hdac_hdmi_pcm *pcm;
 	int format;
 
 	dai_map = &hdmi->dai_map[dai->id];
-	port = dai_map->port;
-
-	if (!port)
-		return -ENODEV;
-
-	if ((!port->eld.monitor_present) || (!port->eld.eld_valid)) {
-		dev_err(&hdev->dev,
-			"device is not configured for this pin:port%d:%d\n",
-					port->pin->nid, port->id);
-		return -ENODEV;
-	}
 
 	format = snd_hdac_calc_stream_format(params_rate(hparams),
 			params_channels(hparams), params_format(hparams),
@@ -630,6 +617,36 @@ static void hdac_hdmi_pcm_close(struct snd_pcm_substream *substream,
 		dai_map->port = NULL;
 }
 
+static int hdac_hdmi_pcm_trigger(struct snd_pcm_substream *substream, int cmd,
+				 struct snd_soc_dai *dai)
+{
+	struct hdac_hdmi_port *port;
+	struct hdac_hdmi_dai_port_map *dai_map;
+	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
+	struct hdac_device *hdev = hdmi->hdev;
+
+	/*
+	 * When start, if there is no monitor,
+	 * It should not start audio.
+	 */
+	if (cmd == SNDRV_PCM_TRIGGER_START) {
+		dai_map = &hdmi->dai_map[dai->id];
+		port = dai_map->port;
+
+		if (!port)
+			return -ENODEV;
+
+		if ((!port->eld.monitor_present) || (!port->eld.eld_valid)) {
+			dev_err(&hdev->dev,
+				"device is not configured for this pin:port%d:%d\n",
+				port->pin->nid, port->id);
+			return -ENODEV;
+		}
+	}
+
+	return 0;
+}
+
 static int
 hdac_hdmi_query_cvt_params(struct hdac_device *hdev, struct hdac_hdmi_cvt *cvt)
 {
@@ -1389,6 +1406,7 @@ static const struct snd_soc_dai_ops hdmi_dai_ops = {
 	.startup = hdac_hdmi_pcm_open,
 	.shutdown = hdac_hdmi_pcm_close,
 	.hw_params = hdac_hdmi_set_hw_params,
+	.trigger = hdac_hdmi_pcm_trigger,
 	.set_tdm_slot = hdac_hdmi_set_tdm_slot,
 };
 
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
