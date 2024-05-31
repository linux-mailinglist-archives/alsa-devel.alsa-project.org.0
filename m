Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B248D6582
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 17:15:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 977E0DEC;
	Fri, 31 May 2024 17:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 977E0DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717168556;
	bh=z9ks63cL85mhkLcOnvb3ahawtzRr8EIrpG1aeu2Bwrw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ioeS+SkY43Exm0csB/lUmBGKu5TdvcoIkaulz8TbfC1PeYtqzWl4n/LNilSib9vYK
	 p8fmvshxRmo9KYt8ZOGbwW8RdnOywr8at0x6NAB3gsML6FXuOKYz3HNpW3gz4QO32R
	 JV9es6PSJcfziwF2EBObQ6TQG1x+zu24lzSlUAoE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92CDDF80588; Fri, 31 May 2024 17:15:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73499F80589;
	Fri, 31 May 2024 17:15:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3F96F8051D; Fri, 31 May 2024 17:15:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 335B4F8003A
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 17:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 335B4F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=iTY6TGm1
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44VB0WSp017940;
	Fri, 31 May 2024 10:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Y4m3MsoMsbca1Nbl
	2qGve/cq5PJ1F3O1UChPigH7UYU=; b=iTY6TGm173K86uJPMzauwmZBBRUaT8ht
	vVDCHirFRueYxgEotoeze4uPnqIMGf4zSMw+LV2GSsZjxxr13xpJolO+iS+YNuyv
	6eBsrKU6L0Avdfpp4X5Z9LHIpz04nJk1M2mt1cLRXPGizcqY9ek/dqjKpXfsgmaC
	xkagPnSpCZqkgSoTYWLk32o4xrCjBQfksPbvO66Xf41DBtkmXtBk/GiBjYFxtnvb
	quJvZyy6YtvJ/OYGs4W5/NqnyvHqTPr3QdoLfbpMJ0GDtJGP70PhGJga1l3yWmGp
	fnXHLzdiiXXWkk6ud4IQLgO23XIGEIND9swo3JAGpZ/7SzI3mux/HA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ybcdhe0a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 10:15:11 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 16:15:09 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 31 May 2024 16:15:09 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.65.72])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3D1AA820244;
	Fri, 31 May 2024 15:15:09 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <soyer@irl.hu>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>, <kailang@realtek.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>
Subject: [PATCH 0/7] ALSA: hda: Improvements to hda_component
Date: Fri, 31 May 2024 16:14:02 +0100
Message-ID: <20240531151409.80284-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: GGAIf1TMiFTYMryBMBZzhBn6acOXJBAv
X-Proofpoint-ORIG-GUID: GGAIf1TMiFTYMryBMBZzhBn6acOXJBAv
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: Q4WGT5WMUJRVXLVD2VO52DAVLIMWG7HV
X-Message-ID-Hash: Q4WGT5WMUJRVXLVD2VO52DAVLIMWG7HV
X-MailFrom: prvs=3881dca93d=simont@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4WGT5WMUJRVXLVD2VO52DAVLIMWG7HV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series of patches makes sure that the existing consumers of
the infrastructure unbind their interface before they begin
destroying the driver, moves duplicated members from the
instanced component structures into a new parent structure and
introduces locking so that consumers of the interface do not use
stale data.

Simon Trimmer (7):
  ALSA: hda: cs35l56: Component should be unbound before deconstruction
  ALSA: hda: cs35l41: Component should be unbound before deconstruction
  ALSA: hda/tas2781: Component should be unbound before deconstruction
  ALSA: hda: hda_component: Introduce component parent structure
  ALSA: hda: hda_component: Change codecs to use component parent
    structure
  ALSA: hda: hda_component: Move codec field into the parent
  ALSA: hda: hda_component: Protect shared data with a mutex

 sound/pci/hda/cs35l41_hda.c     | 47 +++++++++++---------
 sound/pci/hda/cs35l56_hda.c     | 29 +++++++------
 sound/pci/hda/hda_component.c   | 76 ++++++++++++++++++++-------------
 sound/pci/hda/hda_component.h   | 48 ++++++++++++++-------
 sound/pci/hda/patch_realtek.c   | 17 ++++----
 sound/pci/hda/tas2781_hda_i2c.c | 37 ++++++++--------
 6 files changed, 148 insertions(+), 106 deletions(-)

-- 
2.34.1

