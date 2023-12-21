Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF6381B778
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 14:26:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 342D6868;
	Thu, 21 Dec 2023 14:25:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 342D6868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703165161;
	bh=1Q1uxOJIN0SiwoWgOB+MYQ8fiuqGv7hHI6tIVvGHb9E=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FGH3ygTeXkrbR7v7mS5YmG0prgvmc3iyt5J+yiUUT66QR8qx/jB/Jg6f+4kzokPsz
	 oPgsCIT7cKBgBD94UkuMyxEKaEea0dBdwE7mx8jZ8kWxyU4exNJ2YBIFlwxL7GetXP
	 ERkfko1o8OAuDHl/F1dWSP42SK/hl85+MjRbHf00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 306FFF80431; Thu, 21 Dec 2023 14:25:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EA7CF80431;
	Thu, 21 Dec 2023 14:25:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3536F80425; Thu, 21 Dec 2023 14:25:34 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 44CD4F800BD
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 14:25:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44CD4F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ExADNAR8
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BL5NG1J008651;
	Thu, 21 Dec 2023 07:25:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=R
	9Vcx1BGMedfOcQkq5dpA8yP6hRgKWAhlUo8mB4sxkU=; b=ExADNAR8nUWukfF2Z
	SIS24CTLNzCoY1r1svbPwRkIHtUTgOFQv5C2lDfYksfC2W8vMajuESNC+UP/j6ve
	de+FsmLkdBjWCRLbRhF6iGjShBRcMlSY5ipE4Gf9K8+a/iSVQpCp9yzKkLPkFRug
	oJX1Ukm2TI/dzfc8W2JNxaPOS2qdxJ56ihRHiyidXrR/BZVQ8sTNcghcXgAcGHHd
	DvF9tUueEhWo4TFZtREXvXRdI101GrSWXOupKngfihUXKqweLX4eUG8pQFEUH6C7
	YzkLxDdNm/wMjxKjEf8Wkp1vcLUsFRpXdf7QsboWEye0z47OA+52ebbvfoMHlG+J
	2441A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3v196nfar8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Dec 2023 07:25:26 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Dec
 2023 13:25:25 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Thu, 21 Dec 2023 13:25:25 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.77])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C2A8146B;
	Thu, 21 Dec 2023 13:25:24 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 0/3] Support Dell models without _DSD
Date: Thu, 21 Dec 2023 13:25:15 +0000
Message-ID: <20231221132518.3213-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: RKoh7Qq2S4JajAa1XOR5oYenDYZ5N-Jw
X-Proofpoint-GUID: RKoh7Qq2S4JajAa1XOR5oYenDYZ5N-Jw
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: C5NLUIUWPRYPJ4BDSEQ2BDFPRRS477FL
X-Message-ID-Hash: C5NLUIUWPRYPJ4BDSEQ2BDFPRRS477FL
X-MailFrom: prvs=7719b567d4=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C5NLUIUWPRYPJ4BDSEQ2BDFPRRS477FL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add Quirks and driver properties for Dell models.
Driver properties are required since these models do not have _DSD.
Additionally, some laptops, including some of these, have an issue
with their BIOS which causes the SPI speed to be set too slow.
To ensure a decent performance for laptops with this slow speed,
disable firmware loading. Running without firmware results in lower
volume.

Changes since v1:
- Rebased onto for-linus

Stefan Binding (3):
  ALSA: hda: cs35l41: Support additional Dell models without _DSD
  ALSA: hda: cs35l41: Prevent firmware load if SPI speed too low
  ALSA: hda/realtek: Add quirks for Dell models

 sound/pci/hda/cs35l41_hda.c          | 25 ++++++++--
 sound/pci/hda/cs35l41_hda.h          | 12 ++++-
 sound/pci/hda/cs35l41_hda_i2c.c      |  2 +-
 sound/pci/hda/cs35l41_hda_property.c | 74 +++++++++++++++-------------
 sound/pci/hda/cs35l41_hda_spi.c      |  2 +-
 sound/pci/hda/patch_realtek.c        | 13 +++++
 6 files changed, 87 insertions(+), 41 deletions(-)

-- 
2.34.1

