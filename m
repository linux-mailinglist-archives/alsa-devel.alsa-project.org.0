Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9E28D8018
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2024 12:36:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAAE5846;
	Mon,  3 Jun 2024 12:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAAE5846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717410973;
	bh=baScvVV423t4e+VkQ5YMVh9kY4BKIx6DRtRf9/Ehr8Y=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=N0AZnZmHjUsnQDF3em4Svdi0NWsZ3PeIlparjb9mOyJJprQYk3Bosr+ejrhKdo0SL
	 +2VB0Xd4xf9YaWD96ZTI/IS89JNBQEEwzD67a/0jZLxG1yEZqBmoXSIYpnyL9i05bX
	 AkJX9MZPrFxh3kHLRVE9mIsHO/FDdKQ/UP+mC8iw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E749F805A9; Mon,  3 Jun 2024 12:35:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97FEFF804FF;
	Mon,  3 Jun 2024 12:35:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E96AF804E5; Mon,  3 Jun 2024 12:35:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF0CAF800AC
	for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2024 12:35:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF0CAF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=H1LEL9pp
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45350SKr024505;
	Mon, 3 Jun 2024 05:35:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=W4exEjotWKI1CI+T
	j8zwikkt7tJTdgTM16vK6Pqc+Sk=; b=H1LEL9ppJrnwiSBJ04eaMI9a5oXClPDJ
	7Q4nn7o1XL8NaWCBVFVFklT9ZFy0tSrMJoNdI1Kty2sv+RTCTzTUQU1pVo1n2YHz
	XO++C6I9aIucrFXE9ebPYQF24Nn88Kac7Ayv/eK8lh/6OiHikF70gIIUp2CQk/ye
	eHYUESdRa5mo/El3BC+TgylVmUDS4f1p5VLyx2aE5dJDE6TlTEcQk9hQ9vHKmZEE
	85IIp/8DkloXZWsY0J1ityXjBza6nNAYBICjvoCJnkbKjMFlfTsMtdNVxJFSwnGd
	MszstPp896oJhjY62BVAP9cD1spFI/cwV4AwUgkHbd1pKbCRnQFPVw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yg02hhdrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 05:35:28 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 11:35:26 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 3 Jun 2024 11:35:26 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.64.166])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id CD11A820249;
	Mon,  3 Jun 2024 10:35:25 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <soyer@irl.hu>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>, <kailang@realtek.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>
Subject: [PATCH v2 0/7] ALSA: hda: Improvements to hda_component
Date: Mon, 3 Jun 2024 11:35:17 +0100
Message-ID: <20240603103524.32442-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0e99rMdBQF0miLEo9vYmj9jHyiB1CfhF
X-Proofpoint-ORIG-GUID: 0e99rMdBQF0miLEo9vYmj9jHyiB1CfhF
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3H6XEHN7HNYBHW6K5UFTNEWHU2KY4Q6A
X-Message-ID-Hash: 3H6XEHN7HNYBHW6K5UFTNEWHU2KY4Q6A
X-MailFrom: prvs=388426604e=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3H6XEHN7HNYBHW6K5UFTNEWHU2KY4Q6A/>
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

v2:
 - Correct application of sizeof to pointer flagged by kernel test robot

Simon Trimmer (7):
  ALSA: hda: cs35l56: Component should be unbound before deconstruction
  ALSA: hda: cs35l41: Component should be unbound before deconstruction
  ALSA: hda/tas2781: Component should be unbound before deconstruction
  ALSA: hda: hda_component: Introduce component parent structure
  ALSA: hda: hda_component: Change codecs to use component parent
    structure
  ALSA: hda: hda_component: Move codec field into the parent
  ALSA: hda: hda_component: Protect shared data with a mutex

 sound/pci/hda/cs35l41_hda.c     | 47 ++++++++++++---------
 sound/pci/hda/cs35l56_hda.c     | 29 +++++++------
 sound/pci/hda/hda_component.c   | 75 ++++++++++++++++++++-------------
 sound/pci/hda/hda_component.h   | 48 ++++++++++++++-------
 sound/pci/hda/patch_realtek.c   | 17 ++++----
 sound/pci/hda/tas2781_hda_i2c.c | 37 ++++++++--------
 6 files changed, 147 insertions(+), 106 deletions(-)

-- 
2.34.1

