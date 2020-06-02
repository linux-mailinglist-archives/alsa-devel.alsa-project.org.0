Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9E41EC2DF
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 21:37:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 795321660;
	Tue,  2 Jun 2020 21:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 795321660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591126651;
	bh=DYKRnjysq8sKGDX3RohvAWEwssYAxk3h0GnxsbADM+w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pD/xJLzd/S/5SJA5YMMy824riWMPYTYMXijKnQys96yhuhw1ElgvPfsLEWpsC+0TO
	 sgIPBI4z3sn8PaMgJ9DPZQbAcVPHTIBzdJ+pg+LzDCcNo5Dx/PUcNNPw17EkKgMyR0
	 agPQ+AKfYgB8rs6xuDR1ujFldccv3iNAx7kLdLW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E5FBF80274;
	Tue,  2 Jun 2020 21:35:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A649FF800B8; Tue,  2 Jun 2020 21:35:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D92DAF800B8
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 21:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D92DAF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hhZEW1wH"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 052JZUKG110487;
 Tue, 2 Jun 2020 14:35:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591126530;
 bh=b/5XkevPHJRhZ2gZPRNiUFvjA4NxbX0UBQv0ibyIS/k=;
 h=From:To:CC:Subject:Date;
 b=hhZEW1wH2G8LUUa2Oqp26T/S0wzqzgHBRdGcVPTBR99RJFKg9uCSRcXLHZ1BexB6a
 0QaV3sNMEKJ3UN0VzxrPyRrEl7s7I2EC1cNPJFUJ5pp4o00ciz7dtYqgZn25Y8kinE
 Tzywzhonp7f6Eyo/+TJxtmMaWLapAaGO5i55CwGM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 052JZUVv102654;
 Tue, 2 Jun 2020 14:35:30 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 2 Jun
 2020 14:35:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 2 Jun 2020 14:35:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 052JZTWP050953;
 Tue, 2 Jun 2020 14:35:30 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 1/2] dt-bindings: ASoc: Fix tdm-slot documentation spelling
 error
Date: Tue, 2 Jun 2020 14:35:23 -0500
Message-ID: <20200602193524.30309-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org
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

Fix the spelling of 'specified'.  Also fix grammarical issue with the
use of 'a' over 'an'

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 Documentation/devicetree/bindings/sound/tdm-slot.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.txt b/Documentation/devicetree/bindings/sound/tdm-slot.txt
index 34cf70e2cbc4..4bb513ae62fc 100644
--- a/Documentation/devicetree/bindings/sound/tdm-slot.txt
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.txt
@@ -14,8 +14,8 @@ For instance:
 	dai-tdm-slot-tx-mask = <0 1>;
 	dai-tdm-slot-rx-mask = <1 0>;
 
-And for each spcified driver, there could be one .of_xlate_tdm_slot_mask()
-to specify a explicit mapping of the channels and the slots. If it's absent
+And for each specified driver, there could be one .of_xlate_tdm_slot_mask()
+to specify an explicit mapping of the channels and the slots. If it's absent
 the default snd_soc_of_xlate_tdm_slot_mask() will be used to generating the
 tx and rx masks.
 
-- 
2.26.2

