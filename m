Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DAB3FB416
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Aug 2021 12:50:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C0251723;
	Mon, 30 Aug 2021 12:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C0251723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630320602;
	bh=usbyNj5IeNgrsk3Uei98GMZEnx/QqhyJ1XLt49/UCGQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z0zwr13sWJtwa6OsuGa9H/MSJHS8Tfn8QEY9meFGOMDDn1bQeojeTMrVuUK93Dbuw
	 MqA1XgPpVwuY5lENvUnJKOpihlR4W9Bfwz1zBSH0C9s01Bem2CHTD8Pfllx3CqJe3i
	 pHr65sRwWlEdhxWo2MA2pRf71h+/QHST+2WTNIQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 314ECF8032B;
	Mon, 30 Aug 2021 12:48:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77F7EF802E0; Mon, 30 Aug 2021 12:48:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dnyon.com (dnyon.com [82.223.165.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D48C1F80169
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 12:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D48C1F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="gkt2/RzF"
Received: from dnyon.com (45.74.222.87.dynamic.jazztel.es [87.222.74.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id 96F4F40457;
 Mon, 30 Aug 2021 10:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1630320495; bh=usbyNj5IeNgrsk3Uei98GMZEnx/QqhyJ1XLt49/UCGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gkt2/RzF2mL2OXMF+k91W9z1erWHWMyIFDAhMzrhqAd4RnpKahO7Dd4X+QpEZhKzH
 xbov3MDY8icOFZc5hqjEoyYr02y19Ej3raIxKxvk0wEQcikdeozfhjipLDaOamcDH8
 Y1AfDdyvuHUlKr+hvfF4M1T60jYFluwNg6vNCN+G2VgBf1bdhaR8iFyWX6/Yu+9y1w
 U/xSCZsPEsJWTFeP9lYRk3D6mwxTB/imBX+YQqTB8hKdaBiQzPr3MKx/6Wqz8uzuwU
 maUsej44S47n/Vdzhjn3/qnJk3pFCUS9U1hz3gFeinb6reQG90g3ZFK7i/tuLUZXZs
 dXK6m9ywqrf9Q==
From: Alejandro Tafalla <atafalla@dnyon.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] dt-bindings: sound: max98927: Add reset-gpios optional
 property
Date: Mon, 30 Aug 2021 12:44:24 +0200
Message-Id: <20210830104426.487246-3-atafalla@dnyon.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210830104426.487246-1-atafalla@dnyon.com>
References: <20210830104426.487246-1-atafalla@dnyon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Alejandro Tafalla <atafalla@dnyon.com>
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

Add the reset-gpios as an optional property because some devices might
not need it to work properly.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
---
 Documentation/devicetree/bindings/sound/max9892x.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/max9892x.txt b/Documentation/devicetree/bindings/sound/max9892x.txt
index f6171591ddc6..98cb9ba5b328 100644
--- a/Documentation/devicetree/bindings/sound/max9892x.txt
+++ b/Documentation/devicetree/bindings/sound/max9892x.txt
@@ -30,6 +30,9 @@ Required properties:
 
   - reg : the I2C address of the device for I2C
 
+Optional properties:
+  - reset-gpios : GPIO to reset the device
+
 Example:
 
 codec: max98927@3a {
-- 
2.32.0

