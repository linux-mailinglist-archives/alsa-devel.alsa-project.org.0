Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8161AABAF9
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 16:33:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 020003E;
	Fri,  6 Sep 2019 16:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 020003E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567780439;
	bh=Vx68e1x+ytVPcZX8GKDNngR0Fu6QdE5J3ptGQtbdOG4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CEEPGod5T3xGpLMJNKs6O/koovgOYT2uDO6bY0MoSxhHZ7JOR0T+3/wAIhp9EuR4A
	 cMWghKEbLpMSimZL9wKBbdGLCqAvkHP52YyQHzyXU9Hd+7MiubgBphu+sRfAXOVspn
	 BWy3b3aGpes8cEuEtjMkGJY0Tcet54DX05RzH1eo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A387F80636;
	Fri,  6 Sep 2019 16:29:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BD11F8060F; Fri,  6 Sep 2019 16:29:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D159F805FB
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 16:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D159F805FB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 07:29:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,473,1559545200"; d="scan'208";a="384228446"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2019 07:29:36 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Fri,  6 Sep 2019 17:29:07 +0300
Message-Id: <20190906142909.770-5-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190906142909.770-1-kai.vehmanen@linux.intel.com>
References: <20190906142909.770-1-kai.vehmanen@linux.intel.com>
Cc: libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [RFC PATCH v2 4/6] ALSA: hda/hdmi - implement
	mst_no_extra_pcms flag
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

When mst_no_exxtra_pcms flag is set, the codec should not
use backup PCMs to handle DP-MST scenarios. Instead a simple
1:1 mapping is assumed between PCMs and converters.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index bca5de78e9ad..59aaee4a40fd 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2072,15 +2072,24 @@ static bool is_hdmi_pcm_attached(struct hdac_device *hdac, int pcm_idx)
 static int generic_hdmi_build_pcms(struct hda_codec *codec)
 {
 	struct hdmi_spec *spec = codec->spec;
-	int idx;
+	int idx, pcm_num;
 
 	/*
 	 * for non-mst mode, pcm number is the same as before
-	 * for DP MST mode, pcm number is (nid number + dev_num - 1)
-	 *  dev_num is the device entry number in a pin
-	 *
+	 * for DP MST mode without extra PCM, pcm number is same
+	 * for DP MST mode with extra PCMs, pcm number is
+	 *  (nid number + dev_num - 1)
+	 * dev_num is the device entry number in a pin
 	 */
-	for (idx = 0; idx < spec->num_nids + spec->dev_num - 1; idx++) {
+
+	if (codec->mst_no_extra_pcms)
+		pcm_num = spec->num_nids;
+	else
+		pcm_num = spec->num_nids + spec->dev_num - 1;
+
+	codec_dbg(codec, "hdmi: pcm_num set to %d\n", pcm_num);
+
+	for (idx = 0; idx < pcm_num; idx++) {
 		struct hda_pcm *info;
 		struct hda_pcm_stream *pstr;
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
