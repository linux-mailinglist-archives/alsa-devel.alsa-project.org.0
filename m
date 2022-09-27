Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B45355EC551
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 16:00:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D02B7822;
	Tue, 27 Sep 2022 16:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D02B7822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664287252;
	bh=ZXrmu/PunYDe1xIi4jB5rE+3PR+QFCMY2cJy+0qk9sE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SWx9b93POKmcDRmf2VN8gdRPTWQu2GLsR3pY0SpPZ3z36C/tJm4V2DMrg7VWqu3S5
	 n3yMLwb84QVO22Zly/zdEAfCt8LwUliwzSVqjFZaXJwnFVZuuRhcfMcy4pGKXRytZl
	 1hTPAg8D0Za6TlEZ1qSAZP/PjvS+P8v+uvnxO1rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F971F8011C;
	Tue, 27 Sep 2022 15:59:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7984CF8025E; Tue, 27 Sep 2022 15:59:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0538AF80166
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 15:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0538AF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FqY/AAEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664287189; x=1695823189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZXrmu/PunYDe1xIi4jB5rE+3PR+QFCMY2cJy+0qk9sE=;
 b=FqY/AAEUAdRmAp8hP4mJiaXtDb7rYBA5VSo8Iq6ugV5xEZHVfhkVcnQw
 EuSlYqrp8upP6aZEMzh5BecBs5OCbm1v6MpGYlZPcTZgObYwgZoO9NoHP
 0G3xXD7AF+7ZHLSlISZ+80/GS3xp9AAYpebnbgYpmfy9EDEdPAZrUAZ+A
 UKXGeV4OMGEao31zlygqlBxIdvnJyyqpWtz+gUM/fekzxEY76FKSljUn9
 1IHlA1QsBKLCintMX3zRO/F00OGjemCJzMeU2y5alZ5ixFqzwCv54k/Ky
 MtzeaRqB6+00lo8uE0JL9HPzggErHk4H2H5YVlMHcj5WLSrV68vBZ2f1i Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="300040867"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="300040867"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 06:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="683999422"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="683999422"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.25])
 by fmsmga008.fm.intel.com with ESMTP; 27 Sep 2022 06:59:42 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/hdmi: run eld notify in delay work
Date: Tue, 27 Sep 2022 21:58:07 +0800
Message-Id: <20220927135807.4097052-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Brent Lu <brent.lu@intel.com>,
 Mohan Kumar <mkumard@nvidia.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

During resolution change, display driver would disable HDMI audio then
enable it in a short time. There is possibility that eld notify for
HDMI audio enable is called when previous runtime suspend is still
running. In this case, the elf nofity just returns and not updating the
status of corresponding HDMI pin/port. Here we move the eld nofity to
a delay work so we don't lose it.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/pci/hda/patch_hdmi.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 6c209cd26c0c..a4c305ee8ff9 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2907,13 +2907,21 @@ static int intel_port2pin(struct hda_codec *codec, int port)
 	return spec->port_map[port];
 }
 
-static void intel_pin_eld_notify(void *audio_ptr, int port, int pipe)
+struct pin_eld_notify {
+	void *audio_ptr;
+	int port;
+	int pipe;
+	struct delayed_work notify_work;
+};
+
+static void pin_eld_notify_work(struct work_struct *work)
 {
-	struct hda_codec *codec = audio_ptr;
+	struct pin_eld_notify *notify = container_of(work, struct pin_eld_notify, notify_work.work);
+	struct hda_codec *codec = notify->audio_ptr;
 	int pin_nid;
-	int dev_id = pipe;
+	int dev_id = notify->pipe;
 
-	pin_nid = intel_port2pin(codec, port);
+	pin_nid = intel_port2pin(codec, notify->port);
 	if (!pin_nid)
 		return;
 	/* skip notification during system suspend (but not in runtime PM);
@@ -2922,13 +2930,33 @@ static void intel_pin_eld_notify(void *audio_ptr, int port, int pipe)
 	if (codec->core.dev.power.power_state.event == PM_EVENT_SUSPEND)
 		return;
 	/* ditto during suspend/resume process itself */
-	if (snd_hdac_is_in_pm(&codec->core))
+	if (snd_hdac_is_in_pm(&codec->core)) {
+		schedule_delayed_work(&notify->notify_work, msecs_to_jiffies(10));
 		return;
+	}
 
 	snd_hdac_i915_set_bclk(&codec->bus->core);
 	check_presence_and_report(codec, pin_nid, dev_id);
 }
 
+static void intel_pin_eld_notify(void *audio_ptr, int port, int pipe)
+{
+	struct hda_codec *codec = audio_ptr;
+	struct device *dev = hda_codec_dev(codec);
+	struct pin_eld_notify *notify;
+
+	notify = devm_kzalloc(dev, sizeof(struct pin_eld_notify), GFP_KERNEL);
+	if (!notify)
+		return;
+
+	notify->audio_ptr = audio_ptr;
+	notify->port = port;
+	notify->pipe = pipe;
+	INIT_DELAYED_WORK(&notify->notify_work, pin_eld_notify_work);
+
+	schedule_delayed_work(&notify->notify_work, 0);
+}
+
 static const struct drm_audio_component_audio_ops intel_audio_ops = {
 	.pin2port = intel_pin2port,
 	.pin_eld_notify = intel_pin_eld_notify,
-- 
2.25.1

