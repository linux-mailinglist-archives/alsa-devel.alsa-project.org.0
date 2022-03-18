Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDE34DDD68
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 16:57:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 423D9187B;
	Fri, 18 Mar 2022 16:57:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 423D9187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647619074;
	bh=W89AX4q9VSmmUu7wjiVTVIJslDmXAs3fGnd0Pn2Cta8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lRIvtMLunxPXL4Rx5iv0tXDvWui+K5lng34OulxvQn9UIk0gJwIASTFLaKMjr+Pt6
	 NtOihjhNzgXVmPxDcBKGSrWToIrNfZjL7NnW0+nxTgp97f2hGe8ZfOF3GBHC08tj0+
	 uIaWW/ZHP0mo1d0uDLC0w6HiaokPvD3rhWLmJ2w0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29FCCF8051D;
	Fri, 18 Mar 2022 16:56:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 469E8F804CF; Fri, 18 Mar 2022 16:56:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FA0BF80124
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 16:55:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FA0BF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="McrFMSDs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22I4MHlZ013781;
 Fri, 18 Mar 2022 10:55:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=cmzcuuOB7zcZNMmhHOonmDSCH0EjGkWS73owvHUazrw=;
 b=McrFMSDsaeM1Laj+Cu9VSh8UD81stVpVG87oylaOijvKYbcOX94lOui2oIpoxpJn7vbo
 RUPBzVaqaANnWsRtdNxw5kaAFHTkpN+F6yOWeIlmncQB9dUDzLuQJ1LENyNTdF1CXO/p
 fCW0iuKIdIxjMIzhhYgelqpvYelCAt4INr7r/1nLNd0TgvIX0FX9/vhYp/JJFTFKIvkk
 aS/EsI8a03MSvb4iKn5kPpytrwLVgB+EHQMxbUFsLHEYhu+8SzWSv7p5N39he7rf52Fe
 EION/dZ5pgrhryEWii1QF5aMjuHT0Hw7BpPg6u92US4KdOawljrFS0kpRcEf71SbbKGp WQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3et5yp65wt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 18 Mar 2022 10:55:54 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 18 Mar
 2022 15:55:52 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 18 Mar 2022 15:55:52 +0000
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.229])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A0788B16;
 Fri, 18 Mar 2022 15:55:52 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/6] Add new HW variants and fix few minor issues
Date: Fri, 18 Mar 2022 15:55:46 +0000
Message-ID: <20220318155552.24751-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: yKRNaiaVsfMRHalU3KpEpTdncN6ULcPp
X-Proofpoint-GUID: yKRNaiaVsfMRHalU3KpEpTdncN6ULcPp
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

This series adds new HW variants for Dell's Dolphin and Warlock,
and also fixies few very minor issues.

Stefan Binding (5):
  ALSA: hda/cs8409: Fix Warlock using dual mic configuration
  ALSA: hda/cs8409: Re-order quirk table into ascending order
  ALSA: hda/cs8409: Fix Full Scale Volume setting for all variants
  ALSA: hda/cs8409: Support new Warlock MLK Variants
  ALSA: hda/cs8409: Disable HSBIAS_SENSE_EN for Cyborg

Vitaly Rodionov (1):
  ALSA: hda/cs8409: Add new Dolphin HW variants

 sound/pci/hda/patch_cs8409-tables.c | 68 +++++++++++++++++++++--------
 sound/pci/hda/patch_cs8409.c        | 47 +++++++++++---------
 sound/pci/hda/patch_cs8409.h        |  5 +++
 3 files changed, 83 insertions(+), 37 deletions(-)

-- 
2.25.1

