Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 079347EC874
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 17:22:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E408829;
	Wed, 15 Nov 2023 17:22:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E408829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700065377;
	bh=DM6JiGwt3rc1Dwff6j4kVpfkW/B0En6TmTbtoFRgsZE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UhtfLp0VDhi58cR6lfHAB90duA+2FmaIl3qk014HZMAzS1U91aqnO5MoO4wbtbo7E
	 w0DUhf6tCRZ6wIMMznq/yD6/mrpxES7YG8FcA2dLQ2WICm+uSfZdOQqRI5rGpaIdvS
	 FZPioXnKMvBsCXzhAQ34m/7LvGM0VOVyO4jDZyqw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD0E4F80557; Wed, 15 Nov 2023 17:21:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66B4FF8016E;
	Wed, 15 Nov 2023 17:21:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B430FF80249; Wed, 15 Nov 2023 17:21:35 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D80A8F80166
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 17:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D80A8F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=bV9yySWd
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AF8RK0C026572;
	Wed, 15 Nov 2023 10:21:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=O
	fI6CrE/9UJCZK4OYkAo2fAbStCJyzA/dUGw6hjQ0Wc=; b=bV9yySWdeRy2eRe45
	P476pDWaLZKvLfl4MM9Pm8lAAmYioCynF8tZbxB8PjFwi/eIq+HGQQD7H4o3o60d
	jWNOc87dQkiLHKt1YtFOHe5hSsbHi6IanOoQmYpn9PwCOW0vilRCW9AYtxb1Zjxx
	gR5sjle83yzFrTddFIiHzO+cERT1PFdDaCn/dgaL66tJN+7L5aqDmBa/RHbJsGy6
	aHNH5Wm0OR/aQBLgrU6oJIGRLNW/uamIoIzQif85e7G0yOMGz4FydtnHu+zUDSr8
	wmiQy304HpJhSNiyQNaPTSWM+M7DZDaouWZZWl0loInTV6NI6kTAjwB10N6gzMQN
	rVfKg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ua6wpcxwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 10:21:26 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 15 Nov
 2023 16:21:25 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Wed, 15 Nov 2023 16:21:25 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.232])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C081946B;
	Wed, 15 Nov 2023 16:21:24 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/2] Add quirks for various HP and ASUS laptops
Date: Wed, 15 Nov 2023 16:21:14 +0000
Message-ID: <20231115162116.494968-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: pCrOX24X6tdxHldjdOo2IO8trr4rIyBd
X-Proofpoint-ORIG-GUID: pCrOX24X6tdxHldjdOo2IO8trr4rIyBd
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: W7GBDUCKTNQ6PBGWTHYBWZLBLGWFIFTN
X-Message-ID-Hash: W7GBDUCKTNQ6PBGWTHYBWZLBLGWFIFTN
X-MailFrom: prvs=66833364fe=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7GBDUCKTNQ6PBGWTHYBWZLBLGWFIFTN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for CS35L41 HDA for ASUS Zenbook laptops and HP G11
laptops.

Stefan Binding (2):
  ALSA: hda/realtek: Add quirks for ASUS 2024 Zenbooks
  ALSA: hda/realtek: Add quirks for HP Laptops

 sound/pci/hda/patch_realtek.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.34.1

