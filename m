Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC701F7C57
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 19:15:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59BFE167D;
	Fri, 12 Jun 2020 19:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59BFE167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591982141;
	bh=xinNoyvOiBlPTM9UnCpD5CYEcMSkXhaf/ND6sWXBbr0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A3z0L8RTVHIfJW6r5FqFS+mifu1qqlGLfhPhl7OaVvlTl7uhrgILeQa+WrwS/CIWj
	 78GQ/1rG2QC/bYCXhp33rWiGM1zMq7mHvcRtmP3VQaSvtwfQi3cyXZN5tXPCaaVUEA
	 n//bwbfgUPeM9ABtC0QRA/jihikpdYM9aoyPnCQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87DB9F800CC;
	Fri, 12 Jun 2020 19:14:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A209EF8021E; Fri, 12 Jun 2020 19:13:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3AB5F800CC
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 19:13:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3AB5F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VD1O0gZ9"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05CHDnst022579;
 Fri, 12 Jun 2020 12:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591982029;
 bh=GG9bfFkMnnGI+ZtZozpFxp/t1KnmDeQXwtoe0ZVYcrk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=VD1O0gZ9RR1+8esRq5D7M9dWeTQBn43Cw4GWsCT1oGUwLLSes5hd1rnK/r2gvYgOd
 pQFn/Q4+XPavYghv1mSOdeBt/ExVYVTkCoeNvLBVy5Nz1en9Vn26NnvqaQt0tWu9YX
 R5YmJA09o5zDhjOZq/qe0V362uc5lAoUlBPrs55Q=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05CHDnim081191
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Jun 2020 12:13:49 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 12
 Jun 2020 12:13:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 12 Jun 2020 12:13:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05CHDmIS039818;
 Fri, 12 Jun 2020 12:13:48 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <robh@kernel.org>, <shifu0704@thundersoft.com>
Subject: [PATCH 2/2] ASoC: tas2770: Fix reset gpio property name
Date: Fri, 12 Jun 2020 12:13:42 -0500
Message-ID: <20200612171342.25364-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200612171342.25364-1-dmurphy@ti.com>
References: <20200612171342.25364-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
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

Fix the reset property name when allocating the GPIO descriptor.
The gpiod_get_optional appends either the -gpio or -gpios suffix to the
name.

Fixes: 1a476abc723e6 ("tas2770: add tas2770 smart PA kernel driver")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tas2770.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 54c8135fe43c..cf071121c839 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -758,8 +758,7 @@ static int tas2770_i2c_probe(struct i2c_client *client,
 		}
 	}
 
-	tas2770->reset_gpio = devm_gpiod_get_optional(tas2770->dev,
-							  "reset-gpio",
+	tas2770->reset_gpio = devm_gpiod_get_optional(tas2770->dev, "reset",
 						      GPIOD_OUT_HIGH);
 	if (IS_ERR(tas2770->reset_gpio)) {
 		if (PTR_ERR(tas2770->reset_gpio) == -EPROBE_DEFER) {
-- 
2.26.2

