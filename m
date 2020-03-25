Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 054A11932F3
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 22:42:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 901DD167E;
	Wed, 25 Mar 2020 22:42:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 901DD167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585172576;
	bh=dG8nlJmjN7t26VXvSzvGTw2motg9M/45XH+BAO0xdX8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rrz7DnHaJY8hUq1h4GStuquPSQ6qVI+JiH8y+H3wLNmVVme57CUUoJvazusKwrGYO
	 AOFhBDFokoY1v3XwvnbF2Af0n4m3WhleJSa3Qv1xZsf7poLm36+LWSsjSy5Js/AtNE
	 pHbVNPVTcE3qwxuyJ6RtWMm40vOIJHBvDm+sIHEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 055DFF80158;
	Wed, 25 Mar 2020 22:42:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3029FF8028E; Wed, 25 Mar 2020 22:39:40 +0100 (CET)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB67FF80158
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:29:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB67FF80158
IronPort-SDR: lmuYRefM3WOzk3Z2fN0EfgeQOM+W1hBvZSP9F8sssY+fJGeqSS9ZXoQHlWNPL+lXLBA80t9rj1
 uamqJ/mMK1wQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 14:29:17 -0700
IronPort-SDR: jIezQuQEHXSgkpbkecr7EY9jAqLHmDgwFcH3A2UWkvp6r14fle9lXNMjGzNkOoV2OP3BhMvz6N
 Q+NJfbw0/Izw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="393759860"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by orsmga004.jf.intel.com with ESMTP; 25 Mar 2020 14:29:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: rt1308-sdw: use slot and rx_mask to configure stream
Date: Wed, 25 Mar 2020 16:29:05 -0500
Message-Id: <20200325212905.28145-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325212905.28145-1-pierre-louis.bossart@linux.intel.com>
References: <20200325212905.28145-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

If the DAI was configured with a set_tdm_slots() call, use the information.

A platform or machine driver may configure each amplifier to extract
different bitSlots from the frame, or extract the same data and use
processing to generate the relevant output. The latter case is easier
to handle in case of orientation changes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt1308-sdw.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 8763192434c4..a5a7e46de246 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -539,7 +539,7 @@ static int rt1308_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct sdw_port_config port_config;
 	enum sdw_data_direction direction;
 	struct sdw_stream_data *stream;
-	int retval, port, num_channels;
+	int retval, port, num_channels, ch_mask;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
 	stream = snd_soc_dai_get_dma_data(dai, substream);
@@ -559,13 +559,20 @@ static int rt1308_sdw_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	if (rt1308->slots) {
+		num_channels = rt1308->slots;
+		ch_mask = rt1308->rx_mask;
+	} else {
+		num_channels = params_channels(params);
+		ch_mask = (1 << num_channels) - 1;
+	}
+
 	stream_config.frame_rate = params_rate(params);
-	stream_config.ch_count = params_channels(params);
+	stream_config.ch_count = num_channels;
 	stream_config.bps = snd_pcm_format_width(params_format(params));
 	stream_config.direction = direction;
 
-	num_channels = params_channels(params);
-	port_config.ch_mask = (1 << (num_channels)) - 1;
+	port_config.ch_mask = ch_mask;
 	port_config.num = port;
 
 	retval = sdw_stream_add_slave(rt1308->sdw_slave, &stream_config,
-- 
2.20.1

