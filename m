Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F07A5A95
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 09:13:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F6B7886;
	Tue, 19 Sep 2023 09:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F6B7886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695107586;
	bh=IMi8TLKZzY0/jOc2BEEjzTRv1YJJIMS/dgGkYzh3trE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q8Fbym5pAdFd/z0+gxY7ul6Kw/AXB1WfmpwUqgJELH8ItBHryrpvmgdZCoCoEgR6X
	 mjTHu4SIuRKlzjOmlTANStvZ8HVsxjVihL8xqXm4bzI9g6FTVy7W3sTS+jZQ4sxJb0
	 /7UfTCEYCiOmmC+bomVgz/rg8X3Kw+xbz0BK8agI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8739FF80551; Tue, 19 Sep 2023 09:12:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D21BDF801F5;
	Tue, 19 Sep 2023 09:12:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F706F8025A; Tue, 19 Sep 2023 09:12:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16F8DF80125
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 09:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16F8DF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=a8bbJsky
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695107525; x=1726643525;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IMi8TLKZzY0/jOc2BEEjzTRv1YJJIMS/dgGkYzh3trE=;
  b=a8bbJsky84JT++jsYSHnZwG3mgUfF21H9yjm7X3Ug526k3o9JcvQXxtj
   yqglOma8G2Pft/j0R8BECsNtVOWCcGSoqa2EUWCTJRwo2jFmJLBr+F28L
   6EqQLLQBr2ycoN1nzaX5ojCPsD5byyaS+/wNsNjKMMMMgDFo5K2nvrKn9
   6ZmSmhjbOL9hgUpPE+TDaDucE//TY3sDaQNgoCBOhrOqWAkQ08pCd0QLh
   E2RboXrDqhc5eyIY+5bE9vGH/v3HO7fwKaMlq/3sTlLJF7YTWuZGZ+EHG
   sRR43zYQrDShiivQ7SQ+cuB+rxjZL4Rdk4mC76aQ5xrhaIKwDESWwjXLO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382624935"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000";
   d="scan'208";a="382624935"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 00:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722755674"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000";
   d="scan'208";a="722755674"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.47.169])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 00:11:58 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: scarlett_gen2: Fix another
 -Wformat-truncation warning
Date: Tue, 19 Sep 2023 10:12:05 +0300
Message-ID: <20230919071205.10684-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VUDFRCF3G4AUVGWW2DYB53L7XVK2MR4R
X-Message-ID-Hash: VUDFRCF3G4AUVGWW2DYB53L7XVK2MR4R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VUDFRCF3G4AUVGWW2DYB53L7XVK2MR4R/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The recent enablement of -Wformat-truncation leads to a false-positive
warning for mixer_scarlett_gen2.c.

For suppressing the warning, replace snprintf() with scnprintf().
As stated in the above, truncation doesn't matter.

Fixes: 78bd8f5126f8 ("ALSA: usb-audio: scarlett_gen2: Fix -Wformat-truncation warning")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/usb/mixer_scarlett_gen2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index e0242b38b3f7..23aab1947958 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -3195,8 +3195,8 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 	/* Add input phantom controls */
 	if (info->inputs_per_phantom == 1) {
 		for (i = 0; i < info->phantom_count; i++) {
-			snprintf(s, sizeof(s), fmt, i + 1,
-				 "Phantom Power", "Switch");
+			scnprintf(s, sizeof(s), fmt, i + 1,
+				  "Phantom Power", "Switch");
 			err = scarlett2_add_new_ctl(
 				mixer, &scarlett2_phantom_ctl,
 				i, 1, s, &private->phantom_ctls[i]);
-- 
2.42.0

