Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 182DB5FB4AA
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 16:37:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C89D3DF2;
	Tue, 11 Oct 2022 16:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C89D3DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665499036;
	bh=AicCI9TUkp6Zi4QGMlsQcTRj48lgWX4K/FQBugGwp8k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sY/C+fr4e3Y5i3smUcWDFoazX5iUxgKtqZSCzgss/6NH0WoqGPPMRzMyEGlBjqyho
	 WTuEjE4gRXAryQ3zyU09IJM8OBMVyj+2KpYb58w+jsRjyoMh1f5Z4Z9KRgKsZ6dhf9
	 iCCp0kU+wnbCoVX1Lricav6LgPdeXiF/egaLCwI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1027FF80301;
	Tue, 11 Oct 2022 16:36:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69C7BF80132; Tue, 11 Oct 2022 16:36:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A39A0F80132
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 16:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A39A0F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JUdnWoNT"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B6p4J3008726;
 Tue, 11 Oct 2022 09:36:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=SQd/6TNFJXgCF7iuTtvqQxp6HqvqcwwIrNOxCz6sD/U=;
 b=JUdnWoNT8/P3ufBp9bDUoORUrAL9yUQL6XOk9Paf6EBhasRyCOT5xKbKff7MLF+BnKZ9
 y0blw6ZifDbZq/jNfyGom8vzxWWi6V5AvmmNtKpCTtY8pmmUEsS9HFizuFZ0Aa2ZA+H1
 kxZNfjwC28lgPHK69uEG4BQaN97Oj7I+tmFNBJ7zFo1b2NWhJZKifX8yeHje81PvDcOO
 5aEouzOGBCUEkSYlQwHyfB8pLIswOIe8aAw1S76ojOUwlnxIz5IIB8m+ggZJyhG34nZG
 Gbuthus2cLDexA/Mm//czaS4aTFsQtyOeoJ+U42+3xHE6aa8/NvdN5KzkxnegogMJ0qx aQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3k35mpuhdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Oct 2022 09:36:14 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Tue, 11 Oct
 2022 09:36:13 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Tue, 11 Oct 2022 09:36:13 -0500
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D14B411DC;
 Tue, 11 Oct 2022 14:36:12 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 0/5] Support System Suspend and Resume for CS35L41 HDA
Date: Tue, 11 Oct 2022 15:35:47 +0100
Message-ID: <20221011143552.621792-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kxzeKo8pBJXMTwn-o6m8EAC2pH01l1mv
X-Proofpoint-GUID: kxzeKo8pBJXMTwn-o6m8EAC2pH01l1mv
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

The CS35L41 HDA driver currently only supports runtime suspend and resume.
Add support for system suspend and resume into the CS35L41 HDA driver.
The driver will put the parts into a state where they can be powered down
during suspend, and on system resume, it will restore the part.
If firmware was previously loaded, during system suspend, the firmware will
be unloaded, and during system resume, it will be loaded again.

Note: System suspend is only supported for models which use Internal Boost,
or models which use External Boost with a Boost Enable GPIO.

The chain also contains minor bug fixes for the CS35L41 HDA driver, and
associated hda_cs_dsp_ctl driver.

Richard Fitzgerald (1):
  ALSA: hda/cs_dsp_ctl: Fix mutex inversion when creating controls

Stefan Binding (4):
  ALSA: hda: hda_cs_dsp_ctl: Minor clean and redundant code removal
  ALSA: hda: hda_cs_dsp_ctl: Ensure pwr_lock is held before
    reading/writing controls
  ALSA: hda: cs35l41: Remove suspend/resume hda hooks
  ALSA: hda: cs35l41: Support System Suspend

 sound/pci/hda/cs35l41_hda.c    | 197 +++++++++++++++++++++++++--------
 sound/pci/hda/hda_component.h  |   2 -
 sound/pci/hda/hda_cs_dsp_ctl.c |  79 +++++++------
 sound/pci/hda/hda_cs_dsp_ctl.h |   2 +-
 sound/pci/hda/patch_realtek.c  |  19 +---
 5 files changed, 198 insertions(+), 101 deletions(-)

-- 
2.34.1

