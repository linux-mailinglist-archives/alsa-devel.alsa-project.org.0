Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1697A64D2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 15:24:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7C67DEC;
	Tue, 19 Sep 2023 15:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7C67DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695129870;
	bh=tbaxXTXzAGV7H5Ig38QwpLAYbYPEOXuT6WUb4t/S45M=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FJU//QSXr652XvaY3APtYmmjFCBMWd36aEYdgtOPH2+AlTIbAC8CR2PXCmazLv/SQ
	 4w0HIYxwtHxr7ZZbhpe8sHj6irSaMr8pACgOqwSsJ/OYRp7cyXC6Kqs2a8KxkwHuFa
	 y8tCgyl6QjA9dtLJ6YfJIg6vjgMycCiUr5qhhkhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CED6F80494; Tue, 19 Sep 2023 15:23:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C75F7F80125;
	Tue, 19 Sep 2023 15:23:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F650F8025A; Tue, 19 Sep 2023 15:23:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12351F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 15:23:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12351F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LujLhFwh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695129811; x=1726665811;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tbaxXTXzAGV7H5Ig38QwpLAYbYPEOXuT6WUb4t/S45M=;
  b=LujLhFwh1sK5W9UjUFSLzpq9IUUczfqvJcx+A/6WzS9Ki7p02bdTsEWO
   jDus34nWUQ9+DkyqrfJHrTXcdG9o8csX26UWoVKXK7vMAzZpwl/ZjGA9t
   g0VG9K9tDLccNvu0Q2t05XWwnuSjsHZwqm1nY2HVzPAkm9mZQJd4oEozo
   iyhd8mPdMOa27CPdxVV+u6+VQHoMy/CUbKAFA7qHU0qSHK0Xbo55rvN4h
   deyr0oPqYfe0G0a80RxoXvd6GLvPJq2xNZLhFAXpNuIyhIh1WXppuzG5d
   frMmPV5+z6QnJIcd4+js23koZlif6WO2dlNX0LLk/uY/LCz0tsOHDGtlX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="378829398"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="378829398"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 06:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="919866582"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="919866582"
Received: from jelyouss-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.47.85])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 06:23:15 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ALSA: hda: hda_auto_parser: Always set codec->fixup_name when
 a quirk found
Date: Tue, 19 Sep 2023 16:23:22 +0300
Message-ID: <20230919132322.17352-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V5UYANIRPU3P6NH4YJF6TAFBOSIBWUPC
X-Message-ID-Hash: V5UYANIRPU3P6NH4YJF6TAFBOSIBWUPC
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V5UYANIRPU3P6NH4YJF6TAFBOSIBWUPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If a fixup is found via a quirk then the codec->fixup_name is only set if
CONFIG_SND_DEBUG_VERBOSE is enabled, otherwise the fixup_name is set to
NULL.

This will result prints in __snd_hda_apply_fixup() when applying the found
fixup for example:
ehdaudio0D0: ALC236: Apply fix-func for (null)

Fixes: 73355ddd8775 ("ALSA: hda: Code refactoring snd_hda_pick_fixup()")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/pci/hda/hda_auto_parser.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
index 7c6b1fe8dfcc..7b1ddb8d40cb 100644
--- a/sound/pci/hda/hda_auto_parser.c
+++ b/sound/pci/hda/hda_auto_parser.c
@@ -1043,9 +1043,8 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
 
  found_device:
 	id = q->value;
-#ifdef CONFIG_SND_DEBUG_VERBOSE
 	name = q->name;
-#endif
+
 	codec_dbg(codec, "%s: picked fixup %s for %s %04x:%04x\n",
 		  codec->core.chip_name, name ? name : "",
 		  type, q->subvendor, q->subdevice);
-- 
2.42.0

