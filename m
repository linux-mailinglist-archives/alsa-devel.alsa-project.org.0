Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4E2FDE3F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 13:47:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7468C1672;
	Fri, 15 Nov 2019 13:46:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7468C1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573822053;
	bh=2pKazrxrkfySobtL+8k07RYf0Oag7xXcT7e9jUwz7yA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jMg9BetY0ztr+y5bUJm8PNpI94sW8LPmvrkZXIqD1cpSgwdfY5vS314HgLSKxXUDs
	 HDA06G2LzDCprmvvPBnnbExwshKsxDQorIkDxY5lSsXluxKTbVO+XI4Pt+aBWyJjzq
	 agx8ijjM0hO64A1w+1EGeOtOV60Mi8nGvMB8Tllg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC3F0F8010A;
	Fri, 15 Nov 2019 13:45:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B0E8F80107; Fri, 15 Nov 2019 13:45:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 434C7F8007E
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 13:45:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 434C7F8007E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 04:44:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; d="scan'208";a="214772941"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2019 04:44:54 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Fri, 15 Nov 2019 14:44:47 +0200
Message-Id: <20191115124449.20512-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191115124449.20512-1-kai.vehmanen@linux.intel.com>
References: <20191115124449.20512-1-kai.vehmanen@linux.intel.com>
Cc: Pan Xiuli <xiuli.pan@linux.intel.com>, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH 1/3] ALSA: hda: hdmi - fix port numbering for
	ICL and TGL platforms
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

Semantics of port#0 differ between ICL and TGL:

 ICL port#0   -> never used for HDAudio
 ICL port#1   -> should be mapped to first pin (0x04)
 TGL port#0   -> typically not used, but HW has the support,
		 so should be mapped to first pin (0x04)
 TGL port#1   -> should be mapped to 2nd pin (0x06)

Refactor the port mapping logic to allow to take the above
differences into account. Fixes issues with HDAudio on some
TGL platforms.

Co-developed-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 69d1a6e41f0d..dec90f931bae 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2664,7 +2664,7 @@ static int intel_pin2port(void *audio_ptr, int pin_nid)
 	 */
 	for (i = 0; i < spec->port_num; i++) {
 		if (pin_nid == spec->port_map[i])
-			return i + 1;
+			return i;
 	}
 
 	/* return -1 if pin number exceeds our expectation */
@@ -2684,9 +2684,9 @@ static int intel_port2pin(struct hda_codec *codec, int port)
 		return port + intel_base_nid(codec) - 1;
 	}
 
-	if (port < 1 || port > spec->port_num)
+	if (port < 0 || port >= spec->port_num)
 		return 0;
-	return spec->port_map[port - 1];
+	return spec->port_map[port];
 }
 
 static void intel_pin_eld_notify(void *audio_ptr, int port, int pipe)
@@ -2838,9 +2838,9 @@ static int patch_i915_icl_hdmi(struct hda_codec *codec)
 {
 	/*
 	 * pin to port mapping table where the value indicate the pin number and
-	 * the index indicate the port number with 1 base.
+	 * the index indicate the port number.
 	 */
-	static const int map[] = {0x4, 0x6, 0x8, 0xa, 0xb};
+	static const int map[] = {0x0, 0x4, 0x6, 0x8, 0xa, 0xb};
 
 	return intel_hsw_common_init(codec, 0x02, map, ARRAY_SIZE(map));
 }
@@ -2849,7 +2849,7 @@ static int patch_i915_tgl_hdmi(struct hda_codec *codec)
 {
 	/*
 	 * pin to port mapping table where the value indicate the pin number and
-	 * the index indicate the port number with 1 base.
+	 * the index indicate the port number.
 	 */
 	static const int map[] = {0x4, 0x6, 0x8, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf};
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
