Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2997A7A668E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 16:24:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A01D2DF6;
	Tue, 19 Sep 2023 16:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A01D2DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695133447;
	bh=d58MUhjRCjtL9ZztB2Xnj5mVt2U3/Jl7UR+SvxuBxJA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k0LgEzHJsMEvRB/EqK6TXGjizYspfOiw9RvB0OrgfeDUzCLkiS7SgmJcVZYjMygcB
	 3K7ShPjJ8WuIs48/apdEgkBM87feanfZG0h949bKn3/pH2caJ7o95e/V+Oie2AqTiX
	 QlByN74sxWc//6k7YC1bKKWiCk9Ud36Hr8uOfOzA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 150E6F80494; Tue, 19 Sep 2023 16:23:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75CB6F8025A;
	Tue, 19 Sep 2023 16:23:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FBB3F8047D; Tue, 19 Sep 2023 16:23:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61FB7F80551
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 16:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61FB7F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=rABvyKCR
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38J4KMPD022193;
	Tue, 19 Sep 2023 09:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=y
	mCJde178UwL4TYnW7s7IyEfWXED9q+z5lMLNLuhi3A=; b=rABvyKCR5r1jR97Q4
	BeNNTwSLu/LgjfN+q7Lx69h3dJSeSC2qZNbNIQYxgPtuyFSX0Ikn+14d7myfs+UJ
	tBYfeax4dAt71X6oR/n9XSK55T08fNAm8grc9yBRi3ypMlwpB5wVBT24oPkirBix
	YktCYnEDOGwg2MoxKRQLANYHBQlMa5DA7WLWTqGlLhfDqIV7ndmxKwC/fxJK8laO
	4fL4DBOtyCOutmW0sVaFc6s16AZplGNXSfn5UgJ0j0GvVGY0NWK6ck+d8fTB49zK
	SiECPNIJxbc7Lk/FOP+eqYJlG/kgF87ajuHKyIe2VGnieav4AOgfRv3cT+PybzF9
	fGWMg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t59ry3y7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 09:22:52 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 19 Sep
 2023 15:22:49 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 19 Sep 2023 15:22:49 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.135])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B11C811AB;
	Tue, 19 Sep 2023 14:22:49 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v3 0/2] Support mute notifications for CS35L41 HDA
Date: Tue, 19 Sep 2023 15:22:38 +0100
Message-ID: <20230919142240.467682-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sBpAx-564mdkuf1hDpvQdlgRriHoT1e_
X-Proofpoint-ORIG-GUID: sBpAx-564mdkuf1hDpvQdlgRriHoT1e_
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: MTKHEEATUR77LLPCW4X6SBHPDYRROUYW
X-Message-ID-Hash: MTKHEEATUR77LLPCW4X6SBHPDYRROUYW
X-MailFrom: prvs=4626bb6a22=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MTKHEEATUR77LLPCW4X6SBHPDYRROUYW/>
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

Stefan Binding (1):
  ALSA: hda: cs35l41: Add read-only ALSA control for forced mute

Vitaly Rodionov (1):
  ALSA: hda: cs35l41: Support mute notifications for CS35L41 HDA

 sound/pci/hda/cs35l41_hda.c   | 132 ++++++++++++++++++++++++++++++----
 sound/pci/hda/cs35l41_hda.h   |   3 +
 sound/pci/hda/hda_component.h |   4 ++
 sound/pci/hda/patch_realtek.c |  85 +++++++++++++++++++++-
 4 files changed, 210 insertions(+), 14 deletions(-)

-- 
2.34.1

