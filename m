Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D97723FBF
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 12:36:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93D893E7;
	Tue,  6 Jun 2023 12:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93D893E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686047804;
	bh=smrKq+mu4WtMJi0ovQTBpKK1kP5McAsQ6w57Yow9x9A=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HpjpTeGzhgJzikf6ByDzrjSlGiFraSO4xtXb0Ld+i4Ho4rKwm0SKwhxZYwr9k7n1n
	 chTMPfVsDz6XHF6stVZJOXSQeEC5BJ0F5L3mAx54suJ7i0HvEy17yLd1xyhx2ygkhH
	 sPZIGKiGvrNbKl+K0lVvEsAMuuCpgJD4yqpCpbpU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65388F8055A; Tue,  6 Jun 2023 12:35:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5819F80549;
	Tue,  6 Jun 2023 12:35:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A022F80290; Tue,  6 Jun 2023 12:34:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BEA2F80155
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 12:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BEA2F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fBMSNFtJ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3565N8jI006095;
	Tue, 6 Jun 2023 05:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=hXdwTd2fuvfqZGo4qjG52aP1P7Vq04LCvv+OwS612IE=;
 b=fBMSNFtJUc9buHpvW7rUEdq2+dYBhDToUW7y7qtVlNkPi1GejLaJwV/oJZtYMHdw/e8O
 oGft8w9S16cRe1tOEBW4fxT3K9eXybKqTTUyYRfmSdIPls2mF18CtnIsqbtjWnIRGI8n
 C9S3PFrItTrNatYDSLHjp87GyACejKKZUrmue8mplzm/bu3mkIzOwtLCng7yHLD8zU00
 d6UbWfibOPiSSD+xLjyw5739yQUH6n8IynMMT14+5SnHq947A5gfn3O/Ej9cd2o7UXqI
 M2RoM2Y14calt7dAw9RIAZbW3lrSVqzhIkj0rlwPgnUhU2pejb8A6OY+CA2W2lhVFgGB Hw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3r02x1asf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 05:34:46 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 6 Jun
 2023 11:34:44 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 6 Jun 2023 11:34:44 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.36])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B086A11AA;
	Tue,  6 Jun 2023 10:34:43 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v3 0/3] Fixes and cleanup for CS35L41 HDA
Date: Tue, 6 Jun 2023 11:34:33 +0100
Message-ID: <20230606103436.455348-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fmIDXws0Go9KkKXY2aB700fzg5SDoh1M
X-Proofpoint-GUID: fmIDXws0Go9KkKXY2aB700fzg5SDoh1M
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: N7AANHHHH2AODSDANHI2EM7MFDWY6MJS
X-Message-ID-Hash: N7AANHHHH2AODSDANHI2EM7MFDWY6MJS
X-MailFrom: prvs=15210a2e6b=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N7AANHHHH2AODSDANHI2EM7MFDWY6MJS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Several minor issues were found during additional testing and
static analysis. These patches fix these minor issues.

CHANGES SINCE V2:
Patch 3:
- Add missing break

CHANGES SINCE V1:
Patch 2:
- Removed unnecessary cast

Stefan Binding (3):
  ALSA: hda: cs35l41: Clean up Firmware Load Controls
  ALSA: hda: cs35l41: Fix endian conversions
  ALSA: hda/realtek: Delete cs35l41 component master during free

 sound/pci/hda/cs35l41_hda.c   | 32 ++++++++++++++------------------
 sound/pci/hda/patch_realtek.c |  3 +++
 2 files changed, 17 insertions(+), 18 deletions(-)

-- 
2.34.1

