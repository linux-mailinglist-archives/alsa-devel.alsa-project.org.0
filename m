Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 870E97812A
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jul 2019 21:29:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9E411858;
	Sun, 28 Jul 2019 21:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9E411858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564342152;
	bh=BUci5X5tlWsbgkvm/8c6dbL8DUaJda5m48FJVeO94ws=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FmBNHcqSvufFMmnBYfNSwM23t98bwC6/t5wuFzwNCD+9nOJBWWUWF1iM8yHPw/6gj
	 4wlyEXg2RhzeS+e3Z7kuiwLkWJtK9lvf5hEJqEMg83F37WEiHAIfv0ZUsgGcmg1x7h
	 TAHQ4jQw+Oufl7f/beMPGYMU/yI+rY5ux4509DiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12251F8053A;
	Sun, 28 Jul 2019 21:25:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B79CF80506; Sun, 28 Jul 2019 21:24:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EE2DF80134
 for <alsa-devel@alsa-project.org>; Sun, 28 Jul 2019 21:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EE2DF80134
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6507C1A123D;
 Sun, 28 Jul 2019 21:24:49 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 57B071A1232;
 Sun, 28 Jul 2019 21:24:49 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 8E9CB2060A;
 Sun, 28 Jul 2019 21:24:48 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Date: Sun, 28 Jul 2019 22:24:26 +0300
Message-Id: <20190728192429.1514-5-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190728192429.1514-1-daniel.baluta@nxp.com>
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel@pengutronix.de, timur@kernel.org, robh@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>, shengjiu.wang@nxp.com, angus@akkea.ca,
 tiwai@suse.com, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 linux-imx@nxp.com, viorel.suman@nxp.com, festevam@gmail.com,
 mihai.serban@gmail.com, l.stach@pengutronix.de
Subject: [alsa-devel] [PATCH v2 4/7] ASoC: dt-bindings: Document dl-mask
	property
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SAI supports up to 8 data lines. This property let the user
configure how many data lines should be used per transfer
direction (Tx/Rx).

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl-sai.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
index 2e726b983845..2b38036a4883 100644
--- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
@@ -49,6 +49,13 @@ Optional properties:
 
   - big-endian		: Boolean property, required if all the SAI
 			  registers are big-endian rather than little-endian.
+  - fsl,dl-mask		: list of two integers (bitmask, first for RX, second
+			  for TX) representing enabled datalines. Bit 0
+			  represents first data line, bit 1 represents second
+			  data line and so on. Data line is enabled if
+			  corresponding bit is set to 1. By default, if property
+			  not present, only dataline 0 is enabled for both
+			  directions.
 
 Optional properties (for mx6ul):
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
