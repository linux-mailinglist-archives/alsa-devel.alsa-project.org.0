Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9095A4656
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Aug 2022 11:46:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD955950;
	Mon, 29 Aug 2022 11:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD955950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661766397;
	bh=Fk1vRi+CHZt2dI59AiW5JdBa2ubtLD2dwpb7C1t7zHE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kdxaXzFDk1sYf9lFj+DZxjM2KABc12z7IMFtLuqENzpMRuTkguJ9ijWuhUHL/0lP8
	 lhLpdizM4XbKdt/vMuUljm90SzersuZ6JLfdImodw56daEHksqX3tAkfeANuxyPU5c
	 dXI6qYiv5cO+mmPVZb3c+Bme1Z4YrvNLxWO114Ko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81119F803DD;
	Mon, 29 Aug 2022 11:45:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71405F803DC; Mon, 29 Aug 2022 11:45:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A3A1F80115
 for <alsa-devel@alsa-project.org>; Mon, 29 Aug 2022 11:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A3A1F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Dk1dd8hr"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T5g85l004126;
 Mon, 29 Aug 2022 04:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=MRh3A4ON0/ZCyZM67h+hhoZTvgjWZJM7VSH6yQSQ1YQ=;
 b=Dk1dd8hrOFdMLDmFmZ+exP6t6QGPuRS42OmQLp8noSC1eN8YGVO8Ha/oaknVwBILvd2f
 VH1nLhLEcLkOOLYVyGmi+kyK3mZCADtMe+gd1ZgV4vlQz4STxh8tCZ4w6+WJ2XNP69Q5
 ELGkMS8lK2OV3+FHkW6R9C+RPIVRaqb+aQ2Gv7tKMctk6t9FodbnJwopbI5cBecAMMeK
 JYVfEICmOKfEw6tVTLWCSVUzArbiqDpsDW0KqdUCiw8xeLrZ1d884bo2/cQDfkrsCXOX
 MNI0yapatetmRp3rQ8xYUMB7a+nikYKBxPz76gL7QXZPHLbr0DxW3BFudfj+4o66Dhy6 ww== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3j7fpp9v2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Aug 2022 04:45:00 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Mon, 29 Aug
 2022 04:44:58 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Mon, 29 Aug 2022 04:44:58 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DE62D459;
 Mon, 29 Aug 2022 09:44:58 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH 1/1] soundwire: bus: Don't re-enumerate before status is
 UNATTACHED
Date: Mon, 29 Aug 2022 10:44:58 +0100
Message-ID: <20220829094458.1169504-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220829094458.1169504-1-rf@opensource.cirrus.com>
References: <20220829094458.1169504-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: gDoi_kzPveKJ2u67J1CTVKk8KYUoFZ4d
X-Proofpoint-ORIG-GUID: gDoi_kzPveKJ2u67J1CTVKk8KYUoFZ4d
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

Don't re-enumerate a peripheral on #0 until we have seen and
handled an UNATTACHED notification for that peripheral.

Without this, it is possible for the UNATTACHED status to be missed
and so the slave->status remains at ATTACHED. If slave->status never
changes to UNATTACHED the child driver will never be notified of the
UNATTACH, and the code in sdw_handle_slave_status() will skip the
second part of enumeration because the slave->status has not changed.

This scenario can happen because PINGs are handled in a workqueue
function which is working from a snapshot of an old PING, and there
is no guarantee when this function will run.

A peripheral could report attached in the PING being handled by
sdw_handle_slave_status(), but has since reverted to device #0 and is
then found in the loop in sdw_program_device_num(). Previously the
code would not have updated slave->status to UNATTACHED because it had
not yet handled a PING where that peripheral had UNATTACHED.

This situation happens fairly frequently with multiple peripherals on
a bus that are intentionally reset (for example after downloading
firmware).

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/bus.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index cb77da84a4f9..a3d3d66b3410 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -766,6 +766,13 @@ static int sdw_program_device_num(struct sdw_bus *bus)
 			if (sdw_compare_devid(slave, id) == 0) {
 				found = true;
 
+				/*
+				 * Don't re-enumerate a device until we've seen
+				 * it UNATTACH.
+				 */
+				if (slave->status != SDW_SLAVE_UNATTACHED)
+					break;
+
 				/*
 				 * Assign a new dev_num to this Slave and
 				 * not mark it present. It will be marked
-- 
2.30.2

