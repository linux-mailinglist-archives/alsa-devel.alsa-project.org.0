Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 689AC5B0171
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:15:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 231BE1640;
	Wed,  7 Sep 2022 12:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 231BE1640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662545726;
	bh=GWdOYDWTZe6KtuZNLOmGwpYmgKHedyUzrMXPcn91HUY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AuKi3AZ5fGPJDLP7GDPWHvuPa2D+x9dnCHuj6jmJCgrQaaG7kkMnlk9jIOmA0V3+3
	 XSJwVsMqeXg7XHxnPXajbOKMfBxMxEeuQN+WxEyYlEFii59vez9VckfEVZLvQQ9+7z
	 t8G+4wI2UNRUxw0N0Y0DhpRelGNpau0jo7RFceR8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61A95F804B1;
	Wed,  7 Sep 2022 12:14:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3171DF804B1; Wed,  7 Sep 2022 12:14:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B4AAF80118;
 Wed,  7 Sep 2022 12:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B4AAF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="SQi3tDQH"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2877p1GG032346;
 Wed, 7 Sep 2022 05:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=IiVoG2fnJzlYy5zIJA+PVp/Rv31qKQR5pP87OgUZQuU=;
 b=SQi3tDQH1HHKmBemUnVJl6u++lrEr0kRo0xFv0DLLwLqBblQDn/Yf+qCinnDBKHZdWeF
 bAxHxKYdngd1ZCvCFJN1OBXrbZ31yKu16OVnXyh3jFI+GKrGKK73GJrJG1B4cBZ1nG7Z
 QjjwQtYICILOGkAoq5iJjUyu0bjfiXET/KZXaF+t6eEvHhUqxaXgzLuWcII3hNmw9sNe
 tFoBz0e6bcLDYYIVd91R1+9goh1xXz7mWYPyRGQa6q8soUS6WwMCoOyqNFiOnSe4UrBE
 q26t4PkAvQ0B2FF+fsS4I2XmClbYXtVQOYKkVcmGd/ogKl5lsdg5aQIF6O4/4F/Slodh KQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jc3bpw4sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 05:14:13 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Wed, 7 Sep
 2022 05:14:12 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Wed, 7 Sep 2022 05:14:12 -0500
Received: from debianA11184.ad.cirrus.com (unknown [198.61.65.149])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2C1FFB06;
 Wed,  7 Sep 2022 10:14:05 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <lgirdwood@gmail.com>,
 <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
 <kai.vehmanen@linux.intel.com>, <daniel.baluta@nxp.com>,
 <sanyog.r.kale@intel.com>, <broonie@kernel.org>
Subject: [PATCH 0/7] soundwire: Fix driver removal
Date: Wed, 7 Sep 2022 11:13:55 +0100
Message-ID: <20220907101402.4685-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zO4yBel3wvibvReJBzwxEzDL20GZCnK_
X-Proofpoint-ORIG-GUID: zO4yBel3wvibvReJBzwxEzDL20GZCnK_
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

Removal of child drivers and the bus driver was broken and would
result in a slew of various errors.

Most of these were caused by the code shutting down in the wrong
order, shutting down the bus driver first. The bus driver should
be shut down after the child drivers have been removed (compare
with the I2C and SPI subsystem for example).

These patches fix that.

A secondary problem was over the cleanup of child drivers. The
removal functions were not the opposite of the probe function,
and the ownership of struct sdw_slave is tricky because it mixes
two separate usages and currently has to be "owned" by the bus
driver.

Tested with 4 peripherals on 1 bus and 8 peripherals on 2 buses.

Richard Fitzgerald (7):
  soundwire: bus: Do not forcibly disable child pm_runtime
  soundwire: intel_init: Separate shutdown and cleanup
  ASoC: SOF: Intel: Don't disable Soundwire interrupt before the bus has
    shut down
  soundwire: bus: Add remove callback to struct sdw_master_ops
  soundwire: intel: Don't disable interrupt until children are removed
  soundwire: intel: Don't disable pm_runtime until children are removed
  soundwire: bus: Fix premature removal of sdw_slave objects

 drivers/soundwire/bus.c             | 37 ++++++++++++++++++++++++-----
 drivers/soundwire/intel.c           | 13 ++++++++--
 drivers/soundwire/intel_init.c      | 25 +++++++++++++++----
 drivers/soundwire/slave.c           | 21 ++++++++++++----
 include/linux/soundwire/sdw.h       |  3 ++-
 include/linux/soundwire/sdw_intel.h |  2 ++
 sound/soc/sof/intel/hda.c           | 16 ++++++++++---
 7 files changed, 96 insertions(+), 21 deletions(-)

-- 
2.30.2

