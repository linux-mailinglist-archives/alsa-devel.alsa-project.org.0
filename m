Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAFB7987FF
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 15:36:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CA859F6;
	Fri,  8 Sep 2023 15:35:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CA859F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694180194;
	bh=w+MBc3TfpJVwgqj9QM4NNqdR1LNJMBimR+jcHQsOhUE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bqgLiE4UbRFz1resgKL9lwiY528p/gNL6tuNQ/KfKrs+98+A5l4y07JOGLqedXa+X
	 13RyFNqPC/oN82R5IAqW9xX/iSlteJAiY0zy5kzzNm9y3OrjeLjJgozyAek3cZ0hSU
	 +iHgojQsQcRYUkcbZwRcJ7dF5PZyS0mOVrEb0S6I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F346FF8056F; Fri,  8 Sep 2023 15:34:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8940F8055B;
	Fri,  8 Sep 2023 15:34:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF57DF804F3; Fri,  8 Sep 2023 15:34:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A300F8047D
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 15:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A300F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=TzAcFcrs
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 388DVCU1024816;
	Fri, 8 Sep 2023 08:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=7
	Q1bMdFF8qssB8HbjyNHSdSroHRT5TGY85PxL9LdwiA=; b=TzAcFcrsuHgE4yGiD
	E8V5H7arzjx9fbO0M5zZnXG5XUgDyDMAWoQIx4cStt5qRUBo6JCJqw1cK1lqY2Nd
	6wu2UKbPMStQh6ugjpmjNh8QNCSdHBkC7xfWsIzmBbH0hYAT1pFodpZBf6FzUInT
	E+9lRy5ppq2Modqf5QOFBVQAB47MiDqkrSKyHed674H05ewBu3lovSWK30GBCZYk
	isQzLDCThfoQEKCcGbS5jx9n8xBka/2eq3SbSgqBNBdopszXJTXxP41aJprOGCnB
	w7haC+rJIDgfII4HQxgaOdPqjpryEYYNSLMHksJc5r5JxXesm4Aqrqu1tJmNBDRq
	7rvhQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t04h1g089-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 08:34:39 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 8 Sep
 2023 14:34:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Fri, 8 Sep 2023 14:34:30 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.124])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1CF5946B;
	Fri,  8 Sep 2023 13:34:30 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v2 0/2] Support mute notifications for CS35L41 HDA
Date: Fri, 8 Sep 2023 14:34:19 +0100
Message-ID: <20230908133421.2483508-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: gGxLBr66fjl9RbikcD5VzG6UR9hTq_Fs
X-Proofpoint-GUID: gGxLBr66fjl9RbikcD5VzG6UR9hTq_Fs
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7BF3TWVBXYY72UTCCLPOTZW6JAJERAOJ
X-Message-ID-Hash: 7BF3TWVBXYY72UTCCLPOTZW6JAJERAOJ
X-MailFrom: prvs=461552e33b=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7BF3TWVBXYY72UTCCLPOTZW6JAJERAOJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some systems use a special keyboard shortcut to mute speaker audio.
On systems using CS35L41 HDA which have this shortcut, add a
mechanism which uses ACPI notifications to determine when the
shortcut is pressed, and then mute the amps inside the driver.

Since this is not a normal mute mechanism, it does not go through
userspace. To allow userspace to be able to track this special
state, add an ALSA control which tracks the state of this forced
mute

Stefan Binding (1):
  ALSA: hda: cs35l41: Add read-only ALSA control for forced mute

Vitaly Rodionov (1):
  ALSA: hda: cs35l41: Support mute notifications for CS35L41 HDA

 sound/pci/hda/cs35l41_hda.c   | 132 ++++++++++++++++++++++++++++++----
 sound/pci/hda/cs35l41_hda.h   |   3 +
 sound/pci/hda/hda_component.h |   4 ++
 sound/pci/hda/patch_realtek.c |  57 ++++++++++++++-
 4 files changed, 182 insertions(+), 14 deletions(-)

-- 
2.34.1

