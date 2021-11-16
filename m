Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55829453723
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 17:18:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C075016DC;
	Tue, 16 Nov 2021 17:18:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C075016DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637079536;
	bh=hsPDLrJQcAbovsZWGXIVDt6dl+9cS5IW44QAiZ7ocdw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ne3ynYmiD+YHUbuniCbYKqVSmEzlxzC9DnlrG5GxQTuRLgQDv2RwMGAJ8E8Q94hUr
	 /FGtJfRTGJLiTeF5U9BTBgGRXTzBoVwtMpB+w36rLfizDpQswFWa8iXNlhjIgSJF/u
	 m/IDYFBKIREr3L5635S8L5/oWWybo3Ar6dANSvrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD41CF804FC;
	Tue, 16 Nov 2021 17:16:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D059F804FE; Tue, 16 Nov 2021 17:16:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8B9BF8026D
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 17:16:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8B9BF8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gaNJw6Vw"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG7FCjd005416;
 Tue, 16 Nov 2021 10:16:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=WrBetRTiAki3sz26Ov9fMnfKAyaC0pfymAIOH1q5cDk=;
 b=gaNJw6VwTkk3Sq23NzxMbvR4gYr7tpv7Z64ofBqIbGbz5ZcqZRao63t3AdCtkNc604Zs
 pemI1Q4RjmFhcmYwnXOjWOtL4zlopHDyiWw4D+A9bgNE9/SnPD72mEtthnlZKq8YYZrm
 VmbG1LXp3ir4MNv3um1jKhL2jzNkjWwvAV/M4HVKuWiEoEYs/BHZ6SEoUp72RDiJnlLt
 ki/WWuLUNiIpqCFbc+KVuNA6kFY27KTAZglog3tez3n79TwfYQl2xQikBu6E9EktikAW
 yZ0dqD9Nhiwmb6eOcyUFSyrqpcmCyI41XhdKfv6lk6jLLxgOpP/G9lxrEH+2qg2vQIPX TQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cbdjgt2t5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 16 Nov 2021 10:16:11 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 16:16:09 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 16 Nov 2021 16:16:09 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 60DF415A6;
 Tue, 16 Nov 2021 16:16:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 04/10] firmware: cs_dsp: Add pre_run callback
Date: Tue, 16 Nov 2021 16:16:03 +0000
Message-ID: <20211116161609.12223-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
References: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Atbbq2ceVWUlv6WZuMnPfypwzioUQtdp
X-Proofpoint-GUID: Atbbq2ceVWUlv6WZuMnPfypwzioUQtdp
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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

The code already has a post_run callback, add a matching pre_run
callback to the client_ops that is called before execution is started.
This callback provides a convenient place for the client code to
set DSP controls or hardware that requires configuration before
the DSP core actually starts execution. Note that placing this callback
before cs_dsp_coeff_sync_controls is important to ensure that any
control values are then correctly synced out to the chip.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 6 ++++++
 include/linux/firmware/cirrus/cs_dsp.h | 4 +++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 0da454a8498d0..ef7afadea42d1 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -2627,6 +2627,12 @@ int cs_dsp_run(struct cs_dsp *dsp)
 			goto err;
 	}
 
+	if (dsp->client_ops->pre_run) {
+		ret = dsp->client_ops->pre_run(dsp);
+		if (ret)
+			goto err;
+	}
+
 	/* Sync set controls */
 	ret = cs_dsp_coeff_sync_controls(dsp);
 	if (ret != 0)
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index ce54705e2becf..0bf849baeaa5a 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -187,7 +187,8 @@ struct cs_dsp {
  * struct cs_dsp_client_ops - client callbacks
  * @control_add:	Called under the pwr_lock when a control is created
  * @control_remove:	Called under the pwr_lock when a control is destroyed
- * @post_run:		Called under the pwr_lock by cs_dsp_run()
+ * @pre_run:		Called under the pwr_lock by cs_dsp_run() before the core is started
+ * @post_run:		Called under the pwr_lock by cs_dsp_run() after the core is started
  * @post_stop:		Called under the pwr_lock by cs_dsp_stop()
  * @watchdog_expired:	Called when a watchdog expiry is detected
  *
@@ -197,6 +198,7 @@ struct cs_dsp {
 struct cs_dsp_client_ops {
 	int (*control_add)(struct cs_dsp_coeff_ctl *ctl);
 	void (*control_remove)(struct cs_dsp_coeff_ctl *ctl);
+	int (*pre_run)(struct cs_dsp *dsp);
 	int (*post_run)(struct cs_dsp *dsp);
 	void (*post_stop)(struct cs_dsp *dsp);
 	void (*watchdog_expired)(struct cs_dsp *dsp);
-- 
2.11.0

