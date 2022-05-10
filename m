Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8FD5220F9
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 18:18:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C85361729;
	Tue, 10 May 2022 18:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C85361729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652199494;
	bh=jHn8nQJNH+T8Cz5fUMutmOfGOejntJoyFm5mRwbUM18=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e3CfYeeOTKBBzYP6LMx4msPtl95k9RLtJ3QCJFSlPiDkEm2DB0UM1CRKpjBlExYVK
	 kKd4e9HcRpCHxEDSQ5kuatTEqQh6ieXooiXbJMyUTq4WRPOvhoRM+iaB+DNenQmK4z
	 hllrXr1RGtO//gb/9rQajy3YnMj5oznHWrLe5Les=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64FD3F804BB;
	Tue, 10 May 2022 18:17:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E7FBF80240; Tue, 10 May 2022 18:17:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9273F80116
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 18:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9273F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="BJ1IDdv+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A5TVpe021012;
 Tue, 10 May 2022 11:17:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=zXofkY1bd3XtG154r7H2+Sqnxy0DHw+79gdGYM1CoL8=;
 b=BJ1IDdv+25911XUZUZVcM8S3KMrQHBK+C6OnpU+dlcsAONI5D2yfYapVUc+x8xKet5HF
 8Nm0AQ3/xE55kku8CxO1cAmqZ3xV0GRc0BA0lu0+4tD7Xzd2Urn4hKKV8sjS8Ywecznr
 VJCgu8a6E7hanZwOx3uI1DHovrB0YffW84JOaqUCK6gu7ArWc76+dvsnOcacYqTO0frc
 eE89DTQ/xQvuiNftyVXQjZn/1crXyC4nVCy9AW+JTmU315S7bNDFTRv/Ieo4ahK94yqp
 5KEuEadPVqiP9BupfFIrcuKp4IRbWGOhCcllvujec+deFYm+N6FDLVwCQU4ZZ1ouhqv+ zw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fwn6nvk88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 May 2022 11:17:07 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 10 May
 2022 17:17:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Tue, 10 May 2022 17:17:06 +0100
Received: from sbinding-cirrus-dsktp.ad.cirrus.com (unknown [198.90.238.24])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2DA6E475;
 Tue, 10 May 2022 16:17:06 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 0/3] ALSA: hda/cs8409: Add support for Odin Laptop Variants
Date: Tue, 10 May 2022 17:16:58 +0100
Message-ID: <20220510161701.851260-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GOqpgBxOq3tQq_4_EliPVL75yfgzbnSF
X-Proofpoint-GUID: GOqpgBxOq3tQq_4_EliPVL75yfgzbnSF
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

Stefan Binding (3):
  ALSA: hda/cs8409: Support new Odin Variants
  ALSA: hda/cs8409: Add Speaker Playback Switch for Cyborg
  ALSA: hda/cs8409: Add Speaker Playback Switch for Warlock

 sound/pci/hda/patch_cs8409-tables.c | 19 +++++++
 sound/pci/hda/patch_cs8409.c        | 85 ++++++++++++++++++++++++-----
 sound/pci/hda/patch_cs8409.h        |  5 ++
 3 files changed, 95 insertions(+), 14 deletions(-)

-- 
2.25.1

