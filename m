Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A938523028
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 12:03:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A77C41915;
	Wed, 11 May 2022 12:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A77C41915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652263402;
	bh=zwTiIAAYJ2K0Mm4lAD038gzSXToaTyRRJqO2Pd2WtDM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YX6+4kOFRHb57/f4w5CNo9yJtsJtL30XXgRUWhK87kQ6fkTbhUsmtxI1GGm4PYWPu
	 fpniP45JY8VDJqtUGwSSEXELoVZUw4XOO0+ongd/e20hQpSrLCo1HnuGfvU15wpHNB
	 OAj61TXpAXH0MK3nc4stAzKZwr2IXSvxezboo/04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C691F804CB;
	Wed, 11 May 2022 12:02:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB911F804CA; Wed, 11 May 2022 12:02:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 491E4F8011C
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 12:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 491E4F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="q6ilppPU"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24B7elHA020340;
 Wed, 11 May 2022 05:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=00wJVCtHOpovRtoQGKNdyELkUs6JBl/FkJMVXuWpoBc=;
 b=q6ilppPUw6PdvJ9K5+yPPi8nWyBL1KJeHRntaDx+lUcuyHm3FdIuSSh+2FwxFJewJtoB
 kwi2ZrAZa7kuZT2GtOdm5m1pzttJDBV1/UdgjdHsTwtrL1x9uwCLnN5ZZr2TrUICdcTG
 ucJyxcaUmf6L4IUUf5A2gSSagdY4+XH19+08jTmGDPqdAFq3qcem+31hgKb+yZcbJVgn
 BQGNBDxpB8Xxn2JPYDK2kEnKz37LLlthZFQfO0zGRi3bY0EN6lSFFi53s7lBLYprS7pC
 +o1bJGf/DFsD4cVSRPh6gAfWc27tPPpg93nAp5S8sySh3tzO5JPS/cyS9dBkSIa+gTT+ Dg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fwn6nwt0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 May 2022 05:02:14 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 11 May
 2022 11:02:12 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 11 May 2022 11:02:12 +0100
Received: from sbinding-cirrus-dsktp.ad.cirrus.com (unknown [198.90.238.24])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 742EA468;
 Wed, 11 May 2022 10:02:12 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 0/3] ALSA: hda/cs8409: Add support for Odin Laptop Variants
Date: Wed, 11 May 2022 11:02:04 +0100
Message-ID: <20220511100207.1268321-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: O1pm8yeQOuMQqCSrohZLglniBXwZmXIx
X-Proofpoint-GUID: O1pm8yeQOuMQqCSrohZLglniBXwZmXIx
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for new Odin Laptop Variants into CS8409 HDA Driver.

Since these laptops require Speaker Playback Switch, support must be added into
CS8409 HDA driver. Since CS8409 does not have amplifier parameters for the NID
associated with the speaker, the HDA driver does not add the switch
automatically, so the driver needs to add this support manually.

changes since v1:
- add missing break in switch statement

Stefan Binding (3):
  ALSA: hda/cs8409: Support new Odin Variants
  ALSA: hda/cs8409: Add Speaker Playback Switch for Cyborg
  ALSA: hda/cs8409: Add Speaker Playback Switch for Warlock

 sound/pci/hda/patch_cs8409-tables.c | 19 +++++++
 sound/pci/hda/patch_cs8409.c        | 86 ++++++++++++++++++++++++-----
 sound/pci/hda/patch_cs8409.h        |  5 ++
 3 files changed, 96 insertions(+), 14 deletions(-)

-- 
2.25.1

