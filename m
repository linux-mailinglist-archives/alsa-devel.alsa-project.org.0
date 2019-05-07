Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1273915DC3
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 08:54:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AFAF1802;
	Tue,  7 May 2019 08:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AFAF1802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557212069;
	bh=eEl3P2ScURNF+0z40BJlVuWEKabmstbyFLJTZERKRc4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IXVA3s1zcMeu3Fa+EifFAkP6bHzBzGx72ZPvR4qpXX9iz+GEc+Dyt+Lj6pNEnHceH
	 /Ve0rANNvWbQkd2/yFfKigAuaEUwiHdCBsvuFkoR5AuMXsFNknJNURgO1WHLpLbkg5
	 2tPiPzz7oNJHg9758eHXS9v6mHz/F6xeyt1dku8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA9E0F89674;
	Tue,  7 May 2019 08:52:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E30FF89674; Tue,  7 May 2019 08:52:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7329F80726
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 08:52:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7329F80726
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 23:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,441,1549958400"; d="scan'208";a="137730029"
Received: from younglee-svr.sh.intel.com ([10.239.159.31])
 by orsmga007.jf.intel.com with ESMTP; 06 May 2019 23:52:34 -0700
From: libin.yang@intel.com
To: alsa-devel@alsa-project.org
Date: Tue,  7 May 2019 14:33:11 +0800
Message-Id: <1557210791-20332-1-git-send-email-libin.yang@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Libin Yang <libin.yang@intel.com>, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, hui.wang@canonical.com,
 broonie@kernel.org
Subject: [alsa-devel] [PATCH] ASoC: codec: hdac_hdmi: no checking monitor in
	hw_params
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

Some userspace apps, like pulseaudio, may call open, hw_params,
prepare to judge whether the pcm is ready or not. Current hdac_hdmi
will return -ENODEV if monitor is not connected, which will cause
the apps believe the pcm is not ready. Actually PCM for hdmi is ready,
even the monitor is not connected.

This patch removes the check of monitor presence in hw_params, just like
what the legacy HD-Audio driver does.

Signed-off-by: Libin Yang <libin.yang@intel.com>
---
 sound/soc/codecs/hdac_hdmi.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 4de1fbf..660e058 100644
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
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
