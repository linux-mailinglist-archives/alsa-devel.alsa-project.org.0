Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE4034FAFE
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 10:00:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5978411C;
	Wed, 31 Mar 2021 09:59:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5978411C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617177631;
	bh=FVblHRbW1iGSsxCYaIaWGrNDtupDVgKF3nxItEK80f8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZNLP90VYx1ck9vwVSE2lAt/PX3j+puONbS/eIHO7uytPeH2ne4PxZfiR2togh59Dj
	 qaMqa+et5WbV6tsCWdLooIXaaioSMGUjsZn3AVX+PHIVo49AK7CpjvVzD+EorWW5tJ
	 OXA0iArBZ9vLLn2BcmhSR87x3Y2/IwbdXbCW+7QU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABCC7F80166;
	Wed, 31 Mar 2021 09:59:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7702F8013C; Wed, 31 Mar 2021 09:59:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C390F8013C
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 09:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C390F8013C
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 905C91A01AD;
 Wed, 31 Mar 2021 09:58:50 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3A3751A1543;
 Wed, 31 Mar 2021 09:58:47 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B4D3640319;
 Wed, 31 Mar 2021 09:58:42 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: dt-bindings: ak5558: Add compatible string for
 ak5552
Date: Wed, 31 Mar 2021 15:44:46 +0800
Message-Id: <1617176686-25528-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617176686-25528-1-git-send-email-shengjiu.wang@nxp.com>
References: <1617176686-25528-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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

Add compatible string "asahi-kasei,ak5552" for ak5552

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/ak5558.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/ak5558.txt b/Documentation/devicetree/bindings/sound/ak5558.txt
index 36934098170c..e28708db6686 100644
--- a/Documentation/devicetree/bindings/sound/ak5558.txt
+++ b/Documentation/devicetree/bindings/sound/ak5558.txt
@@ -4,7 +4,7 @@ This device supports I2C mode only.
 
 Required properties:
 
-- compatible : "asahi-kasei,ak5558"
+- compatible : "asahi-kasei,ak5558" or "asahi-kasei,ak5552".
 - reg : The I2C address of the device.
 
 Optional properties:
-- 
2.27.0

