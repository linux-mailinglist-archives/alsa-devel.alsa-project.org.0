Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E4C75C7C3
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 15:25:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AF3C1F3;
	Fri, 21 Jul 2023 15:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AF3C1F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689945946;
	bh=Q2uZnM5Io0qoWetB+qKh5+ZvbdOLgSsvqj6l2Nt5CqM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h+zYQuewr7EVGED9GYpee1/Y8l5wiUehstA+6lEimLKjaj8d6DM2kEbA8mOo0W42n
	 MwdVP5RDR6RvtcpKqeNjaU8MYqD6h7vYGix6/08uS5bOxro6Tb+sg5JsQd1R6DKJrd
	 kShmPQEDyGbwWroKFMqlLbyGiRiD6VML4nGpwa5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6934F805F1; Fri, 21 Jul 2023 15:22:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4147CF805EC;
	Fri, 21 Jul 2023 15:22:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9E98F80535; Fri, 21 Jul 2023 15:22:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D8CBF80544
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 15:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D8CBF80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=DEniDHUs
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36LBeOqN003184;
	Fri, 21 Jul 2023 08:21:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=dyx+8JEfgh2peLe8efZxTUFVMObXdsP7O0pAQJQQ1+c=; b=
	DEniDHUscLuozK/jFxPvCeMOWLy+6cFWYePcBAtBwUvXvWe/YlB9aOz96uWaK8Fs
	8QtBhCaBIbKaSjfYFornrbISQ0XxeA/uRQ3JhBIhSlrb9qDltbEXYFnInKJYPe6C
	0ybCyrkYarxakAljFrpJSFJplIKCL8PXweompEfR+RVO2HIsi4zj16+mg7LTYAPP
	SbdO+AkZC9CcARcpcvxdI8oOLMDw7a+0Vr2XCAt4pd1nnHk3BreVViIkV9OmqVV6
	LrfpsmqsTUEdZ2G62LsDU+dDwvfSIIrQCre9zZz9NTCdDTHRf3EskOXoTelXyz9h
	3j2phDDrlKICL1jrOLyD/g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rus62y4hx-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 08:21:30 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 14:21:27 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 21 Jul 2023 14:21:27 +0100
Received: from work-debian.ad.cirrus.com (unknown [198.61.64.172])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 942B515B6;
	Fri, 21 Jul 2023 13:21:27 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v5 10/11] ALSA: hda: Fix missing header dependencies
Date: Fri, 21 Jul 2023 14:21:19 +0100
Message-ID: <20230721132120.5523-11-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230721132120.5523-1-rf@opensource.cirrus.com>
References: <20230721132120.5523-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6BJcp0nlH4utn8g5JO5Yq_pdI1LrUsCy
X-Proofpoint-ORIG-GUID: 6BJcp0nlH4utn8g5JO5Yq_pdI1LrUsCy
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: N53BAH77W4DEMTNZOHZRDGEYGOBH4L2S
X-Message-ID-Hash: N53BAH77W4DEMTNZOHZRDGEYGOBH4L2S
X-MailFrom: prvs=25664d1566=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N53BAH77W4DEMTNZOHZRDGEYGOBH4L2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add #includes of dependencies into hda_auto_parser.h and hda_generic.h

hda_auto_parser.h uses definitions in hda_local.h.

hda_generic.h uses definitions in hda_local.h and hda_auto_parser.h.
It also references struct hda_jack_callback, but only as a pointer.
This has been forward-declared so hda_jack.h only needs to be
included in source that actually uses it.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_auto_parser.h | 2 ++
 sound/pci/hda/hda_generic.h     | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/sound/pci/hda/hda_auto_parser.h b/sound/pci/hda/hda_auto_parser.h
index df63d66af1ab..579b11beac71 100644
--- a/sound/pci/hda/hda_auto_parser.h
+++ b/sound/pci/hda/hda_auto_parser.h
@@ -8,6 +8,8 @@
 #ifndef __SOUND_HDA_AUTO_PARSER_H
 #define __SOUND_HDA_AUTO_PARSER_H
 
+#include "hda_local.h"
+
 /*
  * Helper for automatic pin configuration
  */
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index 34eba40cc6e6..a8eea8367629 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -9,6 +9,9 @@
 #define __SOUND_HDA_GENERIC_H
 
 #include <linux/leds.h>
+#include "hda_auto_parser.h"
+
+struct hda_jack_callback;
 
 /* table entry for multi-io paths */
 struct hda_multi_io {
-- 
2.30.2

