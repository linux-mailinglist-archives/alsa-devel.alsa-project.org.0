Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A228AF3E1
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 18:25:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CBDDF94;
	Tue, 23 Apr 2024 18:24:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CBDDF94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713889502;
	bh=/+Ngmq/dET1hRbcDzT+tPPqrN7PjBb3QJe6Y4gicig8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Uf2Oik8conHJKtVeU/+hCXFF3N+HlfNGS5I0JFFpYB6qq3qWweHUtnnwVfQ/uKGak
	 vEIkeFPqtPupT3fF/lsMhpjm6odI4LZQ/AwL6qnczhiknyontbN743LIg1w7y/kjER
	 oFq4i81j2KwAewYVkwYIPHW6VHjYfqk0wmkyfILU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFF1AF80570; Tue, 23 Apr 2024 18:24:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BC31F805A1;
	Tue, 23 Apr 2024 18:24:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CECA1F80423; Tue, 23 Apr 2024 18:24:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9078BF802E8
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 18:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9078BF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=PECz7F2M
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43N5gEEP003890;
	Tue, 23 Apr 2024 11:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=G
	JNcEy25j5fMRCp89ONq4zKfqjl5XmVRq/GtbPMf+60=; b=PECz7F2MtzUtpcDpf
	hP3F/a0n679BKHSX0MWAk/JXJJBdcGYCzuAT0iqL9htBoOsVq+3eo8HycVzx9jFc
	eJhMpihuAVd/BCtK0XZ6xQEmPtpVAnq+je9xn31LjEiuhD58OTP4rlYlGkYWULcD
	RteJyO/xNNMS8KUQKb6Wul8N8GfdH0B6hRjHAhUVA03HkSptSLBjMUCpwkDC68B2
	7VIP5xfmopuNRmJL/gIdGIumMY4oT3wJ0gVIBCRYgBOoTu7MNgyTy8x5kg5rX4cc
	jju6UOR83HKjha08Pek6QN3mR55nuQeNcI7X5CZC9E9lWvZfhQrdy01plY/jz/9V
	V0uNw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xmb3xttdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 11:23:09 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 23 Apr
 2024 17:23:07 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 23 Apr 2024 17:23:06 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.64.201])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 98769820243;
	Tue, 23 Apr 2024 16:23:06 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/2] Add support for Lenovo Thinkbook 13X
Date: Tue, 23 Apr 2024 17:23:01 +0100
Message-ID: <20240423162303.638211-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: xkSXrS6qGavWCwbf3HrUTDjbD150W0Od
X-Proofpoint-ORIG-GUID: xkSXrS6qGavWCwbf3HrUTDjbD150W0Od
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: MDFL7JFV2HKXY2S5SC2BRA5TXQ3A4QD4
X-Message-ID-Hash: MDFL7JFV2HKXY2S5SC2BRA5TXQ3A4QD4
X-MailFrom: prvs=1843615586=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MDFL7JFV2HKXY2S5SC2BRA5TXQ3A4QD4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This laptop does not contain _DSD required to support CS35L41 HDA.
To workaround this, add support for this laptop into the configuration
table in cs35l41_hda_property.c.
Also add the required entry into patch_realtek for this SSID.

Stefan Binding (2):
  ALSA: hda: cs35l41: Support Lenovo 13X laptop without _DSD
  ALSA: hda/realtek: Add quirks for Lenovo 13X

 sound/pci/hda/cs35l41_hda_property.c | 4 ++++
 sound/pci/hda/patch_realtek.c        | 2 ++
 2 files changed, 6 insertions(+)

-- 
2.34.1

