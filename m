Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2CF170445
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 17:24:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C39B1697;
	Wed, 26 Feb 2020 17:23:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C39B1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582734256;
	bh=OEl7YbpV04RHazuekxw2LIaUVT80xHunJDv48jpnAY8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bhew3IrF79feiIA5kV9RKFbkWpFeY0WfF7QOjOqX70/MvdXRJHSLPoKTTVA6Pz7Uj
	 60U2IDAFcGvqjdTT50BImxhVDoNUj4IA8ZRSDDONt/cLN6F693ldIRkezP8GOq8ccy
	 iEqbbMGCHu3bScQbbZYr1QQxmY83FAQ4Po/se3vU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A477F80213;
	Wed, 26 Feb 2020 17:21:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 955BEF8016F; Wed, 26 Feb 2020 17:21:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 659A0F8014D
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 17:21:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 659A0F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Tik595Gh"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01QGLhUY077662;
 Wed, 26 Feb 2020 10:21:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582734103;
 bh=7PBDsbXxj4AX8n3D3XLYg0rJuiB68wdam0M5qbWaRh8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Tik595GhNchxiBpHFQRMneZll48OMlkT78PYfme5fF+OJUZsTlAQeu/JiYz2HQHSF
 Arpaqo9e+mrjSZxLt6rA1GgzcxLy22CMo7RrVBb1RE5AobYeF15ARXhNMcxGsvC0Tv
 umVAfPuQn04p4CIo/bgyZzGQ3v8KZrwF16SjCTuo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01QGLhGa060397
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Feb 2020 10:21:43 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 10:21:42 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 10:21:42 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01QGLgpq068594;
 Wed, 26 Feb 2020 10:21:42 -0600
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [RESEND PATCH for-next 3/3] ASoC: tas2562: Add entries for the
 TAS2563 audio amplifier
Date: Wed, 26 Feb 2020 10:16:28 -0600
Message-ID: <20200226161628.29960-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226161628.29960-1-dmurphy@ti.com>
References: <20200226161628.29960-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
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

The TAS2563 is register compatible with the TAS2562.  The main
difference is the TAS2563 has a programmable DSP to manage different
audio profiles.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tas2562.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index c7a4b3b74654..6b7f7a18da36 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -55,6 +55,11 @@ struct tas2562_data {
 	int volume_lvl;
 };
 
+enum tas256x_model {
+	TAS2562,
+	TAS2563,
+};
+
 static int tas2562_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
@@ -664,13 +669,15 @@ static int tas2562_probe(struct i2c_client *client,
 }
 
 static const struct i2c_device_id tas2562_id[] = {
-	{ "tas2562", 0 },
+	{ "tas2562", TAS2562 },
+	{ "tas2563", TAS2563 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas2562_id);
 
 static const struct of_device_id tas2562_of_match[] = {
 	{ .compatible = "ti,tas2562", },
+	{ .compatible = "ti,tas2563", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tas2562_of_match);
-- 
2.25.0

