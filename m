Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA33B7A8991
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 18:35:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CA63852;
	Wed, 20 Sep 2023 18:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CA63852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695227703;
	bh=7hSRkKZyAQuLdmtG3IpGVabeDKXVkCKlHL2CDGkks5M=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KL45zWnSdn0XSFT57SDMrt665yALnxvvzuy4xyc9DD9uzhbbwwJG3aNLNaCd2qUgU
	 81lxeLROQWzZd7tDq9g/JeEHkP4KMr8BoRJCxz8v8eq+HscUxnR4FdOH9T4LNsHsHG
	 fUNBa+R+v4Nn9ceD7cleqzssVtin5AkPp0iueH9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42A65F80549; Wed, 20 Sep 2023 18:33:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C40F8F8025A;
	Wed, 20 Sep 2023 18:33:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE660F8047D; Wed, 20 Sep 2023 18:33:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C852EF80125
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 18:33:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C852EF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=KfC4n0lH
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38KFt6MX023727;
	Wed, 20 Sep 2023 11:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=/
	BLxOc/tkBmcLEyGBDmhNnSyPG+SVhl9atiXF3hiU6g=; b=KfC4n0lHvxP+ihzuD
	IkYtwTBsPjnPqZMaHby2Byy6Ny1bZhHhNPBb/f2V8/mS9y3i5OEJzAI97GpRFu2Q
	E4oaJ4KFn8BWUHdsC0itH5kOLNwSmmN/fvATnd0Ngaxm1mJfnKfNVY+O72ThkLVT
	YyM2A+BXkT/AsWxbKshA0KnqZ4dV2L3C0F3VANiiSzfjk1zRkq7M7vonBlQBSrXs
	9oXHPElq5MkRyE8xSAlN7M9tLvBp9/ihRQfsLDQNrBY/xyrMpq2oE9UM+uhOxgC5
	bt0t6e/MrUpD7A6/Bq50abi2ZozhQLxdgYSdui3kA0Ey8DCBWFT1rwowLtG2oley
	5Syqw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t58shvnd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 11:33:38 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 20 Sep
 2023 17:33:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Wed, 20 Sep 2023 17:33:36 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.135])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5D9FC458;
	Wed, 20 Sep 2023 16:33:36 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v4 0/4] Support mute notifications for CS35L41 HDA
Date: Wed, 20 Sep 2023 16:54:46 +0100
Message-ID: <20230920155450.576287-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: uF6gvtROUZ6B4XvAkqDpBQLy8315B14s
X-Proofpoint-ORIG-GUID: uF6gvtROUZ6B4XvAkqDpBQLy8315B14s
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZYASISQYJDUQ2BBAG7UHCTZ5SMKHO63I
X-Message-ID-Hash: ZYASISQYJDUQ2BBAG7UHCTZ5SMKHO63I
X-MailFrom: prvs=462798be35=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZYASISQYJDUQ2BBAG7UHCTZ5SMKHO63I/>
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

