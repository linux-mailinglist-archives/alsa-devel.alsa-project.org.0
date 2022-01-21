Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C97B495ED4
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 13:05:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C70632AD0;
	Fri, 21 Jan 2022 13:04:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C70632AD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642766730;
	bh=GATGW9nBtPybeEJAEnCnhR6pm2D0a/JJR8I2jpkiVdA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L38VGulc/m7u3Zfp6aNT+5QAJ53nzpv23GdOLWZkiJOqXoboqd6/CHubrcKa5Dm0P
	 UXm+7/jxg0MQzD3nPl2gDJTc/rowIlxJm1BwKVDOvrZ/8BclnAGi9ezP1C9ZitM2eA
	 hdKXBZ2KZQFRLksL6Hr4MojPyZJ+z2Ze7mA953oU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D078F8047C;
	Fri, 21 Jan 2022 13:04:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24BF3F80430; Fri, 21 Jan 2022 13:04:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73216F800F5
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 13:04:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73216F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="VYWlH8kn"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20L6W2RJ017662;
 Fri, 21 Jan 2022 06:04:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=cHTdgJoGxUCkn9pYkep3lJ1ELWZc56siT+B8A9L5DDI=;
 b=VYWlH8knO4M5yTnUWpfzlSMMoztDVpXae2Hu2bop0EEiQqNaANS2OH01eDOjrX5JWkiI
 q+VfA85XWZrqTjRaqeaHaMiM0CyTjTFAE7T7Y8uX0lIXTKgJ3Oh21lftarGirN16o1oi
 q4zfIIY6GGCmjQmTZ7MdnpA0H9ngVr8U6fEI+SSTk0oRrCuTAHJ5xj1gxgzmBNo98zN7
 ODso9YE+FKVNxkhfOsGk83p3EPoNmTzSIoOmnl0EE55jbjOfmWPuaVRJnIJekn2eJrn2
 gqROS2mOqtvJb0HjiYCKeFF/FnNSFjmdB3ArHivUQGdpXFN+D5X0k/kBez5tn77IwNyo XQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dqhyq0nwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 21 Jan 2022 06:04:17 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 21 Jan
 2022 12:04:14 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 21 Jan 2022 12:04:14 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.33])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2373E45D;
 Fri, 21 Jan 2022 12:04:14 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 0/3] ASOC: cs42l42: Add support for system suspend
Date: Fri, 21 Jan 2022 12:04:09 +0000
Message-ID: <20220121120412.672284-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: XsTNiSO2CEcw8JrWHXlNdw-zBOZzSyQx
X-Proofpoint-ORIG-GUID: XsTNiSO2CEcw8JrWHXlNdw-zBOZzSyQx
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

Changes since V1:
- Hold irq_lock mutex while restoring registers

Richard Fitzgerald (3):
  ASoC: cs42l42: Report full jack status when plug is detected
  ASoC: cs42l42: Change jack_detect_mutex to a lock of all IRQ handling
  ASoC: cs42l42: Handle system suspend

 sound/soc/codecs/cs42l42.c | 166 ++++++++++++++++++++++++++++++++++++++++++---
 sound/soc/codecs/cs42l42.h |   7 +-
 2 files changed, 163 insertions(+), 10 deletions(-)

-- 
2.11.0

