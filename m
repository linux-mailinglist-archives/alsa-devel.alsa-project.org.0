Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AF263787C
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 13:04:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EF0716E9;
	Thu, 24 Nov 2022 13:03:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EF0716E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669291489;
	bh=PkaX/hCGwuAwSuBQQJYYpwL96/ix3QXdgk5qRBflZcc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KOmdXGA2mB1F3izyVQdjRV43Bd8ThBUadWfUmgqmF5HUlilFFs5PL9krJ3vC79DQy
	 gBUkNSmREWMcNmqOeCE1WPHfGlHntD4VFcPTMAiOMTDO7mrSXARzPdR4mjTObRWoox
	 6YNxQamgXRZ1K7+X3YXi63Z4cPBZ8kafu+2GuRVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAFCAF80448;
	Thu, 24 Nov 2022 13:03:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63B45F8014E; Thu, 24 Nov 2022 13:03:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 2003FF80149
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 13:03:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2003FF80149
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
 by maillog.nuvoton.com (Postfix) with ESMTP id B44471C811C0;
 Thu, 24 Nov 2022 20:03:39 +0800 (CST)
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Thu, 24 Nov
 2022 20:03:39 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Thu, 24 Nov
 2022 20:03:39 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 24 Nov 2022 20:03:39 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: add compatible string for NAU8318
Date: Thu, 24 Nov 2022 20:03:29 +0800
Message-ID: <20221124120330.55845-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com, David Lin <CTLIN0@nuvoton.com>
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

The audio amplifier NAU8318 is almost functionally identical to NAU8315.
Adds compatible string "nuvoton,nau8318" for driver reuse.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 Documentation/devicetree/bindings/sound/nau8315.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nau8315.txt b/Documentation/devicetree/bindings/sound/nau8315.txt
index 6eaec46f384c..1cd94517d45e 100644
--- a/Documentation/devicetree/bindings/sound/nau8315.txt
+++ b/Documentation/devicetree/bindings/sound/nau8315.txt
@@ -2,6 +2,7 @@ Nuvoton NAU8315 Mono Class-D Amplifier
 
 Required properties:
 - compatible   : "nuvoton,nau8315"
+                 "nuvoton,nau8318"
 
 Optional properties:
 - enable-gpios : GPIO specifier for the chip's device enable input(EN) pin.
@@ -16,3 +17,8 @@ nau8315 {
 	compatible = "nuvoton,nau8315";
 	enable-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
 };
+
+nau8318 {
+	compatible = "nuvoton,nau8318";
+	enable-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+};
-- 
2.25.1

