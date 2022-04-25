Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 346C850DD36
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 11:53:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7C1E851;
	Mon, 25 Apr 2022 11:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7C1E851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650880400;
	bh=DioN8JmHiWUhPNUiHHcxaZSpqhlplu4NzErJ5KIVmSk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=THLkpqOWlR0yep/x15ZBpC7EOMXjeoMu0UAUy9K/J5fR+N7AomTsYebaxVtL1lwGl
	 CGDtciIlcWc5G1kvYecLbIXCyV4GyC3XAPF8gBYFovlq7CbHi+Rn0aZ3fcxT1mUwIl
	 LaBw1zZ6yCQ6EyLM0nFTdT4yDpkhfgn1uy8r0P+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31900F8014B;
	Mon, 25 Apr 2022 11:52:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C314F8016A; Mon, 25 Apr 2022 11:52:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 516A4F8014B
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 11:52:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 516A4F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jthua2Ku"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23P9PN9p019843;
 Mon, 25 Apr 2022 04:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=NFYRxNRFMgph5kuhS/kFHxiZIc8JuWC3fIicqgsvoqw=;
 b=jthua2KuL1MAJPBg7Hz+E4nZHxUeSqasfyxx5l/qlTU56YNZucP6HkwZ3quIvrYBk1Nq
 K3oBw5KD9CrFOrAhpgm8qIrsvO/PXfJ8oehG5yHL3rwMlnYYPHsihMdc8PMn8jayvzyC
 wXrVtSJfJNm3Gf+Dl9E0LRWj1eA//X0OjoRL6C65LHyMRKZkeHsYhqUqfCADC4PMKnOG
 LIF2z3YRMKaEdLeQUG6Iq/jLw6LhvjrOxbJgdtlGIWFrJk1UdATyerkMW7lmKW1aUhIV
 qrjiXoCjgk3/3rpL0mekJGGxLlqILH7H7l8fzXaAhHprpQGTHukpoEEdepJFtdJ1fBxk MA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fmev31rbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 25 Apr 2022 04:52:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 25 Apr
 2022 10:52:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 25 Apr 2022 10:52:09 +0100
Received: from debianA11184.ad.cirrus.com (debianA11184.ad.cirrus.com
 [198.90.251.83])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 54717B16;
 Mon, 25 Apr 2022 09:52:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] firmware: cirrus: cs_dsp: Avoid padding bytes in
 cs_dsp_coeff_ctl
Date: Mon, 25 Apr 2022 10:51:59 +0100
Message-ID: <20220425095159.3044527-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: OJnBY_xRTKz-Fg6o5MuUGyNJgsWreoGb
X-Proofpoint-GUID: OJnBY_xRTKz-Fg6o5MuUGyNJgsWreoGb
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

Change the order of members in struct cs_dsp_coeff_ctl to avoid
the compiler having to insert alignment padding bytes. On a x86_64
build this saves 16 bytes per control.

- Pointers are collected to the top of the struct (with the exception of
  priv, as noted below), so that they are inherently aligned.
- The set and enable bitflags are placed together so they can be merged.
- priv is placed at the end of the struct - it is for use by the
  client so it is helpful to make it stand out, and since the compiler
  will always pad the struct size to an alignment multiple putting a
  pointer last won't introduce any more padding.
- struct cs_dsp_alg_region is placed at the end, right before priv, for
  the same reasoning as priv.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/linux/firmware/cirrus/cs_dsp.h | 28 +++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 38b4da3ddfe4..30055706cce2 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -68,36 +68,36 @@ struct cs_dsp_alg_region {
 
 /**
  * struct cs_dsp_coeff_ctl - Describes a coefficient control
+ * @list:		List node for internal use
+ * @dsp:		DSP instance associated with this control
+ * @cache:		Cached value of the control
  * @fw_name:		Name of the firmware
  * @subname:		Name of the control parsed from the WMFW
  * @subname_len:	Length of subname
- * @alg_region:		Logical region associated with this control
- * @dsp:		DSP instance associated with this control
- * @enabled:		Flag indicating whether control is enabled
- * @list:		List node for internal use
- * @cache:		Cached value of the control
  * @offset:		Offset of control within alg_region in words
  * @len:		Length of the cached value in bytes
- * @set:		Flag indicating the value has been written by the user
- * @flags:		Bitfield of WMFW_CTL_FLAG_ control flags defined in wmfw.h
  * @type:		One of the WMFW_CTL_TYPE_ control types defined in wmfw.h
+ * @flags:		Bitfield of WMFW_CTL_FLAG_ control flags defined in wmfw.h
+ * @set:		Flag indicating the value has been written by the user
+ * @enabled:		Flag indicating whether control is enabled
+ * @alg_region:		Logical region associated with this control
  * @priv:		For use by the client
  */
 struct cs_dsp_coeff_ctl {
+	struct list_head list;
+	struct cs_dsp *dsp;
+	void *cache;
 	const char *fw_name;
 	/* Subname is needed to match with firmware */
 	const char *subname;
 	unsigned int subname_len;
-	struct cs_dsp_alg_region alg_region;
-	struct cs_dsp *dsp;
-	unsigned int enabled:1;
-	struct list_head list;
-	void *cache;
 	unsigned int offset;
 	size_t len;
-	unsigned int set:1;
-	unsigned int flags;
 	unsigned int type;
+	unsigned int flags;
+	unsigned int set:1;
+	unsigned int enabled:1;
+	struct cs_dsp_alg_region alg_region;
 
 	void *priv;
 };
-- 
2.30.2

