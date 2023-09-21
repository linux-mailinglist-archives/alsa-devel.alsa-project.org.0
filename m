Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D477A95BD
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 18:32:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A17CE72;
	Thu, 21 Sep 2023 18:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A17CE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695313930;
	bh=tCrvIx9zsWY5gyoreqPlolVfyQ2ZjhA1xT0lzA27jdk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=o0zx2bPMItkrBs8Vh44EORBRYRZ1DxBeGd8OGClHPcCjvOX/KvfOsMhsYJ8cqEY0Z
	 Er+Ud5N1oQynk67DMjZaGwqpck+mUIpy96RrY2y9TwBPyCshjRReeWFs5mdYh1tJWT
	 EeOWD6hREzbWJfEYOgy8tJQ6JdxorAUyOjopUhNg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16C49F805BD; Thu, 21 Sep 2023 18:30:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16635F805B6;
	Thu, 21 Sep 2023 18:30:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CB52F801F5; Thu, 21 Sep 2023 18:30:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02BBAF801F5
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 18:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02BBAF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=OjnBaORp
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38LFWYi4009262;
	Thu, 21 Sep 2023 11:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=e
	3g90nWLjtNABPYClsTtG/D+b84N6Jv+agCdGIxC/PQ=; b=OjnBaORp20nxdEDIw
	1IFcyP1N+7dgbWF2zrp81Pjudw7RhyfYkzXz/WqcpFeshKRiSNKio5yxK+ei71FI
	bBrwEbO6iAOAglBRgvO4BOjLku+177AMmBIphmHSprkbMsi6W4UEY6rF7bCLkYr0
	IJY850T2NgdprR1IeqtE4qRPXseI3J94q4E6L3W5xriH/WorOdPV6klHeaMeBWj0
	vb3HIHWuSqyHgZxjfZaNb/qdZZiiZYFzG12ujmEYhNE1Hq+imYePQgrI4+U1N6cv
	XdbfXOdpe7XujiJr5nAap9VybszkVtl4kDzFc8VoNbH84p532SjMf2pI22NLRQB0
	ERX6w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t58shx0ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 11:28:58 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 21 Sep
 2023 17:28:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Thu, 21 Sep 2023 17:28:57 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.135])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BD7CE15B9;
	Thu, 21 Sep 2023 16:28:56 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v5 0/4] Support mute notifications for CS35L41 HDA
Date: Thu, 21 Sep 2023 17:28:45 +0100
Message-ID: <20230921162849.1988124-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: WjyAt0Wl6uRkGUrCaIW0-gF334ZDtVLI
X-Proofpoint-ORIG-GUID: WjyAt0Wl6uRkGUrCaIW0-gF334ZDtVLI
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: B5X5HCVOXTSA2PLB2455JHNQAFUD7WJB
X-Message-ID-Hash: B5X5HCVOXTSA2PLB2455JHNQAFUD7WJB
X-MailFrom: prvs=462875a41c=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B5X5HCVOXTSA2PLB2455JHNQAFUD7WJB/>
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

Changes since v2:
- Fixed compile issue when CONFIG_ACPI is missing

Changes since v3:
- Split first patch into 3 separate patches
- Ensure all acpi code is protected by check for CONFIG_ACPI in
realtek driver

Changes since v4:
- Rebase onto for-next branch

Stefan Binding (4):
  ALSA: hda: cs35l41: Add notification support into component binding
  ALSA: hda/realtek: Support ACPI Notification framework via component
    binding
  ALSA: hda: cs35l41: Support mute notifications for CS35L41 HDA
  ALSA: hda: cs35l41: Add read-only ALSA control for forced mute

 sound/pci/hda/cs35l41_hda.c   | 132 ++++++++++++++++++++++++++++++----
 sound/pci/hda/cs35l41_hda.h   |   3 +
 sound/pci/hda/hda_component.h |   4 ++
 sound/pci/hda/patch_realtek.c |  83 ++++++++++++++++++++-
 4 files changed, 208 insertions(+), 14 deletions(-)

-- 
2.34.1

