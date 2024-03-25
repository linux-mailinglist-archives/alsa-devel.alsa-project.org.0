Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFBD88A082
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 13:57:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 992A920C1;
	Mon, 25 Mar 2024 13:57:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 992A920C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711371458;
	bh=vHTfYqG4ttlfmit4J+f1bXKHp+iZTfQMp6UssK3nMvQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bDQ6IG7dyn6MfZmLwlo4jjba2n+6YzBJKx58Uq79NyCoO4KdJ2iZcZU34jN/dc7Y5
	 Pzy8JBuo4/901y8Z/6ZY5VS2MJRP0cxed1NK7EpsJAT16qF9zcCv8A5Ifx4vGxqHG9
	 ZBRp2D0gzqDxhYFUSHTTE35CyiVlulsyRS+Fq/8U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49C22F80589; Mon, 25 Mar 2024 13:57:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49C4FF80589;
	Mon, 25 Mar 2024 13:57:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 239C6F802DB; Mon, 25 Mar 2024 13:57:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C0EFF80093
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 13:56:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C0EFF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=koc5INfC
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42P3wbgB000927;
	Mon, 25 Mar 2024 07:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=z
	p3bZMiekrzYxJvESK8NH6XL++mao3yqz+biGabjL1o=; b=koc5INfCPcRq0QmmP
	54dsBOat7TT16OPdceLJTkArkPrveiJHjaHjbYtf2pbpEYe+/R3wHkVwt51x49TF
	9ZJrMMPsgkqPLHkqR8Dw79o06fKrwqVd9sIAeUIV0BGqZViNUJuRYwmPhFKNVucS
	ie4cbN75gmeNGdDEVdxFt9kgeiiM2ASfEh/v1RnblOhHFi7aO1dINo5qowbTrp7L
	men7ZW4uvPW4q+6kiGCI5f1fdxFbij1IffGvvT2G9gD9ayMnEbse9rd/vStLgVXI
	RHcHA1nXmvVbod2iNFPDgTn39NPa0jAMheSKMcDv3dRWUwykn+Fa0sRhwV7mGB/I
	r+6Wg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x1vfyba74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 07:56:52 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 25 Mar
 2024 12:56:50 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Mon, 25 Mar 2024 12:56:50 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 34164820241;
	Mon, 25 Mar 2024 12:56:50 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 0/3] ASoC: Use snd_ctl_find_id_mixer() instead of open-coding
Date: Mon, 25 Mar 2024 12:56:47 +0000
Message-ID: <20240325125650.213913-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: V4VlB94aEhddTj5L9IQ_UhW10IbygfEW
X-Proofpoint-GUID: V4VlB94aEhddTj5L9IQ_UhW10IbygfEW
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VOSICRDLNGO23VGUVENMUYXTYEW544YH
X-Message-ID-Hash: VOSICRDLNGO23VGUVENMUYXTYEW544YH
X-MailFrom: prvs=081491209a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOSICRDLNGO23VGUVENMUYXTYEW544YH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The first two patches change snd_soc_card_get_kcontrol() to use the
core snd_ctl_find_id_mixer() functionality instead of open-coding its
own list walk.

The last patch adds a KUnit test for this, which was tested on the
original and modified code.

Richard Fitzgerald (3):
  ALSA: control: Introduce snd_ctl_find_id_mixer_locked()
  ASoC: soc-card: Use snd_ctl_find_id_mixer() instead of open-coding
  ASoC: soc-card: Add KUnit test case for snd_soc_card_get_kcontrol

 include/sound/control.h   |  23 +++++
 sound/soc/Kconfig         |   8 ++
 sound/soc/Makefile        |   4 +
 sound/soc/soc-card-test.c | 191 ++++++++++++++++++++++++++++++++++++++
 sound/soc/soc-card.c      |  21 +----
 5 files changed, 230 insertions(+), 17 deletions(-)
 create mode 100644 sound/soc/soc-card-test.c

-- 
2.39.2

