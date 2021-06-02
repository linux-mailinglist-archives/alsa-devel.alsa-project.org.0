Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B06BD39810F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 08:22:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3553116DE;
	Wed,  2 Jun 2021 08:21:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3553116DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622614922;
	bh=jplEBxDd8R/Ahstr6hCMu67LDfVJZuf3OLfQ1OxV04M=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h8zVQXxlLUoQTa+gvMgGiwbqj6EP5hN/s8ymVPK7tnycwQaJpdhgfqc+sQUpSnekv
	 2fQJbtF+c/qztSnt0J1XQNFAOrPAKeblPdL33VH1sS7yYw8KQJZG0468clD6Tc5H4X
	 etrmo7R1dmXvQKOQV6jw/wmPqIdadYhqtV0RwEDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 841BBF80424;
	Wed,  2 Jun 2021 08:20:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83D57F80273; Wed,  2 Jun 2021 08:20:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16347F80273
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 08:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16347F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="osPWG7HF"
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A4AD61A35AA;
 Wed,  2 Jun 2021 08:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva020.eu-rdc02.nxp.com A4AD61A35AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
 s=nselector3; t=1622614822;
 bh=916qkDrbfLsKea6v3J9EiWiH16tJt1dJtsGTn8zGZMM=;
 h=From:To:Subject:Date:From;
 b=osPWG7HF4wbDUh6UkQpDFSqdLTOzxNN0k9Ej83Unbhh9ktSyxgehINw8ZDR1nnAFG
 FMX+E5a7dNtNMrcV6EhBg7K7XrZkfisvwH0lg2/nKqJhwVT+B0bySseDmq8dFDU/W6
 3+OrgsnwqhgjnmJbRiQ2mHQH9sSMgdFF3ZtKdQlTq9EMZbsxGUacHpEU3Ss/jiXyt/
 yAAb6A4GUGvk9Sv0YxDwBL8+eVU8uF9B28l+pczF8b5OOsyOnb/uY5quq9fStxvNf/
 IW1DTgnbXttRdNzN+9XcGnlvJDg7KOubIYqnPyLP5ODub+d+Mi+QmxNVbNt1BeNS0F
 8jyadsRh7WXFA==
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EDCA81A1E65;
 Wed,  2 Jun 2021 08:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva020.eu-rdc02.nxp.com EDCA81A1E65
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id AE51F4028B;
 Wed,  2 Jun 2021 14:20:16 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: fsl-sai: Add compatible string for
 imx8mm/8mn/8mp/8ulp
Date: Wed,  2 Jun 2021 14:02:50 +0800
Message-Id: <1622613770-10220-1-git-send-email-shengjiu.wang@nxp.com>
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

Add compatible string for imx8mm/8mn/8mp/8ulp, these platforms all
support SAI IP.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl-sai.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
index 0dc83cc4a236..c71c5861d787 100644
--- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
@@ -9,8 +9,10 @@ Required properties:
 
   - compatible		: Compatible list, contains "fsl,vf610-sai",
 			  "fsl,imx6sx-sai", "fsl,imx6ul-sai",
-			  "fsl,imx7ulp-sai", "fsl,imx8mq-sai" or
-			  "fsl,imx8qm-sai".
+			  "fsl,imx7ulp-sai", "fsl,imx8mq-sai",
+			  "fsl,imx8qm-sai", "fsl,imx8mm-sai",
+			  "fsl,imx8mn-sai", "fsl,imx8mp-sai", or
+			  "fsl,imx8ulp-sai".
 
   - reg			: Offset and length of the register set for the device.
 
-- 
2.27.0

