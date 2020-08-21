Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC9624D9E4
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 18:17:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A53B16A2;
	Fri, 21 Aug 2020 18:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A53B16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598026626;
	bh=bpqFFIuJIaqnBbKwzmWCfJM+VGZuHc3Yu7TUhucPvko=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ovpmx1vpKNL9L/1tCFzeB16gf+t7A21PMf3tQzCJFzHGBqnYE7GRemHv4hSxr4dmf
	 WikyYC2VVAd5CCexSqIiWKssFe+3AHwIKxjmUsHFwy91zs1WmyEB2rsSaQA4zfRyP7
	 +9kUjeFhuIPwpRTN6r6O91uV+dOvQTgoqBgjmTb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BBC3F800D2;
	Fri, 21 Aug 2020 18:14:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D480F80260; Fri, 21 Aug 2020 18:14:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A4B0F800D3
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 18:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A4B0F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hET2W7+L"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52F5120855;
 Fri, 21 Aug 2020 16:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598026466;
 bh=bpqFFIuJIaqnBbKwzmWCfJM+VGZuHc3Yu7TUhucPvko=;
 h=From:To:Cc:Subject:Date:From;
 b=hET2W7+L+AyCGbfHrGxcLq9cfB3lH/scu7BOfsVK+iAzwOXu6TnIIthd18n5NeeGT
 1qSlXR86jltCXky4HHoHmHTXIVo+ajXFCKrSX+NunP1QzPf8XRIvTPAvFo4IQ+MZgi
 HTzPLNVG5Rz90eOFjsOQUIY2NATqnY5HAehjAoz8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 01/62] ALSA: hda/hdmi: Add quirk to force
 connectivity
Date: Fri, 21 Aug 2020 12:13:22 -0400
Message-Id: <20200821161423.347071-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Kai-Heng Feng <kai.heng.feng@canonical.com>
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

From: Kai-Heng Feng <kai.heng.feng@canonical.com>

[ Upstream commit cd72c317a0a11f64225b9a3f1fe503bb8c7327b5 ]

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
Link: https://lore.kernel.org/r/20200804155836.16252-1-kai.heng.feng@canonical.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_hdmi.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index cd46247988e4d..b62cd3abb8273 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -160,6 +160,7 @@ struct hdmi_spec {
 
 	bool use_acomp_notifier; /* use eld_notify callback for hotplug */
 	bool acomp_registered; /* audio component registered in this driver */
+	bool force_connect; /* force connectivity */
 	struct drm_audio_component_audio_ops drm_audio_ops;
 	int (*port2pin)(struct hda_codec *, int); /* reverse port/pin mapping */
 
@@ -1701,7 +1702,8 @@ static int hdmi_add_pin(struct hda_codec *codec, hda_nid_t pin_nid)
 	 * all device entries on the same pin
 	 */
 	config = snd_hda_codec_get_pincfg(codec, pin_nid);
-	if (get_defcfg_connect(config) == AC_JACK_PORT_NONE)
+	if (get_defcfg_connect(config) == AC_JACK_PORT_NONE &&
+	    !spec->force_connect)
 		return 0;
 
 	/*
@@ -1803,11 +1805,18 @@ static int hdmi_add_cvt(struct hda_codec *codec, hda_nid_t cvt_nid)
 	return 0;
 }
 
+static const struct snd_pci_quirk force_connect_list[] = {
+	SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
+	{}
+};
+
 static int hdmi_parse_codec(struct hda_codec *codec)
 {
+	struct hdmi_spec *spec = codec->spec;
 	hda_nid_t start_nid;
 	unsigned int caps;
 	int i, nodes;
+	const struct snd_pci_quirk *q;
 
 	nodes = snd_hda_get_sub_nodes(codec, codec->core.afg, &start_nid);
 	if (!start_nid || nodes < 0) {
@@ -1815,6 +1824,11 @@ static int hdmi_parse_codec(struct hda_codec *codec)
 		return -EINVAL;
 	}
 
+	q = snd_pci_quirk_lookup(codec->bus->pci, force_connect_list);
+
+	if (q && q->value)
+		spec->force_connect = true;
+
 	/*
 	 * hdmi_add_pin() assumes total amount of converters to
 	 * be known, so first discover all converters
-- 
2.25.1

