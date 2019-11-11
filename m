Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC20EF7536
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 14:40:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8C351676;
	Mon, 11 Nov 2019 14:39:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8C351676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573479634;
	bh=u7SW+u5rFeSsm4Wf1l0dOgWYpO8vTu4Q4fOzhY0dvRk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NykK/cmG9YIsIuAJxNancPj7Jtzg20mAdB6BhTiVQ+4MkZDEKaYdeQmb81EW+uSMi
	 Oh+jwa8rm8YzHLm2iG3+CJHzNO7dhDJLo5UrRfUuFo/GlA8XOJM396lQnvmKrWQUMd
	 I1XKKxYH01Ee/oQT/vmgKBtpN3/1F4BbaEf9BNhg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7829EF80506;
	Mon, 11 Nov 2019 14:38:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D84A2F804FF; Mon, 11 Nov 2019 14:38:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5AEAF802E0
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 14:38:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5AEAF802E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 05:38:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,293,1569308400"; d="scan'208";a="197671836"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga008.jf.intel.com with ESMTP; 11 Nov 2019 05:38:40 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Mon, 11 Nov 2019 15:38:38 +0200
Message-Id: <20191111133838.21213-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH] ALSA: hda: hdmi - fix pin setup on Tigerlake
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

Apply same logic to pin setup as on previous platforms. Fixes
errors in HDMI/DP playback.

Tested with both snd-hda-intel and SOF drivers.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index bda4c2b1bfcc..d883719b1546 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -46,10 +46,12 @@ MODULE_PARM_DESC(static_hdmi_pcm, "Don't restrict PCM parameters per ELD info");
 				((codec)->core.vendor_id == 0x80862800))
 #define is_cannonlake(codec) ((codec)->core.vendor_id == 0x8086280c)
 #define is_icelake(codec) ((codec)->core.vendor_id == 0x8086280f)
+#define is_tigerlake(codec) ((codec)->core.vendor_id == 0x80862812)
 #define is_haswell_plus(codec) (is_haswell(codec) || is_broadwell(codec) \
 				|| is_skylake(codec) || is_broxton(codec) \
 				|| is_kabylake(codec) || is_geminilake(codec) \
-				|| is_cannonlake(codec) || is_icelake(codec))
+				|| is_cannonlake(codec) || is_icelake(codec) \
+				|| is_tigerlake(codec))
 #define is_valleyview(codec) ((codec)->core.vendor_id == 0x80862882)
 #define is_cherryview(codec) ((codec)->core.vendor_id == 0x80862883)
 #define is_valleyview_plus(codec) (is_valleyview(codec) || is_cherryview(codec))
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
