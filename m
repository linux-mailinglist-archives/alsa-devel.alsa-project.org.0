Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 683F1435B2
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 13:55:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3552182F;
	Thu, 13 Jun 2019 13:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3552182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560426916;
	bh=LtGjacGgeS3lRDel3qakjQsg50LdIhDeBWCOHAU8v9k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cZf+ELDGUYHN2Sp55lR07EwwlDDowWHD4cEkRvQgfFHnPP9YrZwcioUZnLhVzd1wR
	 wTjFQPToGvZVn2bKIJSCPIMYux5Y4+EqQTWUNva7KYJ4tj6ZHpude3Rp4OKJPoGDr8
	 4+XOCmxJalR1jrd+fIOZKYodHKrQjbrCohQiMhIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DFE2F89711;
	Thu, 13 Jun 2019 13:53:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C540DF89703; Thu, 13 Jun 2019 13:53:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B84ACF80791
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 13:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B84ACF80791
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 04:53:23 -0700
X-ExtLoop1: 1
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008.jf.intel.com with ESMTP; 13 Jun 2019 04:53:20 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Date: Thu, 13 Jun 2019 14:54:12 +0300
Message-Id: <20190613115412.13921-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: libin.yang@intel.com, tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH v3] ASoC: codec: hdac_hdmi: fix pin connections
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
index 660e0587f3999..7eba57157bb94 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -546,6 +546,29 @@ static struct hdac_hdmi_port *hdac_hdmi_get_port_from_cvt(
 	return NULL;
 }
 
+/*
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
+			snd_hdac_codec_write(hdev, port->pin->nid, 0,
+					     AC_VERB_SET_CONNECT_SEL, cvt_idx);
+			dev_dbg(&hdev->dev, "%s: %s set connect %d -> %d\n",
+				__func__, cvt->name, port->pin->nid, cvt_idx);
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
+		/*
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
