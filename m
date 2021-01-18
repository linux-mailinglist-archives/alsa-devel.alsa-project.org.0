Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2CA2F9CAA
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 11:36:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8EB617BA;
	Mon, 18 Jan 2021 11:35:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8EB617BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610966176;
	bh=+CBCSN9YJnA/iCesfZkr43LG6ee7kj0hZYmBoGttR3k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DV8H4lOo4cJ+CoZuYnJFrOgC9FqKwVT30OrVN5FoGvVPuaA7f/DIxttWEsSWm8HF3
	 QUfQkUdbEECCLhgLIdlmdnEp9cIJGrDYIlWYraUseBAaUBNT7dutkHGqRb2z3gFYyd
	 FSbyFxhEaxCQfT8pUMIRvjB+Lvih3NrE4SIkf6yY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86B56F8019D;
	Mon, 18 Jan 2021 11:34:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E01CF8016E; Mon, 18 Jan 2021 11:34:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1640F800E7
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 11:34:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1640F800E7
IronPort-SDR: FSf2BmyUIQzTT92nmNchAxsE6aanGeRLI3CBCrtWFw7g2pM6xtPm29X1aOrd152uZrgPNVkXel
 tGjgnR1SLWyQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="178872088"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; d="scan'208";a="178872088"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2021 02:34:25 -0800
IronPort-SDR: QJaEC6pc7e/BKk/6HUMEPmM2E8mIegX2R5dFk+Amp5Myg9uefSr1O7zUpDnRBg91P8qKfudwIG
 Xmuhi4mdxCVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; d="scan'208";a="365299894"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga002.jf.intel.com with ESMTP; 18 Jan 2021 02:34:22 -0800
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] dt-bindings: sound: intel, keembay-i2s: Fix dt binding errors
Date: Mon, 18 Jan 2021 18:27:06 +0800
Message-Id: <20210118102706.6125-1-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: jee.heng.sia@intel.com, broonie@kernel.org, lgirdwood@gmail.com,
 robh+dt@kernel.org
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

Fix devicetree binding errors caused by newly added parameters

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
---
 .../devicetree/bindings/sound/intel,keembay-i2s.yaml        | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
index e0658f122cbb..dba25c33f0b0 100644
--- a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
@@ -47,13 +47,11 @@ properties:
 
   dmas:
     items:
-      - description: DMA controller phandle and DMA channel
-                     for TX and RX
+      - description: DMA TX channel
+      - description: DMA RX channel
 
   dma-names:
     items:
-      - description: "tx" for the transmit channel
-                     "rx" for the receive channel
       - const: tx
       - const: rx
 
-- 
2.17.1

