Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EC327007C
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 17:04:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA22916CE;
	Fri, 18 Sep 2020 17:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA22916CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600441453;
	bh=pI/I8jcGQZ0lf5oj/UxRrM21KmjxZvxRCen2diH/zY4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vAa+hcmflS2slbWt4BVt+dLGnxTzgoFTDoCPuak2cCuYckZvD3cQaWiMrgSzLJr7e
	 pFFu+d0nvucTx69CdZWxzYTnW9pYnv3iIHxqaJYDWh76vJkgsfuJUs30kcvEttEFyR
	 nzDgV0DA0gGo+ipAb3GXFBbj9DfZIc08X8XAkCCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A32FF802DB;
	Fri, 18 Sep 2020 17:01:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B758BF802D2; Fri, 18 Sep 2020 17:01:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B95A2F802BE
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 17:01:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B95A2F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nC2/19jx"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08IF1gaa019692;
 Fri, 18 Sep 2020 10:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600441302;
 bh=MPE85KuowVExpmPMhgX6xawyPMtLr9jJP3e7mW/oIgs=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=nC2/19jxzsvFcN9wPqbQhCxlRycqX8+WEq07p/CoE0y2+/bH1VY50SAV5j9Xx+Btc
 McGdGBxpeZZY3SJ24DmzYzmBHP7GdpogoApSKxay91U0C4gGwdXyhS9saKCwJCo27c
 LIXcDshOgAAk2gjd0WGC+V4Ebu9xwI1onU2DopCY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08IF1g5p065553
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Sep 2020 10:01:42 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Sep 2020 10:01:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Sep 2020 10:01:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IF1gG8086771;
 Fri, 18 Sep 2020 10:01:42 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 2/2] ASoC: tas2562: Add the TAS2564 compatible
Date: Fri, 18 Sep 2020 10:01:30 -0500
Message-ID: <20200918150130.21015-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200918150130.21015-1-dmurphy@ti.com>
References: <20200918150130.21015-1-dmurphy@ti.com>
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

Add the TAS2564 as a supported amplifier.  This amplifier is register,
bitmap and feature compatible to the TAS2562.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tas2562.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 99920c691d28..56d410141ee0 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -58,6 +58,7 @@ struct tas2562_data {
 enum tas256x_model {
 	TAS2562,
 	TAS2563,
+	TAS2564,
 };
 
 static int tas2562_set_bias_level(struct snd_soc_component *component,
@@ -761,6 +762,7 @@ static int tas2562_probe(struct i2c_client *client,
 static const struct i2c_device_id tas2562_id[] = {
 	{ "tas2562", TAS2562 },
 	{ "tas2563", TAS2563 },
+	{ "tas2564", TAS2564 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas2562_id);
@@ -768,6 +770,7 @@ MODULE_DEVICE_TABLE(i2c, tas2562_id);
 static const struct of_device_id tas2562_of_match[] = {
 	{ .compatible = "ti,tas2562", },
 	{ .compatible = "ti,tas2563", },
+	{ .compatible = "ti,tas2564", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tas2562_of_match);
-- 
2.28.0

