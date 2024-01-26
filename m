Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D3883DEF6
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 17:42:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B8EE1FF;
	Fri, 26 Jan 2024 17:41:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B8EE1FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706287321;
	bh=XZQHuTD5FIDvTNUrjY9LUKe33xlKgiI+9IzhlBCtJaw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dLGWTMmiRhFxoG8ZyyBMnzdTUPzASuWpcssZ/LFfztILtKAU6NyaE/CEXLzEtaLbl
	 fnUAJu21tWucLuYWSEox6QyTkx4mEv+kB/gqVtU2GyNMOT36Q3mW/OSPkq+mzpAcVk
	 bOuvjOF27GXc3tEY08qP2uEsKYki+9vxKVsPKIAU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E39B4F805FB; Fri, 26 Jan 2024 17:40:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9728F80612;
	Fri, 26 Jan 2024 17:40:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36B03F805E1; Fri, 26 Jan 2024 17:40:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F1D3F80053
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 17:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F1D3F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hvZCoJXV
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QCpqG1002494;
	Fri, 26 Jan 2024 10:40:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=x
	+rYn+fBJ09p1znIq7mpKSHdq0YyMyl0BRtl4npcArQ=; b=hvZCoJXVt7ThopNOe
	Sp2lucdOaQay7chiQneS17GpIJBYrlJXb5SnAUgzUG1LahhM/SgPGZ8NvAh55Y8K
	kVqwgV2jB8c+zqPKQBpc6MemSLWm+xjFQT79P/njVo8mR5k5Stf1b9+Lia5jn9NH
	1ouwcDPVb5krc3Gh9BFHc3/0rHXj6Mwemg+DF2YCzl4+Wxbb3H1BZENvSABdDI2X
	XxDWDqat1qmbM24fYKR1aRRcPHGA7XNyFR2dd94WmdJlV4MzrqAZrdfF7AwNvhNW
	0bJ+DQxC3npHrS/Sn6QAbQ5h1qU7v1L9fXbu//sDjfd6dWr/AzJngSVjqMgX6GbU
	Vr2NA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmf9v1u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 10:40:16 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 16:40:14 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Fri, 26 Jan 2024 16:40:14 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (LONNG2L6RQ3.ad.cirrus.com
 [198.90.238.116])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 17FEF820246;
	Fri, 26 Jan 2024 16:40:14 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 0/4] Support HP Models without _DSD
Date: Fri, 26 Jan 2024 16:40:01 +0000
Message-ID: <20240126164005.367021-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3OGu4jccl7KovPSq68Yii0fAih0q1Dy9
X-Proofpoint-ORIG-GUID: 3OGu4jccl7KovPSq68Yii0fAih0q1Dy9
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7YTDJVDC6TZSXBPLF7RFNV3SZZH43OUQ
X-Message-ID-Hash: 7YTDJVDC6TZSXBPLF7RFNV3SZZH43OUQ
X-MailFrom: prvs=8755fd102d=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7YTDJVDC6TZSXBPLF7RFNV3SZZH43OUQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add Quirks and driver properties for Dell models.
Driver properties are required since these models do not have _DSD.
Some models require special handing for Speaker ID and cannot use
the configuration table to add properties.
Also fix an issue for Channel Index property, when set through the
configuration table, to use the same method as when loading _DSD
properties. This is needed for laptops with 4 amps where the
channels do not alternate.

Changes from v1:
- Rebase on latest for-next

Stefan Binding (4):
  ALSA: hda: cs35l41: Set Channel Index correctly when system is missing
    _DSD
  ALSA: hda: cs35l41: Support additional HP Envy Models
  ALSA: hda: cs35l41: Support HP models without _DSD using dual Speaker
    ID
  ALSA: hda/realtek: Add quirks for various HP ENVY models

 sound/pci/hda/cs35l41_hda_property.c | 90 +++++++++++++++++++++++-----
 sound/pci/hda/patch_realtek.c        | 40 +++++++++++++
 2 files changed, 114 insertions(+), 16 deletions(-)

-- 
2.34.1

