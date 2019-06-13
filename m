Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5802A43534
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 12:18:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C44AE1819;
	Thu, 13 Jun 2019 12:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C44AE1819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560421132;
	bh=iRf2eVP5Kv2CA/92OtTVq4TplOdQ9qj9vgZcw7BHXX8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fA94igKr/3F89cIym2D8iDHx+UCuwnWZH+ojo1m36YxlsWA+scCLtecZmRq6HU97v
	 r+1zbAYIQ7oBGxdZkFTSV+seCmyF65di9nD18jg1wapq5NMYw5kSn1WLdFw2z/tH+k
	 gU3umJxCCHouBYKG2LQudRMEe21Bz80sDkrLft4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 232E4F896F1;
	Thu, 13 Jun 2019 12:17:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 036DDF89703; Thu, 13 Jun 2019 12:17:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE4D1F8076F
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 12:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE4D1F8076F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 03:17:00 -0700
X-ExtLoop1: 1
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jun 2019 03:16:58 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Date: Thu, 13 Jun 2019 13:17:55 +0300
Message-Id: <20190613101755.29740-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: libin.yang@intel.com, tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH v2] ASoC: codec: hdac_hdmi: fix pin connections
	at cvt enable
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

In display codecs supported by hdac_hdmi, the connection indices are
shared by all converters. At boot and resume from suspend,
the connection state may be reset to default values.

In case of multiple connected pins (multiple monitors connected
with audio capability), routing and mute status of pins that
are not connected to any PCM, may interfere with other pins.
E.g. after resume from S3 with multiple monitors, unless
all converters are in active use, playback to some PCMs may
be muted due to the default settings of unrelated converters.

Avoid this by ensuring all pin:cvt selections are correct
in codec whenever a converter is enabled for playback.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/codecs/hdac_hdmi.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 660e0587f3999..702f17b36212f 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -546,6 +546,29 @@ static struct hdac_hdmi_port *hdac_hdmi_get_port_from_cvt(
 	return NULL;
 }
 
+/**
+ * Go through all converters and ensure connection is set to
+ * the correct pin as set via kcontrols.
+ */
+static void hdac_hdmi_verify_connect_sel_all_pins(struct hdac_device *hdev)
+{
+	struct hdac_hdmi_priv *hdmi = hdev_to_hdmi_priv(hdev);
+	struct hdac_hdmi_port *port;
+	struct hdac_hdmi_cvt *cvt;
+	int cvt_idx = 0;
+
+	list_for_each_entry(cvt, &hdmi->cvt_list, head) {
+		port = hdac_hdmi_get_port_from_cvt(hdev, hdmi, cvt);
+		if (port && port->pin) {
+                  snd_hdac_codec_write(hdev, port->pin->nid, 0,
+                                       AC_VERB_SET_CONNECT_SEL, cvt_idx);
+                  dev_dbg(&hdev->dev, "%s: %s set connect %d -> %d\n",
+                          __func__, cvt->name, port->pin->nid, cvt_idx);
+		}
+		++cvt_idx;
+	}
+}
+
 /*
  * This tries to get a valid pin and set the HW constraints based on the
  * ELD. Even if a valid pin is not found return success so that device open
@@ -806,6 +829,14 @@ static int hdac_hdmi_cvt_output_widget_event(struct snd_soc_dapm_widget *w,
 				AC_VERB_SET_CHANNEL_STREAMID, pcm->stream_tag);
 		snd_hdac_codec_write(hdev, cvt->nid, 0,
 				AC_VERB_SET_STREAM_FORMAT, pcm->format);
+
+		/**
+		 * The connection indices are shared by all converters and
+		 * may interfere with each other. Ensure correct
+		 * routing for all converters at stream start.
+		 */
+		hdac_hdmi_verify_connect_sel_all_pins(hdev);
+
 		break;
 
 	case SND_SOC_DAPM_POST_PMD:
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
