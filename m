Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F14BC2B14E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 11:30:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EA4316A9;
	Mon, 27 May 2019 11:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EA4316A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558949405;
	bh=Rrmd2dFIOlZVJhkX3rGVNxHX+w9QBfdckw9asZLWTtI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c4f4AQGtVc9RSfaNHshMWMRhhq5H2B1j4Hk1VIaQbpJol0oVVA+X/PDhMKiGaojBE
	 /PJjF+hBfLHr/K3xigA/0l2FGtf547UIFagGkOPzL8Y2z8pShuGiUDoIzR5dtGqMHK
	 pve4sNsflaA6zQw9QHZjtqZ6QcPGPu52GkDyJ8LU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70B0FF8972A;
	Mon, 27 May 2019 11:27:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8E29F896E8; Mon, 27 May 2019 11:27:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DACA4F80730
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 11:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DACA4F80730
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 02:27:32 -0700
X-ExtLoop1: 1
Received: from younglee-svr.sh.intel.com ([10.239.159.31])
 by fmsmga004.fm.intel.com with ESMTP; 27 May 2019 02:27:31 -0700
From: libin.yang@intel.com
To: alsa-devel@alsa-project.org
Date: Mon, 27 May 2019 17:07:24 +0800
Message-Id: <1558948047-18930-2-git-send-email-libin.yang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558948047-18930-1-git-send-email-libin.yang@intel.com>
References: <1558948047-18930-1-git-send-email-libin.yang@intel.com>
Cc: tiwai@suse.de, libin.yang@intel.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [RFC PATCH 1/4] ASoC: hdac_hdmi: amixer kctl setting
	should not impact on jack status
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

Amixer kctl setting should not impact on the jack connection status.
In hdac_hdmi_present_sense(), it will call hdac_hdmi_jack_report() to
report the monitor connection status. This means the jack status represents
the HDMI monitor connection status.

However, in the original code, hdac_hdmi_set_pin_port_mux() will also
call hdac_hdmi_jack_report() when "pinx-porty Mux" setting is changed. This
means the kctl setting will also impact on the jack status regardless of
the monitor connection. This will introduce some troubles. For example,
assuming the original amixer setting is:
"pin5-port0 Mux" is set "cvt 2"
"pin5-port1 Mux" is set "cvt 2"
HDMI uses pin5 and HDMI is connected to the machine.
After booting the system, setting "pin5-port1 Mux" to "NONE" will
trigger hdac_hdmi_set_pin_port_mux() calling hdac_hdmi_jack_report(false)
In this situation, user space will get the wrong status.

This patch removes calling hdac_hdmi_jack_report() in
hdac_hdmi_set_pin_port_mux(). This makes jack status always represents
the monitor connection status.

Signed-off-by: Libin Yang <libin.yang@intel.com>
---
 sound/soc/codecs/hdac_hdmi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 660e058..5a9e7f9 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -855,7 +855,6 @@ static int hdac_hdmi_pin_mux_widget_event(struct snd_soc_dapm_widget *w,
 static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	int ret;
 	struct hdac_hdmi_port *p, *p_next;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_widget(kcontrol);
@@ -865,6 +864,7 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 	struct hdac_hdmi_priv *hdmi = hdev_to_hdmi_priv(hdev);
 	struct hdac_hdmi_pcm *pcm = NULL;
 	const char *cvt_name =  e->texts[ucontrol->value.enumerated.item[0]];
+	int ret;
 
 	ret = snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
 	if (ret < 0)
@@ -880,10 +880,8 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 
 		list_for_each_entry_safe(p, p_next, &pcm->port_list, head) {
 			if (p == port && p->id == port->id &&
-					p->pin == port->pin) {
-				hdac_hdmi_jack_report(pcm, port, false);
+			    p->pin == port->pin)
 				list_del(&p->head);
-			}
 		}
 	}
 
@@ -895,7 +893,6 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 		if (!strcmp(cvt_name, pcm->cvt->name)) {
 			list_add_tail(&port->head, &pcm->port_list);
 			if (port->eld.monitor_present && port->eld.eld_valid) {
-				hdac_hdmi_jack_report(pcm, port, true);
 				mutex_unlock(&hdmi->pin_mutex);
 				return ret;
 			}
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
