Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D192B152
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 11:31:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E8D179B;
	Mon, 27 May 2019 11:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E8D179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558949474;
	bh=c8/p5nljI8d9z/ZHitI3R7IZYvmiWmn6hf2dgvL8buk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WZmdAeotn6BhDfZgGm1OTBHpiJr83Com7uoePvxd3BrEY+RWZbNsXFIqz1Imzqukw
	 FJu7atSUlEtjyXpXA8U/3Q8najEPGJVRLe8x8wyTZSmu9RQ1vgskad+r8RqOyIVs+3
	 scvgApM4nVbdsNUmdv4BqjpxYxr/1S8k1w/k34SQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 543E1F89731;
	Mon, 27 May 2019 11:27:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 787D8F8972A; Mon, 27 May 2019 11:27:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E164DF8065A
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 11:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E164DF8065A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 02:27:37 -0700
X-ExtLoop1: 1
Received: from younglee-svr.sh.intel.com ([10.239.159.31])
 by fmsmga004.fm.intel.com with ESMTP; 27 May 2019 02:27:36 -0700
From: libin.yang@intel.com
To: alsa-devel@alsa-project.org
Date: Mon, 27 May 2019 17:07:27 +0800
Message-Id: <1558948047-18930-5-git-send-email-libin.yang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558948047-18930-1-git-send-email-libin.yang@intel.com>
References: <1558948047-18930-1-git-send-email-libin.yang@intel.com>
Cc: tiwai@suse.de, libin.yang@intel.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [RFC PATCH 4/4] ASoC: hdac_hdmi: fix some coding style
	issue
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

This patch fixes some coding style issue

Signed-off-by: Libin Yang <libin.yang@intel.com>
---
 sound/soc/codecs/hdac_hdmi.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index ed267fa..a52d236 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -477,8 +477,8 @@ static int hdac_hdmi_query_port_connlist(struct hdac_device *hdev,
 {
 	if (!(get_wcaps(hdev, pin->nid) & AC_WCAP_CONN_LIST)) {
 		dev_warn(&hdev->dev,
-			"HDMI: pin %d wcaps %#x does not support connection list\n",
-			pin->nid, get_wcaps(hdev, pin->nid));
+			 "HDMI: pin %d wcaps %#x does not support connection list\n",
+			 pin->nid, get_wcaps(hdev, pin->nid));
 		return -EINVAL;
 	}
 
@@ -489,11 +489,11 @@ static int hdac_hdmi_query_port_connlist(struct hdac_device *hdev,
 			port->mux_nids, HDA_MAX_CONNECTIONS);
 	if (port->num_mux_nids == 0)
 		dev_warn(&hdev->dev,
-			"No connections found for pin:port %d:%d\n",
-						pin->nid, port->id);
+			 "No connections found for pin:port %d:%d\n",
+			 pin->nid, port->id);
 
 	dev_dbg(&hdev->dev, "num_mux_nids %d for pin:port %d:%d\n",
-			port->num_mux_nids, pin->nid, port->id);
+		port->num_mux_nids, pin->nid, port->id);
 
 	return port->num_mux_nids;
 }
@@ -572,9 +572,9 @@ static int hdac_hdmi_pcm_open(struct snd_pcm_substream *substream,
 			(!port->eld.eld_valid)) {
 
 		dev_warn(&hdev->dev,
-			"Failed: present?:%d ELD valid?:%d pin:port: %d:%d\n",
-			port->eld.monitor_present, port->eld.eld_valid,
-			port->pin->nid, port->id);
+			 "Failed: present?:%d ELD valid?:%d pin:port: %d:%d\n",
+			 port->eld.monitor_present, port->eld.eld_valid,
+			 port->pin->nid, port->id);
 
 		return 0;
 	}
@@ -734,7 +734,7 @@ static int hdac_hdmi_pin_output_widget_event(struct snd_soc_dapm_widget *w,
 	struct hdac_hdmi_pcm *pcm;
 
 	dev_dbg(&hdev->dev, "%s: widget: %s event: %x\n",
-			__func__, w->name, event);
+		__func__, w->name, event);
 
 	pcm = hdac_hdmi_get_pcm(hdev, port);
 	if (!pcm)
@@ -780,7 +780,7 @@ static int hdac_hdmi_cvt_output_widget_event(struct snd_soc_dapm_widget *w,
 	struct hdac_hdmi_pcm *pcm;
 
 	dev_dbg(&hdev->dev, "%s: widget: %s event: %x\n",
-			__func__, w->name, event);
+		__func__, w->name, event);
 
 	pcm = hdac_hdmi_get_pcm_from_cvt(hdmi, cvt);
 	if (!pcm)
@@ -826,7 +826,7 @@ static int hdac_hdmi_pin_mux_widget_event(struct snd_soc_dapm_widget *w,
 	int mux_idx;
 
 	dev_dbg(&hdev->dev, "%s: widget: %s event: %x\n",
-			__func__, w->name, event);
+		__func__, w->name, event);
 
 	if (!kc)
 		kc  = w->kcontrols[0];
@@ -1142,7 +1142,7 @@ static int hdac_hdmi_init_dai_map(struct hdac_device *hdev)
 
 		if (dai_id == HDA_MAX_CVTS) {
 			dev_warn(&hdev->dev,
-				"Max dais supported: %d\n", dai_id);
+				 "Max dais supported: %d\n", dai_id);
 			break;
 		}
 	}
@@ -1242,8 +1242,8 @@ static void hdac_hdmi_present_sense(struct hdac_hdmi_pin *pin,
 	pcm = hdac_hdmi_get_pcm(hdev, port);
 
 	if (!port->eld.monitor_present || !port->eld.eld_valid) {
-		dev_err(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
-						__func__, pin->nid, port->id);
+		dev_info(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
+			 __func__, pin->nid, port->id);
 		hdac_hdmi_jack_report(port, false);
 		mutex_unlock(&hdmi->pin_mutex);
 		return;
@@ -1281,6 +1281,7 @@ static int hdac_hdmi_add_ports(struct hdac_device *hdev,
 	}
 	pin->ports = ports;
 	pin->num_ports = max_ports;
+
 	return 0;
 }
 
@@ -1544,7 +1545,7 @@ static void hdac_hdmi_eld_notify_cb(void *aptr, int port, int pipe)
 	}
 
 	dev_dbg(&hdev->dev, "%s: for pin:%d port=%d\n", __func__,
-							pin_nid, pipe);
+		pin_nid, pipe);
 
 	/*
 	 * skip notification during system suspend (but not in runtime PM);
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
