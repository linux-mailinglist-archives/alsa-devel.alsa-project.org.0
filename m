Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A84F487DD7
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 17:17:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 303F41665;
	Fri,  9 Aug 2019 17:16:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 303F41665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565363854;
	bh=kM0RHCfyBrYW+icFqqbglB/EVcmahVH/0UWDQ/1Jh4Y=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J9SWBgdMaZ57PQt7l7tWIEfetRzvmB8yZ1ysiJ7ysUiCfVktdz8WgZcBOrQXLN/c2
	 Q+ed/ZMTpUIeyJ5RqwZXQBKHJwPrkE7gW65BSWLaK0QgH81MlHFNNBRkx9fxBXEvJt
	 /i8RjDBSJRW0f5AfULH6F1l+YvoduHVV84MGKn/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81D9AF8036B;
	Fri,  9 Aug 2019 17:15:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55226F803F3; Fri,  9 Aug 2019 17:15:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36BB8F801A4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 17:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36BB8F801A4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EFA2CAF38;
 Fri,  9 Aug 2019 15:15:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  9 Aug 2019 17:15:31 +0200
Message-Id: <20190809151531.24359-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Libin Yang <libin.yang@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: hdac_hdmi: Offload dapm update at jack
	detection
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

hdac_hdmi_present_sense() calls the audio component to get ELD update,
then it reports the jack status change and updates DAPM graph
accordingly.  This works when it's called from the normal code paths.

However, it may lead to a dead lock when it's called from the audio
component notifier.  Namely, the DAPM update involves with the runtime
PM, and it eventually calls again the audio component get_power()
ops.  Since i915 driver already takes a mutex around the audio
component ops calls, we'll eventually get the mutex doubly.

As a workaround, in this patch, only the jack state is updated in the
code path from hdac_hdmi_eld_notify_cb(), and the DAPM update is
deferred to a work so that it's processed in another context.

Reported-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

This is a bug fix I did in the last year when we received some bug
report, but forgotten in my archive.  I believe the fix is still valid
although the bug may trigger rarely.

 sound/soc/codecs/hdac_hdmi.c | 57 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 48 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 29918954e740..18c173e6a13b 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -88,8 +88,10 @@ struct hdac_hdmi_port {
 	hda_nid_t mux_nids[HDA_MAX_CONNECTIONS];
 	struct hdac_hdmi_eld eld;
 	const char *jack_pin;
+	bool is_connect;
 	struct snd_soc_dapm_context *dapm;
 	const char *output_pin;
+	struct work_struct dapm_work;
 };
 
 struct hdac_hdmi_pcm {
@@ -163,11 +165,7 @@ static void hdac_hdmi_jack_report(struct hdac_hdmi_pcm *pcm,
 {
 	struct hdac_device *hdev = port->pin->hdev;
 
-	if (is_connect)
-		snd_soc_dapm_enable_pin(port->dapm, port->jack_pin);
-	else
-		snd_soc_dapm_disable_pin(port->dapm, port->jack_pin);
-
+	port->is_connect = is_connect;
 	if (is_connect) {
 		/*
 		 * Report Jack connect event when a device is connected
@@ -193,10 +191,32 @@ static void hdac_hdmi_jack_report(struct hdac_hdmi_pcm *pcm,
 		if (pcm->jack_event > 0)
 			pcm->jack_event--;
 	}
+}
 
+static void hdac_hdmi_port_dapm_update(struct hdac_hdmi_port *port)
+{
+	if (port->is_connect)
+		snd_soc_dapm_enable_pin(port->dapm, port->jack_pin);
+	else
+		snd_soc_dapm_disable_pin(port->dapm, port->jack_pin);
 	snd_soc_dapm_sync(port->dapm);
 }
 
+static void hdac_hdmi_jack_dapm_work(struct work_struct *work)
+{
+	struct hdac_hdmi_port *port;
+
+	port = container_of(work, struct hdac_hdmi_port, dapm_work);
+	hdac_hdmi_port_dapm_update(port);
+}
+
+static void hdac_hdmi_jack_report_sync(struct hdac_hdmi_pcm *pcm,
+		struct hdac_hdmi_port *port, bool is_connect)
+{
+	hdac_hdmi_jack_report(pcm, port, is_connect);
+	hdac_hdmi_port_dapm_update(port);
+}
+
 /* MST supported verbs */
 /*
  * Get the no devices that can be connected to a port on the Pin widget.
@@ -904,7 +924,7 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 		list_for_each_entry_safe(p, p_next, &pcm->port_list, head) {
 			if (p == port && p->id == port->id &&
 					p->pin == port->pin) {
-				hdac_hdmi_jack_report(pcm, port, false);
+				hdac_hdmi_jack_report_sync(pcm, port, false);
 				list_del(&p->head);
 			}
 		}
@@ -918,7 +938,7 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 		if (!strcmp(cvt_name, pcm->cvt->name)) {
 			list_add_tail(&port->head, &pcm->port_list);
 			if (port->eld.monitor_present && port->eld.eld_valid) {
-				hdac_hdmi_jack_report(pcm, port, true);
+				hdac_hdmi_jack_report_sync(pcm, port, true);
 				mutex_unlock(&hdmi->pin_mutex);
 				return ret;
 			}
@@ -1281,16 +1301,20 @@ static void hdac_hdmi_present_sense(struct hdac_hdmi_pin *pin,
 		 * report jack here. It will be done in usermode mux
 		 * control select.
 		 */
-		if (pcm)
+		if (pcm) {
 			hdac_hdmi_jack_report(pcm, port, false);
+			schedule_work(&port->dapm_work);
+		}
 
 		mutex_unlock(&hdmi->pin_mutex);
 		return;
 	}
 
 	if (port->eld.monitor_present && port->eld.eld_valid) {
-		if (pcm)
+		if (pcm) {
 			hdac_hdmi_jack_report(pcm, port, true);
+			schedule_work(&port->dapm_work);
+		}
 
 		print_hex_dump_debug("ELD: ", DUMP_PREFIX_OFFSET, 16, 1,
 			  port->eld.eld_buffer, port->eld.eld_size, false);
@@ -1319,6 +1343,7 @@ static int hdac_hdmi_add_ports(struct hdac_device *hdev,
 	for (i = 0; i < max_ports; i++) {
 		ports[i].id = i;
 		ports[i].pin = pin;
+		INIT_WORK(&ports[i].dapm_work, hdac_hdmi_jack_dapm_work);
 	}
 	pin->ports = ports;
 	pin->num_ports = max_ports;
@@ -2083,8 +2108,20 @@ static int hdac_hdmi_dev_probe(struct hdac_device *hdev)
 	return ret;
 }
 
+static void clear_dapm_works(struct hdac_device *hdev)
+{
+	struct hdac_hdmi_priv *hdmi = hdev_to_hdmi_priv(hdev);
+	struct hdac_hdmi_pin *pin;
+	int i;
+
+	list_for_each_entry(pin, &hdmi->pin_list, head)
+		for (i = 0; i < pin->num_ports; i++)
+			cancel_work_sync(&pin->ports[i].dapm_work);
+}
+
 static int hdac_hdmi_dev_remove(struct hdac_device *hdev)
 {
+	clear_dapm_works(hdev);
 	snd_hdac_display_power(hdev->bus, hdev->addr, false);
 
 	return 0;
@@ -2103,6 +2140,8 @@ static int hdac_hdmi_runtime_suspend(struct device *dev)
 	if (!bus)
 		return 0;
 
+	clear_dapm_works(hdev);
+
 	/*
 	 * Power down afg.
 	 * codec_read is preferred over codec_write to set the power state.
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
