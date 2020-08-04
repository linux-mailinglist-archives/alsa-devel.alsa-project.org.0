Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA3723BB64
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 15:50:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C28FE1662;
	Tue,  4 Aug 2020 15:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C28FE1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596549007;
	bh=FRb5BJdVZ7IUOQHbmcgwpznAPIb6L2zapOb3br0Pzfo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a45dX1rIUxzIPctOM0vct/ATnQPCCMQA4Rzbru8LAWcJ4oMCA+jOSz27wuUy7u6Lt
	 8nJikU4HbBUwKi6enJ7Of+IZmaUwFnYPxEL45CL2LR3uTGPmylLQfZ4wtuler3XrKU
	 EVznggeGoBVnUEJ6ALdjpx/Ag8pGoGQin214RYLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07997F8015A;
	Tue,  4 Aug 2020 15:48:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30BD2F80150; Tue,  4 Aug 2020 15:48:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4995CF800B7
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 15:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4995CF800B7
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1k2xIT-0002gl-8L; Tue, 04 Aug 2020 13:48:05 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH v2] ALSA: hda/hdmi: Add quirk to force connectivity
Date: Tue,  4 Aug 2020 21:48:00 +0800
Message-Id: <20200804134801.10872-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: Nikhil Mahale <nmahale@nvidia.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Aaron Plattner <aplattner@nvidia.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>
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

HDMI on some platforms doesn't enable audio support because its Port
Connectivity [31:30] is set to AC_JACK_PORT_NONE:
Node 0x05 [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x0b000094: OUT Detect HBR HDMI DP
  Pin Default 0x58560010: [N/A] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 3
     0x02 0x03* 0x04

For now, use a quirk to force connectivity based on SSID. If there are
more platforms affected by the same issue, we can eye for a more generic
solution.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
 - Use a quirk list instead.

 include/sound/hda_codec.h  |  1 +
 sound/pci/hda/patch_hdmi.c | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index d16a4229209b..947cba68d9fe 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -254,6 +254,7 @@ struct hda_codec {
 	unsigned int link_down_at_suspend:1; /* link down at runtime suspend */
 	unsigned int relaxed_resume:1;	/* don't resume forcibly for jack */
 	unsigned int mst_no_extra_pcms:1; /* no backup PCMs for DP-MST */
+	unsigned int force_connect:1; /* force connectivity */
 
 #ifdef CONFIG_PM
 	unsigned long power_on_acct;
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index cd46247988e4..40d4f0e0e3d7 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1701,7 +1701,8 @@ static int hdmi_add_pin(struct hda_codec *codec, hda_nid_t pin_nid)
 	 * all device entries on the same pin
 	 */
 	config = snd_hda_codec_get_pincfg(codec, pin_nid);
-	if (get_defcfg_connect(config) == AC_JACK_PORT_NONE)
+	if (get_defcfg_connect(config) == AC_JACK_PORT_NONE &&
+	    !codec->force_connect)
 		return 0;
 
 	/*
@@ -1803,11 +1804,17 @@ static int hdmi_add_cvt(struct hda_codec *codec, hda_nid_t cvt_nid)
 	return 0;
 }
 
+static const struct snd_pci_quirk force_connect_list[] = {
+	SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
+	{}
+};
+
 static int hdmi_parse_codec(struct hda_codec *codec)
 {
 	hda_nid_t start_nid;
 	unsigned int caps;
 	int i, nodes;
+	const struct snd_pci_quirk *q;
 
 	nodes = snd_hda_get_sub_nodes(codec, codec->core.afg, &start_nid);
 	if (!start_nid || nodes < 0) {
@@ -1815,6 +1822,11 @@ static int hdmi_parse_codec(struct hda_codec *codec)
 		return -EINVAL;
 	}
 
+	q = snd_pci_quirk_lookup(codec->bus->pci, force_connect_list);
+
+	if (q && q->value)
+		codec->force_connect = 1;
+
 	/*
 	 * hdmi_add_pin() assumes total amount of converters to
 	 * be known, so first discover all converters
-- 
2.17.1

