Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA033D02D
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 09:55:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17F57192B;
	Tue, 16 Mar 2021 09:54:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17F57192B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615884949;
	bh=sKAa5eC2apofwKJIZO59abb3yZrkRnTXidfiIl0ooBs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NaS2t3kKexeXtQBhKT9Y647MkcQwRxniHOrp52SyCd1+5b4wYEhySXUnpHKIHDJ5i
	 pjwN8KjYxP7VzPPk6vC/6Y58wt+s8CWVQSD/gQWwA8WPNgsZ3IzEbEATGoM0t5dAmi
	 fRw8Quog+10tVnpN7VFQXmTpoFiBwSY61+SQzYo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 718DAF80148;
	Tue, 16 Mar 2021 09:54:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11168F80163; Tue, 16 Mar 2021 09:54:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1FD6F80148
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 09:54:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1FD6F80148
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4938B200328;
 Tue, 16 Mar 2021 09:54:07 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D0B1A203E04;
 Tue, 16 Mar 2021 09:54:03 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3F944402C1;
 Tue, 16 Mar 2021 09:53:59 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: fsl_spdif: Add compatible string for new
 platforms
Date: Tue, 16 Mar 2021 16:40:53 +0800
Message-Id: <1615884053-4264-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
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

Add compatible string for new added platforms which support spdif module.
They are i.MX8QXP, i.MX8MM, i.MX8MN, i.MX8MQ.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,spdif.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
index 50449b6d1048..4454aca34d56 100644
--- a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
@@ -21,6 +21,10 @@ properties:
       - fsl,vf610-spdif
       - fsl,imx6sx-spdif
       - fsl,imx8qm-spdif
+      - fsl,imx8qxp-spdif
+      - fsl,imx8mq-spdif
+      - fsl,imx8mm-spdif
+      - fsl,imx8mn-spdif
 
   reg:
     maxItems: 1
-- 
2.27.0

