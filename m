Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5069F5752E9
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 18:36:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F32EB181C;
	Thu, 14 Jul 2022 18:36:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F32EB181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657816614;
	bh=OFO7jHLbQ9m7KwxEYyqk1uyQ5ZITDYztcNklMs1vRcY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tsb03y54AMN4CZ0BLPSO3r1fUcSkNjrOU1nMY2iqNm0E+g8baDExYmKgi9cSHlHPS
	 lqvXxJrsDOxDJ0iuG+e3Zfc1IuLqIVs3sMFI9UEVlKnrohub6sn7+KUDWl/ZR8Wirw
	 /h5lHMh7E9Ut7+YXWTlL6AXLcMKJizu9vj4UfGj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C285F80557;
	Thu, 14 Jul 2022 18:34:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CF13F8047C; Mon, 11 Jul 2022 20:30:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C374F80152
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 20:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C374F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="vxEnyCvM"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657564208; x=1689100208;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OFO7jHLbQ9m7KwxEYyqk1uyQ5ZITDYztcNklMs1vRcY=;
 b=vxEnyCvMSE2U2/5QA7959L8wFXDdVUC+Fz4r2W2MhmftL0QVmI4zqjxf
 HudvnClOpOigyDcCq7/eebeBgYNKwDeji1hhZI4dAauBjhzfPfAkiNa71
 u0ztwkuH4kTTXoXmRGd253hMHd9MegPyx9BHzjgTzsiYfZ5vSQ47aVbar
 aS0qqySM4w9fzK3jAZrAOg5mru/CbRjtY7f/vUg/P0dzKjzKQzINqOo5j
 /YWFVs4cGKvnjt/1S7c6KNRBYgSvCD6uaX0Xx/X4ci5HG2J62AGNoNFUM
 F9/6eoHOCDz2ii5GLxVqfo2d3LTACyeWp6cJWCVgsxTflbegUgXvl+elK g==;
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; d="scan'208";a="103970015"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Jul 2022 11:30:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Jul 2022 11:30:00 -0700
Received: from ryan-Precision-5560.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 11 Jul 2022 11:30:00 -0700
From: <Ryan.Wanner@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>
Subject: [PATCH v2 0/2] dt-bindings: sound: Convert to json-schema
Date: Mon, 11 Jul 2022 11:30:08 -0700
Message-ID: <20220711183010.39123-1-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 14 Jul 2022 18:34:36 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Ryan
 Wanner <Ryan.Wanner@microchip.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

This patch series converts atmel-classd and atmel-pdmic device tree
bindings to json-schema.

v1 -> v2:
- Fix commit formatting.
- Fix titles in yaml file
- Removed trivial descriptions
- Correct formatting errors 

Ryan Wanner (2):
  dt-bindings: sound: atmel,classd: Convert to json-schema
  dt-binding: sound: atmel,pdmic: Convert to json-schema

 .../bindings/sound/atmel,sama5d2-classd.yaml  | 104 ++++++++++++++++++
 .../bindings/sound/atmel,sama5d2-pdmic.yaml   |  98 +++++++++++++++++
 .../bindings/sound/atmel-classd.txt           |  55 ---------
 .../devicetree/bindings/sound/atmel-pdmic.txt |  55 ---------
 4 files changed, 202 insertions(+), 110 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,sama5d2-pdmic.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-classd.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-pdmic.txt

-- 
2.34.1

