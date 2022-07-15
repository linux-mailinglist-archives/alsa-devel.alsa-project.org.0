Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F16557654F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 18:30:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20BFF1926;
	Fri, 15 Jul 2022 18:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20BFF1926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657902630;
	bh=XLDoisr6NFA1lVrLrqatV82skwaxioW4MC9gQRXY5I8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mwwyyWeGCkFw8S2ZbqfZS3DnRXmWDIB3j+4t9J6uzXMqTJ3ps3m3u3556O4o5mibV
	 oJ8RJfpVc5aNvwh7pk87IBtMcYuSqERVfV1ABkQcwrd+36hi0fzKJvhMFUeC2Mdz9X
	 mkXpfFBfVLsWBkTbGhsrXKh5mlxnEC7mN/xGaLvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B112F800AA;
	Fri, 15 Jul 2022 18:29:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD3A3F80153; Fri, 15 Jul 2022 18:29:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CFE7F800AA
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 18:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CFE7F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="GKImok9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657902561; x=1689438561;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XLDoisr6NFA1lVrLrqatV82skwaxioW4MC9gQRXY5I8=;
 b=GKImok9BJqv45/xNj8QCBV0e5oNxqzOs9cRZxGBXBGVQ1NJEzrIS1Px7
 3EYWz0lRJ9fXsr8F8RQBF7zrXzpykVhx95kjHzqoasjrNydImVaS4XAbc
 YY2VKQHryvr2tFXzbwSP2yN7349fYU20cdSu1aRjfoEcMVhTXTWoUnbOo
 6eePplghQTGnA9JkhtO5OmUosu+0HQBUQVb3OsM96yhpGr762bzHW9blG
 1bnqxR/vFuxCFk7jWfuhzJdp5nkQZ0cuhHnhK5JY84cAWtdCCt6xUFxDL
 jb+fcFo63UfRTczL0x4DlZDD0TPaxecQydVu2KOgSRLYq6OwGlzzif23/ w==;
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="172317074"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Jul 2022 09:29:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Jul 2022 09:29:13 -0700
Received: from ryan-Precision-5560.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 15 Jul 2022 09:29:13 -0700
From: <Ryan.Wanner@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>
Subject: [PATCH v3 0/2] ASoC: dt-bindings: atmel-classd: Convert to
Date: Fri, 15 Jul 2022 09:29:20 -0700
Message-ID: <20220715162922.660859-1-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
- Fix titles in yaml file.
- Removed trivial descriptions.
- Correct formatting errors.

v2 -> v3:
- Fix subsystem prefix.
- Fix word wrap formatting.
- Removed assigned-clocks parameter.
- Correct descriptions in inconsistent locations.
- Remove duplicated description.
- Correct formatting for dts example.

Ryan Wanner (2):
  ASoC: dt-bindings: atmel-classd: Convert to json-schema
  ASoC: dt-bindings: atmel-classd: PDMIC convert to json-schema

 .../bindings/sound/atmel,sama5d2-classd.yaml  | 100 ++++++++++++++++++
 .../bindings/sound/atmel,sama5d2-pdmic.yaml   |  98 +++++++++++++++++
 .../bindings/sound/atmel-classd.txt           |  55 ----------
 .../devicetree/bindings/sound/atmel-pdmic.txt |  55 ----------
 4 files changed, 198 insertions(+), 110 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,sama5d2-pdmic.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-classd.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-pdmic.txt

-- 
2.34.1

