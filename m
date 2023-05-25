Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C61BA710DCF
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 16:01:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04D751E8;
	Thu, 25 May 2023 16:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04D751E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685023265;
	bh=xXzINa+KY1GYF6BsZfYGeSWE4yfgT4jnHA1Il4Tdd00=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MMIhXtUzXHMYKCiGLg3nMddCgJjf9R3xrymu+Q110WNexSQdQT0WzFY9/vM03OQBp
	 iiILe0ciyfOIgqpCbSp/o19xAdJXCyEktz24WnVDaqtkIQ4LLMchmSa9KKCUs2ifXv
	 gv488AAW8zZEjtVHSUhRNCYGp3+ohfbMhGWgrv7E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C33CF80425; Thu, 25 May 2023 16:00:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A90E1F80249;
	Thu, 25 May 2023 16:00:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02BE2F80425; Thu, 25 May 2023 16:00:11 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D5C9F80053
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 16:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D5C9F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=eZxZiJcH
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34PBPhU1006105;
	Thu, 25 May 2023 09:00:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=eCUB3/UAkA9+tomxghvik6imKdz8/+ICfTEkpKQI8uY=;
 b=eZxZiJcHrmr+vZMK/3sW3OqEVSBH7BJDsmS4mTaGmw7CsbkcFPDBz2pVwto92Vd7KS6Y
 OuuDADJWsyE5vC2e0y9bhoZY+WVPV58pJtsNklLv3fYBOBPfZmAUtvF5wusR/p+4zAgU
 UFITRSVKq4vPfI8g5GQj4gTLi5A6E7Pb0ZE0RNba9sy5KDGywPuCb4Z1Fv1I05/+uCiJ
 7mu78YzUYQuVlL68sEEmPLQu41s1kfkiv041kIZfJqV1ezvdknLJnflRhtAvl4rDI6vG
 xwPOvRN2pLW5MHYs5+l4etPuIDrH31qxLXB01BXUZH6WvCGow0qNlXlphBeN8feFN9lv aA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qptmm6wbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 09:00:04 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 25 May
 2023 09:00:03 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 May 2023 09:00:03 -0500
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.43])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DBC6311D4;
	Thu, 25 May 2023 14:00:02 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH RESEND v1 0/3] Fixes and cleanup for CS35L41 HDA
Date: Thu, 25 May 2023 14:59:52 +0100
Message-ID: <20230525135955.2108140-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VhJfL1LOPdClfRFRPp5aDzebKY6BtOK9
X-Proofpoint-GUID: VhJfL1LOPdClfRFRPp5aDzebKY6BtOK9
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: QINSF4OIUGUZWJTW547O2B5T2N4GJNH7
X-Message-ID-Hash: QINSF4OIUGUZWJTW547O2B5T2N4GJNH7
X-MailFrom: prvs=0509245bd3=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QINSF4OIUGUZWJTW547O2B5T2N4GJNH7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Several minor issues were found during additional testing and
static analysis. These patches fix these minor issues.

Stefan Binding (3):
  ALSA: hda: cs35l41: Clean up Firmware Load Controls
  ALSA: hda: cs35l41: Fix endian conversions
  ALSA: hda/realtek: Delete cs35l41 component master during free

 sound/pci/hda/cs35l41_hda.c   | 40 ++++++++++++++++-------------------
 sound/pci/hda/patch_realtek.c |  2 ++
 2 files changed, 20 insertions(+), 22 deletions(-)

-- 
2.34.1

