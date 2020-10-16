Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CAE290AEA
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 19:40:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57E1D17E7;
	Fri, 16 Oct 2020 19:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57E1D17E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602870040;
	bh=oO5lcSHBIOZJqf/eift0ONX1eEm+d0Cs0pdAMWypPKY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GTNKcw/b57B7FsUX5alUEe7DQTdha9M6fdzWqOxtndhqkK2+NtAMj6fZ6io8TYTHt
	 Me2jQ1a982MehCd3uibVjW6xjcsWBZ9VGGeQIxwo+820FscZbkhERJu+TdmpfHnsUB
	 +vpMqExcWt9Cx0hxcd2JKCgEpGsqfbdSEISKndgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AE90F802D8;
	Fri, 16 Oct 2020 19:36:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16FBCF80296; Fri, 16 Oct 2020 19:36:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81E5FF80274
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 19:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81E5FF80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="k3FPVmQt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09GHQLpg024369; Fri, 16 Oct 2020 12:35:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=277Z0PefD7/3bHCFPZvHO3OjpBunOgY+as+ShFpcA00=;
 b=k3FPVmQtepxCKMeD69J8smRcmnQILFOGua0wtRXOO9SBOMtfiAlHyBd7oO3fp15o2xNl
 QYS9GeWp/dBxOWyLUgv35PQ7k5tPB8ygdi7zNPDYBypp/uvy+FEqO2CuxvejUouON2UM
 vEE24elPMfe4LZvzSYQdOTonPvqcFfg2O79obvzCpd81FFHGallnoLPkMc06fthMqyp+
 KUwORcL84kWSzOi0c2ZMYFBqlnQrCNu/B8hp6h5wk1OeAJ2ghlJntfQO8zX2yR8KjOt+
 6GKO0gBHVKcXck6oco7N3/GIS9skHsUrOsPczYz9bByoaFl2Xn8eLwjisjrizRSQR1OA hQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 343ac20jk8-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 16 Oct 2020 12:35:51 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 16 Oct
 2020 18:35:47 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 16 Oct 2020 18:35:47 +0100
Received: from AUSNPC0LSNW1-debian.ad.cirrus.com (ausnpc0lsnw1.ad.cirrus.com
 [198.61.64.143])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 616D045;
 Fri, 16 Oct 2020 17:35:47 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <nsaenzjulienne@suse.de>
Subject: [PATCH v2 7/7] MAINTAINERS: Add dts for Cirrus Logic Lochnagar on RPi4
Date: Fri, 16 Oct 2020 18:35:41 +0100
Message-ID: <20201016173541.21180-8-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201016173541.21180-1-rf@opensource.cirrus.com>
References: <20201016173541.21180-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010160130
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

Update the Cirrus Logic driver maintainers to include the device
tree files for using the Lochnagar with a Raspberry Pi 4.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f59b0412953..d0065cba9535 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4193,6 +4193,7 @@ M:	Charles Keepax <ckeepax@opensource.cirrus.com>
 M:	Richard Fitzgerald <rf@opensource.cirrus.com>
 L:	patches@opensource.cirrus.com
 S:	Supported
+F:	arch/arm/boot/dts/bcm2711-rpi4b-cirrus-lochnagar*
 F:	Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml
 F:	Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.yaml
 F:	Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
-- 
2.20.1

