Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5BE672274
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:06:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 976F6461B;
	Wed, 18 Jan 2023 17:05:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 976F6461B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674057968;
	bh=QZGzc+g+1usjix9l2tdIILJj4ee35Eg+h4AQ+ZEBNmQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tbYBvlE9C3hXj8hFfSwygnl4BlbqGl2SSymg6qn3zay/nK0nJyEc1mBhv67kecIAB
	 +DoBYm5FpghXg0SseaUJgYGeJuzGOgjJ1onowFgWmfxI6wi+bMawY241muQul0Yfci
	 6JXzEgoj9wOgZ+ZgCSYYCbWgMuzDkytGLVay4vg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D729F80543;
	Wed, 18 Jan 2023 17:05:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E7E0F80520; Wed, 18 Jan 2023 17:05:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D6F1F8024D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 17:05:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D6F1F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=lQ6o62Lk
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30IEDgr6022836; Wed, 18 Jan 2023 10:05:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=RrsmUAoPfdKz/GjTW3d2CI1v1QDtyYNp4XQoW8Gfmu4=;
 b=lQ6o62LkRIncspk6CTo7TCqKVATdDk0oiVuVG99ajX5AaiO7NHtPCwg18mLY3uvS/JWz
 OySbtAXgH06LDTOeOAKEJBtBQedcZjuznz4efhO+7VPUxrgAoI9NSwQdFQsQMvup1dSA
 mg4YVy+JdkfSRh6KPARNEP9taMBjss5FqzDc5cwBC44ao/fVldacntdSGBRa3anaXN7B
 qt0EjydzzJOL7SWD/VN1jfXDpBmdmRRPwzFTLp107EAsU2ExQ5KZQ+JKZ5hrGUB2e4ul
 7EdoSPriJUxlvLjYRJrtOoNuUjhC9EFZrvoMqLYus4Hd3dgNrQ4BlJPgVT1UW742HKkg Vw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3n3spx6vk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 10:05:00 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Wed, 18 Jan
 2023 10:04:57 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.7 via Frontend Transport; Wed, 18 Jan 2023 10:04:57 -0600
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0BA1EB12;
 Wed, 18 Jan 2023 16:04:57 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 1/8] soundwire: stream: Add specific prep/deprep commands
 to port_prep callback
Date: Wed, 18 Jan 2023 16:04:45 +0000
Message-ID: <20230118160452.2385494-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
References: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -czQAVRU0DdhMIyzE7Xe7chznsaOXhYp
X-Proofpoint-ORIG-GUID: -czQAVRU0DdhMIyzE7Xe7chznsaOXhYp
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Currently, port_prep callback only has commands for PRE_PREP, PREP,
and POST_PREP, which doesn't directly say whether this is for a
prepare or deprepare call. Extend the command list enum to say
whether the call is for prepare or deprepare aswell.

Also remove SDW_OPS_PORT_PREP from sdw_port_prep_ops as this is unused,
and update this enum to be simpler and more consistent with enum
sdw_clk_stop_type.

Note: Currently, the only users of SDW_OPS_PORT_POST_PREP are codec
drivers sound/soc/codecs/wsa881x.c and sound/soc/codecs/wsa883x.c, both
of which seem to assume that POST_PREP only occurs after a prepare,
even though it would also have occurred after a deprepare. Since it
doesn't make sense to mark the port prepared after a deprepare, changing
the enum to separate PORT_DEPREP from PORT_PREP should make the check
for PORT_PREP in those drivers be more logical.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 drivers/soundwire/stream.c    | 4 ++--
 include/linux/soundwire/sdw.h | 8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index df3b36670df4c..1652fb5737d9d 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -469,7 +469,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	}
 
 	/* Inform slave about the impending port prepare */
-	sdw_do_port_prep(s_rt, prep_ch, SDW_OPS_PORT_PRE_PREP);
+	sdw_do_port_prep(s_rt, prep_ch, prep ? SDW_OPS_PORT_PRE_PREP : SDW_OPS_PORT_PRE_DEPREP);
 
 	/* Prepare Slave port implementing CP_SM */
 	if (!dpn_prop->simple_ch_prep_sm) {
@@ -501,7 +501,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	}
 
 	/* Inform slaves about ports prepared */
-	sdw_do_port_prep(s_rt, prep_ch, SDW_OPS_PORT_POST_PREP);
+	sdw_do_port_prep(s_rt, prep_ch, prep ? SDW_OPS_PORT_POST_PREP : SDW_OPS_PORT_POST_DEPREP);
 
 	/* Disable interrupt after Port de-prepare */
 	if (!prep && intr)
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 3cd2a761911ff..547fc1b30a51a 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -569,13 +569,15 @@ struct sdw_prepare_ch {
  * enum sdw_port_prep_ops: Prepare operations for Data Port
  *
  * @SDW_OPS_PORT_PRE_PREP: Pre prepare operation for the Port
- * @SDW_OPS_PORT_PREP: Prepare operation for the Port
+ * @SDW_OPS_PORT_PRE_DEPREP: Pre deprepare operation for the Port
  * @SDW_OPS_PORT_POST_PREP: Post prepare operation for the Port
+ * @SDW_OPS_PORT_POST_DEPREP: Post deprepare operation for the Port
  */
 enum sdw_port_prep_ops {
 	SDW_OPS_PORT_PRE_PREP = 0,
-	SDW_OPS_PORT_PREP = 1,
-	SDW_OPS_PORT_POST_PREP = 2,
+	SDW_OPS_PORT_PRE_DEPREP,
+	SDW_OPS_PORT_POST_PREP,
+	SDW_OPS_PORT_POST_DEPREP,
 };
 
 /**
-- 
2.34.1

