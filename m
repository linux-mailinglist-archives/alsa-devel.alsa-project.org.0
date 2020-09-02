Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E4925AC17
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 15:32:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56C3E1861;
	Wed,  2 Sep 2020 15:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56C3E1861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599053520;
	bh=ORYe7avErwu4WFEAorhEscGnFHXvdNg4+jfB80re9o0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XcjhUMf9STlM7xGPWBsbjyrjx1pp9mczDwCrg6iDiY1qGsCDAMPm/KfH23tiGcX6K
	 rwrDDeRQa60JLhox/Mrb8yT5IIIz6E/NzmRr6L+Y/ASDHh85fxP2nVJVPbLjR+MpCk
	 514GoPPuzOezVwxXsrVJux/WoPEzde32vCEUcBwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E96A6F800BA;
	Wed,  2 Sep 2020 15:31:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77E73F8026F; Wed,  2 Sep 2020 15:31:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45060F800BA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 15:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45060F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com
 header.b="TpsnR5Wc"
IronPort-SDR: d0lp3rNJvvGbqLTQHTgs5N75l5D8szcOauSqLAcK2eHMB6yeOrT3QZKzwGvRtyhhgPZKQ4bLHq
 ULNlUd5siJwveh/9eNJIo9GNvSWpPU2RfBr90oP+QEeVrrvgwx5VZdrPVRQaccxIuL9NslTW4Y
 HwSmRvNZRZQRzvU0Ta4/fztT63g+ZdNjdO1cxAMdNzFo6/q1GvbC6Qonoy9jSIYr//q/tJHOX4
 zbMfgebHJ8rwPUcsSKer9TdeTZ/LQtBj4ULSlNNvBci0c6F/tNElWentlIRC9NrjOFVgvsjOPE
 JsU=
X-IronPort-AV: E=Sophos;i="5.76,383,1592863200"; d="scan'208";a="13702688"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 02 Sep 2020 15:30:59 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 02 Sep 2020 15:30:59 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 02 Sep 2020 15:30:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1599053459; x=1630589459;
 h=from:to:cc:subject:date:message-id;
 bh=ORYe7avErwu4WFEAorhEscGnFHXvdNg4+jfB80re9o0=;
 b=TpsnR5WcfjtNwbxceig1HrB0dl9w2sYCHFdhYJrxiQ9nwuzPBIyGjqcs
 k4Ybi6Ev6qBFy33aYuuw6pms4dkW3RyDl/vP27zI7uw9TKRZyyQjX7rgV
 vngYfYVu93WZwNj1n0lQ6jeZk6OlZwGcaTs4pNd3qUKJ9HdGwWIAA4FHH
 ep6M33Yuyt2xnCm/o7bBIlr6YvotY2o1ED7blYUJsrwTZ5hn0lQOaKjFH
 DIEwcfosdjE89hhjqz4wd0XttpIArP/GqBTl0SwnWRpj8qXJPIcSQ5VMl
 reZ08T0l/uAj6HGaRIA3+RS2F7VogJPxHTA1ounRfXVGaLX8wLDjFyeNO g==;
IronPort-SDR: VLEY4cbyc3i8spDisESikz/mri5KDL/ihYpJyEaiioQkDYSXhUSroCWlQ+fz+Bbi2dy2jnz+sx
 MP3srgBnXC6JlbwPyGd6mqBOx0EOcUyFF4uN449l8zyTrFNWjgfxViiXRx8IsCvdWmvK7lJmZx
 IO9YYH0RcbuaEBR7gjWd4OsL9qtBP4Dd0pGFsWZzJAhWsURcFIABCZyXYNbIRSwwW4/SAMR3Yv
 69vuKjbmO/w4ZRYrOMFEFX5PT542Hz3nhUrlxXBcTgDBVLvmhxbKPzmPWhJbTsGQ0aYwNA1P/0
 AEM=
X-IronPort-AV: E=Sophos;i="5.76,383,1592863200"; d="scan'208";a="13702687"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 02 Sep 2020 15:30:59 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id F14ED280065;
 Wed,  2 Sep 2020 15:30:58 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ASoC: codec: tlv320aic32x4: fix missing
 aic32x4_disable_regulators() in error path
Date: Wed,  2 Sep 2020 15:30:42 +0200
Message-Id: <20200902133043.19504-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-kernel@vger.kernel.org
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

The regulators need to be disabled in the aic32x4_register_clocks()
failure case as well.

Fixes: 9d4befff5a95 ("ASoC: codec: tlv3204: Moving GPIO reset and add ADC
reset")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 8dcea566b375..a45fb496082c 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1230,8 +1230,7 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
 			&soc_component_dev_aic32x4, &aic32x4_dai, 1);
 	if (ret) {
 		dev_err(dev, "Failed to register component\n");
-		aic32x4_disable_regulators(aic32x4);
-		return ret;
+		goto err_disable_regulators;
 	}
 
 	if (gpio_is_valid(aic32x4->rstn_gpio)) {
@@ -1242,9 +1241,14 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
 
 	ret = aic32x4_register_clocks(dev, aic32x4->mclk_name);
 	if (ret)
-		return ret;
+		goto err_disable_regulators;
 
 	return 0;
+
+err_disable_regulators:
+	aic32x4_disable_regulators(aic32x4);
+
+	return ret;
 }
 EXPORT_SYMBOL(aic32x4_probe);
 
-- 
2.17.1

