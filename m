Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DACA15AFFB0
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 10:55:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84A1E15E5;
	Wed,  7 Sep 2022 10:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84A1E15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662540907;
	bh=Yhl8C5NFLyjRwObobXm4woSXYir48b+b0GNOM5pyB4s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rLPK/FWALtmaRy8Kd/k/dTZAoAUkJZN/wf0e5dIbJlU8TOwQ7HOsc6aXtOcSkgbs1
	 YW0WpoYUn4bMnCoUpFblnyKVuos4HzRzEdIJkIUepbXUxU0QunWik0m2O9WmPQcrnE
	 hOAnpRzJtMexdUMRP8J9PsPnanc5BMtPbq+cA3c8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC0E0F80538;
	Wed,  7 Sep 2022 10:53:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB681F8053A; Wed,  7 Sep 2022 10:53:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42E48F804B1
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 10:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42E48F804B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="PffzfR9J"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2876sQ67005118;
 Wed, 7 Sep 2022 03:53:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ibOfn/+ASXTfvCcNK8UK8/PJfMDVm1gjDjZjwUSKE7M=;
 b=PffzfR9JSNlk6uEIDfollxy3U6v7ysUcgkWmBFuZEs/EckJ3Dpn737KWwahYsgj2bW1z
 hQasB/ble2+fZxrZBcvI53mic9x5+niH9Ygm0DInQ5N3Trskz1DP1hF0zmcd461lMpGP
 YfmHTx1hNkCmO6wix4mtdaQQK/eBcmqXrfawD5V7RDCje7NPMMu3JGoh/txvyvoXbp4T
 mxw8qHRRaNXkLquea1p9qBHT+uEk7HFN9qwIILJytsPnmLYVFsARA88Ru3wOvNSmhrqk
 9eFcrhbY/vAMnpbrc4lfyvuOBIKsaZiqJ9bcijDOLW4aGkM5Ju7u905BnvpkF/qyfAYL hg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jc4b2dcum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 03:53:06 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Wed, 7 Sep
 2022 03:53:04 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Wed, 7 Sep 2022 03:53:04 -0500
Received: from debianA11184.ad.cirrus.com (unknown [198.61.65.149])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DFFCD7C;
 Wed,  7 Sep 2022 08:53:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH v2 2/5] soundwire: bus: Don't lose unattach notifications
Date: Wed, 7 Sep 2022 09:52:56 +0100
Message-ID: <20220907085259.3602-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220907085259.3602-1-rf@opensource.cirrus.com>
References: <20220907085259.3602-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lL-GGnc2VjIjAxj3rYwhu2aVaGQ3Yibm
X-Proofpoint-ORIG-GUID: lL-GGnc2VjIjAxj3rYwhu2aVaGQ3Yibm
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

Ensure that if sdw_handle_slave_status() sees a peripheral
has dropped off the bus it reports it to the client driver.

If there are any devices reporting on address 0 it bails out
after programming the device IDs. So it never reaches the second
loop that calls sdw_update_slave_status().

If the missing device is one that is now showing as unenumerated
it has been given a device ID so will report as attached next
time sdw_handle_slave_status() runs.

With the previous code the client driver would only see another
ATTACHED notification because the UNATTACHED state was lost when
sdw_handle_slave_status() bailed out after programming the
device ID.

This shows up most when the peripheral has to be reset after
downloading updated firmware and there are multiple of these
peripherals on the bus. They will all return to unenumerated state
after the reset, and then there is a mix of unattached, attached
and unenumerated PING states from the peripherals, as each is reset
and they reboot.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index d773eee71bc1..1cc858b4107d 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1767,6 +1767,11 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			dev_warn(&slave->dev, "Slave %d state check1: UNATTACHED, status was %d\n",
 				 i, slave->status);
 			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
+
+			/* Ensure driver knows that peripheral unattached */
+			ret = sdw_update_slave_status(slave, status[i]);
+			if (ret < 0)
+				dev_warn(&slave->dev, "Update Slave status failed:%d\n", ret);
 		}
 	}
 
-- 
2.30.2

