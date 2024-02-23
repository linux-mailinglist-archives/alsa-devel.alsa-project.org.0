Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 438FD861606
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 16:39:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 938EA846;
	Fri, 23 Feb 2024 16:39:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 938EA846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708702798;
	bh=dC5mGTNTyyY3AWeZcJmn6etsgLzZ5Hz6FQdLDaOGHdA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MbT6MsqcrjUbwhqPW5Hsa4amSARLqoa41p/pZ80OgyuxmKAmy2KKVPYgQ7aXOWVXx
	 vVzk0kPmYdOf0TX2e/KKlJ+puZOozmSygMm9u3Fb2l+MwnXsrA6ISFY70Vk9afgwE3
	 o2kQcGNmUhPDPzNvgKS2yUEWEVrerDO+I39KvLlI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83283F80104; Fri, 23 Feb 2024 16:39:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 229F1F805A0;
	Fri, 23 Feb 2024 16:39:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1299F80570; Fri, 23 Feb 2024 16:39:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 924F8F800EE
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 16:39:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 924F8F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=JtEzCVL5
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N8gUBS005505;
	Fri, 23 Feb 2024 09:39:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=C
	h7NU+9X8vJmYJdz6CxoEcg5BbpkVmYbEwAr2DuQhBU=; b=JtEzCVL5SjrHWyJqX
	ink/zbuE2+SjAQRASZQBZY67wrKG5cpMAdJ6VZxymBCJg2uLmYBUsKk+pZyq/WrQ
	BEewAz+b45Z8kM/LxVDUKNR3cmSpmaHJVc4poM5EQhsq7HKxtZ0sYwSGD7pQR7D0
	iDRadZRc7iy7YHnRq4Hmz37YGEfZGSno67JyRSW2gblah6aBDEhRxbXOJNgtpTM1
	uIiv1DhkZ0gZRyh87Bv8Fjd3MXDGMRT5HQgwB/uQBbbc62R8b8TQqmM+BVGCesFp
	dcxa+DjUWIZwUV3PuZhVBn+w/pMBjFprwMfIzA8sn0b7l3QKgUzPQqUFlBv11mSS
	50x1w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wd205m5pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 09:39:12 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 15:39:10 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Fri, 23 Feb 2024 15:39:10 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 61BCD820246;
	Fri, 23 Feb 2024 15:39:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH v2 0/6] ALSA: cs35l56: Apply calibration from EFI
Date: Fri, 23 Feb 2024 15:39:04 +0000
Message-ID: <20240223153910.2063698-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 30I-KLe2jTA_RYiFaB2G9pall02cT_eX
X-Proofpoint-GUID: 30I-KLe2jTA_RYiFaB2G9pall02cT_eX
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XZF6T7RKZSWMHSL7VUVAPO5DQDF6IO26
X-Message-ID-Hash: XZF6T7RKZSWMHSL7VUVAPO5DQDF6IO26
X-MailFrom: prvs=97835e8ec7=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XZF6T7RKZSWMHSL7VUVAPO5DQDF6IO26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Factory calibration of the speakers stores the calibration information
into an EFI variable.

This set of patches adds support for applying speaker calibration
data from that EFI variable.

The HDA patch (#5) depends on the ASoC patches #2 and #3

Patch #6 is a KUnit test for the new cs-amp-lib library.

Richard Fitzgerald (6):
  ASoC: wm_adsp: Add wm_adsp_start() and wm_adsp_stop()
  ASoC: cs-amp-lib: Add helpers for factory calibration data
  ASoC: cs35l56: Add helper functions for amp calibration
  ASoC: cs35l56: Apply amp calibration from EFI data
  ALSA: hda: cs35l56: Apply amp calibration from EFI data
  ASoC: cs-amp-lib: Add KUnit test for calibration helpers

 include/sound/cs-amp-lib.h         |  66 +++
 include/sound/cs35l56.h            |  10 +
 sound/pci/hda/Kconfig              |   2 +
 sound/pci/hda/cs35l56_hda.c        |  39 +-
 sound/soc/codecs/Kconfig           |  17 +
 sound/soc/codecs/Makefile          |   4 +
 sound/soc/codecs/cs-amp-lib-test.c | 715 +++++++++++++++++++++++++++++
 sound/soc/codecs/cs-amp-lib.c      | 277 +++++++++++
 sound/soc/codecs/cs35l56-sdw.c     |  20 +
 sound/soc/codecs/cs35l56-shared.c  |  83 ++++
 sound/soc/codecs/cs35l56.c         |  44 +-
 sound/soc/codecs/wm_adsp.c         |  27 +-
 sound/soc/codecs/wm_adsp.h         |   2 +
 13 files changed, 1287 insertions(+), 19 deletions(-)
 create mode 100644 include/sound/cs-amp-lib.h
 create mode 100644 sound/soc/codecs/cs-amp-lib-test.c
 create mode 100644 sound/soc/codecs/cs-amp-lib.c

-- 
2.30.2

