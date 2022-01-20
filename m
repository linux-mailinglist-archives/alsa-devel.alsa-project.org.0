Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECC04953A5
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 18:57:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 044E72DD1;
	Thu, 20 Jan 2022 18:56:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 044E72DD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642701432;
	bh=xjAZSvMo/olJ5+MS7bO4y16J9nWW7cXduKX7qnrpBX4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tfFXbCW+f9p8SxIpxlsmMgkZ5kxVAYAICDAUbQPIcfF2GTbWote8DySoSwSlp5+E3
	 btvJoSRYNGW88qWRQsxDLtCkt+UcnUlHeFCbyyNX92jo5yWQ9SrJxbD6EH8wS/RGce
	 sDK08TsU32fPMYDmVaN+OVciSncE61okFxQJgV2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82A63F8012E;
	Thu, 20 Jan 2022 18:56:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D2A8F80423; Thu, 20 Jan 2022 18:56:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25E81F80128
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 18:56:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25E81F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CbICzOYP"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20K5Ip9w022340;
 Thu, 20 Jan 2022 11:55:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=/IA9aYK9SVb9BvHEuwQJnvbzmEGlO38e5B5sMd74PEs=;
 b=CbICzOYPKbjJcZ5Y39rvRaJd5MksGxO26iFQxXR509EmiVXIc2oEptleua5XaDz9lWpy
 mbEf8qkke+5KTppMduYiSCw8JvPRTiokkaw0vw4CmKuMBRW3xLrU1KoHw3CFdHOlHd5b
 wptJiq9DKmu1AoP6TCFK8k85poc7hpONOHOar79Mu3/GHSYHWG1o1l2Pxh4UhnUcxS52
 9Cd8twaMYLTf2lANJxVJq/Y+tmje9S7oq6Umv7tH7/aZnHMqeRuQcEPOd0CyBc4YLRiW
 JQkrp0R6O2muqc7RJ8VBpZGtttB84rjjokFf2OXtrBkI1D5DCpHZo8WZbRg5DVadcR8n rw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dpms0hh17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 20 Jan 2022 11:55:57 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 20 Jan
 2022 17:55:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 20 Jan 2022 17:55:53 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.33])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 35050B13;
 Thu, 20 Jan 2022 17:55:53 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 0/3] ASOC: cs42l42: Add support for system suspend
Date: Thu, 20 Jan 2022 17:55:46 +0000
Message-ID: <20220120175549.671831-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -0qIb_fGy_rUEMofCkMELgRt3ynZ0UbZ
X-Proofpoint-GUID: -0qIb_fGy_rUEMofCkMELgRt3ynZ0UbZ
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

Add system suspend and resume handlers so that the cs42l42 is cleanly
put into power-off state during system suspend and the registers are
restored in resume.

The first two patches separate out two small changes that can stand
alone and are needed to enable the system suspend implementation:

1) Don't rely on there being a jack unplug IRQ before a plug IRQ.
There won't be if the unplug and plug happened while in system suspend.

2) Put a mutex around the entire IRQ handling so that the suspend can
ensure the last run of the IRQ handler has completed before it powers
down.

Richard Fitzgerald (3):
  ASoC: cs42l42: Report full jack status when plug is detected
  ASoC: cs42l42: Change jack_detect_mutex to a lock of all IRQ handling
  ASoC: cs42l42: Handle system suspend

 sound/soc/codecs/cs42l42.c | 164 ++++++++++++++++++++++++++++++++++++++++++---
 sound/soc/codecs/cs42l42.h |   7 +-
 2 files changed, 161 insertions(+), 10 deletions(-)

-- 
2.11.0

