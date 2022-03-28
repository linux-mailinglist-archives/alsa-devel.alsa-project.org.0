Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE7F4E95F5
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 13:57:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70AE51849;
	Mon, 28 Mar 2022 13:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70AE51849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648468650;
	bh=0lutMOeQx3arWdfvZaaJDGhjdLRLjqRMN2YF/oWViOc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VrrWz6FLSkp6Xj4ww8KCIy9KWDZvPi2FxaWX+/c31fYsi19dxqFoDeVUQqJjfInCH
	 TrXJsWERPHaeh5TtPkfsJU8PKOc1NGtNX9VH78Ei23rEhbdmDvtUIXhc+BJ07wcIlz
	 q7pH+xYdPzLSlixdGO46q4FYhioYtXJ3Kzv6/cXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F0FDF80516;
	Mon, 28 Mar 2022 13:56:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 035F5F8026A; Mon, 28 Mar 2022 13:56:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A24BF800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 13:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A24BF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="I3qcisXf"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22S8AHva030601;
 Mon, 28 Mar 2022 06:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=s17bH2wq48xeJSQODDx6n6E0adzoVMT9RDU32m9kPUg=;
 b=I3qcisXfuv6M760Xi3vyJlUx43PHVplJTKG1PAbmjEcxmirAnXtk8sH206F9xkPT1wh0
 4xAB0UDprKSVQx5OrwCNQ8oZR93egwd55ROsSdmPoKeTU4qJeLJaBxtHXtYDSi9xE/vi
 a05AUEOGRc++J0P5lw9mvWt7UeRuONiU8o4CZFgr1NYHqiucuBqsQ283N/gAdN1uK9WG
 dolaGNoJzpStz9Ad/bG27fcyDS+bXGW2cubjzZ2tuh3QimuJ6InfQFhtH+s3SjcJCZGf
 hiOBewlc7y6XhVZ5YdtvpVicBmQvfrpQHlwyiXugS+yszch6xqDBNwL44GMyX578h/px uQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3f2081apda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Mar 2022 06:56:17 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 12:56:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 28 Mar 2022 12:56:15 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.244])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B4B9E46A;
 Mon, 28 Mar 2022 11:56:14 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/6] Add new HW variants and fix few minor issues
Date: Mon, 28 Mar 2022 12:56:08 +0100
Message-ID: <20220328115614.15761-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 5YFiUiG9ZSd899pGMXi9hRSEPnpMLp1m
X-Proofpoint-GUID: 5YFiUiG9ZSd899pGMXi9hRSEPnpMLp1m
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
  ALSA: hda/cs8409: Fix Warlock to use mono mic configuration
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

