Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF956E14F5
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 21:15:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0584DF10;
	Thu, 13 Apr 2023 21:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0584DF10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681413313;
	bh=6LbDqH5anZY+c9RRHR2OipyEtk0sIq7DJ0r9nofBKss=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YsiqkGgVLJPMefTQyiZWl8BGLgxWOTlXcQdiUHzptttmaLt82eJVB8QyEZ6IMjTYF
	 SeFF1TxnTqfCzfDneKclYnlySbuH3tboFFB+ERtFTdX2Uq92p09Q/9f1th8LUsQiY+
	 vEhWGN/GfvfrRlJ8gOQm8gk7k+XBgCjQkKsCM460=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77094F8025E;
	Thu, 13 Apr 2023 21:14:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04C89F8032B; Thu, 13 Apr 2023 21:14:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DA24F80100
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 21:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DA24F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z3aJqu2j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681413251; x=1712949251;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6LbDqH5anZY+c9RRHR2OipyEtk0sIq7DJ0r9nofBKss=;
  b=Z3aJqu2j7uDljh7wYmOXFVZvvNBPD+m/epYTVBbzAFRSmdHMsUZoEVV/
   J8mg/JfbARMfNUx4qV9AcUwnpN8Kgd2F7cvzLue8jaOvIXban/+bTMlSv
   1gpGnHTFj/MAtGNQM/L0VK6V/d6Yx1LbcQ6sxF+5DDE5Z8KbNSwIsiQ+N
   SVWbjiK0VdHVNqXa3uVMV2nWGOthyZk9MITTeGa5AodnQLhT6P7QDZCuH
   rhLkweQJ59uWJnRL6gCAZLw+9sXXm+9fvHyA924RD6WD8jtSrkZamheXt
   FFjeMTMjF4Ra0Qg0PINWdaLf+wVfUa+MKWlgoSjdTcRh+zhxX4cnVUx0O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="344276636"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200";
   d="scan'208";a="344276636"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 12:14:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="639804126"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200";
   d="scan'208";a="639804126"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2023 12:13:59 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda/hdmi: disable KAE for Intel DG2
Date: Thu, 13 Apr 2023 22:11:53 +0300
Message-Id: <20230413191153.3692049-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JZNOOAQLDO6GAIMREUDMODYFTW22LV7P
X-Message-ID-Hash: JZNOOAQLDO6GAIMREUDMODYFTW22LV7P
X-MailFrom: kai.vehmanen@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: uma.shankar@intel.com, intel-gfx@lists.freedesktop.org,
 kai.vehmanen@linux.intel.com, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZNOOAQLDO6GAIMREUDMODYFTW22LV7P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use of keep-alive (KAE) has resulted in loss of audio on some A750/770
cards as the transition from keep-alive to stream playback is not
working as expected. As there is limited benefit of the new KAE mode
on discrete cards, revert back to older silent-stream implementation
on these systems.

Cc: stable@vger.kernel.org
Fixes: 15175a4f2bbb ("ALSA: hda/hdmi: add keep-alive support for ADL-P and DG2")
Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8307
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 4ffa3a59f419..5c6980394dce 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4604,7 +4604,7 @@ HDA_CODEC_ENTRY(0x80862814, "DG1 HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x80862815, "Alderlake HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x80862816, "Rocketlake HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x80862818, "Raptorlake HDMI",	patch_i915_tgl_hdmi),
-HDA_CODEC_ENTRY(0x80862819, "DG2 HDMI",	patch_i915_adlp_hdmi),
+HDA_CODEC_ENTRY(0x80862819, "DG2 HDMI",	patch_i915_tgl_hdmi),
 HDA_CODEC_ENTRY(0x8086281a, "Jasperlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281b, "Elkhartlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281c, "Alderlake-P HDMI", patch_i915_adlp_hdmi),

base-commit: be6247640eea9d9b0ff15607fab7a12f40974985
-- 
2.40.0

