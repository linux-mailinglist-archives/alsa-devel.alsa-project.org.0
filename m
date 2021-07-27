Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D63D3D7B66
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 18:51:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9847D1F27;
	Tue, 27 Jul 2021 18:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9847D1F27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627404694;
	bh=Q2zwpY1I44tqF+3CLEQ1p92YZsFj7Uh2gbCDX5kaq2I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JjkQ0HUlCRk9jkan1QjYneuLkT7F5ETns5HbACo7sMdRnvBro3XRDQKLLyHtAdiK1
	 6NlyhrS0dtCIgiXfqz9RtZS6CWwNO9Mo9Nt/Ca6YqROKNYx1HI61h91UGLKfkCmZHf
	 Ysi41ewHXTfF0f2wjDOfWKfE7HrzkoYMdPbU7QlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BF17F8026C;
	Tue, 27 Jul 2021 18:50:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 747A6F80258; Tue, 27 Jul 2021 18:50:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7765EF8020D
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 18:49:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7765EF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lTofL2nm"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16R55XUZ003859; 
 Tue, 27 Jul 2021 11:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=GayR9Rb9CjLVvh0msnLoqI/hMiOp1kLBQ2C3vuVoDUo=;
 b=lTofL2nmuwG+baVe9p9SwdnPZ/lDe09AzlNYk62qT5FARwps2WM9DcpzjjS8gKrT4obP
 ViPnqdV2QpsE2sGZ8cXxF4D04WCSLCUpgcSrMhQ/V3uXMmQLpJIbYtLolyMFPBl1cklO
 stS8fhszQskacetg8DbZHXyiFnY9uI5QdxlX4aW9k58H076E4ymrpB0GG5uNXmljOo4u
 af4Pvat9jUqF7AADTcy2FkkEkA8SHbdXDoR8TjGxi7NKRvi1SS+WlXkVa/13VieEYmaW
 4x1R8sTklFYFFXoao7rslLkQqBnam0vV4H71kHnNgWaY88C1uuGEnJf4rlUDHrnoZ3M3 Ew== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a233y9bx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 27 Jul 2021 11:49:53 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 27 Jul
 2021 17:49:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 27 Jul 2021 17:49:51 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.56])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C00EB2BA;
 Tue, 27 Jul 2021 16:49:50 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] MAINTAINERS: Add sound devicetree bindings for Wolfson Micro
 devices
Date: Tue, 27 Jul 2021 17:49:48 +0100
Message-ID: <20210727164948.4308-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TDLcE9aZT1mRIR7akA1AiqBB0LzXAu7b
X-Proofpoint-GUID: TDLcE9aZT1mRIR7akA1AiqBB0LzXAu7b
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxlogscore=838
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107270101
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

Include all wm* sound bindings in the section for Wolfson Micro
drivers. This section already includes the actual driver source
files.

Also update the existing entry to match all wlf,* sound bindings.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 19135a9d778e..d8282bb8a7e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20009,7 +20009,8 @@ F:	Documentation/devicetree/bindings/extcon/wlf,arizona.yaml
 F:	Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
 F:	Documentation/devicetree/bindings/mfd/wm831x.txt
 F:	Documentation/devicetree/bindings/regulator/wlf,arizona.yaml
-F:	Documentation/devicetree/bindings/sound/wlf,arizona.yaml
+F:	Documentation/devicetree/bindings/sound/wlf,*.yaml
+F:	Documentation/devicetree/bindings/sound/wm*
 F:	Documentation/hwmon/wm83??.rst
 F:	arch/arm/mach-s3c/mach-crag6410*
 F:	drivers/clk/clk-wm83*.c
-- 
2.11.0

