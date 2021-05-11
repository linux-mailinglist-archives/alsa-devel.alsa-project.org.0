Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB037ACEF
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 19:17:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50953181A;
	Tue, 11 May 2021 19:16:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50953181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620753434;
	bh=yLcrGb1u1NZWZ7/VigfWiXEhyt9eeDAxZrDQm3joj3s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sul52CxwRasmitCwWN7OkFSRoJCX9+8xcDRIcxoa+DdANXZ69wY2QtEjPuyGaL7UU
	 ByqCyHwxjAxtTv6Pm70FufLu6fyoyBh48j84kmXAR8CKnuRy+tZ+0NL6wnCSpyO2Ww
	 td2ED0bY3N5n86b6k10j+1/TLGaAeCJ42QvTtScY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18415F8028D;
	Tue, 11 May 2021 19:15:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3107F80279; Tue, 11 May 2021 19:15:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCF84F8016B
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 19:15:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCF84F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jytKabz/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14BGujAW031298; Tue, 11 May 2021 12:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=9ndZ4Sg/BsAajmexo+cNarRaAk/nyP1KuR4qQ82WWoc=;
 b=jytKabz/KUqmSDt19EHVc7fkBjNj3tvRx7ZOb27zLFvUBch30jllG+5vyK9CczlRQLlz
 FNexpoDvAttAiUeGQvHAFVbirFPZoJBaFgmVDZISH0UeQ2y5Qm+y8+JoQiNkOevZW20N
 /Abw4yhzK6DegjSPctj+IAZbdG83uaNyuLLPxiCId428CyqPg/yctgdfLbiWyBl+Y87U
 YDwIFiJOimEjR0eVzq5gQrF+GazRQRgLp8czxHY1sEJOA7M25EZzorWIb7jyKRhPtqq7
 mdtSCzbEVYApw6jPJbDERtCCbOTrGQ1KK4VTaobtB26XMu++zsSVTxxMJ952TY42EgVH aA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 38f4x19u8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 11 May 2021 12:15:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 11 May
 2021 18:15:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 11 May 2021 18:15:15 +0100
Received: from simont-vb.lan?044ad.cirrus.com (unknown [198.90.238.134])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AA65211CD;
 Tue, 11 May 2021 17:15:15 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: wm2200: remove include of wmfw.h
Date: Tue, 11 May 2021 18:15:14 +0100
Message-ID: <20210511171514.270219-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _cIyhthWNAGhruOFNLJMwSDu5EzkXYky
X-Proofpoint-ORIG-GUID: _cIyhthWNAGhruOFNLJMwSDu5EzkXYky
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=716 clxscore=1015 bulkscore=0
 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110118
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Simon Trimmer <simont@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

We want all wm_adsp clients to use the wm_adsp.h header as they
shouldn't need to include internal sub-headers.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/codecs/wm2200.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
index b0a6d31299bb..c35673e7f420 100644
--- a/sound/soc/codecs/wm2200.c
+++ b/sound/soc/codecs/wm2200.c
@@ -30,7 +30,6 @@
 #include <sound/wm2200.h>
 
 #include "wm2200.h"
-#include "wmfw.h"
 #include "wm_adsp.h"
 
 #define WM2200_DSP_CONTROL_1                   0x00
-- 
2.31.1

