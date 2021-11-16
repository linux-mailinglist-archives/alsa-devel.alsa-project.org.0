Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8C2453722
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 17:18:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E58EE16CD;
	Tue, 16 Nov 2021 17:17:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E58EE16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637079527;
	bh=Az+FANuxkiRncwA1GTpUZQp4gvXNmhRAC3jkADYM+To=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rhipQGdSQHKGnjsdfDFPaTwYLKOgZSfdp8juSUKa/RqcdhsaiQF5qmdRUcxwk9Fxx
	 bq22Po3HjjTNQ2Eoj1rtr22aybaaHIoQGNkBNR5B0cGyyMZxa4zRqME4qB3lHUvLoY
	 0R2W2xfDXutI0yLsXoQPl55ferZDj+woObxOJZX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D46EDF804FA;
	Tue, 16 Nov 2021 17:16:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BA10F804BC; Tue, 16 Nov 2021 17:16:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 303AAF804BC
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 17:16:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 303AAF804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="LiHJLE4T"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG7FCjg005416;
 Tue, 16 Nov 2021 10:16:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=yHc5l3+auSKkr5tL9aYk+lBzV8TZVhy1kR4vTylzKng=;
 b=LiHJLE4T1/Oq4mDQkDzlX62P4btBcvgCuMrW4egey2Fh307KVO+1XlNAFA5kr86GMuxu
 b/HOMGb1Ks3h5bmB5LtdCFZpdym9zBHSVksicxOOeERc1RlY5Tiw76ohb7Yd9FfrMQUI
 qAQIknx+dI5la44/QnNh8dD92ZqeXeSPZXXD+e89qTXE6s928S/YQkg8qDmgT4Q+AUXF
 iHmdUCAquTVaFMCSnwb1occzzaLxcc3ukVU8MdN1rEB1Gx1hkMTVb8+c36z7wVHnMfMB
 9avQdTGBcNmKTRpRNuFbwa9JB4rbeL9ZwwnXh20GOUYmdkEmDMZ49unX8QO9Z0yRyg7T qQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cbdjgt2t5-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 16 Nov 2021 10:16:13 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 16:16:09 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 16 Nov 2021 16:16:09 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 92D3511DB;
 Tue, 16 Nov 2021 16:16:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 08/10] firmware: cs_dsp: Clarify some kernel doc comments
Date: Tue, 16 Nov 2021 16:16:07 +0000
Message-ID: <20211116161609.12223-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
References: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 21ySm1IGpDg1MsG7Uh0_5GiRyMGfXns0
X-Proofpoint-GUID: 21ySm1IGpDg1MsG7Uh0_5GiRyMGfXns0
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

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 4 ++--
 include/linux/firmware/cirrus/cs_dsp.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 9eecd16265375..d1bcade2efe23 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -746,7 +746,7 @@ static int cs_dsp_coeff_write_ctrl_raw(struct cs_dsp_coeff_ctl *ctl,
  * cs_dsp_coeff_write_ctrl() - Writes the given buffer to the given coefficient control
  * @ctl: pointer to coefficient control
  * @buf: the buffer to write to the given control
- * @len: the length of the buffer
+ * @len: the length of the buffer in bytes
  *
  * Must be called with pwr_lock held.
  *
@@ -808,7 +808,7 @@ static int cs_dsp_coeff_read_ctrl_raw(struct cs_dsp_coeff_ctl *ctl, void *buf, s
  * cs_dsp_coeff_read_ctrl() - Reads the given coefficient control into the given buffer
  * @ctl: pointer to coefficient control
  * @buf: the buffer to store to the given control
- * @len: the length of the buffer
+ * @len: the length of the buffer in bytes
  *
  * Must be called with pwr_lock held.
  *
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 0bf849baeaa5a..1ad1b173417a0 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -76,8 +76,8 @@ struct cs_dsp_alg_region {
  * @enabled:		Flag indicating whether control is enabled
  * @list:		List node for internal use
  * @cache:		Cached value of the control
- * @offset:		Offset of control within alg_region
- * @len:		Length of the cached value
+ * @offset:		Offset of control within alg_region in words
+ * @len:		Length of the cached value in bytes
  * @set:		Flag indicating the value has been written by the user
  * @flags:		Bitfield of WMFW_CTL_FLAG_ control flags defined in wmfw.h
  * @type:		One of the WMFW_CTL_TYPE_ control types defined in wmfw.h
-- 
2.11.0

