Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E68421F4DC
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 16:42:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 254BD1677;
	Tue, 14 Jul 2020 16:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 254BD1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594737763;
	bh=ODeja8ZbbbsF0+/QkL7ragA/7v6rT+R0y3p4lM9mCC4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XHV8FzZUD1UaibBvHVjelUQfOtwQfBi84fKR4/DBYWW6sc5BaD2DvlwHevKp0tcfU
	 buAHu6QISNGs2/YSnlhwb8wcnhn6Y2Z424kH9lB9H0Hrz3++J4IDqEEKUgOH9CR1L+
	 Ji+V65k4C2f2iAUVejJ3+jSMI1B5Yd0rQbbD8nc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 948F8F800E5;
	Tue, 14 Jul 2020 16:40:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30DB3F802C2; Tue, 14 Jul 2020 16:40:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83D3DF802BE
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 16:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83D3DF802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JDAo4wdU"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2DE082253D;
 Tue, 14 Jul 2020 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594737606;
 bh=ODeja8ZbbbsF0+/QkL7ragA/7v6rT+R0y3p4lM9mCC4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JDAo4wdUevGWUPTAqTEOntFQj/g4rFSM9YO+vG1ZAUAbTn47ulMeYxZ2zBv03VcCz
 ZkKGfIXCm0eaOEyk4RI5bFiypn0XuowbePJNzgFN35aDM4SVZF3jooMlF93jZHcqPJ
 4+00Fh76bX5nNzsCW9Uwgev6bgp3AJh/xI78yJuk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 09/12] ALSA: hda/hdmi: fix failures at PCM open
 on Intel ICL and later
Date: Tue, 14 Jul 2020 10:39:51 -0400
Message-Id: <20200714143954.4035840-9-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714143954.4035840-1-sashal@kernel.org>
References: <20200714143954.4035840-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

[ Upstream commit 56275036d8185f92eceac7479d48b858ee3dab84 ]

When HDMI PCM devices are opened in a specific order, with at least one
HDMI/DP receiver connected, ALSA PCM open fails to -EBUSY on the
connected monitor, on recent Intel platforms (ICL/JSL and newer). While
this is not a typical sequence, at least Pulseaudio does this every time
when it is started, to discover the available PCMs.

The rootcause is an invalid assumption in hdmi_add_pin(), where the
total number of converters is assumed to be known at the time the
function is called. On older Intel platforms this held true, but after
ICL/JSL, the order how pins and converters are in the subnode list as
returned by snd_hda_get_sub_nodes(), was changed. As a result,
information for some converters was not stored to per_pin->mux_nids.
And this means some pins cannot be connected to all converters, and
application instead gets -EBUSY instead at open.

The assumption that converters are always before pins in the subnode
list, is not really a valid one. Fix the problem in hdmi_parse_codec()
by introducing separate loops for discovering converters and pins.

BugLink: https://github.com/thesofproject/linux/issues/1978
BugLink: https://github.com/thesofproject/linux/issues/2216
BugLink: https://github.com/thesofproject/linux/issues/2217
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20200703153818.2808592-1-kai.vehmanen@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_hdmi.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 9e8cfc409b4b3..04420a3bf5eb0 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1805,33 +1805,43 @@ static int hdmi_add_cvt(struct hda_codec *codec, hda_nid_t cvt_nid)
 
 static int hdmi_parse_codec(struct hda_codec *codec)
 {
-	hda_nid_t nid;
+	hda_nid_t start_nid;
+	unsigned int caps;
 	int i, nodes;
 
-	nodes = snd_hda_get_sub_nodes(codec, codec->core.afg, &nid);
-	if (!nid || nodes < 0) {
+	nodes = snd_hda_get_sub_nodes(codec, codec->core.afg, &start_nid);
+	if (!start_nid || nodes < 0) {
 		codec_warn(codec, "HDMI: failed to get afg sub nodes\n");
 		return -EINVAL;
 	}
 
-	for (i = 0; i < nodes; i++, nid++) {
-		unsigned int caps;
-		unsigned int type;
+	/*
+	 * hdmi_add_pin() assumes total amount of converters to
+	 * be known, so first discover all converters
+	 */
+	for (i = 0; i < nodes; i++) {
+		hda_nid_t nid = start_nid + i;
 
 		caps = get_wcaps(codec, nid);
-		type = get_wcaps_type(caps);
 
 		if (!(caps & AC_WCAP_DIGITAL))
 			continue;
 
-		switch (type) {
-		case AC_WID_AUD_OUT:
+		if (get_wcaps_type(caps) == AC_WID_AUD_OUT)
 			hdmi_add_cvt(codec, nid);
-			break;
-		case AC_WID_PIN:
+	}
+
+	/* discover audio pins */
+	for (i = 0; i < nodes; i++) {
+		hda_nid_t nid = start_nid + i;
+
+		caps = get_wcaps(codec, nid);
+
+		if (!(caps & AC_WCAP_DIGITAL))
+			continue;
+
+		if (get_wcaps_type(caps) == AC_WID_PIN)
 			hdmi_add_pin(codec, nid);
-			break;
-		}
 	}
 
 	return 0;
-- 
2.25.1

