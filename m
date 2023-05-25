Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 790E57110FE
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 18:29:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81A7383E;
	Thu, 25 May 2023 18:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81A7383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685032187;
	bh=16YHkaRO/ypOuzNLGOkApUYTHwnPOD+HQGOE+/Yc4C8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d9/6pKQVQe0TNGAmXwJ17Orrho64fyfJzfbyRjVbrC/PrhKVh4ldnFdJNgsi62APJ
	 P838E1PNOjZJA/GEWyQF8u6bE0knrEDD63lEtagFscq0S3rDv6fLy1sQtipDi8b72N
	 nQm6YmNZ8GFAUzTe1GAzhsblqBd5lX111Un8vh0M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B01B9F805E2; Thu, 25 May 2023 18:27:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17223F80549;
	Thu, 25 May 2023 18:27:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47E1FF805A8; Thu, 25 May 2023 18:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 109BBF80548
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 18:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 109BBF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Oclw2NAZ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34PEEWVH026032;
	Thu, 25 May 2023 11:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=KBIQkBTpPs9dMkt+aC+6iuTHRtDG89mSTGRvAWzKXRU=;
 b=Oclw2NAZXXUiCJfKNIV19UrQQpswNtoIDmeFp8wSjmP1bsxyWgdvogvDdQw97+TL5oYf
 TJg/seUMb15snu13rQJ5J8g6qX7PqOkU1P7tHDmc7/ohosxltjv+lZMXarRxokz2rWCF
 bmDs78tGCAuXvY1SIoOQXGO6NySk5XJKdSD+Zs6ls05L2z1dweP1dUjJR8dBUjlOTY4Y
 ilhFb3QeqFZoTUJNjXdOHI7ZS7XP0JHSQ7NBxhBUbuHnVNY6bsWTaFWGZB7xBOZJUzch
 nKQaSW8YSoOjQNKnXMd7sDJ+C35WmRvk5ItsP3pIDD49vNufkAFpM2IOZIlvSsPkmHog GA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qptmm74vu-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 11:26:29 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 25 May
 2023 11:26:26 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 May 2023 11:26:26 -0500
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.166])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 31C7A15B4;
	Thu, 25 May 2023 16:26:26 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH v2 10/12] ALSA: hda: Fix missing header dependencies
Date: Thu, 25 May 2023 17:26:16 +0100
Message-ID: <20230525162618.20146-11-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525162618.20146-1-rf@opensource.cirrus.com>
References: <20230525162618.20146-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Jc-rxdRs1c5xknnnMscMdzsei9B7Z2EM
X-Proofpoint-GUID: Jc-rxdRs1c5xknnnMscMdzsei9B7Z2EM
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 55PYAGXD2PLMMBXI3OHVROOLPEUQZZDR
X-Message-ID-Hash: 55PYAGXD2PLMMBXI3OHVROOLPEUQZZDR
X-MailFrom: prvs=050971c6a2=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/55PYAGXD2PLMMBXI3OHVROOLPEUQZZDR/>
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

